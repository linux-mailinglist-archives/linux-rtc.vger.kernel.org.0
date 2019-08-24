Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139579BDD4
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 14:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbfHXM4P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 08:56:15 -0400
Received: from vps.xff.cz ([195.181.215.36]:41732 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbfHXM4P (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 24 Aug 2019 08:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566651372; bh=/NrS6aEln0h6Nb+L6ubBa0Y4HHAw9yLpQ5MYGmF7ohk=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=jWLbiVYkns6Gqiqtu+08BKIDiA6ThnJFKCAcsPUWFABJZvgDcxScx4/DPJgrDoT3k
         zEP++TI3U08v2G8JtDKJbrCTI2zHxCgZrleIvLbMXwXmxlPMxm3hu6eL+CPslExgfT
         YXbL/KHjY1qq14+hymHaBRSVGJJfQGKRWDtXFq0s=
Date:   Sat, 24 Aug 2019 14:56:12 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 0/3] Add basic support for RTC on
 Allwinner H6 SoC
Message-ID: <20190824125612.zq5qsay2wv62wykt@core.my.home>
Mail-Followup-To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20190820151934.3860-1-megous@megous.com>
 <3686940.YHdMKP4MVq@jernej-laptop>
 <5421621.t8Lore9UF7@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5421621.t8Lore9UF7@jernej-laptop>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Sat, Aug 24, 2019 at 10:06:14AM +0200, Jernej Škrabec wrote:
> Dne sobota, 24. avgust 2019 ob 10:04:24 CEST je Jernej Škrabec napisal(a):
> > Hi!
> > 
> > Dne torek, 20. avgust 2019 ob 17:19:31 CEST je megous@megous.com napisal(a):
> > > From: Ondrej Jirman <megous@megous.com>
> > > 
> > > I went through the datasheets for H6 and H5, and compared the differences.
> > > RTCs are largely similar, but not entirely compatible. Incompatibilities
> > > are in details not yet implemented by the rtc driver though.
> > > 
> > > I also corrected the clock tree in H6 DTSI.
> > > 
> > > This patchset is necessary for implementing the WiFi/Bluetooth support
> > > on boards using H6 SoC.
> > > 
> > > There was some discussion previously of describing HOSC, DCXO and XO
> > > oscillators and clocks as part of RTC in DT, but I decided against it
> > > because it's not necessary, becuse information that would be provided
> > > as a part of DT can already be determined at runtime from RTC registers,
> > > so this woudn't add any value and would only introduce complications
> > > to the driver. See: https://patchwork.kernel.org/cover/10898083/
> > > 
> > > Please take a look.
> > > 
> > > 
> > > Thank you and regards,
> > > 
> > >   Ondrej Jirman
> > 
> > Sorry for a bit late test, but with your patches on Tanix TX6 box I get this
> > in dmesg:
> > 
> > [   17.431742] sun6i-rtc 7000000.rtc: Failed to set rtc time.
> > [   20.439742] sun6i-rtc 7000000.rtc: rtc is still busy.
> > [   21.435744] sun6i-rtc 7000000.rtc: rtc is still busy.
> > [   24.055741] sun6i-rtc 7000000.rtc: rtc is still busy.
> > [   24.439752] sun6i-rtc 7000000.rtc: rtc is still busy.
> > 
> > Last line is repeated non-stop.
> > 
> > Any idea what could be wrong?
> 
> Additional info - this is on kernel 5.2.6 with your patches applied.

Do you have schematics, or a FEX file for the board or any other info on how the
RTC is set up on that board?

Can you dump the RTC register range?

regards,
	o.

> Best regards,
> Jernej
> 
> 
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
