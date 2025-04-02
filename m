Return-Path: <linux-rtc+bounces-3724-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB4A78F65
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 15:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF77188ADFA
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 13:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A07423A99C;
	Wed,  2 Apr 2025 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WyXnBZMe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E8237703;
	Wed,  2 Apr 2025 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599002; cv=none; b=ZMm3cgHEy5dCkMYHHVWcia2oYXVUQO4zgcU2Gd9HiqkPVFhD6fw2gU17AjhfftIfpnfqe4jmQqJp3sOB2xRc2MzbeMexo9FJpbWbOy54/TxhVabuJGMhSw5Fo9U/r7UsCvVK0WSvfZnP47fgRA3pLHEjQM16pnZPzdG/gVtq250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599002; c=relaxed/simple;
	bh=QChMnVhP79OYUjktTjNwX0bo36faAS1EdEROK2OJg3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPd0G/IsQQ4QOIWbQ/9wPEwsAGvpqbLgcTs5PMe++f7u3sjApYXOJ/RguFTBZQapzzzAG2Dl0/SGqjIXZEWOREoYUAqLHkftFp9SiuGQq9aqt1d8tnZCoBcF5N5JtCxchDesDRLP+V0mr+Iphcv7stMd1Yx8xr5wuHmAmQxWeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WyXnBZMe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743598998;
	bh=QChMnVhP79OYUjktTjNwX0bo36faAS1EdEROK2OJg3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WyXnBZMel3gNh7BZTQeXHJGyXEMggDb6Ha5exyzx+nLrvLq1/B8RHRfUmtj8FypP+
	 Vkz8TII3BK5E3bDvqrYBABKa2/V817tfqeu05lLzur/T741v8UJJgQ8XOFfV1XyxQO
	 8dapgOlOLD7RlL76DvYA2w6TYQFDugIw0p8zbKrzzP3CPTsTxfjxMxRTTaW2M6bpsJ
	 VMk9lbuenzw9Ka9d6cXRQGS33z5ehjZDoRFkJ6D/Vsx/LL1SKbiZg8jIXA0z8QAx/g
	 BjVahbvnUI15ISXLMPlE9SFlieT2Q9UCoY1GwqYJYNre277nqFpvtndNE3fAEJBhwh
	 7QRCXfxXRMXQg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD74917E0385;
	Wed,  2 Apr 2025 15:03:17 +0200 (CEST)
Message-ID: <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Date: Wed, 2 Apr 2025 15:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
 <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/04/25 12:51, Alexandre Mergnat ha scritto:
> The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
> despite reading correctly through sysfs. There is high chance for other
> platform to be impacted by the year offset handling issue.
> 
> The hardware RTC registers store years relative to 1968, but the driver
> wasn't consistently applying the offset when converting between
> hardware and Linux time representation.
> 
> This inconsistency caused alarm rollover failures during device
> registration, with the error "alarm rollover not handled -22" in the
> logs, causing hwclock commands to fail.
> 
> The ioctl interface used by the hwclock command requires proper time
> range validation that wasn't happening with the inconsistent year
> offsets.
> 
> Fixes the issue by applying the year offset in all operations:
>     - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
>     - Subtracting the same offset when writing to hardware
>     - Using the same logic for both regular time and alarm operations
> 
> With these changes, the hwclock command works correctly and time
> values are consistently handled across all interfaces.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b2..ba52e225dc8fa 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>   	tm->tm_mday = data[RTC_OFFSET_DOM];
>   	tm->tm_wday = data[RTC_OFFSET_DOW];
>   	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
> -	tm->tm_year = data[RTC_OFFSET_YEAR];
> +	/* The RTC registers store years since 1968 (hardware's base year) */
> +	tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);

This patch received a NACK because of RTC_MIN_YEAR_OFFSET.

What you're doing here is avoiding to use the "RTC_MIN_YEAR_OFFSET" definition name
but otherwise doing the very same thing that was NACKed before.

Regards,
Angelo

>   
>   	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
>   exit:
> @@ -119,7 +120,8 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>   	data[RTC_OFFSET_DOM] = tm->tm_mday;
>   	data[RTC_OFFSET_DOW] = tm->tm_wday;
>   	data[RTC_OFFSET_MTH] = tm->tm_mon;
> -	data[RTC_OFFSET_YEAR] = tm->tm_year;
> +	/* Convert from tm_year (years since 1900) to RTC register format (years since 1968) */
> +	data[RTC_OFFSET_YEAR] = tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR);
>   
>   	mutex_lock(&rtc->lock);
>   	ret = regmap_bulk_write(rtc->regmap, rtc->addr_base + RTC_TC_SEC,
> @@ -165,8 +167,8 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>   	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
>   	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
>   	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> -	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
> -
> +	/* Apply the same offset conversion for alarm read */
> +	tm->tm_year = (data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK) + (RTC_MIN_YEAR - RTC_BASE_YEAR);
>   	tm->tm_mon--;
>   
>   	return 0;
> @@ -200,8 +202,9 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>   				(tm->tm_mday & RTC_AL_DOM_MASK));
>   	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
>   				(tm->tm_mon & RTC_AL_MTH_MASK));
> +	/* Convert alarm year using the same offset as in read/write time */
>   	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> -				(tm->tm_year & RTC_AL_YEA_MASK));
> +				((tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR)) & RTC_AL_YEA_MASK));
>   
>   	if (alm->enabled) {
>   		ret = regmap_bulk_write(rtc->regmap,
> 



