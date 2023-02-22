Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5AF469EF20
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Feb 2023 08:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjBVHKO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Feb 2023 02:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjBVHKN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Feb 2023 02:10:13 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8DE36687;
        Tue, 21 Feb 2023 23:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6U+I8b4LlrXLv3vBExviFkJNUcSV3FbZlSp0Duu6BJnfPLYaiH3bQ80uby56hS5T8rUNWfG4yrY4iRUiMQ/RvMfLQ2b0PbxxY44GEUuibG9Y1RNJkGawHq0zi3yB5s9Ne01XzYAvcREAfAmypgXrWCbZRjFO5InYJrGe1mg6+2gSIxcHIng3CatObJ5h8nySWY2aLRYnzupvhpfrgfk+Vj1kiAZI/+qDXGAG30WeqimDB4SjhuLkrrXSjXy111mE9apDFfm5mgYuxgdpmiaUtmRn/GFS+Q8e52MnubddNmvJ2Eurq25BI+6uZsrMbQnZbfLzRDtl85RxBzI/ALIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsQ5ls1exxKsCLma6SAQ9OsHcCIriDEHofjxvEQBLM0=;
 b=XLMx2WB4/EwAu7DTJRaoSS67LbGLSA2da2Uuw1MX+Ob5F1un39njje4tqbWSTufnfRbp8hjZPUYRXI5W0dt2/zBWqpvSEOJtWnP+OvSiXF3KObV9XvS8McddUM8hFlu60OMKfb4DajktE4Y3EdHxxQMOIp1Yl6UIQIQQ6i1YUIa7fPsqelZvnnkM9fqbq1dERfJ28QeB+OH6Z5eDgtU15yn5DSK9mR2Vi9aQ1IEeqWTmrw2I5w9MVZUhr0qA5HsvDp7Y969xHnqcN5SkbKU3Z/9qDwkGV1dwNpoO6YJGMrPWgVVCCEuAc+4R4NPQGgGycZmVhCfj/m4h4bSyKpAPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsQ5ls1exxKsCLma6SAQ9OsHcCIriDEHofjxvEQBLM0=;
 b=S9pILsH90eF/hpUtgyrKJ98oQbDeiFpdZGnCAq8t4oOjD0gnJb5J4Wv5SBCm5B97Eo2yLPE9fKSzMTrwuAJ4orQlFRAzfXC5WW9h/NN8vims203X4OasDljjmALfDwr4YtSRYo5FkNSYbK5jde8sSRlQ9ndt5djkPdHUVRmAIcs=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8688.eurprd04.prod.outlook.com (2603:10a6:102:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 07:09:59 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%6]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 07:09:59 +0000
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
Subject: RE: [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
Thread-Topic: [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
Thread-Index: AQHZQObOpOypUkss30at6VWr9UBm6a7Zuy4AgAABAICAANp0MA==
Date:   Wed, 22 Feb 2023 07:09:59 +0000
Message-ID: <AS8PR04MB8642279B6FEF4D239AB927BA87AA9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-3-ping.bai@nxp.com> <Y/UG7LT6e7+UySRs@mail.local>
 <Y/UHw2Q0FL9zlfFk@mail.local>
In-Reply-To: <Y/UHw2Q0FL9zlfFk@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8688:EE_
x-ms-office365-filtering-correlation-id: ee066b9b-fa98-4339-b494-08db14a3cf96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4brOSU3LrB+/PoJ/zKfllqzhAhAnnS/I+ghDs0UA/WGTnWqJns/WWgRY9VH8Ztd5PX2T7YR2IAV68RabKS/5vybnricFUWb4gqpZSAPbC8uohhU8WY78DOGrJHh5cA6xPlFpJGWwWwN86qeuuuyze3NbaaauWEhKDXcQVZ/MhkU5zO5pYKecQnDDEAfPvTe3/qwPHsRCoIxX3IbaaFVR5XX1VTQY05GDWVdQT1uoPFnkHuhj0izyCavEdsV6VJTNIx02yZGuYmvWqpGNUIEr6kDR7a6x98WPhejyE8nx0NKzSbRYlyHVUwoMUlQYrvovYZV/TO3UCYPEMGDo3Mp54aWVy9XzizT+vod4G2SEg5JsThuvEtC8jaYF/OOv5xCSfuE/uUrfNKuPGWMwr/QPWlLTRqCA7B3Vmk9rrUSsJiNbo82z76gt0o/FCluRSYMjQcIcYlOZeYkFhCb6VNux8k2mAgcc1V+mu+uYmoqsxzYYOoOmO4NXAF5bYJqE/gTroC7zps4Jmq4TgVMyBcPToPQtiah99IKOqVD+9lOUBVQ9jruQ+wFdIurUbns7a4NA+smtLKpbyE9p8Dt4fy0liqKtrDDAabX7ClTrIFea5wTAktv1WDhRM3+8BGSRF/qzTDHARzpUUYw2RfvqcQ9olAPBrlU4wnx/Hj0zCXs4/DJoE7yQX4MM8ftyQ6QU8GYK4XsJ1jiElDRrSsje2IC8oA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(83380400001)(41300700001)(76116006)(26005)(54906003)(9686003)(33656002)(316002)(186003)(55016003)(478600001)(7696005)(86362001)(6506007)(71200400001)(38070700005)(66476007)(8676002)(64756008)(66446008)(4326008)(66946007)(6916009)(66556008)(2906002)(38100700002)(122000001)(7416002)(8936002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qvz+bp3gwmEJt6FtJFfOq7gI+G7oqNumhbMIEOkGn3F9kVMcMWDcXyjS15z3?=
 =?us-ascii?Q?eYVc7p9Creapb0CjNHAbfelEtvbg5mtfDb8oaq7ZFxUr4YR4qXqRvX1wjw3p?=
 =?us-ascii?Q?Pbw9E1JtyCfb6F+CmJv3gR7v1UpV+VVm7cyuP1OqFt34wdKDj8ly6ia7Lnhy?=
 =?us-ascii?Q?BrMlqJYdM0+DYFb1NwomzjXzBwveSYGMMro2EBhUnPy6uU4+n27pmVw+b27D?=
 =?us-ascii?Q?wU2VN5j5VsWazOB+mecQOCFBnLZITLOPaULGsB0JF6qo35Wi/vxWoVCM+Mwu?=
 =?us-ascii?Q?FT6xia/vXk/5wXapupTcy4mh5kbAiR3gEPe9Qur9n6lbKlh8rfdsX2EI5Hk3?=
 =?us-ascii?Q?zbVGEihwZGhCCAJ5va3L7NOb73l9giB/7fSrbrk61a93A6ojso6uQ97PPfl3?=
 =?us-ascii?Q?p2cE2ZKzOfwQENPksxsrug+roeO6XNmZWC/92M09NUtDPeyQ7V4gK54MWVvK?=
 =?us-ascii?Q?lqVsRorphfDyIVsLgUD0oOVMalYThZeTGfQ11/G5hlC715UU8uvQHi7iAH0W?=
 =?us-ascii?Q?47dZYLfqI/8qvNO3kTrA313oRy4Y7nU7T+empIjKZOo1A2gnTBIKZxSqjTUI?=
 =?us-ascii?Q?KSYApD6oaboBTpuTWWskkmvlFJHg6Ys08wRWdNdcAZyh8lDIIwtC+jFkVHMT?=
 =?us-ascii?Q?sZAA0XLmFH69si51vqXhwK9jX/1rPd4ze10sv9ZFxDEYfm/8RuMo9PaW9Qd5?=
 =?us-ascii?Q?+GIpwBYO6JiDPQFF+9RKNO/gcjqPCRusWXhHkqIJrOlG1KWsInGUj/DRFLkB?=
 =?us-ascii?Q?zJZy+h70E8ja0QDLYVVFTNe9KU2G0MScL/2DAmXzYvmu9ZZOIqipx/ioHdgr?=
 =?us-ascii?Q?3j22RVwSm2ERClz8or7NZRmNgvv4pgCBRnGwLRdZ0zFDHrfjxu9iZLm0djZf?=
 =?us-ascii?Q?BClA7XuVAsVTl0vaT7GEcLaNmIuQFCp8rdQkLZ5knyB+x6LF46ie6E0kcK4C?=
 =?us-ascii?Q?Dwj1i3sJLmjJZLKcNwJTijDg4B2Do38Z3OxWxaA+ORZsZkYaS2PTxphLFsIp?=
 =?us-ascii?Q?PMB3eo5qxWQoYWJ5oPscO8xm00J8xUC8m1dw48r37vHzYo7sqNqC/11PtWfc?=
 =?us-ascii?Q?QvBYTDXdaNfCtq8mZYttO2wAF/PyHp3qZM5QoLJWG0eBNeaVfYGv/7nQTNoZ?=
 =?us-ascii?Q?9EIugvrCKzUGEbHRFFCxG8Cd6TBLgGq0Y7wgp25AlVGhFCVNyNvoeCbb+6EJ?=
 =?us-ascii?Q?A8JTTraiPlWg6eI+q1t2i4LVwCvvjuprdRDs/E0OAdrL1pFSKXiyHnAEDiVd?=
 =?us-ascii?Q?cPO1crZCiQWnUPGLK1ITc/zNbsmFVPP9ugordUCU+RGYOsDm5qxF2gyCD9VO?=
 =?us-ascii?Q?6KsFaakVOA4AZcM/aM72MI43WBj8yIipzjxCxBFKQ6VBLG7tIVixWhAua353?=
 =?us-ascii?Q?1+hpTrj7rSk3Ghi3pGZKSZouFyk/4CDrxKlRkgWdlwKItKH7bQ0xO3RzEhjK?=
 =?us-ascii?Q?1oIEiMQE0H/aQqIrO7jcNPneLiRiJswyPXNfnYPKdHVNbf2lkTLTg/I19EsT?=
 =?us-ascii?Q?yHlu+9QKNn0LZZCkvwbhYyjoBCY8igudAR6drSpuYnJnFdoNJnbhiFFuIWMg?=
 =?us-ascii?Q?kTPt4I2DiqW6f6psjaM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee066b9b-fa98-4339-b494-08db14a3cf96
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 07:09:59.7886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZMkvnmRqZloqG30aCDRoWA61qjR7BzNPRSUmHiFZC2F3Jo0/gz5vuU9huhfGh14/vlY1k0DPi6wAsPcspisCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8688
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

> Subject: Re: [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
>=20
> On 21/02/2023 19:01:16+0100, Alexandre Belloni wrote:
> > On 15/02/2023 10:41:16+0800, Jacky Bai wrote:
> > > The BBNSM module includes a real time counter with alarm.
> > > Add a RTC driver for this function.
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >
>=20
> Actually, as there is no dependency anymore, I'm going to apply that dire=
ctly.
>=20

Do I need to resend or you will directly apply this V5 patch?

BR
> > > +static int bbnsm_rtc_probe(struct platform_device *pdev) {
> > > +	struct device_node *np =3D pdev->dev.of_node;
> > > +	struct bbnsm_rtc *bbnsm;
> > > +	int ret;
> > > +
> > > +	bbnsm =3D devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> > > +	if (!bbnsm)
> > > +		return -ENOMEM;
> > > +
> > > +	bbnsm->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > > +	if (IS_ERR(bbnsm->rtc))
> > > +		return PTR_ERR(bbnsm->rtc);
> > > +
> > > +	bbnsm->regmap =3D syscon_node_to_regmap(np->parent);
> > > +	if (IS_ERR(bbnsm->regmap)) {
> > > +		dev_dbg(&pdev->dev, "bbnsm get regmap failed\n");
> > > +		return PTR_ERR(bbnsm->regmap);
> > > +	}
> > > +
> > > +	bbnsm->irq =3D platform_get_irq(pdev, 0);
> > > +	if (bbnsm->irq < 0)
> > > +		return bbnsm->irq;
> > > +
> > > +	platform_set_drvdata(pdev, bbnsm);
> > > +
> > > +	/* clear all the pending events */
> > > +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> > > +
> > > +	device_init_wakeup(&pdev->dev, true);
> > > +	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > > +
> > > +	ret =3D devm_request_irq(&pdev->dev, bbnsm->irq,
> bbnsm_rtc_irq_handler,
> > > +			IRQF_SHARED, "rtc alarm", &pdev->dev);
> >
> > This is not properly aligned, you can fix that if you ever have to
> > resend.
>=20
> >
> >
> > --
