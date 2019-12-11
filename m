Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7BB11B8E3
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 17:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730575AbfLKQeA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 11:34:00 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43573 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfLKQeA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 11:34:00 -0500
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9670260015;
        Wed, 11 Dec 2019 16:33:58 +0000 (UTC)
Date:   Wed, 11 Dec 2019 17:33:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Subject: Re: [PATCH] rtc: pcf2127: default power management mode
Message-ID: <20191211163354.GC1463890@piout.net>
References: <20190910143945.9364-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910143945.9364-1-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 10/09/2019 16:39:45+0200, Bruno Thomsen wrote:
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 02b069caffd5..694ec8eefea5 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -37,6 +37,9 @@
>  #define PCF2127_BIT_CTRL3_BLF			BIT(2)
>  #define PCF2127_BIT_CTRL3_BF			BIT(3)
>  #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
> +#define PCF2127_BIT_CTRL3_PWRMNG0		BIT(5)
> +#define PCF2127_BIT_CTRL3_PWRMNG1		BIT(6)
> +#define PCF2127_BIT_CTRL3_PWRMNG2		BIT(7)
>  /* Time and date registers */
>  #define PCF2127_REG_SC			0x03
>  #define PCF2127_BIT_SC_OSF			BIT(7)
> @@ -484,10 +487,22 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	/*
>  	 * Disable battery low/switch-over timestamp and interrupts.
>  	 * Clear battery interrupt flags which can block new trigger events.
> +	 * Power management configuration:
> +	 * - Battery switch-over function is operating in standard mode.
> +	 *   Hardware has to ensure VDD drops slower than 0.7 V/ms otherwise
> +	 *   oscillator stop can occur. Since switch-over threshold is typical
> +	 *   2.5 V and sampled every 1 ms with a power management operating
> +	 *   limit of 1.8 V. See NXP AN11186 for more info.
> +	 * - Battery low detection function is enabled.
> +	 * - Extra power fail detection function is enabled.
> +	 *
>  	 * Note: This is the default chip behaviour but added to ensure
>  	 * correct tamper timestamp and interrupt function.
>  	 */
>  	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> +				 PCF2127_BIT_CTRL3_PWRMNG2 |
> +				 PCF2127_BIT_CTRL3_PWRMNG1 |
> +				 PCF2127_BIT_CTRL3_PWRMNG0 |

I'm sorry for the late reply but you can't do that specifically because
setting those bits maybe be intentional and that would break existing
users.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
