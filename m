Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F94C273920
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Sep 2020 05:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgIVDMr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 23:12:47 -0400
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:29638
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726818AbgIVDMr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Sep 2020 23:12:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7dyaNEo6Aft4t8ExjaksrRj+LWbw7MzTxeu3grWuaZzhN8e3rjdM4zb2dWWKbz1CVjteUAgIdlbUvf2NVltECR80BWHpiRwcd7kJBe/x/T3/M2FJpYfIaH2724ywIsaPqpLiYnkRJ2clpV01Wy/rpQguHkHgjRnlHxjcd9ER+Q6VAW31KGzK+50ryQRd7obqairfltkID1zTZXCD0ZHltponwcQ3WXQEZDl5vahC8XbwkJdw762F64aL8N++dNDri50F/0nM9Pq3+DzqplhkIz1Q2xrtvDvlTrk5y8tksekw2hSwGdtTOxEgktIxYNZd557jhJhF6jSYZtYdFMKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4VFLk1WxQU+yP2oNdMNeL9DkeDgdI2GSYTlMAI+inE=;
 b=MvuAnSMkXnTVC4ORjGVELRgkX+rc7ZPeRi6agndiU7S/wkXhezrWI4J3yA7bD9AATkD+CrSdpwrtrDFtdiDbRJqfV6b11pcsdJfzLizOdjIVbTz1HB8mqYl0a2xtdMBLxxpPysdIzsd5gEopr+kbV7qh3bAnJ+HF2jmEyimFY4uw2Y5Yy5kdMe34boA+iNHtW4Fmt57vhJlhW/hUr+lkQjM+7aYUgaYhmpFVpvQYLppY6giEgpVG+4lkVz2yrZ+Awc9abaV1aFLeLq1t+dZzqiHIn7/W/0GI+3ksNerm4/4flTcjWAZ8KZve5EEd33+TSrHINos4Ze2JehdMCprgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4VFLk1WxQU+yP2oNdMNeL9DkeDgdI2GSYTlMAI+inE=;
 b=lm8YVF0KkwrN2mBLs9jxSd7R60+qJhnZSTtyugYYl+vRnqIS0mHnL6WAkREmzAHdfqf/49FS19at+w/BjzECUoWfn6M4m3pGCVC2Nw+sTk1x/JWQeuSG0YB4X/az8BHjEIC1cixGOCOTerX3Og1nZRW7SA1b5V4Ya0geIwv/oy8=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB7PR04MB5449.eurprd04.prod.outlook.com (2603:10a6:10:8d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 03:12:41 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e%7]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 03:12:41 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Leo Li <leoyang.li@nxp.com>,
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
Thread-Index: AQHWizOOGLxVV6x4KkO7cstIkfxRIKl0Ax6AgAAAVAA=
Date:   Tue, 22 Sep 2020 03:12:41 +0000
Message-ID: <DB6PR0401MB2438ABB1DFE785F9EAADB69E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200915073213.12779-1-biwen.li@oss.nxp.com>
 <20200915073213.12779-2-biwen.li@oss.nxp.com> <20200922030208.GY25109@dragon>
In-Reply-To: <20200922030208.GY25109@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c74aaf68-7c15-4637-21d2-08d85ea55e5b
x-ms-traffictypediagnostic: DB7PR04MB5449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB54497B4EBD80E726CA4E83718F3B0@DB7PR04MB5449.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: McT0x1WtCx/mcVgvcxsI1mYua1kzaZxD5/KOJJMt7h6f5qf580+rvPAuMHJ4p3DWMAi3vx8QtZumjdDqmfvgZSVTZPagG2HfrV4Mke/hKKOGCISKLBiSc2UT/r8mN8OKApjpOOe5Syu5fe28bZGbqjWWmMqqSKIOzMY1C2NvZ0A1zogb49uMdcu8OptciyQk8p+2+yFLQalhbwefBbcGjUf4Ubm8ZupxYmEjaigN7+PIojudMNoAtw0De/NHZKeNdZ6hJYjMVIWnZDuMDrw7ld8sT3TAfopNg+atpSn3/85D9M7sN+rjjXP95dWtWwxnJNCoJrO3/Vr0RZVhWVkM9WQZ/+ToVYfepp+vdijp3lNHTxLIGGQXTLOyquy33KXw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(55016002)(6506007)(478600001)(52536014)(110136005)(316002)(4744005)(76116006)(44832011)(7696005)(54906003)(83380400001)(8936002)(66476007)(2906002)(33656002)(66946007)(86362001)(71200400001)(4326008)(66556008)(5660300002)(26005)(186003)(64756008)(8676002)(9686003)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uJ0QGhNLTKX9F/91e+3x1cSVH6Zqys0hsFb26T4IvOFtpozkwDfBkDIHwZiniIvbq+snmpr1W08nSKheQc4vrM+BUl897Ix58b3Vn3SpfnQsObQCctJSgzkK0cBUSPC9aGlY4Tmgb27khpUUntPHbFVA1ol12bK83LtoxmMmTkdMNQy4XOdFS8aI/RWDSGwsGACpN7oRW7ltcVfLH5BStXj9oGieCwRPUoVN//HA3ngd+IYewoabtbEC2eZkqpkZWqNw8n3QM85TIZYd11KNuxWU5SoVhM2bQjEBAC2au9rA/FcvBuLVuknyshNDoi7msIu7PLsQkobuovXboUmJWM/OQB+Tl6wcIlAgWkFJH+HeuQcb2DT9S/yorDd9rfft24lY724wdxUmCPxSEcO9BMSnS0XdgURTvpLAFyuvSDN6z0SsTZGEoAz1Fcigawcv8QAmvUDjBY5y5LmSdVcVmkZTFFWXaXz6p2rMmSxcrAOX5dDO7QXFbJhCq4y6mjLtNgwAdr4zimGHjz31wFGDIPKooke+OFyV1Gk9x2+0Slrw9LX0m/eywkxr+d6AMAuCV5NIGDw9AcWk/pEki0I4uTr+EWuirIFb+VS2Y5X9qwtQGqptTdrSuwBxK3rOsnZebt8JX70AjRVhrIy3rRg5uQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74aaf68-7c15-4637-21d2-08d85ea55e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 03:12:41.7801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WftXCxOCAb48Z71eghSykhOk5sRTnnMtWGbhNQ6ggE1HEZ8STJmXSCgoYgtZSeCEYonjI1a687ZUEm3oNemWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5449
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On Tue, Sep 15, 2020 at 03:32:10PM +0800, Biwen Li wrote:
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > Remove useless property interrupts of rtc
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > index dce79018d397..e9e982176e07 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > @@ -171,8 +171,6 @@
> >       rtc@51 {
> >               compatible =3D "nxp,pcf2129";
> >               reg =3D <0x51>;
> > -             // IRQ10_B
> > -             interrupts =3D <0 150 0x4>;
>=20
> If it's a correct description of hardware, I do not see why we would need=
 to
> remove it.
Hi Shawn,

Don't need use the interrupt, only read time from rtc.

Best Regards,
Biwen Li
>=20
> Shawn
>=20
> >       };
> >  };
> >
> > --
> > 2.17.1
> >
