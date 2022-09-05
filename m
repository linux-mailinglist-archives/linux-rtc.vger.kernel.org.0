Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82B35AD524
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Sep 2022 16:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbiIEOiL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Sep 2022 10:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238424AbiIEOhY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Sep 2022 10:37:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845B941D13;
        Mon,  5 Sep 2022 07:36:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDC84B811DD;
        Mon,  5 Sep 2022 14:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56768C433D6;
        Mon,  5 Sep 2022 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662388567;
        bh=An4UJcU7szR3Q74XA+9r8uY9luGHA9rcsWpB4IpI8xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M0BH/8LicdfIdp6CNfq5JxKfhrZCzZPlwMXOjY9KnIl9DXY08fo84r+yWZKq3nm/K
         3MWlzzFKr/S/f1xdenqOsmAulXU5+THYWcSi0bkYbxOHqZpT3pNl6IQ+WXpLSZp/PU
         gN/a+hUOZzK0Rl47xVyfINqFv8fkRW+MnlnhjEQaY8G2/0BEs3EwXR9xNKS7XN3vwS
         WotvOQPqXnMEY+BNgwRsAe6h0w9x2Z994kdT4fZL8h2CKzjkQC7IcTB0jePWsyW00e
         Hpm/Z3KcPtGD306hsAZ3StMz4+eaYCfaTpLJ8LuJ3OcmBjnh12n95AEqwOTnlXgzO/
         YFeyoXk8AGJ8w==
Date:   Mon, 5 Sep 2022 15:35:57 +0100
From:   Lee Jones <lee@kernel.org>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     nm@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] MFD: TPS6594x: Add new PMIC device driver for
 TPS6594x chips
Message-ID: <YxYJTU55VgoVYoLO@google.com>
References: <20220812032242.564026-1-mranostay@ti.com>
 <20220812032242.564026-3-mranostay@ti.com>
 <YvX6sBMItZoAhLKe@google.com>
 <Yw5t4G6hbn+mSD8y@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yw5t4G6hbn+mSD8y@ubuntu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 30 Aug 2022, Matt Ranostay wrote:

> On Fri, Aug 12, 2022 at 08:01:04AM +0100, Lee Jones wrote:
> > On Thu, 11 Aug 2022, Matt Ranostay wrote:
> > 
> > > From: Keerthy <j-keerthy@ti.com>
> > > 
> > > The TPS6594x chip is a PMIC, and contains the following components:
> > > 
> > > - Regulators
> > > - GPIO controller
> > > - RTC
> > > 
> > > However initially only RTC is supported.
> > > 
> > > Signed-off-by: Keerthy <j-keerthy@ti.com>
> > > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > > ---
> > >  drivers/mfd/Kconfig          |  14 ++++
> > >  drivers/mfd/Makefile         |   1 +
> > >  drivers/mfd/tps6594x.c       | 121 +++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/tps6594x.h |  84 ++++++++++++++++++++++++
> > >  4 files changed, 220 insertions(+)
> > >  create mode 100644 drivers/mfd/tps6594x.c
> > >  create mode 100644 include/linux/mfd/tps6594x.h
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index abb58ab1a1a4..4845683ae1d0 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1547,6 +1547,20 @@ config MFD_TI_LP873X
> > >  	  This driver can also be built as a module. If so, the module
> > >  	  will be called lp873x.
> > >  
> > > +config MFD_TPS6594X
> > > +	tristate "TI TPS6594X Power Management IC"
> > > +	depends on I2C && OF
> > > +	select MFD_CORE
> > > +	select REGMAP_I2C
> > > +	help
> > > +	  If you say yes here then you get support for the TPS6594X series of
> > > +	  Power Management Integrated Circuits (PMIC).
> > > +	  These include voltage regulators, RTS, configurable
> > > +	  General Purpose Outputs (GPO) that are used in portable devices.
> > > +
> > > +	  This driver can also be built as a module. If so, the module
> > > +	  will be called tps6594x.
> > > +
> > >  config MFD_TI_LP87565
> > >  	tristate "TI LP87565 Power Management IC"
> > >  	depends on I2C && OF
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 858cacf659d6..7ff6a8a57d55 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -105,6 +105,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
> > >  obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
> > >  obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
> > >  obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
> > > +obj-$(CONFIG_MFD_TPS6594X)	+= tps6594x.o
> > >  obj-$(CONFIG_MENELAUS)		+= menelaus.o
> > >  
> > >  obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
> > > diff --git a/drivers/mfd/tps6594x.c b/drivers/mfd/tps6594x.c
> > > new file mode 100644
> > > index 000000000000..ff265b91db3e
> > > --- /dev/null
> > > +++ b/drivers/mfd/tps6594x.c
> > > @@ -0,0 +1,121 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Driver for tps6594x PMIC chips
> > > + *
> > > + * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
> > > + * Author: Keerthy <j-keerthy@ti.com>
> > > + */
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/mfd/tps6594x.h>
> > > +#include <linux/module.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +static const struct regmap_config tps6594x_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.max_register = TPS6594X_REG_MAX,
> > > +};
> > > +
> > > +static const struct mfd_cell tps6594x_cells[] = {
> > > +	{ .name = "tps6594x-gpio" },
> > > +	{ .name = "tps6594x-regulator" },
> > > +	{ .name = "tps6594x-rtc" },
> > > +};
> > 
> > Where are the device drivers for these?
> >
> 
> They currently don't exist. Would these need to be merged/developed
> before the acceptance of the mfd driver?

Yes, they would.

-- 
Lee Jones [李琼斯]
