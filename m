Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4186C1A4963
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 19:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDJRlQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 13:41:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38333 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRlQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 13:41:16 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 445DBFF810;
        Fri, 10 Apr 2020 17:41:14 +0000 (UTC)
Date:   Fri, 10 Apr 2020 19:41:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] rtc: at91sam9: add microchip,sam9x60-rtt
Message-ID: <20200410174113.GZ3628@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-6-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586536019-12348-6-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This patch must come first. Also, the correct prefix is
dt-bindings: rtc:

On 10/04/2020 19:26:59+0300, Claudiu Beznea wrote:
> Add microchip,sam9x60-rtt to compatible list.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> index 6ae79d1843f3..b2f913ff6c69 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> @@ -1,7 +1,7 @@
>  Atmel AT91SAM9260 Real Time Timer
>  
>  Required properties:
> -- compatible: should be: "atmel,at91sam9260-rtt"
> +- compatible: should be: "atmel,at91sam9260-rtt" or "microchip,sam9x60-rtt"

If you had a fallback on atmel,at91sam9260-rtt, this would make merging
this series easier as this removes the need for 1/5 and 2/5.

I think 2/5 may be useful in the future but as far as the aic fixup
is concerned, both IPs are identical.

>  - reg: should encode the memory region of the RTT controller
>  - interrupts: rtt alarm/event interrupt
>  - clocks: should contain the 32 KHz slow clk that will drive the RTT block.
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
