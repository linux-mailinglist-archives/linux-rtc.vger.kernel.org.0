Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE0858167C
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jul 2022 17:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbiGZPdP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jul 2022 11:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239184AbiGZPdI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jul 2022 11:33:08 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EC925E9E;
        Tue, 26 Jul 2022 08:33:06 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1345310000D;
        Tue, 26 Jul 2022 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658849585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HRdmWnwRFg006Jlp/fvzJK6Y6DCwlRRmJJJdDrotXMs=;
        b=MkHhdU3nwYIlFLi6PaqFp6/zyM5/Pl5BZpebZkmq/2E2mAlmV+CEwZgBzYXWMK2HTZSFih
        cgHzmXZNnhIKTosA0WL/i1+fVTveSf8LgYgQnVUfmdp1AoQgfxUE7xoHBdJXxdUy/oapwY
        UXS54JT75l4ck1NCWJfl3awN6pivinxqizoGlmHMcegrUB7s2TLCmdOrSrvh3nvmX39QKw
        JUJ8awNEihSIMB2bziIRVpqrfVoQLu8/ww+62kjdeHtVd8WDrWw6TN1MgVgemGZxHhraMB
        WI3yRKRDKtiAkddZVV77p28yHTCX2w/ORqrUIpd8JMoR90C0PrIiDzGYgZOEtQ==
Date:   Tue, 26 Jul 2022 17:33:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] rtc: rzn1: Fix RTC_RD_TIME: Invalid argument
Message-ID: <YuAJLk8UIA0omk3N@mail.local>
References: <20220706120756.777378-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706120756.777378-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 06/07/2022 13:07:56+0100, Biju Das wrote:
> This patch fixes the issue RTC_RD_TIME: Invalid argument with the below
> use case.
> 
> Steps to reproduce:
> ------------------
> date -s "2022-12-31 23:59:55";hwclock -w
> hwclock; sleep 10; hwclock
> 
> Original result:
> ---------------
> Sat Dec 31 23:59:55 UTC 2022
> Sat Dec 31 23:59:56 2022  0.000000 seconds
> hwclock: RTC_RD_TIME: Invalid argument
> 
> Result after the fix:
> --------------------
> Sat Dec 31 23:59:55 UTC 2022
> Sat Dec 31 23:59:56 2022  0.000000 seconds
> Sun Jan  1 00:00:06 2023  0.000000 seconds
> 
> Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch fix is based on [1]
> [1] https://github.com/renesas-rz/rzn1_linux/blob/rzn1-stable-v4.19/drivers/rtc/rtc-rzn1.c
> ---
>  drivers/rtc/rtc-rzn1.c | 47 ++++++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index ac788799c8e3..0f99b4fd3c4b 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -88,6 +88,35 @@ static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
>  	return (days + 4) % 7;
>  }
>  
> +static void bcd2tm(struct rtc_time *tm)
> +{
> +	tm->tm_sec = bcd2bin(tm->tm_sec);
> +	tm->tm_min = bcd2bin(tm->tm_min);
> +	tm->tm_hour = bcd2bin(tm->tm_hour);
> +	tm->tm_wday = bcd2bin(tm->tm_wday);
> +	tm->tm_mday = bcd2bin(tm->tm_mday);
> +	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;

I guess this is the actual fix, I'm not sure creating the bcd2tm and
tm2bcd functions is useful, it obfuscates more than it helps.


> +	/* epoch == 1900 */
> +	tm->tm_year = bcd2bin(tm->tm_year) + 100;

Is it really the epoch of the RTC?

> +}
> +
> +static int tm2bcd(struct rtc_time *tm)
> +{
> +	if (rtc_valid_tm(tm) != 0)
> +		return -EINVAL;
> +

This will never fail, I'm not sure why you need to check here.

> +	tm->tm_sec = bin2bcd(tm->tm_sec);
> +	tm->tm_min = bin2bcd(tm->tm_min);
> +	tm->tm_hour = bin2bcd(tm->tm_hour);
> +	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
> +	tm->tm_mday = bin2bcd(tm->tm_mday);
> +	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
> +	/* epoch == 1900 */
> +	tm->tm_year = bin2bcd(tm->tm_year - 100);
> +
> +	return 0;
> +}
> +
>  static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> @@ -106,14 +135,7 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	if (tm->tm_sec != secs)
>  		rzn1_rtc_get_time_snapshot(rtc, tm);
>  
> -	tm->tm_sec = bcd2bin(tm->tm_sec);
> -	tm->tm_min = bcd2bin(tm->tm_min);
> -	tm->tm_hour = bcd2bin(tm->tm_hour);
> -	tm->tm_wday = bcd2bin(tm->tm_wday);
> -	tm->tm_mday = bcd2bin(tm->tm_mday);
> -	tm->tm_mon = bcd2bin(tm->tm_mon);
> -	tm->tm_year = bcd2bin(tm->tm_year);
> -
> +	bcd2tm(tm);
>  	return 0;
>  }
>  
> @@ -123,13 +145,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	u32 val;
>  	int ret;
>  
> -	tm->tm_sec = bin2bcd(tm->tm_sec);
> -	tm->tm_min = bin2bcd(tm->tm_min);
> -	tm->tm_hour = bin2bcd(tm->tm_hour);
> -	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
> -	tm->tm_mday = bin2bcd(tm->tm_mday);
> -	tm->tm_mon = bin2bcd(tm->tm_mon);
> -	tm->tm_year = bin2bcd(tm->tm_year);
> +	if (tm2bcd(tm) < 0)
> +		return -EINVAL;
>  
>  	val = readl(rtc->base + RZN1_RTC_CTL2);
>  	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
