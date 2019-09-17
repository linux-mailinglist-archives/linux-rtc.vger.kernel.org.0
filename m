Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19251B4A20
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2019 11:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfIQJN3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Sep 2019 05:13:29 -0400
Received: from mail-eopbgr20063.outbound.protection.outlook.com ([40.107.2.63]:63622
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726207AbfIQJN2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Sep 2019 05:13:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJolfdNhjeqq8SX9CqH97bspCZVylxobh5GQc3e619kDgi6FROoXeFTDCw+x33us52rcev+3DU3gxTuDrYjQNXtjuH2LK2k5YHvwSSUC/2fv3aHgEI+kTfaC7qOGKX58/EGV6E9wWLLjE2Yh9m9x9g6r48HYE70HoiXqWGCt+FxUVnkedxmeb1JDUdsm1lU6eV6NufYJVdVvRxy+HMhw2Sk5F7/R89iRgMiQBkxU4aFohu02KF23Tyhj1JifulnzejYAggV5dA2iyBXOtr5WFhEYQweGZjqCbeEjS7MVIQ3daMau/QTsEt7eu+wk+9y20uusANd+kF0i1cBLZMZftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgdYj5va8oKt6KrMatgHrPCT8oFs/OohHGG/sQprXzU=;
 b=WIinoQk5nXDR5fSSbWQpvDeVG7twd95caVGksTm5twa0BXvVEGDBQ3lbqP008xTcyCUN/Nk/SL31f/mbq9TsB6ezwCThydrKTeKcS+KwcKq4empcL1csnnqAQnDBn4uSrwktNe5fJ3U+kZ+7sHTEu69ljz9b+l8SmCCFOrBncP7TNZteZO3wwiBgog0COA/0L0rAkpWuukbRjVfFrXTwqU5GL6Z7v/1oG4Yp2FU68pV2AWJ/StsE+AtrXgmXnBdXLr/cBeOZYnuOO+/ggVGBwMOV1pTotRBlXGZOXgjic7mkaT/wBO1aplq+K+/DMBBvTTFR/Jj1wNEeaS/jd0gw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgdYj5va8oKt6KrMatgHrPCT8oFs/OohHGG/sQprXzU=;
 b=QcTLONBdwLiqM6mk+HDATSJVEVFUIH5adaYpsSrKjcajDaZVEDrEqwYP+VBaKduNwrcFYMoVrDG3BaWFWN0bsDgkGfkBO8tjMSW/JEyAY9Ac0P4xa22pjVyvMjGoRQqgXEZShlMpMCk3kiGN9fgQXV/87vARNAYn6IiKD/xnktA=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4458.eurprd04.prod.outlook.com (52.135.135.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 17 Sep 2019 09:13:24 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 09:13:24 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     'Alexandre Belloni' <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: RE: [EXT] Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Topic: [EXT] Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Index: AQHVZ8X8UjQb5r8clUyaZIC1mhn5L6cvmNoAgAAGSiA=
Date:   Tue, 17 Sep 2019 09:13:24 +0000
Message-ID: <DB7PR04MB4490D48E9773CFDDD2617FF38F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190910104247.13142-1-biwen.li@nxp.com>
 <20190917084504.GD21254@piout.net>
In-Reply-To: <20190917084504.GD21254@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cb4365d-b7ec-4c9e-f27e-08d73b4f4b42
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4458;
x-ms-traffictypediagnostic: DB7PR04MB4458:|DB7PR04MB4458:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4458B7D506329ABDFF7275748F8F0@DB7PR04MB4458.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(66946007)(486006)(316002)(476003)(52536014)(71200400001)(76176011)(7696005)(76116006)(6246003)(33656002)(71190400001)(4326008)(74316002)(25786009)(86362001)(81156014)(9686003)(66066001)(14444005)(305945005)(5660300002)(6306002)(81166006)(8936002)(55016002)(8676002)(45080400002)(478600001)(446003)(966005)(99286004)(14454004)(44832011)(2906002)(6436002)(11346002)(6116002)(3846002)(66556008)(7736002)(64756008)(66446008)(66476007)(256004)(54906003)(229853002)(6916009)(102836004)(186003)(26005)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4458;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cxjZQIO2NJcpGAUz6hdZYLGuTG23Oc9SFWW0VV2lGH9s8cbNWuoSTOD+SIXmoNbePkxZhBQOVQu5cJbqwUqPJu7zlmLKy3rgSO8fjKPFnHM+TEQkd5KdaQ5fpadDqtkafzgXxVvyaUxWy2opuGBUTcbG/rBPjxvsiesRsfNyvE8FQYyn+k6FmgJe7uTZ1C0d+/SJGFcQsCzFLkqcbAwgs84neEGXs4rowYD9umQ4JmhilIc/zdeBRyhP8lWDTQ3iJSPe5xsBQyQsahTudWcKCIl9x9MfEdx2uw7EIf0cTVVDgZVN3wNG3biySkJGKwn983lE34wmTxpUkvT59oCe8BGOPB47Z8pX6Y7xumG8pQRIKl4EjnxFmd/99ut5efOgQESIJj1FnRp+QBZqmQ4TLiFU4zVUb1zR+pSTV9dNYpc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb4365d-b7ec-4c9e-f27e-08d73b4f4b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 09:13:24.6298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3VOJL1RLAjDH+E15JGtWudkuo1lBwURmBEi4DfFfHpYfbBfavG3aiM1lE7JY0jijTAwEma1J1xo/JI0UkVO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4458
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On 10/09/2019 18:42:46+0800, Biwen Li wrote:
> > Add some properties for pcf85263/pcf85363 as follows:
> >   - nxp,rtc-interrupt-type: integer type
> >   - nxp,rtc-interrupt-output-pin: string type
> >   - quartz-load-femtofarads: integer type
> >   - nxp,quartz-drive-strength: integer type
> >   - nxp,quartz-low-jitter: bool type
> >   - wakeup-source: bool type
> >
> > Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v4:
> >       - Drop robust defines in include/dt-bindings/rtc/pcf85363.h
> >       - Add nxp,rtc-interrupt-type property
> >       - Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
> >
> > Change in v3:
> >       - None
> >
> > Change in v2:
> >       - Replace properties name
> >         quartz-load-capacitance -> quartz-load-femtofarads
> >         quartz-drive-strength -> nxp,quartz-drive-strength
> >         quartz-low-jitter -> nxp,quartz-low-jitter
> >       - Replace drive strength name
> >         PCF85263_QUARTZDRIVE_NORMAL ->
> PCF85263_QUARTZDRIVE_100ko
> >         PCF85263_QUARTZDRIVE_LOW ->
> PCF85263_QUARTZDRIVE_60ko
> >         PCF85263_QUARTZDRIVE_HIGH ->
> PCF85263_QUARTZDRIVE_500ko
> >       - Set default interrupt-output-pin as "INTA"
> >
> >  .../devicetree/bindings/rtc/pcf85363.txt      | 44
> ++++++++++++++++++-
> >  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
> >  2 files changed, 57 insertions(+), 1 deletion(-)  create mode 100644
> > include/dt-bindings/rtc/pcf85363.h
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 94adc1cf93d9..fc1579463657 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -8,10 +8,52 @@ Required properties:
> >  Optional properties:
> >  - interrupts: IRQ line for the RTC (not implemented).
> >
> > +- nxp,rtc-interrupt-type: integer property, represent the interrupt's
> > +  type. Valid values are
> > +  INT_PIE(periodic interrupt enable),
> > +  INT_OIE(offset correction interrupt enable),
> > +  INT_A1IE(alarm1 interrupt enable),
> > +  INT_A2IE(alarm2 interrupt enable),
> > +  INT_TSRIE(timestamp register interrupt enable)
> > +  INT_BSIE(battery switch interrupt enable),
> > +  INT_WDIE(WatchDog interrupt enable,and
> > +  compose these values such as: INT_A1IE | INT_A2IE,
> > +  but currently only support INT_A1IE, default value is INT_A1IE.
> > +  The property and property nxp,rtc-interrupt-output-pin
> > +  work together to generate some interrupts on some pins.
> > +
> > +- nxp,rtc-interrupt-output-pin: The interrupt output pin must be
> > +  "INTA" or "INTB", default value is "INTA". The property and
> > +property
> > +  nxp,rtc-interrupt-type work together to generate some interrupts on
> > +  some pins.
> > +
>=20
> This binding still doesn't work because there may be any combination of
> interrupts on any of the two pins that this binding doesn't allow.
Combination of interrupt maybe need users to select.So it is flexibity.=20
>=20
> > +- quartz-load-femtofarads: The internal capacitor to select for the
> > +quartz,
> > +  expressed in femto Farad (fF). Valid values are 6000, 7000 and 12500=
.
> > +  Default value is 12500fF.
> > +
> > +- nxp,quartz-drive-strength: Drive strength for the quartz,
> > +  expressed in kilo ohms (kOhm) Valid values are 60, 100 and 500.
> > +  Default value is 100kOhm.
> > +
>=20
> It makes more sense to have quartz-drive-strength-ohms as a generic
> property.
Got it, thanks
>=20
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl
> in.com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C34fc927717674d
> 73cd8d08d73b4b577a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C637043067081363670&amp;sdata=3DSXAXKb5qQMf4eXJNB46CGdvh
> oA%2F%2BG2r26yYaC2tEGX0%3D&amp;reserved=3D0
