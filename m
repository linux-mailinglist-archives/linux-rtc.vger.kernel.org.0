Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5F6F7CD6
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 08:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjEEGOO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 02:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjEEGON (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 02:14:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602A314349;
        Thu,  4 May 2023 23:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb0o5Ll79NB753e8Xaxy5oR3vHXJGWxV6LfOWWbtrXYBXWo7Sk0Pc6fIt+inarJM5O/+c7j6ZIytIkzyy9dFbNoAPT1BewZl59b/2+xEjYVHghhOSJg+7ayi6oFXjDtgRWhu6UTVDwA3YgTyW3+zyNFlXOOfgyeRWIOFEY/CQFgKV6oKsZyS6YaM2k83o1TL+Duwvihesds5nyXoBYHPcwiWePOrjqJdkg7VKX+iqvVJHI/3LbCZpnHN40OO+xH9m/qADvKFghwukosmGXk9xP2giewzNQEwi07ia/SNtCYHsHnWLNNYF7fZl3Suds0HRTS/ped02ERnPnjKpQeA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzT2HOcUwESHMDE1PEu7Rbq/2UKaTVGO7/DxrQS24Ug=;
 b=iy4SzQwDQ5L9YOMy0hqUzMmyJtFz1DSzyvLlXV6nuABXEhc4lnpC7dcDgs6XpMl1emtRDRS9GsYcgywjswk7T/NabvSFpIhH7mQKFN1Y/Lxqt7TVMCjQyMK17MHGCH2xFg6c6OyU+LMDwacVn6kCw8g0uORXEdI2uDyTh6c1H92NTFfncaiap0IINBBDtiJ9IHPhKdDDflHywRK/JuEi2uHh8Io3R/Rpj6cANUs2HwsY+lzkGq6Czxi1gTL5B55Ef62eoQVkQcr19WqAv3Y3pz8jP3LdRAb71IJ239spLawKb2seoi6LuIp18fsqY6u58lK6BeAUoD15o9x0RjHDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzT2HOcUwESHMDE1PEu7Rbq/2UKaTVGO7/DxrQS24Ug=;
 b=FjL8UsJbXaLhnGMiqDJvGlB1ZF19Gz5Ap72bQZbYYZgJiK3qvoL29RHK41E1yUwQmpqFRtjzbzw/zEG1jUTWW2cp1QRNapWIam53K5KWfBqKYczIt+7E7aCMObCybDbi/+zzjKH7OUaLRGgZCTjehfCXFKTVoNKQxY/btCCvEXo=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB11340.jpnprd01.prod.outlook.com (2603:1096:400:3f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 06:14:08 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:14:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
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
Thread-Index: AQHZfZvAkKrBUOZKYEaRmzaYqKPbDK9IRqAAgAATdCCAAfKGgIAABjkAgADiz3A=
Date:   Fri, 5 May 2023 06:14:08 +0000
Message-ID: <TYCPR01MB593378429752A6EDC987484186729@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922DDA5F5F112DF8B7755E5866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922E58C3A0DDF0EFD4E854F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <306f000d-6eec-cf90-b494-f391ff3d387c@linaro.org>
In-Reply-To: <306f000d-6eec-cf90-b494-f391ff3d387c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB11340:EE_
x-ms-office365-filtering-correlation-id: 8ce72162-1d67-405d-f7a2-08db4d2fefce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6al8ulK5adzdxusU9pjlVLRsI/JVBj7brl5FiiR54+ywjUlDtJJMcsUozcyOonndCshEJwgBKy00gQZxaZE/hLKlR2Nwe8LepNIYT4pkWumA1D1sAF8/vdZTeFubn8i8x1e9ipsxqaqHqf5q07uMk8v5Wg3/hrBn5Z2vXGthJrKoIMnNNVl+itYbhiBQNOPxnBTjUeMidScTb0y36WtwcsvQNXp7dm7i1FvMyvR2LLVofrOXNcWCLWWBxgh2HDUvHG314R/CR9sX8xqx3tRd/jCeNwZJWFT2ieIs3IZ8uh4zBDJ5wnFGSuPKacSqonQPWE3ipOHZnWiutiE+zkkNQl1+xxKeUUkkBYvffR8l1Bn1m7T7ba6JEsHZ9mOjMkWMLp9xIMMwJj1jqiqWXxRPbauXj8u6tlbKCggGLvRGj2OfnRMie9Fob1uB5ULuvnf7DUTR7XFAVzQ5bEEg/eBW2vvI1ZqhtEzWMGVjXhx9ctCLsNRRK43+EbX0IJzxxwwBsQOIq8K9ZbwIFrKpbUujJ7rgOyHAQ1nyZA1+XaXp+VZ98C8csE7CM2v7Co1pwfoF1P7IIpf9k4o/v1DXnSiYr4WWeYP5k0i3u90ItVRkoD4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(33656002)(86362001)(71200400001)(316002)(110136005)(54906003)(66556008)(66476007)(66446008)(64756008)(4326008)(66946007)(76116006)(7696005)(966005)(478600001)(41300700001)(55016003)(8936002)(5660300002)(52536014)(8676002)(2906002)(7416002)(38070700005)(122000001)(38100700002)(186003)(26005)(53546011)(9686003)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wgcuw7ZgugcpeHf82pCnGPXRJ1rN/0LdXJJtYV2CPXgiec6knBJiXeYOrMy0?=
 =?us-ascii?Q?K9vfVfns8kriM2a6g6MIHArogaJz34nuwGNcW8awz7JkOCT2EwJmv4TRVJyW?=
 =?us-ascii?Q?IuyX9a+nthpxbkN2I2+UmdH3DhFLFS7LikVd7bZrisEkVGDVY6f01d7vb8bH?=
 =?us-ascii?Q?K22kQGvSOYSa6z437bcQ+/qQmnAU6RXoVin1RDelnn6jLx8bIh7n3flNWZId?=
 =?us-ascii?Q?3J7sGwGo+MQdIs3shXGRbNcwNu/x4dNDv4liAdxpGq4NK9hRHwoSLF0wbzDd?=
 =?us-ascii?Q?KSKAQ3xXmAB5ikd6GZFymaScA+lHeYF1z/Ru7ggk/8cCxtL0fwsn2P4eQqLA?=
 =?us-ascii?Q?PQaTtoC1Jpjt7mr1KlBLgfS3j+kg/EI2DGkifkc9LA/9YTcc59h0TCOKh5lo?=
 =?us-ascii?Q?zQpC86lc9amxXwsw6R9yg3DnjhxmmU+8nIBVKkipNXZglaMSsg45RTz+PWc+?=
 =?us-ascii?Q?JBd3i+IVFSWYe1h1yIJJwzgmnuXUDfQoolI2sBOL75T+zfqD9jQyrmN3XX4r?=
 =?us-ascii?Q?HHzaZ6rf58+dGwKduQiOZE3BGNiCGJEhTTPYWb2Bc25QbGsdulT/ZJBH52oh?=
 =?us-ascii?Q?NVgkTQ8HttIa/9OnjYGFBqYpMioFL1t9FurwDUIn6q6c2+ZdBRN3jGS+DbSo?=
 =?us-ascii?Q?wRxNZZo3o92U5kfOB9pZGORegAmX/MgsKrOp61LLW9RgGLJzTA6M9KQDoFNM?=
 =?us-ascii?Q?tyomIwf9xbsYIZUCX3xeShxHf+JrtwMZehtiAgu9YVamSt5cJ5DBke0oub68?=
 =?us-ascii?Q?VstH9Ry3R38FjyM/S5ecTkKCl7KC+eA5o7MT7N6clVCwYvnnJuS7YjcQFUyp?=
 =?us-ascii?Q?lF+f7AHYrSNLUKOjDuEHzLNDq9tttkDZNunOcBTZaeABMu0aw2HE90LT/Il/?=
 =?us-ascii?Q?5wUSCSYDIFTGZSuTPgvPLlYOR5QqIz6WNjdlek/+YBwS217Rtcg1zXai0Hqe?=
 =?us-ascii?Q?EgqSMe37aHCiYx+E1c9q7kDK71dTGCkHjJKceMebbuzzc9kyN5fz7iOTItJ8?=
 =?us-ascii?Q?5EzT1db6Tg6Ayq2u0+z6aYt/zeS126OU4gtSCHmC+gqIg5k6/ekXBv2bmQWW?=
 =?us-ascii?Q?7Hl24JYcHS9cU130b2C1Faoyv1V/noKCzOZGQ7uZGygWL1w0Y+x2vb04pYvU?=
 =?us-ascii?Q?8SUOKi2TLscBULbPMMe57uDa4N5gjLk1BSzoQp6sUDwD6KPGXYvnlr4PO8Ba?=
 =?us-ascii?Q?AxOxdWo30YaNEptE5L9X3xM4DuX+dYbTGfnzm8AP2BLrOqTw/9+BnUPr4LSy?=
 =?us-ascii?Q?XS2yXav6t1G6N5ru2TZnmF6GIaluKrklouUIhb7pIqFow5VW5+wL6mK42z5p?=
 =?us-ascii?Q?0G1w0ibIF4AYNGfDzvvpe77c6It1/vsX+vtXufTiMrGKnLdWR7vNJuxeCpqi?=
 =?us-ascii?Q?Yk9BQT+R88ZPPjvifUCoa3xmXVZvfQVTeDb8MjHmQXTRvDKfEv9SfvRkQM63?=
 =?us-ascii?Q?9tSeXXWkxEagSdpb1AGMT5JyWtY1lHi8XJ0gaqq9QbhN13a0xVNXn9LVUlh/?=
 =?us-ascii?Q?7P4EHrrC6RbdGv/NTidkSd3IFKJkMHdZ5AGMr9wEEoPF1gzmuOfdF5wk+f3+?=
 =?us-ascii?Q?CO/ueeeZY/U9TtpJjKAPqSyh1KvO8dNqI6SOUBxP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce72162-1d67-405d-f7a2-08db4d2fefce
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 06:14:08.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4M5hu5P8ks1kCZqYe/7W5X/TtEwA9txqUA77oBxNjuxptia9HvzH+PeQ4PMDMg6jAYaXAzzG5lj6YJ+RWxAf0VnFX4rJlXVElEGCIVv5mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11340
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof Kozlowski,

> Subject: Re: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-
> schema
>=20
> On 04/05/2023 18:22, Biju Das wrote:
> > Hi Krzysztof Kozlowski and  Rob,
> >
> >>>> <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> >>>> Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
> >>>> json-schema
> >>>>
> >>>> Convert the isl1208 RTC device tree binding documentation to json-
> >> schema.
> >>>>
> >>>> Update the example to match reality.
> >>>>
> >>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>> ---
> >>>>  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
> >>>> .../devicetree/bindings/rtc/isil,isl1208.yaml | 74
> >>>> +++++++++++++++++++
> >>>>  2 files changed, 74 insertions(+), 38 deletions(-)  delete mode
> >>>> 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >>>>  create mode 100644
> >>>> Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >>>> b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >>>> deleted file mode 100644
> >>>> index 51f003006f04..000000000000
> >>>> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> >>>> +++ /dev/null
> >>>> @@ -1,38 +0,0 @@
> >>>> -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> >>>> -
> >>>> -ISL12X9 have additional pins EVIN and #EVDET for tamper detection,
> >>>> while the
> >>>> -ISL1208 and ISL1218 do not.  They are all use the same driver with
> >>>> the bindings -described here, with chip specific properties as noted=
.
> >>>> -
> >>>> -Required properties supported by the device:
> >>>> - - "compatible": Should be one of the following:
> >>>> -		- "isil,isl1208"
> >>>> -		- "isil,isl1209"
> >>>> -		- "isil,isl1218"
> >>>> -		- "isil,isl1219"
> >>>> - - "reg": I2C bus address of the device
> >>>> -
> >>>> -Optional properties:
> >>>> - - "interrupt-names": list which may contains "irq" and "evdet"
> >>>> -	evdet applies to isl1209 and isl1219 only
> >>>> - - "interrupts": list of interrupts for "irq" and "evdet"
> >>>> -	evdet applies to isl1209 and isl1219 only
> >>>> - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> >>>> -	Applies to isl1209 and isl1219 only
> >>>> -	Possible values are 0 and 1
> >>>> -	Value 0 enables internal pull-up on evin pin, 1 disables it.
> >>>> -	Default will leave the non-volatile configuration of the pullup
> >>>> -	as is.
> >>>> -
> >>>> -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12
> >>>> and #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up
> >>>> enabled in
> >>> EVIN pin.
> >>>> -
> >>>> -	isl1219: rtc@68 {
> >>>> -		compatible =3D "isil,isl1219";
> >>>> -		reg =3D <0x68>;
> >>>> -		interrupt-names =3D "irq", "evdet";
> >>>> -		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> >>>> -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> >>>> -		isil,ev-evienb =3D <1>;
> >>>> -	};
> >>>> -
> >>>> diff --git
> >>>> a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> >>>> b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..04d51887855f
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> >>>> @@ -0,0 +1,74 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> >>>> +1.2
> >>>> +---
> >>>> +$id:
> >>>> +
> >>>> +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> >>>> +
> >>>> +maintainers:
> >>>> +  - Biju Das <biju.das.jz@bp.renesas.com>
> >>>> +  - Trent Piepho <tpiepho@impinj.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    oneOf:
> >>>> +      - enum:
> >>>> +          - isil,isl1208
> >>>> +          - isil,isl1209
> >>>> +          - isil,isl1218
> >>>> +          - isil,isl1219
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    minItems: 1
> >>>> +    maxItems: 2
> >>>> +
> >>>> +  interrupt-names:
> >>>> +    items:
> >>>> +      - const: irq
> >>>> +      - const: evdet
> >>>> +
> >>>> +  isil,ev-evienb:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    enum: [ 0, 1 ]
> >>>> +    default: 0
> >
> >
> > What is your thoughts on this? we should keep default or we should remo=
ve?
> >
> > As per HW data sheet[1], the reset value is 0, [1]
> > https://www.renesas.com/us/en/document/dst/isl1219-datasheet
> >
> > But as per text version of bindings [2], Looks like default is not need=
ed.
>=20
> Missing value has different meaning in original binding, so default is wr=
ong
> here and you should explain that meaning in description.

OK, I will remove default and use the same description from the original bi=
ndings
and send it as separate patch.

Cheers,
Biju
