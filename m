Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F1C1FAB8F
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 10:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgFPIrk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 04:47:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:17631 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPIrj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 04:47:39 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D7F8124000B;
        Tue, 16 Jun 2020 08:47:37 +0000 (UTC)
Date:   Tue, 16 Jun 2020 10:47:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Liam Beguin <liambeguin@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: add alarm support
Message-ID: <20200616084737.GG241261@piout.net>
References: <20200614040409.30302-1-liambeguin@gmail.com>
 <20200614040409.30302-3-liambeguin@gmail.com>
 <CAH+2xPBUuaNsxuTm+JDGWbDMMUn3SVwkOQXo_N5U4HaDiFGScA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH+2xPBUuaNsxuTm+JDGWbDMMUn3SVwkOQXo_N5U4HaDiFGScA@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/06/2020 10:38:00+0200, Bruno Thomsen wrote:
> > +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > +{
> > +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > +       unsigned int buf[5], ctrl2;
> > +       int ret;
> > +
> > +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> > +       if (ret) {
> > +               dev_err(dev, "%s: ctrl2 read error\n", __func__);
> > +               return ret;
> > +       }
> > +
> > +       ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> > +                              sizeof(buf));
> > +       if (ret) {
> > +               dev_err(dev, "%s: alarm read error\n", __func__);
> > +               return ret;
> > +       }
> > +
> > +       alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
> > +       alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
> > +
> > +       alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> > +       alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
> > +       alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
> > +       alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
> > +       alrm->time.tm_wday = buf[4] & 0x07;
> > +
> > +       dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=%d, wday=%d\n", __func__,
> > +               alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
> > +               alrm->time.tm_mday, alrm->time.tm_wday);
> > +
> > +       return 0;
> > +}
> > +
> > +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> > +{
> > +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                                PCF2127_BIT_CTRL2_AIE,
> > +                                enable ? PCF2127_BIT_CTRL2_AIE : 0);
> > +       if (ret) {
> > +               dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
> > +                       enable ? "enable" : "disable",
> > +                       ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> 
> Just do "return ret;" unconditional.
> 

Just return pcf2127_wdt_active_ping(&pcf2127->wdd);


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
