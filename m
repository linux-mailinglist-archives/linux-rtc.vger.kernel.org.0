Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206732CB2B5
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 03:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgLBCPi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Dec 2020 21:15:38 -0500
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:39813
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726860AbgLBCPi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 1 Dec 2020 21:15:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX89SbKxZwlgG11fqTrRrxQdZaTL3J5l4NQ2JTcbJhL8IkR2LSTJG2ksFNOm1Qyniv679SIFBBmqsLB6MwYim9nSu6K2d47q11OXVonKWvVRf1E35tNzeyEfG39mAOkUV7kudT4zTAz3dTajH+0fSn8cItHpV4eQN5fS/kihyAzgvpqLZnbeBxM8qFeY6s+kMXG0Ea/9LEfY+7X5N1KKekdaG9ztQ/FwYScc9RmSJjjR721VkZ310JoZ03l96M0x66iQhO6yDkx+kTqyWTXbv3k4tHgQli4cyuSqThZft5VPmghpOMLmXKKvWcD7zRrEfcrCod/9oAqrrsK3oMWkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w1JJ20URHH6Ils9TsgaW/F/Ke5E7EkECOJJBST0qsU=;
 b=VomUywV4VwCT1nMK/DOeAd1FqVg6tRzDoqk3GX+aw1FEMl1fnovcO9sSj3GgPDEXhDXzWaG5Aiq1O7PXqQ8x+b9pQDUiB57lk5i69fItrPbywV6d74jUD2GqmDPpf/SLeJU0dPPpOySn62ODVNWPrA/ICTGKxIUsN1dqprPBaliL9F8tfkOMS8FOPV1xkD1jtnBY3ZkvT0GEYWivdlKIFdo0GZ38hLyXajuuiOAnEScyImkmRkppT/HQ0pOI0KAx5eo23jCPBQbCAXTvkEC4UdUuYKNMVQpiMQSJ2qHjC62gQP8IiS2qee+KlkXm3bY3raF9RIqY8l4082qkTQ85rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w1JJ20URHH6Ils9TsgaW/F/Ke5E7EkECOJJBST0qsU=;
 b=byIstjtLuYfDGrTiqF6mBXMMvfHRbPSXY5Z14vfch4fNPxOBsB3WPKfr+w4cJoQf2e3stQ7avPrQVQUBco1YnkzwvAQrGmFw1HRsnaekip9pMXF00AtfEraKu0WHGdt3YKLbdZw0AbtkBa+Eyk7xd37xepQzd2ELiQrYNMkwMtc=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR0401MB2437.eurprd04.prod.outlook.com (2603:10a6:4:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 02:14:47 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 02:14:46 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>, Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [PATCH] rtc: pcf2127: clear the flag TSF1 before enabling
 interrupt generation
Thread-Topic: [PATCH] rtc: pcf2127: clear the flag TSF1 before enabling
 interrupt generation
Thread-Index: AQHWyFDncqYUlom5fUmrNxFSLMkDiQ==
Date:   Wed, 2 Dec 2020 02:14:46 +0000
Message-ID: <DB6PR0401MB2438C8601E14BBD7F2C4DAE78FF30@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201201084746.20135-1-biwen.li@oss.nxp.com>
 <20201201110235.GC2401593@piout.net>
In-Reply-To: <20201201110235.GC2401593@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ac96aae3-2373-462a-32fe-08d896680a78
x-ms-traffictypediagnostic: DB6PR0401MB2437:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2437C528471F867BBCF7B68ECEF30@DB6PR0401MB2437.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ewXB/TkTb/z7rAFIkF4l+IoVDZwHOy4UvrEKMCYzpEwiaxzHb8tVNuizlYFD2xZ7P70oxRbA2zEFLKepTqmpF7x6V42zlhJZ+pRm4HaHP/83Xxue1v5sLbzhvSlnm4QgK0HbWKL6/yCFmEmXx6z+/6z2VudyFl6ZaWf3rc5yMqJPfWEQLSMIVXo1dyXW0hnxYbyMfYj8BxyU2Bdk3zfmJlPq4I/iUdB/aGHmSVnAT0/roHAtpvEnls7lEJyO4C5fiOqLAEkZ+PQDPfgE2EpQ8s/WstDx1vSuOgg3VBp/ZsyuoYek2jQN9mh/VSk9BpFkdIw4IeH7ryMd3cFqs44tN28pN1/d4u7jZFmGu9Rk6SC2XT4BnyIUcOzCAcNOu2qGj1ERILq8HogKY4d14BvECQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(8936002)(186003)(26005)(8676002)(6506007)(83380400001)(478600001)(110136005)(966005)(316002)(54906003)(86362001)(7696005)(55016002)(76116006)(5660300002)(66946007)(9686003)(33656002)(71200400001)(66476007)(4326008)(66556008)(64756008)(2906002)(52536014)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?83tadS/qBvGmhC3D2gADBXhW9u5k6SXDnmaY0bcTwNpO45m2/FFy+bDIQWjL?=
 =?us-ascii?Q?rLBemPEbJnQbE3wBZqdlj+MyDnCKuoo3rnx3GyCDyuNCGBcLDFC+xGY7894/?=
 =?us-ascii?Q?uycv/O0HCXyIBuk3KSqAhraxzF8WhyylZE4L8qqt8aMP0EJwF122WZBI9fj6?=
 =?us-ascii?Q?zIXTAUygkmwMdilu1UtK/8i0JDhN2STkoVb6wiYCDo2CikaNvOtSuAOESXZv?=
 =?us-ascii?Q?QfNPNON+wVcmti3lwuC6KDLc6pKYsme5zz990pC8i0Q0kLhmX0LOXlMookhj?=
 =?us-ascii?Q?jGzcTwbosjcPPD17gsxXFJ+700kcE7qMayn5FvmKeLYwDf+MGWrjVEhRiL6r?=
 =?us-ascii?Q?cMUa/BBkRDelQt/2GopdazlHJTRpJ3Mjf0KkfBRkq+C3InkUQpEXpgjgZfq7?=
 =?us-ascii?Q?XNmtlFW3Y53zi2H/eFHjkGTDjaRkf3q6W//u9f+THviaHT4IKD5y6y+ckjul?=
 =?us-ascii?Q?xogm1PKfNURSEOAVm9ewffAPruDt9rLsIw2Ayq9J532sPCMPckLVbZ0N67p1?=
 =?us-ascii?Q?8tYodDdXESE9qx+Nmu7jeJuPBmzOEB0NXdT7zH7AAR9D5eiXB0Fq+bgXn08D?=
 =?us-ascii?Q?OxM5Q3h/6YFp+jmXHvj5GtdkbdP7FbD53vgPhCwDonyFvUZfrF8pOfyCclH2?=
 =?us-ascii?Q?/3X05+gd/QOKm7J2SFTg236J4r9+YTkuyC2G+V3+oSXVoSx4iDTNRL/lpqjs?=
 =?us-ascii?Q?0RTFceZ96Y/3O0KSXb1SakOK9DvsCMVLPMp6GKEecvghvt3eY+306d+cohXV?=
 =?us-ascii?Q?tUGKuPpFYHAI98ePvwFpOUOXimC0/FHy2XHsgF7q9j7yxU91zu1QfjDcOmd/?=
 =?us-ascii?Q?sqWf+7J6ebDwY8N70y6M9KFptjnOQ2JWJJGP1Zr0d6LyQFe6/LEJoPkSt9Rh?=
 =?us-ascii?Q?NAfLW61AFP2BjeDKkz2zl7kJSqD4XMz336yiv+ko9GOeGHno79s+aQCsLf3L?=
 =?us-ascii?Q?gTj0yDgUkGtShfSFHCXrPatxNmmZu14CCxj5hcCk450=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac96aae3-2373-462a-32fe-08d896680a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 02:14:46.7590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8U1jo5XrXoEUPCl8kEbLST1EgGQmi0E4kjQh8iIRpQtdAV+bJxTlwFk+Zpn4ncFg+py5TgAkx2cD7GZwK5yXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2437
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Hi,
>=20
> On 01/12/2020 16:47:46+0800, Biwen Li wrote:
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > - clear the flag TSF1 before enabling interrupt generation
> > - properly set flag WD_CD for rtc chips(pcf2129, pca2129)
> >
>=20
> This change has to be a separate patch.
Sure, np. Will separate the patch in v2.
>=20
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 07a5630ec841..0a45e2512258 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -601,6 +601,10 @@ static int pcf2127_probe(struct device *dev, struc=
t
> regmap *regmap,
> >  	 * Watchdog timer enabled and reset pin /RST activated when timed out=
.
> >  	 * Select 1Hz clock source for watchdog timer.
> >  	 * Note: Countdown timer disabled and not available.
> > +	 * For pca2129, pcf2129, only bit[7] is for Symbol WD_CD
> > +	 * of register watchdg_tim_ctl. The bit[6] is labeled
> > +	 * as T. Bits labeled as T must always be written with
> > +	 * logic 0.
> >  	 */
> >  	ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> >  				 PCF2127_BIT_WD_CTL_CD1 |
> > @@ -608,7 +612,7 @@ static int pcf2127_probe(struct device *dev, struct
> regmap *regmap,
> >  				 PCF2127_BIT_WD_CTL_TF1 |
> >  				 PCF2127_BIT_WD_CTL_TF0,
> >  				 PCF2127_BIT_WD_CTL_CD1 |
> > -				 PCF2127_BIT_WD_CTL_CD0 |
> > +				 has_nvmem ? (PCF2127_BIT_WD_CTL_CD0) : (0) |
>=20
> I don't like that because has_nvmem has nothing to do with
> PCF2127_BIT_WD_CTL_CD0 and nothing guarantees that we won't ever get an
> RTC without RST but with NVRAM and that willprobbly be overlooked.
Okay, got it. Will correct it in v2.
>=20
> >  				 PCF2127_BIT_WD_CTL_TF1);
> >  	if (ret) {
> >  		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__); @@
> > -659,6 +663,21 @@ static int pcf2127_probe(struct device *dev, struct
> regmap *regmap,
> >  		return ret;
> >  	}
> >
> > +	/*
> > +	 * Clear TSF1 field of ctrl1 register to clear interrupt
> > +	 * before enabling interrupt generation when
> > +	 * timestamp flag set. Unless the flag TSF1 won't
> > +	 * be cleared and the interrupt(INT pin) is
> > +	 * triggered continueously.
> > +	 */
> > +	ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> > +				 PCF2127_BIT_CTRL1_TSF1,
> > +				 0);
> > +	if (ret) {
> > +		dev_err(dev, "%s:  control and status register 1 (ctrl1) failed, ret=
 =3D
> 0x%x\n",
> > +			__func__, ret);
> > +		return ret;
> > +	}
>=20
> Doing that means ignoring timestamps taken while the system is offline.
> It also doesn't fully solve the issue because you are not clearing TSF2 h=
ere and
> also it never gets cleared by the driver later on so I guess you will get=
 the
> interrupt storm once a timestamp is taken.
Okay, got it. Thanks. Will clear TSF2 flag in v2.
>=20
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
