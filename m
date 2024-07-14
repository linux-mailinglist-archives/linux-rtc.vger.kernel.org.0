Return-Path: <linux-rtc+bounces-1494-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 800489308FC
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 10:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C54281DE8
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 08:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB57B1BDCD;
	Sun, 14 Jul 2024 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QzVXB+Sv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E514AB2;
	Sun, 14 Jul 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720945386; cv=fail; b=FzwZf1LLzrloxUCKJvzSbpEGKY3gjZpVY+QZVCVaXD4uyZT1R25Gn6TSI54lX1CEEpmXoepCuWLzRaE7wLxTkCfm/o8s4NnYeIwsWskEF0tb0L2JcGCmCPV/jmvCrbEqle8aMrhpTRU/alsCDxa4QMZp+mJrMACbsyw4h2w79WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720945386; c=relaxed/simple;
	bh=TfMmuiuXsbW6uTbCnqd/1GacvgQDrgsa25IyLvP0+N4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bEKtLgpw0/ID1Y9HlDIYBY2bf5vtQ9lJV+LCh8y0zLdZ+E4pGsgvfk5u4c0aMbi8s6MbO2z6Hrs1OB/TsnhMIBqMJ5WhNPe/hqzweeJaEMu67swITUL/Ecb2uEKgo9ztih4GPjP1hZMZuzAV381zlu/4+QRiKR6Bh9pZ+PXBnVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=QzVXB+Sv; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dpn0ZMh4ghL9zWLN/cM/Eem9DDgT4vQ9sUHv4cf5v4kevX71rO6Fs6MVHU9aIsSd9WFmyIr4TauApgkQEYJ25CvJWET1OkJGta2ZuspK10z3BWPRerCuPEfxa8ETQ2Fw7QxCYj7hjSNqpteeAnhVey2N27e+w1PH6s6QDw7C56DcUwC0RTq0O2Ps1HFEd8CtBP2KEkCfAEKj/bO0EQ8w9vHyIgqBrcp99a3yggeRU9bapUKZNH9zvoaiguAYhPIw5MHoa50U+rKw28h+wyHZX9ZUkRLNp/u3F6lFQ95hwC1AT/x24AZsp50zpbJPlpmiwcxTQ0dKnqAGp7FYQZ/kQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv4a09498Xu0QrLCq8rZJZdheGGSYMoLw6N6Ze9OFI0=;
 b=frsEqbxOPnBuyUohlaDysybUBgCw/oS63YS67/pTA4rEJeXbe0k11GedDWZh79OnXyvilcSjA3C7e1hd7iuX/y13FVwTkKeOWPq9oRLt2yzLt90F+ae86mS7lgBmKTQSlhvBHd4YUxo1nMdVfOCNyezby2oSAieYwkEJwK5twMNo5xvfsuBuRG/4BQmyWFAi51AjGiXx0E+Cy8OuIjudVHbEhORdM+SpPbvkGZNfxkhA0pii+e0dHflVheXOdqxZoMNu87g90OXZcpJZ/z8MBVZbktGXhHxsUf98tMVMKNZhKb+dKs2l5+kLKnz6NSCnoD2NsuhwByeWPmx7CCZKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv4a09498Xu0QrLCq8rZJZdheGGSYMoLw6N6Ze9OFI0=;
 b=QzVXB+Sv639G701nskNmJ7JbzATO7AyVwnk1CHtlIOvsuqDVnw88Gob4ZeMG9d1CazX2aP6cxJOgfRiniCcBKhIg9P2lBYmmad0zMwzx3BfVcrB/Z34GU5xaTAVvXPljikngPNPXXS4vQEfuuCCwcF8jhAnEjo323LX6oOBwLSI=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7544.eurprd04.prod.outlook.com (2603:10a6:20b:23f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Sun, 14 Jul
 2024 08:22:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Sun, 14 Jul 2024
 08:22:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
Thread-Topic: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
Thread-Index: AQHaw6ge58HQEpAf9E+7KDL38YKrDrHyG+aAgAPmEjA=
Date: Sun, 14 Jul 2024 08:22:59 +0000
Message-ID:
 <PAXPR04MB8459B4870DB4CBC47BEE511688A02@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-6-b85a6bf778cb@nxp.com>
 <202407112033378dbbea83@mail.local>
In-Reply-To: <202407112033378dbbea83@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7544:EE_
x-ms-office365-filtering-correlation-id: 82c988d5-64b6-4f71-eac7-08dca3de2bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5YJeP7eAZbK+pnC53pjQ8Ny5qNjSEur4/GGyxGOw8KPe2JlGXgpNd0EWE7sF?=
 =?us-ascii?Q?wXvjKV8EKog7ImWLrJu9WBXP34dnJU8Fs3Fv9x2bf4lJMqs0V4SOoiuKqi9k?=
 =?us-ascii?Q?BsoGjOMlPW0FdjniRUtEAg3yjzeKMhxd5+Z7JyQhKYQik1ARRZ9+USAvsL3h?=
 =?us-ascii?Q?ayrgPMPtTDauphfBmW5zZHDBxgIEqHcAKCmGacQqv5OLwJPMvA5hTpKWghVv?=
 =?us-ascii?Q?BvmSxZ5NbM2Yb90Qnp3TA8LZN6C3F6DXMB+bo3bZMQSxTWH5lHa6BQIY05yQ?=
 =?us-ascii?Q?Xhhq/q6Pp9MidYCXF0l8DG9vqt+xNQIbbVKs5m1pecK80FR+CqfcQs4LM0mH?=
 =?us-ascii?Q?umZ5l4+kTe9fWZVLBKmFBFnTyYNXyu0LF1HeHbtO8vDdkGn2qFhDb6sPwAdV?=
 =?us-ascii?Q?nnGY8Mcy3PUxcKLpeLKRVN0IKPHOMtwFmhu2h01BYDq/bY6lDSveyx0eqhOt?=
 =?us-ascii?Q?BflDII0VO9cIxcXznfCdCG1h4xPJdA2csaRaiVt2f96huviQc2c+2kTXQdCn?=
 =?us-ascii?Q?oAmRhgEm0mhFxaw3gIyrWxPckllWF1Oj1vDoYB2ptOC0TgJ5pKojxxR6vwaJ?=
 =?us-ascii?Q?f5N18jeqRq8RRpnHjXaTSa/YYbkyp5dw8Ht+LRaLiM3zgjWodPfOWM8ximP2?=
 =?us-ascii?Q?/GgcWp+zd3dMyQAvHIp8FPB+LxlbWMwRLhiQ042RIxTpVOKOBEb3Og4xBI8x?=
 =?us-ascii?Q?j3KDlGw/7V5qDm+Ep/vODvGWGL2da0PkWLpOVaFRur1aMVf1s2718cUofzCD?=
 =?us-ascii?Q?zLa18smOaMWTXaAF5JR9q9dPrFgcu9m9BFralyNJrnEVFrmZPM6t11hVurtD?=
 =?us-ascii?Q?WfP1oxIrhYgpD5wG2NZP0rVoga89xNAjL30g/hiB0iOnZFT7SZ2tZGixAuyO?=
 =?us-ascii?Q?Lx3VsFgjb/eAcRxl6nwBcGzUaiL7rEcmVyG9DGPT3p5KMXqIvJfD+Kp+Qb4d?=
 =?us-ascii?Q?87haSss7RsR+SGWZ0UawzzJyRjMjtwo+unippU83PbE8cD8cdGe+E6SyrV6X?=
 =?us-ascii?Q?P9arhRxBr89mztP07UCJ0f0baZ54ZTlgnqRTxbUFA4fJw0mmcp1MJoVKsxZD?=
 =?us-ascii?Q?cnvg/YqpI/YKgbTzLCJ8VF6Vr54XCjeLrE/DVsceTq3oniywYRa3nI2Oo9DH?=
 =?us-ascii?Q?2hZyokUuHNBDbbUd5nlmIRio9epZ8qdIu7iQ+r1bKmiKQ6ZsSc4OkFDfJNry?=
 =?us-ascii?Q?pvxC/nrvrUQE0qFdOy+26dm1NBpe7CPBclXV0RayKq1RYAHuKwiQczkCoD4Y?=
 =?us-ascii?Q?BSk0zPhgEZz6/QiQuq2vfp85YJoYHIh+irvcnYV3hdJq7xIB9Dfl49KRPyLj?=
 =?us-ascii?Q?SJYgyEaSrCXF9VPqlUcPvzGdHyEGjK0KSDc6dVZ8hHPF831swqTEt9O4I0Y0?=
 =?us-ascii?Q?U+URJU4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Zat9BfPnuVf9+pll8zibivznITZ8DKBzXpblKhw+T0ltwMKgFLxZhwsp1AdK?=
 =?us-ascii?Q?+YA2XNazaZi8pkepoRuVs5GPhbZ+zzj6b8ZhPuBllpPV6Zmk78esoVJ0hscA?=
 =?us-ascii?Q?J1Q5PMjtAa3sFJbZ4xvl5/UkEHCue1gGu8MDfEdOz5j+xH6uXfBWfaHaKO+a?=
 =?us-ascii?Q?ZbPVfmkKV+joHvnUb6AVynKnctGMbNBdHqLLhVSMaKH7vJfwlsarOMLkt1PA?=
 =?us-ascii?Q?nuEa0PqoA8+RXiGIXw8zX0Ewt505B4LCqDOZIaprluycyESp7FvXrgOOUlMU?=
 =?us-ascii?Q?E2En/8EkvoXjhM+iK6xd2S9/0zHMS4P4oD8YiFFhxElQ74N9Fdfp41XV0II4?=
 =?us-ascii?Q?8waI93ZIrOFoYUkOd0fgYqXJAOnBEBUr6+YCgVfKBpVPGXike45Eq9mVxRtA?=
 =?us-ascii?Q?IE7VDEYWbROpfGBJ2vHH0MofXkpgZgvvmhLsn5nfMQHVXdwa31IUdxv/PRCv?=
 =?us-ascii?Q?cIJW+C4dG07fKfEIdZm1KYA/r/Vwnq5Y1abdpk0eklZcDGJwGrC/YRxQvSPR?=
 =?us-ascii?Q?Ivl3b5BpEal8bhbRS4L2UDBgeLd1x8ySuofi1CEozCS9od33c4IJHrfkjlur?=
 =?us-ascii?Q?in3lolGq/DS6qI+UBqZYJZetlECRHImR6DgkSzgpL2hZvIXrwF2hriHK9e01?=
 =?us-ascii?Q?AowYs7PyCdulwgWhG39KVGlDiBM4IT+rSubGWcPZMdus0PwJxdMajskY/q9p?=
 =?us-ascii?Q?DeobFtsDVpahh9bQVHUffOl565s6niljhD7WR4yTL57/7PpcalEIzweGutcl?=
 =?us-ascii?Q?WHsCKd0V0bSd7lWa7kzeSUzMVMA3kRaIV1WtrxNBTisLQq4HKjWo/9UxkO0w?=
 =?us-ascii?Q?x5lPqeS3B++CZ2pVdUYX4u3OXoT0Xe3NOUmlDEtL4WfUQQbRUDq0bkzUJXYN?=
 =?us-ascii?Q?DzM/TlT36ftRtiUCRmFPvYH8gy2YxCfJstFBok6T5PLMAyczCkMeRnBAcIDI?=
 =?us-ascii?Q?F4KBVHGA9i+Fkku0KQnn60TxtgCSXceOAOC72P233iFRugMTo0HmZwAACBvN?=
 =?us-ascii?Q?hJXdwRoZHhUnmNerGWkrEebERt8P4nEdDkdTP7hmzkpoaS8veucp5HdY0Qrk?=
 =?us-ascii?Q?RFQJdvze2JddWlP54Tu5F0UMYUJczo0rdz3jEh4scJgULLysK0uLPWUbMXNT?=
 =?us-ascii?Q?y0tE6r+dZQrFNQvWmkmAVmrLj2A3K8zmKVllZ7EYqn++uWkVKFG59Yx4GVMp?=
 =?us-ascii?Q?C5lLxJCCowYANOk1lNHBcfYz+BcjqbQ/rIrUchdfYTD+9fBw0SKJpspUCgmt?=
 =?us-ascii?Q?wK2ZunJ1IoyDiH8d3VxRNCxRX/jKGBfwUO2u4FCJOxn9dK8yF1zxHjHBfFIv?=
 =?us-ascii?Q?BiCLrV0Ws1+4T3XEa9paXKcBlumjbpAQllt1XDIhFdHQoTL37ZPmixytcb4l?=
 =?us-ascii?Q?Hd8NK5oQkvAhhqtf3Ay5mpZF9RSxLFTiCr9D8ejCgdTjlMg6ZCxvfI4VstRt?=
 =?us-ascii?Q?fsi3lR6cXBuB15DdLV4IkmVxXLqnmYsp07W53FPcm/c2MIKdYSWPwNsLFZso?=
 =?us-ascii?Q?d2kEPvMRcocfeXLzQjeR3cBeqzb1Ng6ohFdw2TlEhoH4TYxLmpM7QC1FC1Pg?=
 =?us-ascii?Q?VFUMBGbJVX4Vtkf3w9s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c988d5-64b6-4f71-eac7-08dca3de2bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 08:22:59.3099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZmEOHTNttnoRFlzHk0bSurFPldvISdLhVHF9+ZrdvhWNGnn/HlWx04/pjq1KYVH0X7pVLr8Zw+y1vgLKSsb/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7544

> Subject: Re: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
>=20
> Hello,
>=20
> On 21/06/2024 15:04:41+0800, Peng Fan (OSS) wrote:
> > +	ret =3D bbnsm->ops->rtc_time_get(ph, 0, &val);
> > +	if (ret) {
> > +		dev_err(dev, "%s: %d\n", __func__, ret);
>=20
> This is not super useful, you should drop the various dev_err or pr_err
> as there is no action the user can take to solve the erro apart from
> retrying.

Sure. I will remove the various dev_err or pr_err in v6.

>=20
> > +		return ret;
> > +	}
> > +
> > +	rtc_time64_to_tm(val, tm);
> > +
> > +	return 0;
> > +}
> > +
> > +static int scmi_imx_bbm_set_time(struct device *dev, struct
> rtc_time
> > +*tm) {
> > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > +	struct scmi_protocol_handle *ph =3D bbnsm->ph;
> > +	u64 val;
> > +	int ret;
> > +
> > +	val =3D rtc_tm_to_time64(tm);
> > +
> > +	ret =3D bbnsm->ops->rtc_time_set(ph, 0, val);
> > +	if (ret)
> > +		dev_err(dev, "%s: %d\n", __func__, ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int scmi_imx_bbm_alarm_irq_enable(struct device *dev,
> unsigned
> > +int enable) {
>=20
> How can userspace disable the alarm?

The SCMI notify has kernel level enable/disable
drivers/firmware/arm_scmi/notify.c

But indeed, userspace not able to disable the alarm.

I need use=20
if (!enable) return -EOPNOTSUPP;

>=20
> > +	return 0;
> > +}
> > +
> > +static int scmi_imx_bbm_set_alarm(struct device *dev, struct
> > +rtc_wkalrm *alrm) {
> > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > +	struct scmi_protocol_handle *ph =3D bbnsm->ph;
> > +	struct rtc_time *alrm_tm =3D &alrm->time;
> > +	u64 val;
> > +	int ret;
> > +
> > +	val =3D rtc_tm_to_time64(alrm_tm);
> > +
> > +	ret =3D bbnsm->ops->rtc_alarm_set(ph, 0, val);
> > +	if (ret)
> > +		dev_err(dev, "%s: %d\n", __func__, ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct rtc_class_ops smci_imx_bbm_rtc_ops =3D {
> > +	.read_time =3D scmi_imx_bbm_read_time,
> > +	.set_time =3D scmi_imx_bbm_set_time,
> > +	.set_alarm =3D scmi_imx_bbm_set_alarm,
> > +	.alarm_irq_enable =3D scmi_imx_bbm_alarm_irq_enable, };
> > +
> > +static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb,
> > +unsigned long event, void *data) {
> > +	struct scmi_imx_bbm *bbnsm =3D container_of(nb, struct
> scmi_imx_bbm, nb);
> > +	struct scmi_imx_bbm_notif_report *r =3D data;
> > +
> > +	if (r->is_rtc)
> > +		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF |
> RTC_IRQF);
> > +	else
> > +		pr_err("Unexpected bbm event: %s\n", __func__);
> > +
> > +	return 0;
> > +}
> > +
> > +static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev) {
> > +	const struct scmi_handle *handle =3D sdev->handle;
> > +	struct device *dev =3D &sdev->dev;
> > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	bbnsm->rtc_dev =3D devm_rtc_allocate_device(dev);
> > +	if (IS_ERR(bbnsm->rtc_dev))
> > +		return PTR_ERR(bbnsm->rtc_dev);
> > +
> > +	bbnsm->rtc_dev->ops =3D &smci_imx_bbm_rtc_ops;
> > +	bbnsm->rtc_dev->range_min =3D 0;
>=20
> range_min is set to 0 by default, this is not necessary
>=20
> > +	bbnsm->rtc_dev->range_max =3D U32_MAX;
> > +
> > +	ret =3D devm_rtc_register_device(bbnsm->rtc_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	bbnsm->nb.notifier_call =3D &scmi_imx_bbm_rtc_notifier;
> > +	return handle->notify_ops->devm_event_notifier_register(sdev,
> SCMI_PROTOCOL_IMX_BBM,
> > +
> 	SCMI_EVENT_IMX_BBM_RTC,
> > +
> 	NULL, &bbnsm->nb);
>=20
> Note that failing after devm_rtc_register_device opens the driver to a
> race condition as the character device will exist at that time.

Could you please share more info on this?

Won't the devm_rtc_register_device could automatically remove
the rtc is notifier register fails?

Thanks,
Peng.

>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and
> Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> bootlin.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C91ef3c1
> 72dc04c6ed2b908dca1e8befb%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638563268206282814%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> CI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dx8j754poti%2Bo07tbvO3p7XM
> QB5jrbkBPWKORIKZdE%2BU%3D&reserved=3D0

