Return-Path: <linux-rtc+bounces-4830-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC0B436C1
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 11:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124225A08DA
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 09:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF032E2EF2;
	Thu,  4 Sep 2025 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PY6KtGhR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055572E1F03
	for <linux-rtc@vger.kernel.org>; Thu,  4 Sep 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977238; cv=none; b=ISmoCbm94kiGxTCOsUsKJ40CW2n5VqHmFt1seKa0sHCFsvktbT75wj2XyR9uFhfwFYKrGiBiShw+ZDtihP8hYyUwOwcka+rV5sdcH87InyW/QXJEVnfsJ4BJrRBC/fOvBnDK2D3T34igrAmqcMqPuaDZwjDl6c50v49m+U36o8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977238; c=relaxed/simple;
	bh=0KMAEfR0V0VEYFiwcgqzkiMZLifpuJMqRR7bm2KR/yw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RwI7VY3GJWRDuOcGRfY06YQnZzd4vAQl7sdV/OCPb0biCUWzZ9A+mJzyDCRWSqMAjomeahccOgFoMo+2rMXFmyFymZiZD4XLyYWJuYNNc7x7R5Ak7rlVSiWFNW5qfRpFbhSW/wVljywXXFYanZPrJItS/g7tg+mYlnnm4s6poNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PY6KtGhR; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250904091354epoutp02021679c57c9a45d530ea3d46e267ddbc~iCXxNH3Ak0610706107epoutp02v
	for <linux-rtc@vger.kernel.org>; Thu,  4 Sep 2025 09:13:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250904091354epoutp02021679c57c9a45d530ea3d46e267ddbc~iCXxNH3Ak0610706107epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756977234;
	bh=tXT+xGg463hwxHQkaysDNXj3DgmwgfCfpZCPDlCDOkA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PY6KtGhRlxGmDpbtwOHdwsBtnAee65iHDPBNo8OP9IwKDtoubFDbc/B7e+PLYta/C
	 nzzO8EzKXMfHdMzxjZUkFSNZcOW5Ln+XRpDC4AdyblmK5aY4ls/83WfvDJTe2sg/Ha
	 JmSHBpekeoKCEuAtxSP1R2Yd5O5pPC9/xECZViu0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250904091353epcas5p1583257065573710b90d66d7dfa6604f9~iCXwt45ny2104021040epcas5p1h;
	Thu,  4 Sep 2025 09:13:53 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cHYgh4ZL4z6B9mB; Thu,  4 Sep
	2025 09:13:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904091351epcas5p12b672a06d35140266c02c2038c580f7c~iCXu3-r_91514515145epcas5p1w;
	Thu,  4 Sep 2025 09:13:51 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904091349epsmtip274097b068a5ef332a9676265ad6c52ec~iCXtVRBrG1708017080epsmtip2D;
	Thu,  4 Sep 2025 09:13:49 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Henrik Grimler'" <henrik@grimler.se>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250903192046.GA4126@l14.localdomain>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Thu, 4 Sep 2025 14:43:48 +0530
Message-ID: <000001dc1d7c$3ac93f90$b05bbeb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1ICS4saWrHBuvVQ
Content-Language: en-in
X-CMS-MailID: 20250904091351epcas5p12b672a06d35140266c02c2038c580f7c
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>
	<20250903192046.GA4126@l14.localdomain>


Hi,


> -----Original Message-----
> From: Henrik Grimler <henrik=40grimler.se>
> Sent: 04 September 2025 00:51
> To: Devang Tailor <dev.tailor=40samsung.com>
> Cc: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D rtc: s3c: support for exynosautov9 on-chi=
p RTC
>=20
> Hi Devang,
>=20
> On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> > The on-chip RTC of this SoC is almost similar to the previous versions
> > of SoC. Hence re-use the existing driver with platform specific change
> > to enable RTC.
>=20
> Could you please describe what the differences are to previous SoCs?
> You write almost similar, please elaborate in what way in commit message.

Ok. I will add in V3.

>=20
> > This has been tested with 'hwclock' & 'date' utilities
> >
> > Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> > ---
> >
> >  drivers/rtc/rtc-s3c.c =7C 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c index
> > 5dd575865adf..8db24b6360b8 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > =40=40 -384,6 +384,15 =40=40 static void s3c6410_rtc_disable(struct s3c=
_rtc
> *info)
> >  	writew(con, info->base + S3C2410_RTCCON);  =7D
> >
> > +static void exynosautov9_rtc_disable(struct s3c_rtc *info) =7B
> > +	unsigned int con;
> > +
> > +	con =3D readb(info->base + S3C2410_RTCCON);
> > +	con &=3D =7ES3C2410_RTCCON_RTCEN;
> > +	writeb(con, info->base + S3C2410_RTCCON); =7D
>=20
> Rather than adding a new rtc_disable variant I think this could be handle=
d
in
> existing s3c24xx_rtc_disable (and I think that is what Krzysztof meant).
How
> about adding a new bool to rtc_data that describes if S3C2410_TICNT reg i=
s
> supported or not, and checking it in s3c24xx_rtc_disable?

Ok. I will add bool 'use_s3c2410_ticnt=B4=20to=20differentiate=20if=20any=
=20variant=20uses=0D=0ATICNT=20or=20not,=20making=20it=0D=0A'true'=20for=20=
existing=20RTC=20variants=20which=20are=20using=20s3c24xx_rtc_disable().=0D=
=0A=0D=0A>=20=0D=0A>=20Best=20regards,=0D=0A>=20Henrik=20Grimler=0D=0A>=20=
=0D=0A>=20>=20=20static=20void=20s3c_rtc_remove(struct=20platform_device=20=
*pdev)=20=20=7B=0D=0A>=20>=20=20=09struct=20s3c_rtc=20*info=20=3D=20platfor=
m_get_drvdata(pdev);=20=40=40=20-574,6=20+583,12=0D=0A>=20>=20=40=40=20stat=
ic=20struct=20s3c_rtc_data=20const=20s3c6410_rtc_data=20=3D=20=7B=0D=0A>=20=
>=20=20=09.disable=09=09=3D=20s3c6410_rtc_disable,=0D=0A>=20>=20=20=7D;=0D=
=0A>=20>=0D=0A>=20>=20+static=20const=20struct=20s3c_rtc_data=20exynosautov=
9_rtc_data=20=3D=20=7B=0D=0A>=20>=20+=09.irq_handler=09=09=3D=20s3c6410_rtc=
_irq,=0D=0A>=20>=20+=09.enable=09=09=09=3D=20s3c24xx_rtc_enable,=0D=0A>=20>=
=20+=09.disable=09=09=3D=20exynosautov9_rtc_disable,=0D=0A>=20>=20+=7D;=0D=
=0A>=20>=20+=0D=0A>=20>=20=20static=20const=20__maybe_unused=20struct=20of_=
device_id=20s3c_rtc_dt_match=5B=5D=20=3D=20=7B=0D=0A>=20>=20=20=09=7B=0D=0A=
>=20>=20=20=09=09.compatible=20=3D=20=22samsung,s3c2410-rtc=22,=20=40=40=20=
-590,6=20+605,9=20=40=40=0D=0A>=20static=0D=0A>=20>=20const=20__maybe_unuse=
d=20struct=20of_device_id=20s3c_rtc_dt_match=5B=5D=20=3D=20=7B=0D=0A>=20>=
=20=20=09=7D,=20=7B=0D=0A>=20>=20=20=09=09.compatible=20=3D=20=22samsung,ex=
ynos3250-rtc=22,=0D=0A>=20>=20=20=09=09.data=20=3D=20&s3c6410_rtc_data,=0D=
=0A>=20>=20+=09=7D,=20=7B=0D=0A>=20>=20+=09=09.compatible=20=3D=20=22samsun=
g,exynosautov9-rtc=22,=0D=0A>=20>=20+=09=09.data=20=3D=20&exynosautov9_rtc_=
data,=0D=0A>=20>=20=20=09=7D,=0D=0A>=20>=20=20=09=7B=20/*=20sentinel=20*/=
=20=7D,=0D=0A>=20>=20=20=7D;=0D=0A>=20>=20--=0D=0A>=20>=202.34.1=0D=0A>=20>=
=0D=0A>=20>=0D=0A=0D=0A

