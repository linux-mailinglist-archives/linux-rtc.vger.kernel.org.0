Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFD61829E8
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2020 08:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388103AbgCLHn1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 03:43:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46754 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388043AbgCLHn1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 03:43:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id n15so6033133wrw.13
        for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2020 00:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cBmBbvO3DHaF6ZM0Ex0exZ5k7RaaVlRVHw8bBFWLk68=;
        b=zJY872Vk0ENk8O9d1/vF4yt70XpjK4CvqiV/jZntDVQUqS80bWe8M3JDoQzVB2mdAr
         Qc9DIw3jkmvCLCE4pWVQlGw7esiFPP18VbCIapmO8bV1ZJyYLWeUB4/pbD7zJWNuDI6l
         m8Dq+6Z+4xikqbyHkN0QJkXNKYQdT0ZwUYnVO7fF12DVmV3UIQATSea0lhdWYZr7Rj6V
         +1pxYJsfUUeUpc3rdNrXcVqazEDQvQ8muPih69KFxJrwguJJy23f2cEXiVM3A2I+Kmca
         2EoYdG3eelt6WlAUGye4Y3+/wsWgbqoIIt61Pdoju38ymhdHYPghCFAcZtG9v7zloTcN
         II5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cBmBbvO3DHaF6ZM0Ex0exZ5k7RaaVlRVHw8bBFWLk68=;
        b=R+5fsQx1xAkoY+UAFDDk79XDPUxmOZkwov7gpSqlBWou5zidYBtrzfDxAxAa62ZqHv
         NllBtey7ZlwpRY6t4M9E9R+n/Xo72yY927d2IMcRknbjHR3JKhHYZ+bRgRmyW3GqqmR4
         gADg9V+8wAPy0jVy9PtobprI2vVylzcIQQwHqwETAugQ8vWnCEMrIbvTTpiA9EB0Na4P
         xZpgEycrGoSAuDkKzBCPAkIn+2pdw3q02Oq1fmfSrPDQ6x/wvKIHgZhjsVk3b1xZ6lSr
         lce18YtMjvOW1Iss+n9g+F0cwct85+CqEi1sRSfL25U87oJekfDJAlqBcxMrckfHpwEr
         CTcw==
X-Gm-Message-State: ANhLgQ1pPNWr73rfToy2oeoIyZzdpCa4mDTpYUvnBU9WfsMtWZ7u9vtp
        PQOz9fMhy8CdvwgzEUtvwG3l7A==
X-Google-Smtp-Source: ADFU+vtvxDiPA/GMHD+H5t3DWhluKuQ2jWG2EYeSH9Gtd2RzLo/KFy2SCx51K12MuuqOtu0airE3Hw==
X-Received: by 2002:adf:e64f:: with SMTP id b15mr6233670wrn.424.1583999005153;
        Thu, 12 Mar 2020 00:43:25 -0700 (PDT)
Received: from dell ([2.27.167.19])
        by smtp.gmail.com with ESMTPSA id n2sm5659471wrr.62.2020.03.12.00.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 00:43:24 -0700 (PDT)
Date:   Thu, 12 Mar 2020 07:44:07 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Frank Wunderlich <frank-w@public-files.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Josef Friedl <josef.friedl@speed.at>,
        Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v10 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200312074407.GA3142@dell>
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Mar 2020, Hsin-Hsiung Wang wrote:

> From: Ran Bi <ran.bi@mediatek.com>
> 
> This add support for the MediaTek MT6358 RTC. Driver using
> compatible data to store different RTC_WRTGR address offset.
> This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> driver which only needed by armv7 CPU without ATF.
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/power/reset/mt6323-poweroff.c |  2 +-
>  drivers/rtc/rtc-mt6397.c              | 32 ++++++++++++++++++++++++--------
>  include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
>  3 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
> index 1caf43d..0532803 100644
> --- a/drivers/power/reset/mt6323-poweroff.c
> +++ b/drivers/power/reset/mt6323-poweroff.c
> @@ -30,7 +30,7 @@ static void mt6323_do_pwroff(void)
>  	int ret;
>  
>  	regmap_write(pwrc->regmap, pwrc->base + RTC_BBPU, RTC_BBPU_KEY);
> -	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR, 1);
> +	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR_MT6323, 1);
>  
>  	ret = regmap_read_poll_timeout(pwrc->regmap,
>  					pwrc->base + RTC_BBPU, val,
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index cda238d..7a5a9e2 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -9,18 +9,38 @@
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>
>  #include <linux/mfd/mt6397/rtc.h>
>  #include <linux/mod_devicetable.h>
>  
> +static const struct mtk_rtc_data mt6358_rtc_data = {
> +	.wrtgr = RTC_WRTGR_MT6358,
> +};
> +
> +static const struct mtk_rtc_data mt6397_rtc_data = {
> +	.wrtgr = RTC_WRTGR_MT6397,
> +};
> +
> +static const struct of_device_id mt6397_rtc_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-rtc",
> +		.data = (void *)&mt6397_rtc_data, },
> +	{ .compatible = "mediatek,mt6358-rtc",
> +		.data = (void *)&mt6358_rtc_data, },
> +	{ .compatible = "mediatek,mt6397-rtc",
> +		.data = (void *)&mt6397_rtc_data, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
> +
>  static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  {
>  	int ret;
>  	u32 data;
>  
> -	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
> +	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -269,6 +289,9 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	rtc->addr_base = res->start;
>  
> +	rtc->data = (struct mtk_rtc_data *)
> +			of_device_get_match_data(&pdev->dev);
> +
>  	rtc->irq = platform_get_irq(pdev, 0);
>  	if (rtc->irq < 0)
>  		return rtc->irq;
> @@ -325,13 +348,6 @@ static int mt6397_rtc_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
>  			mt6397_rtc_resume);
>  
> -static const struct of_device_id mt6397_rtc_of_match[] = {
> -	{ .compatible = "mediatek,mt6323-rtc", },
> -	{ .compatible = "mediatek,mt6397-rtc", },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
> -
>  static struct platform_driver mtk_rtc_driver = {
>  	.driver = {
>  		.name = "mt6397-rtc",
> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> index 7dfb63b..66534ed 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -18,7 +18,9 @@
>  #define RTC_BBPU_CBUSY         BIT(6)
>  #define RTC_BBPU_KEY            (0x43 << 8)
>  
> -#define RTC_WRTGR              0x003c
> +#define RTC_WRTGR_MT6358       0x3a
> +#define RTC_WRTGR_MT6397       0x3c
> +#define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
>  
>  #define RTC_IRQ_STA            0x0002
>  #define RTC_IRQ_STA_AL         BIT(0)
> @@ -65,6 +67,10 @@
>  #define MTK_RTC_POLL_DELAY_US  10
>  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
>  
> +struct mtk_rtc_data {
> +	u32			wrtgr;
> +};

Do you expect to add more properties to this struct?

If not, it seems a bit overkill.

>  struct mt6397_rtc {
>  	struct device           *dev;
>  	struct rtc_device       *rtc_dev;
> @@ -74,6 +80,7 @@ struct mt6397_rtc {
>  	struct regmap           *regmap;
>  	int                     irq;
>  	u32                     addr_base;
> +	const struct mtk_rtc_data *data;

'data' is a terrible variable name.

Why do you need to store this?

It's one variable which is used once AFAICT.

>  };
>  
>  #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
