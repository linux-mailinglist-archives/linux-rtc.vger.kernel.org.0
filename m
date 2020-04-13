Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077041A6554
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Apr 2020 12:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgDMKq5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Apr 2020 06:46:57 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44217 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbgDMKq4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Apr 2020 06:46:56 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1FA72240004;
        Mon, 13 Apr 2020 10:46:52 +0000 (UTC)
Date:   Mon, 13 Apr 2020 12:46:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu.Beznea@microchip.com
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Message-ID: <20200413104652.GE3628@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/04/2020 08:51:12+0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 11.04.2020 01:26, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 10/04/2020 19:26:58+0300, Claudiu Beznea wrote:
> >> Add RTT.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >> ---
> >>  arch/arm/boot/dts/at91-sam9x60ek.dts | 5 +++++
> >>  arch/arm/boot/dts/sam9x60.dtsi       | 7 +++++++
> >>  2 files changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
> >> index ab3d2d9a420a..4020e79a958e 100644
> >> --- a/arch/arm/boot/dts/at91-sam9x60ek.dts
> >> +++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
> >> @@ -617,6 +617,11 @@
> >>       };
> >>  };
> >>
> >> +&rtt {
> >> +     atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> >> +     status = "okay";
> > 
> > Is there any point using a gpbr register while there is already a much
> > better RTC in the system?
> 
> Only to have it also enabled.
> 

Why would one use the RTT while the RTC is far superior?

> > 
> > In any case, this diff should be merge with the other at91-sam9x60ek.dts
> > change instead of being with the dtsi change.
> 
> The changes in this patch are related to enabling the RTT. The other dts
> change is related to enabling gpbr. The RTT uses that enabled gpbr -> one
> change per patch.
> 
> If you still want to merge then, I'll do it, but then it becomes mixed.
> 

This patch is already mixing add the gpbr in sam9x60ek and add the node
in sam9x60.dtsi which is worse.

Just have one patch adding the rtt node to the sam9x60.dtsi and then a
patch adding the RTT to sam9x60ek. Because the RTT uses the gpbr, it is
a good time to add enable the gpbr, this is a single functionnal change.

Let's say that for some reason, the RTT patch on sam9x60ek has to be
reverted, then the RTT node is still defined which is good for all the
other eventual users.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
