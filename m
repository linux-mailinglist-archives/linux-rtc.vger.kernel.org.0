Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55856F5499
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 11:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjECJYt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 05:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjECJYs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 05:24:48 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBD41FE3;
        Wed,  3 May 2023 02:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKiAYYI6lJUA957ZHN2rfP3Qk0UvLY9lAL0G+pTBhXmJOqITq3GUjxotSGW7yBVWtQ6PYiWkhyLxsEBHE3XLhwrem0VqA6UA5hmNW5nl4WOkt/kPh0CljpVS2ViVhR0bq82IB8NgEA4J1stganPSKRuIFt9RLFnerTEBaEfvu9cGomabtYb2u+Jb9ScvY/ba2Y97vWyW9sELPKY+6/c3bEYAqTitJzAby9JBFEXIYyqRxLEeKzgZ7gfot5Yb57/ZQzPxDbXqAxYK762Doh6uvd1ZjOj4o46miKyi8IZ52m5o974O+zwLlf3Dyc1mJP14MZNPRpEnEkwdTZpXn50EZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1BwWVtLf5Geckzt1GxtDGeBXAnNijGz5N1CorxgR+s=;
 b=bX8oS6JYcDXgS2nj1v4TxI1yv8UCeVVXS3RsHCOLF1k2pHqOT2i1+onYeJh9cIkpZe07xbO7ePhkIOVZFw1zRhENAn55MRv3LTQog2UZ2co9cG5J8WyxaMSdR0Es9tfo8P0FPwvM0XUl7KLVOyirG0AmHWizcANiN17qdSLZjhZuaumYZfR2Yse7cSvFTrRNWM1lGbJQYzs2tntvVGZmnohKu3CM6mbUdvuYsXtyvLGQS4kOOzY+v9aLwf6HZ85dvQyhDL9WHo4yYEV0pf96P11atZ6AQDAUpZYZ8SajoS3WWHB3kHi7LeP57Wt/wWG/zdZLkEd7MpOLarbvpcichQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1BwWVtLf5Geckzt1GxtDGeBXAnNijGz5N1CorxgR+s=;
 b=JagndZK86+lurg9xpzlheyeBwmR7lQ/AP1tYXI8VHHAJaoMurCd3N+ekyNj/XJMoLB4aFeOkERN448v7ZbkwDHvD7YX3vXeJo5d/4vTVHzSS//xZXXBd3pkja1axGYULrneJIgxAuNGdKgIj3PdcTUbHIGNRO+QWVzWJHlUu8Cg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9941.jpnprd01.prod.outlook.com (2603:1096:400:1d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:24:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 09:24:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Trent Piepho <tpiepho@impinj.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Index: AQHZfZvAkKrBUOZKYEaRmzaYqKPbDK9IRqAA
Date:   Wed, 3 May 2023 09:24:41 +0000
Message-ID: <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9941:EE_
x-ms-office365-filtering-correlation-id: f43958b6-01fa-4aac-5fb4-08db4bb83976
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0y41w0R/QUle/+oVZmwCLKgCWAXkW4lHC6FaDQcVoJC2eD2E2uvsyHsymy20efs5+0U8pLYAYiFhdk5aM/BbpeNUjlJqlO2Ts107UCKQXdNAnM+uEWl5Rr27ZkzOIjffI1lCxQSkzWIs4Yk7JkBCOgm2QpLFqGV5FIskr4iIwFfd6SeK8q+x8zhoTgjdJAgd1UW34druBQk14OmYoICUMAMCxSsUAykmkXM50spLzYlXXciVkdgJIseJtGx7HDH9a/LuI1V68D1kcSa3hLq7jgq3re3A98z91b7aTl9oC/2bUNjAf4oQ85g+VcgSPZq/4i4kXSl5h2JMwPf+Gi6hHcfwrG7Ih3JbkYBwdaywRhyrOxnw2o+poFxHHGuBWqNwm0TGvweNAVp9PAgPbZ4B/3vSvw0NB+KmIfu57rhbPtDB6Y7CJDZEyIDECRhsLo/qTU6SPm2JY22V0DI545LyBu1WHu6vuUTFLg7N515iS6nppyJtXJuvw/n8c33e17Ngv+4FhLOq65eldMNth4PyJhUzVDVZpIskFRVIJd8G849ZUZJP9o3wbSplwLMbP57KiN1QsqY3tIKZsgxAbWdZCYRg0S+iZOvTBwRnsDV4UME=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(122000001)(38100700002)(2906002)(8936002)(52536014)(8676002)(5660300002)(33656002)(86362001)(38070700005)(55016003)(71200400001)(966005)(7696005)(110136005)(478600001)(54906003)(45080400002)(186003)(6506007)(26005)(9686003)(53546011)(83380400001)(41300700001)(66446008)(64756008)(66556008)(66946007)(76116006)(66476007)(4326008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5nLL8xRrTdKT97htYFSROfLEomptnm3drRXaaY0zQxOyrBkIRniRWPe1P7kZ?=
 =?us-ascii?Q?NJh1VaNpHVh65V3ufsYcOQKJbDK1FEHWHUMMV+yTvqFUaw7H8nST1fG73hUq?=
 =?us-ascii?Q?JmS6pUwqIM8uTdR1gtflv3+RPxcu0nlA60rBXgX4BDeJdWXIfw7Nokhh8oAm?=
 =?us-ascii?Q?4itkXQXZxDfpPb56hAjQ/HYS+ZyduxE2wVr9gOYLBjHYseCqJPkWieKYO0kB?=
 =?us-ascii?Q?DSzDEAeZY4KtTKgNunL0t2uPwYCii6uHxJzy12BwltnftHhWaEdvV3UmUpC3?=
 =?us-ascii?Q?un7pI9lULQm3usYIg+fyG7mf+uPpCg9peovyo+aln9Xyol96XufaXZCaaEUV?=
 =?us-ascii?Q?vV6JOp9aEWzAAbZDQ33uqGHMbALM3vQW0trARew/dqSZI1WXdQGqi3TxHnVA?=
 =?us-ascii?Q?kit1KajgrZ7+6NfuIJ1fLOJGu7Grc5eWBpUUnmW/+MmOUcqji57deHPoi8Vm?=
 =?us-ascii?Q?6ZfumNGaVhXAyN0hwxsLh9ruJhMeNeStjneIEMhPqIpQzntKy1gEP0BedRws?=
 =?us-ascii?Q?2n+t56Jr38jIRYH2JgaSu0ppwhrV1qUF2U5119OHwiEddE2JUuWgldvxxCP6?=
 =?us-ascii?Q?6Qm372SZovjpGxhitEbIIszatHJSZ8rGwF+uHLVRbjCJxv5VL/RZ2MDSvDf4?=
 =?us-ascii?Q?Wo3q0Z5jv+7Y0hPB/Ps7M4qaAnp+tHkaTi1jzvl/zaoppFYcMsAoY548dkRw?=
 =?us-ascii?Q?YDGZljdFXRFcj4LmYvgopBB/vfQw4ovP4bW6GQZgp7OKYvf0+wdnlrcdhtBr?=
 =?us-ascii?Q?DjuiGMWdrXyr8tnQ4rZEXSJ1ADUoJKu0jGihJwjJWB4XIyUQmL5A55VHR7In?=
 =?us-ascii?Q?PQrZ1bg1EZ96v67csuWqFdj2ZfStYPuykyl+YRG2s+AVFSavNbJEL4Fht/Ue?=
 =?us-ascii?Q?yQ15e+5RHqI8/cHcl/VuksZnepAFVYd7Y2qU/MRaCqKSKWegZQTTBYranJxv?=
 =?us-ascii?Q?vLcc6dsVqgvDVXYUwR9mB7EwKqhdGQCWQW1FDDZcabyOb+gfVQlc3pgtpg1Y?=
 =?us-ascii?Q?c4+fb8IFpwx3b3vrCbgUWKBRQHqKGkiVVOAkclzal3yaZ3iuRR4bCUxRJ0FR?=
 =?us-ascii?Q?m8Pu4/WDbqk6s9IQ0Z2r3XUnKV3+vRKC4WTP6FBle9mfOJ9GH/0P4WBpWXDW?=
 =?us-ascii?Q?HtkrUa2fuegv/Dlw3Yx8I0PDqYLf2f5DUu2uCZiUuCdGpB8NDV2rU/s/4F1P?=
 =?us-ascii?Q?tb5PCG3yiyiCieq9QKeee+/i4Jpc3wVAEddT+eU7qad2Hi7QwoLJiKlwcCeG?=
 =?us-ascii?Q?MyxB5Qv2pQDXzbQ73YPJ341+SpvMPE5X7SQkcsLqO9c9O3XY0pivt8AN0V3s?=
 =?us-ascii?Q?vqyX7YgqfZGFrURK1Khfz58igDSfvFygV/RX092IrBF+OK+ZGbMxzS7PQtkV?=
 =?us-ascii?Q?PtKiGiHvSxnI3nLQ4zxBtrzqYZ6+/JFoJLrpxZmrKeOgRTfGJyahp4oeovUq?=
 =?us-ascii?Q?GuiK/oM2yTzz6b5WBgMBM9aFSCSHeOGiH4RgN9UmjfeZctj1k9aSNd/qiUFX?=
 =?us-ascii?Q?T0dzIeFDAJTQj2pR5khh8gNA3G+Fz5PQDl0mYwHHX5Ylp6BgEmJZ9lfUJHF7?=
 =?us-ascii?Q?/JzvWtf3SpXjcfYxJ+pgCC3EDOZs4VYCYF9/6Azr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43958b6-01fa-4aac-5fb4-08db4bb83976
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 09:24:41.2926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okCoqJHvGrmNypfpVOcqufoXW8/LY26f44Gmkhn17rAKwu7N9B0bFobxWniIOtf9nU/h//3Ued4fcuamolCr3sYQBEuraTWWxfX6vbxvkS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9941
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi all,


> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, May 3, 2023 9:46 AM
> To: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Rob Herring <robh+dt@kernel.org>; Krzysz=
tof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Trent Piepho
> <tpiepho@impinj.com>; linux-rtc@vger.kernel.org; devicetree@vger.kernel.o=
rg;
> Geert Uytterhoeven <geert+renesas@glider.be>; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schem=
a
>=20
> Convert the isl1208 RTC device tree binding documentation to json-schema.
>=20
> Update the example to match reality.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
> .../devicetree/bindings/rtc/isil,isl1208.yaml | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 38 deletions(-)  delete mode 100644
> Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.ya=
ml
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
> -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and #EVD=
ET
> pin -connected to SoC gpio2 pin 24 and internal pull-up enabled in EVIN p=
in.
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
> index 000000000000..04d51887855f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fschemas%2Frtc%2Fisil%2Cisl1208.yaml%23&data=3D05%7C01%7Cbiju.=
d
> +as.jz%40bp.renesas.com%7C369929b1ce554af8b10008db4bb2e184%7C53d82571da1
> +947e49cb4625a166a4a2a%7C0%7C0%7C638187003880337413%7CUnknown%7CTWFpbGZs
> +b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> +7C3000%7C%7C%7C&sdata=3DhhWJWxRzJEgudMmnw%2Fl9DgpL0%2BaPRWfWDK2mGqztl3c%=
3
> +D&reserved=3D0
> +$schema:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7Cbiju.das.jz%40bp=
.
> +renesas.com%7C369929b1ce554af8b10008db4bb2e184%7C53d82571da1947e49cb462
> +5a166a4a2a%7C0%7C0%7C638187003880337413%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> +C%7C&sdata=3DfigbanniGklELxfV4t10SVsg4i0X%2Bozm68rxXy4pupg%3D&reserved=
=3D0
> +
> +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Trent Piepho <tpiepho@impinj.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - isil,isl1208
> +          - isil,isl1209
> +          - isil,isl1218
> +          - isil,isl1219
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: irq
> +      - const: evdet
> +
> +  isil,ev-evienb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0

Not sure, default should be removes as per [1]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/rtc/isil,isl1208.txt?h=3Dnext-20230428#=
n20


Cheers,
Biju

> +    description: |
> +      Enable or disable internal pull on EVIN pin:
> +        <0> : Enable internal pull-up
> +        <1> : Disable internal pull-up
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
> +      required:
> +        - interrupts-extended
> +        - interrupt-names
> +        - isil,ev-evienb
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

