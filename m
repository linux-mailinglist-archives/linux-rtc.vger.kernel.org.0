Return-Path: <linux-rtc+bounces-1856-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A66969F89
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 15:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35EB81C21736
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994CB2B9D4;
	Tue,  3 Sep 2024 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZC1PQ+I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE17848E
	for <linux-rtc@vger.kernel.org>; Tue,  3 Sep 2024 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371776; cv=none; b=hKJd5GPTjUXAZzs6aQAdKxLdBcDzHB2d44PpjXY3MSFVbDlZMn0MTUDulkPut8xEXaS9uUioniXKDqZYTwPWl0gf6zmfI9ZCu28pQ7QZ/5BWcq6xDVWyBcrUMebAepM8iDsmpY5ZuoFdkfWUchTWbCMwz4/IrmYJIjTZ9/K7ayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371776; c=relaxed/simple;
	bh=t4Y7hIeIAarXA5+34v/upgeEA4IT1TimD5n6FrEchII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLG55cIS86NbT17Y+dS3PRMtiIoQw79T2+N8HRahZUwv8Sj/EaKtn2elFrMjKkTaXH9pxF5zBAK7WoYZ2F55eTFH5i/mdAAOyLy4GGEtoNAh1uDwV5XTG49ULO6zdn4KhM2R0dyuGWKvVd9M5Mn/aKh7CdjTkDM2mJjNXiblq3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZC1PQ+I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725371773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZUahBRGc+zhy9j2+IrRTtUJ4R6G0EU0I10UIHmemvg=;
	b=cZC1PQ+IVsm/Jix58L6Vhd+GMnvW+fqPXL5Hus4x86d/lZQlkRqUBirmsxgiAsyLw3S0XB
	ESzlC9WKHUj4rcvVtLcRr0/D0b638uDeHCyLtQS0xlGfDW6MmYMR2GHkGJc6fObMfHyz7X
	Nb+X19/E/PIeG9BFjF6EwNYznbTY40U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-MK7Eo8DwPraf7WCVtCo0SQ-1; Tue, 03 Sep 2024 09:56:12 -0400
X-MC-Unique: MK7Eo8DwPraf7WCVtCo0SQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c79bf194so1456676f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 03 Sep 2024 06:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371771; x=1725976571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZUahBRGc+zhy9j2+IrRTtUJ4R6G0EU0I10UIHmemvg=;
        b=DfeKpN1uTKAymnjcB0xHAl5au+XRTeScVLD7A7seFu2lCOBNPLSZebjXlOOpKChc+A
         oFT6iAC83vxhR0woK8RoieCngU3DEM1c16CgUeVar6Ix2kDU9IlwDAa7O8dyW7qYitPz
         9N1S/qyY41dzLtSKV9IMVhNlhYH3wnti2GXMX1wlta81oVmuPZLG4i8KKlogr9/NaCEt
         M3m6/MhNhuSqOvcVLn/UZfNDvDFIxl04qigh5J/Cb8C8qiXHlK/MRqQujeAR8wvXrJLa
         C0OLkmyZLJZl79QUvJ4WzICRa/sNpiKfM2dItTKvdTLWceSgUwME3jfYqRi2wgwxsI5V
         V0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7n76TyHxcBBWnlLsyET+HJE9GQMcqIRUdkBJxZIUQQNoOqYMvY2efXoBUC+cBA2V0LpMNYKJ/QZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ObB9g3Qd22vcrvtLhPwk4o0+o9ENUdXQfBAnWzKWXYV6Tcj9
	kxDXQphzoOV8rdwmS/8xNbf8L5ehJvD2xGX039A5Q0z36mLUt4fWGpIhlIu+AbD/5FFMQeqj6EN
	xKQGN1Ibj59jUhV7KTCVnEQcqxIbroPBtUkio/0GU89hNbq8lHqNrZiEtxQ==
X-Received: by 2002:a5d:67cd:0:b0:374:b5fc:d31a with SMTP id ffacd0b85a97d-374bceb37a3mr7053534f8f.25.1725371770876;
        Tue, 03 Sep 2024 06:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKMEOZbckYPKzqhZb37HeOJ7zsJWuV4GdJpSA6eNrl8UONYbHS5JM6qgDTBvQXT+ieXorLCQ==
X-Received: by 2002:a5d:67cd:0:b0:374:b5fc:d31a with SMTP id ffacd0b85a97d-374bceb37a3mr7053489f8f.25.1725371770178;
        Tue, 03 Sep 2024 06:56:10 -0700 (PDT)
Received: from [192.168.88.27] (146-241-55-250.dyn.eolo.it. [146.241.55.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8547c0csm6893161f8f.17.2024.09.03.06.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 06:56:09 -0700 (PDT)
Message-ID: <5c0303f4-c609-4a4e-a012-c27f08cfa6f9@redhat.com>
Date: Tue, 3 Sep 2024 15:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ptp: Add support for the AMZNC10C 'vmclock' device
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>,
 "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
Cc: "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
References: <dac0cd7e3c140dc309534a4c6e8976360bf6f3b9.camel@infradead.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <dac0cd7e3c140dc309534a4c6e8976360bf6f3b9.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/23/24 12:09, David Woodhouse wrote:
> diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
> index 604541dcb320..e98c9767e0ef 100644
> --- a/drivers/ptp/Kconfig
> +++ b/drivers/ptp/Kconfig
> @@ -131,6 +131,19 @@ config PTP_1588_CLOCK_KVM
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called ptp_kvm.
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
>   config PTP_1588_CLOCK_IDT82P33
>   	tristate "IDT 82P33xxx PTP clock"
>   	depends on PTP_1588_CLOCK && I2C
> diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
> index 68bf02078053..01b5cd91eb61 100644
> --- a/drivers/ptp/Makefile
> +++ b/drivers/ptp/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_PTP_1588_CLOCK_DTE)	+= ptp_dte.o
>   obj-$(CONFIG_PTP_1588_CLOCK_INES)	+= ptp_ines.o
>   obj-$(CONFIG_PTP_1588_CLOCK_PCH)	+= ptp_pch.o
>   obj-$(CONFIG_PTP_1588_CLOCK_KVM)	+= ptp_kvm.o
> +obj-$(CONFIG_PTP_1588_CLOCK_VMCLOCK)	+= ptp_vmclock.o
>   obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+= ptp-qoriq.o
>   ptp-qoriq-y				+= ptp_qoriq.o
>   ptp-qoriq-$(CONFIG_DEBUG_FS)		+= ptp_qoriq_debugfs.o
> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> new file mode 100644
> index 000000000000..f772bcb23599
> --- /dev/null
> +++ b/drivers/ptp/ptp_vmclock.c
> @@ -0,0 +1,607 @@
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
> +/* Require at least the flags field to be present. All else can be optional. */
> +#define VMCLOCK_MIN_SIZE offsetof(struct vmclock_abi, pad)
> +
> +#define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
> +	le32_to_cpu((_c)->size) >= (offsetof(struct vmclock_abi, _f) +	\
> +				    sizeof((_c)->_f))
> +
> +/*
> + * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
> + * and add the fractional second part of the reference time.
> + *
> + * The result is a 128-bit value, the top 64 bits of which are seconds, and
> + * the low 64 bits are (seconds >> 64).
> + */
> +static uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
> +					uint64_t period, uint8_t shift,
> +					uint64_t frac_sec)

I'm sorry for the late feedback.

uint64_t should be u64 (in a lot of places), mutatis mutandis uint32_t, 
etc...

> +{
> +	unsigned __int128 res = (unsigned __int128)delta * period;
> +
> +	res >>= shift;
> +	res += frac_sec;
> +	*res_hi = res >> 64;
> +	return (uint64_t)res;
> +}
> +
> +static bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
> +{
> +	if (likely(clk->time_type == VMCLOCK_TIME_UTC))
> +		return true;
> +
> +	if (clk->time_type == VMCLOCK_TIME_TAI &&
> +	    (le64_to_cpu(clk->flags) & VMCLOCK_FLAG_TAI_OFFSET_VALID)) {
> +		if (sec)
> +			*sec += (int16_t)le16_to_cpu(clk->tai_offset_sec);
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
> +		seq = le32_to_cpu(st->clk->seq_count) & ~1ULL;
> +
> +		/*
> +		 * This pairs with a write barrier in the hypervisor
> +		 * which populates this structure.
> +		 */
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
> +		} else {
> +			cycle = get_cycles();
> +		}
> +
> +		delta = cycle - le64_to_cpu(st->clk->counter_value);
> +
> +		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
> +						   le64_to_cpu(st->clk->counter_period_frac_sec),
> +						   st->clk->counter_period_shift,
> +						   le64_to_cpu(st->clk->time_frac_sec));
> +		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
> +		tspec->tv_sec += le64_to_cpu(st->clk->time_sec);
> +
> +		if (!tai_adjust(st->clk, &tspec->tv_sec))
> +			return -EINVAL;
> +
> +		virt_rmb();

Even this one deserves a comment.

> +		if (seq == le32_to_cpu(st->clk->seq_count))
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

unsigned int

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

Please insert an empty line after the variable declarations.

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
> +static struct ptp_clock *vmclock_ptp_register(struct device *dev,
> +					      struct vmclock_state *st)
> +{
> +	enum clocksource_ids cs_id;
> +
> +	if (IS_ENABLED(CONFIG_ARM64) &&
> +	    st->clk->counter_id == VMCLOCK_COUNTER_ARM_VCNT) {
> +		/* Can we check it's the virtual counter? */
> +		cs_id = CSID_ARM_ARCH_COUNTER;
> +	} else if (IS_ENABLED(CONFIG_X86) &&
> +		   st->clk->counter_id == VMCLOCK_COUNTER_X86_TSC) {
> +		cs_id = CSID_X86_TSC;
> +	} else {
> +		return NULL;
> +	}
> +
> +	/* Only UTC, or TAI with offset */
> +	if (!tai_adjust(st->clk, NULL)) {
> +		dev_info(dev, "vmclock does not provide unambiguous UTC\n");
> +		return NULL;
> +	}
> +
> +	st->sys_cs_id = st->cs_id = cs_id;

Please avoid multiple assignments in the same statement.

> +	st->ptp_clock_info = ptp_vmclock_info;
> +	strscpy(st->ptp_clock_info.name, st->name);
> +
> +	return ptp_clock_register(&st->ptp_clock_info, dev);
> +}
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

This chunk looks whitespace-damaged, use tab for indentation.

> +}
> +
> +static ssize_t vmclock_miscdev_read(struct file *fp, char __user *buf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct vmclock_state *st = container_of(fp->private_data,
> +						struct vmclock_state, miscdev);
> +	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
> +	size_t max_count;
> +	uint32_t seq;
> +
> +	if (*ppos >= PAGE_SIZE)
> +		return 0;
> +
> +	max_count = PAGE_SIZE - *ppos;
> +	if (count > max_count)
> +		count = max_count;
> +
> +	while (1) {
> +		seq = le32_to_cpu(st->clk->seq_count) & ~1U;
> +		virt_rmb();
> +
> +		if (copy_to_user(buf, ((char *)st->clk) + *ppos, count))
> +			return -EFAULT;
> +
> +		virt_rmb();
> +		if (seq == le32_to_cpu(st->clk->seq_count))
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

Unnecessary parentheses

There are several checkpatch offenders, please double check your next 
version before the submission.

Thanks!

Paolo


