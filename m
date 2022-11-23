Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C8E635628
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 10:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237574AbiKWJ1o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 04:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237722AbiKWJ0n (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 04:26:43 -0500
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D46E10AD31;
        Wed, 23 Nov 2022 01:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdNED/0vapJsqKbnGH/toUCMmBQVoRcZcY+fOlEIeLs7VX16qjB74BHNV7a9ySeq4ZlIQWvmffMQ5HXC5ur08kUn0CJrjf5mKj9Sq61z4VHPtSKBpdVYQAae4zEEE6XNQXUyzrGsb4Hhhx4+5/aMUWjLXRmTWq3pY9d+YrvdjEKSh6mcBMIgj5y3CfAIycmfYJmnvDLrl5VhTLSem9YXHvupFR33BfB/ElPSjbE3YRdyWiLXqZ/vIDcBzE+GEQdTLIKkn/IPTLuH0Lry1F33UzW1FQ/gIqgUqfjvBitq2iWmT9Nb6nLPZNMW6K+zQ7Y0ZpsnjtbiSAmbRBAm2/7cZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+vOVL1OCeGmKcaOxv7Htpt+sfeZNArvkscsnTgXnM4=;
 b=PJWomkH2bra9aiEIzMHtVl2DKj1ovX8b0D434MVXgd7kYat3N7frmR9fKYo3qsIrET8WxVUgGuCjTCC50cC3/Bm0bRriepkm1Zpkg3mEkHrN8jH9ZVtu/hhAogmprKDZDeVXAylBKDQGkI8jVLXxrUpztk/c2PAa5AHNb+PVnwnMdJp2ZXK4nIYHVqIYFatNGRYN607QwbhnuumEN6yhawK7RpVUdHVbaEOVahNOa8ZBJkShHzrmnSd13f8eHqhCOoLjROP5goJMjr/yl8N4j4jT1V2A6tgCv0SoMxn/FXR/Q9XUUuMeK6iRvOaE/IzgdNTH44NGSNtsKhzc/RbY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+vOVL1OCeGmKcaOxv7Htpt+sfeZNArvkscsnTgXnM4=;
 b=i+y5x/sZd/+BBSlh67nhQYLnWKQRvmeua8qcyo40KKQxcC+txbSslmaaRoy4LB2aD9u5owFYA3dB7nwq4BND04I1dAeZTX8ftHJLYjdXoDotT5++KKY1hXHy2KJDNLzdlD4ooxalF5FyyNJczi30obM/L4dmyePpecd43qEQsa8=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GV1PR04MB9133.eurprd04.prod.outlook.com (2603:10a6:150:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 09:25:36 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:25:36 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH 3/4] rtc: bbnsm: Add the bbnsm rtc support
Thread-Topic: [PATCH 3/4] rtc: bbnsm: Add the bbnsm rtc support
Thread-Index: AQHY/XWTwr7+mYTCz0WbOuiCO/IQkK5LQtyAgAD5ugA=
Date:   Wed, 23 Nov 2022 09:25:36 +0000
Message-ID: <AS8PR04MB86421844F24E09E98277AE56870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-4-ping.bai@nxp.com> <Y30Sk+ftJQ5XJQZF@mail.local>
In-Reply-To: <Y30Sk+ftJQ5XJQZF@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|GV1PR04MB9133:EE_
x-ms-office365-filtering-correlation-id: 7d92c54e-4cd4-48ee-fc0b-08dacd34adcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lm3oR0KRsq4unJxGB6K2EXV+ZbF99JS3cv2i9AkXptxbN5Sk7u+/cuur+aGmCoqZKQPMyZ37vXhZ0aZAye51736r9gVEN8AbkC56atxNXLaEJxI28PZ2cuRvjpTsF089g6LKcbJkrFOFkCsJ02FCULnuxa7uL7qBBHFyVLjOU0+OH4YsST0U+gc4tW7VzX9U7Al7IKjd25muR2ogPOS+hXfrdsqYUwHl9FhxHISe+2bxHd9g01NXFXfnXUF0aFlsxRZjgPGKn47LWV/bcqBdkXIp9Kx67ggGKbb0NMMUZwXR7pGCpF6enrGnJEFMdm3f/6ILz/zVweIf9enVY9EK8MV0ul3DHGKLAAyra8ku46H4BeFkkQwhPZbfhLn6VcpT9AHNVJvlcuLLNFwCMgVNWj0JxeSLHlbMKfE+nmzjgCyEQyyOMmh6eCwCNgiDLiaL0/SmOYSL9LJIMkR0x0SRS2VK54yYlIiP+g/DlJTQK6Fvl1r6i1fkUZf/Jz6FG+LrEO0mBIxrjgdB7hCiYoQNgIgWqoKJ1gJA9PqoBpnyoX6dCW2jKZbwZqLnjUymlF8jpBfYYsRaPCMUb84FM9R04GRJYnpjTvZSxjzoLp9BD2FQyYd3FKafk+li51nH0ps2WY8BndKs9xJPdkRfMbMYO5SFzBe38bW9rkAgF+K8V+zlbFOGMbfQGZbX0ZAydbqWDYe0MmezsnGJTLuFKA7Cxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(52536014)(6916009)(54906003)(7416002)(38070700005)(316002)(5660300002)(8936002)(186003)(76116006)(66446008)(86362001)(64756008)(66476007)(66556008)(8676002)(66946007)(4326008)(9686003)(478600001)(26005)(71200400001)(6506007)(7696005)(41300700001)(38100700002)(55016003)(83380400001)(122000001)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s94LAGGgHl7nBjEbudDihq3xuQL3r0tb6SkZGMFzVwEKaXVWuGlEeYA1li5I?=
 =?us-ascii?Q?PQmNH9g6a6sixgApw33k90ASXHUFwdPCOYXUNxgUELuGgY4iTWJWDIzJ9wq5?=
 =?us-ascii?Q?HWNZQIPX5qvXQVWWTttfixiEoAYhZGhFmyMVBe1lC7btDpRT3cMtqKaHGguW?=
 =?us-ascii?Q?B0D5sjtJRM+8a1YMKm/n9bXI3qXu/2X6ITz1X156kL64u5lINCKn9CrFg/wm?=
 =?us-ascii?Q?IUbhSEOee72Ss4lJw7CK9dJJA5wxJvwpUtY+rPI9VUffI9hjNaeNXv7N0hz3?=
 =?us-ascii?Q?hmGCBeXicjGpYdPz/1r1DjdrV/nkNs5c59t0sil5QOv06671+IFVk5GsexpP?=
 =?us-ascii?Q?f5KSHNVwA1KmD/qB0ho6YsNoXNrswp3qeSeHS5rJ8EVG74usbpkhkGLz3Xhz?=
 =?us-ascii?Q?D68pGqH2WDJD6AOqJU1ZjXftLQ2h1Aepy3RUkT0MoErslecBr3V6ETFbKVEO?=
 =?us-ascii?Q?2P+GIrSp1ANpkN9re0vt6SKCJkkRDr52aA45E2ZdxXRFp0e3FvOLPx4ygzpU?=
 =?us-ascii?Q?gjWARsi/mmE1lC8sH6vbudq/AvWgiu6nUA1xUeEPSdPMVbKgy195YBr6rpmX?=
 =?us-ascii?Q?9SCQ37p3LjPeXmX82MYcKzrNJe3Xil6IbfxkxZihL2MEEu8gL3PoICY8r5jD?=
 =?us-ascii?Q?rjAtgDvxt3eitAONEF+UJI0kwmatDCjeZkZ/gPNsv2oGpswy4J7o0ZL5l0Go?=
 =?us-ascii?Q?nfFoDJBdZT2HmQ1sirhBGCT/mabPmPvLZDmWG5MvLOoTnJrbYCJi428EvNRz?=
 =?us-ascii?Q?eVUhQwZ3iyWbui5qSbskldAgV/kXQ3VWCKPqKJj10Ef0mbOrjXB+T7upaRaZ?=
 =?us-ascii?Q?sostgWgo7HyRCCHS7PhVj5BWwlyxwRzDHLpzO8bg+Ve9d6XlYbC1a0fmyjWn?=
 =?us-ascii?Q?E8tmaHzpeCNyPgs3yHqusO2L/Xu26bxykY5D0Wqsi0EvU6OR8LoOsdFgrbIN?=
 =?us-ascii?Q?WhV3O3h/BI4iQ44dolyNo1MCdw7n7ektwgUIwxXMOcoQ6nbi5T1iu1u4D8PK?=
 =?us-ascii?Q?Cq3qzi8qnUmlLPsgvinxYVoUGo4VwZIaVwTHGCefRoV+sMtQdSWgNrFPv3Sk?=
 =?us-ascii?Q?tr7JOZlr+3dGTV3yZb+6RSfsrAgNnG0AkDwp3mYufBTsQHcoE/czUJzfFvkD?=
 =?us-ascii?Q?+RqVd2ae9f8qRLpde3+SjqGv/yDUXHAQpZem0yaHkWEGxIPlpiPekQAV2NQ2?=
 =?us-ascii?Q?HucAu2Qb9wyhOk655rql8gERkSvGI7wXKq/bkkj6NMBa1TCvK8p3YAti0m/S?=
 =?us-ascii?Q?k0WrPpo72wYzCdFoal7YeDXfZlTknCrBnCqILBYtRo9TBfO1nZ4giI9Vy4Zk?=
 =?us-ascii?Q?+HUXp3kxGxTEnY/i42ZSuWgu3BC8CKhuX9IceY1rC3GSQnywbbFEOAOXjoCI?=
 =?us-ascii?Q?6B29mJ+es8FQMOTHoIQPFbAG3HKLUt13Mhpn16fOG1J+dPe2UfnfOiaKfPBR?=
 =?us-ascii?Q?Ll+cv5IxLS/lW75rb9fNfG6BqiKPKbINGviibunuMZ9VlHo/LjNGgI6Z9VPt?=
 =?us-ascii?Q?MGyByeNYRfBu/Q8IpveNpT8Whw/TFg86Hd7EgI0N4fr2RkDA9qc4OKIENG0V?=
 =?us-ascii?Q?LKO87udUYimfC8qCYZM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d92c54e-4cd4-48ee-fc0b-08dacd34adcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 09:25:36.3698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcpN74oByQVCfnQGADnE34XIdshC5CgGdVqF76j3ZRNtJ4WdVhjJuLtwxEx7NMLVDtpy7XkCCEcVtIxXGAC2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9133
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH 3/4] rtc: bbnsm: Add the bbnsm rtc support
>=20
> On 21/11/2022 14:51:43+0800, Jacky Bai wrote:
> > The BBNSM module includes a real time counter with alarm.
> > Add a RTC driver for this function.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/rtc/Kconfig     |  12 +++
> >  drivers/rtc/Makefile    |   1 +
> >  drivers/rtc/rtc-bbnsm.c | 223
> > ++++++++++++++++++++++++++++++++++++++++
>=20
> I'd prefer that filename to include imx or mxc if this is only available =
on those
> SoCs.
>

For now, it is used on i.MX SoC, not sure if it will be used on NXP other S=
oC. I will
update the file name to include 'imx' in v2.

> > diff --git a/drivers/rtc/rtc-bbnsm.c b/drivers/rtc/rtc-bbnsm.c new
> > file mode 100644 index 000000000000..4157b238ed9a
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-bbnsm.c
> > @@ -0,0 +1,223 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright 2022 NXP.
> > +
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_wakeirq.h>
> > +#include <linux/rtc.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
>=20
> This list should be sorted alphabetically
>=20

Thx, will fix it in V2.

>=20
> > +
> > +#define BBNSM_CTRL	0x8
> > +#define BBNSM_INT_EN	0x10
> > +#define BBNSM_EVENTS	0x14
> > +#define BBNSM_RTC_LS	0x40
> > +#define BBNSM_RTC_MS	0x44
> > +#define BBNSM_TA	0x50
> > +
> > +#define RTC_EN		0x2
> > +#define RTC_EN_MSK	0x3
> > +#define TA_EN		(0x2 << 2)
> > +#define TA_DIS		(0x1 << 2)
> > +#define TA_EN_MSK	(0x3 << 2)
> > +#define RTC_INT_EN	0x2
> > +#define TA_INT_EN	(0x2 << 2)
> > +
> > +#define BBNSM_EVENT_TA	TA_EN
> > +
>=20
> I'm not clear why this define is needed

This define is for RTC alarm event status check, as it use the same bitfiel=
d offset as TA_EN,
I just did the above define. It seems introduce some unnecessary confusion.=
=20

>=20
> > +static irqreturn_t bbnsm_rtc_irq_handler(int irq, void *dev_id) {
> > +	struct device *dev =3D dev_id;
> > +	struct bbnsm_rtc  *bbnsm =3D dev_get_drvdata(dev);
> > +	u32 val;
> > +	u32 event =3D 0;
>=20
> You can rework this function to remove this variable because it is either=
 0 or
> RTC_AF | RTC_IRQF
>=20

Ok, will refine in V2.

> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &val);
> > +	if (val & BBNSM_EVENT_TA) {
> > +		event |=3D (RTC_AF | RTC_IRQF);
> > +		bbnsm_rtc_alarm_irq_enable(dev, false);
> > +		/* clear the alarm event */
> > +		regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, TA_EN_MSK,
> BBNSM_EVENT_TA);
> > +		rtc_update_irq(bbnsm->rtc, 1, event);
> > +	}
> > +
> > +	return event ? IRQ_HANDLED : IRQ_NONE; }
> > +
> > +static int bbnsm_rtc_probe(struct platform_device *pdev) {
> > +	struct bbnsm_rtc *bbnsm;
> > +	int ret;
> > +
> > +	bbnsm =3D devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> > +	if (!bbnsm)
> > +		return -ENOMEM;
> > +
> > +	bbnsm->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > +
> > +	bbnsm->regmap =3D
> syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
> > +	if (IS_ERR(bbnsm->regmap)) {
> > +		dev_err(&pdev->dev, "bbnsm get regmap failed\n");
> > +		return PTR_ERR(bbnsm->regmap);
> > +	}
> > +
> > +	bbnsm->irq =3D platform_get_irq(pdev, 0);
> > +	if (bbnsm->irq < 0)
> > +		return bbnsm->irq;
> > +
> > +	platform_set_drvdata(pdev, bbnsm);
> > +
> > +	/* clear all the pending events */
> > +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> > +
> > +	/* Enable the Real-Time counter */
> > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK,
> RTC_EN);
> > +
>=20
> Please don't do that, this removes an important piece of information.
> Instead, let .set_time enable it and check it in .read_time as if this is=
 not set,
> you now you are out of PoR and the time is invalid
>=20

Will remove it. set_time has the enable operation. I will add enable check =
in read_time callback.

> > +	device_init_wakeup(&pdev->dev, true);
> > +	ret =3D dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > +	if (ret)
> > +		dev_err(&pdev->dev, "Failed to enable the irq wakeup\n");
>=20
> dev_err but the function is not failing. Maybe just dev_warn? Also, is th=
is
> message really necessary?
>=20

Not too necessary, I can drop the above log print.

BR

> > +
> > +	ret =3D devm_request_irq(&pdev->dev, bbnsm->irq,
> bbnsm_rtc_irq_handler,
> > +			IRQF_SHARED, "rtc alarm", &pdev->dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
> > +			bbnsm->irq, ret);
> > +		return ret;
> > +	}
> > +
> > +	bbnsm->rtc->ops =3D &bbnsm_rtc_ops;
> > +	bbnsm->rtc->range_max =3D U32_MAX;
> > +
> > +	return devm_rtc_register_device(bbnsm->rtc);
> > +}
> > +
> > +static const struct of_device_id bbnsm_dt_ids[] =3D {
> > +	{ .compatible =3D "nxp,bbnsm-rtc", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, bbnsm_dt_ids);
> > +
> > +static struct platform_driver bbnsm_rtc_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "bbnsm_rtc",
> > +		.of_match_table =3D bbnsm_dt_ids,
> > +	},
> > +	.probe =3D bbnsm_rtc_probe,
> > +};
> > +module_platform_driver(bbnsm_rtc_driver);
> > +
> > +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> > +MODULE_DESCRIPTION("NXP BBNSM RTC Driver");
> MODULE_LICENSE("GPL");
> > --
> > 2.37.1
> >
>=20
> --
