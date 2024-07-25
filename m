Return-Path: <linux-rtc+bounces-1588-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5F93C211
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 14:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0A9BB2252C
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 12:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8877F199E9B;
	Thu, 25 Jul 2024 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iY2hGiJM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0911993A7
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910582; cv=none; b=olwnV3LCsbABW8qs6qptliNJMUa503fX73PqgZPKl2m319kSI1hIuv0T5/ktkcQtW0EiSTEj3DlTBWuyXYvvad4L/bOnw7W6at0/fZWpddgU3dsD2NzDfiWj6U3XmfictjjxgXRcAK9xblaQYlUtK8eA4OIR9UxNlMRlCJ+lmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910582; c=relaxed/simple;
	bh=1x+MRrK/gKvb0AP5m2fDvNNFyowu/Kb6wBFKgceGBH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo/Mb4C4OGlNKSoRBthpZuxKMXo3urf4ZbJnlbMaxDAmjHtHKLc23quGeZ9C9OlYg19myLF3lLECdLfoekp2xKds9TP0H52vTqZXQLsPo8LelNpwJyHq4TezlfqG/xoYXCKvhfPSzWiROZFCP1DAC7qx6O7YWSRiLJOSqvXjKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iY2hGiJM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721910580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GmqP7A+JPqJziazr6AG6F2fPGPMKo7eb6D/y7TyUksU=;
	b=iY2hGiJMegGYi1tgITFilEuNCyQ9dadErA8+BSvpOJsV4n5IM/1X9ioSO1HFszmeoe+FsP
	+4t5sH32FNf+7H7arjaj19g8xoEX9IOC/VDOUfnUdVKggRGtKHOZ6XUJXGwpNn9aVsocRL
	OzI36+BnpUeWf7tq1e9oY/7SxSTguP0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-WP9GTj_LNZGV1LRf5AyYRg-1; Thu, 25 Jul 2024 08:29:39 -0400
X-MC-Unique: WP9GTj_LNZGV1LRf5AyYRg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a2ceb035f9so1311250a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 05:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721910577; x=1722515377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmqP7A+JPqJziazr6AG6F2fPGPMKo7eb6D/y7TyUksU=;
        b=MvFmp6Ay1ys98OZ0cnF6q8AkmsLePdu+QkyKbIAcFZD/RqqOAVlWPC3GzYAfdY0nk+
         JI0HegF2p/nNfd1Fqb3vC9LaxJm906UJ4fsy3W4zz/L2AFFTsVD9nJfcuQTTpAVXyj68
         G8Qj5hKVEQwdoUt7C+dp1SRWUHbfHZtRPQZs8R+GRGxkCS80UA2y4jKaYvbeBzqfdRWL
         CLcI6+TCXsNlw9zq7QAe7dEa+KuGW90jDDc/CFt9B7sINZNVIVmAeww6o/+9F2Y1Nd4U
         ntCBFobi3IXoYFHNcyAo0TGmLz7+KFOa8/fAVHm4K4tsz1i9oTd8T9OYNC3I6qM1y8i9
         maRA==
X-Forwarded-Encrypted: i=1; AJvYcCUJoh/sk9tEk9Khi/Y3xGG7CKKw2R/xpsWmdtTG2ivVao+PFel4a5Ns7anqtaNoOTkFelwpCdSpqOlnIGij7LY7Ot4RA3JW9Woq
X-Gm-Message-State: AOJu0YwWMB4CNNtUyLO0CRlZGoh7lCNlR9raHJpmjrCludWz9JK044DT
	mifIP8uEPDQQX7j3pwYPPEUJsghADbWZJfTUl5XKJT4mWO9vdidGmQO4F7HNHdajklzNnVYUQji
	8AXXT9rdnRHGqYxmrjkUnmODQRR6lpSlAII4f2iBC+hPneP5NVVPVRmsKHQ==
X-Received: by 2002:a50:baa3:0:b0:58c:10fd:5082 with SMTP id 4fb4d7f45d1cf-5ab1a7af0f3mr5616861a12.10.1721910577479;
        Thu, 25 Jul 2024 05:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESzTf1Dq4jXq+lb4GZ/ln7u62lD42/qJf2maAOGtbm2TYn0twTp0kEGmFg6gBHrHiC+FsesQ==
X-Received: by 2002:a50:baa3:0:b0:58c:10fd:5082 with SMTP id 4fb4d7f45d1cf-5ab1a7af0f3mr5616818a12.10.1721910576749;
        Thu, 25 Jul 2024 05:29:36 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:81aa:776c:8849:e578:516a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb3becsm768874a12.74.2024.07.25.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 05:29:36 -0700 (PDT)
Date: Thu, 25 Jul 2024 08:29:31 -0400
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
Message-ID: <20240725082828-mutt-send-email-mst@kernel.org>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
 <20240725012730-mutt-send-email-mst@kernel.org>
 <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>
 <20240725081502-mutt-send-email-mst@kernel.org>
 <f55e6dfc4242d69eed465f26d6ad7719193309dc.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55e6dfc4242d69eed465f26d6ad7719193309dc.camel@infradead.org>

On Thu, Jul 25, 2024 at 01:27:49PM +0100, David Woodhouse wrote:
> On Thu, 2024-07-25 at 08:17 -0400, Michael S. Tsirkin wrote:
> > On Thu, Jul 25, 2024 at 10:56:05AM +0100, David Woodhouse wrote:
> > > > Do you want to just help complete virtio-rtc then? Would be easier than
> > > > trying to keep two specs in sync.
> > > 
> > > The ACPI version is much more lightweight and doesn't take up a
> > > valuable PCI slot#. (I know, you can do virtio without PCI but that's
> > > complex in other ways).
> > > 
> > 
> > Hmm, should we support virtio over ACPI? Just asking.
> 
> Given that we support virtio DT bindings, and the ACPI "PRP0001" device
> exists with a DSM method which literally returns DT properties,
> including such properties as "compatible=virtio,mmio" ... do we
> already?
> 
> 

In a sense, but you are saying that is too complex?
Can you elaborate?

-- 
MST


