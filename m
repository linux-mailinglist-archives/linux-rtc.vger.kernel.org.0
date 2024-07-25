Return-Path: <linux-rtc+bounces-1575-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 856F293BC2B
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 07:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198481F220A8
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 05:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18575208DA;
	Thu, 25 Jul 2024 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQWqfgre"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3851D530
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721886549; cv=none; b=BJEZuXSn630lzRB2HAYzz1qOtQFKZzpOb/Ba5MwDrV/WgLrbnS1nAIGL+MuIHsWSliRf078bOewCH0VdtG35LikZ/IilgZU6d1hRJFdky0X+m2dj/f+5Wgav8uWoJNF7axKBxuaPCr8nT3r8VrpFwag62Z7jiTL7RAFw2nrh6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721886549; c=relaxed/simple;
	bh=PKs/7bLZ/fYJ+KnmeqxuqXj1idTbN+H6RQpdyGnF25s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHFBmnXrEZqjlyU93a1kNGeM0Unpjt1BOH6G2Zbat2wPP7c6GaIB1gXgyfmFJkbYdMqHorT2FiLTI1rSVVquiOnBmc6V4qxebcaHePMUxHAhHW8st6dTIDRZZ+FN1thcBkh8Q1bXwGWWzA1THCk8Boh1ZhmEIMNLNagedafU5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQWqfgre; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721886545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ymSMdffiC4CcxT706ptkCR4j7dgSuKdNCQUyb/b/bM=;
	b=KQWqfgreZCWWgl1Djw0t630SS+hsMo2tXX8dSbESM0JljjZVDtS4gOOAVzTnP4ZfhQygCX
	BcJ9TlqE8brBJX21xb0glYIHBdDWi2Gy+XxtgWA01Cje2zC4625RlPJx5yphM4LT/tvr8p
	0+h9pqaw3QUCXn3Ojs6lw9PqR+rxvdE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-vChGzMavMMSRNuOjpBLDXg-1; Thu, 25 Jul 2024 01:49:00 -0400
X-MC-Unique: vChGzMavMMSRNuOjpBLDXg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3685a5a765fso308651f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 24 Jul 2024 22:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721886539; x=1722491339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ymSMdffiC4CcxT706ptkCR4j7dgSuKdNCQUyb/b/bM=;
        b=OzaAxyePpnOt2liaD0vroTh13Fz63AQmGTdqnAiMBU47gqq/75KMcdlHftmmiGKWpp
         MhBeTvASjTWonoJV3I0lzAs6Fm6J3pnzE6Y7G5MpEX3oTFG+W7o0OzBVOHs14UII6xw5
         dd5ecKOimiiCYeRPWhaWXWXPtoJSpF1ATWNcRp4/K8Xc1X6rg0uX94fs9nEk5uqXPaH7
         c6Nm+p5YSGgxRPeXPfly6loXptGM7CTvtDaKRLq2L6E7qlqzipzYNP0X1lFXrUvNNZxw
         aYVTy8HUpEYRH4v7utcLbpkDzgKqSMLGa5Okg477HD2KYkHwqD5ykgvuCMJAWgsNaWuD
         2v+w==
X-Forwarded-Encrypted: i=1; AJvYcCWHqVGBGa7WJllv38u6NI4OJHNMpg7Kilf6w/Y3FovOwRjFgkVgyis7jsG2bA0BTL8PuA+rKRhEPhbIP7FfdNAy5cr7umBskQ6e
X-Gm-Message-State: AOJu0YyH9AiyFUP34ceZrU42vSza1aKZ7FwThttJ3Xp6SlR9o3hEmdM0
	2GFB9UMFOmcGAOsCBj5LumMBibWzXKMQDv7WeXp5fYwG+jAFeS3dw7iZDYMEZFdjAiCccfdpgsa
	7ybE7W0yJaKAWrycSXFFaJhcuNmZZCHWZvyuRjfvHAWrF0OnyYDYAyweabA==
X-Received: by 2002:a05:6000:e0b:b0:368:4bc0:9211 with SMTP id ffacd0b85a97d-36b319df352mr1240657f8f.17.1721886539277;
        Wed, 24 Jul 2024 22:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK2kjPYzBg49GU/QUMAwONmw949vLD9Ox1YuTRfkdiHL/owRgxU8sRWIVbb4eztqPsapn74g==
X-Received: by 2002:a05:6000:e0b:b0:368:4bc0:9211 with SMTP id ffacd0b85a97d-36b319df352mr1240625f8f.17.1721886538345;
        Wed, 24 Jul 2024 22:48:58 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ed:8427:35e3:731c:3106:ee46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0338sm909702f8f.1.2024.07.24.22.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 22:48:57 -0700 (PDT)
Date: Thu, 25 Jul 2024 01:48:46 -0400
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
Message-ID: <20240725012730-mutt-send-email-mst@kernel.org>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>

On Wed, Jul 24, 2024 at 06:16:37PM +0100, David Woodhouse wrote:
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
> ---
> QEMU implementation at
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmclock
> 
> Although the ACPI device implemented in QEMU (and some other
> hypervisor) stands alone, most of the fields and values herein are
> aligned as much as possible with the nascent virtio-rtc specification,
> with the intent that a version of the same structure can be
> incorporated into that standard.

Do you want to just help complete virtio-rtc then? Would be easier than
trying to keep two specs in sync.


> v1:
>  • Change absolute error fields to nanoseconds
>  • Update leap second definition to match virtio-rtc intentions in 
>     https://lore.kernel.org/all/85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com
> 
> RFC v4:
>  • Add esterror fields, MONOTONIC flag.
>  • Reduce seq_count to 32 bits
>  • Expand size to permit 64KiB pages
>  • Align with virtio-rtc fields, values and leap handling
>  • Drop gettime() method (since we have gettimex())
>  • Add leap second smearing hint
>  • Use a real _CRS on the ACPI device
> 
> RFC v3: (wrong patch sent)
> 
> RFC v2:
>  • Add gettimex64() support
>  • Convert TSC values to KVM clock when appropriate
>  • Require int128 support
>  • Add counter_period_shift
>  • Add timeout when seq_count is invalid
>  • Add flags field
>  • Better comments in vmclock ABI structure
>  • Explicitly forbid smearing (as clock rates would need to change)
> 
> 
>  drivers/ptp/Kconfig              |  13 +
>  drivers/ptp/Makefile             |   1 +
>  drivers/ptp/ptp_vmclock.c        | 567 +++++++++++++++++++++++++++++++
>  include/uapi/linux/vmclock-abi.h | 187 ++++++++++
>  4 files changed, 768 insertions(+)
>  create mode 100644 drivers/ptp/ptp_vmclock.c
>  create mode 100644 include/uapi/linux/vmclock-abi.h
> 
> diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
> index 604541dcb320..e98c9767e0ef 100644
> --- a/drivers/ptp/Kconfig
> +++ b/drivers/ptp/Kconfig
> @@ -131,6 +131,19 @@ config PTP_1588_CLOCK_KVM
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called ptp_kvm.
>  
> +config PTP_1588_CLOCK_VMCLOCK
> +	tristate "Virtual machine PTP clock"
> +	depends on X86_TSC || ARM_ARCH_TIMER
> +	depends on PTP_1588_CLOCK && ACPI && ARCH_SUPPORTS_INT128
> +	default y
> +	help
> +	  This driver adds support for using a virtual precision clock
> +	  advertised by the hypervisor. This clock is only useful in virtual
> +	  machines where such a device is present.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called ptp_vmclock.
> +
>  config PTP_1588_CLOCK_IDT82P33
>  	tristate "IDT 82P33xxx PTP clock"
>  	depends on PTP_1588_CLOCK && I2C
> diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
> index 68bf02078053..01b5cd91eb61 100644
> --- a/drivers/ptp/Makefile
> +++ b/drivers/ptp/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_PTP_1588_CLOCK_DTE)	+= ptp_dte.o
>  obj-$(CONFIG_PTP_1588_CLOCK_INES)	+= ptp_ines.o
>  obj-$(CONFIG_PTP_1588_CLOCK_PCH)	+= ptp_pch.o
>  obj-$(CONFIG_PTP_1588_CLOCK_KVM)	+= ptp_kvm.o
> +obj-$(CONFIG_PTP_1588_CLOCK_VMCLOCK)	+= ptp_vmclock.o
>  obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+= ptp-qoriq.o
>  ptp-qoriq-y				+= ptp_qoriq.o
>  ptp-qoriq-$(CONFIG_DEBUG_FS)		+= ptp_qoriq_debugfs.o
> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> new file mode 100644
> index 000000000000..9c508c21c062
> --- /dev/null
> +++ b/drivers/ptp/ptp_vmclock.c
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtual PTP 1588 clock for use with LM-safe VMclock device.
> + *
> + * Copyright © 2024 Amazon.com, Inc. or its affiliates.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <uapi/linux/vmclock-abi.h>
> +
> +#include <linux/ptp_clock_kernel.h>
> +
> +#ifdef CONFIG_X86
> +#include <asm/pvclock.h>
> +#include <asm/kvmclock.h>
> +#endif
> +
> +#ifdef CONFIG_KVM_GUEST
> +#define SUPPORT_KVMCLOCK
> +#endif
> +
> +static DEFINE_IDA(vmclock_ida);
> +
> +ACPI_MODULE_NAME("vmclock");
> +
> +struct vmclock_state {
> +	struct resource res;
> +	struct vmclock_abi *clk;
> +	struct miscdevice miscdev;
> +	struct ptp_clock_info ptp_clock_info;
> +	struct ptp_clock *ptp_clock;
> +	enum clocksource_ids cs_id, sys_cs_id;
> +	int index;
> +	char *name;
> +};
> +
> +#define VMCLOCK_MAX_WAIT ms_to_ktime(100)
> +
> +/*
> + * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
> + * and add the fractional second part of the reference time.
> + *
> + * The result is a 128-bit value, the top 64 bits of which are seconds, and
> + * the low 64 bits are (seconds >> 64).
> + *
> + * If __int128 isn't available, perform the calculation 32 bits at a time to
> + * avoid overflow.
> + */
> +static inline uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
> +					       uint64_t period, uint8_t shift,
> +					       uint64_t frac_sec)
> +{
> +	unsigned __int128 res = (unsigned __int128)delta * period;
> +
> +	res >>= shift;
> +	res += frac_sec;
> +	*res_hi = res >> 64;
> +	return (uint64_t)res;
> +}
> +
> +static inline bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
> +{
> +	if (likely(clk->time_type == VMCLOCK_TIME_UTC))
> +		return true;
> +
> +	if (clk->time_type == VMCLOCK_TIME_TAI &&
> +	    (clk->flags & VMCLOCK_FLAG_TAI_OFFSET_VALID)) {
> +		if (sec)
> +			*sec += clk->tai_offset_sec;
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static int vmclock_get_crosststamp(struct vmclock_state *st,
> +				   struct ptp_system_timestamp *sts,
> +				   struct system_counterval_t *system_counter,
> +				   struct timespec64 *tspec)
> +{
> +	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
> +	struct system_time_snapshot systime_snapshot;
> +	uint64_t cycle, delta, seq, frac_sec;
> +
> +#ifdef CONFIG_X86
> +	/*
> +	 * We'd expect the hypervisor to know this and to report the clock
> +	 * status as VMCLOCK_STATUS_UNRELIABLE. But be paranoid.
> +	 */
> +	if (check_tsc_unstable())
> +		return -EINVAL;
> +#endif
> +
> +	while (1) {
> +		seq = st->clk->seq_count & ~1ULL;
> +		virt_rmb();
> +
> +		if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE)
> +			return -EINVAL;
> +
> +		/*
> +		 * When invoked for gettimex64(), fill in the pre/post system
> +		 * times. The simple case is when system time is based on the
> +		 * same counter as st->cs_id, in which case all three times
> +		 * will be derived from the *same* counter value.
> +		 *
> +		 * If the system isn't using the same counter, then the value
> +		 * from ktime_get_snapshot() will still be used as pre_ts, and
> +		 * ptp_read_system_postts() is called to populate postts after
> +		 * calling get_cycles().
> +		 *
> +		 * The conversion to timespec64 happens further down, outside
> +		 * the seq_count loop.
> +		 */
> +		if (sts) {
> +			ktime_get_snapshot(&systime_snapshot);
> +			if (systime_snapshot.cs_id == st->cs_id) {
> +				cycle = systime_snapshot.cycles;
> +			} else {
> +				cycle = get_cycles();
> +				ptp_read_system_postts(sts);
> +			}
> +		} else
> +			cycle = get_cycles();
> +
> +		delta = cycle - st->clk->counter_value;
> +
> +		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
> +						   st->clk->counter_period_frac_sec,
> +						   st->clk->counter_period_shift,
> +						   st->clk->time_frac_sec);
> +		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
> +		tspec->tv_sec += st->clk->time_sec;
> +
> +		if (!tai_adjust(st->clk, &tspec->tv_sec))
> +			return -EINVAL;
> +
> +		virt_rmb();
> +		if (seq == st->clk->seq_count)
> +			break;
> +
> +		if (ktime_after(ktime_get(), deadline))
> +			return -ETIMEDOUT;
> +	}
> +
> +	if (system_counter) {
> +		system_counter->cycles = cycle;
> +		system_counter->cs_id = st->cs_id;
> +	}
> +
> +	if (sts) {
> +		sts->pre_ts = ktime_to_timespec64(systime_snapshot.real);
> +		if (systime_snapshot.cs_id == st->cs_id)
> +			sts->post_ts = sts->pre_ts;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef SUPPORT_KVMCLOCK
> +/*
> + * In the case where the system is using the KVM clock for timekeeping, convert
> + * the TSC value into a KVM clock time in order to return a paired reading that
> + * get_device_system_crosststamp() can cope with.
> + */
> +static int vmclock_get_crosststamp_kvmclock(struct vmclock_state *st,
> +					    struct ptp_system_timestamp *sts,
> +					    struct system_counterval_t *system_counter,
> +					    struct timespec64 *tspec)
> +{
> +	struct pvclock_vcpu_time_info *pvti = this_cpu_pvti();
> +	unsigned pvti_ver;
> +	int ret;
> +
> +	preempt_disable_notrace();
> +
> +	do {
> +		pvti_ver = pvclock_read_begin(pvti);
> +
> +		ret = vmclock_get_crosststamp(st, sts, system_counter, tspec);
> +		if (ret)
> +			break;
> +
> +		system_counter->cycles = __pvclock_read_cycles(pvti,
> +							       system_counter->cycles);
> +		system_counter->cs_id = CSID_X86_KVM_CLK;
> +
> +		/*
> +		 * This retry should never really happen; if the TSC is
> +		 * stable and reliable enough across vCPUS that it is sane
> +		 * for the hypervisor to expose a VMCLOCK device which uses
> +		 * it as the reference counter, then the KVM clock sohuld be
> +		 * in 'master clock mode' and basically never changed. But
> +		 * the KVM clock is a fickle and often broken thing, so do
> +		 * it "properly" just in case.
> +		 */
> +	} while (pvclock_read_retry(pvti, pvti_ver));
> +
> +	preempt_enable_notrace();
> +
> +	return ret;
> +}
> +#endif
> +
> +static int ptp_vmclock_get_time_fn(ktime_t *device_time,
> +				   struct system_counterval_t *system_counter,
> +				   void *ctx)
> +{
> +	struct vmclock_state *st = ctx;
> +	struct timespec64 tspec;
> +	int ret;
> +
> +#ifdef SUPPORT_KVMCLOCK
> +	if (READ_ONCE(st->sys_cs_id) == CSID_X86_KVM_CLK)
> +		ret = vmclock_get_crosststamp_kvmclock(st, NULL, system_counter,
> +						       &tspec);
> +	else
> +#endif
> +		ret = vmclock_get_crosststamp(st, NULL, system_counter, &tspec);
> +
> +	if (!ret)
> +		*device_time = timespec64_to_ktime(tspec);
> +
> +	return ret;
> +}
> +
> +
> +static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
> +				      struct system_device_crosststamp *xtstamp)
> +{
> +	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
> +						ptp_clock_info);
> +	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
> +						NULL, xtstamp);
> +#ifdef SUPPORT_KVMCLOCK
> +	/*
> +	 * On x86, the KVM clock may be used for the system time. We can
> +	 * actually convert a TSC reading to that, and return a paired
> +	 * timestamp that get_device_system_crosststamp() *can* handle.
> +	 */
> +	if (ret == -ENODEV) {
> +		struct system_time_snapshot systime_snapshot;
> +		ktime_get_snapshot(&systime_snapshot);
> +
> +		if (systime_snapshot.cs_id == CSID_X86_TSC ||
> +		    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
> +			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
> +			ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
> +							    st, NULL, xtstamp);
> +		}
> +	}
> +#endif
> +	return ret;
> +}
> +
> +/*
> + * PTP clock operations
> + */
> +
> +static int ptp_vmclock_adjfine(struct ptp_clock_info *ptp, long delta)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ptp_vmclock_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ptp_vmclock_settime(struct ptp_clock_info *ptp,
> +			   const struct timespec64 *ts)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ptp_vmclock_gettimex(struct ptp_clock_info *ptp, struct timespec64 *ts,
> +				struct ptp_system_timestamp *sts)
> +{
> +	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
> +						ptp_clock_info);
> +
> +	return vmclock_get_crosststamp(st, sts, NULL, ts);
> +}
> +
> +static int ptp_vmclock_enable(struct ptp_clock_info *ptp,
> +			  struct ptp_clock_request *rq, int on)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct ptp_clock_info ptp_vmclock_info = {
> +	.owner		= THIS_MODULE,
> +	.max_adj	= 0,
> +	.n_ext_ts	= 0,
> +	.n_pins		= 0,
> +	.pps		= 0,
> +	.adjfine	= ptp_vmclock_adjfine,
> +	.adjtime	= ptp_vmclock_adjtime,
> +	.gettimex64	= ptp_vmclock_gettimex,
> +	.settime64	= ptp_vmclock_settime,
> +	.enable		= ptp_vmclock_enable,
> +	.getcrosststamp = ptp_vmclock_getcrosststamp,
> +};
> +
> +static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *vma)
> +{
> +	struct vmclock_state *st = container_of(fp->private_data,
> +						struct vmclock_state, miscdev);
> +
> +	if ((vma->vm_flags & (VM_READ|VM_WRITE)) != VM_READ)
> +		return -EROFS;
> +
> +	if (vma->vm_end - vma->vm_start != PAGE_SIZE || vma->vm_pgoff)
> +		return -EINVAL;
> +
> +        if (io_remap_pfn_range(vma, vma->vm_start,
> +			       st->res.start >> PAGE_SHIFT, PAGE_SIZE,
> +                               vma->vm_page_prot))
> +                return -EAGAIN;
> +
> +        return 0;
> +}
> +
> +static ssize_t vmclock_miscdev_read(struct file *fp, char __user *buf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct vmclock_state *st = container_of(fp->private_data,
> +						struct vmclock_state, miscdev);
> +	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
> +	size_t max_count;
> +	int32_t seq;
> +
> +	if (*ppos >= PAGE_SIZE)
> +		return 0;
> +
> +	max_count = PAGE_SIZE - *ppos;
> +	if (count > max_count)
> +		count = max_count;
> +
> +	while (1) {
> +		seq = st->clk->seq_count & ~1ULL;
> +		virt_rmb();
> +
> +		if (copy_to_user(buf, ((char *)st->clk) + *ppos, count))
> +			return -EFAULT;
> +
> +		virt_rmb();
> +		if (seq == st->clk->seq_count)
> +			break;
> +
> +		if (ktime_after(ktime_get(), deadline))
> +			return -ETIMEDOUT;
> +	}
> +
> +	*ppos += count;
> +	return count;
> +}
> +
> +static const struct file_operations vmclock_miscdev_fops = {
> +        .mmap = vmclock_miscdev_mmap,
> +        .read = vmclock_miscdev_read,
> +};
> +
> +/* module operations */
> +
> +static void vmclock_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct vmclock_state *st = dev_get_drvdata(dev);
> +
> +	if (st->ptp_clock)
> +		ptp_clock_unregister(st->ptp_clock);
> +
> +	if (st->miscdev.minor != MISC_DYNAMIC_MINOR)
> +		misc_deregister(&st->miscdev);
> +}
> +
> +static acpi_status vmclock_acpi_resources(struct acpi_resource *ares, void *data)
> +{
> +	struct vmclock_state *st = data;
> +	struct resource_win win;
> +	struct resource *res = &(win.res);
> +
> +	if (ares->type == ACPI_RESOURCE_TYPE_END_TAG)
> +		return AE_OK;
> +
> +	/* There can be only one */
> +	if (resource_type(&st->res) == IORESOURCE_MEM)
> +		return AE_ERROR;
> +
> +        if (acpi_dev_resource_memory(ares, res) ||
> +	    acpi_dev_resource_address_space(ares, &win)) {
> +
> +		if (resource_type(res) != IORESOURCE_MEM ||
> +		    resource_size(res) < sizeof(st->clk))
> +			return AE_ERROR;
> +
> +		st->res = *res;
> +		return AE_OK;
> +	}
> +
> +	return AE_ERROR;
> +}
> +
> +static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	acpi_status status;
> +
> +        status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
> +                                     vmclock_acpi_resources, st);
> +        if (ACPI_FAILURE(status) || resource_type(&st->res) != IORESOURCE_MEM) {
> +                dev_err(dev, "failed to get resources\n");
> +                return -ENODEV;
> +        }
> +
> +	return 0;
> +}
> +
> +static void vmclock_put_idx(void *data)
> +{
> +	struct vmclock_state *st = data;
> +
> +	ida_free(&vmclock_ida, st->index);
> +}
> +
> +static int vmclock_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct vmclock_state *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	if (has_acpi_companion(dev))
> +		ret = vmclock_probe_acpi(dev, st);
> +	else
> +		ret = -EINVAL; /* Only ACPI for now */
> +
> +	if (ret) {
> +		dev_info(dev, "Failed to obtain physical address: %d\n", ret);
> +		goto out;
> +	}
> +
> +	st->clk = devm_memremap(dev, st->res.start, resource_size(&st->res),
> +				MEMREMAP_WB | MEMREMAP_DEC);
> +	if (IS_ERR(st->clk)) {
> +		ret = PTR_ERR(st->clk);
> +		dev_info(dev, "failed to map shared memory\n");
> +		st->clk = NULL;
> +		goto out;
> +	}
> +
> +	if (st->clk->magic != VMCLOCK_MAGIC ||
> +	    st->clk->size < sizeof(*st->clk) ||


This is a problem and what I mention below.
As structure will evolve, sizeof(*st->clk) will grow,
then it will fail on old hosts.


> +	    st->clk->version != 1) {
> +		dev_info(dev, "vmclock magic fields invalid\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = ida_alloc(&vmclock_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		goto out;
> +
> +	st->index = ret;
> +        ret = devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
> +	if (ret)
> +		goto out;
> +
> +	st->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
> +	if (!st->name) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* If the structure is big enough, it can be mapped to userspace */
> +	if (st->clk->size >= PAGE_SIZE) {

This is also part of ABI. And a problematic one since linux can
increase PAGE_SIZE at any time for its own reasons.


> +		st->miscdev.minor = MISC_DYNAMIC_MINOR;
> +		st->miscdev.fops = &vmclock_miscdev_fops;
> +		st->miscdev.name = st->name;
> +
> +		ret = misc_register(&st->miscdev);
> +		if (ret)
> +			goto out;
> +	}

Hmm so you want to map a page to userspace, but who will
keep the clock in that memory page up to date?
Making hypervisor do it will mean stealing a bunch
of hypervisor time and we don't *know* userspace is
going to use it.


> +
> +	/* If there is valid clock information, register a PTP clock */
> +	if (IS_ENABLED(CONFIG_ARM64) &&
> +	    st->clk->counter_id == VMCLOCK_COUNTER_ARM_VCNT) {
> +		/* Can we check it's the virtual counter? */
> +		st->cs_id = CSID_ARM_ARCH_COUNTER;
> +	} else if (IS_ENABLED(CONFIG_X86) &&
> +		   st->clk->counter_id == VMCLOCK_COUNTER_X86_TSC) {
> +		st->cs_id = CSID_X86_TSC;
> +	}
> +
> +	/* Only UTC, or TAI with offset */
> +	if (!tai_adjust(st->clk, NULL)) {
> +		dev_info(dev, "vmclock does not provide unambiguous UTC\n");
> +		st->cs_id = CSID_GENERIC;
> +	}
> +
> +	if (st->cs_id) {
> +		st->sys_cs_id = st->cs_id;
> +
> +		st->ptp_clock_info = ptp_vmclock_info;
> +		strscpy(st->ptp_clock_info.name, st->name);
> +		st->ptp_clock = ptp_clock_register(&st->ptp_clock_info, dev);
> +
> +		if (IS_ERR(st->ptp_clock)) {
> +			ret = PTR_ERR(st->ptp_clock);
> +			st->ptp_clock = NULL;
> +			vmclock_remove(pdev);
> +			goto out;
> +		}
> +	} else if (!st->miscdev.minor) {
> +		/* Neither miscdev nor PTP registered */
> +		dev_info(dev, "vmclock: Neither miscdev nor PTP available; not registering\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	dev_info(dev, "%s: registered %s%s%s\n", st->name,
> +		 st->miscdev.minor ? "miscdev" : "",
> +		 (st->miscdev.minor && st->ptp_clock) ? ", " : "",
> +		 st->ptp_clock ? "PTP" : "");
> +
> +	dev_set_drvdata(dev, st);
> +
> + out:
> +	return ret;
> +}
> +
> +static const struct acpi_device_id vmclock_acpi_ids[] = {
> +	{ "VMCLOCK", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, vmclock_acpi_ids);

This is also part of ABI.
How do we know no one in the world happens to have a CID like this?
We should just reserve a valid HID, I think.


> +
> +static struct platform_driver vmclock_platform_driver = {
> +	.probe		= vmclock_probe,
> +	.remove_new	= vmclock_remove,
> +	.driver	= {
> +		.name	= "vmclock",
> +		.acpi_match_table = vmclock_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver(vmclock_platform_driver)
> +
> +MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
> +MODULE_DESCRIPTION("PTP clock using VMCLOCK");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/uapi/linux/vmclock-abi.h b/include/uapi/linux/vmclock-abi.h
> new file mode 100644
> index 000000000000..3bde10ddec38
> --- /dev/null
> +++ b/include/uapi/linux/vmclock-abi.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
> +
> +/*
> + * This structure provides a vDSO-style clock to VM guests, exposing the
> + * relationship (or lack thereof) between the CPU clock (TSC, timebase, arch
> + * counter, etc.) and real time. It is designed to address the problem of
> + * live migration, which other clock enlightenments do not.
> + *
> + * When a guest is live migrated, this affects the clock in two ways.
> + *
> + * First, even between identical hosts the actual frequency of the underlying
> + * counter will change within the tolerances of its specification (typically
> + * ±50PPM, or 4 seconds a day). This frequency also varies over time on the
> + * same host, but can be tracked by NTP as it generally varies slowly. With
> + * live migration there is a step change in the frequency, with no warning.
> + *
> + * Second, there may be a step change in the value of the counter itself, as
> + * its accuracy is limited by the precision of the NTP synchronization on the
> + * source and destination hosts.
> + *
> + * So any calibration (NTP, PTP, etc.) which the guest has done on the source
> + * host before migration is invalid, and needs to be redone on the new host.
> + *
> + * In its most basic mode, this structure provides only an indication to the
> + * guest that live migration has occurred. This allows the guest to know that
> + * its clock is invalid and take remedial action. For applications that need
> + * reliable accurate timestamps (e.g. distributed databases), the structure
> + * can be mapped all the way to userspace. This allows the application to see
> + * directly for itself that the clock is disrupted and take appropriate
> + * action, even when using a vDSO-style method to get the time instead of a
> + * system call.
> + *
> + * In its more advanced mode. this structure can also be used to expose the
> + * precise relationship of the CPU counter to real time, as calibrated by the
> + * host. This means that userspace applications can have accurate time
> + * immediately after live migration, rather than having to pause operations
> + * and wait for NTP to recover. This mode does, of course, rely on the
> + * counter being reliable and consistent across CPUs.
> + *
> + * Note that this must be true UTC, never with smeared leap seconds. If a
> + * guest wishes to construct a smeared clock, it can do so. Presenting a
> + * smeared clock through this interface would be problematic because it
> + * actually messes with the apparent counter *period*. A linear smearing
> + * of 1 ms per second would effectively tweak the counter period by 1000PPM
> + * at the start/end of the smearing period, while a sinusoidal smear would
> + * basically be impossible to represent.
> + *
> + * This structure is offered with the intent that it be adopted into the
> + * nascent virtio-rtc standard, as a virtio-rtc that does not address the live
> + * migration problem seems a little less than fit for purpose. For that
> + * reason, certain fields use precisely the same numeric definitions as in
> + * the virtio-rtc proposal. The structure can also be exposed through an ACPI
> + * device with the CID "VMCLOCK", modelled on the "VMGENID" device except for
> + * the fact that it uses a real _CRS to convey the address of the structure
> + * (which should be a full page, to allow for mapping directly to userspace).
> + */
> +
> +#ifndef __VMCLOCK_ABI_H__
> +#define __VMCLOCK_ABI_H__
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +#endif
> +
> +struct vmclock_abi {
> +	/* CONSTANT FIELDS */
> +	uint32_t magic;
> +#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
> +	uint32_t size;		/* Size of region containing this structure */
> +	uint16_t version;	/* 1 */

I think we need to document how will compatibility be handled,
otherwise people will just go
(assert(size == sizeof(struct vmclock_abi))
and we can't extend it ever.

I also feel some kind of negotiation so host can detect guest
expectations would be a good idea, basically a la virtio feature
negotiation.


Also, I think it's not great that host is just expected to
poke at this memory at all times. Being able to know that e.g.
system is being shut down and so no need to poke
at memory would be good.


> +	uint8_t counter_id; /* Matches VIRTIO_RTC_COUNTER_xxx except INVALID */
> +#define VMCLOCK_COUNTER_ARM_VCNT	0
> +#define VMCLOCK_COUNTER_X86_TSC		1
> +#define VMCLOCK_COUNTER_INVALID		0xff
> +	uint8_t time_type; /* Matches VIRTIO_RTC_TYPE_xxx */
> +#define VMCLOCK_TIME_UTC			0	/* Since 1970-01-01 00:00:00z */
> +#define VMCLOCK_TIME_TAI			1	/* Since 1970-01-01 00:00:00z */
> +#define VMCLOCK_TIME_MONOTONIC			2	/* Since undefined epoch */
> +#define VMCLOCK_TIME_INVALID_SMEARED		3	/* Not supported */
> +#define VMCLOCK_TIME_INVALID_MAYBE_SMEARED	4	/* Not supported */
> +
> +	/* NON-CONSTANT FIELDS PROTECTED BY SEQCOUNT LOCK */
> +	uint32_t seq_count;	/* Low bit means an update is in progress */
> +	/*
> +	 * This field changes to another non-repeating value when the CPU
> +	 * counter is disrupted, for example on live migration. This lets
> +	 * the guest know that it should discard any calibration it has
> +	 * performed of the counter against external sources (NTP/PTP/etc.).
> +	 */
> +	uint64_t disruption_marker;
> +	uint64_t flags;
> +	/* Indicates that the tai_offset_sec field is valid */
> +#define VMCLOCK_FLAG_TAI_OFFSET_VALID		(1 << 0)
> +	/*
> +	 * Optionally used to notify guests of pending maintenance events.
> +	 * A guest which provides latency-sensitive services may wish to
> +	 * remove itself from service if an event is coming up. Two flags
> +	 * indicate the approximate imminence of the event.
> +	 */
> +#define VMCLOCK_FLAG_DISRUPTION_SOON		(1 << 1) /* About a day */
> +#define VMCLOCK_FLAG_DISRUPTION_IMMINENT	(1 << 2) /* About an hour */
> +#define VMCLOCK_FLAG_PERIOD_ESTERROR_VALID	(1 << 3)
> +#define VMCLOCK_FLAG_PERIOD_MAXERROR_VALID	(1 << 4)
> +#define VMCLOCK_FLAG_TIME_ESTERROR_VALID	(1 << 5)
> +#define VMCLOCK_FLAG_TIME_MAXERROR_VALID	(1 << 6)
> +	/*
> +	 * If the MONOTONIC flag is set then (other than leap seconds) it is
> +	 * guaranteed that the time calculated according this structure at
> +	 * any given moment shall never appear to be later than the time
> +	 * calculated via the structure at any *later* moment.
> +	 *
> +	 * In particular, a timestamp based on a counter reading taken
> +	 * immediately after setting the low bit of seq_count (and the
> +	 * associated memory barrier), using the previously-valid time and
> +	 * period fields, shall never be later than a timestamp based on
> +	 * a counter reading taken immediately before *clearing* the low
> +	 * bit again after the update, using the about-to-be-valid fields.
> +	 */
> +#define VMCLOCK_FLAG_TIME_MONOTONIC		(1 << 7)
> +
> +	uint8_t pad[2];
> +	uint8_t clock_status;
> +#define VMCLOCK_STATUS_UNKNOWN		0
> +#define VMCLOCK_STATUS_INITIALIZING	1
> +#define VMCLOCK_STATUS_SYNCHRONIZED	2
> +#define VMCLOCK_STATUS_FREERUNNING	3
> +#define VMCLOCK_STATUS_UNRELIABLE	4
> +
> +	/*
> +	 * The time exposed through this device is never smeared. This field
> +	 * corresponds to the 'subtype' field in virtio-rtc, which indicates
> +	 * the smearing method. However in this case it provides a *hint* to
> +	 * the guest operating system, such that *if* the guest OS wants to
> +	 * provide its users with an alternative clock which does not follow
> +	 * UTC, it may do so in a fashion consistent with the other systems
> +	 * in the nearby environment.
> +	 */
> +	uint8_t leap_second_smearing_hint; /* Matches VIRTIO_RTC_SUBTYPE_xxx */
> +#define VMCLOCK_SMEARING_STRICT		0
> +#define VMCLOCK_SMEARING_NOON_LINEAR	1
> +#define VMCLOCK_SMEARING_UTC_SLS	2
> +	int16_t tai_offset_sec;
> +	uint8_t leap_indicator;
> +	/*
> +	 * This field is based on the the VIRTIO_RTC_LEAP_xxx values as
> +	 * defined in the current draft of virtio-rtc, but since smearing
> +	 * cannot be used with the shared memory device, some values are
> +	 * not used.
> +	 *
> +	 * The _POST_POS and _POST_NEG values allow the guest to perform
> +	 * its own smearing during the day or so after a leap second when
> +	 * such smearing may need to continue being applied for a leap
> +	 * second which is now theoretically "historical".
> +	 */
> +#define VMCLOCK_LEAP_NONE	0x00	/* No known nearby leap second */
> +#define VMCLOCK_LEAP_PRE_POS	0x01	/* Positive leap second at EOM */
> +#define VMCLOCK_LEAP_PRE_NEG	0x02	/* Negative leap second at EOM */
> +#define VMCLOCK_LEAP_POS	0x03	/* Set during 23:59:60 second */
> +#define VMCLOCK_LEAP_POST_POS	0x04
> +#define VMCLOCK_LEAP_POST_NEG	0x05
> +
> +	/* Bit shift for counter_period_frac_sec and its error rate */
> +	uint8_t counter_period_shift;
> +	/*
> +	 * Paired values of counter and UTC at a given point in time.
> +	 */
> +	uint64_t counter_value;
> +	/*
> +	 * Counter frequency, and error margin. The unit of these fields is
> +	 * seconds >> (64 + counter_period_shift)
> +	 */
> +	uint64_t counter_period_frac_sec;
> +	uint64_t counter_period_esterror_rate_frac_sec;
> +	uint64_t counter_period_maxerror_rate_frac_sec;
> +
> +	/*
> +	 * Time according to time_type field above.
> +	 */
> +	uint64_t time_sec;		/* Seconds since time_type epoch */
> +	uint64_t time_frac_sec;		/* (seconds >> 64) */
> +	uint64_t time_esterror_nanosec;
> +	uint64_t time_maxerror_nanosec;
> +};
> +
> +#endif /*  __VMCLOCK_ABI_H__ */
> -- 
> 2.44.0
> 
> 



