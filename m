Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679A4118DDA
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 17:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfLJQlq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 11:41:46 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44403 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfLJQlq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 11:41:46 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B3FC01BF21B;
        Tue, 10 Dec 2019 16:41:42 +0000 (UTC)
Date:   Tue, 10 Dec 2019 17:41:39 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v6 5/6] rtc: mt6397: fix alarm register overwrite
Message-ID: <20191210164139.GT1463890@piout.net>
References: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1575639183-17606-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575639183-17606-6-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 06/12/2019 21:33:02+0800, Hsin-Hsiung Wang wrote:
> From: Ran Bi <ran.bi@mediatek.com>
> 
> Alarm registers high byte was reserved for other functions.
> This add mask in alarm registers operation functions.
> This also fix error condition in interrupt handler.
> 
> Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 47 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 

Can you rebase that one on top of v5.5-rc1 soon? I'll include it in -fixes.

> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 704229e..b216bdc 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -47,6 +47,14 @@
>  
>  #define RTC_AL_SEC		0x0018
>  
> +#define RTC_AL_SEC_MASK		0x003f
> +#define RTC_AL_MIN_MASK		0x003f
> +#define RTC_AL_HOU_MASK		0x001f
> +#define RTC_AL_DOM_MASK		0x001f
> +#define RTC_AL_DOW_MASK		0x0007
> +#define RTC_AL_MTH_MASK		0x000f
> +#define RTC_AL_YEA_MASK		0x007f
> +
>  #define RTC_PDN2		0x002e
>  #define RTC_PDN2_PWRON_ALARM	BIT(4)
>  
> @@ -103,7 +111,7 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>  		irqen = irqsta & ~RTC_IRQ_EN_AL;
>  		mutex_lock(&rtc->lock);
>  		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
> -				 irqen) < 0)
> +				 irqen) == 0)
>  			mtk_rtc_write_trigger(rtc);
>  		mutex_unlock(&rtc->lock);
>  
> @@ -225,12 +233,12 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
>  	mutex_unlock(&rtc->lock);
>  
> -	tm->tm_sec = data[RTC_OFFSET_SEC];
> -	tm->tm_min = data[RTC_OFFSET_MIN];
> -	tm->tm_hour = data[RTC_OFFSET_HOUR];
> -	tm->tm_mday = data[RTC_OFFSET_DOM];
> -	tm->tm_mon = data[RTC_OFFSET_MTH];
> -	tm->tm_year = data[RTC_OFFSET_YEAR];
> +	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
> +	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
> +	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
> +	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
> +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> +	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>  
>  	tm->tm_year += RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon--;
> @@ -251,14 +259,25 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon++;
>  
> -	data[RTC_OFFSET_SEC] = tm->tm_sec;
> -	data[RTC_OFFSET_MIN] = tm->tm_min;
> -	data[RTC_OFFSET_HOUR] = tm->tm_hour;
> -	data[RTC_OFFSET_DOM] = tm->tm_mday;
> -	data[RTC_OFFSET_MTH] = tm->tm_mon;
> -	data[RTC_OFFSET_YEAR] = tm->tm_year;
> -
>  	mutex_lock(&rtc->lock);
> +	ret = regmap_bulk_read(rtc->regmap, rtc->addr_base + RTC_AL_SEC,
> +			       data, RTC_OFFSET_COUNT);
> +	if (ret < 0)
> +		goto exit;
> +
> +	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
> +				(tm->tm_sec & RTC_AL_SEC_MASK));
> +	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
> +				(tm->tm_min & RTC_AL_MIN_MASK));
> +	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
> +				(tm->tm_hour & RTC_AL_HOU_MASK));
> +	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
> +				(tm->tm_mday & RTC_AL_DOM_MASK));
> +	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
> +				(tm->tm_mon & RTC_AL_MTH_MASK));
> +	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> +				(tm->tm_year & RTC_AL_YEA_MASK));
> +
>  	if (alm->enabled) {
>  		ret = regmap_bulk_write(rtc->regmap,
>  					rtc->addr_base + RTC_AL_SEC,
> -- 
> 2.6.4

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
