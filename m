Return-Path: <linux-rtc+bounces-5103-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B48ADBEE2C0
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 12:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DD644E4A6F
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 10:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646941C84A2;
	Sun, 19 Oct 2025 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ew3Hv4Jo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D8A1B4223;
	Sun, 19 Oct 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760868956; cv=fail; b=HR2KDRJD57nrS39J9Ji/sz4yyheCFjmLDHrqHsQCdIGDoQOZ+nDel1oY3+RgHZRnX2ppT1QxHnuZs/Evh/USRg59OP2oTaKRvxuQffQzdCYvXhXABDNicJ0uaNQ5I30+/touG36gM52XyaiJS5hIfIL8kYDKuJHZEW9FfWlJd3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760868956; c=relaxed/simple;
	bh=PIvrhvYQYvozCCs7qXitbOxGCeMGozQ/08AOG+XrLYE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T2tRUROqdMf/6+XkChS+dJ7YZNVpMyDaHwy2AXU6t3+B4Qu8FyFUpQsE244pCucvP51l9qH402BzHeBWHPi8IglYRoAo5aoHLnZJOzOLP7xRBK6+/iuC/pxyW7xa3h1Vr+O229EUhuqUmgRncUld5UYtOFLJ4cNqOZQLxPwkV8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ew3Hv4Jo; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzsavEhihLEFZPh4Ek+Gis4H6H8AXF+pVOZrmoLfxJQ+tTwqS7O4r4xYdFvcO0nr6zHSHdKGoJQwGyIloz5NAhonHAR5gMJSi4ozuKUegumH3T6Chqyr/ecDydl55dEtz85IA+J9cmLmFs0celzub/eenSuA9Ga/vW6scByzSAc5fQqiucgUAUmUEtmVF3pRn67Ab+4SspbWbNO8Trt6zkRgswMa60J5O0Qr80hdn0geoWJSI2dzJ3vZoEjpw+7dfAuYsG0mCfdV5sq61WgYQieWHg/93tcgR40YWRGf3NemDQ1APGpTUHil7Fr3rwTNESR3qoggT3jJ7wvoHl/xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5nGv99Xpffc1KFb1PX3pYur5pITvfaXt/6ETb/hauA=;
 b=mfyZeR3NHCNcTb/dDTZ39hdqm9o31Vh2EFnkkCnXRkt+9LPQBgPd6vFMnpGo/OkyiCmkLxRnKebfQ2ruKFKzrPy8thlMjs3d1RZzuBBx9KPBousc2l5KMG7ap/qRdx6ki+VJBmCtZN40xN5EPpKb9yX1vFrGF3aynZQmxLwRqg1atoUcl7NRpNgP0Ci3Q9NlxqCciKa7fnmitJNy+EHeSK9xW+mxRA69TmlTaS/3/XQfD/XOIO5gTyql1kTvKhPABFKHgsUGtlUWLAOiobczyHzEps8RBkUE+3B+chX1P8zJi2ETXVOZz7D126RdwESBf67+QYWAGAU/fwL0f/Ngxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5nGv99Xpffc1KFb1PX3pYur5pITvfaXt/6ETb/hauA=;
 b=Ew3Hv4JoqWAffcLVE1fs59C45jSJD1g1B7bEa5bEzOISM/SfTsnsQykh04yYR7WWGR4+xMHTLjAPFjV+JXjY6tCz/8bBhuncgwqUvtTLUSo3tEPPoOLu294/WWhYXpBfKbm5HFMOy0I4TrIhaw8+CW/7FlGDKfOnHsIZz+965UE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15869.jpnprd01.prod.outlook.com (2603:1096:405:2ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.10; Sun, 19 Oct
 2025 10:15:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9253.010; Sun, 19 Oct 2025
 10:15:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
Thread-Topic: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
Thread-Index: AQHcQNnpD+MZABpK50GyV5pRHAKx9bTJQMBw
Date: Sun, 19 Oct 2025 10:15:40 +0000
Message-ID:
 <TY3PR01MB11346CBE1C135CBEF82E3E7BE86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
 <20251019092106.5737-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251019092106.5737-6-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15869:EE_
x-ms-office365-filtering-correlation-id: 4a03436b-a0b9-4ad9-8bc4-08de0ef874e4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JgcOebzK2bfYu4FPYnm79ldGth+GXGUyvFiTZGTrZPpP2SIFcG9AUffLW3Qu?=
 =?us-ascii?Q?+uODPhzIy8Bf3rEGCCBaQJZ6Ya8a8g2RQm7/VW0H4plidErKJPnPt61y6h3J?=
 =?us-ascii?Q?LDFa2+ZILNeIxn4aS0wGr+bXDDE84wGFad/VktoqVxt+01JIMTjWZ+HPUk7m?=
 =?us-ascii?Q?qZGbLdWfLzN4IeiAEyX8xW8NQV5lrh0eg9ZBi4OhWrgflcuEFFNGfq/RBJ5s?=
 =?us-ascii?Q?kLIS5WOZIkCeMRdukTK1QGiWTDrY+s7uvioMRXGykeFIWX273dUo9/60BfiD?=
 =?us-ascii?Q?Z3JxgcexB0JShW+0PA2pzXeZ+U86c46jkn8g0QlISxRc6ufL58V0w0jrSnj8?=
 =?us-ascii?Q?FinZdmMU9j5UrDkI2zPrMfuO75OI1UJEUXoQOQ/gST8UKN/V+HYNJWEU6Ied?=
 =?us-ascii?Q?1tEs+nuuGAA5GLiAyc1GocdhhLjHrKDYIv1fcahgnYVWYU3CmUxBwxRlpHgR?=
 =?us-ascii?Q?OYigicYtw5Xg0tv5CP/CN773tHfoxzt5oQAZ9rJT676J59OnnSNKidRb/snV?=
 =?us-ascii?Q?wVE0/i3DSU8wqX7Lu46LrtNFL7aPL5OnJlM1YLL4UappwTWF1MEK9d/5L5Ka?=
 =?us-ascii?Q?QoMuUifyr6HlaEkKovdUJXUBJjWsDfSx6hXtPHtxtnIriPggZWzdi4pUhakr?=
 =?us-ascii?Q?o87lSIb8VaVrk4cSgw8s2jDzcP1FQ5tgA/mT629T8mYygn7VGe6MXVS117md?=
 =?us-ascii?Q?8ZjSf1sPw94mj/EB9HRsNhK9qFsFtLRJT8c+J60ZcItzDqkkX4hnKiUaY1kD?=
 =?us-ascii?Q?1b7kV0nrsCmfNdsNV1UAEHK15aI71x3Hcb7M/DCTaAUf0wbTkKXbpH1r/ssI?=
 =?us-ascii?Q?56FKvjKuTNC5jYF9y3/CCBwl5G8R76SG53GxNSgi7+1ptsTUm9cm1A1QV0J5?=
 =?us-ascii?Q?3ZXlFCEaldJkljfr3JUY3M0kslmiFaszPO0JtC/lVKKyMDJYzIo5P055ctZe?=
 =?us-ascii?Q?pVPwJCLgyK56CpHnLxTpa6svoKuOdogqNLycb6zVMzeBR2O2R8hwqW04nh+g?=
 =?us-ascii?Q?+WDoNpji3MZ8jaMH3bbwUgtMq48VprmdtVdqdkZJom5hQK9tMzQRAw3u3FCE?=
 =?us-ascii?Q?hlLJA1rZYKXZednpsRoK7yDgD0B3RS6Wnsxi4i/DipnBfCEkG0MYreVvu+QG?=
 =?us-ascii?Q?vr5VApcWU8sEf8wx44SddjdO3na8HLH4S8PZ9h2ZejALTB3QigSWKBccWHly?=
 =?us-ascii?Q?a1EhOzHHEXHB5QttvnJISaQbSFPvS9GHHPZ4VIs1FK2m4AHM1+JuPTGR3LyP?=
 =?us-ascii?Q?41Wapm/WU2Fvo2meesEbGWWMgNlX2ucNcY+Tu4IQNw5EpT7L0NWnKCHPINjB?=
 =?us-ascii?Q?OwwqT0kZnFGiHEfQWVEipkWQRiW+yOdhFR/+6llSCyHgRckWmcWMX12SUq13?=
 =?us-ascii?Q?C8XKWWZI9HWYGe6cZVKcngJj2zl/ZXsPQYARd3w/QUCZ+iWLmvyQXbpQ0Jfs?=
 =?us-ascii?Q?KW7zrv8l9plgqP0SE4gM/G1oJ9eMoP4PCAowDdL+VLX7Nd/87wU5TDBS79mB?=
 =?us-ascii?Q?t6FQ2g7BrVtGRjrl8EayIjpCxeJWMG7/TosdRMIYTKuXb5zwg1LUnd7qsw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uBkZS0f4qJLPHfMOCZVvPYOs5DJRlfRQVr2KLkGGVnI0vVIvdcyn8uhFQzEf?=
 =?us-ascii?Q?VRXr6YA8Ni4y+y2/YhcYJYz4mVsiPAY9N+UXc3L+uEYk3qlo7XphiLu5mE3+?=
 =?us-ascii?Q?92yk2ytylLoieDpPgzQwWFv4D4329Z+9IrRkiOlK5OGLReBf0d9soGs8wx14?=
 =?us-ascii?Q?bWaxqyvl7dcwuQbgOQ002QGTvYasDyQR0gNsle3EEGFYa75z54ysoqbbF8Y/?=
 =?us-ascii?Q?4F4AfyTkufgKorseBbm7vw0oq7o9Sb1ixmVwSxoyhsqVBSVTXgCklDXggR5w?=
 =?us-ascii?Q?duEpRr88v8AxZCwsteP3cRJfLhHHkXCOsMlaadTUxqdSBIfHEKs4mULlubQl?=
 =?us-ascii?Q?LNJIYU3p2CAxI2Lcz8LesRVoND6MssyaIATpeCaO3H26vTTls08SvgsmsmU1?=
 =?us-ascii?Q?VWbbdQJLJpthuvzTVyS1j8hiP78V9xBZR4NEw1h7oRiLqYFJ6gj75bcdYw16?=
 =?us-ascii?Q?AbSJBSjVH3v8lU3rzwae7sTfcGTundpPFYb/8msiAdmVckjs7JMq1TIcei0+?=
 =?us-ascii?Q?aEwCruJ/B3os5xQvk5k5Lpcxsm7A7e3ud5Fscah3fW1rbDI5cwYjry1s61Oy?=
 =?us-ascii?Q?vaXEgDbwclNPKqzNIzPjFI+QVab8bXfuWKdXhjPxuioccRPWngyjCDRR5IQn?=
 =?us-ascii?Q?xl/DAPaTUUC3HxFB/J+HA57/MI2Id6HjRMDBVb3UvSan2ZpjY/meTgFlZGT0?=
 =?us-ascii?Q?uSOu5D7NAMkmA8BQe56+YxoOhPkPNgyhtT4W8UTk3WEQcfYTtxVEsL3vN3Ss?=
 =?us-ascii?Q?WRQ00bTfS/dpq1eJTrLChqT88dG7y64OnUVr2bdbJFZOnpJ6L7gcHayY5+sG?=
 =?us-ascii?Q?1eAVtQxW4m7rBW8es7b8FeKKH8YYodUO+oBCXLwkm8rkh+CCvJuMm2sY/7Sl?=
 =?us-ascii?Q?UpTJ9SRHOxklrY4caCD7atNVn0f5JH9KBavgydNeaLKaKfpSph7m+f7ucGUE?=
 =?us-ascii?Q?tYLEVGIumQxnKo/WOSyfZi1Ig8HCKz/VfaGNsSMTcFq/JAJb/PkUV2rdRBp9?=
 =?us-ascii?Q?jZBbglELMXQkPZzWgpdQXiuAgLl9Abacw7nhaMQPyLxDF1+HR9pqcmS+zHf4?=
 =?us-ascii?Q?UH2D/gshCoDYeWq2v5FYBj6zoXgED32EEiP6NueTFm0/5LQs3B+NkcKWYBER?=
 =?us-ascii?Q?ihSY8BpubngWDhcLwm1DfeuJG3+AVoM/Jv0mnktWpHsw+Mh4gt1K9aWwkUwm?=
 =?us-ascii?Q?tAK/Ruq3P4dc+NBeA6hXjnyfcIqH75GrukTSKhZ0vRrtZq6W71fzxnRKqFnP?=
 =?us-ascii?Q?Xp423ppjQv98N60r1MEF86MZTrmbnpKLp5KG2+xCjqgpHfQVxrVbuMoAwQqa?=
 =?us-ascii?Q?ikUMww09Oo+1w0RppD0U/dAavlpXAWoIcEkcDkhBr4e0jxiXmPunV+3tH8qV?=
 =?us-ascii?Q?oyBM0/TL9UHlU++Ib/MnMyZtkH2AYKlChUsLj424EyEO24fy8V7UCyq9b/2W?=
 =?us-ascii?Q?wMNG1P+KE3kxRca+GwP7nXJAkOqadRm33M1SCHZ/xxvvMxyOMcEL0M9cSxPI?=
 =?us-ascii?Q?eyo/r/iJ+POCJcMi5UaU01p6Kb3qGt5kx2UVFc66uIkjrxvZPKJt5kcQ2kPx?=
 =?us-ascii?Q?M03prh01qJ+/Dboucs9CINn1U4yDuSFncUUm8d/u?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a03436b-a0b9-4ad9-8bc4-08de0ef874e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2025 10:15:40.8839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJWmfK+62fK49pUtglMlMVnKUTQvIVrq2GXwYTlh2Kvgu0AjPO6/BHxZ0d7RhuJOgtO92QfZTjyMcmuQenD3dZsGO3e62yPqkrX4Zl+rCsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15869



> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 19 October 2025 10:21
> Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
>=20
> Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 40b15f1db930..e426b9978e22 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -591,6 +591,20 @@ wdt3: watchdog@13000400 {
>  			status =3D "disabled";
>  		};
>=20
> +		rtc: rtc@11c00800 {
> +			compatible =3D "renesas,r9a09g057-rtca3", "renesas,rz-rtca3";
> +			reg =3D <0 0x11c00800 0 0x400>;
> +			interrupts =3D <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "alarm", "period", "carry";
> +			clocks =3D <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
> +			clock-names =3D "bus", "counter";
> +			power-domains =3D <&cpg>;
> +			resets =3D <&cpg 0x79>, <&cpg 0x7a>;

Missing reset-names??

Cheers,
Biju

> +			status =3D "disabled";
> +		};
> +
>  		scif: serial@11c01400 {
>  			compatible =3D "renesas,scif-r9a09g057";
>  			reg =3D <0 0x11c01400 0 0x400>;
> --
> 2.51.0
>=20


