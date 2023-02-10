Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7260E6918FE
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Feb 2023 08:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjBJHLT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Feb 2023 02:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjBJHLS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Feb 2023 02:11:18 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5555AB30;
        Thu,  9 Feb 2023 23:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7THe+/UAyvyZ5BH3Q6XAZrwhulVvWLIO5YLpxfIcLxBgKoVRcaRH9Jsc8jhsK0pORoe6ywIKwyDEyax064w+H7tXvVYhPauScB6Q8mu5Deg6evDqlpD1HLN4lEtwrqFi3EzS0fJ7Oj0c29zEZ3Uis0XDrixFeUzlxTeFzrFPWNcA/YLHbVNXgsL/NGmLQoZMFkT6U+4Tz3H4Y4k1FGnfDqRmxRsaUssr6bOe4sNQYU1ZZ79D+oT+kgKjOvfgfIcTnyQfs4D9U7fBWaGgVAjFvtaf33I3hYgcOw+F5t56MLPXmqk482kjI+yltbP02y9txfaMHab121iO9pLV+E+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+0GJI+AEw2lDQ8poG2qxEAkMuDTSnwhRtIzbvCkyXI=;
 b=IOsLH1eztSSCA6MJFGKASJDYzGqmGNeck3UgIFTGw/lKwXzdj7ZYXOTUH4UzzWXtJp9cDtBoLf4ZIlKhS5H3wbs3eR/F9pkPE1p0/8jPhYtXvAfYhYQEvRRC1DC8kc2d5nNeuq0V5T4fAvn8Lf3ODbM0kdDEC8gAmUIx6li7N7C5hHp6OzFC2QV+D3PTodvL54pyJl/ZHNoXW4ghtPB+nkS+C8ZKYS6qhcVmMuSyys8W9Ticf99WFwEC10U9xNM4EpNnAehM5FpLB5OLlCO0mm0g2busQ9qwqoHsBhshDqATsXBnoAx5lLoaLhfarI8aSdv8rEsU9KJ/hbsEHfqRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+0GJI+AEw2lDQ8poG2qxEAkMuDTSnwhRtIzbvCkyXI=;
 b=P07ZwM0T8LrN2v0uoG71oPM9Zgo3eZ9/rriQyyuKf+Ohi8lVGhZ+x5yzckGvenJCAarlWy4db82b9oEw8B11erzKedz6c5sI3XQNP50jUYRYjwwet1rUSGv35zTXkgbjr0PVkxSjX/H1U0srVqzVCfam5r5rlW3v9nNzgg7DB4c=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 07:11:12 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%9]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 07:11:12 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Topic: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Index: AQHZM7BVQmQmSDLgeE+UyL+MR/UUUq69sBAAgAojM8A=
Date:   Fri, 10 Feb 2023 07:11:12 +0000
Message-ID: <AS8PR04MB86427768906FE2AD0D86A3F687DE9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
 <20230129070823.1945489-3-ping.bai@nxp.com> <Y91qeprAJSDckJ2e@google.com>
In-Reply-To: <Y91qeprAJSDckJ2e@google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM9PR04MB8384:EE_
x-ms-office365-filtering-correlation-id: f9672b13-b925-43e4-7a70-08db0b35fe25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WsaxEAQUWSEQHxZfpo1f5sUpi4ALwU8MQYx/jk5Q2gbHAap/ozLj8Bt8keGr3u6aenntnJK+9xspvNhLCYjF03+5ygSccP8xb5Pb1DHkCUK0hLEaF5AvT/vo2Uo+eVC/MPlrXXr9UOcKGGbgA0nhdswkHg6JqKJHprLoaFxYSTRb6dPgw26SZFTjhCrKPxectF5IvI66h9GUWwiWtbgh9LIUfKK1muC1gj81Dv1k3lmDJdvbBWcP714+Ney2MEv0VhmEavI12l2KsJKfbvu6j6GIemYB1gJleCEn17D8N0WyiLj2Ngq+IXLoE5vb28d78vW7jTF9sN3pMq/HukHfNFGAuZgrqzlWXK+tDfhDgKgeK8neAyx6v5fm3JQ+O0LudM+8DkUITwyIuuEbpaxVRzLf9lUb4RTnetjMs/3ePOLuS0lvuP3RsAmJQLuI4xw/qwKQ4aDYIiusl0lZtbtt2BAlgtaOucF83dYUaYfynBkAbl6OH5SfcksrhaB1BPAHXoA86bfacRufEVYzWwJmyG+uv06fOIy+MjM49NcPLSYghqdPZW6YDZhLm7XhBx7kIrOhm6598YmL+s9lB8XHYHKL5z0bknCunjwHna/zkjcXHjqeNSpd4U9HwqblUG5LpMC6SXz7glESqkpxQmttoB+AOdKN3TrPg/Z2lu+lK3BXJgiU7q6QvJhGh0xvyb2QAeR2lww5+Irh4sGlseN0Qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(33656002)(7696005)(8676002)(86362001)(4326008)(41300700001)(6916009)(52536014)(8936002)(5660300002)(7416002)(2906002)(38070700005)(122000001)(38100700002)(71200400001)(76116006)(66476007)(66556008)(66946007)(478600001)(66446008)(64756008)(55016003)(9686003)(83380400001)(316002)(186003)(6506007)(54906003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ESubRNLDUIVJ6YqZLKKFQSBnxjt8o9C0PzMA+ujXBMy8iA2REEHzL2QbLOCI?=
 =?us-ascii?Q?CfkOyaaT6eXes/22JaNeFyG2AovG3JKKB8pliw5l3Eb5OEGgH15nVNXmfWsl?=
 =?us-ascii?Q?bLP/WZPvUyWv2VB+fU6tPMhpw1yi8JVFVEBTHWdbG/h7SFspzS3+gbnLi58V?=
 =?us-ascii?Q?k8MkYXKekygoLCYw1XtyzPx3Bgl5aC1fhTSb2qhFjjxmy04Z8+9nPVLS9Qey?=
 =?us-ascii?Q?dwmXSDCwn6rGMLQ+E8IGB+w48N3oXn19nxssXu8Lw5aVYLf82wiUGvp3lLw4?=
 =?us-ascii?Q?Mg5YU6is+I8jXXUtcUexju8YUIA1V75T3j8Bs7MSlX7ae40rwh6xDO56Z4w4?=
 =?us-ascii?Q?2MJLabw2q/1Z9uNRz5sXZ9/uutDkq0ZEsCqNHQAagxBmGvEGnDSItxD/3aQj?=
 =?us-ascii?Q?xsLzsFNNMB8VV1P1lTu83079zcMf3ZHm4Uh0aTDda9IslZopj1pRJcMUdUAV?=
 =?us-ascii?Q?f+8cZQ+rvU4wVfzPVKvUaR4vjXuOFEQ7Zb1bXcvAwfH9HVCwJFCUfZVb3Krf?=
 =?us-ascii?Q?tRkTefqaEoLa51l2ri1XBUgOvM6IOe0kYls/NaiHPZ+gd8qQpEt69ksaTmQc?=
 =?us-ascii?Q?krt2NsE6GdsHu0HPf8xGSOtBNEm+3m05AwxJoUa3U89CR0/gJTaD49kfX3qm?=
 =?us-ascii?Q?iMOEeR5dVWYy7uX4uK1T/nEAjqpwK5YHXfm8xxaCNVtv7LNvK1C/R23PiAuf?=
 =?us-ascii?Q?zriE2wDWcA8FtQw54rkpDeQPAkGU/Pvypz9ox+ZeXyvOKio+iBhQemVbuknC?=
 =?us-ascii?Q?jPcPm8DArpj4bjfRPkEF7nP/DWkpPk5dVEn2RPS4hN2tElPcgohSbBpWiD34?=
 =?us-ascii?Q?Wek1WNW/TOuRtyyM6bLr5xXqykBl82t/4Z0pOUYtU0MVBYPQvyxYCC+X6/kN?=
 =?us-ascii?Q?Zng81G6XBB1tqHFzdfPK2KY4jzkI7SDf3fIN/u3N/qcSjpk5r06Svc4vQQen?=
 =?us-ascii?Q?PoN5SfoXfbcPeUUQqBH6yAiqrsSS/6N4a4ZC/aqU8H5vxmxZFxGIMRR2dgov?=
 =?us-ascii?Q?s/DP8OW7uDJgdrMAbnnMsBUBkiOsuvpDaPuAkzpwUT7+VY9WII1xI8/tQgVw?=
 =?us-ascii?Q?0yWH4az0rKYp+cwgQN155rx3Y0EWaayG56euHQ+QY6BREjkM+3T+AKOxOuCs?=
 =?us-ascii?Q?+C+VTOtMlXqwCgxqeWm+0PY8TQgP35F1Abp4hoiIl0zCDCvwAigSHsA9/dEG?=
 =?us-ascii?Q?S7ZsHRLGQeAGZzJRbc9y4nlIhjcR20K+RzpovGT5fMiCsK7+hOh18H3TCqq+?=
 =?us-ascii?Q?ctorW3+WqJN7FVxIRTehIDtuUXxt1088vGhtU5V6gVzpEbiSDiGaXQz93jyN?=
 =?us-ascii?Q?AR2hyyzHBhed+JMUXnfSxzlBTS8uX8ufvZhHXVloHzIOTRh6j5WTWr7vBafm?=
 =?us-ascii?Q?1iCQxYOguIE9Lz2ktmxuoUrOn5JL+zAfHOJJivdw0Fay+5pLA23v8celAJwZ?=
 =?us-ascii?Q?veklnhgRpP25wHO5whefm7keYe7853EiSWaSsvZj+3yfxn5TqO05jqbCC2jI?=
 =?us-ascii?Q?XFJfyxaIOHxYa2P3sWqqZxrdg9MURsGnxlUmtprcH940L3bJM5GWEQPXIx3w?=
 =?us-ascii?Q?RmG98zfmTCAIFhKF48s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9672b13-b925-43e4-7a70-08db0b35fe25
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 07:11:12.7942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqGgAHovNp7GEjiwEurTKlfQmM07/O+I4A0apOEGNs8bUbSDh0atu1v1q/ozYCBfvpbHJIOABKg4trZsXXivNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key
> support
>=20
> Hi Jacky,
>=20
> On Sun, Jan 29, 2023 at 03:08:21PM +0800, Jacky Bai wrote:
> > The ON/OFF logic inside the BBNSM allows for connecting directly into
> > a PMIC or other voltage regulator device. The module has an button
> > input signal and a wakeup request input signal. It also has two
> > interrupts (set_pwr_off_irq and set_pwr_on_irq) and an active-low PMIC
> > enable (pmic_en_b) output.
> >
> > Add the power key support for the ON/OFF button function found in
> > BBNSM module.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >   - v2 changes:
> >     - use device_property_read_u32() to read the property
> >     - clean up the goto return, return directly
> >     - sort the header file alphabetically
> >     - rename the file to add 'nxp' prefix
> >
> >   - v3 changes:
> >     - get the regmap directly from the parent node
> >
> >   - v4 changes:
> >     - update the compatible string to align with binding file
> >     - fix the device_property_read_u32 as stated in v2.
> >     - add back the 'dev_warn' for 'dev_pm_set_wake_irq' return fail.
> > ---
> >  drivers/input/keyboard/Kconfig            |  11 ++
> >  drivers/input/keyboard/Makefile           |   1 +
> >  drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 192
> > ++++++++++++++++++++++
>=20
> Majority of pwrkey drivers reside in dribers/input/misc, which
> drivers/input/keyboard intended for more traditional/full keyboards.
> Could you please move this driver there?
>=20

Sure, I will move it into misc.

> We should move snvs_pwrkey too...

Will do it in a separate patch.

>=20
>=20
> >  3 files changed, 204 insertions(+)
> >  create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> >
> > diff --git a/drivers/input/keyboard/Kconfig
> > b/drivers/input/keyboard/Kconfig index 84490915ae4d..43827e34f276
> > 100644
> > --- a/drivers/input/keyboard/Kconfig
> > +++ b/drivers/input/keyboard/Kconfig
> > @@ -456,6 +456,17 @@ config KEYBOARD_SNVS_PWRKEY
> >  	  To compile this driver as a module, choose M here; the
> >  	  module will be called snvs_pwrkey.
> >
> > +config KEYBOARD_BBNSM_PWRKEY
> > +	tristate "NXP BBNSM Power Key Driver"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	depends on OF
> > +	help
> > +	  This is the bbnsm powerkey driver for the NXP i.MX application
> > +	  processors.
> > +
> > +	  To compile this driver as a module, choose M here; the
> > +	  module will be called bbnsm_pwrkey.
> > +
> >  config KEYBOARD_IMX
> >  	tristate "IMX keypad support"
> >  	depends on ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/input/keyboard/Makefile
> > b/drivers/input/keyboard/Makefile index 5f67196bb2c1..e34dd65a34c3
> > 100644
> > --- a/drivers/input/keyboard/Makefile
> > +++ b/drivers/input/keyboard/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_KEYBOARD_AMIGA)		+=3D
> amikbd.o
> >  obj-$(CONFIG_KEYBOARD_APPLESPI)		+=3D applespi.o
> >  obj-$(CONFIG_KEYBOARD_ATARI)		+=3D atakbd.o
> >  obj-$(CONFIG_KEYBOARD_ATKBD)		+=3D atkbd.o
> > +obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+=3D nxp-bbnsm-pwrkey.o
> >  obj-$(CONFIG_KEYBOARD_BCM)		+=3D bcm-keypad.o
> >  obj-$(CONFIG_KEYBOARD_CAP11XX)		+=3D cap11xx.o
> >  obj-$(CONFIG_KEYBOARD_CLPS711X)		+=3D clps711x-keypad.o
> > diff --git a/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> > b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> > new file mode 100644
> > index 000000000000..154ce58b9d5a
> > --- /dev/null
> > +++ b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright 2022 NXP.
> > +
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/input.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_wakeirq.h>
> > +#include <linux/regmap.h>
> > +
> > +#define BBNSM_CTRL		0x8
> > +#define BBNSM_INT_EN		0x10
> > +#define BBNSM_EVENTS		0x14
> > +#define BBNSM_PAD_CTRL		0x24
> > +
> > +#define BBNSM_BTN_PRESSED	BIT(7)
> > +#define BBNSM_PWR_ON		BIT(6)
> > +#define BBNSM_BTN_OFF		BIT(5)
> > +#define BBNSM_EMG_OFF		BIT(4)
> > +#define BBNSM_PWRKEY_EVENTS	(BBNSM_PWR_ON |
> BBNSM_BTN_OFF | BBNSM_EMG_OFF)
> > +#define BBNSM_DP_EN		BIT(24)
> > +
> > +#define DEBOUNCE_TIME		30
> > +#define REPEAT_INTERVAL		60
> > +
> > +struct bbnsm_pwrkey {
> > +	struct regmap *regmap;
> > +	int irq;
> > +	int keycode;
> > +	int keystate;  /* 1:pressed */
> > +	struct timer_list check_timer;
> > +	struct input_dev *input;
> > +};
> > +
> > +static void bbnsm_pwrkey_check_for_events(struct timer_list *t) {
> > +	struct bbnsm_pwrkey *bbnsm =3D from_timer(bbnsm, t, check_timer);
> > +	struct input_dev *input =3D bbnsm->input;
> > +	u32 state;
> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &state);
> > +
> > +	state =3D state & BBNSM_BTN_PRESSED ? 1 : 0;
> > +
> > +	/* only report new event if status changed */
> > +	if (state ^ bbnsm->keystate) {
> > +		bbnsm->keystate =3D state;
> > +		input_event(input, EV_KEY, bbnsm->keycode, state);
> > +		input_sync(input);
> > +		pm_relax(bbnsm->input->dev.parent);
> > +	}
> > +
> > +	/* repeat check if pressed long */
> > +	if (state) {
> > +		mod_timer(&bbnsm->check_timer,
> > +			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
> > +	}
> > +}
> > +
> > +static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id) {
> > +	struct platform_device *pdev =3D dev_id;
> > +	struct bbnsm_pwrkey *bbnsm =3D platform_get_drvdata(pdev);
> > +	struct input_dev *input =3D bbnsm->input;
> > +	u32 event;
> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> > +	if (event & BBNSM_BTN_OFF)
> > +		mod_timer(&bbnsm->check_timer, jiffies +
> msecs_to_jiffies(DEBOUNCE_TIME));
> > +	else
> > +		return IRQ_NONE;
> > +
> > +	pm_wakeup_event(input->dev.parent, 0);
> > +
> > +	/* clear PWR OFF */
> > +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void bbnsm_pwrkey_act(void *pdata) {
> > +	struct bbnsm_pwrkey *bbnsm =3D pdata;
> > +
> > +	del_timer_sync(&bbnsm->check_timer);
>=20
> del_timer()/del_timer_sync() are deprecated. Please use
> timer_shutdown_sync() here.

Ok, will do it in V5.

>=20
> > +}
> > +
> > +static int bbnsm_pwrkey_probe(struct platform_device *pdev) {
> > +	struct bbnsm_pwrkey *bbnsm;
> > +	struct input_dev *input;
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	int error;
> > +
> > +	bbnsm =3D devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> > +	if (!bbnsm)
> > +		return -ENOMEM;
> > +
> > +	bbnsm->regmap =3D syscon_node_to_regmap(np->parent);
> > +	if (IS_ERR(bbnsm->regmap)) {
> > +		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
> > +		return PTR_ERR(bbnsm->regmap);
> > +	}
> > +
> > +	if (device_property_read_u32(&pdev->dev, "linux,code",
> &bbnsm->keycode)) {
> > +		bbnsm->keycode =3D KEY_POWER;
> > +		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
>=20
> This is a pretty cryptic message IMO. Maybe say "key code is not specifie=
d,
> using default KEY_POWER"?

Ok, will refine this log as you suggested.

>=20
> > +	}
> > +
> > +	bbnsm->irq =3D platform_get_irq(pdev, 0);
> > +	if (bbnsm->irq < 0)
> > +		return -EINVAL;
> > +
> > +	/* config the BBNSM power related register */
> > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, BBNSM_DP_EN,
> > +BBNSM_DP_EN);
> > +
> > +	/* clear the unexpected interrupt before driver ready */
> > +	regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS,
> BBNSM_PWRKEY_EVENTS,
> > +BBNSM_PWRKEY_EVENTS);
> > +
> > +	timer_setup(&bbnsm->check_timer, bbnsm_pwrkey_check_for_events,
> 0);
> > +
> > +	input =3D devm_input_allocate_device(&pdev->dev);
> > +	if (!input) {
> > +		dev_err(&pdev->dev, "failed to allocate the input device\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	input->name =3D pdev->name;
> > +	input->phys =3D "bbnsm-pwrkey/input0";
> > +	input->id.bustype =3D BUS_HOST;
> > +
> > +	input_set_capability(input, EV_KEY, bbnsm->keycode);
> > +
> > +	/* input customer action to cancel release timer */
> > +	error =3D devm_add_action(&pdev->dev, bbnsm_pwrkey_act, bbnsm);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "failed to register remove action\n");
> > +		return error;
> > +	}
> > +
> > +	bbnsm->input =3D input;
> > +	platform_set_drvdata(pdev, bbnsm);
> > +
> > +	error =3D devm_request_irq(&pdev->dev, bbnsm->irq,
> bbnsm_pwrkey_interrupt,
> > +			       IRQF_SHARED, pdev->name, pdev);
>=20
> Is this really a shared interrupt?

For current SoC integration, the ON/OFF power key IRQ signal are ORed toget=
her with RTC IRQ signal.
So these two functions share the same IRQ line to GIC. I think the IRQF_SHA=
RED flag is necessary, right? ^_^

BR
>=20
> > +	if (error) {
> > +		dev_err(&pdev->dev, "interrupt not available.\n");
> > +		return error;
> > +	}
> > +
> > +	error =3D input_register_device(input);
> > +	if (error < 0) {
> > +		dev_err(&pdev->dev, "failed to register input device\n");
> > +		return error;
> > +	}
> > +
> > +	device_init_wakeup(&pdev->dev, true);
> > +	error =3D dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > +	if (error)
> > +		dev_warn(&pdev->dev, "irq wake enable failed.\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id bbnsm_pwrkey_ids[] =3D {
> > +	{ .compatible =3D "nxp,imx93-bbnsm-pwrkey" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
> > +
> > +static struct platform_driver bbnsm_pwrkey_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "bbnsm_pwrkey",
> > +		.of_match_table =3D bbnsm_pwrkey_ids,
> > +	},
> > +	.probe =3D bbnsm_pwrkey_probe,
> > +};
> > +module_platform_driver(bbnsm_pwrkey_driver);
> > +
> > +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> > +MODULE_DESCRIPTION("NXP bbnsm power key Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.37.1
> >
>=20
> Thanks.
>=20
> --
> Dmitry
