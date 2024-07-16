Return-Path: <linux-rtc+bounces-1520-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295A932489
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 13:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294CC2833E5
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6FC198E75;
	Tue, 16 Jul 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WkXHJY+/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74155897;
	Tue, 16 Jul 2024 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127629; cv=fail; b=ZY2nxXdz8RhCcpOV/zYZFmfujEzdkRDDP4hn5mj+rLI0lJv5PWyRHiDDv34RsbAVkDgpcK2D/fP52PBR7g/y1Hx/+uR/+zHtArbRvWo5EHF6QDQzYvLkfdFvDUS24o5p0KQBHBT8jucphcqLpRQx5myRT29mAeF/qFQpO+xo9V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127629; c=relaxed/simple;
	bh=2ywnEYsYOqRO/GnR21/NttY2o0DtkncH6/pYmI3nAgg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=awBb7G9LsYJJ+9Ou8wOPBcvYqbLYmsscKtnJ/HyBlbqKLigdqVRNRgyPzm+onyufxI9e7Ufxt1SWTQ7Q+IkmaCdnChsR/Bj9goNrWGlQ3tel63GCcq+/7fZppJBih1NH3GWiOIUOOcC+h/mRPc8UiECGg+j/5JWon/3mCRXp/4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WkXHJY+/; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVJwChShDkAU2M6fAiujOJEdJCiWk7hzr41n2hq89X60YPHwHQmcd1FnB2Zr6W+upJic24+xJQcOxlUmOdNHBcDOc08gFnERbecETOg2+2uo8dJZ1NWzRNsOfVYPN5SxUBGbRcJ5/fhBDe9lnxRIgjLVBRQKbJnldtVMaTZnxMMfiAmOERX5IhJ7WV5ngSROgYTTzM4L9E4B5wGV71Z3Htw0sELK9OyoxoZA4+ljpyF8VNrIkP6peKuqKwVSWNhvcLXXar/AIqnoNROpNv8lYnKu3Xo33FAWYLZ+c/a9AVUEHpdYmnCFjgYTQhZPsL6dVxp/8cLeLyctZRo57iknWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QWtmvxme2DQx/d/cSaJWDNY0Crpc6Py2gYETU50iwA=;
 b=nBcGSY0V6b4Vy4xF0wzggQV9ksCAwhrrq9aV2GGFhZHbMViMpt7Qrc0RnHd/5s6GJ20maVSe0GGM7spOJD2aGR2J4E42AxwMy/FmEPKz1sruJCEAHW9PI27GsOqO5zvXqNT5ItlebtfeO/QBCLS+tm6xJCjPG8/aRipEV7ZwlVNtUpXcKg343IWGwdbfj0gAaFTMkWx65O/jdnHh6H+OlNkiyFzptT8FZ4a22523PdGeAUGtmdw9FEjf3T7HO79GEMIFs48Vkj3Zcfu+z4rV9sTvZujbPoJxSGgTkZtss9DlPn7O4908wlPrB0kIqgGObI1HIza1lmaOdblNXdOq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QWtmvxme2DQx/d/cSaJWDNY0Crpc6Py2gYETU50iwA=;
 b=WkXHJY+/aqDvy30epRjT91lke8Itq1zg//8KwAjudHZ5M1WN3JkoJo0d6W8nojwBQBHbvak21PdKRZnqFQV6eef1I1gYlpElXQqa9ARSikjE1gJuA+Ruml1q1AITqrCiYtj/Yr/0n7csbzO0wuD02grHjwnOnywE934J2q+5ctI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9903.jpnprd01.prod.outlook.com (2603:1096:400:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 11:00:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 11:00:21 +0000
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
Thread-Index: AQHa12tDxiFdQX5gCUGHOGSoT2m2RLH5LPRg
Date: Tue, 16 Jul 2024 11:00:21 +0000
Message-ID:
 <TY3PR01MB11346ABDBA306410646D3861A86A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: b389d543-8be5-4d5d-d1da-08dca5867cdc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kXvk7BeZY20IQZX4hWQYjqLUOK+TKc/+TBA5Ktb/vnXdYQFWGDcmKnLMYVDD?=
 =?us-ascii?Q?CLtd34tzrFcmk9smZzQuXfNMm34PyNaov8NPIHLA3VBf+uOhhLgX247IiyH3?=
 =?us-ascii?Q?VAmrKfeB9rURnkXxORabk9QBakOgL0E/8ad2Cz13gHxhOV9NV188SwlVuGTI?=
 =?us-ascii?Q?w953YFVnScN9X4wSz36T7SteXlkt/YpONLbBnWynK5jOSATP0mMAlfgKL39N?=
 =?us-ascii?Q?pDdp56qRuFzL9McEZaIXNP19Ze7Ymw6YYEy9hXPXxDLcwaBnsQOtr0m/vAp6?=
 =?us-ascii?Q?4P4GJ8nMSg/oGBV+LQO2MzKuaeQciNUrdyZ1jdpW0Y1+rnUytK8BPPNbm1Pk?=
 =?us-ascii?Q?LhPnFC5l1BcVRTpT5hKnFME6j9FSqLP8ljinVoQkGB9IHO6JL/92R2wag+5j?=
 =?us-ascii?Q?U49tKBlpS+mxgoQKEPmvztqKgmXVxVonNFft9E+P8g8PBIRIyp8IFEsUb37a?=
 =?us-ascii?Q?pP8I54+i0VsieSsrQimuRcfWyBmMtdE40Tq4ldIZ/GB1r845LYyleQwQ2raB?=
 =?us-ascii?Q?h/t6prgRAnx2dTBDK4/QHJgWCaLppEsOjbzqI0Mxti7YyJnKk698b1GsI7WU?=
 =?us-ascii?Q?bz9F75hbQFKxTIUCGeIlkiTwKTquOKnjVn9zZGBeVoiXvz4AYVs+O8jAivAD?=
 =?us-ascii?Q?SKwp2494WGETyc6UYCOat9e+42MzLJZyYoNsGPVplgH/xN7+ozBiPDDoGGzC?=
 =?us-ascii?Q?JH5NAb6gi6iWO8zUvd1lP0ctQdlXCT6cpIMRq9z2OIdcoBPznGmSw842qsf+?=
 =?us-ascii?Q?T5TaAtzRiHCcSwb9h8fuBEuijwSCBcvx+WWGHMJjwkUm1Hu9dGX1pWRCsIxo?=
 =?us-ascii?Q?xFZiqvrQWlpOntLRKOMMFVToyYy2PBVVY0lWeePsgKCPbdfsSjA74KKWIsC8?=
 =?us-ascii?Q?hky6i/2o11idEqqeGqQIlKbnkqOy9KLu9cemfxhEhP0dt3NM08Wau+DZ4uL5?=
 =?us-ascii?Q?RIuFmg8856kmWDg2PURFkVXGlMWJWiM7Spa1EZJCnCdDkZxxN7h718ZhTvoP?=
 =?us-ascii?Q?vJAm6kJwDF7h0d6lL5dR8vuLLOlPA60HCnVWJvYLqNOj4EKQYvnRQ+7h0Bwl?=
 =?us-ascii?Q?ZGKAgBoKaraqlMlCgJFYGF5YxqMZGTW9tNxSLXTp3D2gJdPfXJI+5ubx8SFW?=
 =?us-ascii?Q?PM3DSiPMHOMaRD/1h0C8bVy4Pcgh19i7/lCRW2sl0kD6whvEIHrzqo3PMfD+?=
 =?us-ascii?Q?0DcRMHyl8gJAGrc8SD2tpmAz/higXTwCbVLk/y6tiMvSOHnWoZ4aqFTgSTFl?=
 =?us-ascii?Q?/AY4XwqX7QTjomhyVCwoP7/Svt8yb9iIUtQLjGX29Z+rH5j09kf4jOhCrVQn?=
 =?us-ascii?Q?9Gg25A6Qi5cBr9+lmnl/biN+7u375RFqitAeX7G+B0NARPWsXkfKBfYrf7LH?=
 =?us-ascii?Q?JTvRkRkjrz+irvkce4csS3YmmseT6mZXNGEc1G3dMYQKOR3EBrHWHyRVK4p7?=
 =?us-ascii?Q?Ek4s7a1w/ko=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IK58bhSSNf5japrHqweo/6D/YSpFUsxYu7cfmseoCsUoobM6dZEMRskK+Ogx?=
 =?us-ascii?Q?K0/r3hM4c88SRdu3BIce/ICe6Evwo2tf2BS13/bpIy1sFFvZwFvYMEhnASLc?=
 =?us-ascii?Q?3kSa/Wf52QQW5evZqjpNjN9K6AVUrM8ozoYQLMA8GaJ04zJmkvcHKM1JXv5u?=
 =?us-ascii?Q?CkIeOv77DTml7HLimK2ko4gDCb6pUFi0eAbeX9Omjem6rJdkDRgvqWgUW5k9?=
 =?us-ascii?Q?YIoU/l/4Fi21UUwU0KQqEkvlMV5JTrlNCyW32tJAIdsPrRY0/EntZa1pQKTq?=
 =?us-ascii?Q?Ti9XvGAeR3SSZzzCGQa95hnaDU43qwEPm/0aQtjXqz7HVevaBQiOwcsl87gf?=
 =?us-ascii?Q?KopBE8vDJVqpLuSURwIGK4PvLsw5Jmv4cyNceLhREifBP6skllOujkfkKReV?=
 =?us-ascii?Q?V8EK4ptmyhBE68PQcprelf2RtozD5w+JSKuU0uUZpxvSHwl4biARzltCRrmu?=
 =?us-ascii?Q?NZu8GpK/yR4GcN9LgcS59KBTqqktZuJHj/9pLcIViU3hLwkuwqVqXGCcpbgL?=
 =?us-ascii?Q?7/JawrYX1PwB+OPZu96sNjIbukwAqQSGPhnowP4OCwwury9U7FgTYUZNYkDY?=
 =?us-ascii?Q?oOsfC2WIxuspmDfRG55/fI0xq2ztB/bNon9MOPLVJmn9FqGe9JZ2hU3Td4sK?=
 =?us-ascii?Q?9/gixqSAhDXuBiAAflHUNQMemLRZGQK5KI1wYAR6XvOtiGMBM/cI4sgffmI+?=
 =?us-ascii?Q?m7jZAv6T6jrmv/CLRuu0yplXJof7uMQUEluQGJleaw0/Ykml7AFYz9ydk2Z+?=
 =?us-ascii?Q?rwTKzq8PZqor5vPJt9uKWx2W5tepnojtqo14NZkGz7KTuusScQ5XHWgVwkBx?=
 =?us-ascii?Q?6AiKd8AWHG1wyTEDAE8J9mpLqwTpQom1GmkgPyftjFnc3ykOwP/VNcLZ1E/q?=
 =?us-ascii?Q?/a4Kcu0lVQGhpBuUV45pJAesk2EFWkV0N8qq8MuegRC3JLLB9YenwX30tAVL?=
 =?us-ascii?Q?8aMP+uRv2HPqIAV0YLMbRIAfllgNQnBc/w2eoRnXZA3275A/SmNCkdBBTQf9?=
 =?us-ascii?Q?qU4kQtkEk++lQms1M/5hlivrJA9OD390w3q6uX8e0kruU+3oocKFQV1EYEot?=
 =?us-ascii?Q?5zt3hnvcyBfQ+1BtzyY233oorHC3huL0QidlDOcUNQAErDtSoSZpehObbapS?=
 =?us-ascii?Q?ToBOZhP46+OKybm8AF3w4OXR2/vW2PWGPQW9+wQLKOw/Vcr0c6hNw4fhg2ok?=
 =?us-ascii?Q?C0F7sMy+P6acpT21Zvse9Fhcx7HHrhFXC+39ARjts+X2UgdwW3+8EGKj9EfS?=
 =?us-ascii?Q?i7UL3WDbbyaljTUCo886AUY6KXtsqF/uZkQcF+JjUcF3pTYnU5HK8KlJJZyY?=
 =?us-ascii?Q?LWPavgjzEVfcHN35fjq3/nip613udFPJIr0X+HnbmwU7xoRr1SaRmAwtwWIs?=
 =?us-ascii?Q?/bUKpq8+FugNKbti/N5GHrdS3Havnr4Zu2CQcdzdKpLOWvQ/s1Zf2TKEPSp2?=
 =?us-ascii?Q?DQz9kb1u/DNVfYpjbwjIB8ASelDQFbANLUXgUVCOs/9J8hBxTV0f9eA6M3fB?=
 =?us-ascii?Q?Jv9ndSKnKAkyhFkhQ2N3dpJTzwIX6/FYAAIUa/zQXRCboHdY5vJpqwPn5fiv?=
 =?us-ascii?Q?AJpKjN7Jr7hqI5hsAktv4qvX4LfZnNZKAXnhUEgXbAe4A4v/Wqmi+ayBgYIx?=
 =?us-ascii?Q?IA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b389d543-8be5-4d5d-d1da-08dca5867cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 11:00:21.8774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOUs9+3FPrbhxDD9gELzlAa1oJCS2PAObpJRXbe7KzlXv/CjMM4LswjpkzBpmddRofWe6+wpTlMlaRFaZ8x1RsAyESxIuZ0I2Id/gcCFpHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9903

Hi Claudiu,

Thanks for the patch.


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

There is no MFD calls??  What is the purpose of selecting MFD_CORE??

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

Drop comma.

> +};
> +MODULE_DEVICE_TABLE(of, vbattb_match);
> +
> +static struct platform_driver vbattb_driver =3D {
> +	.probe =3D vbattb_probe,
> +	.remove_new =3D vbattb_remove,

Maybe remove canbe replaced with devm_add_action_or_reset()
That simplifies probe() aswell??

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


