Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1522C9C0AB
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Aug 2019 00:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfHXWQl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 18:16:41 -0400
Received: from vps.xff.cz ([195.181.215.36]:45612 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727690AbfHXWQl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 24 Aug 2019 18:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566684998; bh=AsOxRhcbCf7VZl7oMHpWnpYauCEftDRhqiCkn6rkDqk=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=aDghlMgS0KlmNASkm6II80Hph5ASAkcy2zUuFCPWgZK4ffFAx4bGDHqmmgHb4KaB8
         HtWoS2NTJ3LkvHf9h7uJwWjpHOXsarTIzTbia6Tq6cVGH/hVd67KA9yDE2wmyUjnAx
         9uUMlrVR6N+/ymYdDfWbKtnIRDI/YXGaG6kJOJg0=
Date:   Sun, 25 Aug 2019 00:16:38 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Message-ID: <20190824221638.ztoqpp5y6btshgit@core.my.home>
Mail-Followup-To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-sunxi@googlegroups.com, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20190820151934.3860-1-megous@megous.com>
 <1690798.2HKiRSsjat@jernej-laptop>
 <20190824212746.a5pyilkrrvysjjbd@core.my.home>
 <7913281.jYEbquIlsS@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7913281.jYEbquIlsS@jernej-laptop>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Aug 24, 2019 at 11:36:26PM +0200, Jernej Škrabec wrote:
> Dne sobota, 24. avgust 2019 ob 23:27:46 CEST je Ondřej Jirman napisal(a):
> > Hello Jernej,
> > 
> > On Sat, Aug 24, 2019 at 11:09:49PM +0200, Jernej Škrabec wrote:
> > > > Visually?
> > > > 
> > > > That would explain why it doesn't work for you. The mainline RTC driver
> > > > disables auto-switch feature, and if your board doesn't have a crystal
> > > > for
> > > > LOSC, RTC will not generate a clock for the RTC.
> > > > 
> > > > H6's dtsi describes by default a situatiuon with external 32k crystal
> > > > oscillator. See ext_osc32k node. That's incorrect for your board if it
> > > > doesn't have the crystal. You need to fix this in the DTS for your board
> > > > instead of patching the driver.
> > > 
> > > I see that reparenting is supported, but I'm not sure how to fix that in
> > > DT. Any suggestion?
> > 
> > You may try removing the clocks property from rtc node.
> 
> I don't think this would work:
> https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-sun6i.c#L246

Well, I don't know. There has to be some way to make it work, since the code
deals with it here:

https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-sun6i.c#L270

Number of parents for LOSC is calculated from the DT somehow. Maybne something
to do with the #clock-cells property?

Sorry I can't be of more help here.

> > 
> > > > The driver has parent clock selection logic in case the LOSC crystal is
> > > > not
> > > > used.
> > > > 
> > > > Your patch enables automatic detection of LOSC failure and RTC changes
> > > > clock to LOSC automatically, despite what's described in the DTS. That
> > > > may fix the issue, but is not the correct solution.
> > > > 
> > > > Registers on my board look like this (external 32k osc is used) for
> > > > reference:
> > > > 
> > > > LOSC_CTRL_REG[7000000]: 8011
> > > > 
> > > > 	KEY_FIELD                      ???                  (0)
> > > > 	LOSC_AUTO_SWT_BYPASS           EN                   (1)
> > > > 	LOSC_AUTO_SWT_EN               DIS                  (0)
> > > > 	EXT_LOSC_EN                    EN                   (1)
> > > > 	EXT_LOSC_GSM                   LOW                  (0)
> > > > 	BATTERY_DIR                    DISCHARGE            (0)
> > > > 	LOSC_SRC_SEL                   EXT32k               (1)
> > > > 
> > > > LOSC_AUTO_SWT_STA_REG[7000004]: 1
> > > > 
> > > > 	EXT_LOSC_STA                   OK                   (0)
> > > > 	LOSC_AUTO_SWT_PEND             NOEFF                (0)
> > > > 	LOSC_SRC_SEL_STA               EXT32K               (1)
> > > 
> > > In my case LOSC_CTRL_REG has value 0x4010 and LOSC_AUTO_SWT_STA_REG
> > > has value 0x4, so there is issue with external crystal (it's missing) and
> > > RTC switched to internal one.
> > > 
> > > BTW, what's wrong with automatic switching? Why is it disabled?
> > 
> > It always was disabled on mainline (bit 14 was set to 0 even before my
> > patch). H6 just probably has another extra undocummented bit, that's needed
> > to disables it properly.
> > 
> > You probably don't want a glitch to switch your RTC from high-precision
> > clock to a low precision one possibly without any indication in the
> > userspace or a kernel log.
> > 
> > Regardless of all this, DTS needs to have a correct description of the HW,
> > which means if RTC module is not connected to the 32.757kHz crystal/clock,
> > clocks property should be empty.
> 
> If we are talking about correct HW description, then clock property should 
> actually have possibility that two clocks are defined - one for internal RC 
> (always present) and one external crystal (optional). In such case I could 
> really just omit external clock and be done with it. But I'm not sure if such 

Internal RC is thought to be part of the RTC module, so it's not defined as an
input clock to the RTC module.

regards,
	Ondrej

> 
> Best regards,
> Jernej
> 
> > 
> > regards,
> > 	o.
> > 
> > > Best regards,
> > > Jernej
> > > 
> > > > regards,
> > > > 
> > > > 	o.
> > > > 	
> > > > > > The real issue probably is that the mainline driver is missing this:
> > > > > > 
> > > > > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=h6-4.9-b
> > > > > > sp#n
> > > > > > 650
> > > > > 
> > > > > Not sure what you mean by that. ext vs. int source selection?
> > > > > 
> > > > > 
> > > > > 
> > > > > Best regards,
> > > > > Jernej
> > > > > 
> > > > > > regards,
> > > > > > 
> > > > > > 	o.
> 
> 
> 
> 
