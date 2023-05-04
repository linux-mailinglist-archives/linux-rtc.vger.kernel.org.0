Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B276F6FDB
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 18:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjEDQWl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 12:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjEDQWb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 12:22:31 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CE25FEC;
        Thu,  4 May 2023 09:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/X7kLk1H2hOiPAyjdAFow2ubafRxTE+9oWI/UC3jysZr4Ze9om3vqscLYI2cteU6aEym17ZIprWkCO5AlnFe4obiSAJHB1+iBFLAhXNvn6SSKcaTfXPbC9er79Tbj+iL6Z2QEZ59s45QnykqwUgW6GjDvtkSkzb7LmaNWv6kJXdlcowys5Ssla3NXaeUeFxHN5ohMcrgSbYd6GqfltX3hZ9YrHlKkv3VsmHSQ1T55yWfubEpsMChoQnVVaReAl/u55zvE/RhPihi4e9z9rjuBf6GDapEEo79pI2pA93R5UkDyEOSQqU3sItfqsADpW0EPCGxZiADu9DZNGReXTXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB2igRT6w3ha0+wrg0w0AF6CLnXqi2SndNdrg4zjlDE=;
 b=EWSvSrzCDaVRRJPMkctjOeYEWItiLQv9GB3vicUmJ7ZKAjwiKICVFbDupn4vkFsgUrOTzVsFTN+Ygv/ZjPulQrt6avrV4t0kp1x/VxBJOmYhd1+kCeOWwTCXyLPlGS++5s3NAS15owXeLbuXG+q46MwriAjM+ibnybqd08ycAYrYuRVS8L1TkqQXTh8scohlSnm1peATjrlqB+Jg4RXuatbSQRos0L4pfCAn5PaSsO4tZ8Qe9WE1CkVXPsHf/jetUEJKea0G2HFMfMM6ecLS29xq6qzh4h2zzIUMH2o9LA1WHsaOVZFigb9luYnZeYMds7ZEoaYfqO2/v/M7oOPKAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB2igRT6w3ha0+wrg0w0AF6CLnXqi2SndNdrg4zjlDE=;
 b=OcpX9fRXTGu45qyucL57ggyDXMcuhqt1sbdRIe+ZJZmDpnlxmriLdhL7qp6skVuPzARb/xgP/n0g6fFb/0g7ULHk0hjcw6iAu6KiNfive+fxq41ZDg73RXB9+muWXWReYsGYFHx3r48nIZyraVG/YOBFDa+mfBpaUslxEH3CevI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8292.jpnprd01.prod.outlook.com (2603:1096:604:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:22:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 16:22:22 +0000
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
Thread-Index: AQHZfZvAkKrBUOZKYEaRmzaYqKPbDK9IRqAAgAATdCCAAfKGgA==
Date:   Thu, 4 May 2023 16:22:22 +0000
Message-ID: <OS0PR01MB5922E58C3A0DDF0EFD4E854F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922DDA5F5F112DF8B7755E5866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922DDA5F5F112DF8B7755E5866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8292:EE_
x-ms-office365-filtering-correlation-id: af3b1d1e-7ddf-4965-daee-08db4cbbbd6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sCpkXhGe33zcKbDfboBbuH7s+WEiPTrzoufnjjUpFZRfofH7K/Cg7ZWhPEPdcQTYS8uTU923mYqmwzthRymttL71ZBXh6rryxQzK7DBXW5JVlMNN3Y1ERLglICO6L/X54RtUmJkM/1koKGpFYoJHhpx1s6LKgYqiEu6cqz+fg+jXDgG9hFmVahjFVWj3cmrvkVUA4lSzaEbeTIJgeuxOWuxHIw4E3H+F6lXekDwbB4Rn9wu1PHSa8sTXoYJ4c4JtvQ6VtaGKQM8bxQ7QCrVNrY69miKQbalUSl/NHwjH7tOzXSeWEf4rf5mgrIpMstneZ+J1ct+bC679Y/EaReeUKAnj6VvWYQDRPwTKjXlbioo0R5aSBTStvwMkonJWeYBRZBrDpPgZwFufYhP/3x8gaBhOltRnrrlNtifS0VE4p8fy8jAcuWBox+ArG97l4HhLBJKPuSHTnnLoNwFE/L5cMGbSH+aKQlNmWpGhlsel3UI73APBAnytOu/1eGd3w12pLrenN/3LdKAubKFFOeGA//NFjeCQpvKMR7B0wudNv+1zCQjxJkBQjIDWwBEKoUUDizDjEBnN/1zlIZqWY7GoElBoKEueLkw+6k8afSLjx3UjT3eC20s6DoWdrBEmYuvMRzXrn0WEAvCzD464d7w4ZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(38070700005)(8676002)(8936002)(5660300002)(2906002)(83380400001)(6506007)(26005)(9686003)(33656002)(122000001)(478600001)(41300700001)(86362001)(66556008)(4326008)(64756008)(66446008)(66476007)(52536014)(55016003)(71200400001)(966005)(7696005)(186003)(38100700002)(316002)(66946007)(76116006)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iyq2aytl76cx21I1SmaqF9bYGbhareMftYEgFC8cUAqtWwcEgOVHMNbDjZ86?=
 =?us-ascii?Q?GH/GgBLLlCS7QDnuzrDtLhCwv3MWceZBt59Ezmm9yb5iFIBqPCcTSC5hfFI+?=
 =?us-ascii?Q?FLtPAfuSJENQgDShC9uktbQWzqOS6PlvDZohPsCDK+y4GzciGMwWa3/qECd7?=
 =?us-ascii?Q?lfI3JnpdOW5G/ScqqD0FCuih/XQUEYmQTWWaawHxhJgmj34xdQ81xyjPPuI9?=
 =?us-ascii?Q?3gX+eZ0pX7CZw2cQZTazK7tnAcLgD6oyYynivFEw674is+6qH3YYfBtXOUNc?=
 =?us-ascii?Q?7V6LnaJUe+HEapJbkEr645sIAvh9HFjtHlG352R/h/h3pxNwt2z6FZ46mmOd?=
 =?us-ascii?Q?CVmQP4tVn6qxIa5XAQmoJXgtFNMiSVsr44WW7rpiyo6s/h1cQLriz5hSUItF?=
 =?us-ascii?Q?2hmXvSoaEdStvdVueJ9cwZoy9m5d6qPa9hlAE562xs7VCHKLPVOk16fXKz5B?=
 =?us-ascii?Q?UuHFKjNCf9mn7xKNbpcB8q+l63nQihqB6g3n+L5JCDV/ryhYs+Yo51HlVMCW?=
 =?us-ascii?Q?Hn/saNES2cvmxoNRP0PDYorEtq3E+dUM0tArCY3Tx2Nora77KT6QdTvt+Ngu?=
 =?us-ascii?Q?2zSzOYw1RiHGyuO6KlXo19iqPlOAmDH+tsT/sk9z8JlkThnuJ5oGqkQywg2z?=
 =?us-ascii?Q?k8XNNENg32Au7TZ7jk3sq6KXjfecVCai19u0VbFlyX8OPtCWVzzRSzp02ufr?=
 =?us-ascii?Q?1RQMyqedIrqRn8ajzeLw+wef0Cdth7GcA0MvAlKTH3lLIDeJy4XCoiTaXhVr?=
 =?us-ascii?Q?uPltnp+9Ii/v/VTJ0TUL+eVWywUca6J+84G4q9b/KRaeTgd74hnTuiMQCKAB?=
 =?us-ascii?Q?HK6z5dKzfrGR19rYOVgbcAOwYOuobaapDiNyyI4mvsvn6h1Ee064ALO0rLuJ?=
 =?us-ascii?Q?sdBDuqWWNcCiZQhCQthfSMYL3EEjpdRwwW7QVuLBaidSnU4dFtrh3fTDZJeq?=
 =?us-ascii?Q?5eN7WvOtQvARZIItHtIqTYekgCXW+kh2SdfZl6pCzaPSeN3eTwTonocZZUQL?=
 =?us-ascii?Q?yhr5HQeTKXrhkcF1F+MUdNR75DZEF9T9Pywy0XjimoVS+P4kvVsALCtJ0y6g?=
 =?us-ascii?Q?5kcdIrmG3pQRVN0/FfFjR9bDKgOVZZQt8cHPhXlc2ZKddj7yIA9zuLXylW6r?=
 =?us-ascii?Q?nT+dDSk9o88FxPyX4EoUqsLF1Mu+M912gKivSPCJHhJt5jnmJLunYw6imzyQ?=
 =?us-ascii?Q?18GdZeLIVPlp3YBuldAcadYbvKLd/7nP31HsgKo51LdWgShCHddGqImNyJ2C?=
 =?us-ascii?Q?miitoatyHbSN32vfdQUqjvREYserKrcgQ0hOIyH2HyLL54jpYpYvqwVB2FDp?=
 =?us-ascii?Q?N9DsBnJI5+irGjXX5G4VHKs0HUvn6xF7U+HXQ9bXmIYaLSYh4cnjb826BG7+?=
 =?us-ascii?Q?zpsSQnZi/wJwntf/ENRekIEZIs9v5tLYM76MLIJZI9FGRH08cF9fPQyBvxoa?=
 =?us-ascii?Q?lLFbbq4i0XsrbTIP5Pjn6SwpX4lEQOFIi/yvcKSmruTaDvkh/QriJ/5S5z8U?=
 =?us-ascii?Q?ZwT5e0Lk1G9JsVuhXM2p+zeS/GJL3WqvsIkouN2p1YT85Z4j7PiGvfT7pcFq?=
 =?us-ascii?Q?ZeDdJCKMAhh9HXsY1hoi1PQzX1Xe/tyODKT0kGzo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3b1d1e-7ddf-4965-daee-08db4cbbbd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 16:22:22.3284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKgIn37RoSHjc3Gg0Lhz1ZEixd+IsWvY2orN3/VdERTINA6+/2NS9d47OgEjl8k2xokPFxuJZNlBaXep1ic0vmYsHvQips8M+Lb4jQtMbUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8292
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof Kozlowski and  Rob,

> > > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> > > Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
> > > json-schema
> > >
> > > Convert the isl1208 RTC device tree binding documentation to json-
> schema.
> > >
> > > Update the example to match reality.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
> > > .../devicetree/bindings/rtc/isil,isl1208.yaml | 74
> > > +++++++++++++++++++
> > >  2 files changed, 74 insertions(+), 38 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > > b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > > deleted file mode 100644
> > > index 51f003006f04..000000000000
> > > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > > +++ /dev/null
> > > @@ -1,38 +0,0 @@
> > > -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > > -
> > > -ISL12X9 have additional pins EVIN and #EVDET for tamper detection,
> > > while the
> > > -ISL1208 and ISL1218 do not.  They are all use the same driver with
> > > the bindings -described here, with chip specific properties as noted.
> > > -
> > > -Required properties supported by the device:
> > > - - "compatible": Should be one of the following:
> > > -		- "isil,isl1208"
> > > -		- "isil,isl1209"
> > > -		- "isil,isl1218"
> > > -		- "isil,isl1219"
> > > - - "reg": I2C bus address of the device
> > > -
> > > -Optional properties:
> > > - - "interrupt-names": list which may contains "irq" and "evdet"
> > > -	evdet applies to isl1209 and isl1219 only
> > > - - "interrupts": list of interrupts for "irq" and "evdet"
> > > -	evdet applies to isl1209 and isl1219 only
> > > - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> > > -	Applies to isl1209 and isl1219 only
> > > -	Possible values are 0 and 1
> > > -	Value 0 enables internal pull-up on evin pin, 1 disables it.
> > > -	Default will leave the non-volatile configuration of the pullup
> > > -	as is.
> > > -
> > > -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and
> > > #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up
> > > enabled in
> > EVIN pin.
> > > -
> > > -	isl1219: rtc@68 {
> > > -		compatible =3D "isil,isl1219";
> > > -		reg =3D <0x68>;
> > > -		interrupt-names =3D "irq", "evdet";
> > > -		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> > > -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> > > -		isil,ev-evienb =3D <1>;
> > > -	};
> > > -
> > > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > new file mode 100644
> > > index 000000000000..04d51887855f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > @@ -0,0 +1,74 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +  - Trent Piepho <tpiepho@impinj.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - isil,isl1208
> > > +          - isil,isl1209
> > > +          - isil,isl1218
> > > +          - isil,isl1219
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: irq
> > > +      - const: evdet
> > > +
> > > +  isil,ev-evienb:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [ 0, 1 ]
> > > +    default: 0


What is your thoughts on this? we should keep default or we should remove?

As per HW data sheet[1], the reset value is 0, =20
[1] https://www.renesas.com/us/en/document/dst/isl1219-datasheet

But as per text version of bindings [2], Looks like default is not needed.

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/rtc/isil,isl1208.txt?h=3Dnext-20230428#=
n20

Cheers,
Biju
