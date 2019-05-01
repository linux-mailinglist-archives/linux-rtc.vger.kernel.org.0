Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256FC1090C
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2019 16:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfEAOZQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 May 2019 10:25:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34295 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfEAOZQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 May 2019 10:25:16 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 046E3FF803;
        Wed,  1 May 2019 14:25:13 +0000 (UTC)
Date:   Wed, 1 May 2019 16:25:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trent Piepho <tpiepho@impinj.com>
Cc:     "patrice.chotard@st.com" <patrice.chotard@st.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: st-lpc: remove unnecessary check
Message-ID: <20190501142513.GK11339@piout.net>
References: <20190430201834.12634-1-alexandre.belloni@bootlin.com>
 <1556663479.31309.36.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556663479.31309.36.camel@impinj.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2019 22:31:19+0000, Trent Piepho wrote:
> On Tue, 2019-04-30 at 22:18 +0200, Alexandre Belloni wrote:
> > The RTC core already ensures the alarm is set to a time in the future, it
> > is not necessary to check again in the driver.
> 
> My reading of the rtc core code is that it checks if the alarm is in
> the future *twice* before handing off the set call to the driver, which
> possibly checks a 3rd time (as seen here).
> 
> However, all these checks are done *before* setting the alarm.  It
> still possible to have a race and set the alarm after the time has
> already passed, in which case the alarm will never fire.
> 

I agree the core need to handle that possible race better and this is
something I'm planning to work on.

> The way to fix the race would be to have the driver check the alarm
> *after* setting it.  In precisely this order, do these steps:
> 
> 1. Set alarm in RTC, to Talarm
> 2. Get time from RTC, as Tcurrent
> 3. Get alarm status from RTC
> 
> If Talarm < Tcurrent, alarm was set to future time, no error

This should be Talarm > Tcurrent, right?

> Else
>   If status == fired, alarm was set and has since fired, no error
>   Else status == not fired, alarm was set in past, EINVAL
> 
> This should be race free.
> 
> 
> >  
> > -	/* Invalid alarm time */
> > -	if (now_secs > alarm_secs)
> > -		return -EINVAL;
> > -
> >  	memcpy(&rtc->alarm, t, sizeof(struct rtc_wkalrm));
> >  
> >  	/* Now many secs to fire */
>         alarm_secs -= now_secs;
>         lpa = (unsigned long long)alarm_secs * rtc->clkrate;
> 
> While it's true the time wouldn't normally be in past, it still races,
> as describe above. In that case, the math here underflows alarm_secs,
> so it probably still makes sense to check.

I can't believe you can possibly have more than one second between the
check in the core and the check in the driver, it doesn't make much
sense to check, even in the current state of the core.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
