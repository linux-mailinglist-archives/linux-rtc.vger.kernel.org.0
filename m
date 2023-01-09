Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1814C661C38
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jan 2023 03:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbjAICQL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Jan 2023 21:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbjAICQJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Jan 2023 21:16:09 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E099EBE9;
        Sun,  8 Jan 2023 18:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0EqH9cCGUrqBIcrE8+XU37s8+twVKzyP8z1467xnKQFtOr+ZbBcmyp4KIjhKtAvoNxHZ6nHx0F6BmACPFhZNlH+CPY432wUAEfNGo62Z+U11bvH7GNoePonrX4T7NX4FQ/8elOIWL0PtZlTBBZmVnzy0ZJhz2J9xmfBxcN2KmTN92gXVLsBUjiSlb0ve4mftGB6gSK+xnQmcZE5l1GDY4pfJzGeozKqFThJoY2Z8xTEETUmyoTcZ+p/Ubgi8lwoL874HCpZd3pZ2l+14dM6ZUqRnqaT7pztn0y6gm6wOscNvyYfeYXqC1jVaTADdibUk/6KoAUS7UN8nYSPSzbLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3715q1S+LMstAjfXf1kQKf2i+09xqfZCOXZPCDGJ+w=;
 b=TSgh9m2TBrhq88oYNT7T8ggfFVm6oHCy9mEMOzS8gGL6KwqqHOyBUdugxF8mOp1/zKPXI1x3I0zz0D6lQlP8OR5/6d1KRJ6HrRPemSzAYFxRVvzBhHJVA1jsKES+iDi8mdR9ADsG7ZAklMzpo3uUjd18Igt7N/XO0wgapqlSuR1DMf4ii9IbH1NCYSnimRUbr8FeUlk6tGyE/iKj7dlZ5uvK4f6j7YZrNHAUND5ACQCrlSuvFKx4ZZS1G1nFPPM09HHoQRthTqmeVaMcx2+uEsBh954GOjk7Fda23asS9XzREAOss+9WYnEInNp+MbtaR3nLhWoxGTV+rxg+k8AWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3715q1S+LMstAjfXf1kQKf2i+09xqfZCOXZPCDGJ+w=;
 b=gQHP4O1ZQZyXx8GOtyJsZgnnLVLgxZ24zJTVQ7wqcpx/oURztDIl6E4PfLpSBUFtJBZm6mPi8rTY8YMdSN7DEgg9IR2DncwlXKUPt5IrE1hQAyuvrsPsbTWx/wy9IQ9FBaCkVv43lAZ4CoSguzlLO3g6WkFp5Asw3srXamLzMUM=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 02:16:04 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::d5b2:afa8:a7fc:73d]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::d5b2:afa8:a7fc:73d%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 02:16:04 +0000
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
Subject: RE: [PATCH v3 1/4] dt-bindings: mfd: Add nxp bbnsm
Thread-Topic: [PATCH v3 1/4] dt-bindings: mfd: Add nxp bbnsm
Thread-Index: AQHZH0d/GDBh/q2WSUmQPE/hEVfJRq6VC2qAgABQL3A=
Date:   Mon, 9 Jan 2023 02:16:04 +0000
Message-ID: <AS8PR04MB864243952ABAEE51514D42DC87FE9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
 <20230103074742.2324924-2-ping.bai@nxp.com>
 <20230108210551.GA268766-robh@kernel.org>
In-Reply-To: <20230108210551.GA268766-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8783:EE_
x-ms-office365-filtering-correlation-id: 796adc70-57d7-4e18-8dfd-08daf1e77632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NLgvxNJ1Z11r39sJ78FlnHyMUIg0QmBltqxPw+xVe39LwiAj1Reun2mSx/QFtyZOZwOuXHzBnUvKJYiE4saVGHk+n1k2Xf5hcl4rpv6tKVeJW0eOfWpHs0lcT5NdmMlzE2XZLslaAWQ6K8RblxaQ5s6cEow5Fzsz9KuujAotG95DUe4VYYe47kAotdiq+Ee7cCGJWU8jU/POv84tf6wiEotvbC2BOCs2KAPXqro64lwr0bTigX4pXFPnmb9na5p1NHcaYK+gzFXu5ZNbs8mNodbfHuxouv4uFm43fZ/1iACGnq18rcit3v2QdUupW3RycAOkj84xJB4pndaoB8cJ597J9CffyCGYt3JDFoqpttxt3y4YlAPgwDipHfBJPV9463JUQdAJFDTt+eIkCgfdc1JV05l7xJ1OkfWob23LVDcdGJoi+JnmT/PTUhb+uLefxD1maXkauvX+Pxt8jDQnX3cneHh/p2Zc0JyBog1bQ6Uqs6fpx8K/whoDhfvMFpgZhygwF/2FKLXCCYv+kcmdXK0TcKSnOROmciun9IFsMazkG53R2eaoa2s4orBqmPyfCo5aCRr7sBPBRAwSTINsnjfgYyU473TLXzLyU//rqtx/3hBeOzkhf2Q1UGzZ5o+uiPFmoaW9qnHbXxm4CF6ozRn/+suggeNqEoX9YHhk3czxqkQPQtcwEF8naFw/tqzq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(2906002)(83380400001)(54906003)(9686003)(66446008)(66476007)(7696005)(7416002)(66556008)(64756008)(5660300002)(66946007)(33656002)(55016003)(26005)(52536014)(186003)(8936002)(122000001)(6506007)(6916009)(478600001)(38100700002)(76116006)(41300700001)(8676002)(316002)(38070700005)(86362001)(4326008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HVnwnTuMkbyUcOqnTwrrh+DXZvSe6R8rC6w2Twx5xe8teExn0UK2cyrhjX1a?=
 =?us-ascii?Q?EabosC3knxVEpavHLU+ZPNOSanJgxdDvRkTwQPhcDn64nnjoRWutSP9KMlvQ?=
 =?us-ascii?Q?Wb1xRTizmGxs/YLHrWMDOHYLAp/ln2r/M+e5ex8A8hut/cn2id+jPM6/18ye?=
 =?us-ascii?Q?WoGHqPEVly6WakHgJRauDqO09OhRx+GclX0uwfefP2j53GKZjK39BTngLAH/?=
 =?us-ascii?Q?hY5xAeVuoHJ638zNLhi+yz725RiogWR5al69+EU8xeOTBgaMs++iYDwvgWKC?=
 =?us-ascii?Q?Y7i+/Ys4wPWawcsOhWKbXCEQH/Jn+9YtJf5JX+x6EUzHCuHPDv2mahF/X+iZ?=
 =?us-ascii?Q?6/MS0vwfiVRPjo5e604+vcn0e8jx7au2xJQhu6KENiwWZQAxQDs3AqA7L/XZ?=
 =?us-ascii?Q?0W9KUingF0wvjr/kbUyZN+Gcnsqcr8WUMlFHwRZK28upNpQTld/oauA4MhRz?=
 =?us-ascii?Q?C/R6prHU02/RXa09yV3LcdROinUlxDXa5pHRS18R+2gVfnuHu3Aw34AEA3S6?=
 =?us-ascii?Q?EfR8iiyGy6V3j+u8gkxK2NAZ0+h9vrPT+O+D/4gjrRXC3PHyWHSmvlKZ3fqI?=
 =?us-ascii?Q?De7Kz7BDy2yu0hw0RnaEJJsex0Z0F3B7Y5BTKy+ank9gQXZDtTlkPI98MlyA?=
 =?us-ascii?Q?m5T2ZlFlLSd9rdYXpxp6uvvvEvsoKX1tJfSzHeqn+ECZKhZKYqcHGgdvJnEt?=
 =?us-ascii?Q?qV1haqlmekR+lRVdon7i/nm3pwg2/cChHwgbGINCRAkOrvoW3j32CzdWWPs+?=
 =?us-ascii?Q?mWBg3xSl5lIfc+CSmv7MhLVHLvmnu/PT/APQjLW81vXmQBNDDBm1EArrUZrg?=
 =?us-ascii?Q?NQaIceHVf2c81GYxby7HQvX1yBQdHWiOWx/sxPf+K6sNPi3kPjJERjlDLxES?=
 =?us-ascii?Q?NijMV5WZJq5NkGfxi9pYUVigmgGFTpVTUJ5NC754T58IiGEzF5kcMGDpGeSv?=
 =?us-ascii?Q?3QBLXYs6uLKlvZ9wWSvztGSByPG2VojGIHMsKEtcZjae48I1TvTkoonXwzfV?=
 =?us-ascii?Q?Lvlub5R6Tccv4tH31p3/PsxsrdDgkg+r9ZYHKO8acCweG9ziMgu5ShLlexfD?=
 =?us-ascii?Q?OnXVL5WUiMVSjnIJgIzSU+J8/6htycn0X9uSj7LIiiwupNfJ4tsslo4pAW56?=
 =?us-ascii?Q?WZ777RsDZmW9vnAXehUPHbPNDRFzi5eTfZDfjEqQUiCmI7Q4g8ubz1eHL+E0?=
 =?us-ascii?Q?aNa0S2Y2RyRn6e9yRHO0HUJzneC4X9xF030QRy2m3xZAdISZDmIWmFgXoGF3?=
 =?us-ascii?Q?brroCtOultHOYQrdL+LPAW0CBBjF1fSjM9tmXtiKOYuE6jf5X47IlZ9mhT6B?=
 =?us-ascii?Q?zieY0Ia2ftAiU47HtsJRnpd21+7u/sectVtqc4K3eDwPqN0YS1HpNXAAKHLL?=
 =?us-ascii?Q?8FfDBv6ADbgbO6oJo/WvhGjh3XnIt+cCxIv3sHVy55V+JgAix365oogvyQtd?=
 =?us-ascii?Q?bPTe0DdR6oY7iYdlB2ykrYXGXC2x1Hf392fxejwfRRuh6fCVPDsnFhVF5CjX?=
 =?us-ascii?Q?qDu1LVJL3Gyk+4aqHwVb/Bsm95zyc94EqyhEPYTgu71oEy1J30UesX2HxS4V?=
 =?us-ascii?Q?r68gXrALfGC30jAEDgk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796adc70-57d7-4e18-8dfd-08daf1e77632
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 02:16:04.8798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axQmZ8sC83jq7Ge97SwUdbBwJ4z+Q9789/zjUUQlOJm5M3yBOZKYRHM0lRvpyUDmXv+vfZJB4XHkfAa9EpY6kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add nxp bbnsm
>=20
> On Tue, Jan 03, 2023 at 03:47:39PM +0800, Jacky Bai wrote:
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
> >
> >   -v3 changes:
> >     - remove the 'nxp,bbnsm-regmap' property, get the regmap directly
> from the
> >       parent node in rtc/pwrkey driver
> > ---
> >  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 99
> +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > new file mode 100644
> > index 000000000000..bcd8fbc6e297
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> > @@ -0,0 +1,99 @@

...

> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nxp,bbnsm
>=20
> Is this a standalone device or block in an SoC. In the latter case, this =
needs to
> be SoC specific.

it is an IP block in SoC, currently used on NXP i.MX SoC. I will change it =
to SoC specific in v4.

BR
>=20
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  rtc:
> > +    type: object
> > +    $ref: /schemas/rtc/rtc.yaml#
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-rtc
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      start-year: true
> > +
> > +    required:
> > +      - compatible
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
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      linux,code: true
> > +
> > +    required:
> > +      - compatible
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
> > +            interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +        };
> > +
> > +        bbnsm_pwrkey: pwrkey {
> > +            compatible =3D "nxp,bbnsm-pwrkey";
> > +            interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +            linux,code =3D <KEY_POWER>;
> > +        };
> > +    };
> > --
> > 2.37.1
> >
> >
