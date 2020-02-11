Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F25158CD8
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2020 11:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgBKKjn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Feb 2020 05:39:43 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:59725 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgBKKjm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 Feb 2020 05:39:42 -0500
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 70D68200005;
        Tue, 11 Feb 2020 10:39:39 +0000 (UTC)
Date:   Tue, 11 Feb 2020 11:39:39 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michal Simek <monstr@monstr.eu>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        git <git@xilinx.com>
Subject: Re: [PATCH] rtc: zynqmp: Clear alarm interrupt status before
 interrupt enable
Message-ID: <20200211103939.GD3527@piout.net>
References: <1576155618-7933-1-git-send-email-srinivas.neeli@xilinx.com>
 <CAHTX3dKSq1oTzkoRv3wK3rhkc1r0rOiQhFKmgsYbtG_uvOfAJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHTX3dKSq1oTzkoRv3wK3rhkc1r0rOiQhFKmgsYbtG_uvOfAJg@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/02/2020 12:48:14+0100, Michal Simek wrote:
> Hi,
> 
> čt 12. 12. 2019 v 14:01 odesílatel Srinivas Neeli
> <srinivas.neeli@xilinx.com> napsal:
> >
> > Fix multiple occurring interrupts for alarm interrupt. RTC module doesn't
> > clear the alarm interrupt status bit immediately after the interrupt is
> > triggered.This is due to the sticky nature of the alarm interrupt status
> > register. The alarm interrupt status register can be cleared only after
> > the second counter outruns the set alarm value. To fix multiple spurious
> > interrupts, disable alarm interrupt in the handler and clear the status
> > bit before enabling the alarm interrupt.
> >
> > Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
> > Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> > ---
> >  drivers/rtc/rtc-zynqmp.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > index 5786866c09e9..d311e3ef1f21 100644
> > --- a/drivers/rtc/rtc-zynqmp.c
> > +++ b/drivers/rtc/rtc-zynqmp.c
> > @@ -38,6 +38,8 @@
> >
> >  #define RTC_CALIB_DEF          0x198233
> >  #define RTC_CALIB_MASK         0x1FFFFF
> > +#define RTC_ALRM_MASK          BIT(1)
> > +#define RTC_MSEC               1000
> >
> >  struct xlnx_rtc_dev {
> >         struct rtc_device       *rtc;
> > @@ -124,11 +126,28 @@ static int xlnx_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
> >  {
> >         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> >
> 
> here shouldn't be empty line.
> 
> > -       if (enabled)
> > +       unsigned int status;
> > +       ulong timeout;
> > +
> > +       timeout = jiffies + msecs_to_jiffies(RTC_MSEC);
> > +
> > +       if (enabled) {
> > +               while (1) {
> > +                       status = readl(xrtcdev->reg_base + RTC_INT_STS);
> > +                       if (!((status & RTC_ALRM_MASK) == RTC_ALRM_MASK))
> > +                               break;
> > +
> > +                       if (time_after_eq(jiffies, timeout)) {
> > +                               dev_err(dev, "Time out occur, while clearing alarm status bit\n");
> > +                               return -ETIMEDOUT;
> > +                       }
> > +                       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
> > +               }
> > +
> >                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> > -       else
> > +       } else {
> >                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
> > -
> > +       }
> 
> And here it was good to have empty line.
> 
> >         return 0;
> >  }
> >
> > @@ -183,8 +202,8 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
> >         if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
> >                 return IRQ_NONE;
> >
> > -       /* Clear RTC_INT_ALRM interrupt only */
> > -       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
> > +       /* Disable RTC_INT_ALRM interrupt only */
> > +       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
> >
> >         if (status & RTC_INT_ALRM)
> >                 rtc_update_irq(xrtcdev->rtc, 1, RTC_IRQF | RTC_AF);
> > --
> > 2.7.4
> 
> Other then these two above things look good.
> 
> Alexandre: Any issue with this patch?
> 

No issue, I was kind of waiting for your review. I'll take the patch
once your comments are addressed.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
