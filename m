Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E25F33D392
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 13:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhCPMNA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 08:13:00 -0400
Received: from gecko.sbs.de ([194.138.37.40]:35590 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhCPMM1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 08:12:27 -0400
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 08:12:27 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12GC2r5I026410
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 13:02:53 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.68.191])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12GBqqrv026921;
        Tue, 16 Mar 2021 12:52:52 +0100
Date:   Tue, 16 Mar 2021 12:52:51 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Claudius Heine <ch@denx.de>,
        johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        "martin mantel" <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
Subject: Re: [PATCH v3 1/1] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <20210316125251.64484b3a@md1za8fc.ad001.siemens.net>
In-Reply-To: <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
        <20210316100805.2630481-2-ch@denx.de>
        <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Am Tue, 16 Mar 2021 13:30:36 +0200
schrieb Andy Shevchenko <andriy.shevchenko@intel.com>:

> On Tue, Mar 16, 2021 at 11:08:05AM +0100, Claudius Heine wrote:
> > From: Johannes Hahn <johannes-hahn@siemens.com>
> > 
> > This allows the RX6110 driver to be automatically assigned to the
> > right device on the I2C bus.  
> 
> Thanks for all effort!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> after addressing the below comments.
> 
> > Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> > Signed-off-by: Claudius Heine <ch@denx.de>  
> 
> > Signed-off-by: Henning Schild <henning.schild@siemens.com>  

Claudius, just remove that. I guess just add yours and mention authors
in the code if they should receive some recognition.

Henning

> I think this is somehow confusing. Either you need to add
> Co-developed-by of the corresponding people, or remove SoB (because
> of From line), i.o.w seems like Co-dB tag is needed for Johannes or
> you and something should be done with Henning's SoB.
> 
> > ---
> >  drivers/rtc/rtc-rx6110.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> > index 79161d4c6ce4..29bd697f82cb 100644
> > --- a/drivers/rtc/rtc-rx6110.c
> > +++ b/drivers/rtc/rtc-rx6110.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/of_gpio.h>
> >  #include <linux/regmap.h>
> >  #include <linux/rtc.h>  
> 
> > +#include <linux/acpi.h>  
> 
> Usually it's not needed if you leave IDs always to be compiled.
> Instead mod_devicetable.h is used. But it's all up to you and
> maintainer.
> 
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/spi/spi.h>
> > @@ -447,6 +448,14 @@ static int rx6110_i2c_probe(struct i2c_client
> > *client, return rx6110_probe(rx6110, &client->dev);
> >  }
> >  
> > +#ifdef CONFIG_ACPI
> > +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
> > +	{ "SECC6110", },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
> > +#endif
> > +
> >  static const struct i2c_device_id rx6110_i2c_id[] = {
> >  	{ "rx6110", 0 },
> >  	{ }
> > @@ -456,6 +465,9 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
> >  static struct i2c_driver rx6110_i2c_driver = {
> >  	.driver = {
> >  		.name = RX6110_DRIVER_NAME,
> > +#ifdef CONFIG_ACPI  
> 
> This is implied by the stub ACPI_PTR() macro for ACPI=n case.
> I.o.w drop this ugly and redundant ifdeffery.
> 
> > +		.acpi_match_table =
> > ACPI_PTR(rx6110_i2c_acpi_match), +#endif
> >  	},
> >  	.probe		= rx6110_i2c_probe,
> >  	.id_table	= rx6110_i2c_id,
> > -- 
> > 2.30.1
> >   
> 

