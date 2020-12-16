Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B97C2DC87F
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Dec 2020 22:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgLPVup (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Dec 2020 16:50:45 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42855 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbgLPVup (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Dec 2020 16:50:45 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 145A21C0007;
        Wed, 16 Dec 2020 21:49:59 +0000 (UTC)
Date:   Wed, 16 Dec 2020 22:49:59 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 2/9] rtc: mt6397: refine RTC_TC_MTH
Message-ID: <20201216214959.GT2814589@piout.net>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608104827-7937-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/12/2020 15:47:00+0800, Hsin-Hsiung Wang wrote:
> This patch adds RTC_TC_MTH_MASK to support new chips.
> 
> Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-mt6397.c       | 2 +-
>  include/linux/mfd/mt6397/rtc.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 1894aded4c85..ea6da7476a5e 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -75,7 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>  	tm->tm_min = data[RTC_OFFSET_MIN];
>  	tm->tm_hour = data[RTC_OFFSET_HOUR];
>  	tm->tm_mday = data[RTC_OFFSET_DOM];
> -	tm->tm_mon = data[RTC_OFFSET_MTH];
> +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
>  	tm->tm_year = data[RTC_OFFSET_YEAR];
>  
>  	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> index c3748b53bf7d..068ae1c0f0e8 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -36,6 +36,7 @@
>  #define RTC_AL_MASK_DOW                BIT(4)
>  
>  #define RTC_TC_SEC             0x000a
> +#define RTC_TC_MTH_MASK        0x000f
>  /* Min, Hour, Dom... register offset to RTC_TC_SEC */
>  #define RTC_OFFSET_SEC         0
>  #define RTC_OFFSET_MIN         1
> -- 
> 2.18.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
