Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC55D72AD2
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2019 10:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfGXI54 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Jul 2019 04:57:56 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:40051 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfGXI54 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Jul 2019 04:57:56 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E7AEC4000D;
        Wed, 24 Jul 2019 08:57:53 +0000 (UTC)
Date:   Wed, 24 Jul 2019 10:57:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tbm@cyrius.com,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: kirkwood: ts219: disable the SoC's RTC
Message-ID: <20190724085753.GP24911@piout.net>
References: <20190723194505.28060-1-uwe@kleine-koenig.org>
 <20190723200321.GN24911@piout.net>
 <04efe868-ffaf-8b50-f52f-ce86aa2f3a38@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04efe868-ffaf-8b50-f52f-ce86aa2f3a38@kleine-koenig.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/07/2019 22:24:18+0200, Uwe Kleine-König wrote:
> On 7/23/19 10:03 PM, Alexandre Belloni wrote:
> > On 23/07/2019 21:45:05+0200, Uwe Kleine-König wrote:
> >> The internal RTC doesn't work, loading the driver only yields
> >>
> >> 	rtc-mv f1010300.rtc: internal RTC not ticking
> >>
> >> . So disable it.
> >>
> >> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> >> ---
> >>  arch/arm/boot/dts/kirkwood-ts219.dtsi | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/kirkwood-ts219.dtsi b/arch/arm/boot/dts/kirkwood-ts219.dtsi
> >> index a88eb22070a1..994cabcf4b51 100644
> >> --- a/arch/arm/boot/dts/kirkwood-ts219.dtsi
> >> +++ b/arch/arm/boot/dts/kirkwood-ts219.dtsi
> >> @@ -104,3 +104,11 @@
> >>  &pcie0 {
> >>  	status = "okay";
> >>  };
> >> +
> >> +&rtc {
> >> +	/*
> >> +	 * There is a s35390a available on the i2c bus, the internal rtc isn't
> >> +	 * working (probably no crystal assembled).
> >> +	 */
> >> +	status = "disabled";
> >> +};
> > 
> > You could also use the aliases to ensure rtc0 is the s35390a. This would
> > solve the initial issue.
> 
> What do you assume is my initial issue? Adding the alias doesn't make
> the above message disappear from the boot log.
> 

I overlooked that the rtc is not working at all (and I thought it only
needed some init in u-boot like the armada38x). Seems good to me then.



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
