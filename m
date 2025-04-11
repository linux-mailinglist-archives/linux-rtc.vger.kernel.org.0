Return-Path: <linux-rtc+bounces-3927-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A0A856D2
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 10:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E5F31BA7763
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C962E2980D2;
	Fri, 11 Apr 2025 08:39:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5C29614C;
	Fri, 11 Apr 2025 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360794; cv=none; b=qzvhfqERT11NJYLRShHCUZdZ0WBBvRRhIqwPrsdGch+U0kGTYqR4JKpEqBs6qJpI/3yYiVhoK2wqswzpvEn24zFP3u9jqFzLzPOBVzfzc7e6vRvVckNfAIo8Yd+slqqsZrv1RGGiyPAqKpLUvEiIJnNVpvQpqdWne6RJuB6MWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360794; c=relaxed/simple;
	bh=Cfxi6fEI2IFX41L3JE13Cy7FJb0PJLrt+bmOBfIv/gY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gebs152ZVV4qupsXQWV7K5cA4s8pVSI9HjVdIsntc1mDSf0wUv3AFdiHmqETuj9a1xuKuje0e5nuwV4gS3q5fTgRY8PuVQ4LYiv+ODUI3u/Tu3dCZFaK5W02be8eCLWHnYCn4U/iIhP8boTuEwSK9Zs3x4IQIYURBAyF+T6T9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 53B8dGr5046393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 11 Apr 2025 16:39:16 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 16:39:16 +0800
Date: Fri, 11 Apr 2025 16:39:11 +0800
From: CL Wang <cl634@andestech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        <ycliang@andestech.com>, <cl634@andestect.com>
Subject: Re: [PATCH V5 1/3] rtc: atcrtc100: Add ATCRTC100 RTC driver
Message-ID: <Z_jVLzgZjnF1thbq@swlinux02>
References: <20250110092702.1146356-1-cl634@andestech.com>
 <20250110092702.1146356-2-cl634@andestech.com>
 <20250331221541333bf9cf@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331221541333bf9cf@mail.local>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 53B8dGr5046393

Hi Alexandre,

Thank you very much for your feedback on the patch, and sorry for the delayed response.
Below are my replies to your comments and questions. I will prepare and send the next
version of the patch as soon as possible.

> +#define RTC_MINUTE(x)        ((x >> MIN_OFF) & MIN_MSK)      /* RTC min */
> +#define RTC_HOUR(x)  ((x >> HOUR_OFF) & HOUR_MSK)    /* RTC hour */
> +#define RTC_DAYS(x)  ((x >> DAY_OFF) & DAY_MSK)      /* RTC day */

FIELD_PREP can probably replace those.
=> That's a good suggestion. I will update this to use bitfield-related macros instead.


> +struct atcrtc_dev {
> +     struct rtc_device       *rtc_dev;
> +     struct regmap           *regmap;
> +     struct delayed_work     rtc_work;
> +     struct mutex            lock;

This mutex is not necessary, simply use rtc_lock() in you interrupt handler, the rtc core is already locking before calling the rtc_ops.
=> You're absolutely right. I will remove the mutex and clean up this
   part accordingly.

> +             usleep_range(ATCRTC_TIMEOUT_USLEEP_MIN,
> +                          ATCRTC_TIMEOUT_USLEEP_MAX);
> +     }
> +     dev_err(&rtc->rtc_dev->dev, "Device is busy too long\n");

Is this error message useful, what would be the user action after seeing this?
==> This message indicates that the RTC hardware might be stuck in a busy state.
    If this occurs, it suggests a potential hardware issue. During development, it
    can serve as a hint to review the RTC module's design. In production, a system
    reset might be required to recover. Based on that, I would prefer to keep this
    error message for diagnostic purposes.


> +static time64_t atcrtc_read_rtc_time(struct atcrtc_dev *rtc)

Does this have to be in a separate function?
=> Not necessarily. It can be merged into atcrtc_read_time(). I will
   make this adjustment.


> +     rtc_time64_to_tm(time, tm);
> +     if (rtc_valid_tm(tm) < 0) {

This is not necessary, the core always checks whether the tm is valid.
=> Thanks for pointing that out. I’ll remove this check.


> +     rem -= hour * 3600;
> +     min = rem / 60;
> +     sec = rem - min * 60;

You already had the broken down hour, min and sec, it is not necessary to compute that again here, just fold this function in atcrtc_set_time
=> You're right, I will simplify this part by integrating it directly
   into atcrtc_set_time().

> +     ret = atcrtc_check_write_done(rtc);
> +     if (ret)
> +             return ret;
> +     regmap_update_bits(rtc->regmap, RTC_CR, RTC_EN, RTC_EN);

This is losing some important information, the RTC must only be enabled once the time has been correctly set, then you can check RTC_EN in
atcrtc_read_time() to know whether the time is actually valid or not.
=> I will move the RTC_EN setting to atcrtc_set_time() and add a check for
   this bit in atcrtc_read_time() to ensure the time from RTC is valid.

> +     if (IS_ERR(atcrtc_dev->rtc_dev)) {
> +             dev_err(&pdev->dev,
> +                     "Failed to allocate RTC device: %ld\n",
> +                     PTR_ERR(atcrtc_dev->rtc_dev));
> +             return PTR_ERR(atcrtc_dev->rtc_dev);
> +     }
> +
> +     ret = atcrtc_alarm_enable(&pdev->dev, true);

Can't atcrtc_alarm_enable be part of atcrtc_hw_init so you don't have to wait twice?
=> After reviewing your comment, I agree. I think atcrtc_alarm_enable()
   should instead be integrated into atcrtc_set_alarm() and removed from
   here.

Thanks again for your detailed feedback. I'll revise the patch accordingly
and send out the updated version soon.

Best regards,
CL

