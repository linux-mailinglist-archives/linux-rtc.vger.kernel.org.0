Return-Path: <linux-rtc+bounces-1495-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E5930903
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 10:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52CDDB21188
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 08:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4061C290;
	Sun, 14 Jul 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L/1o+khs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A314AB2;
	Sun, 14 Jul 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720945601; cv=fail; b=bP2/D51P3E+KW3ghgXrviE2LuVAlAxdSIMmnEQVdJZJAdBl6V9Wg689Ln4Yik3R1BbQfo2DINhOzQndsH7iSI8CfjjpE6fxFkRCYGrW8laeLkdouoZS5NYjxqH9+lXSAAG3s2yzR3DEXQviFxMT7xmaZ8WDL3HfBZu6QENja5j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720945601; c=relaxed/simple;
	bh=vgnfPPPN4RXdYH/fo1+xY+DD+Kp+Tp2VPRUQJ4Sb60c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MnQw8UYc2pAydlWSKeorgumj2VV5Jg/FesL5Tslef8RrASU6UBmoQxSLQcuTmItdcSbtvNB5W2W5rKTTwmQdYWwUg5KQghWowVrpCqUTuBu4ANBOecBuxlPUqu9iQWHCT3eIkF/Fn6kPiNuxgpvoiFw6AkLBQccw2bkc/JoSqyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=L/1o+khs; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwHDoRZ9DQQn8V3X7YrAftrDPkW+DoNQL/lLdarvi3hfsVQVUYfaj2t26Z+VI95VV2QdIaWUC1ce734+0wMb9uyj2a43htG2fWkIf/Ql+lep0/8OumlJ/esAb+rd6y4Xl+3AKG1iuFJYNAxTLHmFGtSMepGVsY8IFxKTXYErQVVJVW+siVim+yJ1BOZdNrHEgDwRfQ/1HLntM/OaUUFeke8iwphXqDdBIUtuuinnkf2j7d56lTeu3eKyoqWMcOuU2SuGFuyOxVloGRZ411bJVM27zTdPTdyeVpUj5IVUzmGQ2OzZkMIWnUCT6DDcGPxST+Y8M/vCyLuH1Xr30Hfcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgnfPPPN4RXdYH/fo1+xY+DD+Kp+Tp2VPRUQJ4Sb60c=;
 b=RWYb4R0H056fDEOUz5xCceLlq2zdTPX94zXn3iaVybj6JEhD8aTiAx2eVlTbVZ9vJIxsq42XJhWoj8B7+17BHnCCkui9rM7hO8VJzvFjUWmHKWCuZcw9PY4+0OWXlvk2QceX1Cufl/Q2AuyBVp3zCkvRaAA8C8/pMdqovN03nN4rm7QZHlzajIHR/F03xzgkoJFD+e4TdE8sPljoXzth72TzMZbQO1LkD2Dw7VHUGU1EPXMq9l5LW7+OcFHOAqJmKo5Q9V4SNk5xnzBEx2jax3SkQo27KRkXj48te+lBTOpWugw8tzUBTNm4zZnLL0ql0/YzO7D27roIMN07mCdzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgnfPPPN4RXdYH/fo1+xY+DD+Kp+Tp2VPRUQJ4Sb60c=;
 b=L/1o+khswpMToKeDuAyK2+pqrldviGYWYQXeyoV8ooHW0tfxpgiR7VIpK5fm2HZhIS7fQ4HWglfV3uQ4gMpYSTpXcJ012a3tqNwUV0wcmq+xPA3uGDlcz2GXWcYNd7lnFg78d07gkPltJT0kQH/a1ZXcNRWf56z/mxwNUo4m2Gw=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7544.eurprd04.prod.outlook.com (2603:10a6:20b:23f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Sun, 14 Jul
 2024 08:26:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Sun, 14 Jul 2024
 08:26:36 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Cristian Marussi
	<cristian.marussi@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Topic: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Index: AQHaw6gE0llhlApAS0KAbF867738YLHxr4QAgABhgwCAA/XmcA==
Date: Sun, 14 Jul 2024 08:26:36 +0000
Message-ID:
 <PAXPR04MB84594DF408C27FF9D3CC29FB88A02@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <Zo_mtiEI_79F9wit@pluto> <20240711195442c18a3689@mail.local>
In-Reply-To: <20240711195442c18a3689@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7544:EE_
x-ms-office365-filtering-correlation-id: a0ec9f32-3fbc-4820-9ce6-08dca3dead86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?opiz5G8c7sJ0nXcz9lGb8DFseHKRZIfSt2dQDOEQQLbFNpQkpYokcbukeZ4S?=
 =?us-ascii?Q?Wz/51zOV1lr5wgsQRFh05ehOHnRgXWG6CMgLp6+cNGL5haw+D6TL193zxmNw?=
 =?us-ascii?Q?zAs2Lz9jfvsHnJo7M7TZj6qsZWE6V3QiybfxrlbVXuGNmsJw/wSazzCsTJO0?=
 =?us-ascii?Q?FH49fQLTEsdPV6b+On37LcWzeEFXzuU5IGNov8TTw2j4vKmbnuBsGO/SrzGS?=
 =?us-ascii?Q?UqcU73pCeHRbue9DodzijeHhhNXdMl55vB9tFOSYvZp0KGwSWZqMveKa/ezS?=
 =?us-ascii?Q?bTv/85okxYJ+mWnxLV4frMTLS9Up5HQrsycpkB09AhHhGKGmGX4XLZF8ygO6?=
 =?us-ascii?Q?fwvRH5zUIbmSsWjRQ1EeAAtqGWT2W22lKASv7OLSnsq1RNcgsklYzknhz426?=
 =?us-ascii?Q?jsKYJjVNB4EY+Aw2rWsZNOfgttY1U3UO+pceM9VZGhDK/4kGbovP3MTNrioE?=
 =?us-ascii?Q?I6XephPBV2wvj1SPN56U2IOA0+4rE3aW6sIEVFRWZREuhiLzAd7vA+eb6QU2?=
 =?us-ascii?Q?lSGzGZ6aUs5/nqQwJgOzKTkyLH21no8QyxEFCKH2zebQRjTo4dSW4dwVa4Yn?=
 =?us-ascii?Q?GbJ5sd+HFt8FTMwcU8Ex9G24xsWb16IDE/QJnE2lraBxlpffEm0LJfhU9mdK?=
 =?us-ascii?Q?x5AetADZ9vKN8VnOxr0TPmaEX+DAVjLlDQTVYN10b8PKU+pQDMWld4urh4Tq?=
 =?us-ascii?Q?QlQsvrpFhJGCXiGX8en9KXzcenXHwusTgjU/MkfigKhZYVBQQxEMLJdRzseb?=
 =?us-ascii?Q?i5/PDljwqzlZq//mXEZFYrXDd+wRXAq+RMJT99oo0zB0jgZqV4yhnRTtr7nP?=
 =?us-ascii?Q?xa9/3r34ZNUuC128Auc0vuV2HfkBQSiIS7qyZHD0+f5gP/wElp723ASNjum8?=
 =?us-ascii?Q?SV6nOEAbIXyhdRtwm46xTGkNtLYYoDhsY+vJ+R8S9guGa6q1Z0wyC7AGjas9?=
 =?us-ascii?Q?N06vlO4yCBqQ3nQlFKfoISPDPjTwuCfFGvwwKdyso+N9lA0mbPRtZRYEU8ZT?=
 =?us-ascii?Q?hjt1//vMOuAUR2DcyiCwfiypK88pKC/0nfavxUTMzuqiLcRhJ8pWENcNMyJ1?=
 =?us-ascii?Q?YPg1H65d68amwXyo+sTk+0sxC0bWUKNeKDR4mB60xn7fvhGZz0PeNHx5KlKT?=
 =?us-ascii?Q?rgI4QA252aTAVOVG3UncTUPwRX/Srf4GBQsF0MMb70Le/HD+FmSCcvkVLxd0?=
 =?us-ascii?Q?2gb92CM4VkPg5EfAnASk8Yg/D1KBTVRO5F+eY3Yg3Xe6Yta3Yh59OXzuHEKx?=
 =?us-ascii?Q?E5pTIKthc5Xy0ajdgNlTY01yVKstOBFXcLv2A+sET9NpcSmOgTSEMe0PlYCq?=
 =?us-ascii?Q?U3acu78kzduFhacA70KYsjOyF8dxPTgPHReYEBFmcpqzFT5YHQR/xYdh/41m?=
 =?us-ascii?Q?xLWtjqo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HitC4zDP+KH/dCVciDAgNzkDBtKUZ5+kciC8jya8Q3ZGXyic66myfJ358d9/?=
 =?us-ascii?Q?ohQX3+oXitAImYC4oHxpAzfsKRItazbdZ2/S0krr4sShEoift/JLj0LVDpCF?=
 =?us-ascii?Q?7lEpVG3GJP21C/o87hIxkTEunstJgU5QkrVsecFXsABjqYqugbef1lyvaGwB?=
 =?us-ascii?Q?gg8QnWtBg4F5hCtCveO38UqSpmucFXIuu2AheUkZbrEFVMR/1R8kX8ARhVz0?=
 =?us-ascii?Q?d+8sywElh1jXz5SEPJNttdRycgz4+RSha+tcx3C5zMaKmUkqeHvqy8SoGqNI?=
 =?us-ascii?Q?IfDlNuCBFnGeggoN54ToazBS7p4nxnPD8q9j8Q9gQzCNRqWtNVnouyALmC4f?=
 =?us-ascii?Q?/1I0h/rrXpwhQmuvxEUB2HrPPUfz9I630OQz8z9K580b/teCINzgbiji9AQs?=
 =?us-ascii?Q?XqiNharUgexATdNuVmVi/NKrfXx500IM0V5wOFV3VqNmQB9jtaW45g4lvB+E?=
 =?us-ascii?Q?BvhVn7YGilP/PNhh2pAaBvJbjPMmgxb6rf7SKMRIUo8Ul2hGUj9HtkdIz8KN?=
 =?us-ascii?Q?vpv65i8jxUJm0bUVu0UIbINQ+z00trkKv1wVPwEydI7qjCCyJND2N/dGbHQc?=
 =?us-ascii?Q?ycmSgdxOES6B6e3moEK8S5RX4PLKSSE7tVahMQvc3UA4kFVm+qWGYr6+dw/7?=
 =?us-ascii?Q?M4JxPrNgnzAU4yVnzfU6Zln/+HTDdb1oKyDT5EFmeSuop4N5LcJd29RgKpwC?=
 =?us-ascii?Q?nH/iWqOdrwxgMySS6wUKLvWz+T8Bo6Zu+R+zZEG0TgEA2S84uqLjSii3QuXV?=
 =?us-ascii?Q?mNT2GABeaJn9z0UqPpEvEbHCXL5FLWjhVBUiJawViZbfjLmW7Ao582vZtLqH?=
 =?us-ascii?Q?KmD0xmmE4LHkAI7eF5WtCSuZPkDAbFm2haIfiP61eI6RkqScLGPTAkav+zLy?=
 =?us-ascii?Q?k9VZfV4SpoZsRgRJ6fZLkyU2Kiz/t4WuQjLq/kEdbEC1tN09PHQ1bfosFAPZ?=
 =?us-ascii?Q?YBcPWVTujUb9qbbuYFMTRz/5PXYFmdaBXebUzmWP59oJaBR5+ZI8yq813qEa?=
 =?us-ascii?Q?HbbZUH3+LfvJyw7SMO3fFDveUv8Vkvj1e0wTcIDMJI2fpPu75wuWKnB1pu9k?=
 =?us-ascii?Q?kz/FDNrTzkHJLTXeslEQXZpRzTvaF9yelVSxmPWkLLACstHrcDiNowVwaTCF?=
 =?us-ascii?Q?Egj+56Zn5TKlZJhZTLvARgIG/HUzYqCBqLlqQUaLZYb7N6w3I2nKdlYJbmuw?=
 =?us-ascii?Q?fX+SnYhuXcKgh5FmbNOjnub9UDowj8yscrPRYZVcm921QtThiEZBc5+YciMT?=
 =?us-ascii?Q?IEpIrhNeZ1eT/HEkmj3ESdTqv6Z03Ze1xXg3H1ErZMJgQtwyh53GqEx7y6eT?=
 =?us-ascii?Q?2XPKN+wfzjk6Jqu7CFwp6YOvBCshM/QK+NAtOaPq1NBBmpvG6J3bXg+ZMM7m?=
 =?us-ascii?Q?iDZ5rtSESYoLZg3ApZ1hYPw1XCjmdyigcmwYJO2THdtbXlmJ3alpDbxs3dkr?=
 =?us-ascii?Q?upqXa5k2QOVrvpVEdVWGlaWDlcMsfKx3cnpsmCX0kXJGipFA5rnb1Tp1aE8K?=
 =?us-ascii?Q?z0BPh1WxxTpeWVXVa1bbEnxspT3pPJ9tIVPzeGd0Aa/GMI5k+Ptoi9qPM/Tb?=
 =?us-ascii?Q?pNd/BgToFi1bT8HQv3o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ec9f32-3fbc-4820-9ce6-08dca3dead86
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 08:26:36.8736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7Rq+Wa1TRpLPwAf65rrE5jhiQapSMFwIh9OLa4Z0RfGu2IPZILTyy9980rkjI226HHawP9fvszSjK0bxuqlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7544

> Subject: Re: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC
> Extenstion
>=20
> On 11/07/2024 15:05:42+0100, Cristian Marussi wrote:
> > On Fri, Jun 21, 2024 at 03:04:35PM +0800, Peng Fan (OSS) wrote:
> > > i.MX95 System Manager Firmware source:
> > >
> ed=3D0
> > > To generate html from the repo: make html
> > >
> >
> > Hi Peng,
> >
> > thanks for upstreaming this Vendor protocol.
>=20
> The question being when are they going to reuse the protocols, we
> already have two just from nxp:
>=20
> rtc-nxp-bbnsm.c

This is mmio register access driver

> rtc-imx-sc.c

This is i.MX8 SCFW based, at that time, SCMI was not used.

The current patchset is use SCMI protocol. I hope this is generic for
Future i.MX SCMI based RTC.

Thanks,
Peng.

>=20
>=20
>=20
> >
> > LGTM, beside minor nitpicks I mentioned.
> >
> > Please run checkpatch.pl --strict on series before next rebase,
> > though, that I spotted a few minor not-so-stylish things :D
> >
> > Thanks,
> > Cristian
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and
> Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> bootlin.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cd55f2af
> 62d464d6448a108dca1e35007%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638563244865575023%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DY%2Fb59hmu7EmIQx6KMXCx
> P2X97h0bZiHqawOdNeoVPhc%3D&reserved=3D0

