Return-Path: <linux-rtc+bounces-1428-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372F91D1C6
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Jun 2024 15:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7EE281CB8
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Jun 2024 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0802013DBBE;
	Sun, 30 Jun 2024 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifzeGgc1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E01E49F;
	Sun, 30 Jun 2024 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719754146; cv=none; b=TPhjj/Rehe5RxjBbhD9AXOnfcZYDD4WQ5azbiQK1rxOYphx6yYV929kq6xLCCPmM5tXt/t+O+m/z8TV1eRTbPG/F4g9vf2wJrCbA75V5y+I18HmFiFXy6vRUhbkXsuvdJrx6zn4B06l3zaH/sfKXH3O6guAbAjOUweLSIE1jS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719754146; c=relaxed/simple;
	bh=ChFb8w15BttkA8Gd38P/acg2lX8jxg3AeR6dCf7FnUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBvUGr4HB3JJrmeO7qrycIYDKzXD9JjqPomNMxSxkdcpfmRTfn3M7jjo6HdVgi89xAYeO0T20VePjJxLyTdIeRv9w9jJWHqAvpX09hIeVsk5Yc6QL9145JPW6XDSfrG4mV7qzKslHGDpGJnOUOFETZ9qAAfzsV8I55dmwJD1Ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifzeGgc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DADC2BD10;
	Sun, 30 Jun 2024 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719754146;
	bh=ChFb8w15BttkA8Gd38P/acg2lX8jxg3AeR6dCf7FnUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifzeGgc1XPqx+MtSb9wIhYQKdSYS+/J+fwqGorROaN67YFRM/STdky6UuWpNhVyLw
	 z8GC43AJg4Im2K/Ryq0gJG2Pyu32+fx49gEeQnQRCPPCWA+7b0HvR367HICrhYrdbu
	 hs2MwLJhopRfIyNColSNZ5x5W1OjkUQ1Kzxc7XD5/14Z1Bgi3tUB18SX48HBLS6TrN
	 tuyw5sk9l5P13hiWKilWIwQekNuQJ8c0tGUD3VF5ajg94CmRe1EU6qjYYdAROTsarG
	 695L5QuZsPICkubKeh5Wl45ajosLI9iRdkXL1Keg2/r5NegBHWHpJZfAOpj/ue7OxN
	 QulWDHuDUXqoA==
Date: Sun, 30 Jun 2024 14:28:59 +0100
From: Simon Horman <horms@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Christopher S. Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
Message-ID: <20240630132859.GC17134@kernel.org>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>

+ Kees Cook, linux-hardening

On Tue, Jun 25, 2024 at 08:01:56PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock "device" provides a shared memory region with precision clock
> information. By using shared memory, it is safe across Live Migration.
> 
> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
> actually helpful.
> 
> The memory region of the device is also exposed to userspace so it can be
> read or memory mapped by application which need reliable notification of
> clock disruptions.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

...

> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c

...

> +static int vmclock_probe(struct platform_device *pdev)
> +{

...

> +	/* If there is valid clock information, register a PTP clock */
> +	if (st->cs_id) {
> +		st->ptp_clock_info = ptp_vmclock_info;
> +		strncpy(st->ptp_clock_info.name, st->name, sizeof(st->ptp_clock_info.name));

Hi David,

W=1 allmodconfig builds with gcc-13 flag the following.
Reading the documentation of strncpy() in fortify-string.h,
I wonder if strscpy() would be more appropriate in this case.

In file included from ./include/linux/string.h:374,
                 from ./include/linux/bitmap.h:13,
                 from ./include/linux/cpumask.h:13,
                 from ./arch/x86/include/asm/paravirt.h:21,
                 from ./arch/x86/include/asm/cpuid.h:62,
                 from ./arch/x86/include/asm/processor.h:19,
                 from ./include/linux/sched.h:13,
                 from ./include/linux/ratelimit.h:6,
                 from ./include/linux/dev_printk.h:16,
                 from ./include/linux/device.h:15,
                 from drivers/ptp/ptp_vmclock.c:8:
In function 'strncpy',
    inlined from 'vmclock_probe' at drivers/ptp/ptp_vmclock.c:480:3:
./include/linux/fortify-string.h:125:33: warning: '__builtin_strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
  125 | #define __underlying_strncpy    __builtin_strncpy
      |                                 ^
./include/linux/fortify-string.h:205:16: note: in expansion of macro '__underlying_strncpy'
  205 |         return __underlying_strncpy(p, q, size);

...

