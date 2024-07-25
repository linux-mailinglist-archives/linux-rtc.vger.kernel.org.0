Return-Path: <linux-rtc+bounces-1580-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCC93C0A7
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 13:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B77D282A0F
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 11:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2358E19924E;
	Thu, 25 Jul 2024 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mgf3u5nz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE75199242
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906466; cv=none; b=LPp4OWi2DaxPoWK6IHukJOm+zt0OCJDfs4RS8ZR7IxK9375QDGBDeI6CVBCNeQeEVlRa5uPO/GLaWrbM+IpBCEqkLZMfo2mwcMi8E1iaaaCwqg4EYgPMYIEgh5II1tHT2ep4BjrX2kHucVuKoVmYIY5d+W6Coquixng/xTPjznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906466; c=relaxed/simple;
	bh=E393x25IIG2PjHFTyTTWubra+t3kSqI48PhdEqj3xsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJE2QtTTHl3plEHJ6FSVmnGGCAz8cYaRMxLmGrsASMFYTwvpwdakqhMFn6Ic1bszOVxMbXCzwDDmpt6EeBHPuFZ714Qb5/aeYxaFtGUuxWOKok26777nRfVP1pMqlO4WDwBHrKQyIIV+uwL03UZXOzYc/1arPExon07JzRw/+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mgf3u5nz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721906463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/RcU6ENJ/Nt41p8RxOylXqN7jgSp+MCYSjVSMYB2J4=;
	b=Mgf3u5nzIYlNjJLXNtHpEwy0jSpD3NFLteFy5pRZo/GPsVAuLQOlR3AHkPRgaF/dy2pEmK
	M5J65qyZkjz9eYtyJ3X9ubMqn882QJPmjE18PYH5pvHEzUf/PMYjMHSLkBphy8etB4UxEW
	WGtTWWyJME8/0xKdKfopHMOj+xjs+1c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-d36yZUu5McCTjvuz_ROGSw-1; Thu, 25 Jul 2024 07:21:01 -0400
X-MC-Unique: d36yZUu5McCTjvuz_ROGSw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36b34f628f8so113676f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 25 Jul 2024 04:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906460; x=1722511260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/RcU6ENJ/Nt41p8RxOylXqN7jgSp+MCYSjVSMYB2J4=;
        b=IRyEABgBtES9TPiheQ2TVgrJuo0wooDx+Qa018Kfg2uucBlPQ3NXfAbCK8LayFtVZv
         FGvG8n5NIJUp4MHjwO2oqLt6e8Z2jPl1jw5CxAOUGHilNuHd0pvIZNmytdYBpYaVXgmh
         yQAxZfA1jjNHt6p3xic0/bs2kHBSzCPYcqxV6zWRTKXDLqp20aiTtceNVueybpQ+Pt6H
         iBLI5SZLzvZ3Oy3FbHyGaldrif1SZNCPCU01Y7n508f2IUbLvTE0IZPI+6TDDwGzRR0B
         JXIVGsGN6vE/PexNxwM3IAJp6rhuDli6Um2NsgbUBw7WeVsTSCI9PhDGRKVCcagjKdM0
         uhfw==
X-Forwarded-Encrypted: i=1; AJvYcCWltxYvIxgf5hK4SzlGtWx4sMu5MXibQnW95oEC4ic/G8tZ9e8tRyXCI9Pf3M+p2gbD+J5TAAFVZSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgL4cQUKrS1cMFSNZq6/iScNKPbAjhneOK73TkoVRVBOUHTAIy
	d048SQ1sjJuIPBdjzLkNX6DOuf93k2eoDOw12guw+S+RNY1i8vUD3eDrgXORKMto7qGUfwt4fpQ
	iTmn0goLbTjjsE0oRj81lsw0sU4l0NJ3HLl2XkxLBfwe8/fOkO/4R1o/a0A==
X-Received: by 2002:a05:600c:4511:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-428053c0936mr8553365e9.0.1721906460442;
        Thu, 25 Jul 2024 04:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs0hS+4jr12gekyxSSo+/sBI5EgsvR7qp+YV72mbT4WUmt0CTs2xCHVE2M9xlSdygkPfJGjA==
X-Received: by 2002:a05:600c:4511:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-428053c0936mr8553185e9.0.1721906459941;
        Thu, 25 Jul 2024 04:20:59 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b231:be10::f71? ([2a0d:3341:b231:be10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42807246ca4sm22683535e9.11.2024.07.25.04.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 04:20:59 -0700 (PDT)
Message-ID: <541d338f-bffc-4393-a501-92d01e5c8edb@redhat.com>
Date: Thu, 25 Jul 2024 13:20:57 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
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
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Just a bunch of 'nits below

On 7/24/24 19:16, David Woodhouse wrote:
> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
> new file mode 100644
> index 000000000000..9c508c21c062
> --- /dev/null
> +++ b/drivers/ptp/ptp_vmclock.c

[...]

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

Please, no 'inline' in \.c files

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

Same here

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

Please document which other barrier pair witht this one

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

Please use the brackets even for the else case

[...]
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

Please, don't add 2 consecutive blank lines.

Cheers,

Paolo


