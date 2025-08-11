Return-Path: <linux-rtc+bounces-4667-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E73B2128A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 18:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55DD61886D00
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF992262FC2;
	Mon, 11 Aug 2025 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="IzINKJcA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD0033D8;
	Mon, 11 Aug 2025 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930773; cv=none; b=jLlwVX12mKV18tSe1gAIdT/q99NHUsZDol0EuYxBm3iZi9cmgS9vO0eZbs0LOJj5pSWBg8qZXYPDmFYoV88UaKh8vCv+edvSCuH2qnGIG7TFxPq4YxJe0PkE/w1/YD3x/Ive3fn+WKNhkaH0DlL0KkL8u+9bQ+2vTefGJVDRJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930773; c=relaxed/simple;
	bh=TojhoG5KQm0Zil3KXj/3MOaNIR3JBkiN+pJfmevoilM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lm0T5vngvbInYmdlwNWodTDMzQPiSPM3EOmeHZJ7c4zSLrkXng+CUqf0PTG7bZur01GYAkGx0KBeUuLTj7h7XR2/OWzXBzt1QFZ0f22XGgTlNe7PPTlZ4erYDNWpqIcaQQv7SCIgWFFI9yyGrZtoqq1gScRwMdsb7AodGvOgzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=IzINKJcA; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.64.136] (unknown [20.236.11.69])
	by linux.microsoft.com (Postfix) with ESMTPSA id D2938211826D;
	Mon, 11 Aug 2025 09:46:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D2938211826D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754930768;
	bh=5t1P3VptPd0i00bkc3V2cUTaDzWFAwGZvBlqZNNm6/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IzINKJcA+veFAgczYNDsuMmCg/WXyQU8ibzIkFmrqHx4oBH7KHea9Jocl85CohfTu
	 lBOQ4BOzX2v3V/TnM6ws1tfXQX7VRvjJDX7UfUQd9MIcrCVF41MYpq7RQErNd1N7TM
	 0i4G/li+2rCMZnS2hxMtaA7iATJt4yNJlofCTzks=
Message-ID: <51eda58a-0c5e-4e0f-ae1f-87147fd8453c@linux.microsoft.com>
Date: Mon, 11 Aug 2025 09:46:07 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.16-5.10] rtc: ds1307: handle oscillator stop
 flag (OSF) for ds1341
To: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: Tyler Hicks <code@tyhicks.com>, Rodolfo Giometti <giometti@enneenne.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
References: <20250808153054.1250675-1-sashal@kernel.org>
 <20250808153054.1250675-5-sashal@kernel.org>
Content-Language: en-US
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
In-Reply-To: <20250808153054.1250675-5-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/2025 8:30 AM, Sasha Levin wrote:
> From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>
> [ Upstream commit 523923cfd5d622b8f4ba893fdaf29fa6adeb8c3e ]

Hi Sasha,

Without the first patch of the series, the OSF bit will get cleared in probe, so for it to meaningfully handle an invalid RTC, we'll need to take the first patch too.

The upstream commit is 48458654659c9c2e149c211d86637f1592470da5

https://lore.kernel.org/r/1749665656-30108-2-git-send-email-meaganlloyd@linux.microsoft.com

It removes the clear of the OSF status flag in probe in the shared ds_1337, ds_1339, ds_1341, ds_3231 switch case block.

Thank you,

Meagan

>
> In using CONFIG_RTC_HCTOSYS, rtc_hctosys() will sync the RTC time to the
> kernel time as long as rtc_read_time() succeeds. In some power loss
> situations, our supercapacitor-backed DS1342 RTC comes up with either an
> unpredictable future time or the default 01/01/00 from the datasheet.
> The oscillator stop flag (OSF) is set in these scenarios due to the
> power loss and can be used to determine the validity of the RTC data.
>
> This change expands the oscillator stop flag (OSF) handling that has
> already been implemented for some chips to the ds1341 chip (DS1341 and
> DS1342 share a datasheet). This handling manages the validity of the RTC
> data in .read_time and .set_time based on the OSF.
>
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Reviewed-by: Tyler Hicks <code@tyhicks.com>
> Acked-by: Rodolfo Giometti <giometti@enneenne.com>
> Link: https://lore.kernel.org/r/1749665656-30108-3-git-send-email-meaganlloyd@linux.microsoft.com
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> **Backport Status: YES**
>
> This commit should be backported to stable kernel trees for the
> following reasons:
>
> 1. **Bug Fix**: This commit fixes a real bug where the DS1341/DS1342 RTC
>    can report invalid time data after power loss without properly
>    checking the oscillator stop flag (OSF). The commit message clearly
>    describes the problem: "In some power loss situations, our
>    supercapacitor-backed DS1342 RTC comes up with either an
>    unpredictable future time or the default 01/01/00."
>
> 2. **Data Corruption Prevention**: Without this fix, systems using
>    DS1341/DS1342 RTCs can have incorrect system time after power loss,
>    which could lead to data corruption, incorrect timestamps, or system
>    malfunction. This is particularly critical for systems using
>    CONFIG_RTC_HCTOSYS.
>
> 3. **Minimal Risk**: The change is very small and contained - it only
>    adds OSF handling for the ds1341 chip type in two switch statements
>    (ds1307_get_time:282-287 and ds1307_set_time:380-383). The pattern
>    exactly follows the existing OSF handling already implemented for
>    ds_1338, ds_1340, and ds_1388 chips.
>
> 4. **Established Pattern**: The commit follows an established pattern in
>    the driver. Looking at the code, OSF handling is already implemented
>    for:
>    - ds_1338: Uses DS1338_BIT_OSF in DS1307_REG_CONTROL
>    - ds_1340: Uses DS1340_BIT_OSF in DS1340_REG_FLAG
>    - ds_1388: Uses DS1388_BIT_OSF in DS1388_REG_FLAG
>    - And now ds_1341: Uses DS1337_BIT_OSF in DS1337_REG_STATUS
>
> 5. **No New Features**: This is purely a bug fix - it doesn't add any
>    new functionality, just ensures existing functionality (reading valid
>    time) works correctly after power loss.
>
> 6. **Previous Similar Fixes**: The git history shows similar OSF fixes
>    have been made before, such as commit f471b05f76e4 ("rtc: ds1307:
>    Clear OSF flag on DS1388 when setting time"), indicating this is a
>    known class of issues that needs fixing.
>
> 7. **Hardware-Specific Fix**: This only affects systems with
>    DS1341/DS1342 RTCs, so there's no risk to systems using other RTC
>    chips. The change is guarded by the chip type check.
>
> The commit meets all the criteria for stable backporting: it fixes a
> real bug that affects users, the fix is small and self-contained, it
> doesn't introduce new features or architectural changes, and follows
> established patterns in the codebase.
>
>  drivers/rtc/rtc-ds1307.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 5efbe69bf5ca..7a60e5ca2b8a 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -279,6 +279,13 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  		if (tmp & DS1340_BIT_OSF)
>  			return -EINVAL;
>  		break;
> +	case ds_1341:
> +		ret = regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
> +		if (ret)
> +			return ret;
> +		if (tmp & DS1337_BIT_OSF)
> +			return -EINVAL;
> +		break;
>  	case ds_1388:
>  		ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
>  		if (ret)
> @@ -377,6 +384,10 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>  		regmap_update_bits(ds1307->regmap, DS1340_REG_FLAG,
>  				   DS1340_BIT_OSF, 0);
>  		break;
> +	case ds_1341:
> +		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
> +				   DS1337_BIT_OSF, 0);
> +		break;
>  	case ds_1388:
>  		regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>  				   DS1388_BIT_OSF, 0);

