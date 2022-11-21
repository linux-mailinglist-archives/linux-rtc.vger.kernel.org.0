Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6C8632421
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 14:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKUNpd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 08:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiKUNpb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 08:45:31 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC6B2AF;
        Mon, 21 Nov 2022 05:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAUypY1GZrIGckMK4VMe+GpJxvcJeeitIn6XWrbw1st6uATpCVeMSsqAuM6AxlW7gLr8z7cdW2nmEPe2n4Y0SqkWDSt8stujKdn8J66af7qrYa5fstRSS8BryPFBh7oBxSMYT0sQPNBbwjUCdjjI6tis8IQYCEvX8diR6HTrq1anlmOj+rD0oXH9k0AwpT+38XInf7tZKcTLzaP8Mn4NdYOuCXSJzgsoOT7uP7ZimqELnM+8X+ctPOL2qKbqBeG3JCFOpSXvbhmbYsWy5ZqVQfaRcVPFyYOOBNS9Z5JK8/8TQVY2xhp2szYQgAjRZe8nTc9OUgqAaLkbJosb+A06NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVg4xadhVJOgi09eyVDKeLuTLArNPa35BAUezdW1c2g=;
 b=OwwQOc5SL6WHg0MPiK35gfS6qSqDwtWj3G3ZKIqTgQdOFSLeH0pN4BbwcMeiuHgTdpeexht1f8XqS8cOd2uIe8BF+/VwxUN1VMzBgz29FaDrtL+jDCcTaLWsbLzSvJ/o8ID0qldbO5iqdO062KAPIK/aFsyq5ZoCRS6KNxbnE3ctU5EnCW+ePVhPDlbYklUUuWsUl0bwyjWe+iNtSFqoG6vFhIy3xYECUhnEvP+zcaOKIGNJYV5qVmeq1SloCitiQX4TGMnbk5zmEwBPLYb2R1Ho1h4VbSOK4d9ZzSjrMBZQwYXY5E0fJMPn5QJvwpmUxnKUK1XnjWsftKe7vGzrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVg4xadhVJOgi09eyVDKeLuTLArNPa35BAUezdW1c2g=;
 b=K2sXnXTJfaPorh+5QIxLYadF6N8Hr28gjBVuXHQ2aWL6Aj6uiehnsLgTwAxGu+ZT/y51MJei6x4QfYb+ipyXL3tup7WkQj4jRKoxV50sO56SwKgipcz1lVzMBMomP9Hpt3gormL6LG+SZOH+8w1MKRf+nQIQTXR6IHGSFbAi4sw=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:413::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 13:45:28 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 13:45:27 +0000
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
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5JFw0AgAAFHoCAABGQEIAACvWAgAAphPA=
Date:   Mon, 21 Nov 2022 13:45:27 +0000
Message-ID: <AS8PR04MB864255A4537CA5F23C49A6F4870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <Y3tEnxqWy6HCkpOd@mail.local>
 <AS8PR04MB8642503BF1172B707CB9F394870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <Y3tcix7xpgQ+kt9a@mail.local>
In-Reply-To: <Y3tcix7xpgQ+kt9a@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM9PR04MB8440:EE_
x-ms-office365-filtering-correlation-id: d759c155-8b3c-4d2e-403c-08dacbc6a636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7KGKdmmWRWDXRgTMVC3V17hbeTElSU2cjXNq5+J9R5E6oyJHXcSOuIxXZE9BsFs2lcxxhXFnxL1D/I/5Dw2QtU3L+gZhj9HyWVrnuIYwYRlWz23TicXTJ6ghHPw1tDeoXIWjrzJeDUH6a4DjyanrsoBRr+hA5ke8eZVSZw1WPflybwv2c9q/Ech/xdoMDsDHUoCpRq+Cj3KIw47K6/Op7XI71TpyMLKPkc4SgR7zoK6yhNdZjihCv9YiaJ4CRRZ6b4vt6G10efKM44KWhXIR6yQbINI8guP55gTBw0cIoD1MCQPN8aSx7Q8pEez/W+Jq6xJjTRviXNHyrd/0skZkjJVZ5QuO6l4WvzDgA6amuYx5NaFmrdIFgUtZlWsk8iK+SdskEvxYlqx5PB8VahiI4ai0kfmmzxtEtNoMQtm3MQdi0p6h15RjWuYqlftAOkBL555EzgzL8K0RXhGmsiRrCAxPWuCiaDHefUaYRd3pt4DcIq8MO8BVM/sqEvAPh1NgbbQI2KPn5rdhVzjvFIUZLAyLvUC/IYOekXNM61PRdJK5XefBz1VL/9Z0NgoUGq+X97+2NGcRaDHuBG9LtemLk9+E/o4xgim5JV25SFjCx67KlowzXir+p12HqGkB0Ap0eHem3g78qsE9pgOSfLNldsWnhkDu9IpXLdgI9O8ZjzNtOEfhCO37lDm6Us0EvMXFVOB9Jy7Y4EJg23ut5Tbbvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(186003)(53546011)(9686003)(83380400001)(122000001)(38100700002)(55016003)(7696005)(64756008)(76116006)(7416002)(26005)(2906002)(5660300002)(52536014)(6506007)(71200400001)(54906003)(66556008)(6916009)(478600001)(4326008)(8676002)(66476007)(8936002)(41300700001)(66446008)(316002)(66946007)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EVkG8QWRWe9f8yvgFWGwNIFHdlku4iQp+0QqnyVysa+6WWmshs1m8r8Pe3F4?=
 =?us-ascii?Q?JtaDOgg5xfl76eyK49nkUCXjSaSF2kSvARHWo1WRdZeyjpQhVD3mKvk7VgwT?=
 =?us-ascii?Q?K7++qWVsvCPjh7MWqyDpA/H5MbC8SLJgksdI4repZWvRnyqKXDWJk8/ggBvy?=
 =?us-ascii?Q?+/1mmrhhh/4L+jc/R0tgFhwhD51xeNdMTaD7NIAf60pUc0JdH+TxxMoIwagB?=
 =?us-ascii?Q?dPZ87DupVt9urr/xlKYtvNciQQS/bhjRFvvB8qbdvoad1PyusQxixxZx5k7w?=
 =?us-ascii?Q?ZIGhJvhmS7NBwctEYrl6fwvOeaIw2Q9YDlZBR513Iv8nHW+BQq76B+mIo6KP?=
 =?us-ascii?Q?1xKHBHbVqojRsk0sx6X3azVGKM4ZVJJ/LxXDBCGklXwIqqCMa0iclwjn7wNZ?=
 =?us-ascii?Q?VEZoOYGgj1iFdIjSCl2WPeaREw11P1Lb4a53MQZ0LafmVKPH3ByxAGo6rdiy?=
 =?us-ascii?Q?zv9q+mk627i8P3e1G/Ga16CHs0YTKcMfdtWc3ZAjiPD/5kFmSYanO/ofKlag?=
 =?us-ascii?Q?F0zr9JThtYTUI0FIaY/4r+WpJO2h1sjYnsooDjQMih/RCfN/YsWmEnJB54n0?=
 =?us-ascii?Q?1FyYHmldZVg+A00GJNmMz8Xk87jtmetXbqOVmfu28uKUzlERjws7pVNhNW2C?=
 =?us-ascii?Q?weq8gG1LPyztqdNQTxbI2gdom10HKo2UTZMshFvm9RkZozT3BGIuSiBPvaql?=
 =?us-ascii?Q?QUeHPitiEevR9sRMZbAJpaAn2264g9zmBGmhr53Ap29Wm5TpkASTRuhVWzeu?=
 =?us-ascii?Q?LMObAwiimEkXfZwBWfXFpgRsA31kgk6NjQ1HC68RGbs88RGi9Yj08U1SJFb9?=
 =?us-ascii?Q?yay6iq7gDolxdXYt/31Yb32bUQrfqmpBZnBVDh72OXUDRPGc9Hi14hyn7bgn?=
 =?us-ascii?Q?zjS9xwFcadIUMI4GDni0r9LYF/7nhniW1HLea3VhpgWnZEvXddpiMyCehpnZ?=
 =?us-ascii?Q?52hb+AQ+7ct3rpPM1zmkAK3AvKUsZAHo8wgw0SqTffxPi4JzmEY/qf7+oQx4?=
 =?us-ascii?Q?87PME4DqWz6c3GQzk1ZcPzXhOPzwF6OHUsTMiC1HlnvSlvQlYhiRTHGg022D?=
 =?us-ascii?Q?k8/T/bgqpT6C0dSUpANAj0xAuKEKEotm0jdnFtjLbf/kXe71LjBiO2+zSELT?=
 =?us-ascii?Q?s31p9mvKlDVz3PzE3cKn7RLF6kUPKcQd6BYkAeM3SIReWFqSFbxkkEv4tXPw?=
 =?us-ascii?Q?I/XGmpoFlewhgys3Mf827HlfLhU4rVsM2izLWHPjRPO0eC/mrPhh9KNOUq/j?=
 =?us-ascii?Q?+rMVrUiBlv96exqknLPZzWt6jFMU7VzA3sFmYypF/k7WD4g8Ltgbr4qikZlt?=
 =?us-ascii?Q?47aUseKDy+JNs3UproWMhGMNP2yL/pV5biS+bYGhEDtGOwGZulgq/OJ/toUM?=
 =?us-ascii?Q?d9on83gTygAYARc/y8mXHsdI89GLYF64wKFDxEOEgYk8ViRlVCRrt8qVyv5D?=
 =?us-ascii?Q?2F8MzK1MYSV+AvIb6Mgg8BBuLnFH86RsKwyUXa6IhJxp0frB4Yldwi2blDo9?=
 =?us-ascii?Q?6G+XdKW4pKTJYBV0HL2EVgCntNH5ldbSpGO9NQDDkzY6c74Zyr0/2SfbdECV?=
 =?us-ascii?Q?qZfb9xA2Xlg0AoT5DL8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d759c155-8b3c-4d2e-403c-08dacbc6a636
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 13:45:27.8257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyAb/0sQ6rIpreuUa+ntbNsu9VSlLLRBSir8b7BBhWNpQcBtrTCFVkBdTqZCVUrPJKJsd18ALkULtu7p2sYMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> bbnsm
>=20
> On 21/11/2022 10:33:15+0000, Jacky Bai wrote:
> > > Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding
> > > for nxp bbnsm
> > >
> > > On 21/11/2022 10:09:40+0100, Krzysztof Kozlowski wrote:
> > > > On 21/11/2022 07:51, Jacky Bai wrote:
> > > > > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> > > > >
> > > > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > > > ---
> > > > >  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103
> > > ++++++++++++++++++
> > > > >  1 file changed, 103 insertions(+)  create mode 100644
> > > > > Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> >
> > ...
> >
> > > > > +
> > > > > +title: NXP Battery-Backed Non-Secure Module bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jacky Bai <ping.bai@nxp.com>
> > > > > +
> > > > > +description: |
> > > > > +  NXP BBNSM serves as non-volatile logic and storage for the
> system.
> > > > > +  it Intergrates RTC & ON/OFF control.
> > > > > +  The RTC can retain its state and continues counting even when
> > > > > +the
> > > > > +  main chip is power down. A time alarm is generated once the
> > > > > +most
> > > > > +  significant 32 bits of the real-time counter match the value
> > > > > +in the
> > > > > +  Time Alarm register.
> > > > > +  The ON/OFF logic inside the BBNSM allows for connecting
> > > > > +directly to
> > > > > +  a PMIC or other voltage regulator device. both smart PMIC
> > > > > +mode and
> > > > > +  Dumb PMIC mode supported.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +          - nxp,bbnsm
> > > > > +      - const: syscon
> > > > > +      - const: simple-mfd
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  rtc:
> > > > > +    type: object
> > > > > +
> > > > > +    properties:
> > > > > +      compatible:
> > > > > +        const: nxp,bbnsm-rtc
> > > >
> > > >
> > > > Missing ref to rtc.yaml.
> > > >
> > >
> > > This is also missing start-year
> >
> > The RTC counter will be reset to 0 after PoR reset, do we still need
> > to add this property?
> >
>=20
> Is this really an RTC then?

Sorry, I think I misunderstand your previous comment. The 'start-year' is u=
sed to expand the rtc range,
I will add this property in V2. Thx.

BR
>=20
> > BR
> > >
> > > > > +
> > > > > +      regmap:
> > > >
> > > > Use vendor prefix, descriptive name and description. Where is the
> > > > type of 'regmap' defined?
> > > >
> > > > > +        maxItems: 1
> > > >
> > > > I don't think this is correct. Rob explained the simple-mfd means
> > > > children do not depend on anything from the parent, but taking a
> > > > regmap from its parent contradicts it.
> > > >
> > > > > +
> > > > > +      interrupts:
> > > > > +        maxItems: 1
> > > >
> > > > You have same interrupt and same address space used by two devices.
> > > >
> > > > Both arguments (depending on parent regmap, sharing interrupt)
> > > > suggests that this is one device block, so describing it with
> > > > simple-mfd is quite unflexible.
> > > >
> > > > > +
> > > > > +    required:
> > > > > +      - compatible
> > > > > +      - regmap
> > > > > +      - interrupts
> > > > > +
> > > > > +    additionalProperties: false
> > > > > +
> > > > > +  pwrkey:
> > > > > +    type: object
> > > > > +    $ref: /schemas/input/input.yaml#
> > > > > +
> > > > > +    properties:
> > > > > +      compatible:
> > > > > +        const: nxp,bbnsm-pwrkey
> > > > > +
> > > > > +      regmap:
> > > > > +        maxItems: 1
> > > > > +
> > > > > +      interrupts:
> > > > > +        maxItems: 1
> > > > > +
> > > > > +      linux,code: true
> > > > > +
> > > > > +    required:
> > > > > +      - compatible
> > > > > +      - regmap
> > > > > +      - interrupts
> > > > > +
> > > > > +    additionalProperties: false
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - rtc
> > > > > +  - pwrkey
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    bbnsm: bbnsm@44440000 {
> > > > > +      compatible =3D "nxp,bbnsm", "syscon", "simple-mfd";
> > > > > +      reg =3D <0x44440000 0x10000>;
> > > > > +
> > > > > +      bbnsm_rtc: rtc {
> > > > > +        compatible =3D "nxp,bbnsm-rtc";
> > > >
> > > > Use 4 spaces for example indentation.
> > > >
> > > > > +        regmap =3D <&bbnsm>;
> > > > > +        interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +      };
> > > > > +
> > > > > +      bbnsm_pwrkey: pwrkey {
> > > > > +         compatible =3D "nxp,bbnsm-pwrkey";
> > > > > +         regmap =3D <&bbnsm>;
> > > > > +         interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +         linux,code =3D <KEY_POWER>;
> > > > > +       };
> > > > > +    };
> > > >
> > > > Best regards,
> > > > Krzysztof
> > > >
> > >
> > > --
