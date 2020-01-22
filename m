Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E690145E5F
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 23:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgAVWHS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 17:07:18 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58607 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVWHS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 17:07:18 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 084E2FF806;
        Wed, 22 Jan 2020 22:07:15 +0000 (UTC)
Date:   Wed, 22 Jan 2020 23:07:15 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michael McCormick <michael.mccormick@enatel.net>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf85063: Add pcf85063 clkout control to common
 clock framework
Message-ID: <20200122220715.GB3392@piout.net>
References: <20190902043727.GA24684@michael-Latitude-5590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902043727.GA24684@michael-Latitude-5590>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

I'm sorry for the very late review, please Cc me on RTC patches.

It seems the patch has been mangled and tabs became spaces. Also, a few
alignments are off.

On 02/09/2019 16:37:27+1200, Michael McCormick wrote:
> Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
> ---
>  drivers/rtc/rtc-pcf85063.c | 153 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 1afa6d9fa9fb..f47d3a6b997d 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -9,6 +9,7 @@
>   * Copyright (C) 2019 Micro Crystal AG
>   * Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
>   */
> +#include <linux/clk-provider.h>
>  #include <linux/i2c.h>
>  #include <linux/bcd.h>
>  #include <linux/rtc.h>
> @@ -44,6 +45,16 @@
>  #define PCF85063_OFFSET_STEP0          4340
>  #define PCF85063_OFFSET_STEP1          4069
> 
> +#define PCF85063_REG_CLKO_F_MASK       0x07 /* frequency mask */
> +#define PCF85063_REG_CLKO_F_32768HZ    0x00
> +#define PCF85063_REG_CLKO_F_16384HZ    0x01
> +#define PCF85063_REG_CLKO_F_8192HZ     0x02
> +#define PCF85063_REG_CLKO_F_4096HZ     0x03
> +#define PCF85063_REG_CLKO_F_2048HZ     0x04
> +#define PCF85063_REG_CLKO_F_1024HZ     0x05
> +#define PCF85063_REG_CLKO_F_1HZ                0x06

Most of those defines are not used, I don't think they are necessary.

> +static int pcf85063_clkout_control(struct clk_hw *hw, bool enable)
> +{
> +       struct pcf85063 *pcf85063 = clkout_hw_to_pcf85063(hw);
> +       unsigned char buf;
> +
> +       if (enable)
> +               buf = PCF85063_REG_CLKO_F_32768HZ;

This doesn't work properly if the clock was already enabled and had a
proper rate already set. I think you need to read out the currently set
rate and update PCF85063_REG_CTRL2 only if PCF85063_REG_CLKO_F_OFF is
set.

> +       else
> +               buf = PCF85063_REG_CLKO_F_OFF;
> +
> +       return regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
> +                                 PCF85063_REG_CLKO_F_MASK, buf);
> +}
> +
> +static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
> +{
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       int ret;
> +
> +       /* disable the clkout output */
> +       ret = regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
> +                                PCF85063_REG_CLKO_F_MASK, PCF85063_REG_CLKO_F_OFF);

This has to be left to the common clock framework to figure that nothing
is using this clock and disable it. I guess this is the whole point of
this patch but you can't hardcode it here because this will introduce a
glitch for all the actual users of the clock.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
