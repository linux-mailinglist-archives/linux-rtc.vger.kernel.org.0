Return-Path: <linux-rtc+bounces-1602-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5693CD71
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 07:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AE761C21AF2
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 05:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6433816;
	Fri, 26 Jul 2024 05:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKEukUIv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522602B9B6
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721970569; cv=none; b=mu4VV70dX8KCoNpNtyYXxqch31nJSO6EnqUx/FprEvprIJymCSFpzHlM3lRzylmpDzaTUiYwDZ+YyNJXiHaJawago/UhsmKR5vRNHVvq2ycKw3Pv6QOTNR+Wh8ItgPjvcj05vUqyDK3lfV20wENlmb2hWWGkVE1toYu8epq4X3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721970569; c=relaxed/simple;
	bh=mwBiyQNVoMNybA5O6D7Gx2PdVoETiCkHnYn15H6Goyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBXT44s37Cw0sQFbdvc1qgpbDiwhCKRzlarCSx1dgfbZSP4YWaOpT+mYDTPUCzlAj3Ogv2x2LwGwUytr9B5SMqePAn1d306RTTWouc5FPiJgCYk0TRi1OKEnAMWJJKj/kpVwhaLdzF67+Yv8euWYbUNyh+c+3xEFHkpV00QIFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKEukUIv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721970567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbuOgyAkRILEBrf9MJ+4blSFephMiZi+pxSKWGG3nSg=;
	b=SKEukUIvZoZ7MUftFPfDHc4zyve7FilFebcoMyg4Miqpyiq+bBQx2t5GGd73+z/AdkXcPO
	wdPyCqBQ8vi8/mKPIllf+P4uCKhdHNDvktIeNS0Wwi6YeRify4GfyQjvmyjvCuzReh08Ut
	5S+c3Xvdk9LxJj6AjN+w2eltJ8mErlc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-Eys2pkx4PsmBDtI3TY1XLg-1; Fri, 26 Jul 2024 01:09:25 -0400
X-MC-Unique: Eys2pkx4PsmBDtI3TY1XLg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4280cf2be19so1884645e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 22:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721970564; x=1722575364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbuOgyAkRILEBrf9MJ+4blSFephMiZi+pxSKWGG3nSg=;
        b=K8iNmo6SBaFJCgk7g0++VJJQwQxx6YrOKkmHaG7pJYn0pDW9uxXguY6dYIEWqqlkPk
         wrIkZjuTp6xDEDn/LKueyd2L3ODjPak+Am/tzGiSEMUirBGnSzegDTpozZgWP4Rh5A0I
         yMYEHbjAtk/JNtvJTdoJ15KhOSBisthMWmAbmwnjE0FX5LdeEFZ9PMLDRRLoDv7OtoCN
         Yfo9tivY0terlvWmo5LY7/ZVYkzSPcoj2cVnyUlcFGarggQSjgVqELRf4+5Mye09p3J6
         529ZvqDMcqN15ZYov76H8DGsfiu6optJzhnKhWncEXWjVWNIrXD9VeMqD96I2sPwV1WZ
         1HKg==
X-Forwarded-Encrypted: i=1; AJvYcCWqHCvAEuRbRNvkoSSO9qTRWQsNVddhQ1ZSWIufB/+El2p4L3agzwBMzbO9Cm4aigLzkE/O4o3/LIHGEMixH0KWMKDShcXPxtoT
X-Gm-Message-State: AOJu0Yy9KQEPKKb68rK0dGnhLL99QJBCPiM5YskbnHQwcRWOIuok/a3v
	sV+bcz57ZdIY51Ct9pBz7DEaNa5oyvFVjJTVMIh1rqY5+LyS967BeUKvS8z8j8GvM2aeVOexCo5
	t2QIeklD0BUl1fwG3PXJd1hLNOS65HOam2IfdYh804LX76rmtwG7m1RkUug==
X-Received: by 2002:a05:600c:1c1f:b0:426:6153:5318 with SMTP id 5b1f17b1804b1-4280570fe50mr29400665e9.19.1721970564586;
        Thu, 25 Jul 2024 22:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLGThAmioKqXVYW1bGCeFOTJCJYjUraPBu1ns0STXkcb4YEMtbOBAAif1jc1w6fYVZOAbSOQ==
X-Received: by 2002:a05:600c:1c1f:b0:426:6153:5318 with SMTP id 5b1f17b1804b1-4280570fe50mr29400405e9.19.1721970563829;
        Thu, 25 Jul 2024 22:09:23 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:28ce:f21a:7e1e:6a9:f708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e6871sm105269105e9.30.2024.07.25.22.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 22:09:23 -0700 (PDT)
Date: Fri, 26 Jul 2024 01:09:13 -0400
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
Message-ID: <20240726010511-mutt-send-email-mst@kernel.org>
References: <20240725083215-mutt-send-email-mst@kernel.org>
 <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org>
 <20240725100351-mutt-send-email-mst@kernel.org>
 <2a27205bfc61e19355d360f428a98e2338ff68c3.camel@infradead.org>
 <20240725122603-mutt-send-email-mst@kernel.org>
 <0959390cad71b451dc19e5f9396d3f4fdb8fd46f.camel@infradead.org>
 <20240725163843-mutt-send-email-mst@kernel.org>
 <d62925d94a28b4f8e07d14c1639023f3b78b0769.camel@infradead.org>
 <20240725170328-mutt-send-email-mst@kernel.org>
 <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>

On Thu, Jul 25, 2024 at 10:29:18PM +0100, David Woodhouse wrote:
> > > > Then can't we fix it by interrupting all CPUs right after LM?
> > > > 
> > > > To me that seems like a cleaner approach - we then compartmentalize
> > > > the ABI issue - kernel has its own ABI against userspace,
> > > > devices have their own ABI against kernel.
> > > > It'd mean we need a way to detect that interrupt was sent,
> > > > maybe yet another counter inside that structure.
> > > > 
> > > > WDYT?
> > > > 
> > > > By the way the same idea would work for snapshots -
> > > > some people wanted to expose that info to userspace, too.
> 
> Those people included me. I wanted to interrupt all the vCPUs, even the
> ones which were in userspace at the moment of migration, and have the
> kernel deal with passing it on to userspace via a different ABI.
> 
> It ends up being complex and intricate, and requiring a lot of new
> kernel and userspace support. I gave up on it in the end for snapshots,
> and didn't go there again for this.

Maybe become you insist on using ACPI?
I see a fairly simple way to do it. For example, with virtio:

one vq per CPU, with a single outstanding buffer,
callback copies from the buffer into the userspace
visible memory.

Want me to show you the code?

-- 
MST


