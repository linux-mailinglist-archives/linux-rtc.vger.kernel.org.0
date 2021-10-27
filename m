Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D531343CEEB
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 18:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239909AbhJ0QsX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 12:48:23 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58337 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237657AbhJ0QsW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 12:48:22 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0E66120004;
        Wed, 27 Oct 2021 16:45:54 +0000 (UTC)
Date:   Wed, 27 Oct 2021 18:45:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <YXmCQnJTujtak+Qy@piout.net>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211014220524.9988-1-linkmauve@linkmauve.fr>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Emmanuel,

Thanks for the patch!

On 15/10/2021 00:05:24+0200, Emmanuel Gil Peyrot wrote:
> These three consoles share a device, the MX23L4005, which contains a
> clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> (similar to SPI) on channel 0, device 1.  This driver allows it to be
> used as a Linux RTC device, where time can be read and set.
> 
> The hardware also exposes two timers, one which shuts down the console
> and one which powers it on, but these aren’t supported currently.
> 
> On the Wii U, the counter bias is stored in a XML file, /config/rtc.xml,
> encrypted in the SLC (eMMC storage), using a proprietary filesystem.  In
> order to avoid having to implement all that, this driver assumes a
> bootloader will parse this XML file and write the bias into the SRAM, at
> the same location the other two consoles have it.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  drivers/rtc/Kconfig        |  10 ++
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-nintendo.c | 305 +++++++++++++++++++++++++++++++++++++

I'm not convinced this is a good name, seeing that the switch will
certainly not use this driver (neither is the snes mini).

>  3 files changed, 316 insertions(+)
>  create mode 100644 drivers/rtc/rtc-nintendo.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 914497abeef9..f2a15429e4b1 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1214,6 +1214,16 @@ config RTC_DRV_V3020
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-v3020.
>  
> +config RTC_DRV_NINTENDO
> +	tristate "Nintendo GameCube, Wii and Wii U RTC"
> +	depends on GAMECUBE || WII || WIIU || COMPILE_TEST

CONFIG_WIIU doesn't seem to exist or am I missing something?

> +	help
> +	  If you say yes here you will get support for the RTC subsystem
> +	  of the Nintendo GameCube, Wii and Wii U.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "rtc-nintendo".
> +
>  config RTC_DRV_WM831X
>  	tristate "Wolfson Microelectronics WM831x RTC"
>  	depends on MFD_WM831X
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2dd0dd956b0e..0c7c0e7d9637 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -108,6 +108,7 @@ obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
>  obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
>  obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
>  obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
> +obj-$(CONFIG_RTC_DRV_NINTENDO)	+= rtc-nintendo.o
>  obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
>  obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
>  obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
> diff --git a/drivers/rtc/rtc-nintendo.c b/drivers/rtc/rtc-nintendo.c
> new file mode 100644
> index 000000000000..11bea40ca13d
> --- /dev/null
> +++ b/drivers/rtc/rtc-nintendo.c

You have a bunch of checkpatch warnings, can you fix those?

> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nintendo GameCube, Wii and Wii U RTC driver
> + *
> + * This driver is for the MX23L4005, more specifically its real-time clock and
> + * SRAM storage.  The value returned by the RTC counter must be added with the
> + * offset stored in a bias register in SRAM (on the GameCube and Wii) or in
> + * /config/rtc.xml (on the Wii U).  The latter being very impractical to access
> + * from Linux, this driver assumes the bootloader has read it and stored it in
> + * SRAM like for the other two consoles.
> + *
> + * This device sits on a bus named EXI (which is similar to SPI), channel 0,
> + * device 1.  This driver assumes no other user of the EXI bus, which is
> + * currently the case but would have to be reworked to add support for other
> + * GameCube hardware exposed on this bus.
> + *
> + * Note that this device is very much not Y2k38 aware.
> + *
> + * References:
> + * - https://wiiubrew.org/wiki/Hardware/RTC
> + * - https://wiibrew.org/wiki/MX23L4005
> + *
> + * Copyright (C) 2018 rw-r-r-0644
> + * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> + *
> + * Based on rtc-gcn.c
> + * Copyright (C) 2004-2009 The GameCube Linux Team
> + * Copyright (C) 2005,2008,2009 Albert Herranz
> + * Based on gamecube_time.c from Torben Nielsen.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +
> +/* EXI registers */
> +#define EXICSR	0
> +#define EXICR	12
> +#define EXIDATA	16
> +
> +/* EXI register values */
> +#define EXICSR_DEV		0x380
> +	#define EXICSR_DEV1	0x100
> +#define EXICSR_CLK		0x070
> +	#define EXICSR_CLK_1MHZ	0x000
> +	#define EXICSR_CLK_2MHZ	0x010
> +	#define EXICSR_CLK_4MHZ	0x020
> +	#define EXICSR_CLK_8MHZ	0x030
> +	#define EXICSR_CLK_16MHZ 0x040
> +	#define EXICSR_CLK_32MHZ 0x050
> +#define EXICSR_INT		0x008
> +	#define EXICSR_INTSET	0x008
> +
> +#define EXICR_TSTART		0x001
> +#define EXICR_TRSMODE		0x002
> +	#define EXICR_TRSMODE_IMM 0x000
> +#define EXICR_TRSTYPE		0x00C
> +	#define EXICR_TRSTYPE_R	0x000
> +	#define EXICR_TRSTYPE_W	0x004
> +#define EXICR_TLEN		0x030
> +	#define EXICR_TLEN32	0x030
> +
> +/* EXI registers values to access the RTC */
> +#define RTC_EXICSR	(EXICSR_DEV1 | EXICSR_CLK_8MHZ | EXICSR_INTSET)
> +#define RTC_EXICR_W	(EXICR_TSTART | EXICR_TRSMODE_IMM | EXICR_TRSTYPE_W | EXICR_TLEN32)
> +#define RTC_EXICR_R	(EXICR_TSTART | EXICR_TRSMODE_IMM | EXICR_TRSTYPE_R | EXICR_TLEN32)
> +#define RTC_EXIDATA_W	0x80000000
> +
> +/* RTC registers */
> +#define RTC_COUNTER	0x20000000
> +#define RTC_SRAM	0x20000100
> +#define RTC_SRAM_BIAS	0x20000400
> +#define RTC_SNAPSHOT	0x20400000
> +#define RTC_ONTMR	0x21000000
> +#define RTC_OFFTMR	0x21000100
> +#define RTC_TEST0	0x21000400
> +#define RTC_TEST1	0x21000500
> +#define RTC_TEST2	0x21000600
> +#define RTC_TEST3	0x21000700
> +#define RTC_CONTROL0	0x21000C00
> +#define RTC_CONTROL1	0x21000D00
> +
> +struct nintendo_rtc_drvdata {
> +	void __iomem *iob;
> +	u32 rtc_bias;
> +};
> +
> +static u32 exi_read(void __iomem *iob, u32 reg)
> +{
> +	u32 data;
> +
> +	/* The spin loops here loop about 15~16 times each, so there is no need
> +	 * to use a more expensive sleep method. */
> +
> +	/* Write register offset */
> +	iowrite32be(RTC_EXICSR, iob + EXICSR);
> +	iowrite32be(reg, iob + EXIDATA);
> +	iowrite32be(RTC_EXICR_W, iob + EXICR);
> +	while (!(ioread32be(iob + EXICSR) & EXICSR_INTSET))
> +		cpu_relax();
> +
> +	/* Read data */
> +	iowrite32be(RTC_EXICSR, iob + EXICSR);
> +	iowrite32be(RTC_EXICR_R, iob + EXICR);
> +	while (!(ioread32be(iob + EXICSR) & EXICSR_INTSET))
> +		cpu_relax();
> +	data = ioread32be(iob + EXIDATA);
> +
> +	/* Clear channel parameters */
> +	iowrite32be(0, iob + EXICSR);
> +
> +	return data;
> +}
> +
> +static void exi_write(void __iomem *iob, u32 reg, u32 data)
> +{
> +	/* The spin loops here loop about 15~16 times each, so there is no need
> +	 * to use a more expensive sleep method. */
> +
> +	/* Write register offset */
> +	iowrite32be(RTC_EXICSR, iob + EXICSR);
> +	iowrite32be(reg | RTC_EXIDATA_W, iob + EXIDATA);
> +	iowrite32be(RTC_EXICR_W, iob + EXICR);
> +	while (!(ioread32be(iob + EXICSR) & EXICSR_INTSET))
> +		cpu_relax();
> +
> +	/* Write data */
> +	iowrite32be(RTC_EXICSR, iob + EXICSR);
> +	iowrite32be(data, iob + EXIDATA);
> +	iowrite32be(RTC_EXICR_W, iob + EXICR);
> +	while (!(ioread32be(iob + EXICSR) & EXICSR_INTSET))
> +		cpu_relax();
> +
> +	/* Clear channel parameters */
> +	iowrite32be(0, iob + EXICSR);
> +}
> +
> +static int nintendo_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	time64_t timestamp;
> +	struct nintendo_rtc_drvdata *d = dev_get_drvdata(dev);
> +
> +	/* Add the counter and the bias to obtain the timestamp */
> +	timestamp = exi_read(d->iob, RTC_COUNTER) + d->rtc_bias;
> +	rtc_time64_to_tm(timestamp, t);
> +
> +	return 0;
> +}
> +
> +static int nintendo_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	time64_t timestamp;
> +	struct nintendo_rtc_drvdata *d = dev_get_drvdata(dev);
> +
> +	/* Subtract the timestamp and the bias to obtain the counter value */
> +	timestamp = rtc_tm_to_time64(t);
> +	exi_write(d->iob, RTC_COUNTER, timestamp - d->rtc_bias);

As you are able to update RTC_COUNTER, I'm not sure why you actually
need rtc_bias.

> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops nintendo_rtc_ops = {
> +	.read_time      = nintendo_rtc_read_time,
> +	.set_time       = nintendo_rtc_set_time,
> +};
> +
> +#ifdef DEBUG
> +static void nintendo_rtc_dumpregs(void __iomem *iob)
> +{
> +	int i;
> +	u32 sram_addr = RTC_SRAM;
> +
> +	printk("RTC_COUNTER:  %08X\n", exi_read(iob, RTC_COUNTER));
> +	printk("RTC_SNAPSHOT: %08X\n", exi_read(iob, RTC_SNAPSHOT));
> +	printk("RTC_ONTMR:    %08X\n", exi_read(iob, RTC_ONTMR));
> +	printk("RTC_OFFTMR:   %08X\n", exi_read(iob, RTC_OFFTMR));
> +	printk("RTC_TEST0:    %08X\n", exi_read(iob, RTC_TEST0));
> +	printk("RTC_TEST1:    %08X\n", exi_read(iob, RTC_TEST1));
> +	printk("RTC_TEST2:    %08X\n", exi_read(iob, RTC_TEST2));
> +	printk("RTC_TEST3:    %08X\n", exi_read(iob, RTC_TEST3));
> +	printk("RTC_CONTROL0: %08X\n", exi_read(iob, RTC_CONTROL0));
> +	printk("RTC_CONTROL1: %08X\n", exi_read(iob, RTC_CONTROL1));
> +	printk("RTC_SRAM:\n");
> +	for(i = 0; i < 4; i++) {
> +		printk("%08X %08X %08X %08X\n",
> +		       exi_read(iob, sram_addr + 0x100 * 0),
> +		       exi_read(iob, sram_addr + 0x100 * 1),
> +		       exi_read(iob, sram_addr + 0x100 * 2),
> +		       exi_read(iob, sram_addr + 0x100 * 3));
> +		sram_addr += 0x400;

Something great to do would be to convert the driver to regmap, provding
custom regmap_read and regmap_write functions to access the EXI bus.
Then you'd get this directly in debugfs. And this could be split ou once
other drivers need access to the bus (I guess power/reset at some
point).

> +	}
> +}
> +#endif
> +
> +static int nintendo_rtc_read_offset_from_sram(struct nintendo_rtc_drvdata *d)
> +{
> +	struct device_node *np;
> +	int ret;
> +	struct resource res;
> +	void __iomem *hw_srnprot;
> +	u32 old;
> +
> +	np = of_find_compatible_node(NULL, NULL, "nintendo,latte-srnprot");
> +	if (!np) {
> +		pr_err("HW_SRNPROT not found\n");
> +		return -1;
> +	}
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret) {
> +		pr_err("no io memory range found\n");
> +		return -1;
> +	}
> +
> +	hw_srnprot = ioremap(res.start, resource_size(&res));
> +	old = ioread32be(hw_srnprot);
> +
> +	/* TODO: figure out why we use this magic constant.  I obtained it by
> +	 * reading the leftover value after boot, after IOSU already ran.
> +	 *
> +	 * On my Wii U, setting this register to 1 prevents the console from
> +	 * rebooting properly, so wiiubrew.org must be missing something.
> +	 *
> +	 * See https://wiiubrew.org/wiki/Hardware/Latte_registers
> +	 */
> +	if (old != 0x7bf)
> +		iowrite32be(0x7bf, hw_srnprot);
> +
> +#ifdef DEBUG
> +	nintendo_rtc_dumpregs(d->iob);
> +#endif
> +
> +	/* Get the offset from RTC SRAM.
> +	 *
> +	 * Its default location on the GameCube and on the Wii is in the SRAM,
> +	 * while on the Wii U the bootloader needs to fill it with the contents
> +	 * of /config/rtc.xml on the SLC (the eMMC).  We don’t do that from
> +	 * Linux since it requires implementing a proprietary filesystem and do
> +	 * file decryption, instead we require the bootloader to fill the same
> +	 * SRAM address as on previous consoles.
> +	 */
> +	d->rtc_bias = exi_read(d->iob, RTC_SRAM_BIAS);
> +
> +	/* Reset SRAM access to how it was before, our job here is done. */
> +	iowrite32be(old, hw_srnprot);
> +	iounmap(hw_srnprot);
> +
> +	return 0;
> +}
> +
> +static int nintendo_rtc_probe(struct platform_device *pdev) {
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	struct resource	*res;
> +	struct nintendo_rtc_drvdata *d;
> +	int ret;
> +
> +	d = devm_kzalloc(dev, sizeof(struct nintendo_rtc_drvdata), GFP_KERNEL);
> +	if (IS_ERR(d))
> +		return PTR_ERR(d);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	d->iob = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(d->iob))
> +		return PTR_ERR(d->iob);
> +
> +	ret = nintendo_rtc_read_offset_from_sram(d);
> +	if (ret)
> +		return ret;
> +	dev_dbg(dev, "SRAM bias: 0x%x", d->rtc_bias);
> +
> +	dev_set_drvdata(dev, d);
> +
> +	rtc = devm_rtc_device_register(dev, dev_name(dev), &nintendo_rtc_ops,
> +				       THIS_MODULE);
> +	if (IS_ERR(rtc))
> +		return PTR_ERR(rtc);

Please use devm_rtc_allocate_device and devm_rtc_register_device and set
the RTC range properly. You claim it is not Y2038 aware but it seems to
be a 32bit counter which means it will count up to year 2106 (the RTC
value is necessarily unsigned) so I guess you should also fix that
comment.

Ideally, you should also expose LOW_BATT from RTC_CONTROL0 using the
VL_READ ioctl as I'm guessing many console will start to have a depleted
battery.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nintendo_rtc_of_match[] = {
> +	{.compatible = "nintendo,latte-exi" },
> +	{.compatible = "nintendo,hollywood-exi" },
> +	{.compatible = "nintendo,flipper-exi" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nintendo_rtc_of_match);
> +
> +static struct platform_driver nintendo_rtc_driver = {
> +	.probe		= nintendo_rtc_probe,
> +	.driver		= {
> +		.name	= "rtc-nintendo",
> +		.of_match_table	= nintendo_rtc_of_match,
> +	},
> +};
> +module_platform_driver(nintendo_rtc_driver);
> +
> +MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
> +MODULE_DESCRIPTION("Nintendo GameCube, Wii and Wii U RTC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.33.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
