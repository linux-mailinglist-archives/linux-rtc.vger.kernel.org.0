Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4294463A7
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Nov 2021 13:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhKEMzi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Nov 2021 08:55:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:51511 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhKEMzh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Nov 2021 08:55:37 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4D1D4100005;
        Fri,  5 Nov 2021 12:52:55 +0000 (UTC)
Date:   Fri, 5 Nov 2021 13:52:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Vincent Shih =?utf-8?B?5pa96YyV6bS7?= <vincent.shih@sunplus.com>
Cc:     Vincent Shih <vincent.sunplus@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] rtc: Add driver for Sunplus SP7021
Message-ID: <YYUpJ14jqK9gT4RD@piout.net>
References: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
 <1635834123-24668-2-git-send-email-vincent.shih@sunplus.com>
 <YYHZdXqpNqzusQ5n@piout.net>
 <6b70a97056fe4ab79326b472227899da@sphcmbx02.sunplus.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b70a97056fe4ab79326b472227899da@sphcmbx02.sunplus.com.tw>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/11/2021 12:05:22+0000, Vincent Shih 施錕鴻 wrote:
> > > +static int sp_rtc_set_alarm(struct device *dev, struct rtc_wkalrm
> > > +*alrm) {
> > > +	struct rtc_device *rtc = dev_get_drvdata(dev);
> > > +	unsigned long alarm_time;
> > > +
> > > +	alarm_time = rtc_tm_to_time64(&alrm->time);
> > > +	RTC_DEBUG("%s, alarm_time: %u\n", __func__, (u32)(alarm_time));
> > > +
> > > +	if (alarm_time > 0xFFFFFFFF)
> > > +		return -EINVAL;
> > 
> > Please set the range of the rtc properly and the core will do this check for you.
> 
> I modified it as the following statements
> 
> #define RTC_ALARM_SET 0x50		//register offset
> #define ALARM_SET 0xFFFFFFFF		//field in the register
> If (alarm_time > ALARM_SET)
>       return -EINVAL;
> 
> Is it applicable??
> 

No, please set the rtc .range_min and .range_max and the core will do
the check for you.

> > 
> > > +
> > > +	if ((rtc->aie_timer.enabled) && (rtc->aie_timer.node.expires ==
> > ktime_set(alarm_time, 0))) {
> > > +		if (rtc->uie_rtctimer.enabled)
> > > +			sp_rtc.set_alarm_again = 1;
> > > +	}
> > 
> > You have to explain that.
> 
> Since the alarm and update interrupts use the same HW one, rtc->aie_timer.enabled,
> rtc->uie_rtctimer.enabled and sp_rtc.set_alarm_again are used to distinguish between
> alarm interrupt and update one in rtc_irq_handler() (RTC_UF or RTC_AF). There is
> only alarm interrupt supported in out HW. I found the update interrupt is implemented
> by the alarm one in kernel.
> 
> > 
> > > +
> > > +	writel((u32)alarm_time, &rtc_reg_ptr->rtc_alarm_set);
> > > +	wmb();			// make sure settings are effective.
> > 
> > doesn't writel come with a barrier?
> 
> It is useless. I will remove it.
> 
> > 
> > > +
> > > +	// enable alarm for update irq
> > > +	if (rtc->uie_rtctimer.enabled)
> > > +		writel((0x003F << 16) | 0x17, &rtc_reg_ptr->rtc_ctrl);
> > > +	else if (!rtc->aie_timer.enabled)
> > > +		writel((0x0007 << 16) | 0x0, &rtc_reg_ptr->rtc_ctrl);
> > 
> > Magic values, please explain also, I'm not sure why you need to look at
> > uie_rtctimer and aie_timer as your RTC seems capable of having an alarm
> > every seconds.
> 
> 1. I will give the definitions for that magic values.
> 2. It is for update interrupt. rtc_alarm_irq_enable() will call alarm_irq_enable()
>   to enable HW alarm interrupt , but rtc_update_irq_enable() will not. Therefore
>   the HW interrupt for update one is enabled here. Otherwise how can I enable
>   HW alarm interrupt for update one??
> 

From the .set_alarm point of view, there is no difference between a
regular alarm and the uie alarm set by the core. alrm.enabled will
always be enabled.

> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int sp_rtc_read_alarm(struct device *dev, struct rtc_wkalrm
> > > +*alrm) {
> > > +	unsigned int alarm_time;
> > > +
> > > +	alarm_time = readl(&rtc_reg_ptr->rtc_alarm_set);
> > > +	RTC_DEBUG("%s, alarm_time: %u\n", __func__, alarm_time);
> > > +	rtc_time64_to_tm((unsigned long)(alarm_time), &alrm->time);
> > > +
> > 
> > You have to also set whether the alarm is enabled or not, else, simply don't
> > bother returning anything.
> 
> I will modify it.
> 
> > 
> > > +	return 0;
> > > +}
> > > +
> > > +static int sp_rtc_alarm_irq_enable(struct device *dev, unsigned int
> > > +enabled) {
> > > +	struct rtc_device *rtc = dev_get_drvdata(dev);
> > > +
> > > +	if (enabled)
> > > +		writel((0x003F << 16) | 0x17, &rtc_reg_ptr->rtc_ctrl);
> > > +	else if (!rtc->uie_rtctimer.enabled)
> > > +		writel((0x0007 << 16) | 0x0, &rtc_reg_ptr->rtc_ctrl);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct rtc_class_ops sp_rtc_ops = {
> > > +	.read_time =		sp_rtc_read_time,
> > > +	.set_time =		sp_rtc_set_time,
> > > +	.set_alarm =		sp_rtc_set_alarm,
> > > +	.read_alarm =		sp_rtc_read_alarm,
> > > +	.alarm_irq_enable =	sp_rtc_alarm_irq_enable,
> > > +};
> > > +
> > > +static irqreturn_t rtc_irq_handler(int irq, void *dev_id) {
> > > +	struct platform_device *plat_dev = dev_id;
> > > +	struct rtc_device *rtc = platform_get_drvdata(plat_dev);
> > > +
> > > +	if (rtc->uie_rtctimer.enabled) {
> > > +		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_UF);
> > > +		RTC_DEBUG("[RTC] update irq\n");
> > > +
> > > +		if (sp_rtc.set_alarm_again == 1) {
> > > +			sp_rtc.set_alarm_again = 0;
> > > +			rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
> > > +			RTC_DEBUG("[RTC] alarm irq\n");
> > > +		}
> > > +	} else {
> > > +		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
> > > +		RTC_DEBUG("[RTC] alarm irq\n");
> > > +	}
> > 
> > I'm pretty sure you can get rid of most of that and stop looking at uie_rtctimer.
> 
> rtc->aie_timer.enabled, rtc->uie_rtctimer.enabled and sp_rtc.set_alarm_again are
> used to distinguish between alarm interrupt and update one. There 3 conditions for
> triggering the alarm interrupt :
> 1. only alarm
> 2. only update
> 3. alarm and update together
> 

No, stop emulating UIE in your driver and let the core handle that. If
UIE is enabled for the RTC, it will set up an alarm every second. Your
driver doesn't have to handle the difference.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
