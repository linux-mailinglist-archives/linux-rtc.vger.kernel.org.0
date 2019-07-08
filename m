Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66B72629C9
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 21:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404018AbfGHTla (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 15:41:30 -0400
Received: from mail-eopbgr60044.outbound.protection.outlook.com ([40.107.6.44]:33779
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729849AbfGHTl2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 8 Jul 2019 15:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkH5m3iSIewtejXfJB0AVlPrQZ7EbbpaVrxP1qM1uvA=;
 b=gS75YCi/I5cXqDQ2xYG9LTL6t736XW1KNoG01uChxxOeg1ppjSUlKSoGgj53q5nGVES5rvgV929AuQ3QEvO5gZlavBq9GoFeXBtvJhzMnebJenmpmpbK3HGVdmbNa3lVimrvse1F+HjOKGQNZAawhm0eG64g4ZrK4aeq2uJi4oY=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6478.eurprd04.prod.outlook.com (20.179.233.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 19:41:18 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::358c:d36c:4f8:db79]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::358c:d36c:4f8:db79%4]) with mapi id 15.20.2052.010; Mon, 8 Jul 2019
 19:41:18 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        Biwen Li <biwen.li@nxp.com>
Subject: RE: [PATCH 1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Thread-Topic: [PATCH 1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Thread-Index: AQHVMxw2m8cnvCq/tEOv9BwuKxz1oabBIqxQ
Date:   Mon, 8 Jul 2019 19:41:18 +0000
Message-ID: <VE1PR04MB6687A969B8C5C4755A2F6C9F8FF60@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190705101800.44561-1-biwen.li@nxp.com>
In-Reply-To: <20190705101800.44561-1-biwen.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1df20700-09c5-48ae-3cd1-08d703dc3f38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6478;
x-ms-traffictypediagnostic: VE1PR04MB6478:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB6478230724AC73372310D0638FF60@VE1PR04MB6478.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(102836004)(316002)(53546011)(9686003)(110136005)(6506007)(54906003)(476003)(30864003)(26005)(6306002)(966005)(186003)(33656002)(2501003)(25786009)(256004)(14444005)(6436002)(55016002)(446003)(11346002)(81166006)(68736007)(4326008)(6246003)(81156014)(7736002)(74316002)(486006)(76176011)(3846002)(305945005)(53936002)(7696005)(6116002)(99286004)(2906002)(8936002)(76116006)(71200400001)(66556008)(66446008)(478600001)(229853002)(64756008)(73956011)(66946007)(86362001)(66066001)(8676002)(5660300002)(66476007)(14454004)(2201001)(52536014)(71190400001)(2004002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6478;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +55Sz+M1m41HLIeza35yd2fImhIJ9HsSj7zSwGKr+9G8Gt+bjOcu/gu1cEHPlFCiJa5htYclM35nZnkDTWVhc9k3Ab+9KYoRTtBP31NnWDpGEMOi21QFynd6yfmLi6aLCNvwDkmj0UGfm9+1qAe2UUR9tmZowC1faXd6FhW4SKLX+u6YpCAtRsFlWagoV+Q+u2D/GOzAYS4ixGSNVIhDEhmKZXYkppWRPteg9Phb0ahLwM5lxfeHZuCVwECjfl9FuYQOeGvIH9Fz92oXM89WhKj/7paCfFE0BnCQrv4PVCdx54nQFkVLZcOq92h3nu6/IBdRNmQtae3Yj0ltC7Q68PSuUEA2Ve7yxZ0WUX9ey1cMlL7QZ61sj5eA4rPV3YFe0YXZGtQb03m//3FYGgHI+zJiZbNlq0PLp2uJefwurgc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df20700-09c5-48ae-3cd1-08d703dc3f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 19:41:18.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Friday, July 5, 2019 5:18 AM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Leo Li
> <leoyang.li@nxp.com>
> Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org; Xiaobo Xie
> <xiaobo.xie@nxp.com>; Jiafei Pan <jiafei.pan@nxp.com>; Ran Wang
> <ran.wang_1@nxp.com>; Biwen Li <biwen.li@nxp.com>
> Subject: [PATCH 1/2] rtc/fsl: add FTM alarm driver as the wakeup source
>=20
> For the paltforms including LS1012A, LS1021A, LS1028A, LS1043A, LS1046A,
> LS1088A, LS208xA that has the FlexTimer module, implementing alarm
> functions within RTC subsystem to wakeup the system when system going to
> sleep.
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/Kconfig             |  14 ++
>  drivers/rtc/Makefile            |   1 +
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 417
> ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 432 insertions(+)
>  create mode 100644 drivers/rtc/rtc-fsl-ftm-alarm.c
>=20
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig index 03b60d5..075=
8a08
> 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1313,6 +1313,20 @@ config RTC_DRV_IMXDI
>  	   This driver can also be built as a module, if so, the module
>  	   will be called "rtc-imxdi".
>=20
> +config RTC_DRV_FSL_FTM_ALARM
> +	tristate "Freescale FlexTimer alarm timer"
> +	depends on ARCH_LAYERSCAPE
> +	default y
> +	help
> +	   For the FlexTimer in LS1012A, LS1021A, LS1028A, LS1043A, LS1046A,
> +	   LS1088A, LS208xA, we can use FTM as the wakeup source.
> +
> +	   Say y here to enable FTM alarm support. The FTM alarm provides
> +	   alarm functions for wakeup system from deep sleep.
> +
> +	   This driver can also be built as a module, if so, the module
> +	   will be called "rtc-fsl-ftm-alarm".
> +
>  config RTC_DRV_MESON
>  	tristate "Amlogic Meson RTC"
>  	depends on (ARM && ARCH_MESON) || COMPILE_TEST diff --git
> a/drivers/rtc/Makefile b/drivers/rtc/Makefile index 9d997fa..5cccb07 1006=
44
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D rtc-
> hid-sensor-time.o
>  obj-$(CONFIG_RTC_DRV_HYM8563)	+=3D rtc-hym8563.o
>  obj-$(CONFIG_RTC_DRV_IMXDI)	+=3D rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_IMX_SC)	+=3D rtc-imx-sc.o
> +obj-$(CONFIG_RTC_DRV_FSL_FTM_ALARM)	+=3D rtc-fsl-ftm-alarm.o
>  obj-$(CONFIG_RTC_DRV_ISL12022)	+=3D rtc-isl12022.o
>  obj-$(CONFIG_RTC_DRV_ISL12026)	+=3D rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)	+=3D rtc-isl1208.o
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-al=
arm.c
> new file mode 100644 index 0000000..e4075f0
> --- /dev/null
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Freescale FlexTimer Module (FTM) alarm device driver.
> + *
> + * Copyright 2014 Freescale Semiconductor, Inc.
> + * Copyright 2019 NXP
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/fsl/ftm.h>
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +
> +#define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
> +
> +/*
> + * Select Fixed frequency clock as clock source
> + * of FlexTimer Module
> + */
> +#define FTM_SC_CLKS_FIXED_FREQ	0x02
> +
> +#define FIXED_FREQ_CLK		32000
> +#define MAX_FREQ_DIV		(1 << FTM_SC_PS_MASK)
> +#define MAX_COUNT_VAL		0xffff
> +
> +struct ftm_rtc {
> +	struct rtc_device *rtc_dev;
> +	void __iomem *base;
> +	bool endian;
> +	u32 alarm_freq;
> +};
> +
> +enum pmu_endian_type {
> +	BIG_ENDIAN,
> +	LITTLE_ENDIAN,
> +};
> +
> +/*
> + * rcpm (Run Control and Power Management)
> + * is another IP block,different IP block
> + * has different endianness,so add new element
> + * big_endian to struct rcpm_cfg.
> + */
> +struct rcpm_cfg {
> +	enum pmu_endian_type big_endian; /* Big/Little endian of PMU
> module */
> +	u32 flextimer_set_bit;	/* FTM is not powerdown during device
> sleep */
> +};
> +
> +static struct rcpm_cfg default_rcpm_cfg =3D {
> +	.big_endian =3D LITTLE_ENDIAN,
> +	.flextimer_set_bit =3D 0x4000,
> +};
> +
> +static struct rcpm_cfg ls1012a_rcpm_cfg =3D {
> +	.big_endian =3D BIG_ENDIAN,
> +	.flextimer_set_bit =3D 0x20000,
> +};
> +
> +static struct rcpm_cfg ls1021a_rcpm_cfg =3D {
> +	.big_endian =3D BIG_ENDIAN,
> +	.flextimer_set_bit =3D 0x20000,
> +};
> +
> +static struct rcpm_cfg ls1043a_rcpm_cfg =3D {
> +	.big_endian =3D BIG_ENDIAN,
> +	.flextimer_set_bit =3D 0x20000,
> +};
> +
> +static struct rcpm_cfg ls1046a_rcpm_cfg =3D {
> +	.big_endian =3D BIG_ENDIAN,
> +	.flextimer_set_bit =3D 0x20000,
> +};
> +
> +static struct rcpm_cfg ls1088a_rcpm_cfg =3D {
> +	.big_endian =3D LITTLE_ENDIAN,
> +	.flextimer_set_bit =3D 0x4000,
> +};
> +
> +static struct rcpm_cfg ls208xa_rcpm_cfg =3D {
> +	.big_endian =3D LITTLE_ENDIAN,
> +	.flextimer_set_bit =3D 0x4000,
> +};
> +
> +static struct rcpm_cfg ls1028a_rcpm_cfg =3D {
> +	.big_endian =3D LITTLE_ENDIAN,
> +	/*14th bit:FlexTimer1-4 are not powerdown during device sleep*/
> +	.flextimer_set_bit =3D 0x4000,
> +};
> +
> +static const struct of_device_id ippdexpcr_of_match[] =3D {
> +	{ .compatible =3D "fsl,ftm-alarm", .data =3D &default_rcpm_cfg},
> +	{ .compatible =3D "fsl,ls1012a-ftm-alarm", .data =3D &ls1012a_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls1021a-ftm-alarm", .data =3D &ls1021a_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls1043a-ftm-alarm", .data =3D &ls1043a_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls1046a-ftm-alarm", .data =3D &ls1046a_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls1088a-ftm-alarm", .data =3D &ls1088a_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls208xa-ftm-alarm", .data =3D &ls208xa_rcpm_cfg}=
,
> +	{ .compatible =3D "fsl,ls1028a-ftm-alarm", .data =3D &ls1028a_rcpm_cfg}=
,
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ippdexpcr_of_match);

How about reusing the ippdexpcr register setup from the RCPM driver submitt=
ed by Ran Wang?  https://lkml.org/lkml/2019/5/20/379
With that approach, we don't need to define and keep updating the bit defin=
ition for each SoC in the driver, but only need to define it in the device =
trees.

> +
> +static inline u32 rtc_readl(struct ftm_rtc *dev, u32 reg) {
> +	if (dev->endian)
> +		return ioread32be(dev->base + reg); /*big endianness*/
> +
> +	return ioread32(dev->base + reg);
> +}
> +
> +static inline void rtc_writel(struct ftm_rtc *dev, u32 reg, u32 val) {
> +	if (dev->endian)
> +		iowrite32be(val, dev->base + reg);
> +	else
> +		iowrite32(val, dev->base + reg);
> +}
> +
> +static inline void ftm_counter_enable(struct ftm_rtc *rtc) {
> +	u32 val;
> +
> +	/* select and enable counter clock source */
> +	val =3D rtc_readl(rtc, FTM_SC);
> +	val &=3D ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> +	val |=3D (FTM_SC_PS_MASK |
> FTM_SC_CLK(FTM_SC_CLKS_FIXED_FREQ));
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_counter_disable(struct ftm_rtc *rtc) {
> +	u32 val;
> +
> +	/* disable counter clock source */
> +	val =3D rtc_readl(rtc, FTM_SC);
> +	val &=3D ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_irq_acknowledge(struct ftm_rtc *rtc) {
> +	unsigned int timeout =3D 100;
> +
> +	while ((FTM_SC_TOF & rtc_readl(rtc, FTM_SC)) && timeout--)
> +		rtc_writel(rtc, FTM_SC, rtc_readl(rtc, FTM_SC) &
> (~FTM_SC_TOF)); }
> +
> +static inline void ftm_irq_enable(struct ftm_rtc *rtc) {
> +	u32 val;
> +
> +	val =3D rtc_readl(rtc, FTM_SC);
> +	val |=3D FTM_SC_TOIE;
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_irq_disable(struct ftm_rtc *rtc) {
> +	u32 val;
> +
> +	val =3D rtc_readl(rtc, FTM_SC);
> +	val &=3D ~FTM_SC_TOIE;
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_reset_counter(struct ftm_rtc *rtc) {
> +	/*
> +	 * The CNT register contains the FTM counter value.
> +	 * Reset clears the CNT register. Writing any value to COUNT
> +	 * updates the counter with its initial value, CNTIN.
> +	 */
> +	rtc_writel(rtc, FTM_CNT, 0x00);
> +}
> +
> +static void ftm_clean_alarm(struct ftm_rtc *rtc) {
> +	ftm_counter_disable(rtc);
> +
> +	rtc_writel(rtc, FTM_CNTIN, 0x00);
> +	rtc_writel(rtc, FTM_MOD, ~0U);
> +
> +	ftm_reset_counter(rtc);
> +}
> +
> +static irqreturn_t ftm_rtc_alarm_interrupt(int irq, void *dev) {
> +	struct ftm_rtc *rtc =3D dev;
> +
> +	ftm_irq_acknowledge(rtc);
> +	ftm_irq_disable(rtc);
> +	ftm_clean_alarm(rtc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ftm_rtc_alarm_irq_enable(struct device *dev,
> +		unsigned int enabled)
> +{
> +	struct ftm_rtc *rtc =3D dev_get_drvdata(dev);
> +
> +	if (enabled)
> +		ftm_irq_enable(rtc);
> +	else
> +		ftm_irq_disable(rtc);
> +
> +	return 0;
> +}
> +
> +/*
> + * Note:
> + *	The function is not really getting time from the RTC
> + *	since FlexTimer is not a RTC device, but we need to
> + *	get time to setup alarm, so we are using system time
> + *	for now.
> + */
> +static int ftm_rtc_read_time(struct device *dev, struct rtc_time *tm) {
> +	struct timespec64 ts64;
> +	unsigned long local_time;
> +
> +	ktime_get_real_ts64(&ts64);
> +	local_time =3D (unsigned long)(ts64.tv_sec - (sys_tz.tz_minuteswest *
> +60));
> +
> +	rtc_time_to_tm(local_time, tm);
> +
> +	return 0;
> +}
> +static int ftm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm
> +*alm) {
> +	return 0;
> +}
> +
> +/*250Hz, 65536 / 250 =3D 262 second max*/ static int
> +ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm) {
> +	struct rtc_time tm;
> +	unsigned long now, alm_time, cycle;
> +	struct ftm_rtc *rtc =3D dev_get_drvdata(dev);
> +
> +	ftm_rtc_read_time(dev, &tm);
> +	rtc_tm_to_time(&tm, &now);
> +	rtc_tm_to_time(&alm->time, &alm_time);
> +
> +	ftm_clean_alarm(rtc);
> +	cycle =3D (alm_time - now) * rtc->alarm_freq;
> +	if (cycle > MAX_COUNT_VAL) {
> +		pr_err("Out of alarm range.\n");
> +		return -EINVAL;
> +	}
> +
> +	ftm_irq_disable(rtc);
> +
> +	/*
> +	 * The counter increments until the value of MOD is reached,
> +	 * at which point the counter is reloaded with the value of CNTIN.
> +	 * The TOF (the overflow flag) bit is set when the FTM counter
> +	 * changes from MOD to CNTIN. So we should using the cycle - 1.
> +	 */
> +	rtc_writel(rtc, FTM_MOD, cycle - 1);
> +
> +	ftm_counter_enable(rtc);
> +	ftm_irq_enable(rtc);
> +
> +	return 0;
> +
> +}
> +
> +static const struct rtc_class_ops ftm_rtc_ops =3D {
> +	.read_time		=3D ftm_rtc_read_time,
> +	.read_alarm		=3D ftm_rtc_read_alarm,
> +	.set_alarm		=3D ftm_rtc_set_alarm,
> +	.alarm_irq_enable	=3D ftm_rtc_alarm_irq_enable,
> +};
> +static int ftm_rtc_probe(struct platform_device *pdev) {
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct resource *r;
> +	int irq;
> +	int ret;
> +	struct rcpm_cfg *rcpm_cfg;
> +	u32 ippdexpcr; /* Store register's value
> +			* of IPPDEXPCRn from RCPM module
> +			*/
> +	const struct of_device_id *of_id;
> +	struct ftm_rtc *rtc;
> +	void __iomem *rcpm_ftm_addr;
> +
> +	of_id =3D of_match_node(ippdexpcr_of_match, np);
> +	if (!of_id) {
> +		pr_err("ftm: not have matched compatible id for
> ippdexpcr\n");
> +		return -ENODEV;
> +	}
> +
> +	rcpm_cfg =3D devm_kzalloc(&pdev->dev, sizeof(*rcpm_cfg),
> GFP_KERNEL);
> +	if (!rcpm_cfg)
> +		return -ENOMEM;
> +
> +	rcpm_cfg =3D (struct rcpm_cfg *)of_id->data;
> +
> +	/* Make FTM(IP) a wake-up source */
> +	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "pmctrl");
> +	if (r) {
> +		rcpm_ftm_addr =3D devm_ioremap_resource(&pdev->dev, r);
> +		if (IS_ERR(rcpm_ftm_addr)) {
> +			pr_err("ftm: cannot ioremap resource for
> rcpm_ftm_addr\n");
> +			return PTR_ERR(rcpm_ftm_addr);
> +		}
> +		if (rcpm_cfg->big_endian =3D=3D BIG_ENDIAN) {
> +			ippdexpcr =3D ioread32be(rcpm_ftm_addr) | rcpm_cfg-
> >flextimer_set_bit;
> +			iowrite32be(ippdexpcr, rcpm_ftm_addr);
> +
> +		} else {
> +			ippdexpcr =3D ioread32(rcpm_ftm_addr) | rcpm_cfg-
> >flextimer_set_bit;
> +			iowrite32(ippdexpcr, rcpm_ftm_addr);
> +		}
> +	}
> +
> +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (unlikely(!rtc)) {
> +		pr_err("ftm: cannot alloc memery for rtc\n");
> +		return -ENOMEM;
> +	}
> +
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!r) {
> +		pr_err("ftm: cannot get resource for rtc\n");
> +		return -ENODEV;
> +	}
> +
> +	rtc->base =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(rtc->base)) {
> +		pr_err("ftm: cannot ioremap resource for rtc\n");
> +		return PTR_ERR(rtc->base);
> +	}
> +
> +	irq =3D irq_of_parse_and_map(np, 0);
> +	if (irq <=3D 0) {
> +		pr_err("ftm: unable to get IRQ from DT, %d\n", irq);
> +		return -EINVAL;
> +	}
> +
> +	rtc->endian =3D of_property_read_bool(np, "big-endian");
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
> rtc);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request irq\n");
> +		return ret;
> +	}
> +
> +	rtc->alarm_freq =3D (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
> +
> +	ftm_clean_alarm(rtc);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	rtc->rtc_dev =3D devm_rtc_device_register(&pdev->dev, "ftm-alarm",
> +							&ftm_rtc_ops,
> +							THIS_MODULE);
> +	if (IS_ERR(rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "can't register rtc device\n");
> +		return PTR_ERR(rtc->rtc_dev);
> +	}
> +	return ret;
> +}
> +
> +static const struct of_device_id ftm_rtc_match[] =3D {
> +	{ .compatible =3D "fsl,ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1012a-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1021a-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1043a-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1046a-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1088a-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls208xa-ftm-alarm", },
> +	{ .compatible =3D "fsl,ls1028a-ftm-alarm", },
> +	{ },
> +};
> +
> +static struct platform_driver ftm_rtc_driver =3D {
> +	.probe		=3D ftm_rtc_probe,
> +	.driver		=3D {
> +		.name	=3D "ftm-alarm",
> +		.of_match_table =3D ftm_rtc_match,
> +	},
> +};
> +
> +static int __init ftm_alarm_init(void)
> +{
> +	return platform_driver_register(&ftm_rtc_driver);
> +}
> +
> +/***************
> + *Ensure that the driver is initialized after  *any real rtc driver  */
> +device_initcall_sync(ftm_alarm_init);
> +
> +MODULE_DESCRIPTION("NXP/Freescale FlexTimer alarm driver");
> +MODULE_AUTHOR("Biwen Li <biwen.li@nxp.com>");
> MODULE_LICENSE("GPL");
> --
> 2.7.4

