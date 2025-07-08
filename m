Return-Path: <linux-rtc+bounces-4442-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9CAFC279
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jul 2025 08:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E64FD17AA7C
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jul 2025 06:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E45121FF2D;
	Tue,  8 Jul 2025 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rlY6YBG1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2712D1FF60A
	for <linux-rtc@vger.kernel.org>; Tue,  8 Jul 2025 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954905; cv=none; b=J63hu/IcRgFUMv+IQN0hZYp2ShoduuEtLDTyWdRwm2gwZxSvbw5ETCBXffL5eKvdqHOHALjmzYKG06YEs6xg284e7WcGPGkyDaoD8nqUyuXOkwAkm4zCRDpUcFb+glntDX6u9IZ4mWpqo7msCUr+hGQpy4f0jojXIG1DvUhIhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954905; c=relaxed/simple;
	bh=qh0LQGKnMRK4CzGRNhr6t4MVK5FA4WdHxOenKD3FU+s=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Yq/HF86VrZAutJYEBUpRKBGn7VHk0MKxrHijM3cCmSBzmSm15j9XHYJpl57O+IX7T/XkRexk3Flns3ChAQXyNlrFCaqp1qRnvO5d/JxEltzDAoQ9MneUQNPXWPDZerVLOIx0eJ0O7ewv0fj0XUiCDSk8t8rjspAvozvM+Bm0GrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rlY6YBG1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250708060822epoutp025cc0be12b92ff5743d6faba150181d9b~QMbOEVMRy2212522125epoutp02k
	for <linux-rtc@vger.kernel.org>; Tue,  8 Jul 2025 06:08:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250708060822epoutp025cc0be12b92ff5743d6faba150181d9b~QMbOEVMRy2212522125epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751954902;
	bh=CWjK5YY/+oGGvbV4dhbaNLNw3/sTYEhT3dkxtPh3BIg=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=rlY6YBG1wplQLj25miS/iECwY8pdFRdjNArjkgifIeQpP1lHSunZb72iC48VKNPq8
	 DAlXEHuNDXJzoLG8/ApjwGsjc97znkoR++flezclJErdEV4tO4n0tFvsAeBaGc+s6g
	 pcSUBtz67sNJc7OZkfMZLFCAUlQD0TPwOm0eWBCs=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250708060821epcas5p1b132e8764cc5fe624961f8dee63f32f7~QMbNlkntH0730507305epcas5p1w;
	Tue,  8 Jul 2025 06:08:21 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.182]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bbrJN1qPSz2SSKr; Tue,  8 Jul
	2025 06:08:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250708050327epcas5p3fe6bf00544af5113930cb1fe0378823a~QLiikwolj0276902769epcas5p3e;
	Tue,  8 Jul 2025 05:03:27 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250708050325epsmtip267559c66a281bbfb08c77301e139e7c5~QLihDHsRT1722717227epsmtip2o;
	Tue,  8 Jul 2025 05:03:25 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <inux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <3c794a74-30d6-4a16-8bdb-4345b3b5e453@kernel.org>
Subject: RE: [PATCH 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Tue, 8 Jul 2025 10:33:24 +0530
Message-ID: <156b01dbefc5$a3a29aa0$eae7cfe0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhFGtl4NDuGuGnv9eMR4cSGFTkLQJ+nj8RASbVNToBv3LqZbPyOoLA
Content-Language: en-in
X-CMS-MailID: 20250708050327epcas5p3fe6bf00544af5113930cb1fe0378823a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9
References: <20250702052426.2404256-1-dev.tailor@samsung.com>
	<CGME20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9@epcas5p3.samsung.com>
	<20250702052426.2404256-3-dev.tailor@samsung.com>
	<3c794a74-30d6-4a16-8bdb-4345b3b5e453@kernel.org>

Hi Krzysztof,


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 07 July 2025 14:54
> To: Devang Tailor <dev.tailor=40samsung.com>;
> alexandre.belloni=40bootlin.com; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; linux-rtc=40vger.kernel=
.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; inux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> faraz.ata=40samsung.com
> Subject: Re: =5BPATCH 2/3=5D rtc: s3c: support for exynosautov9 on-chip R=
TC
>=20
> On 02/07/2025 07:24, Devang Tailor wrote:
> > The on-chip RTC of this SoC is almost similar to the previous versions
> > of SoC. Hence re-use the existing driver with platform specific change
> > to enable RTC.
> >
> > This has been tested with 'hwclock' & 'date' utilities
> >
> > Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> > ---
> >  drivers/rtc/rtc-s3c.c =7C 26 ++++++++++++++++++++++++++
> > drivers/rtc/rtc-s3c.h =7C  4 ++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c index
> > 5dd575865adf..00686aa805f2 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > =40=40 -384,6 +384,23 =40=40 static void s3c6410_rtc_disable(struct s3c=
_rtc
> *info)
> >  	writew(con, info->base + S3C2410_RTCCON);  =7D
> >
> > +static void exynosautov9_rtc_disable(struct s3c_rtc *info) =7B
> > +	unsigned int con;
> > +
> > +	con =3D readb(info->base + S3C2410_RTCCON);
> > +	con &=3D =7ES3C2410_RTCCON_RTCEN;
> > +	writeb(con, info->base + S3C2410_RTCCON);
> > +
> > +	con =3D readb(info->base + EXYNOSAUTOV9_TICCON0);
> > +	con &=3D =7EEXYNOSAUTOV9_TICCON_TICEN;
> > +	writeb(con, info->base + EXYNOSAUTOV9_TICCON0);
> > +
> > +	con =3D readb(info->base + EXYNOSAUTOV9_TICCON1);
> > +	con &=3D =7EEXYNOSAUTOV9_TICCON_TICEN;
> > +	writeb(con, info->base + EXYNOSAUTOV9_TICCON1);
>=20
> You clear these bits during disable, but why aren't they set during enabl=
e?
> Why is this asymmetric? This should be clearly explained, but both commit
> msg and code is completely silent.

OK. I will correct in V2 patch

>=20
> > +=7D
> > +
> >  static void s3c_rtc_remove(struct platform_device *pdev)  =7B
> >  	struct s3c_rtc *info =3D platform_get_drvdata(pdev); =40=40 -574,6 +5=
91,12
> > =40=40 static struct s3c_rtc_data const s3c6410_rtc_data =3D =7B
> >  	.disable		=3D s3c6410_rtc_disable,
> >  =7D;
> >
> > +static struct s3c_rtc_data const exynosautov9_rtc_data =3D =7B
>=20
> Please put const after static.

I tried to keep it similar to the existing format, I will correct it in V2 =
patch.

>=20
>=20
>=20
> Best regards,
> Krzysztof


