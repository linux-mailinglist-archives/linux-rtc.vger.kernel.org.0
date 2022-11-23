Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1094A63519D
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 08:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbiKWH4X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 02:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbiKWH4G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 02:56:06 -0500
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32743FA73B;
        Tue, 22 Nov 2022 23:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHA0uNBfUuSGJhGLK8IPIaK6NOF0rSXZp/nCTmgu1pJeC03AloQ43kcBmGcVn9Ad0CZbCcMfswhE2cT8c/uG8EEYkKPIx698/xEEBnEs8/hQta90wsTdSwAkglmsfSX5YF4HCFmYG7qQITC2soxR6XPVdKyUpopnS8vJlRqu/PyYzZbV/huu0GcE2XVCYVPruz3iNil965rsmD+ayIwl5KX/bPngML3iixMgMgycg1hLV0tctlRrQHe2MO2ql1K3Yt2kMJPNxgGKLmVBcIkl+Y7K58j4DqAgpqroodaxJ95STyRixqV6DzjZCOFyNlTYyu/oGoBTMPDtKIYelV+luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA3Q3BKeKwWTAteWc75SFfLbleKCsx70JyyxVpcFyCM=;
 b=fh/QDjjKyNhuPOiwwdc9GWZDvDv2yiWojXO+r4Niq/0XbNo2XQ7NI9mUb1AtfnM1qw60A98LYgktlluviVdLv1ZvmvYkvtLvnnO6SElpRIvo2kpSNMeF5IvXj74a9A+gmqBB3YCQGbWu69r+jnlba+r9pRMLOa10yjbe01v2+ruLF3BS0mHDmoo4FOTszb9vIvv636T2/X1NG3uWtbxg0uM9OCb+eU3PLL/awa9XVn2FfTXVpwWp2uCwEvqk4sEQ9xxerbxQXQUko2ouWAI6OGgbYqZyWuGlDJAAplRsEWrK17+oeCUaDsExKFU1zzlyZ+51ncdHPfR7o3jKzBWMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA3Q3BKeKwWTAteWc75SFfLbleKCsx70JyyxVpcFyCM=;
 b=pYoDB5arvSZtgbs5X1EFgC07OWFzUuQ61hEC7C71EU2J5b+N1DPf+D7b5f+sR1kwk5UrRoJQ+MQQAxpkHk78BzRNFoEBAPcoXDpLm++YCTeruNztmsf/y56NsFKmLp1lux3LC0R26YRVO5oil8k7pZxj6dSVs7w0uw4jsp1CUHk=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Wed, 23 Nov
 2022 07:54:43 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 07:54:43 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Topic: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5LZxEAgAC+uoA=
Date:   Wed, 23 Nov 2022 07:54:43 +0000
Message-ID: <AS8PR04MB8642AB09DB82DE58B60421BA870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <166914594571.442076.9834259216884759566.robh@kernel.org>
In-Reply-To: <166914594571.442076.9834259216884759566.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8846:EE_
x-ms-office365-filtering-correlation-id: fa8d4443-d552-4004-f50a-08dacd27fb95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CABliCBcwVbJgOOTPooOMSJOyD1zTGBawU1j0J8MRoEtJdn4b6VYgL8jmVKBwyVpmFo+4al04EcWAclVkFWq7pAm4jrZgIp+EYSMiAd7jr1witFJb9WD15WkVyusG1lu7PFgIhPzf0pq1KXmFhYFmgyDtNlS30kGjrrfQThI6+1nf1kqwjEccCICKwwrt1jFzhZK+u6tHe58ZQ1qRrf/0OGqt/wSVUjO5P5v2uJ5GjysHhQWBSLD24fLEFISVeSgkeafid+nP6P6PUnTd3L3o00nLy+GkP0ULBf+7L40WPso13prurWSnKhXTyUHTZSCeS2DgTHndZTzbDWxSV9C7Fsew4IfDIn4lWFSng/m2Dd+3cYp2IBx62jLwpLaj5IcB6FKnKKgCJdqy5Ml+YoSDcHytsYdDhYfMrBfL0Yu3eIEWqmrn7beUAJ+gK0DxjN6LsKW2GwrAPrwAieUGSlL0AfrQ8fR9eRkvkV09lQk38wN972H14adGbmFQo0yfzgfbps8QMIaR/1ExfmhXMtbzWnhRIXy1dIZgNyeRs0bT/pAin+OlUjAMQfyHS0pK5NR5aEASg5rmzzZeD9GnTMppuqFORg9LS1pYcCnwzA5+v3Zimjgoyi2WF+Wzh9bUTYNBbRl5EGWWUnNpwhgyoYlzr/Blml16eeydA8QeO5js9kdhwcm4Or1LmyIvh2YRau883zcvSe0p6WerTzmEv36EA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(41300700001)(71200400001)(478600001)(9686003)(4326008)(66476007)(33656002)(76116006)(64756008)(8676002)(52536014)(8936002)(186003)(26005)(66556008)(66946007)(66446008)(7416002)(5660300002)(6506007)(316002)(7696005)(54906003)(6916009)(83380400001)(55016003)(2906002)(86362001)(122000001)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pO0q4EY5M9ioTilZCUlrXsqmBwyp0za6Y+Y+3qMwj0hu+MJJ8j8Tg6F0MFcq?=
 =?us-ascii?Q?zJai/Yimrw0MOaCYVt55F+8PxKeX6ri0+eY7W/bE6uBxO2esiKdfZPKaLEd5?=
 =?us-ascii?Q?OsIPvW1Xyv+EDIH0GShJCq9I43AMNPXN8Lp/zJ88ePWb7XEASF17FxW72+xk?=
 =?us-ascii?Q?dvsJay8RX2I7TTPshxo7QKzeXdb/SmlVpSDNTx9dMccEQY9/0ePBEHgS78Q2?=
 =?us-ascii?Q?YQh6XFo8868KCALQR4hBMK3cETy6mjDPGajsYfEfqGV3iIiggbxBqcWHQ+m3?=
 =?us-ascii?Q?Xj1xchG3SHFkNRpyLyjJwK9Dkl+Gj+9C3yVSMH0jmU8pQMNgGb1IPeWoSbqA?=
 =?us-ascii?Q?3QqnMO6ZabwkcuicqXps2Pic6TERaMSFs+VJyXZUs+RH8vezkjgfjRaUL3qz?=
 =?us-ascii?Q?5flxri7fxGNvOWIY24Nu4u+cxMug52xgBQiDzR6EV5SDHZ6Pqg262eSLu9Np?=
 =?us-ascii?Q?14gYdyU9g9pOUDOb4+WETfEo5wQRoOHJ9PRin5ccr59UxIwKHfQxUkbkhfEM?=
 =?us-ascii?Q?+phGMmPl1lk9Jm/KaSfIm+2ZLoriNQ4vi7HHuTb+NWrbex/QgVu6CyEu6Z7X?=
 =?us-ascii?Q?Em7upeDit42VTYzCoLSbn6S+ZZJmIB+KlLtWaHa2R0iTdngkeyHYbz3cgkDS?=
 =?us-ascii?Q?8M7Q8c4Ra/FUaKqqTgkilUeFunksRgvmN2aC1jdk9zjPfVlxIRA2w1Tn83GV?=
 =?us-ascii?Q?4uou961ynvpqTXR9JIVY+W/HlxBjsSiRtXb2wEPggREzcj0gdzObKssh1DSs?=
 =?us-ascii?Q?zdYNEAi5pPhI7dcpl/UZE9cv58zg1+EPzgcqXBFgTsy0A6zg60fi3zS/pQzA?=
 =?us-ascii?Q?0lGSFAOgtxE/u9wRhXjeCR4x8AX7yzRyKBDC3kj8cUXaczUoHElUVFmbbEfx?=
 =?us-ascii?Q?F94bcG+aZleVotDbUxHtxdB9zg5WQRuUQvEpEXWZ/RFtyfE7tL8/YoqTopFt?=
 =?us-ascii?Q?CfZzuN47x/w4BqAES1xmDB0IIeOihm8hjlAiSa0Z6xypJcIqOk9pX8ThvrsK?=
 =?us-ascii?Q?/Va1l7yeFJMcXrWhl3hJEqFRhyBp7YbAj4Dbv8yiRxNKIY9BDd8Iqq+K/3CW?=
 =?us-ascii?Q?+VbDf1207aXNW+qpDW/rafaTmuqksRzlDGfuWE+bt6E31by/JVEjeFBj5PMm?=
 =?us-ascii?Q?87qO8PE3+ZP5wk56GLqSDYShi7GqAn5pc2AQnYcebnE1p2XuilMJagZatg7f?=
 =?us-ascii?Q?j0U3VIEkEYktisDsIkE37ruaZTkfJCNd9Q1sh6fXGF1xfCTBWO3jJXB3nkfU?=
 =?us-ascii?Q?j/QRv7HC/xY5hHtE9SI9LGFOGplpK2iQr4tnSeYD/cXjT9sLmUtidWyadogz?=
 =?us-ascii?Q?lO7Mhbt8tYHxeAlmr0ToFH/w7BnoOwHvz3OOknOKYeYqz+d4FENeFqm6uOCe?=
 =?us-ascii?Q?ZI9aLApefZ6KSqSQJg45wT2yJ1+W2FwQ2nQIqgr2x/eZpl6B6C7/4qY2+f8k?=
 =?us-ascii?Q?FMF02lKMuX+xhJ7ZSTmtg4TjFwY9o2sdzQOxwaxE6ErDhsTj+ERcPeJA+zkq?=
 =?us-ascii?Q?zQ+ym3ZvvGI54njxOxGkaX03Tu5iKDLb2PKLuzL4l+2R6wRXQfqvu8LpNEkB?=
 =?us-ascii?Q?IrNENgLFyqOz+P/KXIU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8d4443-d552-4004-f50a-08dacd27fb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 07:54:43.4049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8simNRVrxdIMUxOiJ3FF93EUMuFQW0A06u7M2eIl2Ed2BkIwzhxbUvbshQnAv8G1P0ZCU/4clILh3A97GXp/xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Rob,

> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> bbnsm
>=20
>=20
> On Mon, 21 Nov 2022 14:51:41 +0800, Jacky Bai wrote:
> > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103
> ++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error:
> Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dts:28.27-28
> syntax error FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:406:
> Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
>=20

This error should be related to the 'interrupts =3D <GIC_SPI 73 IRQ_TYPE_LE=
VEL_HIGH>;'
Do we need to change it a magic number define?

BR
Jacky Bai
> doc reference errors (make refcheckdocs):
>=20
...
>=20
> This check can fail if there are any dependencies. The base for a patch s=
eries
> is generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command.

