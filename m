Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BED16B968
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 11:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfGQJh7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 05:37:59 -0400
Received: from mail-eopbgr50074.outbound.protection.outlook.com ([40.107.5.74]:60037
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726189AbfGQJh7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 05:37:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QykhyQ/TNzLan8qYAezpy8K7buFsWCLa+2WAlN2Fe4vb8o/lJz5jsgdRh3tCWxnZG/+il3S1Mw1CpsmmQUIQ7+ncJrnoIl58+qufp9p3lFeixLUG15OqK3LfSkkJ31cNEmzgX2jrMzDPnDBs7vvEKfHIxlJx/CUJqwz7nZJkVUnuRP8IorxnBeZSYMIaOAdcJKFfJhNUOJsM0bc0bV01MNkAKPPSTJC1Nyrn78WvhMDu0xmJFbEke8EluNTixUj3wbjPqVH1i+IiDuhdcc+umZdJtvNvX0V9fnO+RX8aiKRFvUQMUrJN5fsx8oaH5L3zzgsgobmpMY5o0vcZu8rC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMbbOjqAsft46QCBdzdq591lDuJqq/BG1HUgUNAPOhI=;
 b=jFqKAHC3Q/3SjpsquE+kU3LPN+6T0fE0Gsx7aEzLRjH2K7JLc7bBv8jLDQU25XVRCpnftoLjs4G75b1HNVLCrOisWCCNJHx1xIODnV9m2aVKNCgcKrKct1cew5srXL/cCDtb6kinA+xqC8rGIN28XvmDMGPGR7tilYxYUI//rDREJGnEeWVDYNI5vG3/gd8CzfClbQM/Ghs+mCDBJJ4Xp2DXEshO/Rz1K5RbUBsJv9pRiLU0YtVGliVtfVmUfh3Bq2MndfenyYhNfps92ul5Pf4Ow41JsTvn24Iyb6fNkkYdUYdA8+NqM/nuN5oCO8xhF3msbuisOEYJ9QoDmanQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMbbOjqAsft46QCBdzdq591lDuJqq/BG1HUgUNAPOhI=;
 b=HD+1a0DDTfFOPBvM0SwWbUJV9w6RDeEE3ccI6J4vPkzH1jS2omhOffr9uoGY9R/7lgf7BTOyfgR17a4pD/4+3PItmpqCOj15+7Zp9Xw1KsrDgkltbkNlSt9J9pcajA2EKdYerFgUURD1Sxz3xYriWk7vW8lW8w5stnQhqY960F0=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4249.eurprd04.prod.outlook.com (52.134.108.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 09:37:53 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:37:53 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Leo Li <leoyang.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
Thread-Topic: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
Thread-Index: AQHVO8Dr35T1g9Ay0kmBOJl4h91+pKbNs0GAgADbmkA=
Date:   Wed, 17 Jul 2019 09:37:53 +0000
Message-ID: <DB7PR04MB449083E19DCF1A68254AEC298FC90@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190716101655.47418-1-biwen.li@nxp.com>
 <20190716101655.47418-2-biwen.li@nxp.com>
 <VE1PR04MB668718A642D1E521BF5F3F198FCE0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB668718A642D1E521BF5F3F198FCE0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d4e143f-bd86-4c64-598e-08d70a9a7120
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4249;
x-ms-traffictypediagnostic: DB7PR04MB4249:
x-microsoft-antispam-prvs: <DB7PR04MB42493459D4C0857EBA579AD58FC90@DB7PR04MB4249.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(14454004)(6246003)(486006)(64756008)(76116006)(66446008)(66556008)(52536014)(3846002)(44832011)(256004)(66946007)(66476007)(7696005)(6116002)(5660300002)(6506007)(11346002)(53546011)(76176011)(476003)(4326008)(66066001)(26005)(2201001)(81156014)(9686003)(8936002)(71200400001)(55016002)(53936002)(446003)(99286004)(71190400001)(316002)(81166006)(102836004)(478600001)(229853002)(6436002)(86362001)(8676002)(305945005)(74316002)(7736002)(68736007)(186003)(33656002)(2906002)(2501003)(110136005)(54906003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4249;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YJGucL/yj/QmhgWbsP9EFZdmQPuq2Ub7ZvVpekOKSb5PdkFW9a0H8e2rpykj+/M5qtCqoIK3lH+6hNSjhvxCHc33beaNNV/sD3+AZCqVfV2JI0u82bEg8p1q1MSrMXk0v60bLqamLOYFTMyjruGj7CS49dMF141ORKxApBk3CjDm6hh5oDoxTQaSB27pT/gTgb0YN2rxBXZCflxyPyClxp9DocjtcMH3P5ElJnI9Xnv70U77vU75uZED6khYpnABn2YZY/u725BaXDRRajynCtbPz2xvlxbLM6bB7gtiTQTIb91HcTWz+JHvwJr3AAtFknYov8tdUzm/oHhco+BIVFzkk3RNFdL+fWyO6AmqlkeJqupyebhhHP5J13FPjtHJuNM2J28QBv2dYS3Xb+WlcHrg+yK870M0lzEK0u8PpjA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4e143f-bd86-4c64-598e-08d70a9a7120
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:37:53.4012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4249
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> > From: Biwen Li <biwen.li@nxp.com>
> > Sent: Tuesday, July 16, 2019 5:17 AM
> > To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Leo Li
> > <leoyang.li@nxp.com>; robh+dt@kernel.org
> > Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org; Xiaobo
> > Xie <xiaobo.xie@nxp.com>; Jiafei Pan <jiafei.pan@nxp.com>; Ran Wang
> > <ran.wang_1@nxp.com>; mark.rutland@arm.com;
> > devicetree@vger.kernel.org; Biwen Li <biwen.li@nxp.com>
> > Subject: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
> > alarm driver
> >
> > The patch adds binding for ftm alarm driver
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v5:
> >     - None
> >
> > Change in v4:
> >     - add note about dts and kernel options
> >     - add aliases in example
> >
> > Change in v3:
> > 	- remove reg-names property
> > 	- correct cells number
> >
> > Change in v2:
> > 	- replace ls1043a with ls1088a as example
> > 	- add rcpm node and fsl,rcpm-wakeup property
> >
> >
> >  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-
> > alarm.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > new file mode 100644
> > index 000000000000..fb018065406c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > @@ -0,0 +1,49 @@
> > +Freescale FlexTimer Module (FTM) Alarm
> > +
> > +Note:
> > +- The driver depends on RCPM driver
> > +  to wake up system in sleep.
> > +- Need stop using RTC_HCTOSYS or use the DT aliases
> > +  to ensure the driver is not used as the primary RTC.
> > +  (Select DT aliases defaultly)
> > +
> > +Required properties:
> > +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> > +	       supported chips include
> > +	       "fsl,ls1012a-ftm-alarm"
> > +	       "fsl,ls1021a-ftm-alarm"
> > +	       "fsl,ls1028a-ftm-alarm"
> > +	       "fsl,ls1043a-ftm-alarm"
> > +	       "fsl,ls1046a-ftm-alarm"
> > +	       "fsl,ls1088a-ftm-alarm"
> > +	       "fsl,ls208xa-ftm-alarm"
> > +- reg : Specifies base physical address and size of the register sets
> > +for the
> > +  FlexTimer Module and base physical address of IP Powerdown
> > +Exception
> > Control
> > +  Register.
>=20
> You removed the IP Powerdown exception register in the examples, but not
> here.
Ok,I will remove it in v6.
>=20
> > +- interrupts : Should be the FlexTimer Module interrupt.
> > +- fsl,rcpm-wakeup property and rcpm node : Please refer
> > +	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +
> > +Optional properties:
> > +- big-endian: If the host controller is big-endian mode, specify this =
property.
> > +  The default endian mode is little-endian.
> > +
> > +Example:
> > +aliases {
> > +	...
> > +	rtc1 =3D ftm_alarm0; /* Use flextimer alarm driver as /dev/rtc1 */
> > +	...
> > +};
> > +
> > +rcpm: rcpm@1e34040 {
> > +	compatible =3D "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > +	reg =3D <0x0 0x1e34040 0x0 0x18>;
> > +	fsl,#rcpm-wakeup-cells =3D <6>;
> > +};
> > +
> > +ftm_alarm0: timer@2800000 {
> > +	compatible =3D "fsl,ls1088a-ftm-alarm";
> > +	reg =3D <0x0 0x2800000 0x0 0x10000>;
> > +	fsl,rcpm-wakeup =3D <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> > +	interrupts =3D <0 44 4>;
> > +};
> > --
> > 2.17.1

