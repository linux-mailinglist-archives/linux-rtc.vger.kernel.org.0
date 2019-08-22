Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78349993E3
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 14:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388676AbfHVMeY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 08:34:24 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:49386 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730918AbfHVMeX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 08:34:23 -0400
X-UUID: 31f219a7482b44259f289d9290bf75da-20190822
X-UUID: 31f219a7482b44259f289d9290bf75da-20190822
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1694480463; Thu, 22 Aug 2019 20:34:17 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Aug
 2019 20:34:11 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 20:34:10 +0800
Message-ID: <1566477254.12318.41.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        "Flora Fu" <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Date:   Thu, 22 Aug 2019 20:34:14 +0800
In-Reply-To: <20190820201744.GZ3545@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <20190820201744.GZ3545@piout.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

> > +
> > +#define MTK_RTC_DEV		KBUILD_MODNAME
> 
> You probably shouldn't do that and have a static string for the driver
> name. I probably doesn't matter much though because DT is used to probe
> the driver.
> 

Will change it at next patch.

> > +/* we map HW YEAR 0 to 2000 because 2000 is the leap year */
> > +#define MT2712_MIN_YEAR		2000
> > +#define MT2712_BASE_YEAR	1900
> > +#define MT2712_MIN_YEAR_OFFSET	(MT2712_MIN_YEAR - MT2712_BASE_YEAR)
> > +#define MT2712_MAX_YEAR_OFFSET	(MT2712_MIN_YEAR_OFFSET + 127)
> > +
> 
> All those defines are unecessary, see below.
> 

Will change it at next patch.

> > +struct mt2712_rtc {
> > +	struct device		*dev;
> 
> Looking at the code closely, it seems this is only used for debug and
> error messages. Maybe you could use rtc_dev->dev instead.
> 

Will change it at next patch.

> > +	mutex_lock(&rtc->rtc_dev->ops_lock);
> > +
> > +	irqsta = mt2712_readl(rtc, MT2712_IRQ_STA);
> 
> Do you have to lock that read? Is the register cleared on read?
> 

Yes, this register is read clear register.

> > +	do {
> > +		__mt2712_rtc_read_time(rtc, tm, &sec);
> > +	} while (sec < tm->tm_sec);	/* SEC has carried */
> 
> Shouldn't that be while (tm->tm_sec < sec)?
> 

In __mt2712_rtc_read_time function, we read tm->tm_sec before read sec.
Sometimes we can meet situation like "tm->tm_sec == 59" and "sec == 0".
It means that TC_SEC has carried and we need to reload the tm struct. I
suppose it was correct that using "while (sec < tm->tm_sec)"

> > +
> > +	/* HW register use 7 bits to store year data, minus
> > +	 * MT2712_MIN_YEAR_OFFSET brfore write year data to register, and plus
> > +	 * MT2712_MIN_YEAR_OFFSET back after read year from register
> > +	 */
> > +	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
> 
> Simply add 100 in __mt2712_rtc_read_time
> 

Will change it at next patch.

> > +
> > +	/* HW register start mon from one, but tm_mon start from zero. */
> > +	tm->tm_mon--;
> > +
> 
> You can also do that in __mt2712_rtc_read_time.
> 

Will change it at next patch.

> > +	if (rtc_valid_tm(tm)) {
> 
> This check is unnecessary, the validity is always checked by the core.
> 

Will remove this at next patch.

> > +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> > +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> > +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> > +			1900 + MT2712_MAX_YEAR_OFFSET);
> > +		return -EINVAL;
> > +	}
> 
> This check is unnecessary, see below.
> 

Will change it at next patch.

> > +
> > +	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
> > +	tm->tm_mon++;
> 
> You should probably avoid modifying tm, move the substraction and
> addition in the mt2712_writel calls.
> 

Will change it at next patch.


> > +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> > +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> > +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> > +			1900 + MT2712_MAX_YEAR_OFFSET);
> > +		return -EINVAL;
> > +	}
> > +
> 
> Unnecessary check.
> 

Will change it at next patch.

> > +	p1 = mt2712_readl(rtc, MT2712_POWERKEY1);
> > +	p2 = mt2712_readl(rtc, MT2712_POWERKEY2);
> > +	if (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)
> > +		dev_dbg(rtc->dev, "powerkey not set (lost power)\n");
> > +
> 
> This info is valuable, you should check that when reading the time and
> return -EINVAL if power was lost.
> 

Will change it at next patch.

> 
> > +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> > +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> > +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
> 
> This should be written when setting the time after power was lost.
> 

I suppose we can move this into mt2712_rtc_read_time function's "if
(p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)" condition
which will be added at next patch. We need additional flag to mark this
condition or another if condition in mt2712_rtc_set_time fucntion if we
put these code in mt2712_rtc_set_time function.

> > +static const struct rtc_class_ops mt2712_rtc_ops = {
> > +	.read_time	= mt2712_rtc_read_time,
> > +	.set_time	= mt2712_rtc_set_time,
> > +	.read_alarm	= mt2712_rtc_read_alarm,
> > +	.set_alarm	= mt2712_rtc_set_alarm,
> 
> For proper operations, you should also provide the .alarm_irq_enable
> callback.
> 

Will change it at next patch.

> > +	rtc->rtc_dev->ops = &mt2712_rtc_ops;
> 
> If you set the range properly here using rtc_dev->range_min and
> rtc_dev->range_max, then the core will be able to do range checking and
> will also take care of the year offset/windowing calculations instead of
> having to hardcode that in the driver.
> 

Will change it at next patch.

Best Regards,
Ran


