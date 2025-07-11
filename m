Return-Path: <linux-rtc+bounces-4488-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179DB018E5
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 11:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C54E3ADC89
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 09:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E7127E1D5;
	Fri, 11 Jul 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HwcmosRg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34521CA1F
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227829; cv=none; b=NEYcAk43BjFllXYbfknjfUIMuHM7+h7mlJWV5fYEWBwvvpI5dp+FrLbG/tbQ2xjoD6LV28e9Kun9ofJqqLFkP8SXjmsn4pz1ryMrkW/Dnk+qWWLvRMlUHOQmVrJiW1+vy6jSJ+7v+E4bUNd5R5J/PTSuy38NjZICFRBCv/lqQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227829; c=relaxed/simple;
	bh=/jz62YG9XUYKioVMwcvC8pt1XPpu81We8MhowTWgq3g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Sojne+Z1sZIFWrvSXU3wJDw3zdSxq+1oihrA+96OUiDWTML2a3m2V3v9q37QXO71HCRxlqrbeb7k1mx+5avVI9fH9lcH5kBc+rGTdpyLGQUPhZA0Y5ScG7DXKwYQA+vcoYnzA/Mmbx+SJ7UVwnYIgM/w7eD3CPhOp9jlatpY/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HwcmosRg; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250711095659epoutp02369ebbe11abbc88320fc332cfd449904~RKesFWt9k2052020520epoutp02Z
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 09:56:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250711095659epoutp02369ebbe11abbc88320fc332cfd449904~RKesFWt9k2052020520epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752227819;
	bh=+5zHegncV70kjbqyw48Y9OdFtKw1OBm4PBQI79nv4ew=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HwcmosRgLUGbih8+toJsjXN/4B4BZaTYNYtYADygEqPVaUrasnRy0U3HrAKqt7uOJ
	 BBWPO4IQmJIrToH4WZnvuT2h7jv4/75w+8CkeHzw5NzYSgRHdB0aibtd7nygnq7dkb
	 qW+gsoS3+4aGuUfUqBGoktci3qLLhlsYNp09Vu5U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711095658epcas5p33152e44e3698223878ac0bf294f1bf8b~RKerickMk0269002690epcas5p3Y;
	Fri, 11 Jul 2025 09:56:58 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdnDm74z2z3hhTJ; Fri, 11 Jul
	2025 09:56:56 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711095228epcas5p11af898a023698a922eb59ddbbffaa176~RKavvWm-70063600636epcas5p1p;
	Fri, 11 Jul 2025 09:52:28 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250711095226epsmtip153e539dffb1184623f3f9ac93d4bb0dd~RKauOa9jJ2985929859epsmtip1p;
	Fri, 11 Jul 2025 09:52:26 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Fri, 11 Jul 2025 15:22:25 +0530
Message-ID: <188001dbf249$831afd00$8950f700$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1ICPLNBmLFr0ApA
Content-Language: en-in
X-CMS-MailID: 20250711095228epcas5p11af898a023698a922eb59ddbbffaa176
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>
	<20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>


Hi Krzysztof,


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 11 July 2025 12:51
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
> On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> > The on-chip RTC of this SoC is almost similar to the previous versions
> > of SoC. Hence re-use the existing driver with platform specific change
> > to enable RTC.
> >
> > This has been tested with 'hwclock' & 'date' utilities
> >
> > Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> > ---
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
> Looks a lot like s3c24xx_rtc_disable()...
>=20
> Anyway, if you keep ignoring the review, no point to provide reviews here=
.
>=20

I have removed the redundant code I had added in V1 considering your review=
 comment for asymmetry code.
s3c24xx_rtc_disable() & s3c6410_rtc_disable() updates additional bit, which=
 is not valid for ExynosAutov9 (only RTCCON=5B4:0=5D are valid), hence I ad=
ded this and mentioned in V2 cover letter as well.
Please let me know if I am missing anything.

> Best regards,
> Krzysztof



