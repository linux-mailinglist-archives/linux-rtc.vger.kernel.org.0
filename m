Return-Path: <linux-rtc+bounces-1521-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305593249D
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 13:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DEEEB22AC4
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 11:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D5F198E9A;
	Tue, 16 Jul 2024 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f9eCtXUa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273AC1CFBE;
	Tue, 16 Jul 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721128076; cv=fail; b=Oks3P9Mw1enM/Zm8sJ6n0PPXhuiNFIvPzc8gwshGZ2DOgpHuvSkgL1nUn39AqVC9cJw3Q1Emv0IGjE0vH/fUZv4nVGeYrHCoqT1V1tH3DVrzIywa/5D8UPruFmgKpn3OBtVdeKuBCqIqhIcSt6x9Zf6lZTWX1OAN6IfZyVP4ZKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721128076; c=relaxed/simple;
	bh=E3Tulh9wr7BDfQqqhCTVgS1mJEaZn3EAGBbGoYCzAkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gsQC6NB1QodWKEVbQ3bZAX5WlJw4X4Nfw8GkcIbOr6heNKbYEV5gwCR0M5W9zVIEuTijlrgWB05keQlVCTgcWn8YBp1pNnvjd92qu2YzT8tlhbWulX2jg8fJpV/nARecdosGHywOin/FYGQVnOHlidS4UfTbf3JAsHJ/j84aKqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f9eCtXUa; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVvoR1s7/V3TfaLrWNgWGTIhtT4CZuvlf06AokVMqFP1unpm+DAWuBUY4StX6B0FB2pYxTrQ0pyEVP6tCESOSe7iJ0n3kvsfguOxbjBrQ/mBR/3RSBgF1LklT/XcMW0HCUyGZ2k3+VZupQcWoLhYXDfZFbcRNYQGPm9ADGRP3+QQe1eGmc4v+J96Fi7qlBFvHs+dqg0I2tjZZ+MieqR9674+egb4M9ag2YuXDxUAWVpqFYrl7Kzup3P5xPCnLapik/1yxYmY31aE1EWnkBrF0yUTh6E3OJwYtmtdoUTzhgJHnky2o7ZR7y7d25z0aQ1Fc9v46NzUBTfMngVdKaIShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl5J5qFwbobXn2L1E0tir4Shi6BNYrNkp0XuV7tocWk=;
 b=ogo6ZUnHMs3MkQaLx7jANW5Qv83eQFR5FBhFKTT/iRpDW1eSvy7lG5Afbp/fT6hp969YJ2vaJIqCkwXZ2L3vjCrR2gnYZKHmDcG43paEPEioLYBP+MKwqsczz/9Hus87L0O0cOblw8soC9wzEjuhRjIf0gWwwgmGl+b5DVKmz9AxJFHb1DtQ1htTqL39zdOYtp5UpMINrpdVNmPERvOcc0SfLn4IsHxCFgfDmihwRqPdjb4rSy1WpFfmWFzPgGtBiSiR3GSAg5sO1SLjRB2q8Q0Xa/Mag3uq519rArAjRp8KGQQTO02rXteUjJbpNTr623FQszjGZHZi3yYEtZdTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl5J5qFwbobXn2L1E0tir4Shi6BNYrNkp0XuV7tocWk=;
 b=f9eCtXUaBz+K/1zog5/O2x4GiXL257fOkSVrvjHkwdO11WcfCoezbW1prZw9oz0eRBIKEigq8AjeFOSNNnpmiVo9sSjtxJVPuZmspTtgk22Bf/yv1PDZD4KlrgxCt3HG7lERapTSoESwkXHkHqt6odDVSMQzJxR+scGIIfXXjqQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9903.jpnprd01.prod.outlook.com (2603:1096:400:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 11:07:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 11:07:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "lee@kernel.org"
	<lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Topic: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Index: AQHa12tDxiFdQX5gCUGHOGSoT2m2RLH5MR+w
Date: Tue, 16 Jul 2024 11:07:49 +0000
Message-ID:
 <TY3PR01MB11346E71D18A145DA70441CF786A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9903:EE_
x-ms-office365-filtering-correlation-id: dcdfa4f1-8479-452f-aa04-08dca58787f7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rTyGi+5qxnNiVGQkKBiiHYXEXTRljpF+pRMm/phidrYfMRAJP5+1yPUSqX18?=
 =?us-ascii?Q?zoeiUdx7lySMrI3nKqhvO8kl1gTSQXoA0PF/bIWuFa9rDaFvCXvVJG+377OJ?=
 =?us-ascii?Q?atXOMlseGcTFyeKNxqWCHB7vjP4Nkc889olXnxaoqpJZITZtMR4h5FvBN/tA?=
 =?us-ascii?Q?M4y9rM0FFdXuxxQyExpG5sHGTs30SI0QtyO8F375BDegCYQcAoGa0lrhz6Zt?=
 =?us-ascii?Q?8DazU/v/IYPLYwGjElJlzmv8ycjbyXRu4NxuITw1KxxnD54jjBGagtVdLGaw?=
 =?us-ascii?Q?tnb6K0qSnuGyIatQIaGHWt6436M93FLQbYjODgmw13uY/EINvNjl9TS7zu/z?=
 =?us-ascii?Q?PjcwHeB2gL/6YY9qkqBiAlYcIFlbjN1seLgO3IU/SPDNwmdRA9NLG5I8FBqZ?=
 =?us-ascii?Q?c1SZbYrlrEtUQ2EajPoGswcas81rVXKrtXacRVBbfkdA919AyL7/F7BodnoR?=
 =?us-ascii?Q?0G12kQSrns0yVSh1Rr+joNh2i/IBjgdlOrqprzODevE3MSbrgVTQPeqcJAIo?=
 =?us-ascii?Q?VY530RBzdmPShBLuz4IPceK/swn8tMX58O8SE9g3uceNBWD5yOY+2A6FEUbP?=
 =?us-ascii?Q?MebZh9CTJm+XfhCxyKYVNcqhRmQ39tfR0AFtTzq69sSfhD75hiAsd7GA/b22?=
 =?us-ascii?Q?dMBsPQYJRzKmfGm61HltlfkCF6/Z+54HwLic5eozBETUTToksZYW6eA/S0EZ?=
 =?us-ascii?Q?HI3ctpAHAlnWgSiM9tMqXnpcL89mcKQDt3Llq+YMD9/3dVHkcCXzAskyPZHn?=
 =?us-ascii?Q?sLk9e5DhjMpiNOskZNEPAsAtC+a1uvJw+OVMja37ef05wsqXqhU7d+w06Tuv?=
 =?us-ascii?Q?WsbzC1bhLdAk01o59GzVu1K94quhVPrKbzFc4iFDyjiQSqUYqhFiwCfwyipx?=
 =?us-ascii?Q?jxa3o0DpodB69NhAkC8i0EW6REvuoi2kwGdFGAXlOeojON7jyhl60yIR2Nj+?=
 =?us-ascii?Q?8YDaidEf2mxAxLuVCXnZhVOxnh/CxnLB5J1p11ee6zs9X6awjsJH5Y30/6cv?=
 =?us-ascii?Q?9IfnB1APVy378eLrEGwiqErE/77exHKxx7PQRTTQBJEqE6+tmJj+tc8Cpiwb?=
 =?us-ascii?Q?lf1rJU3jcF5BvisBGsIt6ADk2bbT+AsKVf2ceWPp3iCLDXtKf7keQt6oC2l2?=
 =?us-ascii?Q?iYcNaYN90HyMtIb5DutdMQFDmgbsMyKAjvtYtTC5fbz1/i2fWzE/rUWXVXo+?=
 =?us-ascii?Q?MUhfQcvlihansOwAjpQoJrQr16nTbxmOYzNw2zRya9xplcq3LUZXfy2kzWNh?=
 =?us-ascii?Q?IyPMjq1WgnZYSrGv+Ot2CYSpq/TIPRPKJxmdNVCw0cU156j9SCR0thBcsl+V?=
 =?us-ascii?Q?kB7Ivn5XsLBOiUMfRf2EEyyyrcI3qpwMeOpE4A3QSBwtq/RY2jveKhyCevN8?=
 =?us-ascii?Q?erPI7k5Iy+zxmV/Vt7EkdWizQ6UPdZwi93Frxu4bp8eDxPdHCHI476w2UvCJ?=
 =?us-ascii?Q?Z0w6gX933sY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aAQObcOcSgB8vwQMn+p6s81GmkjCO+2/RdJZO0VrsEZRqU/rIiPitbEfCEbq?=
 =?us-ascii?Q?YIV6v5yEEHoeY7/rE39JwWZTli2kOE89UGhOiHPxCYHf63xiyv17Y/E3qVDh?=
 =?us-ascii?Q?5us8dCU3LQqUPguemvWfJZkJ712ZDx/w4YhgA7Z84VvT8VTIIQbbB5KOtxlu?=
 =?us-ascii?Q?LrXxXBSR7vN0AeiseKb2MVwCuBFX4she8SGC4Ou5/4orSCwfblI5TAERBJkW?=
 =?us-ascii?Q?FSUuOcynrpAz0+TqgFx0xw9i99YAR0DT0OpOStBBbk7MZHpSkHLYg36+ZYk2?=
 =?us-ascii?Q?EByo7qwdgd8Mm/4n/XGgPQtxxE96w1VDels0ZB8Lo2uQYrFyzd5gD44WQHxn?=
 =?us-ascii?Q?b9M2/biBSIpJLUkvwxLnOdeUs6PBO05r+hjkqkyWpYp6IbGtM9sxMZOe3VB0?=
 =?us-ascii?Q?BcnR/kXKGv4Wo3NhshgjFub+m2CAwJd7bXwFe1j4NhmDAgrQhZTzHC353lt6?=
 =?us-ascii?Q?hqTD9dxFvWK/8sitB+tWWiR+4R2iFHAjx0gC3vH8ZKCyFppyMa5ydzCuVkLZ?=
 =?us-ascii?Q?YtGK7S40BnOEZjCcRbJ5avq1OOQRFOfScSXTd/skXw1z2qmDJtiftBPvhC8E?=
 =?us-ascii?Q?El/GxTwb5SSjm1ZWc/fJZZ/rpbTyN2HyajyW2R3xjouGF84MYP6iDKArL9F1?=
 =?us-ascii?Q?T7wTy+S2tn91wW6JUAXer0tF9XFXiTLg7DKjNdVZVmV+1SQj3K6ANal5Vs3I?=
 =?us-ascii?Q?EPpBvIbpOuqJO4H1D+0Rxp8SxUcVsQGfADrydMMK3Jsb3/DZKXI40nUotaQt?=
 =?us-ascii?Q?E77v6Q91t/QftNMBey2/vmUcSN/iYLzuE6wXzSQsUrDebbuQDVjmn8WNWMJT?=
 =?us-ascii?Q?PkSVZtwoS+DVZvTV8Z1mnjHE7VOHiia9Fj5UwWBMzuhDbIVLFq7Ehf9pvFE7?=
 =?us-ascii?Q?aeRNFTuShcR7KZX+38lcZnFQNt9i9Z/YdAQSj4Yr3fxLS3hypRzpnaRYVfDl?=
 =?us-ascii?Q?LdITK11Z2h9o/UXVRdgtqSSgsfr/KvgGIFIK9/VjQyGl1ZjlFuNIO9z9O6kz?=
 =?us-ascii?Q?Phc9sfoHaD3+zLcaI8CBzph7enEAscV0v2QbW3Nh544NPKJzOiPjpD8qwpxQ?=
 =?us-ascii?Q?kNr9Lg8aL/olkvirUcMSZscxhwQG3tbo/IadnF67QdBhbbH1oossFsJm8uJh?=
 =?us-ascii?Q?qHUXwyDfiQwNSCZhZfvE9xaE7iInDZA59L+ilHeYTCuSRkljEmDYS3qtnueD?=
 =?us-ascii?Q?GvI8x1qO0tGEsZA7Knt1rOoyEhFxxmnNQL+vAdSG2UZAB+fLkuxInQn6U8Xf?=
 =?us-ascii?Q?Wl3avY7hdzf6gSlNYQcKGrXTnNny7ITWi3xfmhw9tguz7Zmuq70bCJ6BKhqo?=
 =?us-ascii?Q?23fY+kaR5QLMFb6qVa82mIjwucZFaMXYqwcP+KW7sAKCkYc/fblixpHy7fLz?=
 =?us-ascii?Q?7zabst+hfS3Ztu1AzAXNUPZATjK7No7yqQ5oSeE6XbeD31H6qwqoFaPYUFlr?=
 =?us-ascii?Q?x3mWRgt4AbCm7FpIH69w/lXXbJwH51x1yzb9lyWavWz+KEdiwY5tr4yzrM8W?=
 =?us-ascii?Q?acmRM19uMXPjZyYAgGIfYUZD537YcBqa4MrwIwQP0iEjDR40DvyNJNHsWzIC?=
 =?us-ascii?Q?oNRia3GiQe/rSEm75sKT/6rC6amVt7eNL2Szmh6ZNwNwFq6IyTXQI5MIxdbl?=
 =?us-ascii?Q?cQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdfa4f1-8479-452f-aa04-08dca58787f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 11:07:49.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FImK/y7l2ZkPVRskGzsWax8z6MsC2FVDp6nixu5/ng2BaDZU2Zy28JCsylijiu1Iz8ohg+LTGJ3DiwVhd07H4k3tv5sis5vPKmR9Wx4YgC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9903

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Tuesday, July 16, 2024 11:30 AM
> Subject: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the R=
enesas VBATTB IP
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Renesas VBATTB IP has logic to control the RTC clock, tamper detection an=
d a small 128B memory. Add a
> MFD driver to do the basic initialization of the VBATTB IP for the inner =
components to work.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - none; this driver is new
>=20
>  drivers/mfd/Kconfig          |  8 ++++
>  drivers/mfd/Makefile         |  1 +
>  drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 drivers/mfd/renesas-vbattb.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig index bc8be2e593b6=
..df93e8b05065 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
>  	  This driver provides common support for accessing the SC27xx PMICs,
>  	  and it also adds the irq_chip parts for handling the PMIC chip events=
.
>=20
> +config MFD_RENESAS_VBATTB
> +	tristate "Renesas VBATTB driver"
> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  Select this option to enable Renesas RZ/G3S VBATTB driver which
> +	  provides support for the RTC clock, tamper detector and 128B SRAM.
> +
>  config RZ_MTU3
>  	tristate "Renesas RZ/G2L MTU3a core driver"
>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST diff --git a/drivers/mfd/=
Makefile
> b/drivers/mfd/Makefile index 02b651cd7535..cd2f27492df2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -186,6 +186,7 @@ pcf50633-objs			:=3D pcf50633-core.o pcf50633-irq.o
>  obj-$(CONFIG_MFD_PCF50633)	+=3D pcf50633.o
>  obj-$(CONFIG_PCF50633_ADC)	+=3D pcf50633-adc.o
>  obj-$(CONFIG_PCF50633_GPIO)	+=3D pcf50633-gpio.o
> +obj-$(CONFIG_MFD_RENESAS_VBATTB)	+=3D renesas-vbattb.o
>  obj-$(CONFIG_RZ_MTU3)		+=3D rz-mtu3.o
>  obj-$(CONFIG_ABX500_CORE)	+=3D abx500-core.o
>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+=3D db8500-prcmu.o
> diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c =
new file mode 100644 index
> 000000000000..5d71565b8cbf
> --- /dev/null
> +++ b/drivers/mfd/renesas-vbattb.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VBATTB driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +static int vbattb_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rstc;
> +	int ret;
> +
> +	rstc =3D devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rstc))
> +		return PTR_ERR(rstc);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;

Maybe as an optimization drop pm calls and use "devm_clk_get_enabled"
instead as it perfectly fits in this scenario??

> +
> +	ret =3D reset_control_deassert(rstc);
> +	if (ret)
> +		goto rpm_put;
> +
> +	platform_set_drvdata(pdev, rstc);
> +
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		goto reset_assert;
> +
> +	return 0;
> +
> +reset_assert:
> +	reset_control_assert(rstc);
> +rpm_put:
> +	pm_runtime_put(dev);
> +	return ret;
> +}
> +
> +static void vbattb_remove(struct platform_device *pdev) {
> +	struct reset_control *rstc =3D platform_get_drvdata(pdev);
> +
> +	reset_control_assert(rstc);
> +	pm_runtime_put(&pdev->dev);
> +}
> +
> +static const struct of_device_id vbattb_match[] =3D {
> +	{ .compatible =3D "renesas,r9a08g045-vbattb" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, vbattb_match);
> +
> +static struct platform_driver vbattb_driver =3D {
> +	.probe =3D vbattb_probe,
> +	.remove_new =3D vbattb_remove,
> +	.driver =3D {
> +		.name =3D "renesas-vbattb",
> +		.of_match_table =3D vbattb_match,
> +	},
> +};
> +module_platform_driver(vbattb_driver);
> +
> +MODULE_ALIAS("platform:renesas-vbattb");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas VBATTB driver"); MODULE_LICENSE("GPL");
> --
> 2.39.2
>=20


