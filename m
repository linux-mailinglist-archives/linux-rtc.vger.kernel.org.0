Return-Path: <linux-rtc+bounces-1507-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842C93237A
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42DE1C2224A
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439DF198A21;
	Tue, 16 Jul 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y9pN6CNO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3617CF16;
	Tue, 16 Jul 2024 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123784; cv=fail; b=HqkUtgZi2+sm0m4PRIvutOu2hXO6JkFXeetiVCoUA/tm/YzzpZwhehujQSwL+bSsQS7VD2+5uSJEDyMX8zds6JxRuBAthwp2d66FaNBlNFPZcOPy42oAbzWmODxj56MghGUE0gzj2kqcuZ5fEeD2olNKR1OYVzVBjwBKNckK0lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123784; c=relaxed/simple;
	bh=o1id2tT7bDGpH658q1BFK+X6qmVC12rGiU9rN8Nrsjg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IC6T/g5PHoJpDT4F2HKyaJ+EM5CkemqkxVS+fgqkUBnkiTWgXUavTzWN9LcB3+Z3cgP+0x71TmPbIhXoyuv54nEmfbv6cSRJ0hGqnMeTXWGRZrRMqfm2rmmMvKPbcudFuuu+BvQptK54Xm+ZiEi8z4n6KCAVDIL/TVt5RMPmI24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y9pN6CNO; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KU8fjw7A5gq67L7XyomzT5N7Ewr1r2grOD0Mj6X+S3+xEwezOQym1hLNiuXvZ5my6CYafTmvvIJICla5WuClMyadJlTPySSDmZAQp8SA983ovC/OnXAFBVhwUSdGADS8lcBoPx+IUURURfOMmF+ZTo0FkaSqaek8UDypYm5btwiTRWh6BENt5FnHzarxUDz/IOdN/7n4kY13TcXMz1dPOBmdNcVTCbryEXCj4Jv/+Fovi+jHOnLl5qNrMGNGyUHFe3142DD/rzf4yvb3O8TpIx9/kD5z3YQKo/Z6gEDmKlwhTe3rttmtT1YRuQJGXTBYtOzLQImzfPvG+kFdde3qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su3nPn5CQDvNz2YKKX/zEG/xTyxhTIkHeapBvBI4xmk=;
 b=AUVQWcG/NLVSdmvammqwN+k5S5nU7m3JHqO4UvELHBYDqTGz9xvAKwNaFBcsrjpFIK289pLrTI9jtRAmtr5L83S7v80X4aMnI5MWqQgQsuYe7K/VuAt54OdNkcxTdhL0R91EkliPPrcW0IN0dpsaVXo1g+7vIi+5ksQvBVp1rx3Q+yzBngmImoLgcPJF3VAg940K4rGonh7liD7awMOhD28JPACYLd1bFoGogur9pmsc6EFq8eXX+e/49DAxVj4nK1F6zgqiUW3zOM15NCNtb8dISuO6pR8bzK6f5sGJiRs2DzXSj8tVlWTdE36k+zKMlPF9XlTv8my/pknJvZK26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su3nPn5CQDvNz2YKKX/zEG/xTyxhTIkHeapBvBI4xmk=;
 b=Y9pN6CNOZgd7m7o5TEXkExC+vmBYQOcR8H7nMl9UhHkZy6HYeVqAMpopMqTO08Vrf/5hlR3L0XMhv6Hc61HTKoq2VapleNBitCemhcg92O/agLiSyV51ZJMJH/NHV9U+tyJtjyf2fN1VAemNn1YCMfdMHkqmBPBFXsfIhBsU4SI=
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 09:56:18 +0000
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::c1b2:719:a52f:26cc]) by AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::c1b2:719:a52f:26cc%7]) with mapi id 15.20.7762.020; Tue, 16 Jul 2024
 09:56:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95 SCMI
 documentation
Thread-Topic: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95
 SCMI documentation
Thread-Index: AQHaw6gJ3kigbFXI4ku+minp7wB8vbHxoakAgAYwAHCAABSwAIABXqTg
Date: Tue, 16 Jul 2024 09:56:18 +0000
Message-ID:
 <AS8PR04MB8450D6EB9E61E73802F402A888A22@AS8PR04MB8450.eurprd04.prod.outlook.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
 <Zo_bFnjWixZF6seV@pluto>
 <DB9PR04MB8461684315E753DAFDDBACA788A12@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <ZpUdMmvucei9lLPI@bogus>
In-Reply-To: <ZpUdMmvucei9lLPI@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8450:EE_|AM7PR04MB6984:EE_
x-ms-office365-filtering-correlation-id: 9af58311-c212-40bd-4caf-08dca57d89eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+G9ANsonxQScfzBwhgfoQXQVjKtT1nqO894MEBqXDZy+0j87cySd57WgxrKa?=
 =?us-ascii?Q?KJ7AOS85K2iRAhB6sHrHm5RruGCXHe4YwqkBQINGy0NQnJBJOLoC422OhKRD?=
 =?us-ascii?Q?lzoG3VImrvXslyIFK0cQFGTg33a6tIQfLZ/aeB11uFuD38wZZo7nhlxO8L4D?=
 =?us-ascii?Q?YAtsG1AkfEbJJ0YfkdXPlRClUCSvCcIz/+AynG9OY7cLNQkDsZBTMpyOOT5B?=
 =?us-ascii?Q?azL5W7glEC9vz7m2UlIuMYk0RXVuUl2frK8MkmaOigjCp6MJ3vOGRpplmNHt?=
 =?us-ascii?Q?Vpv9Pi2DZ+U8+Kzk8r0v/HnZg3/8i62GFsXtSzPgPwfFxvO0a/xPcRj7N9mw?=
 =?us-ascii?Q?FbkCZ3jlhfK2pJxAgEkvXxC622CGi5h9dHHuia6N+Y5vGA9rsI4xsZ/mv8Bv?=
 =?us-ascii?Q?edj7iOd9Zbb9Xy+2WRWjQ4QZL0ImHU6BlVb9XTUcihJbFe6RyN8LBrt+MPtJ?=
 =?us-ascii?Q?pV8tRa6+05OnmvAlI7c9H4VrtmpKrZXdqGy87mJHU+SXHp5EhvEj2s6TonLE?=
 =?us-ascii?Q?1iPrXoFzzEr8nWd4fgQP7CJTLaFanUTHtgvYWZ26PEkA5L3i9ca+G37tYqQS?=
 =?us-ascii?Q?1nZ0txOL3BfOF5aOAZWf8FzvF1dttU/e60X8Rm+YQjxhmuvzJoI5GAk++uyZ?=
 =?us-ascii?Q?kXmIOVaXYpGm8qwHMSGVa+RYHMIMIFGDuAmGYCRZbxDCPeFvOB0P7/rPbX9b?=
 =?us-ascii?Q?kfaOhIrq6wEB0Zr7CegZg3Ch0VT0ycAlGL2HI321Gb24T0FU4/SBeng8lEks?=
 =?us-ascii?Q?5yFsNMumL4yvX+DrIRdW5UtUsRMhSfFtt5eQb7Rft6NV3ps6Fjaobd9zCrs9?=
 =?us-ascii?Q?JOM8qGhZtxwMKWC7oafeFU0HibaFiAERCf8gAbXMDZWiPuV6iMNXro4VmnhJ?=
 =?us-ascii?Q?EcEFeuH9VT0guHZ0iMF/EniF1lYP77otGutnRfMIm8DoG7s2jsUjCcWbbkB7?=
 =?us-ascii?Q?5H4Triue46i2mfBGgBaknauEvP5LJR9lrkQbe5drYJDj+3Y1lphb40Pb1tEs?=
 =?us-ascii?Q?D0WslF03P+5Zr0bBrR/cNDw1ojOWP/Tpgq7p8Ft6LjzGmdPDxLTHBVEN3AZL?=
 =?us-ascii?Q?GPFCKcvBh0bL3hjq/z1ek1CNUItTpESKCCs8lxVk90sVV8nwYiDsnahQs36U?=
 =?us-ascii?Q?TpL8nbKc6WE2WqX8HWGLgwg8LsAV81t8zEJsm5HVRYZ+hcnwwmgNJogjkgZz?=
 =?us-ascii?Q?Jsn/5eXWtBvJAssQjIFgAAMK3inNDQVRQZ1zFBQO1z3Y6B2NPm5tVsWXX1dK?=
 =?us-ascii?Q?YYz8aeuxe796mrflyY5RfIlu6JkkyHpnZDbIk57lb5rQd+IjptYDQr2S/cKS?=
 =?us-ascii?Q?xrXJJlKsZ3uzPlCVKvcLxg/x8poc2iWPTbcyHy2CfdfMHXbauer9hV+rXR9E?=
 =?us-ascii?Q?yEHiLBs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8450.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UkbI9L7CEB8G5sq/OAdP6fB6ekkNaFKVIGbpKIXPMgQFXbEgNl/FJPXXuRqa?=
 =?us-ascii?Q?GqaJXa/40yGDl6yDSeO9K04vek4e8et4jYEVWxl1UyeeHsqo5SztDkYMiR9k?=
 =?us-ascii?Q?n1yMOPe5ukO3dTRMDnJHHmll/ukDZdgkspLp8r4HLc0DclRb9CMelVPsG/OE?=
 =?us-ascii?Q?R7rTAtAb4Ktr2VgLm6RNnn52FekDir2t9bfaZlGoe1O6k3tnfBt8VGdLmJda?=
 =?us-ascii?Q?Q5QLSpa5EIwQxG+HEadCiaMRKh8zEUpjxIzQIoJOZJjo+CVqfg2kR6DkymP6?=
 =?us-ascii?Q?PwKf+Vqe+Rc89RSRbK/N6Dg1M9mlbwwPhmmesC+RDyCSuKVXAlJ6m+Wmb/kF?=
 =?us-ascii?Q?Njsqf9IMUIE6X514aOZaqWeZL77dyvjI7cMWqDOV9vbBb2X7LlkgHvWOVbrq?=
 =?us-ascii?Q?bmmdt8YVpCU9bCFBaONTLU+tJqnjRh6fJNiqz63hnZGsOSpN94UfFI5StAQ1?=
 =?us-ascii?Q?j1Baor58h9eOGi2YmgY6XcDesx5gQLn+SxGSQjqU2o20JG1F/Wx+KuCPea+k?=
 =?us-ascii?Q?1NbZHg4u8e3RES9Otd8ClCNvEWdG7ROc6patLlvadw/7IHM2x2UW/eXrlyNQ?=
 =?us-ascii?Q?5aY12VpJXuwUZhDtdQVJDovw4ou09HDx4YyYb11WlLaefhFGQOB4P66njORP?=
 =?us-ascii?Q?Yu1rVRMSTo25ri56aHmM9uCH7opTFWOK66iNlMxpUjx4y6x56IRZdZSNCcKd?=
 =?us-ascii?Q?FDOTPJdtq8dZhw6zoJX7hvqj4HDrXoPENHODweIKBlkeUVgFu9+QvdJf3s+B?=
 =?us-ascii?Q?ciUzAwCAARzgpCGT/K3Rp4rfz48+hcMn2cTI30V9+46fCXj0+CaARDhey/XP?=
 =?us-ascii?Q?Y0HVW/TzZj2fRpuuPCUVyZ05VK6Ibfa6P8CHrv2Ktbd8bRlN1dLeygnA7gDA?=
 =?us-ascii?Q?7IaUBan9Rg+e52CCNMcL8ZkoS51YWT1srFV+cx+SDl9XGg1AzETgYS5yOAwO?=
 =?us-ascii?Q?lGlA42FaxwvcvjobMraXFXtx3vG3b7aSkn3mQIHAe3euJ52NssCm6DhhYB7F?=
 =?us-ascii?Q?GkVY9xfO4Gtye7y6EYFjxo/f9pFTSVIDnEuRvpE0IYBKKduqCGs9H0L979f0?=
 =?us-ascii?Q?yXpKPUx51UCoOC0elbbXoY8Na4XkP2OIwAyiLcy7U9p2HUB6qHUlskS0yr1y?=
 =?us-ascii?Q?fJYJgx8Ci5GlRIpnvInk21h9Yeo43PM5k3kmyoUl/t6f8d4J57hNm7JQ/5NZ?=
 =?us-ascii?Q?WfPHTRO+4yzFbqsvKL1D8QvdI9qrM69glNS4Ws7YhDKUauJvRRm71Fig+Q+Q?=
 =?us-ascii?Q?BfWx9Pfn5Q1yM57qjA0UIV8gah4VI68++edRxQQNoyTKYCVigbRvQqroGokI?=
 =?us-ascii?Q?gI8OWPKfktinSvRO/+AKSXn4j3MPmIryOiZEkkPjlp/tfcUtYMNP77eJjcAm?=
 =?us-ascii?Q?qfZ1Qm8JHF8S5h/y63Ah2s7blDZ3FtiLY1Sbs+vEdFJRXcRnhd5wW8kXEO5c?=
 =?us-ascii?Q?GQbJh2CSr6L6VbsN8jNGh/s0/Pyodbv6+b73Ql36cJIf49WDd8tzxMv/N2ok?=
 =?us-ascii?Q?sEbR5NRJTyRUbVX8nDvHdINasyFNLYPDrm+XNPp7meEQazefra7ctaJJ+6Hf?=
 =?us-ascii?Q?OrTTuW03B5GUh8Er++o=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af58311-c212-40bd-4caf-08dca57d89eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 09:56:18.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MrspTodSoOzubXk3TrvOXQp5EZ25QnQYWrmkNt3RN8MkJmE3nwGcBVcesLQORg5fPGpod8X9PHuIML0smSA57Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984

> Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP
> i.MX95 SCMI documentation
>=20
> On Mon, Jul 15, 2024 at 11:47:56AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add
> NXP
> > > i.MX95 SCMI documentation
> > >
> > > On Fri, Jun 21, 2024 at 03:04:36PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > Add NXP i.MX95 System Control Management Interface(SCMI)
> > > vendor
> > > > extensions protocol documentation.
> > > >
> > >
> > > Hi,
> > >
> > > beside the final location of this file in the tree, and a few
> > > nitpicks down below.
> >
> > Thanks for reviewing the patches. Except Documentation/firmware-
> guide,
> > I not have good idea where to put the API doc.
> >
> > Sudeep,
> >   Do you have any suggestions?
> >
>=20
> Not really. But I am OK to keep it under
> drivers/firmware/arm_scmi/vendor/docs
> or something similar.

ok, Cristian's patch not applied.
https://lore.kernel.org/all/20240418095121.3238820-3-cristian.marussi@arm.c=
om/

So I will use
drivers/firmware/arm_scmi/imx/docs in
v6 patchset

Regards,
Peng.

>=20
> --
> Regards,
> Sudeep

