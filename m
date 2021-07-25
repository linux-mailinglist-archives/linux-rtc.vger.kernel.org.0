Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7217D3D4C51
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jul 2021 08:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhGYFbX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Jul 2021 01:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhGYFbW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Jul 2021 01:31:22 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E78C061757;
        Sat, 24 Jul 2021 23:11:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id j2so6208650edp.11;
        Sat, 24 Jul 2021 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wFR6sS7MgnkuF9s/sreoF/A+KiH0ZJ0/kWVc4AXtEIk=;
        b=JVF/N/v0eQKfqf/R0Wir1IEiswcyIagZZIMY3jRcj87FUiCzC//p24eCtHKmd304ts
         Z8hfJGFszktgj12+QZNFqVIXPCFXBG28PLGbk+KPZG7GSE5A+HfcR4VgroZGz0RFSfFW
         mi/qzHsgC8VZeCDdWzOLcNRN6+znSWAHTte5xG9kEmlqHE0Dc6AxVIYkCgu9AWdkjED5
         jvd/+Cvd6sOFu8Ll+GzYDLMyoH4ukODpH53C52khDaswM/ALsPdCB8BqNuGrOXqut/OV
         Q0yTOeoEJnM3ZbbbtJ30GViEIBzPZz/ann8KqdtrP69p1idtVXhrBpY03fIX/dGGc/Sg
         eP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wFR6sS7MgnkuF9s/sreoF/A+KiH0ZJ0/kWVc4AXtEIk=;
        b=q4i6fbVjCE0h/14+iPEoIbvswgYMVaMtL9nFc1DtTabTIQUasV5Z15A6QGBdj+b/sG
         EHh3hn16VsDOSdw+5XThAWu/Rq75JpdkjPJgLnD8ujeXasi06qJKYkRNmVclywO77ARS
         IcsvxiRO/UhyT8BiIHn46x43oXEQu+9bvyValwhBuJgOYob11WxbKTvaUpUeECxe9TMx
         bRNGXYFf0SuLS+APh1L9MkOO5vw+r42GKg6DCRgg1Alt7wTipC6C4ggsIJkfGV2+pM8P
         og6978RZBhaGOiqI3ndMmSkPCAIHlI3ulue256M4yom5Rkgl0tSaZO6F+0u+K+PRpFzl
         cKcw==
X-Gm-Message-State: AOAM533JTlGqFHA9yWdh0qdZB6ijXhW6KWpU3WOKVI4x0AQADw+FOim1
        +4FfLv2L1GxywfMCx4URs2c=
X-Google-Smtp-Source: ABdhPJyxLW1kOVhsK013i3EQP2TuckxkXFUw6h6RbOexb0c2IPPlpp1JLqgoNoxEgF+kJpXVWiotEw==
X-Received: by 2002:a05:6402:b8f:: with SMTP id cf15mr14380260edb.286.1627193511198;
        Sat, 24 Jul 2021 23:11:51 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id ce21sm13208393ejc.25.2021.07.24.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 23:11:50 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 05/11] rtc: sun6i: Add support for broken-down alarm registers
Date:   Sun, 25 Jul 2021 08:11:49 +0200
Message-ID: <35374855.gLGPhMbAMS@kista>
In-Reply-To: <20210723153838.6785-6-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:32 CEST je Andre Przywara napisal(a):
> Newer versions of the Allwinner RTC, for instance as found in the H616
> SoC, not only store the current day as a linear number, but also change
> the way the alarm is handled: There are now two registers, that
> explicitly store the wakeup time, in the same format as the current
> time.
> 
> Add support for that variant by writing the requested wakeup time
> directly into the registers, instead of programming the seconds left, as
> the old SoCs required.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 60 +++++++++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index a02be8bca6f3..f0ee20bfdccb 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -48,7 +48,8 @@
>  
>  /* Alarm 0 (counter) */
>  #define SUN6I_ALRM_COUNTER			0x0020
> -#define SUN6I_ALRM_CUR_VAL			0x0024
> +/* This holds the remaining alarm seconds on older SoCs (current value) */
> +#define SUN6I_ALRM_COUNTER_HMS			0x0024
>  #define SUN6I_ALRM_EN				0x0028
>  #define SUN6I_ALRM_EN_CNT_EN			BIT(0)
>  #define SUN6I_ALRM_IRQ_EN			0x002c
> @@ -523,32 +524,57 @@ static int sun6i_rtc_setalarm(struct device *dev, 
struct rtc_wkalrm *wkalrm)
>  	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
>  	struct rtc_time *alrm_tm = &wkalrm->time;
>  	struct rtc_time tm_now;
> -	time64_t time_now, time_set;
> +	time64_t time_set;
> +	u32 counter_val, counter_val_hms;
>  	int ret;
>  
> -	ret = sun6i_rtc_gettime(dev, &tm_now);
> -	if (ret < 0) {
> -		dev_err(dev, "Error in getting time\n");
> -		return -EINVAL;
> -	}
> -
>  	time_set = rtc_tm_to_time64(alrm_tm);
> -	time_now = rtc_tm_to_time64(&tm_now);
> -	if (time_set <= time_now) {
> -		dev_err(dev, "Date to set in the past\n");
> -		return -EINVAL;
> -	}
>  
> -	if ((time_set - time_now) > U32_MAX) {
> -		dev_err(dev, "Date too far in the future\n");
> -		return -EINVAL;
> +	if (chip->flags & RTC_LINEAR_DAY) {
> +		time64_t seconds;
> +
> +		/*
> +		 * The alarm registers hold the actual alarm time, 
encoded
> +		 * in the same way (linear day + HMS) as the current 
time.
> +		 */
> +		counter_val_hms = SUN6I_TIME_SET_SEC_VALUE(alrm_tm-
>tm_sec)  |
> +				  
SUN6I_TIME_SET_MIN_VALUE(alrm_tm->tm_min)  |
> +				  
SUN6I_TIME_SET_HOUR_VALUE(alrm_tm->tm_hour);
> +		seconds = mktime64(alrm_tm->tm_year + 1900, alrm_tm-
>tm_mon,
> +				   alrm_tm->tm_mday, 0, 0, 0);

While above line should work, it's confusing why you're adding 1900 to years. 
In my opinion it would be better to use same trick you used in patch 4 - 
rtc_tm_to_time64() with hours, minutes and seconds set to 0. Or maybe you 
don't even need to do that, since division by SECS_PER_DAY will round down 
anyway. In such way you hide RTC internal representation detail which doesn't 
need to be exposed here.

Once fixed:
Reviewed by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +		counter_val = div_u64(seconds, SECS_PER_DAY);
> +	} else {
> +		/* The alarm register holds the number of seconds left. 
*/
> +		time64_t time_now;
> +
> +		ret = sun6i_rtc_gettime(dev, &tm_now);
> +		if (ret < 0) {
> +			dev_err(dev, "Error in getting time\n");
> +			return -EINVAL;
> +		}
> +
> +		time_now = rtc_tm_to_time64(&tm_now);
> +		if (time_set <= time_now) {
> +			dev_err(dev, "Date to set in the past\n");
> +			return -EINVAL;
> +		}
> +		if ((time_set - time_now) > U32_MAX) {
> +			dev_err(dev, "Date too far in the future\n");
> +			return -EINVAL;
> +		}
> +
> +		counter_val = time_set - time_now;
>  	}
>  
>  	sun6i_rtc_setaie(0, chip);
>  	writel(0, chip->base + SUN6I_ALRM_COUNTER);
> +	if (chip->flags & RTC_LINEAR_DAY)
> +		writel(0, chip->base + SUN6I_ALRM_COUNTER_HMS);
>  	usleep_range(100, 300);
>  
> -	writel(time_set - time_now, chip->base + SUN6I_ALRM_COUNTER);
> +	writel(counter_val, chip->base + SUN6I_ALRM_COUNTER);
> +	if (chip->flags & RTC_LINEAR_DAY)
> +		writel(counter_val_hms, chip->base + 
SUN6I_ALRM_COUNTER_HMS);
>  	chip->alarm = time_set;
>  
>  	sun6i_rtc_setaie(wkalrm->enabled, chip);
> -- 
> 2.17.6
> 
> 


