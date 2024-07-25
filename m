Return-Path: <linux-rtc+bounces-1586-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8F93C1BD
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 14:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78311F2652D
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 12:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C0119D099;
	Thu, 25 Jul 2024 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WjEZWket"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2B19D886
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909846; cv=none; b=RYRbO6XpzZgOcEiPWOqyV0icwaTlG6wGrdMacpjwNHciRcJsMZJsYAXEDA6DYCeN1j6ZL1iBoTQQzEyrq6KhDrtCv+ZQmmoN00qi4DXFH1CHpzbti4o9+7awQ6aqPLKUQxjxgKvgnXtKrbqEvsYE7eykNG/2SCnui+kHvlnfcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909846; c=relaxed/simple;
	bh=HVM0mVlaCtLos7f5wbrHV96ayPcblkpUKWT9CLfBrMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONhvcnNUsycKbn1FkeCnASfghcLEvK7Ci9qVsEjlrjkBTcRJ1YcbS9Vb8y0c9LqUYiGYgmQkes23xzvxZk8M0Ke7uLYWLx/sw/K2L07gi9VKpMPaaXQdeOEQsG+BeorVr49XaEkyDeFR1AblAWc+5qa/SiugDd/pEJPjc2a4UhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WjEZWket; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721909844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UGu/KRztNRY0Bp3FrBUk5j7TGUvdGU0FLKSCgJsvw=;
	b=WjEZWketa0yiquvy94lDLg026dn26dZaGXbJFOBtXYzJQiVIx9Wgmvgq2DFHs+trJRPPCh
	b70sWYVIFo98Y07furRnuFanzQiRpyKOdst3T+LHpXYTNrSlEEt062/HWxJWpADjYEyTOq
	bMtYM0pxBNAU4+uktjbtd8mlEf5UmuY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-MjrK0oKTNVqa9HsOfZPQ-A-1; Thu, 25 Jul 2024 08:17:22 -0400
X-MC-Unique: MjrK0oKTNVqa9HsOfZPQ-A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36878581685so494919f8f.2
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 05:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721909841; x=1722514641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3UGu/KRztNRY0Bp3FrBUk5j7TGUvdGU0FLKSCgJsvw=;
        b=w5Qzg21OF119EAULJt/AGFB4Z7C7uxBSILqnI3OPDjj7Z0ezGAsxk7jvnxqVaJeDo2
         g1ogwyUngKzctWDnCnT9gaijbl8ciUL95y3yM2ZcrybfabVgpggG0JLpLrFYAHwmW4JH
         KMZhs9QtGo/O7+65vWJsqSTT1paEJTBDwjxHGYAFCltfXPrHV+0gVAW/OEruzX9BL4QO
         /7i8gRROgdr3R3IUTLo8wNu7IMk57QjqkDqymCuWVAZRH6m026zfUdp9Xzims3lRQ150
         b/WrmKlTM1/oSKl8HlmqYemYnDMpptH/elkyv5ApApM9ltDLyR2KRoqwNhD1xtBaYiyE
         lVZg==
X-Forwarded-Encrypted: i=1; AJvYcCUMuF6akb8fz4bX2W47yWfsAsifKV6hCy1lUVQHqFmKm4XHYU0P12h/FVuvqS3ez5pvOUXoAllowLLbreMS0FYQYFQu/dPdTc6G
X-Gm-Message-State: AOJu0YyrS/O7IKEQPTG7J+Thr0biOFN2y8PY6OgA54i52Ngfq73sSovb
	xjikSL7JbSa2dK3wBjckfujj4EBW/e4mPApHmpOfU/nbIdrE/b6d1cnHEVEJjBMvPrEf5V11L1Y
	qgHVLbHUa9ilTHioDp6UP/EqieKIcSz3hIZHOli7rCs0DoLinEpXIPR1AeQ==
X-Received: by 2002:a05:6000:10c4:b0:367:f281:260e with SMTP id ffacd0b85a97d-36b31ac7126mr1799104f8f.3.1721909841502;
        Thu, 25 Jul 2024 05:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEKfa12+yv+9oCURpazLfKX3NylqFM0NYsmdlmyULxdYJys5id/PrGbgGHwZdmlDCg2IQWng==
X-Received: by 2002:a05:6000:10c4:b0:367:f281:260e with SMTP id ffacd0b85a97d-36b31ac7126mr1799053f8f.3.1721909840718;
        Thu, 25 Jul 2024 05:17:20 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f8:1b05:4ed8:7577:e2b:7ae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36863aa7sm1983920f8f.109.2024.07.25.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 05:17:20 -0700 (PDT)
Date: Thu, 25 Jul 2024 08:17:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Chashper, David" <chashper@amazon.com>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
	"Christopher S . Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
Message-ID: <20240725081502-mutt-send-email-mst@kernel.org>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
 <20240725012730-mutt-send-email-mst@kernel.org>
 <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>

On Thu, Jul 25, 2024 at 10:56:05AM +0100, David Woodhouse wrote:
> > Do you want to just help complete virtio-rtc then? Would be easier than
> > trying to keep two specs in sync.
> 
> The ACPI version is much more lightweight and doesn't take up a
> valuable PCI slot#. (I know, you can do virtio without PCI but that's
> complex in other ways).
> 

Hmm, should we support virtio over ACPI? Just asking.

-- 
MST


