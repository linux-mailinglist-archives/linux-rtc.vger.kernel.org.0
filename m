Return-Path: <linux-rtc+bounces-2104-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B4993295
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 18:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0528A28159B
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 16:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9221DA2EC;
	Mon,  7 Oct 2024 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMj72NGq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0411D9661;
	Mon,  7 Oct 2024 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317376; cv=none; b=Y1FiC8DzN5K+RWIch5NDvcqxpbI3ua5KEgWoQFgJZh1ZuysyX9ZeQbeulnMhBQZns4F616AKC5bHhJZ2joQZeyhCwDJ277PxYCVGvPfJdcRdruOPq2HVMhLTe6LvaXR2hw3N/LVjqmlBuOno1blRXrdb7WBV0Uj3c3G7QvOUrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317376; c=relaxed/simple;
	bh=3mb7yUzPJBdZPVqbA7eNyAp58cTHLMDgCs9vohGGY2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZwPQVXiO+ijvKI6atg/iQ6FwLNkoRH61SUA6RaHvSE8jQxNHnbUJDR16HlIvsqJCNdnAaSWPADCDKWwaCbpjZDvWuxegmr66GvQQfQJAcJyRFX9xYwc4lHaz3I2e1jNuGrVcNbo9OK0PKQAAtlTXtZygXjvob2/dK/soCsCygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMj72NGq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208cf673b8dso50778625ad.3;
        Mon, 07 Oct 2024 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728317374; x=1728922174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbnVqVnf/+P0rl51L6+didESx8C92ZvLSqC1mWtGnLk=;
        b=CMj72NGqYqfkyQfhdvURnPJew/ZCH5/I2t+Ui4ruXR+LhsXJLYZzvSShSFqqa3kzfl
         ZgWFCWRNDSHHgn4SvU0KRTdkd0gWEs7usLZlR6YnQFyKkXZ3F0vxl5tQr/jh7CAkwc7y
         bpS2xm9+oaiv2mOX7IoXmAW+9ORsP+Ob68ii47OpdhNPtMxwGteNiwZba7zMUIch2r67
         s3gd8v3eGyJ4bs1sUSZCA0vfQ6BYAfDFy2pJL8mxCVRNJsKchrwoIB24kJuKaKg640iU
         m1T5mbaat07aJOGdFTyg95zQHcc9NFUu5tX4RzSzNr6a8w665W+ewtd3J8yGZPhGOsG8
         ZIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728317374; x=1728922174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbnVqVnf/+P0rl51L6+didESx8C92ZvLSqC1mWtGnLk=;
        b=mfbXXEjLzdWwmfnMkh0Vf7hxcWAbLak6ijQf1x7c5QHsyyTLSjweAU4Biadvd142lw
         astExW9GFAVGnqgbZmMb0RFV3L3foLRzVCVQ5kOHZVUpKGXTpahBOljoJ4MWRQePxhyy
         UdoZfzKjfqCNkI/FJLUwmkny4iwkkxqCNjeBapRrPfQcsUZegHj5nMaSNgIv2PJA2wWZ
         0HQiDUGjzfz7z2UFHTAYeuitV8ngpbR9xjSlJc/Ll3w4fdeQpqO+RHTu4HWWj+aYTbCt
         LBt+IM2bJ+6yJlo/WIvr8V7DuNV/rVTMdsxjvuNH6QciqVbyfEgtZpx1iBQs7NBTsHm0
         V5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUuA15lCZdDHVxWoHSR0lo0c0T9DLbw26R7OhuknNgE9MlgKKL7WlKQr8f3SU983sR9wSJLyGU+TpAHqGM=@vger.kernel.org, AJvYcCV+FYe/cwsoevoS87otA5WAgN1BVysj0xy/g/Ql007UoKVib+2n0ziYK/TBW6ts6QM6Bz4zXq3C@vger.kernel.org, AJvYcCXTY+lbFFmYCf0JmZsG8FJ+/UGrUBWjtsLAlHVzrHFNWk+TKNIxcBkn0ZliHPk1p3YSukQ3Ji5eVrJm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QEGbZZK+p1rCNWP2tJCly9sqX3fpULqK+PGgngB0xTYt6IMP
	KoCh6dM6MzVJUcJWE7tWeSF1CN/huy5WAUCtZG23FiNNC0RJo0w+
X-Google-Smtp-Source: AGHT+IGRJ8PDY2uvOdrScF+lvW+ErLKYmvUUU9Ley7KXKt2lpYDNWDc7FzwaUgY9vidSx6egFuHhvA==
X-Received: by 2002:a17:903:2445:b0:20b:ab4b:544a with SMTP id d9443c01a7336-20bfe49471amr194072435ad.43.1728317373996;
        Mon, 07 Oct 2024 09:09:33 -0700 (PDT)
Received: from hoboy.vegasvil.org ([198.59.164.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13988d0bsm41141785ad.262.2024.10.07.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:09:33 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:09:24 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Chashper, David" <chashper@amazon.com>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"Christopher S . Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
Message-ID: <ZwQHtD5lVNuc4aAf@hoboy.vegasvil.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>

On Sun, Oct 06, 2024 at 08:17:58AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock device addresses the problem of live migration with
> precision clocks. The tolerances of a hardware counter (e.g. TSC) are
> typically around ±50PPM. A guest will use NTP/PTP/PPS to discipline that
> counter against an external source of 'real' time, and track the precise
> frequency of the counter as it changes with environmental conditions.
> 
> When a guest is live migrated, anything it knows about the frequency of
> the underlying counter becomes invalid. It may move from a host where
> the counter running at -50PPM of its nominal frequency, to a host where
> it runs at +50PPM. There will also be a step change in the value of the
> counter, as the correctness of its absolute value at migration is
> limited by the accuracy of the source and destination host's time
> synchronization.
> 
> In its simplest form, the device merely advertises a 'disruption_marker'
> which indicates that the guest should throw away any NTP synchronization
> it thinks it has, and start again.
> 
> Because the shared memory region can be exposed all the way to userspace
> through the /dev/vmclock0 node, applications can still use time from a
> fast vDSO 'system call', and check the disruption marker to be sure that
> their timestamp is indeed truthful.
> 
> The structure also allows for the precise time, as known by the host, to
> be exposed directly to guests so that they don't have to wait for NTP to
> resync from scratch. The PTP driver consumes this information if present.
> Like the KVM PTP clock, this PTP driver can convert TSC-based cross
> timestamps into KVM clock values. Unlike the KVM PTP clock, it does so
> only when such is actually helpful.
> 
> The values and fields are based on the nascent virtio-rtc specification,
> and the intent is that a version (hopefully precisely this version) of
> this structure will be included as an optional part of that spec. In the
> meantime, this driver supports the simple ACPI form of the device which
> is being shipped in certain commercial hypervisors (and submitted for
> inclusion in QEMU).
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Richard Cochran <richardcochran@gmail.com>

