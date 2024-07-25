Return-Path: <linux-rtc+bounces-1581-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EE93C0DB
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 13:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F6EC1C2100A
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 11:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE83199222;
	Thu, 25 Jul 2024 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPvKSvbO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971121990A1
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907124; cv=none; b=IQRHV2uks/gEdvc2GAztfZEar9ss4yTW0i3SG4q2PpadxsrNbvu5H6klSq4Pq5BoYSlmAAtNKHbBZSrnxQYTz/95srEuULmpcTk/sim/Bt1/Y9FHUByXaCnInkZ0QAuxmjSZ3b2EBY9dkFgro8+L7iJKGcXj5M+sV6N7Ta9AE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907124; c=relaxed/simple;
	bh=2PFaAKT/qKzvR5HmQHNT0YtE+EnpJ+3U4z/gAUFLbho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDcbRASZG9olNde9Nc8Y/1qis349wpGvdQOrAFzYdreJDVWHkQhxU9W1p6edGPPBjepk24GZoFGsGt8kvyy5lO7jyFrKLJX0nejSuNQ5VeOHeeKY0uoDE4Tequ6TR86DCrqnITNMqbwqoe1Grb39mzIIn/M+SwQurFMT7KSE6VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPvKSvbO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721907121;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=vyKLgMRT6i9mXd45Il7wt/ZZwWvsdwnv5UBxyQ1yU1Y=;
	b=KPvKSvbOgB8EiJTG6LNh3LEXBiz+GyngOcIiw66TCuvN4HTj+nrWaa88jRR7w0MCHAV8AP
	YJINPh3RtIEWnSf3r/D+SfOg49qMh7ONa3F1EI+K4zeAGQmUal4ku1epFCFXXPcpQ4Sqvr
	T7eaPSyj51Y1wvr1yLhAEM7mxrrLUak=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-Rp-aJfBJPT209rAmpqTPUg-1; Thu,
 25 Jul 2024 07:31:58 -0400
X-MC-Unique: Rp-aJfBJPT209rAmpqTPUg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B4C31955D50;
	Thu, 25 Jul 2024 11:31:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.144])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6C453000197;
	Thu, 25 Jul 2024 11:31:45 +0000 (UTC)
Date: Thu, 25 Jul 2024 12:31:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
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
Message-ID: <ZqI3ntUR6bfY1kxo@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
 <20240725012730-mutt-send-email-mst@kernel.org>
 <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Thu, Jul 25, 2024 at 10:56:05AM +0100, David Woodhouse wrote:
> Hi Michael, thanks for the review!
> 
> On Thu, 2024-07-25 at 01:48 -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 24, 2024 at 06:16:37PM +0100, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > 
> > > The vmclock "device" provides a shared memory region with precision clock
> > > information. By using shared memory, it is safe across Live Migration.
> > > 
> > > Like the KVM PTP clock, this can convert TSC-based cross timestamps into
> > > KVM clock values. Unlike the KVM PTP clock, it does so only when such is
> > > actually helpful.
> > > 
> > > The memory region of the device is also exposed to userspace so it can be
> > > read or memory mapped by application which need reliable notification of
> > > clock disruptions.
> > > 
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > ---
> > > QEMU implementation at
> > > https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmclock
> > > 
> > > Although the ACPI device implemented in QEMU (and some other
> > > hypervisor) stands alone, most of the fields and values herein are
> > > aligned as much as possible with the nascent virtio-rtc specification,
> > > with the intent that a version of the same structure can be
> > > incorporated into that standard.
> > 
> > Do you want to just help complete virtio-rtc then? Would be easier than
> > trying to keep two specs in sync.
> 
> The ACPI version is much more lightweight and doesn't take up a
> valuable PCI slot#. (I know, you can do virtio without PCI but that's
> complex in other ways).

In general it shouldn't have to take up a PCI slot, that's just
a common default policy. virtio-devices only need a dedicated
slot if there's a need to do hotplug/unplug of them. There is a
set of core devices for which hotplug doesn't make sense, which
could all be put as functions in the same slot. ie virtio-rng,
virtio-balloon and virtio-rtc, could all live in one slot.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


