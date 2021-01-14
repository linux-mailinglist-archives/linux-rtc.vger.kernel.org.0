Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4632E2F5F4C
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbhANKy2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:54:28 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38331 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbhANKy1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 05:54:27 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C974BE0017;
        Thu, 14 Jan 2021 10:53:44 +0000 (UTC)
Date:   Thu, 14 Jan 2021 11:53:44 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, dan.carpenter@oracle.com,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        l.sanfilippo@kunbus.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <20210114105344.GW3654@piout.net>
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-2-p.rosenberger@kunbus.com>
 <20210114080533.tnipsnqfxeqotvlg@pengutronix.de>
 <39a69676-83f2-07f4-99ae-ce4f89d5314c@kunbus.com>
 <20210114093325.GU3654@piout.net>
 <4f5a806d-ca18-cd94-33ea-86e8a84e345a@kunbus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f5a806d-ca18-cd94-33ea-86e8a84e345a@kunbus.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/01/2021 11:43:22+0100, Philipp Rosenberger wrote:
> On 14.01.21 10:33, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 14/01/2021 10:10:32+0100, Philipp Rosenberger wrote:
> > > 
> > > 
> > > On 14.01.21 09:05, Uwe Kleine-König wrote:
> > > > On Wed, Jan 13, 2021 at 12:27:41PM +0100, Philipp Rosenberger wrote:
> > > > > To resume normal operation after a total power loss (no or empty
> > > > > battery) the "Power-On Reset Override (PORO)" facility needs to be
> > > > > disabled.
> > > > > 
> > > > > As the oscillator may take a long time (200 ms to 2 s) to resume normal
> > > > > operation. The default behaviour is to use the PORO facility.
> > > > 
> > > > I'd write instead: The register reset value sets PORO enabled and the
> > > > data sheet recommends setting it to disabled for normal operation.
> > > 
> > > Sounds good, I will rephrase it.
> > > 
> > > > In my eyes having a reset default value that is unsuitable for
> > > > production use is just another bad design choice of this chip. At least
> > > > now this is known and can be somewhat fixed in software. :-\
> > > 
> > > Yes, had my fair share of WTF moments with this chip.
> > > 
> > > > > But with the PORO active no interrupts are generated on the interrupt
> > > > > pin (INT).
> > > > 
> > > > This sentence about no interrupts is your observation, or does this base
> > > > on some authoritative source (datasheet, FAE or similar)?
> > > > 
> > > 
> > > Yes this is only may observation. I tested this with the OM13513 demoboard
> > > with PCF2127 and pcf2129. So I should rephrase it to something like this:
> > > 
> > > Some testes suggests that no interrupts are generated on the interrupt pin
> > > if the PORP is active.
> > > 
> > > > > Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> > > > > ---
> > > > >    drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
> > > > >    1 file changed, 18 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > > > > index 39a7b5116aa4..378b1ce812d6 100644
> > > > > --- a/drivers/rtc/rtc-pcf2127.c
> > > > > +++ b/drivers/rtc/rtc-pcf2127.c
> > > > > @@ -26,6 +26,7 @@
> > > > >    /* Control register 1 */
> > > > >    #define PCF2127_REG_CTRL1		0x00
> > > > > +#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
> > > > >    #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
> > > > >    /* Control register 2 */
> > > > >    #define PCF2127_REG_CTRL2		0x01
> > > > > @@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
> > > > >    		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
> > > > >    	}
> > > > > +	/*
> > > > > +	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
> > > > > +	 * after power on. For normal operation the PORO must be disabled.
> > > > > +	 */
> > > > > +	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> > > > > +				PCF2127_BIT_CTRL1_POR_OVRD);
> > > > > +	/*
> > > > > +	 * If the PORO can't be disabled, just move on. The RTC should
> > > > > +	 * work fine, but functions like watchdog and alarm interrupts might
> > > > > +	 * not work. There will be no interrupt generated on the interrupt pin.
> > > > > +	 */
> > > > > +	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
> > > > > +	if (ret <= 0) {
> > > > > +		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
> > > > > +		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
> > > > 
> > > > I would not emit two messages here. Also including __func__ isn't so
> > > > nice IMHO. (Great for debugging, but not in production code IMHO.)
> > > 
> > > Yes, I dislike the style of the messages in this module. I just thought to
> > > keep it consistent.
> > 
> > No one will ever read the message, the whole test is useless.
> 
> Sorry, if I bother you with may questions. I'm unsure of why do you think
> the test is useless. Is it because it is unlikely to happen? Or that it is
> not relevant to report this?

It is not relevant because no action will be taken by the user following
this message.

> 
> > > 
> > > I'm thinking of rewriting this driver as MFD driver. We use the CLKOUT for
> > > some products. So maybe a RTC, watchdog and clock driver on top of an MFD.
> > > But I'm not sure if it is really a good idea. The behavior of the chip to
> > > disable the watchdog when reading ctrl2 (i think it was) giving me a
> > > headache.
> > 
> > Don't, this is not an MFD. There is no issue with having the RTC driver
> > being a clock provider.
> 
> OK, this is a clear statement.
> 
> Best Regards,
> Philipp

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
