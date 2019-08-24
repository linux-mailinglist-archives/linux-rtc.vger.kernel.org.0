Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFDF9BE03
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 15:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfHXNa7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 09:30:59 -0400
Received: from vps.xff.cz ([195.181.215.36]:42106 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727601AbfHXNa7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 24 Aug 2019 09:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566653457; bh=1b0F19iq/dWBCPJilMmXF0tZd8omjFMbcmvxarQbmQI=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=TdfHV2sRGBejRPc60TO/xNtxXoMQrgORh1uzO3ax8qM2TULUmdlklwyC+q6SBkb67
         X8q8E/TKXKlyfSRhsctitiynXh3aM39lLZTXbEmMOnmo0bhrYivJaIlltE+Ex1RCBN
         rQ71VD+FiXbej48nDgXDuB/CZx4Jdu/LUfw4jsIY=
Date:   Sat, 24 Aug 2019 15:30:57 +0200
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
Message-ID: <20190824133057.rhpj3xuzr3vymdiy@core.my.home>
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
 <2544007.NTLiB2pbcT@jernej-laptop>
 <20190824130544.kxypq3siv7kffidp@core.my.home>
 <10880274.nteIY8W56H@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10880274.nteIY8W56H@jernej-laptop>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Aug 24, 2019 at 03:16:41PM +0200, Jernej Škrabec wrote:
> Dne sobota, 24. avgust 2019 ob 15:05:44 CEST je Ondřej Jirman napisal(a):
> > On Sat, Aug 24, 2019 at 02:51:54PM +0200, Jernej Škrabec wrote:
> > > Dne sobota, 24. avgust 2019 ob 14:46:54 CEST je Ondřej Jirman napisal(a):
> > > > Hi,
> > > > 
> > > > On Sat, Aug 24, 2019 at 02:32:32PM +0200, Jernej Škrabec wrote:
> > > > > Hi!
> > > > > 
> > > > > Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous@megous.com
> > > 
> > > napisal(a):
> > > > > > From: Ondrej Jirman <megous@megous.com>
> > > > > > 
> > > > > > RTC on H6 is mostly the same as on H5 and H3. It has slight
> > > > > > differences
> > > > > > mostly in features that are not yet supported by this driver.
> > > > > > 
> > > > > > Some differences are already stated in the comments in existing
> > > > > > code.
> > > > > > One other difference is that H6 has extra bit in LOSC_CTRL_REG,
> > > > > > called
> > > > > > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> > > > > > 
> > > > > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check
> > > > > > whether
> > > > > > external low speed oscillator is working correctly.
> > > > > > 
> > > > > > This patch adds support for enabling LOSC when necessary:
> > > > > > 
> > > > > > - during reparenting
> > > > > > - when probing the clock
> > > > > > 
> > > > > > H6 also has capacbility to automatically reparent RTC clock from
> > > > > > external crystal oscillator, to internal RC oscillator, if external
> > > > > > oscillator fails. This is enabled by default. Disable it during
> > > > > > probe.
> > > > > > 
> > > > > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > ---
> > > > > > 
> > > > > >  drivers/rtc/rtc-sun6i.c | 40
> > > > > >  ++++++++++++++++++++++++++++++++++++++--
> > > > > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > > > > index d50ee023b559..b0c3752bed3f 100644
> > > > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > > > @@ -32,9 +32,11 @@
> > > > > > 
> > > > > >  /* Control register */
> > > > > >  #define SUN6I_LOSC_CTRL				0x0000
> > > > > >  #define SUN6I_LOSC_CTRL_KEY			(0x16aa 
> << 16)
> > > > > > 
> > > > > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
> > > > > 
> > > > > User manual says that above field is bit 14.
> > > > 
> > > > See the previous discussion, this is from BSP.
> > > 
> > > I have two versions of BSP (don't ask me which) which have this set as bit
> > > 14 and changing this to 14 actually solves all my problems with LOSC (no
> > > more issues with setting RTC and HDMI-CEC works now - it uses LOSC as
> > > parent) on Tanix TX6 box.
> > 
> > Interesting. Is LOSC fed externally generated clock, or is it setup as a
> > crystal oscillator on your board?
> 
> I really don't know, but here is DT: http://ix.io/1ThI
> 
> > 
> > Anyway, see here:
> > 
> > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.h?h=h6-4.9-bsp#n649
> > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=h6-4.9-bsp#n652
> 
> Interesting, 4.9 BSP has additional bit definition, which is not documented in 
> manual and 3.10 BSP to which I refer.
> 
> I was referring to 3.10 BSP, which uses only bit 14. I thought that you named 
> it differently.
> 
> > 
> > It would be nice to know what's really happening.
> > 
> > My output is:
> > 
> > [    0.832252] sun6i-rtc 7000000.rtc: registered as rtc0
> > [    0.832257] sun6i-rtc 7000000.rtc: RTC enabled
> > [    1.728968] sun6i-rtc 7000000.rtc: setting system clock to
> > 1970-01-01T00:00:07 UTC (7)
> 
> With change, I get same output.
> 
> > 
> > I think, you may have just enabled the auto switch feature, and running the
> > clock from low precision RC oscillator with your patch.
> 
> True, now I think there is no external crystal, but I'm still not sure how to 
> confirm that.

Visually?

That would explain why it doesn't work for you. The mainline RTC driver
disables auto-switch feature, and if your board doesn't have a crystal for LOSC,
RTC will not generate a clock for the RTC.

H6's dtsi describes by default a situatiuon with external 32k crystal
oscillator. See ext_osc32k node. That's incorrect for your board if it doesn't
have the crystal. You need to fix this in the DTS for your board instead of
patching the driver.

The driver has parent clock selection logic in case the LOSC crystal is not
used.

Your patch enables automatic detection of LOSC failure and RTC changes clock
to LOSC automatically, despite what's described in the DTS. That may fix the
issue, but is not the correct solution.

Registers on my board look like this (external 32k osc is used) for reference:

LOSC_CTRL_REG[7000000]: 8011
	KEY_FIELD                      ???                  (0)
	LOSC_AUTO_SWT_BYPASS           EN                   (1)
	LOSC_AUTO_SWT_EN               DIS                  (0)
	EXT_LOSC_EN                    EN                   (1)
	EXT_LOSC_GSM                   LOW                  (0)
	BATTERY_DIR                    DISCHARGE            (0)
	LOSC_SRC_SEL                   EXT32k               (1)

LOSC_AUTO_SWT_STA_REG[7000004]: 1
	EXT_LOSC_STA                   OK                   (0)
	LOSC_AUTO_SWT_PEND             NOEFF                (0)
	LOSC_SRC_SEL_STA               EXT32K               (1)

regards,
	o.

> > 
> > The real issue probably is that the mainline driver is missing this:
> > 
> > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=h6-4.9-bsp#n650
> > 
> 
> Not sure what you mean by that. ext vs. int source selection?



> Best regards,
> Jernej
> 
> > regards,
> > 	o.
