Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93816F564B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 12:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjECKgN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 06:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjECKgN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 06:36:13 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C0810C;
        Wed,  3 May 2023 03:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhNIzexOP3XZ4DWBkDZpe+oYsFabNf+MM9i4QGtlo6cLdwU1OUUIxHsEfNYe4PoHlUXiJeZnoWsIJCL6lReRgzBPxi79sCRi6PuKheR4b0kiXcYt6JzCP5o3JcF2p3ubixoIcFy8SxBwc1qWu5zFGlE88amOn5k80PbgkFBcg8UYza4o6OMr7EVRIwbt01NqTKlZrdkM2SAQjYbS1H49vQVTXPCLzjManMjr31JF0vAFwoi52l5WSvEszQvMWQ32j0snvFCrg17OFgMoMj9ezy84p7lfSgEJklnxVGPorUYDNQUT8l+GqtVk5iZlaxZiw7Uw/tYAWi7Cqm/AliI4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+vjiinXykaFR0py5Zxbdvyga7QKwX4VET2RHpOZL+U=;
 b=Io5XB9xoSG33VJ9Mxj9dvAznzxnmnE8O4nfQl05+dFs30KHHJjV9PMCpK1IXRJ/PqxBqp56gC/d/G9xTk5W3NnWPinbEnijB+tA36Ck3FQwEakPfLsNTTIkMRYWL2UEE3n3mb18otEXOvRo7+wmzNyh6pZk5J5JOBp+sGZDtxlafDo+UC/8pZZOE60fQN9PM0Ib8claofdgYthovaVXPGsuc7rGyI6NX/5wYYDLV1hsEDYnVVt+frmdI7kzoGuXzfR70+y3/MgVScYO4/jjg8XUvzu03VIkPNfsDadGCJT2YHmxLTSm0ykmg3xc1yoiRGhoH7QpS7iJXnxzslMbJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+vjiinXykaFR0py5Zxbdvyga7QKwX4VET2RHpOZL+U=;
 b=whj1SH54rRMULzHOHtetmAdlTF51QPIsV6exfuY+Q7JSpTjlk3tVcTWX1QLwoeZ5QAW+aaxkYfYaVTe7i8ac1PfmxaempLoNvsa8k1ThsVlF31DAzYdbUJrfOXqyt1VXn3wX75sOiUdvG4D8HfzC+CXTOIvUOxlkjXc2JyHIv0I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSRPR01MB11696.jpnprd01.prod.outlook.com (2603:1096:604:22d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 10:36:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 10:36:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Index: AQHZfZvAkKrBUOZKYEaRmzaYqKPbDK9IRqAAgAATdCA=
Date:   Wed, 3 May 2023 10:36:06 +0000
Message-ID: <OS0PR01MB5922DDA5F5F112DF8B7755E5866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSRPR01MB11696:EE_
x-ms-office365-filtering-correlation-id: 1e3e877b-9068-4bd9-9246-08db4bc233c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iij6sSk8KkYIEYptYgA16WAq9E74XlJjInsf9zyAsfkIQem4bGuQYli7Z+D9NdoV7Y7GcJTHSWWqG70ZLwMPP15O4IGDgN2pCGNY3S0S7X5JDt/twmu9Ar+eBMaj47z2G93p9Me8Chc7jFUNrtozMN/4IN2GBJ7xrKiwIqoMOREds07PgbYKcokr4yfXqKD7hS2qjHr94qPxRoCgE0v7tF3DrAFoSISw16FkxCc8mZE8BSmUXZZoJMk8Yqep+NDa0nYs/1nS40OPYDcZwM4HMTcTh39StdaCIn7OLHwUcLWCCp9uYln4j+Z2oYdx2KTYMI1/PelSRpCxC08CRzuWZxjcnbbl9z5RLLw0cO5lIVH1qYRZ5snpjNOXYkSLKpaCULZqIR2NymYFAPXjrV2K4ALglyvQdpUEYWDBpm6t6ki/iYuPFg+x0d9q/nLRL6CYpxsx7bYFcUwuEk35s3oqN/sQ+wCkyrtG378Csvp9eFFYjnQtydCf9k44HRmwi4IKWWCxnJ61DggyD+tVljJOT/5YdnyjTp2KjScIYB1HgLFuiiXAk3gxH89+kOAvBOMueVYJMKIV6lrTPKi5q0PkNxHEbp6bnflUDA0sjRd86/RKx9aDC93p27mmEu36ZfKtPB7236su07Bn5NgHW6rETA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(122000001)(52536014)(5660300002)(86362001)(186003)(83380400001)(6506007)(7696005)(9686003)(26005)(53546011)(38100700002)(38070700005)(2940100002)(8676002)(8936002)(45080400002)(54906003)(55016003)(966005)(110136005)(33656002)(41300700001)(4326008)(316002)(71200400001)(478600001)(66446008)(84970400001)(66556008)(66476007)(66946007)(64756008)(76116006)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8x5R1bp62BPBw82DDG775v/SVB95chtlQutG+YkBX5uCz2H2sm6K7aG2okP5?=
 =?us-ascii?Q?hRsDSFGpaDsfl1nK/dqFMpBQjewWjPzs5NOf++uSl+VLAygbIQhr9cF0HVOr?=
 =?us-ascii?Q?fIHzOvjcb/RCbSYA21MhJVGNOAvE/5iq8/bhsSqPGl3OHvDYnfY4voG76scj?=
 =?us-ascii?Q?/wlK8IPNZU8VBqVzxor7Xbvs5g+Kx3woz+isAG7YjlzGMDcT4+De1JaBVbfb?=
 =?us-ascii?Q?/fDjVHsoJGcoT0ek3luWc1355+5PoFCuegfzUCza8FOyrAvIMP5ViDOFn9qR?=
 =?us-ascii?Q?ws4VoB2x+VfFpbxrODMu/7LSBsXxKha5ivO369k2O+31TCKqwaTIuYtzN5MQ?=
 =?us-ascii?Q?SP+Fm4l8xTBeGRgXucPgLsq5gbvXaQKxhFHGAaG764LZKyolWZZRQuf4JAx+?=
 =?us-ascii?Q?hyFF/cxKjtHfyXiF+yTXMqp0Y3rzd3y0XqqlV+rO6dOVWSzy2rViOe35+95w?=
 =?us-ascii?Q?EZEozAOLVuT7m/e9AFPkaZ+V9RJgee+X4UIK5HUtQbfHJ3hlTW/hR4ex68/N?=
 =?us-ascii?Q?bhwSNvBJQnmAsR57bJBhIL939EDqY+zfSYqJiiqP8pVeAiE11JWkHRdW0aeW?=
 =?us-ascii?Q?NbKYyn+l6l7DLyi4bPd4PPRqaILTfPF6dVHqfCBr7tJ3nnVNqc3qPqjVRXa4?=
 =?us-ascii?Q?OATIioQxOMAAnETo2X7B+dmZr6aGmwFew5vHrRuuVgW0aB5y7VxKYUeHcg7n?=
 =?us-ascii?Q?ALEHIWba+ndWP/iz0BrMANyaKvIHno2I+sifPWSL3O/D4ePlnl5QWggFQOxQ?=
 =?us-ascii?Q?IYcTJLkmS8Ue2HCXABiYawcFzHs4N4KlaiF/0IyfbPktXB7S/z4K6IxRtST3?=
 =?us-ascii?Q?cJVTmgzAMPLhMyEr+ig/Hjcn90Zz/k+o0FLE3C0y7G7c3uw72rPNUuV3UMLt?=
 =?us-ascii?Q?l7VGwPerahc5kNF5dxalHIuCmInvOT99Xq1xxLAP8FP8NA2aKQGuCdyzXEwc?=
 =?us-ascii?Q?KztOGhQG0dDYOuL0kj4oZXfU0dQrAohpU00bcRsuN2X6qu2+MfPCZF/JKys0?=
 =?us-ascii?Q?fAcVib8GiBmcoLy567awaLQSJmVedvGpzEACQd1tgmb16DUSpae2q7f74eNP?=
 =?us-ascii?Q?TywZeiUH7MufELnY0bSiMjpUzqVgOeBV06vEejsW8f79uQgsA0jAPNnA7h22?=
 =?us-ascii?Q?D8lE3fbORgX8b8ABpxX7xSbMMYkbLF5ief94AAAHJsJZ5GN0O+QQoLeiUO3m?=
 =?us-ascii?Q?CETYCD7jthO0lH8Tw3RwX28eCC3zQN2K9+Bovt/IAWzMpwtnzHmUmAEZqBjs?=
 =?us-ascii?Q?3LygzDXEMQAK+GWJfVHt6wCQ6ce3Ji0uskjIxfCPq8m/IhkwGkNIK10Of3fj?=
 =?us-ascii?Q?RJtZpoRkJqshAh9OqXbJuur54Ac5V0/zgZju9g06ej56zK/GJ48/kMRaNoqt?=
 =?us-ascii?Q?Z6Tmrn/7Vwee4Zd9BBjplXIBizGn96g9R42eRYqY5GnOR43ouyxuUrDV1QOe?=
 =?us-ascii?Q?nd/CPqwLwboPjGMK7lfXp7ta7rX2uCPTF++Mni3NspCFPbSLkdmMiWwge3DX?=
 =?us-ascii?Q?aRioIxm45himcVUo9uj9Uu85VQywS6fVLcg3srfGYZJMAI9vZLuPj5V5Y85+?=
 =?us-ascii?Q?1uPffBHWPsQZ0L1wFcMSbj1pGCzUoeRcRuN2CLBl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3e877b-9068-4bd9-9246-08db4bc233c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 10:36:06.6898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpzHKdnsXnhvDgC2LSDyjwevdDvOfNxmXVIfqR83PWqY6IVmZ4FBUW3Pd0vm8uNnYjtD4HaEHMJxsD9GdSLK0yzXJTyNiNwceDTqrc96QfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11696
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi All,

> Subject: RE: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-
> schema
>=20
>=20
>=20
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Wednesday, May 3, 2023 9:46 AM
> > To: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Rob Herring <robh+dt@kernel.org>;
> > Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Trent Piepho
> > <tpiepho@impinj.com>; linux-rtc@vger.kernel.org;
> > devicetree@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> > Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
> > json-schema
> >
> > Convert the isl1208 RTC device tree binding documentation to json-schem=
a.
> >
> > Update the example to match reality.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
> > .../devicetree/bindings/rtc/isil,isl1208.yaml | 74 +++++++++++++++++++
> >  2 files changed, 74 insertions(+), 38 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > deleted file mode 100644
> > index 51f003006f04..000000000000
> > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > -
> > -ISL12X9 have additional pins EVIN and #EVDET for tamper detection,
> > while the
> > -ISL1208 and ISL1218 do not.  They are all use the same driver with
> > the bindings -described here, with chip specific properties as noted.
> > -
> > -Required properties supported by the device:
> > - - "compatible": Should be one of the following:
> > -		- "isil,isl1208"
> > -		- "isil,isl1209"
> > -		- "isil,isl1218"
> > -		- "isil,isl1219"
> > - - "reg": I2C bus address of the device
> > -
> > -Optional properties:
> > - - "interrupt-names": list which may contains "irq" and "evdet"
> > -	evdet applies to isl1209 and isl1219 only
> > - - "interrupts": list of interrupts for "irq" and "evdet"
> > -	evdet applies to isl1209 and isl1219 only
> > - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> > -	Applies to isl1209 and isl1219 only
> > -	Possible values are 0 and 1
> > -	Value 0 enables internal pull-up on evin pin, 1 disables it.
> > -	Default will leave the non-volatile configuration of the pullup
> > -	as is.
> > -
> > -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and
> > #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up enabled =
in
> EVIN pin.
> > -
> > -	isl1219: rtc@68 {
> > -		compatible =3D "isil,isl1219";
> > -		reg =3D <0x68>;
> > -		interrupt-names =3D "irq", "evdet";
> > -		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> > -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> > -		isil,ev-evienb =3D <1>;
> > -	};
> > -
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > new file mode 100644
> > index 000000000000..04d51887855f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > @@ -0,0 +1,74 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +ce
> > +tree.org%2Fschemas%2Frtc%2Fisil%2Cisl1208.yaml%23&data=3D05%7C01%7Cbij=
u
> > +.d
> > +as.jz%40bp.renesas.com%7C369929b1ce554af8b10008db4bb2e184%7C53d82571d
> > +a1
> > +947e49cb4625a166a4a2a%7C0%7C0%7C638187003880337413%7CUnknown%7CTWFpbG
> > +Zs
> > +b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> > +D%
> > +7C3000%7C%7C%7C&sdata=3DhhWJWxRzJEgudMmnw%2Fl9DgpL0%2BaPRWfWDK2mGqztl3=
c
> > +%3
> > +D&reserved=3D0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +ce
> > +tree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7Cbiju.das.jz%40=
bp.
> > +renesas.com%7C369929b1ce554af8b10008db4bb2e184%7C53d82571da1947e49cb4
> > +62
> > +5a166a4a2a%7C0%7C0%7C638187003880337413%7CUnknown%7CTWFpbGZsb3d8eyJWI
> > +jo
> > +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> > +%7
> > +C%7C&sdata=3DfigbanniGklELxfV4t10SVsg4i0X%2Bozm68rxXy4pupg%3D&reserved=
=3D
> > +0
> > +
> > +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +  - Trent Piepho <tpiepho@impinj.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - isil,isl1208
> > +          - isil,isl1209
> > +          - isil,isl1218
> > +          - isil,isl1219
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: irq
> > +      - const: evdet
> > +
> > +  isil,ev-evienb:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    default: 0
>=20
> Not sure, default should be removed as per [1]?
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
> next.git/tree/Documentation/devicetree/bindings/rtc/isil,isl1208.txt?h=3D=
next-
> 20230428#n20

Or

as per HW data sheet[1], the reset value is 0, so we should keep the defaul=
t value.

[2] https://www.renesas.com/us/en/document/dst/isl1219-datasheet


Cheers,
Biju

>=20
> > +    description: |
> > +      Enable or disable internal pull on EVIN pin:
> > +        <0> : Enable internal pull-up
> > +        <1> : Disable internal pull-up
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - isil,isl1209
> > +              - isil,isl1219
> > +    then:
> > +      required:
> > +        - interrupts-extended
> > +        - interrupt-names
> > +        - isil,ev-evienb
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        rtc_twi: rtc@6f {
> > +            compatible =3D "isil,isl1208";
> > +            reg =3D <0x6f>;
> > +        };
> > +    };
> > --
> > 2.25.1

