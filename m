Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728AF635181
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 08:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbiKWHxJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 02:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiKWHwB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 02:52:01 -0500
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E729DFCDC7;
        Tue, 22 Nov 2022 23:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaEg7Oa6Z+JvZtnRjof7CLb6MM5Fy14iIowhVmF4ZqTLVwOm5MFkxRFmo+4p7Y2vp7/SNUoM9BXRcYd7pOd+X7WM5jH4eBs2IwI5v7iAgzkNu3/PtMYRkheVsGI6syXl9mZ8kIFf7w1W/M7jL9jQJ7I4S6C0e+juTh7xmn3zz6vhkZn4T/9It2FY8IfPsZaPJuDi9T2AQtWxv4igblqz1vUEZ16W2CppNWUrvMDVxPxU9CcJPsxis3re782YOHaWELZT31Q/j6FeOg8mAEfp+W8ICxaqPfxILCcJ3gA4cT6hnWSm+1W+0Nw0TGWeKih9FnV6PcorZTqNcNTdvx6ClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEsGU5nSQTzdql6jrOI9XliNxOfpl8THaPM7kMYoOGU=;
 b=WOqCksWGE0I/rtKw0Bmv2747yGbmq5aJ+8s+W1QNAeCLAtEMKIJVc+Jn5Ta6sRy44mx6eE/gGN604YMMC3Likjb8lUB2kwiCe1VsACt0niZyz6GkWlp3a7gZuBCmt1pHqcPZl5bZdMqePZAFK6Y9XAtdmwbQpVhGLl2/4Bx57vI2/jPM7u4OvvJEAmDK45Moo/h1IgwWYp8WFn/JAw5/0UANXk0XRK1VIebKiI4/R2GrzPeaGmOvxOBNqu+JvjGlo/Z95bNRfdH0duEckgPmD2A2nm1sogFe4zAxE7SEVONesvyi0mmO640uySoYXUVgd/mXwjygMt29487BoScywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEsGU5nSQTzdql6jrOI9XliNxOfpl8THaPM7kMYoOGU=;
 b=deojGyoxvZkYJcGMaOGKc0bTgzJyaDlYpQDvzKETFx+6IQUY9QhW0h4olFtxEHxApNyBRkdEfdkAKHhdVaGlz/nQQ1N60/e3wDqkTZLBpRmjJzy53PxKENXgEvBWHqvOtP5VgUsOEHV04CxKV3Cx0/OdPWD+QRJ0y+AJFLjTlrA=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 07:50:40 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 07:50:40 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
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
Subject: RE: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Topic: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5JFw0AgAAFHoCAABGQEIAACvWAgAAphPCAAYw+gIABKH8Q
Date:   Wed, 23 Nov 2022 07:50:40 +0000
Message-ID: <AS8PR04MB8642F8408DE7FCF0081F37FC870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <Y3tEnxqWy6HCkpOd@mail.local>
 <AS8PR04MB8642503BF1172B707CB9F394870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <Y3tcix7xpgQ+kt9a@mail.local>
 <AS8PR04MB864255A4537CA5F23C49A6F4870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <Y3zLw3z0HdiySOgP@mail.local>
In-Reply-To: <Y3zLw3z0HdiySOgP@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM7PR04MB6920:EE_
x-ms-office365-filtering-correlation-id: 1d9b6017-4bbf-4251-eda9-08dacd276adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xlM/LXMOVXhIE4Rw7Sp15tS97PznqJ8QmiPTf2efqyRsLS2gnXQ0vZiWUsZg2NorcPeO96AuyLO8Pbmv8lOcDf/AqhPTO50rAIKYmBkN+PQEjQHH3MvQEXVaHkcXKxKWNIlectfslKXXkSwrjchpItbN4+a2uceo85GYAAmrXoV6gqHjz/FweEn9roVKyJzSx1CKcJ8rDlbg/OOJkFvl8PZ9QcBthtZ+nKISgJM763iyxu3LEDVkSzWwucRuWpyAOOaSAyrdbADZLltdPgJux2+ThNyf71qb0cOvN5I4N0dM20i1in46LHQ9pViXI9K9c7dNgFVl0QsflTl1Hq+SaVUena6K8NhrVYCgTFU5010Nqs9+xJh9r8GLCGxxYzwFbYWu3lDcPhIlVueBU2G4JfgR0eIvgh4axMXleo/9sVcLVXS2kqri3L/rxpqQ6xOOhw982Y2/zXz9J2VB7BoWibVfi0P5FKHqZTtWkoNxBPCj6EDPZAn2wf4AIFJK3KBGBrN6PrYXNhKuzBYAAR61eUW2hhVNU7T+XAR7O2W/l6je0RHqI7usjdjpB28Fxn8Insom2ag7RW0K3L7LAGGyB7+aa7zKzDFxya70wTnWxd6GMVuW4Sp0JGHuuuefJNRl5ScayaojAiFpKxhpjWyH1FtbFGkFqOkbwNHNcB9zpj2+PGpoT25EDyVSjq53HNspWrpR/yap2j9nCWntHiREnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(38070700005)(33656002)(86362001)(66946007)(55016003)(7416002)(4744005)(186003)(5660300002)(2906002)(9686003)(38100700002)(122000001)(26005)(66556008)(71200400001)(4326008)(7696005)(478600001)(8936002)(66446008)(54906003)(52536014)(6916009)(316002)(66476007)(41300700001)(8676002)(64756008)(6506007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mk1trxhka1EcqLSd80kgPvtsrlj+K4VxszoIXsjzJdEMsINZ58I6aAqUM24l?=
 =?us-ascii?Q?Iylc9t2X/Pkq9JbSOVxsAco7f6USE67jx9Glq0uMgdT7zRBhVN/aRM3s7Mc8?=
 =?us-ascii?Q?N/1zPlWtceJ+X1vDYOxLYzks6YAU+3K1XZgNpOdIJLAYQRHdeZ50fdYa/NTp?=
 =?us-ascii?Q?ds0FedJkRFkIIfrNf2r1bF9YxUVsDfF4Qp0eRjWcNhnH8bibiJzd3aOLqkzz?=
 =?us-ascii?Q?ZcCqmn52ZNkQyBmAnyX1mVL8iUWjHe3UI6MTDMabIQyUirp3LkqCvwbXpWJG?=
 =?us-ascii?Q?MiBMNwYdonMZwDlXf1DffY9OauDs76UeEJl6+Xv6ukXkwBfUJEz0FcWkjHxp?=
 =?us-ascii?Q?j4tt7rn+IygA56eKiRvJTtVZzizclkldUDNVNxyfhMM6K3VJPSsnrMk7ZhrQ?=
 =?us-ascii?Q?n48AE3Fn3ZIHqkOsPSi8FoR7tiLT9MmkL6Zwd47w87/+sraFWUtjfkLi9mY9?=
 =?us-ascii?Q?ASDbyZ5EjVKDrQenFnwXOpGgSCZHxHACPRkzol+cpGsnUBYyK0GhYyGun+OK?=
 =?us-ascii?Q?uSqIBqSMAJGbm+b70f1f7vAnQMj0ie8MQgEeFcbqRPipPdS6QxP+0TokTBjb?=
 =?us-ascii?Q?aWt1QdclWNE/vK552fOKu7qlvIF0DuDc2FmzUMjG5Jys01z/ttHV/gZz5v07?=
 =?us-ascii?Q?E4KBqBirDZ9zLrZ4S747t0BWDY4LZLmMJXGIHDkfESI0wVqlm5FFVrq5bViA?=
 =?us-ascii?Q?+Gp/ZZiWB12h2yHZS1TK2oR6PwHacsQF9kDwJx8fJHZKeN9M57qkXo/aPG5a?=
 =?us-ascii?Q?LvzPygHz2eJgCjIQH20tLOWUMOjiROiWOpCeEs9Ob6Nez9BGWWoGuB+o/oX3?=
 =?us-ascii?Q?4Il97QfAio9EoQfBEbfPQ2jhcV2SiyVd0/BsVBoHtMflNm0mtY0VIhv71Mw+?=
 =?us-ascii?Q?0m94gTo7OKIjylgI4/QhNwu7or8kjRnaWJvzThugV1gUzasV6OOXO/RdLfsr?=
 =?us-ascii?Q?/QShjFvftT6wGC47CN+6td453tciQU8CJImKd1DS9jFsttTFhDwCSFZLjdDM?=
 =?us-ascii?Q?pQSLf56dNxwBnuXs4Kl8nkw3FGcAyC221zHc38Hu2Qa2lTIwnSL6YtG18XC+?=
 =?us-ascii?Q?AFxZJshhSBspCarZVIkpt/aWS+HsVrTcBIy510VHitBViyNFgH3ggo2Y6h6m?=
 =?us-ascii?Q?qPyiBjaE59afyBc6LULyH8raegSiNpnPklgHnhK8T24HRHE6lDib80szHujO?=
 =?us-ascii?Q?yL6449Gg2HO5wM4kWJTw3HvW0uw3yrGj9DmBljmF64KejoLVQaLOOt+SkJFd?=
 =?us-ascii?Q?18Wa/cKN7XZ4A+F32BDc/jCWqDb0OU75RCw89I5HG4AAznYIeP+soH+E5QA8?=
 =?us-ascii?Q?Oznq3hNogoAqqgHTCLWZ09yQnlEBRtPs22WLAVvpwmLTgjsIVgA6riWb6zx+?=
 =?us-ascii?Q?7aVSH6LSgh746iRZpOqw8ngvQUy6GaJVe5unHhC6SuJiN9dDog/qc2EvMDKi?=
 =?us-ascii?Q?BHZbquog7V6jXoxxYhTbSAXqGSzr8eK85Hq/yvlKfx7oE/JLCG4FbOA51sOU?=
 =?us-ascii?Q?f7ckVbnL1FL7KcqEfjdVQpWgS8Fg4+rX21s96gyeJZF03LBsdWCf7kkP9zwT?=
 =?us-ascii?Q?0zDtRn0Xr0DNwbtbSbo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9b6017-4bbf-4251-eda9-08dacd276adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 07:50:40.6160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7/5gBkNvIym6wJaKYZnFC/IJTWT2ccAkZjTO5JxeiENa0GmxnMKbIVYRaD8I3/Za6VmTM9o+saILAPf+soUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920
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

> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> bbnsm
>=20
> On 21/11/2022 13:45:27+0000, Jacky Bai wrote:
> > > > > > Missing ref to rtc.yaml.
> > > > > >
> > > > >
> > > > > This is also missing start-year
> > > >
> > > > The RTC counter will be reset to 0 after PoR reset, do we still
> > > > need to add this property?
> > > >
> > >
> > > Is this really an RTC then?
> >
> > Sorry, I think I misunderstand your previous comment. The 'start-year'
> > is used to expand the rtc range, I will add this property in V2. Thx.
> >
>=20
> I think my question is still valid, if the counter is reset to 0 on POR, =
what is the
> use case?
>=20

The RTC can keep running without losing the state if the power rail to it i=
s not cut off.
It has a battery backed supply even if the main power rail is off when devi=
ce shutdown.
I thought the 'start-year' is to indicate the initial value of the RTC coun=
t after first power up.

BR
>=20
> --

