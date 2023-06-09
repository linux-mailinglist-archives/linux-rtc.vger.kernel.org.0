Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EB5729046
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 08:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238515AbjFIGnV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 02:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238448AbjFIGnJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 02:43:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A070B213C;
        Thu,  8 Jun 2023 23:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY4vsA5Ye+0ew01yynrtqVg+iHLOPol18PSpZtha8P27SdKbznFQaAZbMoM0xDmHTMPSR3QU6FU+RtMxP8SvzjZfbTisGa9eUxRURcHhYI+ckS2KF145zcE1p3TGFpsnYNezU2q8dHdMYgyfJL0UWOfmnyrP4/n9c/qHQIL7cMzH61O4/xVjZ2WutnxcnH2OJNGFSYWL8LHsqgsyb+VDfWBBpajRIC1u7imUA21pX4qjRrSZ50l0QRlaVZt3JYMR0buzQYEJ2tDfyNO6dx/PHntX9ISf+R2t3M9102VidZdY/FN11JovrlB58TTSXHN8LvEt8KyUFdkXhEt6tvezkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/yB7eQZpTFp2+5M6ILFZEBE4cK6Vfwyh+Qm04RQnbA=;
 b=dYGvMpByoVYXa7BNn5AX1arT4bMR8zqWOPzhBxGihHLxKb80407R2t88qpA1M+key94GhKRwtYne1AfrAwc/woPZG7shjX90l6SjmAvHNZaOAG3aDoCcT6QH5knEmQ3F1re/Ho12MVEcECL/K+C1m3Wn0GihDHV1r/q460b0FqXBya5hez+agKy3XV+w9SaKF8+iZzw2bk8CjIkr9SdiNJck1WGxanoA7ceFtM2guIhibPNqs72JBZEUvFXdI1/2Rc8mnkkQgvclczZpFtHMgldV3fDPlEVoXPBns5qPl+byA5W6/jy9l0Q0+utNVM3tK1+mM3erghd04pYe6DmQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/yB7eQZpTFp2+5M6ILFZEBE4cK6Vfwyh+Qm04RQnbA=;
 b=J39+u/iUffZCe1RAC4+D6pTANcBhXfmAtgQsLSxh7o4C7/Tz8JjTymtjTuD6irff03is62021O17TeB/DilVx0k4UPiCFrMMPOgfLVRn15wgMTntaOsl7HSBNsdoWSHC4V/1/ibZjmgsqz9LNNef5oMPtDDjh4D9fw8mYGoqA54=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10687.jpnprd01.prod.outlook.com (2603:1096:400:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Fri, 9 Jun
 2023 06:43:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 06:42:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Topic: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Index: AQHZlV4COEgAQ7BuwUq6F3eJWMakja+CD4EA
Date:   Fri, 9 Jun 2023 06:42:59 +0000
Message-ID: <OS0PR01MB592217A7291027A7C27C17268651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10687:EE_
x-ms-office365-filtering-correlation-id: 2536bfaf-2b23-4097-b815-08db68b4c3bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iuSOjMQhNHcskdkjQlskHA50m5Bvhw+qVr8yPr4suG9m2KievB+rjrre468JHafWP9ZQT2FzYboM8OKftu3h0ODqehY+9OcOkmBRLKld0G8XbpHQdC9efmazR+PI/ThoVZajypWhXdCiS62M9Vn6vu4paBlHurJov6fP05iJKbpwB8Gb7wwjxW2nwClqtmPb2eCJ+N6kfxt/S8ZxDUDm0Rrr+ohSjCdBn+jzTr6APPIIbE0Yb2bk4vjlAe7IvKac9Y7NpOJfrLnbA9uPoi0N/z1QrLSWvx6Ln1wJZR9PSuHC+hAfNq8J/aTAAXg9j4pqxxIrZzeyW6+VAQdVxOwxOzK/wNBDN3mFeIC7RiUSjzDzu33qyP0Td8VPOChv1S0XiKI1SbwcGb3XE/mz0AEyZN7cB8bPGEb5TERJSD78MitbHdKIGvyfgnypHPKnONnKT3pPxS/Vzih95EB/POSKGu0JPi0PJst3G9KpgN4nM1E7Bcqy+2IQQ98YSnin0ozPnzCD95QeYSG9UbBSi/RQ2J+ys6dxSu2kNZmcvefHIt8iGGUrrBc/9y+B9Wt+B1Mda+vDto1MsSuqaEaewybz3iBps8RiZxTbAh+LKuXSDGc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(110136005)(5660300002)(52536014)(316002)(66556008)(64756008)(66946007)(66446008)(86362001)(7416002)(76116006)(38070700005)(41300700001)(2906002)(66476007)(54906003)(38100700002)(8676002)(478600001)(45080400002)(122000001)(4326008)(33656002)(71200400001)(7696005)(966005)(8936002)(186003)(26005)(83380400001)(9686003)(53546011)(6506007)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Twzr87u+9KqvaNePYFwRHDGFyqLNTyaMB3tjIxlyd27SshXVbKBpTqY3wGAL?=
 =?us-ascii?Q?rEV9T+h7I1RbSqoa0DH1pbXpBTLQuFjs1w7GC03+FiUgcSDDzsXBRP7eHRBL?=
 =?us-ascii?Q?gmJk3LlxrQ/VUk5bIR/qx04AqyaKsZJAmZVTZpKJBm5FVSzDn2bt2/Y8G45C?=
 =?us-ascii?Q?sTBSp/zKAMK6d1v/wOZ7c6MvvFqh09XJCkghRjpcxNd7jCEhcF9ZEny3Iaj9?=
 =?us-ascii?Q?xyaIDhH4VWlunLlHdqBGPP/Ynbe4lqdCg8BffN1gzGo+qwUJYFU1IJF/QJ2W?=
 =?us-ascii?Q?tR+dEndEBBUqRSx6naKM64T1f/yvySlttTQUiqPQ1wT/nrWeCErAw9xo7rFO?=
 =?us-ascii?Q?3Tq+C3sFJBapI7qVjb5H+IXyXTvcuNcLCG0WAQk9GamaYLBGm++PqdaNAFsB?=
 =?us-ascii?Q?7g4QH3sx2pCxzE8EcfJtW0Q6EdB1i5nX7Nh/Sslke4LtS0XQ8MEXO6J4hxG9?=
 =?us-ascii?Q?kXzCZ8krG25aA2wEQCe8Yu7bVu/ZvNxrkPqGgQuTfUkHNN7VClLo5a3OVg+J?=
 =?us-ascii?Q?rZJWmNjX6z3y1TxKOXNR8zlRQHxQu0fiqgG1fnmN+xyU7EW5zuhRXzW0hp84?=
 =?us-ascii?Q?53vFV2w5rwMZxjEwYAQYy0xbm373zt1aSpEP0fRTEddy0u7c+9lrrBq7ytqa?=
 =?us-ascii?Q?oKoLcpzR3sF05wMhsmCNq2SJCgSZf6KjhEUggrwBAJKCBS8pjY9KbNGnDZsG?=
 =?us-ascii?Q?E69F33xAsQ1pzhcHof0bmwTdenOSTk/fQhxuVdofOh7rL1cvnzNgKz2/uUFx?=
 =?us-ascii?Q?8XDNWh1VSVpanksvVIHslow/sDe+k7OHPXMeJhinximSitxExCI2CGQI2s6m?=
 =?us-ascii?Q?jvEIpqX5c/4El5YsPplhIVfskUubLdrZoN8+y/GRAFxmi2y7ewq0X0Z6MUyc?=
 =?us-ascii?Q?Ic2hC+lZIPKm9TlYEl8HHPEZa2B0y2EB6b9OJQaeO3uT34uYWwLZCvWlGeZG?=
 =?us-ascii?Q?//W4lsSrh10KX9xm4en1oIcAQxylcBniqpcinIiLYpp3J/0vuN4pYIJQKDgE?=
 =?us-ascii?Q?ijuy+CxCrdNSukAEMNEbn+AafobSfAF6GkPpclD7JGZuVKRMNUhW7Fg4ZEDa?=
 =?us-ascii?Q?z1Iiqlrh17XSyG0hIsuZ6Tx8HEL99Avxa6+oqScBznHBqgNahJAiz+Aw3p61?=
 =?us-ascii?Q?pOzyeeyTpBk8rIQHBJq4wPqUeT4a1eXcqwVGaw1UID+/QwaIcG3Mc/I63LkI?=
 =?us-ascii?Q?A4zCu0nsXdcYPsIlIPryf58cBo6kvUiWJdF6sRcPhjVlbjlXhF7gpgt7w5wx?=
 =?us-ascii?Q?amJlY58GyVr9xFlsbaaP5nsiqZTPV9iYPLHtiIMiuAUHHIZ27z/iZjhO6IGE?=
 =?us-ascii?Q?L7Fucqm8xpDbeG5JvUF61twa6VBYKrsyEn5HDzdgTW51nq50FTkwuhsdKQmf?=
 =?us-ascii?Q?z3t4vOufpvAozSIOsX9p/pk3ZKea7nOAMsga1BU2ABBpxXRiSXRw+5BUq3op?=
 =?us-ascii?Q?UPMZsP5k0JgOgl/xPQX7f9TUUm78zHlI89AJQuADGitFWvd7MOzkuOwjLy3K?=
 =?us-ascii?Q?wlwRCDYvMSQiBW9PJxxqXTatijaLrBTskEHVdyWBV5DGyp5kUMepYFlVvlRx?=
 =?us-ascii?Q?uxGO5KrCshU+xjimQRcU+q+wfM0h261YuJGMvoCm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2536bfaf-2b23-4097-b815-08db68b4c3bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 06:42:59.0567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuZwkyzLPteiZVp2NMfLaO7UhVMMC4RBSZdu36ScgRkmCR3fVWYqo6/KYFUOhv19dyBgz5f0/NWt0bewrrAUMP5SbCbjWYtmzkvynbEEiR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10687
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

Is it ok, if I send isl1208 driver enhancement patches patch#5 to patch#10,
as it has no dependencies?

Patch#11 will send later based on the discussion [1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023060214=
2426.438375-2-biju.das.jz@bp.renesas.com/

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, June 2, 2023 3:24 PM
> To: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Trent Piepho
> <tpiepho@gmail.com>; linux-rtc@vger.kernel.org;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> soc@vger.kernel.org; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to json-
> schema
>=20
> Convert the isl1208 RTC device tree binding documentation to json-schema.
>=20
> Update the example to match reality.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v5->v6:
>  * No change
> v4_new->v5:
>  * No change.
> v4->v4_new:
>  * Moved this patch to PMIC series
>  * Added minItems to interrupt-names.
>  * Added interrupt-names in conditional schema check.
> v3->v4:
>  * Added Rb tag from Krzysztof Kozlowski.
>  * Dropped | from description
>  * Replaced the pin name #EVDET->EVDET in description.
>  * Dropped oneOf from compatible.
> v2->v3:
>  * Updated interrupt-names property by keeping the list of names.
>  * Removed Interrupts from required property as it may not be wired.
>  * Removed isil,ev-evienb from required property.
> RFC->v2:
>  * Updated maintainers list
>  * Updated description from original bindings
>  * removed default from isil,ev-evienb properties to match with the
> original
>    bindings.
>  * Added conditional check for interrupts.
> ---
>  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 --------
> .../devicetree/bindings/rtc/isil,isl1208.yaml | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 38 deletions(-)  delete mode 100644
> Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>  create mode 100644
> Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> deleted file mode 100644
> index 51f003006f04..000000000000
> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> -
> -ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while
> the
> -ISL1208 and ISL1218 do not.  They are all use the same driver with the
> bindings -described here, with chip specific properties as noted.
> -
> -Required properties supported by the device:
> - - "compatible": Should be one of the following:
> -		- "isil,isl1208"
> -		- "isil,isl1209"
> -		- "isil,isl1218"
> -		- "isil,isl1219"
> - - "reg": I2C bus address of the device
> -
> -Optional properties:
> - - "interrupt-names": list which may contains "irq" and "evdet"
> -	evdet applies to isl1209 and isl1219 only
> - - "interrupts": list of interrupts for "irq" and "evdet"
> -	evdet applies to isl1209 and isl1219 only
> - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> -	Applies to isl1209 and isl1219 only
> -	Possible values are 0 and 1
> -	Value 0 enables internal pull-up on evin pin, 1 disables it.
> -	Default will leave the non-volatile configuration of the pullup
> -	as is.
> -
> -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and
> #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up enabled in
> EVIN pin.
> -
> -	isl1219: rtc@68 {
> -		compatible =3D "isil,isl1219";
> -		reg =3D <0x68>;
> -		interrupt-names =3D "irq", "evdet";
> -		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> -		isil,ev-evienb =3D <1>;
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> new file mode 100644
> index 000000000000..565965147ce6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fschemas%2Frtc%2Fisil%2Cisl1208.yaml%23&data=3D05%7C01%7Cbiju.=
d
> +as.jz%40bp.renesas.com%7C6425b765422a4c478a9b08db63752444%7C53d82571da1
> +947e49cb4625a166a4a2a%7C0%7C0%7C638213126986073790%7CUnknown%7CTWFpbGZs
> +b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> +7C3000%7C%7C%7C&sdata=3DMWVlU9PbKqZwsoKfLM595a%2BM8kNNScTer6VApvxwlPY%3D=
&
> +reserved=3D0
> +$schema:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7Cbiju.das.jz%40bp=
.
> +renesas.com%7C6425b765422a4c478a9b08db63752444%7C53d82571da1947e49cb462
> +5a166a4a2a%7C0%7C0%7C638213126986073790%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> +C%7C&sdata=3Dxq1qpnrXLjjAr06kMBWUSRqJcY5leluI3JR%2BPZ%2FoU%2F8%3D&reserv=
e
> +d=3D0
> +
> +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Trent Piepho <tpiepho@gmail.com>
> +
> +description:
> +  ISL12X9 have additional pins EVIN and EVDET for tamper detection,
> +while the
> +  ISL1208 and ISL1218 do not.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - isil,isl1208
> +      - isil,isl1209
> +      - isil,isl1218
> +      - isil,isl1219
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: irq
> +      - const: evdet
> +
> +  isil,ev-evienb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description: |
> +      Enable or disable internal pull on EVIN pin
> +      Default will leave the non-volatile configuration of the pullup
> +      as is.
> +        <0> : Enables internal pull-up on evin pin
> +        <1> : Disables internal pull-up on evin pin
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - isil,isl1209
> +              - isil,isl1219
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: irq
> +            - const: evdet
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names:
> +          items:
> +            - const: irq
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        rtc_twi: rtc@6f {
> +            compatible =3D "isil,isl1208";
> +            reg =3D <0x6f>;
> +        };
> +    };
> --
> 2.25.1

