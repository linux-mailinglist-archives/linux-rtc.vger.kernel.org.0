Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70395A10E4
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 07:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfH2FeW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 01:34:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55358 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725883AbfH2FeW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 01:34:22 -0400
X-UUID: a9b55ba842b4482a934a329a8c782b3a-20190829
X-UUID: a9b55ba842b4482a934a329a8c782b3a-20190829
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 635198789; Thu, 29 Aug 2019 13:34:14 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 13:34:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 13:34:18 +0800
Message-ID: <1567056852.31616.0.camel@mtksdaap41>
Subject: Re: [PATCH v5 09/10] rtc: mt6397: fix alarm register overwrite
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Mark Brown" <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <linux-rtc@vger.kernel.org>
Date:   Thu, 29 Aug 2019 13:34:12 +0800
In-Reply-To: <bf8435a7-db97-5ed8-bccc-9d197396aeb6@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1566531931-9772-10-git-send-email-hsin-hsiung.wang@mediatek.com>
         <bf8435a7-db97-5ed8-bccc-9d197396aeb6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: ADC74A5DEDFF4B5036933CA1E2AC6DBFD0512ED5B9376EFA5CA1F9F22C66550D2000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Matthias,

On Fri, 2019-08-23 at 17:35 +0200, Matthias Brugger wrote:
> 
> On 23/08/2019 05:45, Hsin-Hsiung Wang wrote:
> > From: Ran Bi <ran.bi@mediatek.com>
> > 
> > Alarm registers high byte was reserved for other functions.
> > This add mask in alarm registers operation functions.
> > This also fix error condition in interrupt handler.
> > 
> > Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> > 
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> 
> Misses your Signed-off-by.
> 

I will add it in the next patch, thanks.

> Regards,
> Matthias
> 
> > ---
> >  drivers/rtc/rtc-mt6397.c | 47 +++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 33 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index b46ed4d..828def7 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -47,6 +47,14 @@
> >  
> >  #define RTC_AL_SEC		0x0018
> >  
> > +#define RTC_AL_SEC_MASK		0x003f
> > +#define RTC_AL_MIN_MASK		0x003f
> > +#define RTC_AL_HOU_MASK		0x001f
> > +#define RTC_AL_DOM_MASK		0x001f
> > +#define RTC_AL_DOW_MASK		0x0007
> > +#define RTC_AL_MTH_MASK		0x000f
> > +#define RTC_AL_YEA_MASK		0x007f
> > +
> >  #define RTC_PDN2		0x002e
> >  #define RTC_PDN2_PWRON_ALARM	BIT(4)
> >  
> > @@ -103,7 +111,7 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
> >  		irqen = irqsta & ~RTC_IRQ_EN_AL;
> >  		mutex_lock(&rtc->lock);
> >  		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
> > -				 irqen) < 0)
> > +				 irqen) == 0)
> >  			mtk_rtc_write_trigger(rtc);
> >  		mutex_unlock(&rtc->lock);
> >  
> > @@ -225,12 +233,12 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> >  	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
> >  	mutex_unlock(&rtc->lock);
> >  
> > -	tm->tm_sec = data[RTC_OFFSET_SEC];
> > -	tm->tm_min = data[RTC_OFFSET_MIN];
> > -	tm->tm_hour = data[RTC_OFFSET_HOUR];
> > -	tm->tm_mday = data[RTC_OFFSET_DOM];
> > -	tm->tm_mon = data[RTC_OFFSET_MTH];
> > -	tm->tm_year = data[RTC_OFFSET_YEAR];
> > +	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
> > +	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
> > +	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
> > +	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
> > +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> > +	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
> >  
> >  	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> >  	tm->tm_mon--;
> > @@ -251,14 +259,25 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> >  	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
> >  	tm->tm_mon++;
> >  
> > -	data[RTC_OFFSET_SEC] = tm->tm_sec;
> > -	data[RTC_OFFSET_MIN] = tm->tm_min;
> > -	data[RTC_OFFSET_HOUR] = tm->tm_hour;
> > -	data[RTC_OFFSET_DOM] = tm->tm_mday;
> > -	data[RTC_OFFSET_MTH] = tm->tm_mon;
> > -	data[RTC_OFFSET_YEAR] = tm->tm_year;
> > -
> >  	mutex_lock(&rtc->lock);
> > +	ret = regmap_bulk_read(rtc->regmap, rtc->addr_base + RTC_AL_SEC,
> > +			       data, RTC_OFFSET_COUNT);
> > +	if (ret < 0)
> > +		goto exit;
> > +
> > +	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
> > +				(tm->tm_sec & RTC_AL_SEC_MASK));
> > +	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
> > +				(tm->tm_min & RTC_AL_MIN_MASK));
> > +	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
> > +				(tm->tm_hour & RTC_AL_HOU_MASK));
> > +	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
> > +				(tm->tm_mday & RTC_AL_DOM_MASK));
> > +	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
> > +				(tm->tm_mon & RTC_AL_MTH_MASK));
> > +	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> > +				(tm->tm_year & RTC_AL_YEA_MASK));
> > +
> >  	if (alm->enabled) {
> >  		ret = regmap_bulk_write(rtc->regmap,
> >  					rtc->addr_base + RTC_AL_SEC,
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


