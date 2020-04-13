Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D4C1A654B
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Apr 2020 12:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgDMKlg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Apr 2020 06:41:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34533 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbgDMKlg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Apr 2020 06:41:36 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EF8DB200005;
        Mon, 13 Apr 2020 10:41:32 +0000 (UTC)
Date:   Mon, 13 Apr 2020 12:41:32 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu.Beznea@microchip.com
Cc:     mark.rutland@arm.com, a.zummo@towertech.it, jason@lakedaemon.net,
        devicetree@vger.kernel.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
        robh+dt@kernel.org, tglx@linutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5/5] rtc: at91sam9: add microchip,sam9x60-rtt
Message-ID: <20200413104132.GD3628@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-6-git-send-email-claudiu.beznea@microchip.com>
 <20200410174113.GZ3628@piout.net>
 <fa6366a0-e1a7-a7b3-e743-2517437b2b3d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa6366a0-e1a7-a7b3-e743-2517437b2b3d@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/04/2020 08:50:02+0000, Claudiu.Beznea@microchip.com wrote:
> part of 1/5 is still necessary.
> 

indeed.

> Regarding the fallback to "atmel,at91sam9260-rtt" I am aware of that. I
> chose this approach because this IP is a bit different than the one with
> "atmel,at91sam9260-rtt" compatible, meaning it has a features that the old
> one has not. I'm talking about [1] which I cannot see on a SAM9G45 [2]
> where RTT IP uses "atmel,at91sam9260-rtt" as compatible.
> 
> Is true it may be necessary in the future when new features may be
> implemented. Taking this into account, would you like to get rid of the new
> compatible in code and keep it only in device tree?
> 

What I said is not that the new compatible is not necessary at all but
that it can be avoided in the aic code.

> [1]
> http://ww1.microchip.com/downloads/en/DeviceDoc/SAM9X60-Data-Sheet-DS60001579B.pdf#_OPENTOPIC_TOC_PROCESSING_d137e64502
> [2]
> http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-6438-32-bit-ARM926-Embedded-Microprocessor-SAM9G45_Datasheet.pdf
> 
> > 
> > I think 2/5 may be useful in the future but as far as the aic fixup
> > is concerned, both IPs are identical.
> > 
> >>  - reg: should encode the memory region of the RTT controller
> >>  - interrupts: rtt alarm/event interrupt
> >>  - clocks: should contain the 32 KHz slow clk that will drive the RTT block.
> >> --
> >> 2.7.4
> >>
> > 
> > --
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
