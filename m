Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48AF59CD5C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 12:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfHZKhW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 06:37:22 -0400
Received: from mail-eopbgr40048.outbound.protection.outlook.com ([40.107.4.48]:49636
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727692AbfHZKhW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:37:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XihT21ef2sqs2zh4/Z568QD7SSFEc55+aVUkpseauSaXb+q363KdQt2cY7auDFUGL8LHoaaomzoxiUnJ9979cLK3mDgvqTko4TyvTiRozsnOtSNAimqgJljSi7hk2swNtyJjln9TehYSmN/hQaLazHAX9Zztucp8vZqmp/oaS9WfBRktSFX/bnAWcoqc4fqLLtT61aflyvXQ+CXUPgUt0MOzHT5URhx+xVSzhd3JaD3+VtarLYuzvqfRoSpffEyFNMxsQvpFxjxBKnFjGr8syd4rGPPOYvVzwVGaMZcO1lQuplW4E4DGAIc5Z80Mec03EzUchCGm2m26nKgN45Wfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xVtxmxxYz25X6I0YPcxrT2qAcm7h5Aji+lu3KcBR+A=;
 b=bqAlzy9LrvBxsqJHwZDVsC4vHn2w03HTuRT4se1nrQFuoIXS2cF0+Q8WZu6r5kkGp9u/utUx9YzWwb16eNuzKl2EfrJ3dU8GAuPOKXYe1m8eIcnEuJubaxj2BoZNhF1JRFoUoqzceWkv6dtf5axRu8rlMeFG9o4BF2uj0shlMNWLbw7T7b5k0ynyYqaHZqZiiOF6fO/5wyJ8n3/To9dPgqbfg7NRITxH6iR/+oUwaiKFvK14S/ikFKK16YOrsJupvl1/mMePpJqyBub6xvkeuYZh7fEyR17Kaw8bSnM4wgKBUkXA309bYURs8BEgue5birouLI9mwIX4ebn2CkDkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xVtxmxxYz25X6I0YPcxrT2qAcm7h5Aji+lu3KcBR+A=;
 b=USQWoV8xA0wlF8YwyKtzOZCDccK+CKbQeKu+T6ZLyZvH2RFgHeDibh/2pMyfEHPsnnlaiKh5lgDQouKWGL1CJSXfJKIHnaaOL8fbcC+j+TEoNvoieo8qOIYJzPLfvXcBmXrrjTosMfRg2wKGAhdwbnF/nnmKDcK7pzXuiLivcYQ=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4780.eurprd04.prod.outlook.com (20.176.235.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 10:37:18 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 10:37:18 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Trent Piepho <tpiepho@impinj.com>, Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Topic: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Index: AQHVWZqkS7VqFcEexkmgcQwv8J5Ri6cI9DMAgAPWNrCAAG9OAIAABefw
Date:   Mon, 26 Aug 2019 10:37:18 +0000
Message-ID: <DB7PR04MB4490446BD87B67AD4FB4A37F8FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <1566579388.5029.8.camel@impinj.com>
 <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <20190826101018.GC21713@piout.net>
In-Reply-To: <20190826101018.GC21713@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f9e7037-019f-4efe-7063-08d72a115e6c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4780;
x-ms-traffictypediagnostic: DB7PR04MB4780:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB478085771E1C767830E36CEA8FA10@DB7PR04MB4780.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(186003)(26005)(6506007)(8936002)(446003)(102836004)(3846002)(6116002)(5660300002)(52536014)(476003)(81156014)(8676002)(81166006)(11346002)(44832011)(486006)(25786009)(4326008)(6306002)(14454004)(256004)(86362001)(71200400001)(55016002)(45080400002)(53936002)(6246003)(966005)(9686003)(71190400001)(478600001)(6436002)(54906003)(316002)(6916009)(64756008)(66946007)(74316002)(66476007)(305945005)(66556008)(66446008)(76116006)(99286004)(66066001)(7696005)(7736002)(229853002)(33656002)(2906002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4780;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Sfor9r1gElapgEKCjYjlnBESklm4cApeK2uvhvygjjHP2z2OiTN4sOnHH4DfFOkJLbmMGzYwmX0Lj4AMYMTjrwmpl/JgQ0QI2ckmZ/AETfPtRztU32yLpa5U27hndFEzaNvyoBlaZ7+yXH/IIYErAl0nZMF8m+L7cl9reNMZQx9P6TP3e5xhZcTCoWCtvp12DK33th4phv0kRMZLjxr56GAYzoG95HnoPHRsD2cXQ/+oVKol1xMixLqd+LObAIDXgAoPcfonNGLa+tLBFvCLndiIwXTEXge9q2krzLmwTl0wfLROGiN+m1UirnZG+HNfMzWHqvD2G0IxrTKQViyvAQUejHbtfcE1brPvQVwaOfOuwLH9lz2HyFk6uZCHBws9fFXnwPa1WDpTAfb5q1ojKBEbdDnAM2RhssVpPqbBbVE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9e7037-019f-4efe-7063-08d72a115e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 10:37:18.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: smHlR9BJ40eJf+6PtqwnNyEBV0cFCNQjNoAFA8ODEspEbuEP1qtiI2dmjoXur4O4hN81jntD6pM8fFyEVroOzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4780
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> On 26/08/2019 03:37:43+0000, Biwen Li wrote:
> > >
> > > On Fri, 2019-08-23 at 17:57 +0800, Biwen Li wrote:
> > > > The patch supports flextimer for lx2160a
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > ---
> > > >  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > > b/drivers/rtc/rtc-fsl- ftm-alarm.c index
> > > > 4f7259c2d6a3..2b81525f6db8 100644
> > > > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > > @@ -313,6 +313,7 @@ static const struct of_device_id
> > > > ftm_rtc_match[] =3D {
> > > >       { .compatible =3D "fsl,ls1088a-ftm-alarm", },
> > > >       { .compatible =3D "fsl,ls208xa-ftm-alarm", },
> > > >       { .compatible =3D "fsl,ls1028a-ftm-alarm", },
> > > > +     { .compatible =3D "fsl,lx2160a-ftm-alarm", },
> > > >       { },
> > > >  };
> > > >
> > >
> > > Since there's no data associated with each compatible, it doesn't
> > > seem like there's any need to add a new one.
> > >
> > > What's normally done is add two compatibles in the dts, the base
> > > version and the specific version, e.g.:
> > >
> > > +               rcpm: rcpm@1e34040 {
> > > +                       compatible =3D "fsl,lx2160a-rcpm",
> > > + "fsl,qoriq-cpm-2.1+";
> > >
> > > Or in this case, compatible =3D "fsl,lx2160a-ftm-alarm",
> > > "fsl,ls1088a-ftm-alarm";
> > >
> > > Then there's no need to add to the driver list.
> > Yes, it will be work. But it will be confusing. Is ls1088a same with lx=
2160a? No.
>=20
> Well, if you are sure it is the exact same IP that is used, then you shou=
ld only use
> one compatible. We usually use the name of the first SoC that had the IP.=
 Is it
> confusing anyone? Probably not because this will be in a dtsi that nobody=
 will
> read.
>=20
> Note that adding so many compatbile will increase the boot time of your
> platform and this is annoying many NXP customers of the i.mx line.

Yeah, that makes sense.
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C3f6abbd69663483bc4
> a708d72a0d9999%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37024110214068297&amp;sdata=3DZh2eYNYt9IjWdf6jCdqY3BI%2F%2Fstgcqmq
> Ai7R%2Bm2dD2I%3D&amp;reserved=3D0
