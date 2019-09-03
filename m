Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40613A5F3E
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2019 04:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfICCQC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 22:16:02 -0400
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:56455
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726133AbfICCQC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 2 Sep 2019 22:16:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZfqLOQFx5T4WUUUHtfIUUAbev1RBlTbV0bwl1vWbufKn2l5PJhczkJmYx8SVq1v1flpa5Y0RSqQgP7Ojc22b+wtLNRTiEBU8UCxclOwcHNgIk05m8RGm6kdeNn9n2C6n1HhFY/nAvTbELgoFd95tGrR+deK/Z0F5jfSlJ5UtPJABiDYJZo3R7utbAIwyDvj1A9xH++6Pb4t/cPEGXRXWoU89UNO5W9FSJSou868kZLk6Q907ZllEHs5GAS9rcueCn7/7mNwWL2/jvQmp1TN2WCqquYj/6rQLdBV7FWoFH9QKAOSPdf2Tk8h58inaGnz0REYdCT7e9tADxHQ90evdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCZV66oiUHcNSpDXX5bcZNFAFZtqt3lWT3pnyu0nS+0=;
 b=ke9VmFcA2zaYleZr2MPjaS8aF3weEZ/rNzfcrrjK+Dn/tPMA87AZm+G/3V3UYfPZMbheW1KkL6UxDRLuo4dtOP36nzodjlitY+Mqf53FsRJmhGLSN9/YmD38TJDBC3Moe9vFN2lGhqy7RkrUDFLmo4TZrNgpb9kVPt7vwyttP/4aVWK2SgtXAMIKj6Ys2uulVla96i0yzyDOEAT0LsppnB1qmbPjXqi6rpVW80AWSYweSWfyPLE7kY+uyfNqjmj18C8V2ITm+C1nOTvycL3QHAAr4TBVONdBqe7EHGKmEcUk8pbouAppP7WYgr8E5wGz5L9kFeShIdBziFikYbpExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCZV66oiUHcNSpDXX5bcZNFAFZtqt3lWT3pnyu0nS+0=;
 b=Q07hAxq0yyU2iqvlv8+mNnty12J35w8ci5QRa3DHV/HFrmbXcITTwDaZ5/et/n4DlkS+s/jdzB+U8h6WSXnoo1xHFLIuJdT+bVQxiNF1n0dHsPFUE0wsDMBcTW8hn8wIe0lLopHka0WqHf9w8vXHHu7/Ptdp0qjbK4/0VySw1kg=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5371.eurprd04.prod.outlook.com (20.178.104.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 02:15:56 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2220.020; Tue, 3 Sep 2019
 02:15:56 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
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
Thread-Index: AQHVXxUmbdQ14FGRtEKpSD4KQzyPQqcYaWcAgADTJbA=
Date:   Tue, 3 Sep 2019 02:15:56 +0000
Message-ID: <DB7PR04MB4490460F9C011289CE85A0028FB90@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190830091720.41156-1-biwen.li@nxp.com>
 <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
In-Reply-To: <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fac797bc-b4fb-4420-2106-08d73014a7c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB5371;
x-ms-traffictypediagnostic: DB7PR04MB5371:|DB7PR04MB5371:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB53714234C247D304A2BBD53B8FB90@DB7PR04MB5371.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(6506007)(71200400001)(14454004)(256004)(11346002)(478600001)(66066001)(86362001)(74316002)(476003)(33656002)(305945005)(186003)(446003)(7736002)(486006)(316002)(5660300002)(6916009)(66446008)(2906002)(99286004)(76176011)(76116006)(55016002)(7696005)(66946007)(53936002)(44832011)(102836004)(64756008)(9686003)(25786009)(6246003)(6116002)(26005)(8676002)(52536014)(4326008)(81166006)(54906003)(3846002)(81156014)(6436002)(66476007)(66556008)(8936002)(71190400001)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5371;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uPozup0VY3E+Huhg4HrcJ54v/otqfbZzp/ZcIR/TmWWcKhDvEt/Jlp0iHVDhZTnQnBWMC/IxMD1h7KDuM++kXTEqDch428KLdZ6WJs6aSeZ/T2SINy3yFqTtKyXzz4KvPb2BH36MMUkydg2qAfnvqxmU/KXC72dNlufv1M3BoDKJf66xMUbCU2lKY1EKS3u7bogdezUYPmuLkdUKHWRYjUhN0hVcSf9XLqkT7VmgMfN1kIkfdO0jRNaoYojtl2pArLfvh3+eEnnypeo2Se7Fjt97OLokL+/jgzbeTRNvPsTMB81O4Njha/u00ynxNna9ZWjMr5JgDqrcCkEpr3P565O6y7i6VXLfz9/vXQneHadVGJfMejbXoamqg7RjGeXel3bZZxlouQF8vMGOgljj2QCb8KscnuujBrjTkLFM4Z8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac797bc-b4fb-4420-2106-08d73014a7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 02:15:56.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzoTMTj8qOOuV0Bl4YhbRAm8uoPPfYNkybFv4XXvEOivVxhMS6wq0GeTF8fai13bSu1Iz0b75ogXlF09wxsKqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5371
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On Fri, Aug 30, 2019 at 05:17:19PM +0800, Biwen Li wrote:
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
> > +- quartz-load-capacitance: The internal capacitor to select for the qu=
artz:
> > +     PCF85263_QUARTZCAP_7pF          [0]
> > +     PCF85263_QUARTZCAP_6pF          [1]
> > +     PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
>=20
> We have a common property for this. Use it.
Ok, I will replace it in v2.
>=20
> > +
> > +- quartz-drive-strength: Drive strength for the quartz:
> > +     PCF85263_QUARTZDRIVE_NORMAL     [0] DEFAULT
> > +     PCF85263_QUARTZDRIVE_LOW        [1]
> > +     PCF85263_QUARTZDRIVE_HIGH       [2]
> > +
> > +- quartz-low-jitter: Boolean property, if present enables low jitter
> > +mode
> > +  which reduces jitter at the cost of increased power consumption.
>=20
> These 2  need vendor prefixes.
Okay, I will add vendor prefixes in v2.
>=20
> > +
> > +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> > +  independently of the availability of an IRQ line connected to the So=
C.
> > +  This is useful if the IRQ line is connected to a PMIC or other
> > +circuit
> > +  that can power up the device rather than to a normal SOC interrupt.
> > +
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

