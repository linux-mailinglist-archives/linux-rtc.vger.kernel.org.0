Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE3C18829E
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 12:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgCQLz0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 07:55:26 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:48139 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQLz0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Mar 2020 07:55:26 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3BBF820003;
        Tue, 17 Mar 2020 11:55:24 +0000 (UTC)
Date:   Tue, 17 Mar 2020 12:55:23 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     maggarwa@codeaurora.org
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
Message-ID: <20200317115523.GB3448@piout.net>
References: <1584342688-14035-1-git-send-email-maggarwa@codeaurora.org>
 <20200316102905.GN4518@piout.net>
 <000001d5fc17$9c327ee0$d4977ca0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d5fc17$9c327ee0$d4977ca0$@codeaurora.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/03/2020 10:20:36+0530, maggarwa@codeaurora.org wrote:
> Hi,
> 
> Comments inline.
> 
> 
> Thanks & Regards,
> Mohit
> 
> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com> 
> Sent: Monday, March 16, 2020 3:59 PM
> To: Mohit Aggarwal <maggarwa@codeaurora.org>
> Cc: a.zummo@towertech.it; linux-rtc@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
> 
> Hi,
> 
> On 16/03/2020 12:41:28+0530, Mohit Aggarwal wrote:
> > Currently, alarm register is not cleared on resume leading to reboot 
> > during power off charging mode.
> > 
> > Change-Id: Ie2e6bbab8aa46e4e9b9cc984181ffab557cbbdae
> 
> No Change-Id upstream please.
> [Mohit]: Will fix in next patch.
> 
> > Signed-off-by: Mohit Aggarwal <maggarwa@codeaurora.org>
> > ---
> >  drivers/rtc/rtc-pm8xxx.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c index 
> > bbe013f..96e7985 100644
> > --- a/drivers/rtc/rtc-pm8xxx.c
> > +++ b/drivers/rtc/rtc-pm8xxx.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> > -/* Copyright (c) 2010-2011, 2019, The Linux Foundation. All rights 
> > reserved. */
> > +/* Copyright (c) 2010-2011, 2019-2020, The Linux Foundation. All 
> > +rights reserved. */
> >  
> >  #include <linux/of.h>
> >  #include <linux/module.h>
> > @@ -301,6 +301,7 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device
> *dev, unsigned int enable)
> >  	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
> >  	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
> >  	unsigned int ctrl_reg;
> > +	u8 value[NUM_8_BIT_RTC_REGS] = {0};
> >  
> >  	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
> >  
> > @@ -319,6 +320,16 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device
> *dev, unsigned int enable)
> >  		goto rtc_rw_fail;
> >  	}
> >  
> > +	/* Clear Alarm register */
> > +	if (!enable) {
> > +		rc = regmap_bulk_write(rtc_dd->regmap, regs->alarm_rw,
> value,
> > +					sizeof(value));
> 
> This is not properly aligned.
> [Mohit]: I don't see any alignment issue at my end. I can see proper tabs
> are present.
> 

The alignment should match the opening parenthesis.

> > +		if (rc) {
> > +			dev_err(dev, "Write to RTC ALARM register
> failed\n");
> 
> Is that error message necessary? What would be the user action after seeing
> that in the logs? Will the logs actually be seen?
> [Mohit]: In case issue in question reproduces even after this change then
> for debugging purposes user can look out for this error log in kernel logs
> which can help to triage the issue.
> 

Who in the field on the final product will see this error message? For
debugging purposes, regmap already provides plenty of tracing
facilities.



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
