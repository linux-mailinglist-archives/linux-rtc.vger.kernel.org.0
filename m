Return-Path: <linux-rtc+bounces-1656-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4A943377
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 17:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 965D8B20DAB
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 15:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FCA1B581F;
	Wed, 31 Jul 2024 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NovKfmY8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3225A10B;
	Wed, 31 Jul 2024 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440243; cv=fail; b=rjaTETDqfxAr8QciuDubmOqhFlRH4yqI2ZbEnG5CiUsiljPkinGPON1H8PKB4SQVEF7PYKGEeXn29zi+kMeIIDXAmIxWP2XGeMOYDWvY/GxcSAe5cD6du1yzFWzkT6Lbk5OkKclsTSW7fsd9TzTFpl+wPyyEOGXcCv2Nfzke1tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440243; c=relaxed/simple;
	bh=hMoosdob91Dl/P6dawpanIRqxgNCLinGpklHkw5PiJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gk5UZj57cEOtKxHtah77IfupLirUXmQ+bDDjFe+lyV6jc1ljzeLp8fZcvfJTcaPVF5MbnY/CXMtNxtspD/oUHvNoL8YKnHJi4MWqetH3LCRz8nANZwerfC14YzK5Wov/KwGTiiuJ/Roh7iTdBGCEefbVuWCoFPMgjT9Zawzpm7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NovKfmY8; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZeekiQwdp9CTgh/xZDmKv6yuWBvEDhr+RA/wz7lFniq4c4KuiK3mRNH/FuWLzInyQzoPYCjR0TM5uhkS0hEwO6+xc6GORFQgDr0Gbsy2EvI/DsHY0Rzelmqi5nrWw53vtsnbI1PE9ZSinNtUMf8I+/k8LxwAkfEMufWPBWe/dJ8QI8XCcc2A9alI1vks41sQPzCRvx9I2+UvO9VVY4Sb8q1RlrCzIcsovSzhnftnaLT2KtZIYLF14fwgEji8nik6LQ6i+MTkBT+a391Ovxt5YULkT/nJRoqT/ZL5Lxp6XX8qUt/ZGBpwGIqr9LxKEB/jF3yxAea5IKEH414GADO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJVX+nXJVD8k4FTSleIw70rRTy2b5NtlFIb3Qu3o5xE=;
 b=Ibdhog2Cmcape0k1/n0hWvZlfl6w50mTZqFSmC3b+gVl/WKW7idj9o67jYx0Z4TCc9FIhF5YmuII1dO29KQB1shUeyeXEX2T4mMzEtmZBJ8yQhNvuT1RzgJ4yiZtLqot8Qm6XKAFu+eUblaji4sfqfWA9V86ef2rJNldk/70MqNcYFqlR8YuIWpz81EhIoiWl2iHZskUO4BgaM9/OLlx96ORw2/eXwPKmXZ1RQZIDTk++VUjDoO0JMc0ITm+1Y/nizZoqngyFQY4tcnLZXFXQPHUjDg+WMVDi7vaFKr4w1Rv59c/C/u5miBTtKjUjnBrQOCMU8a+o3WlAU+/lI09UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJVX+nXJVD8k4FTSleIw70rRTy2b5NtlFIb3Qu3o5xE=;
 b=NovKfmY8ezuk4pBtjBS2oBFzNiPiY91GTaojw/qRieQsOWTYTe4l9pkQLA2UizVAc4GQKRmbdkmUyNb9giUpmh2XNmeiVP+2Noj7oxdBqg6gxJOY/k6HBscAJtPA//WtFiZo4lERwI5Ad6Np3lAu1Gqgr3LboDa++89mgVMTY9Fhi24SnNCYBe5VW/udarJIx5J8yJr6OmwHsGkIfS25Q3rcbxuAGmlkVhGscEyKF7ONS4K4ziFXr5SpTG0O9F71RUe79gLtI0GDJXOnzfqgidktnldUaZHoF7j/371nT/Z9FfI9/LK9TmPqZkM7GynrsUpVhqyYqrwl+Ey7A3CBJA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 15:37:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 15:37:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Topic: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Index: AQHa40fZMc1qZndYQk+4NNhqZFIIlLIQ3I8AgAAZs4A=
Date: Wed, 31 Jul 2024 15:37:18 +0000
Message-ID:
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
In-Reply-To: <ZqpCwOhXiLzxK43-@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8420:EE_
x-ms-office365-filtering-correlation-id: 6b301b3f-b9f2-4b97-52f4-08dcb176a911
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vfRjGqnXjQYbwPSwbCxcqoKWy/51RlpsPpKCvgOTRG+fmRuQ/HbB9AKDB9Xd?=
 =?us-ascii?Q?KFQRolIf3MF7I90a7Gs/PNZw9KHxLuFN0TsMtrn/L9y+nUVQFOJs/34yKTGE?=
 =?us-ascii?Q?dIk3R1F7ug0QdWIOVhf8psU1HQVK5yKp7yK37CnNskar2BTcaaDW8pmL9Pp3?=
 =?us-ascii?Q?D1Kk3O3Rf9yDSWt9/jI8DH02sKCek0q1ye3uEhPoQkjxefccI50eGCqXOYkt?=
 =?us-ascii?Q?Uw/CGIPqB86mcjNfaRX3HAF4c5x0OR7EM4E5wb/fJvbMVT1jfayCKThqZtrj?=
 =?us-ascii?Q?sWEog3MGodkEzoqB6/BO0o1E1gGlHtVaKvK7GhqxzgnLUzlP30q+4wiCxq42?=
 =?us-ascii?Q?WXKqrMCkxvWPi5bZWtG48h/ko1pFbXhl39qwDqM6+puGVQCD+cC0cWLek9mG?=
 =?us-ascii?Q?16zcni4Tb706+Q7UhR9GOPZg9+gV4bIdR0zd2c6uPd9q+8XUCcJJlwn7Qsfj?=
 =?us-ascii?Q?G8Uu+ywlQvCxL9ssg79h5Zy0S00Hh5nQ3/fBUkiFOFp0flnmBVVZI3/C8WNH?=
 =?us-ascii?Q?Ofa0nPOvChOzU76BJjkst9c465STRM/DNXWtfJjq7228UW0VBXhP8Ywgn3ey?=
 =?us-ascii?Q?C1RirZf5JstuJb6i60oqckgKlt0LoVX2KwAThbK2/0APEpg1V6lqQ8HTEzgf?=
 =?us-ascii?Q?MiftRpbjw3JliDyx6CkDXHA44vfWnT5Y+EkWhnOOLmX2umOOinGBPWl6yasM?=
 =?us-ascii?Q?rIMeekgA24GKfadne04wDyGYm4+3PAcsWBiwy/zTXG+WmC3k4AAUV72tHh2T?=
 =?us-ascii?Q?FWyQc3RlPv0nZ140S1eNMPUe7HK1jtcHvyfYbp8t8VMvnu+UVPl6BOLLpKV9?=
 =?us-ascii?Q?OYiluSsKHNrj+j32mbWIEmqnYBCPrSxY+fFYCZ+qkIwgOVdKgP4H9/7zwPtb?=
 =?us-ascii?Q?SQtZ8UuoOjJWTr2EblB5K5l6md857TMUkTm3Kyv2Om17NdCqmOt6XOc8Av1n?=
 =?us-ascii?Q?9H4Lca3Jp2/11Xr7dZ7XVsH42FAGeHNVuKzbq37E0AUSt949/h1aXwgo0/qU?=
 =?us-ascii?Q?dAjD7Tidw2sP/H9vGlsERfEfSl0KF87hroaOd+aL4WYxPoRjdKCsLJgrGvOk?=
 =?us-ascii?Q?9cuEDf1o7119rkM/T7BmNQ3xttTqLRUcDViCfPYr5vx9ME5nfyCsrjyHfh10?=
 =?us-ascii?Q?GAlFDIrs0en/JnatPkvPtITm2iNeOHhWZtbP0yvL2WpL+xpY7DvIHlc2nLUB?=
 =?us-ascii?Q?QRCGbnBnomEEVaqPGTsuZzYASq3pOVbTKod4tfkbhOfop+wPoWALihc/EA6I?=
 =?us-ascii?Q?0zfJ0b0v1VO074lYGBWqZGp9BYDVMtRYO1HxKfGIy1CFtyOB1tRqZj5iowUh?=
 =?us-ascii?Q?grQa7/TmqUulGGDCmIHMxVf1Nv6fnWadwjPp17a/kbONIQX0bBE//Qt5JRC2?=
 =?us-ascii?Q?+AedsqOfwX+qPGNBjdEz1CEpeph8FgX+ZPVW7zyqeKaSsce+Kg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Zd3xTAKJitPmNP2QwRCjCfopYrMio1ITYXzN5LiwbsxrwfwPLzMG2W5Y2nm/?=
 =?us-ascii?Q?/ihTR2a+8lXb4hLIZaMzVscae522BpNtEZZh5UixKoFuPxrh4yWb0ywpqik6?=
 =?us-ascii?Q?BRWiBhLOKNB4DKStCg3R72Qqod+NOvFWy5M/Oftgh4saaKocqkV/F85Wyy+2?=
 =?us-ascii?Q?XAIwp7KECqGgTwPD5/kxw0pFupNnA81a4FP8Qa5NrV/DVJc/peGCST49gKnM?=
 =?us-ascii?Q?dEkZrK6glkKbMZLzwTfp4bV6X9PxjAUrVraeMyUteJ8pQv9r0/OGioO5Cs1B?=
 =?us-ascii?Q?9O2zUoj4Bpf/ppxtRAxRor8q8FVXrvLiTMXRrsLhXa1Gw1qLlWbWSOR8MGeZ?=
 =?us-ascii?Q?dgIISD25exz4FMb/YYPX1SF0HXv1pAF2xromgQz7vIieKdhv/bF8nqPN2ZjI?=
 =?us-ascii?Q?d/3kf3KrHNfH78IaGmQ5s73UDgBKcpp2a/UA2hZdscYsllet44C1ffsv8MO8?=
 =?us-ascii?Q?4a+NIYFcMsXxj1LCMrWIGhoz6+Clv0crwwC3gOJaPvoGfzv0Orp6rzSnyJEW?=
 =?us-ascii?Q?C587md3xDrsRRgH7z3j0E4lLx5RykD+8I4xAPpA9ObVpj/Pjz7ZjVfDXMdGC?=
 =?us-ascii?Q?MKQi3y3aaqDpUfT7MWDDrqXSNeAg0vINmPHOHUuy58z23jImMQZyQ8X4vzOu?=
 =?us-ascii?Q?s+iynkuiTD/ez3HHa+SvlKyWjMFja8coS1e0h7+WCygzpxw76Ih5MosuqnvH?=
 =?us-ascii?Q?WreW1L0n9FZxUCrK/zO+e6TR8OE1p49K8sij+UDIOL/9I7ug/70G1mzzSmyF?=
 =?us-ascii?Q?1Pf/g3oXjLQD/unK7VSn5mYzB7r4QEYo8rRsrN7RnrMvUHTZs8ku7HW2DmeV?=
 =?us-ascii?Q?rfN87xzmV7y/YgDZuvBdNN+rg22nTNVJwhW9ILUAxjQpCpUOFb3EeQZvqXMW?=
 =?us-ascii?Q?i7t70znYgty8uJZmlUBXKBGyFWSVtbtH2CZPEu3Otur/j/ngKzNvyAZqLnUI?=
 =?us-ascii?Q?4C0VIwvCIpFZx/bKZBB3Epq8b+UtgLgBJMc88/k2uLOuxi6WZbcm/SI0VLC9?=
 =?us-ascii?Q?SSJta46X7Swo5UwEcFc84MSXYx1kS0JYRq3uo/2RnuutIls24Fzz7hDX4Nsn?=
 =?us-ascii?Q?Id9Wdpw0ZPLVaj2NJq+Ra9acsDagnRGkwGXP4OIQy6wSQ07tiGW2s+KzKBzL?=
 =?us-ascii?Q?eFZpQb8ice7OzaexyyUyeMU8qy5mkWgCE1L+uG+j/m3rt1JQIJHSyw2g+e9X?=
 =?us-ascii?Q?JPNvkmZUX2Vf8MciNE/sAhDYyKqom1nLm8PUIu0FR3MEFlgN1Gpw6br3qnvV?=
 =?us-ascii?Q?/xWfSbXTcmRUhTjXW/pDh4meFkmABHJezXUxQm2tqpa+FThUZhybu3bG6NmB?=
 =?us-ascii?Q?IX7dv/28aNNmeOkffqI8JkC+bIXR47ataWfoWERtpZ+nSVCTPAOCHdn3a54E?=
 =?us-ascii?Q?9piBdpL4z4sDCSPYxnoqJpzWmbHcNMXfAnkEWb9kuR2nQmiq8v3Nuus0R0hx?=
 =?us-ascii?Q?pCDhfcagM3KZ1i8kN8nQmmCBW+S8q33F9rStEE+tvTBn4Wo7b6yCbUMEXBSZ?=
 =?us-ascii?Q?EP7lTcQK/svGz6VLgW9PHVBAk8H4H+P4+9E1dSqnSxdI7Ft/IjpYq0KVs9iO?=
 =?us-ascii?Q?mv7lDlBoN2fgH3rVQ9M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b301b3f-b9f2-4b97-52f4-08dcb176a911
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 15:37:18.0304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFgTBh4j3w/mXsCzhzDDStwYBYJvUhuYP+lLXDBlNE8ab/LANKb2wCMoUDYklnHZ+bE3eTVVtxSt2B3Q+26F4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420

Hi Cristian,

> Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> module
>=20
> On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The BBM module provides BUTTON feature. To i.MX95, this module is
> > managed by System Manager and exported using System
> Management Control
> > Interface(SCMI). Linux could use i.MX SCMI BBM Extension protocol
> to
> > use BUTTON feature.
> >
> > This driver is to use SCMI interface to enable pwrkey.
> >
> > +}
> > +
> > +static void scmi_imx_bbm_key_remove(struct scmi_device *sdev) {
> > +	struct device *dev =3D &sdev->dev;
> > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > +
> > +	device_init_wakeup(dev, false);
> > +
> > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > +}
> > +
>=20
> ..so in v6 I asked you to add a cancel_delayed_work_sync() on the
> removal path, BUT I missed, my bad, that indeed above there was
> already a call to cancel_delayed_work_sync() associated to a
> devm_add_action_or_reset....so now we have 2....also you should try
> not to mix devm_add_action_or_reset and plain .remove methods..use
> one or the other.

Thanks for your detailed reviewing on this. I will wait to see if Sudeep
has any comments to patch 1-4. If no comments, I will not do a new
version to this patchset.

If v7 patch 1-4 are good for Sudeep to pick up, I will separate this patch
out as a standalone one for input subsystem maintainer.

Thanks,
Peng.

>=20
> Thanks,
> Cristian

