Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D376A6E6F9
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 15:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbfGSN4e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jul 2019 09:56:34 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35003 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbfGSN4e (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Jul 2019 09:56:34 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2B5C31BF207;
        Fri, 19 Jul 2019 13:56:31 +0000 (UTC)
Date:   Fri, 19 Jul 2019 15:56:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michael McCormick <michael.mccormick@enatel.net>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf85063: Add support for specifying the clkout
 frequency from device tree node.
Message-ID: <20190719135630.GD4012@piout.net>
References: <20190704022439.GA13102@michael-Latitude-5590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704022439.GA13102@michael-Latitude-5590>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 04/07/2019 14:24:39+1200, Michael McCormick wrote:
> Primarily this allows the clkout signal to be disabled and save some
> power when running off battery backup. However, all hardware implemented
> values are implemented. Uses default value of 32768Hz if node is not
> specified.
> 

the proper way of doing that is to register the clkout signal in the
common clock framework. You can hava a look at rtc-pcf8563.c or rtc-m41t80.c

> Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
> ---
>  drivers/rtc/rtc-pcf85063.c | 52 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 1afa6d9fa9fb..5c19381899ed 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -37,6 +37,9 @@
>  #define PCF85063_REG_CTRL2             0x01
>  #define PCF85063_CTRL2_AF              BIT(6)
>  #define PCF85063_CTRL2_AIE             BIT(7)
> +#define PCF85063_CTRL2_COF2            BIT(2)
> +#define PCF85063_CTRL2_COF1            BIT(1)
> +#define PCF85063_CTRL2_COF0            BIT(0)
> 
>  #define PCF85063_REG_OFFSET            0x02
>  #define PCF85063_OFFSET_SIGN_BIT       6       /* 2's complement sign bit */
> @@ -369,6 +372,51 @@ static int pcf85063_load_capacitance(struct pcf85063 *pcf85063,
>                                   PCF85063_REG_CTRL1_CAP_SEL, reg);
>  }
> 
> +static int pcf85063_set_clkout_mode(struct pcf85063 *pcf85063,
> +                                   const struct device_node *np)
> +{
> +       u32 load = 32768;
> +       u8 reg = 0;
> +
> +       of_property_read_u32(np, "clockout-frequency", &load);
> +       switch (load) {
> +       case 0:
> +               reg = PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1 |
> +                     PCF85063_CTRL2_COF0;
> +               break;
> +       case 1:
> +               reg = PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1;
> +               break;
> +       case 1024:
> +               reg = PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF0;
> +               break;
> +       case 2048:
> +               reg = PCF85063_CTRL2_COF2;
> +               break;
> +       case 4096:
> +               reg = PCF85063_CTRL2_COF1 | PCF85063_CTRL2_COF0;
> +               break;
> +       case 8192:
> +               reg = PCF85063_CTRL2_COF1;
> +               break;
> +       case 16384:
> +               reg = PCF85063_CTRL2_COF0;
> +               break;
> +       case 32768:
> +               reg = 0;
> +               break;
> +       default:
> +               dev_warn(&pcf85063->rtc->dev,
> +                       "Unknown clockout-frequency: %d. Assuming 32768", load);
> +               reg = 0;
> +               break;
> +       }
> +
> +       return regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
> +                                 PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1 |
> +                                 PCF85063_CTRL2_COF0, reg);
> +}
> +
>  static const struct pcf85063_config pcf85063a_config = {
>         .regmap = {
>                 .reg_bits = 8,
> @@ -443,6 +491,10 @@ static int pcf85063_probe(struct i2c_client *client)
>                 dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
>                          err);
> 
> +       err = pcf85063_set_clkout_mode(pcf85063, client->dev.of_node);
> +       if (err < 0)
> +               dev_warn(&client->dev, "failed to set clock out mode: %d", err);
> +
>         pcf85063->rtc->ops = &pcf85063_rtc_ops;
>         pcf85063->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>         pcf85063->rtc->range_max = RTC_TIMESTAMP_END_2099;
> --
> 2.17.1
> 
> 
> 
> **CONFIDENTIALITY STATEMENT**
> This message is intended for the sole use of the individual(s) and/or entity to whom it is addressed, and may contain information that is legally privileged, confidential, and exempt from disclosure under applicable law. If you are not the intended addressee, nor authorized to receive for the intended addressee, you are hereby notified that dissemination, distribution, copying or disclosure of this message is strictly prohibited. If you have received this message in error please immediately advise the sender by reply email, and delete the message.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
