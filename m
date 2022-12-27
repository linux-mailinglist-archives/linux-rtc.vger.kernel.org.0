Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1D66566A4
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Dec 2022 02:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbiL0Byh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Dec 2022 20:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiL0Byg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Dec 2022 20:54:36 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2072.outbound.protection.outlook.com [40.107.8.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD22EBE5;
        Mon, 26 Dec 2022 17:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQwPbnUZj91ph2bNSIxxG1wVJlT90bsu8ho8SB9rJLobz6QEBfxfFqNfCuXo3qBKIZHHWjXolFrZHnOiKKpaaCj7vdcXjXJoReQnSjN2/EfcBezjHp5NGc6ylITbfO7qzxNwLY+eQJTtSgoBIjqy9W2DTLIDUR5VYwuEK46uHlKGwOREXUv0bhG0c1OZHeBz5YgLmUhQ65laQNyiRDCWM56fBCrRAypiz3YWSrxwwCgEl0ROcImtbpf+Qc6KG9IaFSo6X20HToWX1aVQaOSPJ4QVGqcKJU7GXztRHY5JgA27xliaABzxnQ1zH9Ku0QFaWBME1H3CTeMbn8Lp6Kmo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t65PtGVevzvNbqW+FgVdetXsx78j2Jx07bnd3zibDxo=;
 b=kh8zvSrM9W9JVOyRjT0geI3sNP6I9ZZyfU5gnU3uMFtS5SGW85N2jI9jqBcHf2pbLhiwrrqwzYnC8NS/EdMz2BqEnBYX9r3EQZ3tYsmeXLgBeJhxUEhtuLOR0NSULYhBplC2pv5Y0xlSQMcxFYENZzBUPidbKM4V54JpC4YmhjPjm4sNcoLIEjU85mVKlAt0rDBX8kQD4fM0UeNHCl/ssbPKoEugJETBensj6nJuksDDYSTj2gZUUHVjNSl6JiSTrElDqdutTEn0dVFZwinc9GYDFuanL7trQoFgZk2I6sgrMnbHVWmbB+CIi+5TOkQ9At+k2UihYS7XTBNwpdTeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t65PtGVevzvNbqW+FgVdetXsx78j2Jx07bnd3zibDxo=;
 b=KFVFuTgaV5EgvVty38hC7bXd6wB9XTzpUbgl1G2bJrrmr/3gxFofYxzZeaFMywOyvmD7LvTl3JAPxNw7Bytt3HEzdadnzqSvRDFQTq2/ZS6tazCX9jo8JKagqdtwR+8pd8SHdBgj2ZreFZqog3doza7U8BJAthLyKaH2TghfBPE=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM8PR04MB7843.eurprd04.prod.outlook.com (2603:10a6:20b:235::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Tue, 27 Dec
 2022 01:54:32 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Tue, 27 Dec 2022
 01:54:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
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
Subject: RE: [PATCH v2 1/4] dt-bindings: mfd: Add nxp bbnsm
Thread-Topic: [PATCH v2 1/4] dt-bindings: mfd: Add nxp bbnsm
Thread-Index: AQHZGNMpATtq2nWjTEGwW8XrZi3BqK6At/sAgAA5ARA=
Date:   Tue, 27 Dec 2022 01:54:31 +0000
Message-ID: <AS8PR04MB8642DF859BB762E46B7465FD87ED9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
 <20221226023942.1027270-2-ping.bai@nxp.com>
 <20221226215550.GA67355-robh@kernel.org>
In-Reply-To: <20221226215550.GA67355-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM8PR04MB7843:EE_
x-ms-office365-filtering-correlation-id: 51d3312e-1fbb-4313-9434-08dae7ad4c38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K6zkcKfL6s9d19w1lrb1F95OqNseRaFUu8krTdKPauXcfo0dmpDkRvAmeZFKCbGU06G4sDg5tchfIS4Oml8cosMUl8Pm9tfLh6MK4ddkpITmUrYM4tV1TurQDTCzp9g5lGxkEufb1TbvnTjqJc2frPZQ1HPI5fRXuR7+r2J1j06Wtkhq2ZtygxwiL0c4qRqTgzT3JC/cAxI+xx66Km3MxnSAQGlWG+bLTHbHIsEQy8qTDYs9NaOXBPjDASDQpJ6OyV1ysolNPZCT14C4EtgFDBznkbeducBekp3tRqTiA9knzbrvAlQ9yZTIGe6M628bSzrLyYWJ+JOHa/gCeQAdo8a/la1Bi6orUic063kJg4V+q5e3CcQOYO+Je2IhfA6PDhHbjKb8DQdFM092AT4iiYcM4I4g3hyDZX7FxiMv9OJxWG3y/+m53i+k+kPTHcJu6pCuUpUDjA9piAm/F3lQTe5YS9hgvBoZ3irgN3ku+HE1K44JNazpIAgW+1JizjUZnzxdOwXvnJ//YWgxALRBdo5CcM5TY3CVMGWoFkVA0Qb5/1dEedWLc3Dn8uWYhf5OWUHWD7NhNgKI5GcS4Vw1+jAFOGIF0FtlsTEbyEDqal7in2kydO2/+EqfhjmvN00I2JoXFDjNlYCjPeJ+B/AJ4SugaShULuWvZAQ5+d/no3yHHdtVoFsz+5FiUVtlfMoD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(41300700001)(478600001)(7696005)(122000001)(55016003)(38100700002)(6916009)(86362001)(54906003)(71200400001)(26005)(186003)(52536014)(66946007)(76116006)(316002)(66446008)(8936002)(8676002)(66476007)(38070700005)(66556008)(4326008)(64756008)(33656002)(5660300002)(7416002)(2906002)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q+e3G/HI5XPySExiHaC4FO2hKcsBmcCleIJYKiTSqL9XXCZMKgj9cRwDN5gm?=
 =?us-ascii?Q?pHzj/S7lcDacCJyG/0HkgZ9nu5b9dq8xNnfDBx6YNQHsgDKfTouu2+3E1eGf?=
 =?us-ascii?Q?JMI6pjG8fZF6I0m8O6eUT+Qnf548lc71Vd4lZO5HrpCSz51Hc5hqIUOmM4SQ?=
 =?us-ascii?Q?2Fjcw3yj+0mX1Ybr5S685fKJH0xrihE/Pg0mtdFaaYI/540nORoX5yZHW6WU?=
 =?us-ascii?Q?8O27oSyw5xoIcen41vqMSjrCQCDcOBEIkyRP/Dx2FSnQgM4BctigyX3CVONA?=
 =?us-ascii?Q?PqmL5EVmyc9hpg886/IwyVbpQIcZSIN/0Jtz46jajIMA5uWqUOrj0O1AzAEn?=
 =?us-ascii?Q?da0CvoMKir5VUHn2vMHaZ8QD4hLlMcHiVRzQv6D+LvoVIzkACcoWST9IAD6K?=
 =?us-ascii?Q?7cvywGJVJerTZiQgT/W5KdZ+VENQEUB67eW4uQI/KmHnz2XCExvQgIEu/nnF?=
 =?us-ascii?Q?07NUUNm5IxNtWDmYAvDZPzlc0li/6qCJAddM6TO0zQndq/znbhb6k1oPMQKI?=
 =?us-ascii?Q?lglwO6n4sT8k2iTg7MY7m7iRhOdF+EIx0Lb6OqZV17s1zFH/MmB8X6ktvm8w?=
 =?us-ascii?Q?I3p+xkaWHVftrdNZatMV7K1V0obRseU7prsk/XaJaeE1bjAqSrBZhLgp2px6?=
 =?us-ascii?Q?e6tCySzoWMllM/KZR55CT51MNPkOiljzf2VsXvaZAmchwXapWvM8psai1uGO?=
 =?us-ascii?Q?ZSgPSQ/ROYe35LiBk59hfXNAXlQfZj+vCDMNJntWbw+xeDjvgZfqy0XuJ0JT?=
 =?us-ascii?Q?LjEZ0Mz5iuCK548ImpNIJ/npySZOoYJFUuaD1pkSyIEkWaIo3lYBQPM+EYo3?=
 =?us-ascii?Q?sXQ5P/wrfbOVduR/Vgi2ZWmMMTZY1Bdjs8b0P06nK1UcaoD8KFoVY/myuvoT?=
 =?us-ascii?Q?ahGhlGVCMdnOLfLgCjbkzNQhe41Ak2XN+lacKU7Q3tOH+Rc7x5sOQKElZoM9?=
 =?us-ascii?Q?LvUfbkL1OhrSbOs+qPVYBaSB210iTgiYc7HK++ldTK7c0VkbDDNjbG3VO73I?=
 =?us-ascii?Q?vBK10tp0ZLHUT64MbSU4H8chlc8t4V8o6+/nr4ejmzHxwsz+vwMRP7IAdt7e?=
 =?us-ascii?Q?/UHQcw2P6JdqTjHfTwoij0vZ+4dWhCxRO0SOQZC1YMCKAxvubqMzLEoP1CR0?=
 =?us-ascii?Q?f51X47Uj8bw2gvESpPiaoTcjTf35NkAW5Oqmj/CZQxT36Df+PRPnkKalpsXu?=
 =?us-ascii?Q?E9tRKfPuJLrCYCvCL/2xvdimty7Sgbc34GSn9nL/sGq8V3s3ncx+oqMEXcok?=
 =?us-ascii?Q?n+1VH8iE1F+fhJez47QWDSfl93EBRs+SQCn4CdMuUpiy6S70WAlSBfUertKz?=
 =?us-ascii?Q?jhjCOF5PuWagLgCLQsHv6nU612NgefMPyNXnEynNUgzdPyMjiZIdnJq1/wQd?=
 =?us-ascii?Q?xejpvj8y70wR6XSyL055sTViX/fsADDPcjdiuY4dRzg1admnI8ZAv/U8rc1O?=
 =?us-ascii?Q?P0KpCj8php/aIvyGAgOc0hE4Tsj0A19O4XXud69lujfFNkczsg26RTOI3KZD?=
 =?us-ascii?Q?Mg/JuurBiWqhf7p7J8ISsU1wVrGdxB4y8n5FDUXIlMpSfpvGWrGRbiHQDg7a?=
 =?us-ascii?Q?gete6o/VnvMlNrNZXGE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d3312e-1fbb-4313-9434-08dae7ad4c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2022 01:54:32.0168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ax8jrDWFVMaU89lFvS8VJlesWTqFmYDkQvg4MkfB+EKap+jPtxf/B7Am+6ImoWDo7p+gWhPxwEjYCiUt98ppHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7843
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

> Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add nxp bbnsm
>=20
> On Mon, Dec 26, 2022 at 10:39:39AM +0800, Jacky Bai wrote:
> > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >   - v2 changes:
> >     - remove the redundant 'bindings' string
> >     - add ref to rtc.yaml
> >     - add start-year property
> >     - rename 'regmap' to 'nxp,bbnsm-regmap' and add description & type
> define
> >     - add header files including in the example and correct the
> > indentation
> > ---
> > +
> > +      nxp,bbnsm-regmap:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle of the bbnsm node
>=20
> You don't need this now, it's the parent node.

Thx for review. yes, it is redundant, will remove it and refine the code in=
 V3.

BR
>=20
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      start-year: true
> > +
> > +    required:
> > +      - compatible
> > +      - nxp,bbnsm-regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +  pwrkey:
> > +    type: object
> > +    $ref: /schemas/input/input.yaml#
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-pwrkey
> > +
> > +      nxp,bbnsm-regmap:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle of the bbnsm node
>=20
> Same here.
>=20
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      linux,code: true
> > +
> > +    required:
> > +      - compatible
> > +      - nxp,bbnsm-regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - rtc
> > +  - pwrkey
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/input/linux-event-codes.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    bbnsm: bbnsm@44440000 {
> > +        compatible =3D "nxp,bbnsm", "syscon", "simple-mfd";
> > +        reg =3D <0x44440000 0x10000>;
> > +
> > +        bbnsm_rtc: rtc {
> > +            compatible =3D "nxp,bbnsm-rtc";
> > +            nxp,bbnsm-regmap =3D <&bbnsm>;
> > +            interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +        };
> > +
> > +        bbnsm_pwrkey: pwrkey {
> > +            compatible =3D "nxp,bbnsm-pwrkey";
> > +            nxp,bbnsm-regmap =3D <&bbnsm>;
> > +            interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +            linux,code =3D <KEY_POWER>;
> > +        };
> > +    };
> > --
> > 2.37.1
> >
> >
