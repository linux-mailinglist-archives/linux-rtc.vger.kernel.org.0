Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8A0273947
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Sep 2020 05:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgIVDbe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 23:31:34 -0400
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:50151
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728384AbgIVDbd (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Sep 2020 23:31:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kwx+3gRieft31bl2bgicmnv2HNRuLEgojwD63aZUq0oqKJ0r+CyGGqIH7fR+hyPEJIk2BTUFeWSPthgI+IZNLhfhZUIBpEVjmjnwpy6lnfxNh4r/5cfai/jYHjcg3KaCz1negVWhs599LtgFHAoDXZsYzif4tPsqbT7JjGdPzcjz22Ce/mCISZ/dm5wLv5g4W1f85qof0HA2xnS/QkK/nRYzH84ZFU+ynVXVItw+XO06IAWE7twRttYG1B7zu05uSSQ9AiiwWC/fdeSCx0SFmpkW04H4S9ky2F/ZGyxXvjLheQo6/+Rj9iGXT9lcFMj+NM1o82Dg+hqs9NIO9XUj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU1k64oEQvch76CeoUFEPwYtawiceG0vqtkUm69rgzQ=;
 b=G8jU34kbA0h8VdUAYqY9HeP25QrX0G0HP4hRPPHFCurACtUBRap8nBz2aQ79gPw4KaSyFy9THxBj2beW1/Yp8h4BiHgDgFQyTGKxPfsAvGw6DtwJRg0CWHwi9NF5pIccZXRdMOoCiUJ4QwPLZzXK/ftpVgGdoYRmkzPyt6jsgkt4mj5+iEL9xzlU2+QXKSH+S7xTEHtaJ75DsEO85zK6t8R5ylwqOFS87Gj+iC8Ix/Vslfz3fpix1JJXJh4yz6ANIo5pAeS+mAkLlwsqDzrmGyRELK5VkT1+8fr6gi3s+KxtUZN4ZfCOtQZvJTZZdmwm0RUFsM5j8empjHG/KBOlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU1k64oEQvch76CeoUFEPwYtawiceG0vqtkUm69rgzQ=;
 b=B/gcyapd35y537e39FB59NXXgkslcUQ2HOsGBqJAlvJD0P9+8oRnVF5sofi8Mp8hkwc/2r+GSjRRtohzwZkvBsaUebCeLuGhrbKE7A9bxikRW9e/ZFCneR7CCG/t8Sq0ZKIysLpcv7vtXf1rj5Qit5bAnHSxIYYAc4MbSK3krRg=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR04MB3237.eurprd04.prod.outlook.com (2603:10a6:6:c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17; Tue, 22 Sep 2020 03:31:28 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e%7]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 03:31:28 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Leo Li <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove useless
 property of rtc
Thread-Topic: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove useless
 property of rtc
Thread-Index: AQHWizOOGLxVV6x4KkO7cstIkfxRIKl0Ax6AgAAAVACAAAcQAIAAADuw
Date:   Tue, 22 Sep 2020 03:31:28 +0000
Message-ID: <DB6PR0401MB243883AEA75F615A0768D03E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200915073213.12779-1-biwen.li@oss.nxp.com>
 <20200915073213.12779-2-biwen.li@oss.nxp.com> <20200922030208.GY25109@dragon>
 <DB6PR0401MB2438ABB1DFE785F9EAADB69E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <VE1PR04MB6687237BD5D137C4B9EC6DBD8F3B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6687237BD5D137C4B9EC6DBD8F3B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8505f182-78de-4b85-2026-08d85ea7fe17
x-ms-traffictypediagnostic: DB6PR04MB3237:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB3237D857B43882786C597E988F3B0@DB6PR04MB3237.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCEldsIuUEB1260hsEib7as+fOhEkA3q24E7ZwTNmDhzZsQa6UXOb4Wv9QAmQ8sLdDDWXAYquqnOBERV9E64PciswENihCi76eIb9rs3an9j8S2YFWVlcPOqP0SGdQzfGrWt1thrc1/Pvz8XdZG9S9cLI5lJUfEB4UdcNpLmf4S0BwuzrUxhBDsHnlStBIZHPbRDzvlnjP8yFICAiMF6mhAXIVT4QRwE9kh89Wn6FLy2XqJhRwbzGaL5Ctirk47JtYA2hoS0b/m2lUtKWV/7Ky91sztqdWOyC/kJTAlEcBMvRxDELRfEszVK5/T+F7F4mSc7wTlXggolIycFUM/+Lw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(110136005)(2906002)(4326008)(86362001)(83380400001)(71200400001)(186003)(26005)(7696005)(54906003)(33656002)(6506007)(53546011)(44832011)(8676002)(8936002)(55016002)(76116006)(64756008)(5660300002)(66476007)(66946007)(9686003)(66556008)(66446008)(52536014)(478600001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9eHXwu2jcvlt6ac5eEO6DiC/dyNdzsBgJMl9nGFQ33D9U8MIef7h+BmJunVVL9EZ7n7rwdY54kqWkdjiISBaLyX/7o5EfKwLTmSRFfmP80fzPXjIAoou+o0ZDWW+7y74TnKR8BpD+IpNjLtt1OI7VuUzPnN5CBEQvw+GmGq6C67sNh5d4zla2IKFZetHR71V1NuAATaiwVzrQnQRZ9AyOiRXhwI2Y31vuG7juXV+x1wOyoWvOW59BrXmM7X726+i6P0YgvqBLan2KGIRIKmfdMmNNmUoxOGZggD7EYrvH3L6oXls15NPacEqLMimIUYhtZZsmgU3jMUiH7xW2PHqHULDDmuhp2WdfKp6IovN9LTdPYWN6Z6SsE1jnqM/I/LVy5hslMaV43jQzvdc5kaFfDOtgoanDK2wjmq2zSxSFqnrSDIQ1mzZh5iclafYLBoruJrub+prS2JmpS4N2mQqO9KtgyYWu/n0nD+VSQ1BiO0cc00FAHV8eI9AD3JAFp8rn6Qf/l/q7bnVq9LXNGeIvvh6O77sFNqrZ6l35d1kE7yNaf7qRSM4XrqK59PJQ0OcPjUGwG0dwDnu1wwN1+v2Tbrnq0b771W5NnnQBRt/xsSETvbjiQXgrStHwduwKuoZopVJId/Vv9NwrrmuU0qyVA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8505f182-78de-4b85-2026-08d85ea7fe17
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 03:31:28.7513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PD/NxpMqlnJ82PrMcZoYEEf/dM5b4Y1H2dCFwNUaLtqVNQgKUgIL5Gs8JHrvSY2abfhD5sPFZd7TzCwB1kwCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3237
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
>=20
>=20
> > -----Original Message-----
> > From: Biwen Li <biwen.li@nxp.com>
> > Sent: Monday, September 21, 2020 10:13 PM
> > To: Shawn Guo <shawnguo@kernel.org>; Biwen Li (OSS)
> > <biwen.li@oss.nxp.com>
> > Cc: alexandre.belloni@bootlin.com; Leo Li <leoyang.li@nxp.com>;
> > robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Jiafei Pan <jiafei.pan@nxp.com>; linux-
> > rtc@vger.kernel.org
> > Subject: RE: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove
> > useless property of rtc
> >
> > >
> > > Caution: EXT Email
> > >
> > > On Tue, Sep 15, 2020 at 03:32:10PM +0800, Biwen Li wrote:
> > > > From: Biwen Li <biwen.li@nxp.com>
> > > >
> > > > Remove useless property interrupts of rtc
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > index dce79018d397..e9e982176e07 100644
> > > > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > @@ -171,8 +171,6 @@
> > > >       rtc@51 {
> > > >               compatible =3D "nxp,pcf2129";
> > > >               reg =3D <0x51>;
> > > > -             // IRQ10_B
> > > > -             interrupts =3D <0 150 0x4>;
> > >
> > > If it's a correct description of hardware, I do not see why we would
> > > need to remove it.
> > Hi Shawn,
> >
> > Don't need use the interrupt, only read time from rtc.
>=20
> User probably will choose to use the alarm feature of the RTC and need th=
e
> interrupt property.  Is there any issue when the interrupt property is pr=
esent?
Generic interrupt controller on layerscape only support  IRQ_TYPE_LEVEL_HIG=
H and  IRQ_TYPE_EDGE_RISING(except SoC LS1043A, LS1046A),
Not support IRQ_TYPE_LEVEL_LOW,
In drivers/rtc/rtc-pcf2127.c
ret =3D devm_request_threaded_irq(dev, alarm_irq, NULL,
pcf2127_rtc_irq,
IRQF_TRIGGER_LOW | IRQF_ONESHOT,
dev_name(dev), dev);

>=20
> >
> > Best Regards,
> > Biwen Li
> > >
> > > Shawn
> > >
> > > >       };
> > > >  };
> > > >
> > > > --
> > > > 2.17.1
> > > >
