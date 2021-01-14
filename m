Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847D02F5F87
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 12:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbhANLMk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 06:12:40 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:14107 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbhANLMk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 06:12:40 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 89878240019;
        Thu, 14 Jan 2021 11:11:57 +0000 (UTC)
Date:   Thu, 14 Jan 2021 12:11:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     dan.carpenter@oracle.com, u.kleine-koenig@pengutronix.de,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        l.sanfilippo@kunbus.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
Message-ID: <20210114111157.GC3654@piout.net>
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-3-p.rosenberger@kunbus.com>
 <20210114095008.GV3654@piout.net>
 <77d07f5e-2891-21d6-feee-19e841a8343e@kunbus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d07f5e-2891-21d6-feee-19e841a8343e@kunbus.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/01/2021 11:30:37+0100, Philipp Rosenberger wrote:
> > > +	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
> > > +			      PCF2127_BIT_CLKOUT_OTPR);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
> > 
> > Please drop this error message.
> 
> If I return from the probe with an error, shouldn't there be an error
> message? Or should I ignore the problem at all and don't return from the
> probe?

You can return from probe without an error message.

> 
> > 
> > > +		return ret;
> > > +	}
> > > +	msleep(100);
> > 
> > Maybe this should be done just before setting the time. Or if you want
> > to keep it in probe, then you could optimise by not waiting but ensuring
> > the time between pcf2127_probe and the first pcf2127_rtc_set_time is
> > more than 100ms.
> > 
> 
> Doing it just before setting the time might be not the best way. The
> watchdog might be used before the OTPR is done.
> 
> From the PCF2129 manual:
> | The OTP refresh (see Section 8.3.2 on page 13) should ideally be
> | executed as the first instruction after start-up and also after a
> | reset due to an oscillator stop.
> 
> As I see it this should be done before setting up the watchdog as well. So
> sleeping if the OTPR wasn't done before might be the most viable solution.
> So I would check the OTPR and only if the OTPR is not set starting an OTPR
> and then sleep 100ms.
> 

Indeed, the remaining question is whether you should test OTPR or OSF.
OSF states: "oscillator has stopped and chip reset has occurred since
flag was last cleared" if OTPR is always 0 when OSF is 1, then OTPR is
probably enough.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
