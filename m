Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD0EA34A2
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2019 12:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfH3KLK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Aug 2019 06:11:10 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:64846
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbfH3KLK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 30 Aug 2019 06:11:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL24DG2H5OUMZTWpyYVBZmoMH8iZ/ZrWrILuSD2oOTkA9T8qdcn7xbE2KdboUPRqox0Grj0LZ1yVJIkIWXNLD/+eFGU7ltHioMILhBUIS0TbOGRiMXryRyqYHFCMMSeHHdcry039hc0pkaa0CieJNR4VTY0Ldp9czBZf7vcYWLpmfSoKBvf4EVGDMP35pHFO5+JSgtXn4Zwpw47ZgctAnfqyEkQ6vJ3DIhWo8vNPoDCL3PeiAGurx+byK0fFt7jyTo55IeLn9afl+ezs/YxmJEY16IwwmxopD1fg5u88HETqdOxziGHz3oliCIfAYHtq7exwvVjlZcJalhb5rnLyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhhW3lP55wZJiUEpNJN+svWmF+teI8mwxFzSSD62wkQ=;
 b=VMutBtexnx58GINQ4M8pnfQwapsSGZo538SC1+Xl1uWScmpcVNEdvoUvOkI+SVzTq6yyX8BGM8TCVO2X4zJvE0rpG1Z++ZX/OCaRYMSQHoogtWW3V1rM24CXasenGfrzZ2YB984ZbgUwklLNPbVNseM5kVx0uWroLwC0iozgTY6ywtttj3Rb/X75rfFsqzhIavZknD1XyDrFwxxoVa17PFCi4gU7seBEDPQtuRdEAmcFIG4tdnWInfKvOjK68recq85L3IQUyffD5DnLRz/eKKyUKCHrZnaMgIqP7o6Lpb6npXA+1wjQJbLF4RFJ7w7Kxo6W9MKXS+Z9WP/ISjo4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhhW3lP55wZJiUEpNJN+svWmF+teI8mwxFzSSD62wkQ=;
 b=VgofyAk4PuY5pG/rCvOcR5Mxm5xySiRB+N+9RdxlJBZUMuPdqESQ4+6N29GouvNqArYksCARX963/s0LaUGNo6MHLRhcmU0Dubym7itfEjAr/1vjnN+CngJhH/G/DuWJe6P8mLbgkp0+GQ3cYtEH4YcUYpcewkCZ8XINAHLqW2w=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4636.eurprd04.prod.outlook.com (52.135.134.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 10:11:04 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 10:11:04 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: RE: [EXT] Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Topic: [EXT] Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Index: AQHVXxUmbdQ14FGRtEKpSD4KQzyPQqcTcP4AgAAGgTA=
Date:   Fri, 30 Aug 2019 10:11:03 +0000
Message-ID: <DB7PR04MB4490C2664AE88D18D52E4B018FBD0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190830091720.41156-1-biwen.li@nxp.com>
 <20190830094456.GO21922@piout.net>
In-Reply-To: <20190830094456.GO21922@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d0b02e4-5ce4-4e55-11b3-08d72d325dcc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4636;
x-ms-traffictypediagnostic: DB7PR04MB4636:|DB7PR04MB4636:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB463634B3442A690FDEFED6F68FBD0@DB7PR04MB4636.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(189003)(51444003)(199004)(229853002)(8676002)(26005)(11346002)(446003)(3846002)(6246003)(52536014)(53936002)(99286004)(102836004)(74316002)(7736002)(25786009)(6506007)(478600001)(2906002)(305945005)(54906003)(76176011)(4326008)(186003)(14454004)(33656002)(45080400002)(8936002)(66946007)(76116006)(256004)(7696005)(6116002)(316002)(966005)(5660300002)(6916009)(9686003)(55016002)(71190400001)(71200400001)(6436002)(6306002)(486006)(44832011)(476003)(64756008)(81166006)(66066001)(86362001)(66476007)(66556008)(66446008)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4636;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hhGzpNokenHa10kU3H7hLdJ7VQgAPbPmiFN5eFKgQS0gT4B0nQSa//URIxMlQazQYQhXcu0mVnxdLsl1qCuxIjHXJ7E7DPBhTaXqlyjidWsXyDjz8+Mc3ULRnnZvlfPIJDvitAIH7B4muxC2S0VBT0Q4T9+siLKzkjwOa+BVZ2zRPVYMdM0GfuGQFERK06wpLdclxvOz904bCO1pcjLoCnJsUYLnidjODIYCHTUEw2kXrkL4voOCB2+lTigeolTri84uPD2S9XsSCaP0eQMHPZIAg8y4ThhNrVahTl9V8RKYbLhS+qQSb8g2NLI0YIPfg+WfsD6cRTWmQWioTz6fbpEa3BrImw5KH2Zxnaby0KaDs+mi2QnPGy+EZsXk+I3DIZOdGwras1UGx6Arh3POEg36yZ/i3ol/sOPRjK2W1FQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0b02e4-5ce4-4e55-11b3-08d72d325dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 10:11:04.0005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23ui3qQGC3gzyKoQnNHTnPKOfNpmpbrz/66MraALOl+iBR7xbOuCFRxpD/12GuEoicgaRnFLJAoinQ2kjA2/Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4636
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> On 30/08/2019 17:17:19+0800, Biwen Li wrote:
> > Add some properties for pcf85263/pcf85363 as follows:
> >   - interrupt-output-pin: string type
> >   - quartz-load-capacitance: integer type
> >   - quartz-drive-strength: integer type
> >   - quartz-low-jitter: bool type
> >   - wakeup-source: bool type
> >
> > Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  .../devicetree/bindings/rtc/pcf85363.txt      | 31
> +++++++++++++++++++
> >  include/dt-bindings/rtc/pcf85363.h            | 15 +++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 94adc1cf93d9..d83359990bd7 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -8,10 +8,41 @@ Required properties:
> >  Optional properties:
> >  - interrupts: IRQ line for the RTC (not implemented).
> >
> > +- interrupt-output-pin: The interrupt output pin must be
> > +  "NONE", "INTA" or "INTB", default value is "NONE"
> > +
>=20
> default value can't be none if there is an interrupts property. Also, bot=
h pins
> can be enabled at the same time and this binding would prevent that.
> Finally, it may also be desirable to have some interrupts on one pin and
> other interrupts on another pin e.g. alarms and timestamping on INTA goin=
g
> to the SoC and only alarms on INTB going to a PMIC.
Ok, got it, I will correct it on v2.
>=20
> > +- quartz-load-capacitance: The internal capacitor to select for the qu=
artz:
> > +     PCF85263_QUARTZCAP_7pF          [0]
> > +     PCF85263_QUARTZCAP_6pF          [1]
> > +     PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
> > +
>=20
> The correct generic property is quartz-load-femtofarads.
I will replace it on v2.
>=20
> > +- quartz-drive-strength: Drive strength for the quartz:
> > +     PCF85263_QUARTZDRIVE_NORMAL     [0] DEFAULT
> > +     PCF85263_QUARTZDRIVE_LOW        [1]
> > +     PCF85263_QUARTZDRIVE_HIGH       [2]
> > +
>=20
> This has to take a value in ohm to be generic and then you don't need the
> include file.
I will adjust it on v2.
>=20
> > +- quartz-low-jitter: Boolean property, if present enables low jitter
> > +mode
> > +  which reduces jitter at the cost of increased power consumption.
> > +
>=20
> I think that property needs to be nxp specific.
I will replace it with nxp,quartz-low-jitter on v2.
>=20
> > +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> > +  independently of the availability of an IRQ line connected to the So=
C.
> > +  This is useful if the IRQ line is connected to a PMIC or other
> > +circuit
> > +  that can power up the device rather than to a normal SOC interrupt.
> > +
>=20
> This is already defined in bindings/power/wakeup-source.txt I guess you c=
an
> simply refer to it.
I will correct it on v2.
>=20
> >  Example:
> >
> >  pcf85363: pcf85363@51 {
> >       compatible =3D "nxp,pcf85363";
> >       reg =3D <0x51>;
> > +
> > +     interrupt-parent =3D <&gpio1>;
> > +     interrupts =3D <18 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +     #include <dt-bindings/rtc/pcf85363.h>
> > +     wakeup-source;
> > +     interrupt-output-pin =3D "INTA";
> > +     quartz-load-capacitance =3D <PCF85363_QUARTZCAP_12p5pF>;
> > +     quartz-drive-strength =3D <PCF85363_QUARTZDRIVE_LOW>;
> > +     quartz-low-jitter;
> >  };
> >
> > diff --git a/include/dt-bindings/rtc/pcf85363.h
> > b/include/dt-bindings/rtc/pcf85363.h
> > new file mode 100644
> > index 000000000000..2c06c28eb5ff
> > --- /dev/null
> > +++ b/include/dt-bindings/rtc/pcf85363.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */ #ifndef
> > +_DT_BINDINGS_RTC_PCF85363_H #define
> _DT_BINDINGS_RTC_PCF85363_H
> > +
> > +/* Quartz capacitance */
> > +#define PCF85363_QUARTZCAP_7pF               0
> > +#define PCF85363_QUARTZCAP_6pF               1
> > +#define PCF85363_QUARTZCAP_12p5pF    2
> > +
> > +/* Quartz drive strength */
> > +#define PCF85363_QUARTZDRIVE_NORMAL  0
> > +#define PCF85363_QUARTZDRIVE_LOW     1
> > +#define PCF85363_QUARTZDRIVE_HIGH    2
> > +
> > +#endif /* _DT_BINDINGS_RTC_PCF85363_H */
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl
> in.com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C0a2e5b50f8fc45a
> ef6a208d72d2ebe2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C637027551094795780&amp;sdata=3DPMMS6PMBPkuuIYgMJFmtOaoD%
> 2B7fCO3eZvOtlYhTEL5w%3D&amp;reserved=3D0
