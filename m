Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984DE322142
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 22:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhBVVVg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 16:21:36 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44567 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhBVVVf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Feb 2021 16:21:35 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 92EC9240004;
        Mon, 22 Feb 2021 21:20:45 +0000 (UTC)
Date:   Mon, 22 Feb 2021 22:20:45 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        kernel@collabora.com
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <YDQgLTPE0E+/1Cwv@piout.net>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-2-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. On systems using hardware
> watchdog it seems to likely trigger a lot earlier than configured.
> 
> The proper solution would be to describe this dependency in DT,
> but that will result in a deadlock. The kernel will see, that
> i.MX6 system clock needs the RTC clock and do probe deferral.
> But the i.MX6 I2C module never becomes usable without the i.MX6
> CKIL clock and thus the RTC's clock will not be probed. So from
> the kernel's perspective this is a chicken-and-egg problem.
> 

Reading the previous paragraph, I was going to suggest describing the
dependency and wondering whether this would cause a circular dependency.
I guess this will keep being an issue for clocks on an I2C or SPI bus...

> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case a kernel without this support has been booted.
> 
> The 'protected-clocks' property is already in use for some clocks
> that may not be touched because of firmware limitations and is
> described in Documentation/devicetree/bindings/clock/clock-bindings.txt.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt | 1 +
>  drivers/rtc/rtc-m41t80.c                             | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> index c746cb221210..ea4bbf5c4282 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> @@ -19,6 +19,7 @@ Optional properties:
>  - interrupts: rtc alarm interrupt.
>  - clock-output-names: From common clock binding to override the default output
>                        clock name
> +- protected-clocks: Bool, if set operating system should not handle clock.
>  - wakeup-source: Enables wake up of host system on alarm
>  
>  Example:
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 160dcf68e64e..3296583853a8 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -546,6 +546,9 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
>  	struct clk_init_data init;
>  	int ret;
>  
> +	if (of_property_read_bool(node, "protected-clocks"))
> +		return 0;
> +
>  	/* First disable the clock */
>  	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
>  	if (ret < 0)
> -- 
> 2.30.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
