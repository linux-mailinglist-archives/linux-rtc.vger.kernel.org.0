Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF72B7651
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Nov 2020 07:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgKRGbw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Nov 2020 01:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgKRGbw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Nov 2020 01:31:52 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAF2C0613D4;
        Tue, 17 Nov 2020 22:31:52 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h2so1881639wmm.0;
        Tue, 17 Nov 2020 22:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WL1QTPFW169V3/rommHaEV6KiqpoG4u90/ccyjWonZc=;
        b=RAQ6Xndp1GchA579n+zIc+q23xaNBTqLEZuFfUCdBShp9BEWobDJfGJzm7iLyBpxaY
         ytjVBGKH2f57g8hrEhyO/9uoa3E078dOzQuEx3uOqAUXBoUCXuO7UPjHpVTd77CTp3AT
         pzrxi1oByurneC+41pxV4/FBnmLW3ob/SJGfOfLUMBqOvmUt9dTIBOkbJTHp4t82rmVt
         ESeWIFQid5m0C4GA6dhqnwmFNzc6WxMCVrFuCGmkzDSsR3s/H6U0p3twwrP4yl33duAF
         yZiZxzr62spZ/W6SXo0BPlwtvTdXfPhsGePUi3ijEV4xTGwkZi6UKu6a5O+omri8lqQS
         hGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WL1QTPFW169V3/rommHaEV6KiqpoG4u90/ccyjWonZc=;
        b=knOCSfGgsPX+kCaVyfwAAp/QAnUg28wcvevJTSqnqSY/uwid168WkLVXjP85tqvlqu
         FnMubgJdvLlRzHsSaG93IwP0AlEJpMLS0YPuHPUKuTm/nQG/QqXtvGvtKFElaxnH6XJF
         2el61ddjMn52ux4OBLC8eXg6+/nzhrTV0JryVizFrAA/FuogRNgnEeJi8sJqPwmlggv9
         xtK+Z0laCNZAaB4SrB4YTumQQc8RuRza1CAf/MW9gyLbW76ce4blFcTE27FRMAmlCxOb
         eTdPCNgxyJctIF265/lFM0DpmpDYghaqV2W2ER38ik25+gVZjYeu12VdZWctYKTTFycr
         3Ljg==
X-Gm-Message-State: AOAM533AQnvhIGBewfmN2omD3ryZOc6TNWfng3WeyWi02k1OOeLzMRBc
        B6E0NV6NYMAkAZjmCMCkDP4GVChu2libf+E76WE=
X-Google-Smtp-Source: ABdhPJxhyxCeDUgS2Tdv0sKzYpKPsdvQMOGqHGHl7sk4fIo7+XN1OZEA7Uzxk+IaKukwZ9/F+tGMN6rLIE13VN+p51I=
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr2544327wme.43.1605681110874;
 Tue, 17 Nov 2020 22:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20201117212201.1288608-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20201117212201.1288608-1-alexandre.belloni@bootlin.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Wed, 18 Nov 2020 14:31:14 +0800
Message-ID: <CAAfSe-t6heLksvauKVBci1_aCi0Y044ugx7fEU=D3iuJQAG32Q@mail.gmail.com>
Subject: Re: [PATCH] rtc: sc27xx: Always read normal alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

Thanks for this cleanup.

On Wed, 18 Nov 2020 at 05:22, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> The RTC core only reads the alarm from the hardware at boot time, to know
> whether an alarm was already set before booting. It keeps track of all the
> alarms after that so there is no need to ever read the auxiliary alarm.
>
> Commit 3822d1bb0df1 ("rtc: sc27xx: Always read normal alarm when
> registering RTC device") already effectively removed the capability to read
> the auxiliary alarm a .read_alarm is always called with rtc->registered set

one nit suggestion: add a comma before "a .read_alarm is ..."

> to false.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Cheers,
Chunyan

> ---
>  drivers/rtc/rtc-sc27xx.c | 38 ++------------------------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
> index 6e65f68ea86d..a953bc0a5a5b 100644
> --- a/drivers/rtc/rtc-sc27xx.c
> +++ b/drivers/rtc/rtc-sc27xx.c
> @@ -299,33 +299,6 @@ static int sprd_rtc_set_secs(struct sprd_rtc *rtc, enum sprd_rtc_reg_types type,
>                             sts_mask);
>  }
>
> -static int sprd_rtc_read_aux_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> -{
> -       struct sprd_rtc *rtc = dev_get_drvdata(dev);
> -       time64_t secs;
> -       u32 val;
> -       int ret;
> -
> -       ret = sprd_rtc_get_secs(rtc, SPRD_RTC_AUX_ALARM, &secs);
> -       if (ret)
> -               return ret;
> -
> -       rtc_time64_to_tm(secs, &alrm->time);
> -
> -       ret = regmap_read(rtc->regmap, rtc->base + SPRD_RTC_INT_EN, &val);
> -       if (ret)
> -               return ret;
> -
> -       alrm->enabled = !!(val & SPRD_RTC_AUXALM_EN);
> -
> -       ret = regmap_read(rtc->regmap, rtc->base + SPRD_RTC_INT_RAW_STS, &val);
> -       if (ret)
> -               return ret;
> -
> -       alrm->pending = !!(val & SPRD_RTC_AUXALM_EN);
> -       return 0;
> -}
> -
>  static int sprd_rtc_set_aux_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  {
>         struct sprd_rtc *rtc = dev_get_drvdata(dev);
> @@ -415,16 +388,9 @@ static int sprd_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>         u32 val;
>
>         /*
> -        * Before RTC device is registered, it will check to see if there is an
> -        * alarm already set in RTC hardware, and we always read the normal
> -        * alarm at this time.
> -        *
> -        * Or if aie_timer is enabled, we should get the normal alarm time.
> -        * Otherwise we should get auxiliary alarm time.
> +        * The RTC core checks to see if there is an alarm already set in RTC
> +        * hardware, and we always read the normal alarm at this time.
>          */
> -       if (rtc->rtc && rtc->rtc->registered && rtc->rtc->aie_timer.enabled == 0)
> -               return sprd_rtc_read_aux_alarm(dev, alrm);
> -
>         ret = sprd_rtc_get_secs(rtc, SPRD_RTC_ALARM, &secs);
>         if (ret)
>                 return ret;
> --
> 2.28.0
>
