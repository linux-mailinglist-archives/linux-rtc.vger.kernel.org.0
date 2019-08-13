Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0926E8ACE4
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 04:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfHMC75 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 22:59:57 -0400
Received: from mail-eopbgr50046.outbound.protection.outlook.com ([40.107.5.46]:22317
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726296AbfHMC75 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 12 Aug 2019 22:59:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkpG0LBTjd0vv+HMeW9oRi9t6rnGcernwkF2g3OqU4OAcGhMA98cDxye0thpglrZxdt7y674w6vtChZkwbss+QcTZqoqgbavLd2eK8HDR+azEswIef5kTZhJip1V2SoyzyUc//v/cNRm5diOPXqUd3nq/OtYY7raD0/bhjUJv5X3kOAjo0ZWz5FnY/7gJdrtpsGFeY88hPALKo/hYr9t08fmKnzm/9JKqCC/QFDIa/w3q/57BnZy8Csoke3SWNuvE/ekpAhHElKukRUt1o3Jb0Z3Wy8/OpkYqrSJD2A4MLHa+aBco0WwhadLLqOK6v2ctgJHed0cr4Z4tphX9cfIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktLi3U1M/UA0gRzIwQ4W2dILEd6MFuJYv56LjmR/190=;
 b=BwfUXezIcfrDkyArnFvwHp7GZXqMSgP2QFjE8SFscGnTUU7Ft26RFo8FhrJaNoxwir5pYOOzpGl2lonivfNtMuV2G7DNCHM0nBTvLAbg4v0CsyEFaGl3Zo79wPnrIbOyVVWzmu+YTD4rLDbkiWkM1c4pd3td0qMzpxPPoQ10WpHSw9tghowhrQAhp4TIASNKYcD4Foi5OFsxqwva42gH9Zx4e6/RYrzQcD/cl0RvMzooYsPQdjo5IFmyg51MI0aaLcexoYSMcDCtkh1pTZGlB2QJ1O3XKPmkMmzdcissXmlPwxt17mr2lKa1BlVXbaMtQH679STbBm/EAmsopcVqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktLi3U1M/UA0gRzIwQ4W2dILEd6MFuJYv56LjmR/190=;
 b=iX+b0DpbK9m9PzFF2ZRmH8umh1UgNqdzCDtULVGWrz5pA+O8woEGWTJfYynP+zXCEiy5pZa+deFwsjvby0OZbApTGhCnvP2eCG9fuy6pcQ9dSgpbAbLePmZyERTui8ol8JTlCa9iU9F780MQZgoTtud+8xet3n+ely7n8p1GLmA=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4538.eurprd04.prod.outlook.com (52.135.134.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 02:59:12 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 02:59:12 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v6,2/2] dt-bindings: rtc: add bindings for FlexTimer
 Module
Thread-Topic: [EXT] Re: [v6,2/2] dt-bindings: rtc: add bindings for FlexTimer
 Module
Thread-Index: AQHVPecFX9yQ0MbGjkaiba1BfL3oHab4TAiAgAA9dOA=
Date:   Tue, 13 Aug 2019 02:59:12 +0000
Message-ID: <DB7PR04MB44902C6FDEC187F11B6E98718FD20@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190719035400.9800-1-biwen.li@nxp.com>
 <20190719035400.9800-2-biwen.li@nxp.com> <20190812231607.GA21242@bogus>
In-Reply-To: <20190812231607.GA21242@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57db3446-87c4-4d0d-d1a2-08d71f9a3877
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4538;
x-ms-traffictypediagnostic: DB7PR04MB4538:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB453872DFA8296FE55048DAD28FD20@DB7PR04MB4538.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(5660300002)(14454004)(52536014)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(74316002)(316002)(3846002)(33656002)(6116002)(8676002)(54906003)(186003)(229853002)(8936002)(81156014)(6506007)(7736002)(102836004)(305945005)(7696005)(446003)(76176011)(99286004)(81166006)(26005)(66066001)(14444005)(53936002)(4326008)(71200400001)(71190400001)(25786009)(44832011)(256004)(86362001)(6246003)(2906002)(6436002)(9686003)(11346002)(55016002)(486006)(476003)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4538;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XvTr0WzkCuPb8rOLGWu7YMh93V2G0RW+Wicj62xOCJvX5nvZ4ffhRWaxW+2r1f6TWyFwvMhvzpXMA2PYEod4utqZWjObhXKtUHlwen1quUnEm7/UNTX3M/aZ84LSsq9Yg5GMbIphYjaPkNOBkLA9F/Ja+c19WTe5zn9Tji885TdDqsSpws/MZX1GkWjQhZaBucf1tUYjcpgH/j5CCC74loUhdjdSWuyZoL5TmZsM00lxK/reZjH2+P6jiaKpfld/dyB6Sq3R//aOeQafqPzwEkwTZbBBF8L4oOi3GCzmKDiIIH/5EC4vK9ZNKuWvHuc9KRcAPXiZkiO7Vo1BhUPPZzpZ1f0Rbu+c7GyZE6lUunLVwhwU5IVKxNyGKHHqMnbwLfRSmUXJSKI8e971go/BV7xT5/fi+pyu0wE91Ljrjp8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57db3446-87c4-4d0d-d1a2-08d71f9a3877
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 02:59:12.7576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zzpvoOq4LCYbjno03gyN/6+/aHyDQXdmj9+rCGVrG+lDx3GmCXXNFZQ0Cdb2CDfkflob68m+O0aRk3UsZiAgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4538
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> On Fri, Jul 19, 2019 at 11:54:00AM +0800, Biwen Li wrote:
> > The patch adds bindings for FlexTimer Module
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v6:
> >     - correct subject
> >     - delete note
> >     - remove reg property about IP Powerdown exception register
> >
> > Change in v5:
> >     - None
> >
> > Change in v4:
> >     - add note about dts and kernel options
> >     - add aliases in example
> >
> > Change in v3:
> >       - remove reg-names property
> >       - correct cells number
> >
> > Change in v2:
> >       - replace ls1043a with ls1088a as example
> >       - add rcpm node and fsl,rcpm-wakeup property
> >
> >  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > new file mode 100644
> > index 000000000000..9291b022ffc7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > @@ -0,0 +1,41 @@
> > +Freescale FlexTimer Module (FTM) Alarm
> > +
> > +Required properties:
> > +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> > +            supported chips include
> > +            "fsl,ls1012a-ftm-alarm"
> > +            "fsl,ls1021a-ftm-alarm"
> > +            "fsl,ls1028a-ftm-alarm"
> > +            "fsl,ls1043a-ftm-alarm"
> > +            "fsl,ls1046a-ftm-alarm"
> > +            "fsl,ls1088a-ftm-alarm"
> > +            "fsl,ls208xa-ftm-alarm"
> > +- reg : Specifies base physical address and size of the register sets
> > +for the
> > +  FlexTimer Module.
> > +- interrupts : Should be the FlexTimer Module interrupt.
> > +- fsl,rcpm-wakeup property and rcpm node : Please refer
> > +     Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +
> > +Optional properties:
> > +- big-endian: If the host controller is big-endian mode, specify this =
property.
> > +  The default endian mode is little-endian.
> > +
> > +Example:
> > +aliases {
> > +     ...
> > +     rtc1 =3D ftm_alarm0; // Use FlexTimer Module as /dev/rtc1
> > +     ...
> > +};
>=20
> As I said before, drop this. It's not going to work when this is converte=
d to
> schema and the example is compiled. Feel free to convert this to schema a=
nd
> see...
Ok, got it. I will drop this in v7.
>=20
> > +
> > +rcpm: rcpm@1e34040 {
> > +     compatible =3D "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > +     reg =3D <0x0 0x1e34040 0x0 0x18>;
> > +     #fsl,rcpm-wakeup-cells =3D <6>;
> > +};
> > +
> > +ftm_alarm0: timer@2800000 {
>=20
> If this is an RTC, then rtc@...
This is not an RTC.
>=20
> > +     compatible =3D "fsl,ls1088a-ftm-alarm";
> > +     reg =3D <0x0 0x2800000 0x0 0x10000>;
> > +     fsl,rcpm-wakeup =3D <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> > +     interrupts =3D <0 44 4>;
> > +};
> > --
> > 2.17.1
> >
