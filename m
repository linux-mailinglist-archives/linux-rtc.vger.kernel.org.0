Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677066B8AC
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 10:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfGQIzF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 04:55:05 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51575 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725941AbfGQIzE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Jul 2019 04:55:04 -0400
X-UUID: 61bf587d772d4c1ea6bcef6c4f5c4285-20190717
X-UUID: 61bf587d772d4c1ea6bcef6c4f5c4285-20190717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 860153521; Wed, 17 Jul 2019 16:54:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 17 Jul
 2019 16:54:55 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 16:54:54 +0800
Message-ID: <1563353694.19945.33.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] rtc: Add support for the MediaTek MT2712 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Mark Rutland" <mark.rutland@arm.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        "Flora Fu" <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Date:   Wed, 17 Jul 2019 16:54:54 +0800
In-Reply-To: <20190713211231.GD4732@piout.net>
References: <20190702032120.16539-1-ran.bi@mediatek.com>
         <20190702032120.16539-3-ran.bi@mediatek.com>
         <20190713211231.GD4732@piout.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: E81E13F116E4248978BEE1A56221D66CD0A4F944914214DEE6C47B20D48F8A212000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Belloni,

On Sat, 2019-07-13 at 23:12 +0200, Alexandre Belloni wrote:

> > +#define RTC_BBPU		0x0000
> > +#define RTC_BBPU_CLRPKY		(1U << 4)
> 
> Please use BIT(). Also, I don't feel that the RTC prefix is adding any
> value. MT2712 would be a better choice here.
> 

Will change to MT2712 at next patch.

> > +
> > +/* we map HW YEAR 0 to 1968 not 1970 because 2000 is the leap year */
> > +#define RTC_MIN_YEAR		1968
> > +#define RTC_BASE_YEAR		1900
> > +#define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)
> 
> Do not do that. If this RTC range starts in 200, ths is what the driver
> has to support, you should not care about dates before 2000. Note that
> the RTC core can still properly shift the range if it is absolutely
> necessary.
> 

Do we need to care about default alarm date 1970-01-01? Or can I just
set it to 2000-01-01?

> > +
> > +static inline u32 rtc_readl(struct mt2712_rtc *rtc, u32 reg)
> 
> Please use a more descriptive prefix than just rtc_.
> 

Do you mean it's better to use prefix "mt2712_rtc_"?

> > +		mutex_lock(&rtc->lock);
> 
> You should take rtc->rtc_dev->ops_lock. This would remove the need for
> rtc->lock.
> 

Will change it at next patch.

> > +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> > +
> 
> As stated before, do not do that, simply add 100.
> 

Will change it at next patch.

> > +	/* rtc_tm_to_time64 convert Gregorian date to seconds since
> > +	 * 01-01-1970 00:00:00, and this date is Thursday
> > +	 */
> > +	time = rtc_tm_to_time64(tm);
> > +	days = div_s64(time, 86400);
> > +	tm->tm_wday = (days + 4) % 7;
> > +
> 
> This is not necessary, nobody cares about tm_wday, if you don't have it,
> do not set it.
> 

Will remove this part at next patch.

> > +	dev_info(rtc->dev, "set al time = %04d-%02d-%02d %02d:%02d:%02d (%d)\n",
> 
> Do not use dev_info, dev_dbg is probably what you want here. Also, use
> %ptR.
> 

Will change it at next patch.

> > +	mutex_lock(&rtc->lock);
> 
> You probably need to disable the alarm before starting to modify the
> registers.
> 

Will change it at next patch.

> > +static bool valid_rtc_time(struct mt2712_rtc *rtc)
> 
> This function is not necessary, see later.
> 

Will change it at next patch.

> > +	rtc_writel(rtc, RTC_IRQ_EN,  0);
> 
> Are you sure you want to disable interrupts every time you reboot? I
> guess the RTC has its own power domain and may be used across reboots.
> 

Will remove this at next patch.

> > +	dev_info(rtc->dev, "%s rtc p1 is %x, p2 is %x!\n", __func__, p1, p2);
> 
> This debug message has to be removed.
> 

Will remove this at next patch.

> > +
> > +	/*
> > +	 * register status was not correct,
> > +	 * need set time and alarm to default
> > +	 */
> > +	if (p1 != RTC_POWERKEY1_KEY || p2 != RTC_POWERKEY2_KEY
> > +	    || !valid_rtc_time(rtc)) {
> > +		reset_rtc_time(rtc);
> 
> Do not do that. This is valuable information. If the time is invalid,
> report it as such in read_time and read_alarm. Resetting the time here
> will lead to more issues later (i.e. userspace is not able to know
> whether the time is set correctly or not).
> 

When RTC's power run out, RTC will lost it's registers value and time
data at next boot up. We even cannot know what the date and time it
shows. We want to check this state here and set a default RTC date. Do
you think it's no need here and the date should be set by system?

> > +	ret = request_threaded_irq(rtc->irq, NULL,
> 
> devm_request_threaded_irq would remove the need for out_free_irq and
> mtk_rtc_remove().
> 

Will change it at next patch. And will remove mtk_rtc_remove() function.

--
Ran Bi, MediaTek


