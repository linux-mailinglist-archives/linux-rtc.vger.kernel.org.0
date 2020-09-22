Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BFE27393D
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Sep 2020 05:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgIVD2k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 23:28:40 -0400
Received: from mail-eopbgr10048.outbound.protection.outlook.com ([40.107.1.48]:7566
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728546AbgIVD2k (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Sep 2020 23:28:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh8lbsju3DrIEkAqgVMcpDuLxUU7Vk3AiwFFcdCqm58V93GSqJnMBAPCzUyB/XWsbswGCkkOncMhkIPowNakEOGd2gJOBZw2fsJ7njK+/arpYXxca/Qdd1WXX8n4aYKpKyd7m86YAdG475/nZ7yHBfGAd5FyKTJ7OtH7TUe9Hm1ry+DBTsrGBWofbT2VZkUNpvpggUe54w4wjqnlAKtZYZk49fS37FdoG0brk2J9XGAtcfjoU+G6kMyZRpiqscGHPd2gfxjj1Yxwub/ZdhLdi0sTl5Xo/Cxx7oBVTw+Rt2srWRJAIGMp+PVI8EgOJOXTWOXqevRaZcBE/4McHAfhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25w3hxG7ftRm4c7PRrlW71Lc7si8/DPcfFPczm7x6as=;
 b=NxnMI/L16lcspWNojGpmIT3i4hv/+RnheuG5tb8Kqjg4c9d2ify0z1QGdBH2+t67WMsSMmwNxbp0uyBG0go5mDdykfhOTmMG2qHYnfy1y505W4pz4+nxK/xkpfu9/Vhd0kTqydwkMGqHJa3a9Th2oM60+8MYUeITvTAMXSyaY4MBwbnBeF1rq9oxfZtDye5wJQl1PkT7utS6Hi4FJ218wMIT33MEvLB06yfnFVLU20vGQrTSZc2j0JOM023TMHsqBfauMMYJXofPK76K6BsTfPajg1mE/8U+utb+qlqTu5dFBV934z3F9Srskq3xnZacwQawqjPVQd8v+LFYTfTOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25w3hxG7ftRm4c7PRrlW71Lc7si8/DPcfFPczm7x6as=;
 b=J73tU0JPLSu3fsI9bfbg3jwJ3jwbaiWMrFLlImG+YhIPwHAvDNep0NKAWCsq30UbxGaSUF72OCrv45u7NXhatnq2mfIOiyw8o5WyAqxsbOj16Snk9isz2hU8VOeJorpuCi1c71LmBnM6TwTL+rS0G5wpFr7nOclkVJRFrozLquo=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR04MB3183.eurprd04.prod.outlook.com (2603:10a6:802:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Tue, 22 Sep
 2020 03:28:36 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 03:28:36 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
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
Thread-Index: AQHWizONvf0ZYQj+3k2YLBbxVGhHg6l0Ax6AgAAC8YCAAAPFMA==
Date:   Tue, 22 Sep 2020 03:28:36 +0000
Message-ID: <VE1PR04MB6687237BD5D137C4B9EC6DBD8F3B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200915073213.12779-1-biwen.li@oss.nxp.com>
 <20200915073213.12779-2-biwen.li@oss.nxp.com> <20200922030208.GY25109@dragon>
 <DB6PR0401MB2438ABB1DFE785F9EAADB69E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0401MB2438ABB1DFE785F9EAADB69E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 68cd1aaf-9fe8-4c93-fbe5-08d85ea79739
x-ms-traffictypediagnostic: VI1PR04MB3183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB3183CC17FC22966A1E4B6E528F3B0@VI1PR04MB3183.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miJcnJ36Tx5PKPW1xH7sdFatTgTqJ5kh/Q2AnlEZT9FsO6HyjHdrezmVkoCncikfDZ0YlQYLDvmE2JY9TOvSnaJ+Nx1cbl0l6t0U4xOuBnkcr7RJ7S04qG4FJy62W/STOnYAexzifxPzmNQOEOJBgzn3HgKZYysc3JjXxM+tZH6SpQi3cv1m02kqrDQ4RP6JF8jr2udiTmTA6obY2OguqZAvDYLcgwjY+RJCHQ9JldAAKtJKprnD+o66czDlL2UYkaoNM38R0hU1N11+Cg6MXUCe/+w3StmbmYy1S9jpFt8NW7mW/XPtHxwF21zENDhRUuPHrK1MPrltlyc0ASPoog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6687.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(33656002)(8676002)(316002)(83380400001)(66556008)(478600001)(66946007)(66446008)(66476007)(64756008)(8936002)(76116006)(4326008)(5660300002)(2906002)(26005)(186003)(55016002)(7696005)(6506007)(110136005)(86362001)(54906003)(71200400001)(52536014)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aulJSdt+9Du3QvqkcLxC4+FKydAE58Z1ziG0KicWaj/5ZTah2vlJH6JQphjzmszecvUx94TOOUClvWRl6PIq2nJQ+xX0lwqNWBXdOs3gr09EkHYRhrYrXdi6lLOmx9CSk5e0kJg/7Uzh3RoLGH6xLqv6vWpKkTwLA5KOjQuBXZmXfRPXCqUpJivA4T5XMEw1oj9AEFaODEe3TdHfpDCwLiJ1qhAs8AK8Ck9JXo6CRJc8ELfWDlWvlaoL/40krLjJxJq3mRRdwiYLuFqIglKFjFirKZixxIdb66e+4xELsPQV9Sm8T4+uG9YN0V2Y+HjJnnv9J2uEF/ypMcnojFUUKDzKMQCL0kYeDdAIqVROlxYiOmQ9H0oQ41UQVg3q7fN+2HMQe0V/8oXvMjh+LjKn7/Rvz7rL/XmIquRj2OB7tkYXz/yI+lzkyMQQgmwxHAwNxkDVGC0SlQyE7Zl7oummq4izCDtJhHKIXNmtccG2rDR6JK69t3zdOCyM4V7Jtlcq3qqmqKfzVhJkEbG9xPB9IYWBIjyJm73QHgS+QTPywxdPVVFez8CGdxn5l9Q9vjUb0oyLCIEILOQSqz03agOEyH1+8ABUVrbamSiV75nncxXOggyoLe1Wl8Xl+OeqV3cOd5F624PGBGY4+jzZVN5gkw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cd1aaf-9fe8-4c93-fbe5-08d85ea79739
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 03:28:36.1544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JC0oNQ08wt1B19sd34H+GqIBb7JWWQkVMVD/QLFv8Ayk2SfNqB48V2pvUilw9xx9jEKaGEDpG4H7+YCM0hpTQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3183
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Monday, September 21, 2020 10:13 PM
> To: Shawn Guo <shawnguo@kernel.org>; Biwen Li (OSS)
> <biwen.li@oss.nxp.com>
> Cc: alexandre.belloni@bootlin.com; Leo Li <leoyang.li@nxp.com>;
> robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; Jiafei Pan <jiafei.pan@nxp.com>; linux-
> rtc@vger.kernel.org
> Subject: RE: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove useles=
s
> property of rtc
>=20
> >
> > Caution: EXT Email
> >
> > On Tue, Sep 15, 2020 at 03:32:10PM +0800, Biwen Li wrote:
> > > From: Biwen Li <biwen.li@nxp.com>
> > >
> > > Remove useless property interrupts of rtc
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > index dce79018d397..e9e982176e07 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > @@ -171,8 +171,6 @@
> > >       rtc@51 {
> > >               compatible =3D "nxp,pcf2129";
> > >               reg =3D <0x51>;
> > > -             // IRQ10_B
> > > -             interrupts =3D <0 150 0x4>;
> >
> > If it's a correct description of hardware, I do not see why we would
> > need to remove it.
> Hi Shawn,
>=20
> Don't need use the interrupt, only read time from rtc.

User probably will choose to use the alarm feature of the RTC and need the =
interrupt property.  Is there any issue when the interrupt property is pres=
ent?

>=20
> Best Regards,
> Biwen Li
> >
> > Shawn
> >
> > >       };
> > >  };
> > >
> > > --
> > > 2.17.1
> > >
