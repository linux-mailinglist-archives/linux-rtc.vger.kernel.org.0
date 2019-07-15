Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A430F68496
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2019 09:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbfGOHsr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jul 2019 03:48:47 -0400
Received: from mail-eopbgr20049.outbound.protection.outlook.com ([40.107.2.49]:39001
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726948AbfGOHsr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 15 Jul 2019 03:48:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzy2IXOxWfIuJhOnRvU5plwoPT1FdnIvKm3Nb2ij2ODMrFA79DtSVqNTdVS/nE+WV1ZM8066jPaa8T0oa8+G5Muvw2GLFUVxPuGCznHMoq8Tfbti3f4zybYMBzw0D5LelwDyFA8uvaPNoA/z4oH/V8pcXDyIkhLH7MItYft9fvewwOTYUvRZwV8QmwEe6XdJ3IOpnkpnBj+O2/C8uitDElWYCY2r+2h3Gs0Rs+R42L5RgVxgYPvKM/XzFeYySqiR2TU3zjoEtcYzueVIxgWsnYt80auv0t2MUzN1GUn6UDeLN/GZ1Fvu4vYhqX/5BnexmVyvLloW8XpzUucB/ABO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwLHAtC93b+6gFtqlofBl+kbImbQexi66cq5ipQg72s=;
 b=LC3zCbyMBGS9BHFZN/Ch+3lrva/uFbfOW7ZFhdAQs7XyiFhNW5jf1ehevAY2OAlRLDO6uyLByM/8RVb6BLPzb4AF+6wXgSXADcKMvL0UAIEjJbOKLTrEZAqp/VQsa/1arDf2rHIT3d1YGfyrbHd7bpuEFvlroGHWXck0gIqFuBV3frOudvulKTZ/wkudBEsipapNImyAXdosxXheLsGIMIqY1+V9kQ9Q02uQOOd1ErByqSxMzpGYTdUFg6ix+1v/3IdRdHTufY/KCBDf0iG4HX3QbcJ/AhOj8UZ4U6Hu+e4/lF90SZdOc8iwucFZZ/y93ZYReaOHVlCoC4MiLOfrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwLHAtC93b+6gFtqlofBl+kbImbQexi66cq5ipQg72s=;
 b=UP0uGiHquY4R0AqgWj5oYPOgpnki70Cls9hJyXelaW3g+m7b9IivNFtrfZMvpXb4JESS7hdNMN8nG0RuXj8mSqDY6eWR+rY9JSjP/Gy7ojU/a3fDO15EQ+uMt24NWdaWBkq2rOlQcduW2IcXHQT1Pc6VRUSxOGmsD4XuR/mzJ+0=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4538.eurprd04.prod.outlook.com (52.135.134.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 07:48:36 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 07:48:36 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [EXT] Re: [v3,1/2] rtc/fsl: add FTM alarm driver as the wakeup
 source
Thread-Topic: [EXT] Re: [v3,1/2] rtc/fsl: add FTM alarm driver as the wakeup
 source
Thread-Index: AQHVN/eHsG2LuP6l8ECMTPX15gaoUKbJEvAAgAHyrzA=
Date:   Mon, 15 Jul 2019 07:48:35 +0000
Message-ID: <DB7PR04MB449082EBF037005EF97429458FCF0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190711143748.10808-1-biwen.li@nxp.com>
 <20190713212504.GE4732@piout.net>
In-Reply-To: <20190713212504.GE4732@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa04e0cd-1919-470c-dbb7-08d708f8d7f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4538;
x-ms-traffictypediagnostic: DB7PR04MB4538:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB7PR04MB4538BF46CDF9DD690ADFB3788FCF0@DB7PR04MB4538.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(14444005)(256004)(8936002)(966005)(33656002)(99286004)(478600001)(76176011)(7696005)(14454004)(45080400002)(54906003)(316002)(66946007)(64756008)(66446008)(66556008)(76116006)(66476007)(446003)(26005)(6506007)(186003)(7736002)(6306002)(3846002)(6116002)(102836004)(68736007)(6436002)(6246003)(9686003)(53936002)(55016002)(2906002)(6916009)(229853002)(11346002)(44832011)(305945005)(52536014)(5660300002)(486006)(476003)(66066001)(4326008)(81166006)(86362001)(25786009)(8676002)(81156014)(74316002)(30864003)(71190400001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4538;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NnSILWrfEmzIIpD/AfGFUGrCxuEECRtlkY19S7ehAoE68nl+8pohKscejXI5UdRqDlE637GpIDhMhD9p1Bqon4IrnSDxFVePTu6aLRwi1siRCSYQp1xGRhuiFPiIEROp4DHLb3xsF6szTf+oagumoGaIZhbdwVltvY806tXFs+RdjIgIWoxGbDRiXnjPxHg2qSpXDuwrfOHyVDvXcS5zHGmiCz7lRa/3cc2SE2dvW5KFuGYR/2qk9/sskB5Ips3qy67kPmFPAfAcGt2KrEOTkVVCtsWqV/IR1qgsLAnVXirvD0R8dHgI3787xq4lZeqLc9i/KuqT3Swj9oBq5YOlvFE970ics85vovpDZCEiPEoYA5/YPKCBm4ZqfXzrOaqk6J5qCvoA/k41FexC+bPu9uaXEv8xFTjYMfg9gW8+4HU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa04e0cd-1919-470c-dbb7-08d708f8d7f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 07:48:35.9447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4538
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


> Hi,
>=20
> On 11/07/2019 22:37:48+0800, Biwen Li wrote:
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile index
> > 9d997fa..5cccb07 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -79,6 +79,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D
> rtc-hid-sensor-time.o
> >  obj-$(CONFIG_RTC_DRV_HYM8563)        +=3D rtc-hym8563.o
> >  obj-$(CONFIG_RTC_DRV_IMXDI)  +=3D rtc-imxdi.o
> >  obj-$(CONFIG_RTC_DRV_IMX_SC) +=3D rtc-imx-sc.o
> > +obj-$(CONFIG_RTC_DRV_FSL_FTM_ALARM)  +=3D rtc-fsl-ftm-alarm.o
>=20
> This file is sorted alphabetically.
I will correct it in v4.
>=20
> >  obj-$(CONFIG_RTC_DRV_ISL12022)       +=3D rtc-isl12022.o
> >  obj-$(CONFIG_RTC_DRV_ISL12026)       +=3D rtc-isl12026.o
> >  obj-$(CONFIG_RTC_DRV_ISL1208)        +=3D rtc-isl1208.o
> > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > b/drivers/rtc/rtc-fsl-ftm-alarm.c new file mode 100644 index
> > 0000000..4fd0d6b
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > @@ -0,0 +1,347 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Freescale FlexTimer Module (FTM) alarm device driver.
> > + *
> > + * Copyright 2014 Freescale Semiconductor, Inc.
> > + * Copyright 2019 NXP
> > + *
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/module.h>
> > +#include <linux/fsl/ftm.h>
> > +#include <linux/rtc.h>
> > +#include <linux/time.h>
> > +
> > +#define FTM_SC_CLK(c)                ((c) <<
> FTM_SC_CLK_MASK_SHIFT)
> > +
> > +/*
> > + * Select Fixed frequency clock (32KHz) as clock source
> > + * of FlexTimer Module
> > + */
> > +#define FTM_SC_CLKS_FIXED_FREQ       0x02
> > +#define FIXED_FREQ_CLK               32000
> > +
> > +/* Select 128 (2^7) as divider factor */
> > +#define MAX_FREQ_DIV         (1 << FTM_SC_PS_MASK)
> > +
> > +/* Maximum counter value in FlexTimer's CNT registers */
> > +#define MAX_COUNT_VAL                0xffff
> > +
> > +struct ftm_rtc {
> > +     struct rtc_device *rtc_dev;
> > +     void __iomem *base;
> > +     bool big_endian;
> > +     u32 alarm_freq;
> > +};
> > +
> > +static inline u32 rtc_readl(struct ftm_rtc *dev, u32 reg) {
> > +     if (dev->big_endian)
> > +             return ioread32be(dev->base + reg);
> > +     else
> > +             return ioread32(dev->base + reg); }
> > +
> > +static inline void rtc_writel(struct ftm_rtc *dev, u32 reg, u32 val)
> > +{
> > +     if (dev->big_endian)
> > +             iowrite32be(val, dev->base + reg);
> > +     else
> > +             iowrite32(val, dev->base + reg); }
> > +
> > +static inline void ftm_counter_enable(struct ftm_rtc *rtc) {
> > +     u32 val;
> > +
> > +     /* select and enable counter clock source */
> > +     val =3D rtc_readl(rtc, FTM_SC);
> > +     val &=3D ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> > +     val |=3D (FTM_SC_PS_MASK |
> FTM_SC_CLK(FTM_SC_CLKS_FIXED_FREQ));
> > +     rtc_writel(rtc, FTM_SC, val);
> > +}
> > +
> > +static inline void ftm_counter_disable(struct ftm_rtc *rtc) {
> > +     u32 val;
> > +
> > +     /* disable counter clock source */
> > +     val =3D rtc_readl(rtc, FTM_SC);
> > +     val &=3D ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> > +     rtc_writel(rtc, FTM_SC, val);
> > +}
> > +
> > +static inline void ftm_irq_acknowledge(struct ftm_rtc *rtc) {
> > +     unsigned int timeout =3D 100;
> > +
> > +     /*
> > +      *Fix errata A-007728 for flextimer
> > +      *      If the FTM counter reaches the FTM_MOD value between
> > +      *      the reading of the TOF bit and the writing of 0 to
> > +      *      the TOF bit, the process of clearing the TOF bit
> > +      *      does not work as expected when FTMx_CONF[NUMTOF] !=3D 0
> > +      *      and the current TOF count is less than
> FTMx_CONF[NUMTOF].
> > +      *      If the above condition is met, the TOF bit remains set.
> > +      *      If the TOF interrupt is enabled (FTMx_SC[TOIE] =3D 1),the
> > +      *      TOF interrupt also remains asserted.
> > +      *
> > +      *      Above is the errata discription
> > +      *
> > +      *      In one word: software clearing TOF bit not works when
> > +      *      FTMx_CONF[NUMTOF] was seted as nonzero and FTM
> counter
> > +      *      reaches the FTM_MOD value.
> > +      *
> > +      *      The workaround is clearing TOF bit until it works
> > +      *      (FTM counter doesn't always reache the FTM_MOD anyway),
> > +      *      which may cost some cycles.
> > +      */
> > +     while ((FTM_SC_TOF & rtc_readl(rtc, FTM_SC)) && timeout--)
> > +             rtc_writel(rtc, FTM_SC, rtc_readl(rtc, FTM_SC) &
> > +(~FTM_SC_TOF)); }
> > +
> > +static inline void ftm_irq_enable(struct ftm_rtc *rtc) {
> > +     u32 val;
> > +
> > +     val =3D rtc_readl(rtc, FTM_SC);
> > +     val |=3D FTM_SC_TOIE;
> > +     rtc_writel(rtc, FTM_SC, val);
> > +}
> > +
> > +static inline void ftm_irq_disable(struct ftm_rtc *rtc) {
> > +     u32 val;
> > +
> > +     val =3D rtc_readl(rtc, FTM_SC);
> > +     val &=3D ~FTM_SC_TOIE;
> > +     rtc_writel(rtc, FTM_SC, val);
> > +}
> > +
> > +static inline void ftm_reset_counter(struct ftm_rtc *rtc) {
> > +     /*
> > +      * The CNT register contains the FTM counter value.
> > +      * Reset clears the CNT register. Writing any value to COUNT
> > +      * updates the counter with its initial value, CNTIN.
> > +      */
> > +     rtc_writel(rtc, FTM_CNT, 0x00);
> > +}
> > +
> > +static void ftm_clean_alarm(struct ftm_rtc *rtc) {
> > +     ftm_counter_disable(rtc);
> > +
> > +     rtc_writel(rtc, FTM_CNTIN, 0x00);
> > +     rtc_writel(rtc, FTM_MOD, ~0U);
> > +
> > +     ftm_reset_counter(rtc);
> > +}
> > +
> > +static irqreturn_t ftm_rtc_alarm_interrupt(int irq, void *dev) {
> > +     struct ftm_rtc *rtc =3D dev;
> > +
> > +     ftm_irq_acknowledge(rtc);
> > +     ftm_irq_disable(rtc);
> > +     ftm_clean_alarm(rtc);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int ftm_rtc_alarm_irq_enable(struct device *dev,
> > +             unsigned int enabled)
> > +{
> > +     struct ftm_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +     if (enabled)
> > +             ftm_irq_enable(rtc);
> > +     else
> > +             ftm_irq_disable(rtc);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Note:
> > + *   The function is not really getting time from the RTC
> > + *   since FlexTimer is not a RTC device, but we need to
> > + *   get time to setup alarm, so we are using system time
> > + *   for now.
> > + */
> > +static int ftm_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +     struct timespec64 ts64;
> > +     unsigned long local_time;
> > +
> > +     ktime_get_real_ts64(&ts64);
> > +     local_time =3D (unsigned long)(ts64.tv_sec -
> > + (sys_tz.tz_minuteswest * 60));
>=20
> The RTC time is in UTC time, you should not care about the timezone here.
I will correct it in v4.
>=20
> > +
> > +     rtc_time_to_tm(local_time, tm);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ftm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm
> > +*alm) {
> > +     return 0;
> > +}
> > +
> > +/*
> > + * 1. Select fixed frequency clock (32KHz) as clock source;
> > + * 2. Select 128 (2^7) as divider factor;
> > + * So clock is 250 Hz (32KHz/128).
> > + *
> > + * 3. FlexTimer's CNT register is a 32bit register,
> > + * but the register's 16 bit as counter value,it's other 16 bit
> > + * is reserved.So minimum counter value is 0x0,maximum counter
> > + * value is 0xffff.
> > + * So max alarm value is 262 (65536 / 250) seconds  */ static int
> > +ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm) {
> > +     struct rtc_time tm;
> > +     unsigned long now, alm_time, cycle;
> > +     struct ftm_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +     ftm_rtc_read_time(dev, &tm);
> > +     rtc_tm_to_time(&tm, &now);
> > +     rtc_tm_to_time(&alm->time, &alm_time);
> > +
> > +     ftm_clean_alarm(rtc);
> > +     cycle =3D (alm_time - now) * rtc->alarm_freq;
> > +     if (cycle > MAX_COUNT_VAL) {
> > +             pr_err("Out of alarm range {0~262} seconds.\n");
> > +             return -EINVAL;
>=20
> Use -ERANGE here.
I will correct it in v4.
>=20
> > +     }
> > +
> > +     ftm_irq_disable(rtc);
> > +
> > +     /*
> > +      * The counter increments until the value of MOD is reached,
> > +      * at which point the counter is reloaded with the value of CNTIN=
.
> > +      * The TOF (the overflow flag) bit is set when the FTM counter
> > +      * changes from MOD to CNTIN. So we should using the cycle - 1.
> > +      */
> > +     rtc_writel(rtc, FTM_MOD, cycle - 1);
> > +
> > +     ftm_counter_enable(rtc);
> > +     ftm_irq_enable(rtc);
> > +
> > +     return 0;
> > +
> > +}
> > +
> > +static const struct rtc_class_ops ftm_rtc_ops =3D {
> > +     .read_time              =3D ftm_rtc_read_time,
> > +     .read_alarm             =3D ftm_rtc_read_alarm,
> > +     .set_alarm              =3D ftm_rtc_set_alarm,
> > +     .alarm_irq_enable       =3D ftm_rtc_alarm_irq_enable,
> > +};
> > +
> > +static int ftm_rtc_probe(struct platform_device *pdev) {
> > +     struct device_node *np =3D pdev->dev.of_node;
> > +     struct resource *r;
> > +     int irq;
> > +     int ret;
> > +     struct ftm_rtc *rtc;
> > +
> > +     rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +     if (unlikely(!rtc)) {
> > +             pr_err("ftm: cannot alloc memery for rtc\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, rtc);
> > +
> > +     r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!r) {
> > +             pr_err("ftm: cannot get resource for rtc\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     rtc->base =3D devm_ioremap_resource(&pdev->dev, r);
> > +     if (IS_ERR(rtc->base)) {
> > +             pr_err("ftm: cannot ioremap resource for rtc\n");
> > +             return PTR_ERR(rtc->base);
> > +     }
> > +
> > +     irq =3D irq_of_parse_and_map(np, 0);
> > +     if (irq <=3D 0) {
> > +             pr_err("ftm: unable to get IRQ from DT, %d\n", irq);
> > +             return -EINVAL;
> > +     }
> > +
> > +     rtc->big_endian =3D of_property_read_bool(np, "big-endian");
> > +
> > +     ret =3D devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt=
,
> > +                            IRQF_NO_SUSPEND,
> dev_name(&pdev->dev),
> > + rtc);
>=20
> There is a possible race condition here. As soon as devm_request_irq is c=
alled,
> the interrupt handler may be called leading to a null pointer dereference
> because rtc->rtc_dev is not yet allocated. Please use devm_rtc_allocate_d=
evice
> and rtc_register_device to solve that.
I will request irq after calling devm_rtc_device_register in v4.
>=20
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "failed to request irq\n");
> > +             return ret;
> > +     }
> > +
> > +     rtc->alarm_freq =3D (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
> > +
> > +     ftm_clean_alarm(rtc);
> > +
>=20
> Do you really need to remove the alarm here?
Needn't,register's value of flextimer is 0 when reset.I will remove it in v=
4.
>=20
> > +     device_init_wakeup(&pdev->dev, true);
> > +     rtc->rtc_dev =3D devm_rtc_device_register(&pdev->dev, "ftm-alarm"=
,
> > +
> &ftm_rtc_ops,
> > +
> THIS_MODULE);
> > +     if (IS_ERR(rtc->rtc_dev)) {
> > +             dev_err(&pdev->dev, "can't register rtc device\n");
> > +             return PTR_ERR(rtc->rtc_dev);
> > +     }
> > +     return ret;
> > +}
> > +
> > +static const struct of_device_id ftm_rtc_match[] =3D {
> > +     { .compatible =3D "fsl,ls1012a-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls1021a-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls1043a-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls1046a-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls1088a-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls208xa-ftm-alarm", },
> > +     { .compatible =3D "fsl,ls1028a-ftm-alarm", },
> > +     { },
> > +};
> > +
> > +static struct platform_driver ftm_rtc_driver =3D {
> > +     .probe          =3D ftm_rtc_probe,
> > +     .driver         =3D {
> > +             .name   =3D "ftm-alarm",
> > +             .of_match_table =3D ftm_rtc_match,
> > +     },
> > +};
> > +
> > +static int __init ftm_alarm_init(void) {
> > +     return platform_driver_register(&ftm_rtc_driver);
> > +}
> > +
> > +/*
> > + * Ensure that the driver is initialized after
> > + * any real rtc driver
> > + *   - The flextimer is not a real rtc device,
> > + *     it don't have time and date registers of rtc.
> > + *   - The flextimer rtc alarm driver gets time from wall time,
> > + *     but the wall time is not ready.so the time from the driver is w=
rong.
> > + *   - If system regist it before any other real rtc device,it will
> > + *     be emulated as rtc0,date command will read wrong time for user.
> > + */
> > +device_initcall_sync(ftm_alarm_init);
>=20
> No, please register that as a regular RTC driver and stop using RTC_HCTOS=
YS or
> use the DT aliases to ensure it is not used as the primary RTC.
I will register that as a regular RTC driver in v4.
>=20
> > +
> > +MODULE_DESCRIPTION("NXP/Freescale FlexTimer alarm driver");
> > +MODULE_AUTHOR("Biwen Li <biwen.li@nxp.com>");
> MODULE_LICENSE("GPL");
> > --
> > 2.7.4
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C4e834acfe10d4480c30
> 308d707d89428%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6986499109183286&amp;sdata=3DfPH%2BL%2Bp7tQOk8HmGZjd%2Bjj8r0s%2
> Bix9lD%2B9HWLXpuk2M%3D&amp;reserved=3D0
