Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16D79C7F0
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 05:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbfHZDaa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Aug 2019 23:30:30 -0400
Received: from mail-eopbgr150073.outbound.protection.outlook.com ([40.107.15.73]:22339
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729437AbfHZDaa (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 25 Aug 2019 23:30:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqkoR90b/lByTIihRfM79iiz6oO42j2X0VUMa61rVyVWEJW5a15wjU5cx3HhUbMny8R/1U5aZRq9Fs3hIKGx/+GJBy8xkUdgIPf6HDf7gdbGPVXGW0QgRF4zX0Oo5sX3a7veQHZJsqEiu1VjIXkUP1hpRJoukT/OClubqPvqHzoK0MEKwO0FgsClpezEnTK+PsnsFZF1Y3cUBZbeb+RDUdnDsvz6XGN1Yo++m8ofL5rYrhtaM//yHiNiI4DTGIEPigrFYcBbVnBSOmZA4fQJDp2kCyinOYqSQ6BnrqO3n8grWYZBGm5Cf1LkIisG41SooB99RV8QCRMik96qJRCwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY2FPCeFeAfp86dfmVHs4RT2VFW/1QEpaKTOcC4gYn4=;
 b=MZhi7Qrac77kXfqNehypfqi6/vzXTtYgWWnaAOE5Syv4hgzAgxdcfIu3qN0kOTqU5bB5xbiQN2RdLsacbOcgOHqRqyAazfLhHz0pnTrrX7+nbR6EU6GTYlFkKmep4YHgh1NGDnSeM+W1AiTe/MrWguD9BbeLv9C3oyR3Wdvq2GjcH/LF/2StLsK5JWrxMKaV6PrD/EXFEqOBt9+47fGWqmLa3hjdDiUe+D2rv54ahLSBBO3cO4+3/Q4XR2F2SJt5NjGxlBvlmPPAo+26sJP8lIMGLZgcbACkBXG6MEr17nokzMUzDFGlqjBXChqk/fjNhGh+nnSuDiwuTujzirUvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY2FPCeFeAfp86dfmVHs4RT2VFW/1QEpaKTOcC4gYn4=;
 b=o0OpOOpdi3ref1dZRb7aLd9ZSS9U0Qh8dAer0iwVZ48G8c6h4mSHDSVCsZmI6HuXQjIhbPUnwpbnm+S5+L1vK5v+g8+LnvGvg7E456e0H8ICAjd3XEoqBR4/QTSKTmwBJX44KMmjq5/nDQYWTpE6MLiK3Lxhp3i2owPWTvr/WyE=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4313.eurprd04.prod.outlook.com (52.135.131.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:30:23 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 03:30:23 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Topic: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Index: AQHVWZqkS7VqFcEexkmgcQwv8J5Ri6cIyeYAgAP/0yA=
Date:   Mon, 26 Aug 2019 03:30:23 +0000
Message-ID: <DB7PR04MB4490842E0D25449CB10897258FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <20190823142504.GA30479@piout.net>
In-Reply-To: <20190823142504.GA30479@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a66b7f73-a361-48e1-481b-08d729d5badb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4313;
x-ms-traffictypediagnostic: DB7PR04MB4313:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB43136C7594FB608DF1D450D48FA10@DB7PR04MB4313.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(966005)(102836004)(186003)(256004)(52536014)(81156014)(81166006)(6436002)(8676002)(8936002)(66066001)(26005)(54906003)(76176011)(33656002)(7696005)(316002)(7736002)(99286004)(229853002)(305945005)(74316002)(86362001)(6916009)(486006)(25786009)(71200400001)(71190400001)(446003)(11346002)(66476007)(76116006)(66946007)(66446008)(64756008)(66556008)(3846002)(476003)(2906002)(44832011)(478600001)(45080400002)(9686003)(55016002)(4326008)(6116002)(53936002)(5660300002)(14454004)(6506007)(6306002)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4313;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NlQHRysijXH0KImE7QI8XL2btbUCVeCmzqS6peXaviPEEcMI17080+n1wVhqlObarr6SG7tOSYXKL2Gxf9xMFbWBAbhOqaN1NCR/RtsGzBP26su9hqtkC+1OKw30OJVWMJFvwtrntj10+awlGGJuR4wQ19aZPUSgagJjO34pFVhoHDhAjYKIgfc9lHPw/iaY1WgI0TCXylq719o8YehvBhzYU+QV2mObGJdrhlztNGhzS3V7jH8MTw6yNZwPa3GJeKS/CML2wxpuJjeBZ9/kqOCf9gbyMhAowG1NPhTAGONAH7OHYqcR82K4Zc3Nh7afkpKDekaED0OW9TBZGdHCVxztuATdW5JIe1mdPAhQmnW8nyz9GR2BxPRir0TxdNxXLI1AKxtIFpZTNoCIIIJxbnGA2cTVe+a7OIN4JCjXgY8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66b7f73-a361-48e1-481b-08d729d5badb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:30:23.5540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WatmWtO0+mWAfDM6wN2Km9Vyqe+RKbGmMrGK2XptvgJhr/ysvLR40wozcE3uhi5IbyHiQDsQmWWOQkr6fisomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4313
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> On 23/08/2019 17:57:38+0800, Biwen Li wrote:
> > The patch supports flextimer for lx2160a
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > b/drivers/rtc/rtc-fsl-ftm-alarm.c index 4f7259c2d6a3..2b81525f6db8
> > 100644
> > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] =
=3D {
> >       { .compatible =3D "fsl,ls1088a-ftm-alarm", },
> >       { .compatible =3D "fsl,ls208xa-ftm-alarm", },
> >       { .compatible =3D "fsl,ls1028a-ftm-alarm", },
> > +     { .compatible =3D "fsl,lx2160a-ftm-alarm", },
> >       { },
> >  };
>=20
> I've squashed it with 3/3 and in the patch adding the driver. I also adde=
d proper
> documentation.
Alexandre,Ok, thanks.
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C7566210e899b40e873
> ff08d727d5b2a3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37021671089906922&amp;sdata=3D9RgT5DBeB0HL5RhP3pI%2FuOglIe8pY3wsp
> 2fPsnwO2iQ%3D&amp;reserved=3D0
