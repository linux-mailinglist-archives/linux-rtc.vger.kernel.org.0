Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9273413A88
	for <lists+linux-rtc@lfdr.de>; Sat,  4 May 2019 16:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfEDOE3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 May 2019 10:04:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54432 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726768AbfEDOE2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 May 2019 10:04:28 -0400
X-UUID: 7b45a49b02564369a708bfd590c0959e-20190504
X-UUID: 7b45a49b02564369a708bfd590c0959e-20190504
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1990895940; Sat, 04 May 2019 22:04:24 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 May 2019 22:04:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 4 May 2019 22:04:16 +0800
Message-ID: <1556978656.25811.1.camel@mtksdaap41>
Subject: Re: [PATCH v3 10/10] rtc: Add support for the MediaTek MT6358 RTC
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Mark Brown" <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>
Date:   Sat, 4 May 2019 22:04:16 +0800
In-Reply-To: <20190503093117.54830-11-hsin-hsiung.wang@mediatek.com>
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
         <20190503093117.54830-11-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 94F06579A06AD170C4104FD99EDD8ACC6517C53AB96CA365032830D34A4671372000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 2019-05-03 at 17:31 +0800, Hsin-Hsiung Wang wrote:
> From: Ran Bi <ran.bi@mediatek.com>
> 
> This add support for the MediaTek MT6358 RTC. Driver using
> compatible data to store different RTC_WRTGR address offset.
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 43 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index f85f1fc29e32..3476e29db87c 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -20,6 +20,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/io.h>
>  #include <linux/mfd/mt6397/core.h>
> @@ -27,7 +28,8 @@
>  #define RTC_BBPU		0x0000
>  #define RTC_BBPU_CBUSY		BIT(6)
>  
> -#define RTC_WRTGR		0x003c
> +#define RTC_WRTGR_MT6358	0x3a
> +#define RTC_WRTGR_MT6397	0x3c
>  
>  #define RTC_IRQ_STA		0x0002
>  #define RTC_IRQ_STA_AL		BIT(0)
> @@ -71,6 +73,10 @@
>  #define RTC_NUM_YEARS		128
>  #define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)
>  
> +struct mtk_rtc_compatible {
> +	u32			wrtgr_addr;
> +};
> +
>  struct mt6397_rtc {
>  	struct device		*dev;
>  	struct rtc_device	*rtc_dev;
> @@ -78,7 +84,25 @@ struct mt6397_rtc {
>  	struct regmap		*regmap;
>  	int			irq;
>  	u32			addr_base;
> +	const struct mtk_rtc_compatible *dev_comp;
> +};
> +
> +static const struct mtk_rtc_compatible mt6358_rtc_compat = {
> +	.wrtgr_addr = RTC_WRTGR_MT6358,
> +};
> +
> +static const struct mtk_rtc_compatible mt6397_rtc_compat = {
> +	.wrtgr_addr = RTC_WRTGR_MT6397,
> +};
> +
> +static const struct of_device_id mt6397_rtc_of_match[] = {
> +	{ .compatible = "mediatek,mt6358-rtc",
> +		.data = (void *)&mt6358_rtc_compat, },
> +	{ .compatible = "mediatek,mt6397-rtc",
> +		.data = (void *)&mt6397_rtc_compat, },
> +	{}
>  };
> +MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
>  
>  static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  {
> @@ -86,7 +110,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  	int ret;
>  	u32 data;
>  
> -	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
> +	ret = regmap_write(rtc->regmap,
> +			   rtc->addr_base + rtc->dev_comp->wrtgr_addr, 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -332,6 +357,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
>  	struct mt6397_rtc *rtc;
> +	const struct of_device_id *of_id;
>  	int ret;
>  
>  	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_KERNEL);
> @@ -341,6 +367,13 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	rtc->addr_base = res->start;
>  
> +	of_id = of_match_device(mt6397_rtc_of_match, &pdev->dev);
> +	if (!of_id) {

This will never happens, but I'm fine with it.

Review-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Joe.C


