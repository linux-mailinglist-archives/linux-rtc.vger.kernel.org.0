Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813F3441FF7
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Nov 2021 19:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhKASZy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Nov 2021 14:25:54 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:45027 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhKASZy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Nov 2021 14:25:54 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7F356240009;
        Mon,  1 Nov 2021 18:23:13 +0000 (UTC)
Date:   Mon, 1 Nov 2021 19:23:13 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Pavel Modilaynen <pavelmn@axis.com>
Cc:     Pavel Modilaynen <Pavel.Modilaynen@axis.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] rtc: rs5c372: Add support for trim configuration
Message-ID: <YYAwkZ0RmhyfSewe@piout.net>
References: <20211030225054.32114-1-pavel.modilaynen@axis.com>
 <20211030225054.32114-2-pavel.modilaynen@axis.com>
 <YX3N9b6P4w1kSGfp@piout.net>
 <6cc22970-fa11-ccb4-c155-62396a7e3890@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cc22970-fa11-ccb4-c155-62396a7e3890@axis.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 31/10/2021 11:29:12+0100, Pavel Modilaynen wrote:
> On 10/31/21 12:57 AM, Alexandre Belloni wrote:
> > Hello,
> > 
> > Please use the proper RTC interface by implementing .set_offset and
> > .read_offset.
> 
> I am not sure about .set/read_offset. It looks as runtime adjustment
> interface,
> however this Xtal trimming parameter is based on schematics and Xtal
> capacitance (datasheet parameter).
> It is found by calibration procedure based on RTC clock output (the
> procedure and calculation of trimming parameter is described in datasheets).
> So, I would like to say that this parameter is functionally close to
> "quartz-load-femtofarads" for rtc-pcf8523/pcf85063.
> 

quartz-load-femtofarads is for analog trimming which this RTC doesn't
have, both CD and CG are set to 10pF. .set/read_offset are for digital
trimming which is what you are configuring here. You definitively want
to be able to do that at runtime as you need to adjust for temperature
and ageing of the crystal (datasheet, page 14: "For those systems that
have temperature detection precision of clock function may be increased
by correcting clock error according to temperature fluctuations.")

> > 
> > On 31/10/2021 00:50:53+0200, Pavel Modilaynen wrote:
> > > From: Pavel Modilaynen <pavelmn@axis.com>
> > > 
> > > Add support for oscillation adjustment register RS5C372_REG_TRIM
> > > setting that is needed to accommodate for effective crystal
> > > capacitance.
> > > 
> > > Use optional property ricoh,trim that should contain
> > > raw value to setup this register. According to
> > > datasheets for RS5C372, R2025S/D, RV5C38[67] and R222[13]
> > > the value will be converted to a number of ticks that
> > > is to be subtracted or added when the second digits read
> > > 00, 20 or 40 seconds.
> > > 
> > > Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
> > > ---
> > >   drivers/rtc/rtc-rs5c372.c | 18 +++++++++++++++++-
> > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> > > index 80980414890c..3a2db0326669 100644
> > > --- a/drivers/rtc/rtc-rs5c372.c
> > > +++ b/drivers/rtc/rtc-rs5c372.c
> > > @@ -13,6 +13,7 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/module.h>
> > >   #include <linux/of_device.h>
> > > +#include <linux/of.h>
> > >   /*
> > >    * Ricoh has a family of I2C based RTCs, which differ only slightly from
> > > @@ -560,6 +561,8 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
> > >   {
> > >         unsigned char buf[2];
> > >         int addr, i, ret = 0;
> > > +     struct i2c_client *client = rs5c372->client;
> > > +     u8 trim = 0;
> > >         addr   = RS5C_ADDR(RS5C_REG_CTRL1);
> > >         buf[0] = rs5c372->regs[RS5C_REG_CTRL1];
> > > @@ -599,9 +602,22 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
> > >                 break;
> > >         }
> > > +     /* optional setup of xtal trimming */
> > > +     if (!of_property_read_u8(client->dev.of_node, "ricoh,trim", &trim)) {
> > > +             if (rs5c372->type != rtc_r2221tl && (trim & ~RS5C372_TRIM_MASK)) {
> > > +                     dev_warn(&client->dev, "Erroneous setting for ricoh,trim in devicetree\n");
> > > +             } else {
> > > +                     int addr = RS5C_ADDR(RS5C372_REG_TRIM);
> > > +                     int ret = i2c_smbus_write_byte_data(client, addr, trim);
> > > +
> > > +                     if (unlikely(ret < 0))
> > > +                             return ret;
> > > +             }
> > > +     }
> > > +
> > >         for (i = 0; i < sizeof(buf); i++) {
> > >                 addr = RS5C_ADDR(RS5C_REG_CTRL1 + i);
> > > -             ret = i2c_smbus_write_byte_data(rs5c372->client, addr, buf[i]);
> > > +             ret = i2c_smbus_write_byte_data(client, addr, buf[i]);
> > >                 if (unlikely(ret < 0))
> > >                         return ret;
> > >         }
> > > -- 
> > > 2.20.1
> > > 
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com <https://bootlin.com>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
