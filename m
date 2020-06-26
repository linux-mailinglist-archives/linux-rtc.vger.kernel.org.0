Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305F520BA69
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jun 2020 22:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgFZUis (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jun 2020 16:38:48 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:15237 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgFZUir (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jun 2020 16:38:47 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 66364240005;
        Fri, 26 Jun 2020 20:38:45 +0000 (UTC)
Date:   Fri, 26 Jun 2020 22:38:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] irqchip/atmel-aic5: add support for sam9x60 rtt
 fixup
Message-ID: <20200626203844.GT131826@piout.net>
References: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
 <1591779936-18577-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591779936-18577-2-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/06/2020 12:05:34+0300, Claudiu Beznea wrote:
> Add support for SAM9X60 RTT fixup.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/irqchip/irq-atmel-aic5.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
> index fc1b3a9cdafc..fb4ad2aaa727 100644
> --- a/drivers/irqchip/irq-atmel-aic5.c
> +++ b/drivers/irqchip/irq-atmel-aic5.c
> @@ -310,10 +310,16 @@ static void __init sama5d3_aic_irq_fixup(void)
>  	aic_common_rtc_irq_fixup();
>  }
>  
> +static void __init sam9x60_aic_irq_fixup(void)
> +{
> +	aic_common_rtc_irq_fixup();
> +	aic_common_rtt_irq_fixup();
> +}
> +
>  static const struct of_device_id aic5_irq_fixups[] __initconst = {
>  	{ .compatible = "atmel,sama5d3", .data = sama5d3_aic_irq_fixup },
>  	{ .compatible = "atmel,sama5d4", .data = sama5d3_aic_irq_fixup },
> -	{ .compatible = "microchip,sam9x60", .data = sama5d3_aic_irq_fixup },
> +	{ .compatible = "microchip,sam9x60", .data = sam9x60_aic_irq_fixup },
>  	{ /* sentinel */ },
>  };
>  
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
