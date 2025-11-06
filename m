Return-Path: <linux-rtc+bounces-5275-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EAC39C46
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 10:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B907B18C6189
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FE530BB91;
	Thu,  6 Nov 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BglYsb8v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B597299A87;
	Thu,  6 Nov 2025 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762420440; cv=fail; b=X98NW8rjK+Uu+O4ht+FIftZL3ix53loStBeuNVnuGo6JXFOBN3UIjFWpt3nWHfjrWtEd10Jt+Cw1yIA15OlTviOqCSbrkGj/y8ZRuh8GSoXZFnYypsMGYKZHMgyRSas86rApsV/Vbnqpdn84GG0W7e6jIYXr8hcPrscQQFcqPsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762420440; c=relaxed/simple;
	bh=3ySehysmlZpB0/McbT9Eq02wliziX9r+jqm+DmOuK2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SY3Isw/Y+8zvZakKmGxM3I/wjD/BYt1CStKDTZQXFe6+PpqYVjJpOvKj3lcIhKdYQQyDCgRP9gEnB1834S5piyMeQB9CvsNHK1IdjBRGQ7oF71UH0UKOBMvhXnfYBdZ44aI/JrNEawoWm7dZmkC1xkaSDXb81Hfm7xYFsRDXK8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BglYsb8v; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGoxWvSWebkL3adESrWxAarGk0UI/HEyOpsF/Orvoa03X3hvBP2U3pvQ7i5JaKfLcINsdMHmdx3wHXdvECzB+8MMaTjyKhzEfbpUedr3EdToXUp4kava7WXE7PYAClM+Tk7I/4mx/z24yW9yVxNrt1AlkXB+Q1l3vuxuZvMpE/CCZMFIgdavAQkFSHcYqhH+HqnZ/lmPrntVFljfgaEm0ODxuLOZuB5Xx4XuLphPzUvcc4L96erAyZcyeVFnVFQnZcgKSbWrLG/5FE2sPyL+9cQOpAeAx0+yPFyOjdkIDKue7bj9OZj8LPBJjVNJ7f2nldd5nTUWZFoiUFxsxW7N8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6dRR7Gg0iqb+kbWXeHSut5tP6JOmjPcH/LIrvCWvSo=;
 b=KavTFhGlt0tfCqh7ppwvNVehfQeSlby/2Tv1BIi7vVJ//edjkGSTFdegBtfmtkthLBBnhpFPviq4PK5Sr2hViysrPzlJVFSmgbcwXNEtz58ye+Q2mLiYUbySBU1lmRyo1BgifURGKP4afvg1j3pWzyGNJdZZKf9DAk/ANIS4UyorwIFcz4BgQj7xO7UnP/eLq7qCmo+GukIRbOsdA/ZixLhb1/FmyF9KkPo+Ydl28Pwra95S339QjBp+bovt2A8yQzK/T6TG+j8eV3mlvFuyNoG7xq9OScFmmG8IOlnM1qiFJkls6zO6tEDfwBV6Hr4kKXeiSee1Y5ZvYLat8G/Hgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6dRR7Gg0iqb+kbWXeHSut5tP6JOmjPcH/LIrvCWvSo=;
 b=BglYsb8vC1zKGaZmi8O+ylF5HKbbR9IIrc3TtGg+FNoKx7t6VMLaU3X+LEKqa8qnAqQduWN38f7hPyKXke0fDFO+i+9sfh9+NwjjX85XHG4WygoKN16a2YGQhmoW3A/PomcSaT1bLADZqceTvVPtpCyl+oLTLBMR0CXK/sNsmvQ=
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 (2603:1096:405:253::12) by TYRPR01MB12822.jpnprd01.prod.outlook.com
 (2603:1096:405:1b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 09:13:53 +0000
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941]) by TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941%2]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 09:13:53 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Thread-Topic: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Thread-Index: AQHcTvn7g5PtoNGjykCoIqSvksJmGLTlWvbw
Date: Thu, 6 Nov 2025 09:13:53 +0000
Message-ID:
 <TY7PR01MB14910AA199960CAB587D3E9F1D3C2A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
 <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
 <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14910:EE_|TYRPR01MB12822:EE_
x-ms-office365-filtering-correlation-id: 845e6044-2b4b-4b04-ae82-08de1d14ce51
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZirAynrma8TFKYbfwWVfKS6vjVVKKj9Snn8o51yIpZbKfWGJIeYFSLc4smF3?=
 =?us-ascii?Q?VsY6jwlvGRNfpsF4t8i9xpqoAaaYTZErHevLV8kB3YljeQ0Xt2gKAfT7USQi?=
 =?us-ascii?Q?SBSs62uDpWfjoOaFRnistOHFaS6uLb7BqMWI7fbgdZUl8LI52NZeLTpkKFgV?=
 =?us-ascii?Q?jcGrBK5MDVwOBylOoGiiA3YSjHB/4Y28jBg+htVZcySX7GvP/+nVMiIp3K9X?=
 =?us-ascii?Q?xM1vK4TrCD7f5nbkulsl4khMaMD6A0L6FKb+SFdvKRSGULKapoKaIfw6rOc4?=
 =?us-ascii?Q?foVF1xkZ+RddArnccpP+XzvMIYtym58gUNToLqJ3nbjIO4ZlIQJ29M3Br/NA?=
 =?us-ascii?Q?Miz6JMchmSNV9dRd8AEQCJKwjyg496GwH9E/kz5PzayPdH0L2ny/asWDoGwc?=
 =?us-ascii?Q?0uwzjogdx/B+xSivpGyonxm7kczuy5/4Ou1kSDDUq8jbWUpzpR9nPMzO+mOi?=
 =?us-ascii?Q?EL/Nl9AkOZ3Nkrw51S7nVU6iEI991fhdW9fUlxWPNRimzSZXAdt2jWvuDSrR?=
 =?us-ascii?Q?D3RmbbRSHdObGK4K7bztTitBl1nKvCQtIPCx8Y4lyUt3Moss45p1ENNCiW2m?=
 =?us-ascii?Q?ob2dtWwl421LL4X5XJn/MrQQOgq/6V18uF+U8qqxIdaSd3flJozAyuDUYmWJ?=
 =?us-ascii?Q?Eoe6nMjozEmyM1eb9PRZfqKcV89XTtOVrQMUv8J+su7Jx9fjYy7nPUheCGQn?=
 =?us-ascii?Q?nFOsKXhojyTV179rAzLF0jeK+cEaVB9J9Ha7c6PZvS0An3GJQqM7B3l5enRL?=
 =?us-ascii?Q?bieFknbR8ozvAfi8lk808HjWXVXyE1IEAt2+/gtbJFeENFemEE+Pqx/uSfuK?=
 =?us-ascii?Q?XIg4brj+Qy9G2TAJH3PGd0aihACq1YggBpZdfw8nxxqK5q24teW47gDmhzJ5?=
 =?us-ascii?Q?mFGOBD7FFB6+l51UwopZYylUoCGGlBWMYr1ORfkx0v/UNDJwRQHA76TeLSGq?=
 =?us-ascii?Q?vlAd2R1194st0SokIexMSA7BnD0KuRLrBbgySLQim1KD+LVfxD8RKjFGUIYi?=
 =?us-ascii?Q?zzgTl0+c5AZ5GEc5HZD8f8mkdnpKqFwOSuopln9LoZZZR4ggXLUzeOBVTjtM?=
 =?us-ascii?Q?r1VVWeRxBK0F//rp+3CxnVTgsheklwcYfSp5lK4MElpKzNDpOiwJWklqn9mh?=
 =?us-ascii?Q?lZUqlNSIejhFKPTFq+P0PMSyytbvwN/sbPdBdv1c/l65ug+UwDYtPB56qAoo?=
 =?us-ascii?Q?6oacAHX/2wre9pBs6Cf9WkTPLZdNBzPLC11z0C38oFZK6vxayGl54aj5rJm/?=
 =?us-ascii?Q?ZZNkJsj6SDFCm8+krooTVUE3J1MTVn7I8nnO824dQQVP+aPvptjV7bmKkP1f?=
 =?us-ascii?Q?N9BWGm0z+V4IFzyyji1cLlqGj/WlK7FYwMM++U65nd1+KVQIwi4EXYR9hDld?=
 =?us-ascii?Q?zZLt3h6W9Euwn19SVZiSEiDRnEnUEgC1EQSdAYf11tsIGb/f2nv6GWmYHYw3?=
 =?us-ascii?Q?Vwz1tn5TFtmEM7j5LOA2wJ17BXGLfLYY3ATf/ysxfLaH9VZ4E85Eae78oiZ7?=
 =?us-ascii?Q?KskY5NfqihndZIgwc5HAbo807AalMXUVyZQu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hmT+ZPibB5NvrEFe7Q5WSCfo4KyhM/8vDaAqFjY+Ekip0bEh+fD0pRUF49Nm?=
 =?us-ascii?Q?iy+m1ejCku4qzRwW1PHc6HwXz6+9tN4QUPaBIiX1QWpZHVfpbWAvnf3mt2bK?=
 =?us-ascii?Q?SepAaalJC6Fy3AP14oM3lkVcfIlNu1iomUaPb6RcDJjljQxbcJwkEGKuQSyu?=
 =?us-ascii?Q?eFk0Nh0daABL76cgIeRoy16kSTP1Q0HOJRp4LFzEfxzqs3l5Q4WcCr45BATZ?=
 =?us-ascii?Q?TsoExw82/fJ27lTIJTsvGWK4/BE6+j5WqU5GzLa2BhcxccMEC5OP09r5LKQq?=
 =?us-ascii?Q?3AW11Sl3LYhjxZWliphsRqABq5GdtFd1t/EzPp+lObz7MU7kz04ON8T9+o9r?=
 =?us-ascii?Q?cQUxC/gNxCtlP4kUubRADm8t14mVynoMllWjiqnxDT6xDXp0gt0nCJOI/3Jp?=
 =?us-ascii?Q?ypgFR8k9etHUj9Ov/LGg8XpnTwtD3F5tRsNH93N/1VH4yS/G4hn6NmOjR+W3?=
 =?us-ascii?Q?pcCmyWSC6TF0h0kT9JHdhLWmtVGKgn320VjerOxIscPZ9Hi4H8V8juzzd36L?=
 =?us-ascii?Q?pNoNsvfX7/njVQLB83/nRiNfcK6lmwlrxxEM9IxL37yAgSMkx4iUcrDhTpzF?=
 =?us-ascii?Q?5q918BCbLrGyaMCKDwj9Skbp053ZLtmANt5VyPynHeuDxjw0dBKMVAz7oEdh?=
 =?us-ascii?Q?cSmod421UdCH2nLix/8VK+53X3oNZLClROQBP2/yx1F5aSr0tNJJL77c90h7?=
 =?us-ascii?Q?JRbw/AhpUUy6gStyTG8WvrTxfwFig4o1lh1qjNXdof61ZicOJA5F6fScnuhD?=
 =?us-ascii?Q?IM5hbB49iDRivkzjdGpurgI7C3FDQSjsHfshnthYgvvEdcl9NVgXQcY3JvEq?=
 =?us-ascii?Q?7V9SpLe8YViutAAlV+wBD/vMMJ25s00d1g5346j87VNS1ES6GmHip7P75aI0?=
 =?us-ascii?Q?+wv2OGUdOCzw3bMxHxE2eV45sdroLy4c/yvR+xCSrFIZ9vMFXh7XdV8xdoz2?=
 =?us-ascii?Q?/EBMuAk0/M2TZpAmSlHFpX5FBw0dk0kBZUus1Ro2OYYC4UiDI8vI/dkbWPwE?=
 =?us-ascii?Q?lbDztvWOME7RxKmjI3/+3/xjdi60fmhyTVFLsfFlDDukj31aKqLInLBIpd25?=
 =?us-ascii?Q?M2qeoep9B9sN+2lz9Jy642AbZE6Rlyf2lxvlhcsguc44oGe2fg57VOpOR+hS?=
 =?us-ascii?Q?vJROpxqXhI8iJeRcvdDIEN+yvYrI3YjDqSAvc33Ux0HiGxc/vgmkgN/Sm8MR?=
 =?us-ascii?Q?GT7rzApD74R/5cvbP7B6oYUE+prcG6oOt1oQL9BYZ+sDaPU3YJGpsYo8jTsu?=
 =?us-ascii?Q?XhrmXRwdwgKDkmZi1ikhjvBB7vgzYnTDpP5WUMtytG4SjCA7jkEOYlQeRUmK?=
 =?us-ascii?Q?amx0ikmsAepk59yawJpJs3VOr3QuYQ0JLlyoOyTrj5Ecg4W7APQ6VVoyYsU8?=
 =?us-ascii?Q?PSQTqZ1hOyiqObSJ6ZIjh+VAbMnXCWbXXSKlbDnwmwM8yECM0zoB/YLwKR2H?=
 =?us-ascii?Q?v8n1qh96PT/5AJHug/6OVIH/K2IpzNxvib4JIM2zhPnx7VyU8BpSVehT1WSI?=
 =?us-ascii?Q?4yIkBTx7FaSvpTTYVX0fAizZYWnjdUxYRKIiu1FiC/F1wk5c9AhrhEwkHN4v?=
 =?us-ascii?Q?3TrpJboBzt4vq7A765zW1xnGhUwHMMvmPhtvIU/TUQPkAE1xDk3AqpTfJpX7?=
 =?us-ascii?Q?Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845e6044-2b4b-4b04-ae82-08de1d14ce51
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 09:13:53.0579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rI6YzJwu74IUrWoLrfEYjPEWxaKSTOw84g0EagN/e4oQN4rNNjRdIhtQUbUWkBFGWufqMes6DlkYeU2sIye7rqh3UBMFqJTvEYAOiTrs9ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12822

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Thursday, November 6, 2025 10:47 AM
> To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>;
> alexandre.belloni@bootlin.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; magnus.damm <magnus.damm@gmail.com>;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; linux-
> rtc@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2=
H
> support
>=20
> Hi Ovidiu,
>=20
> Sorry, I still had outstanding review comments I hadn't sent yet, as
> I hadn't finished my review yet.
>=20
> On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > (r9a08g045), with the following differences:
> > - It lacks the time capture functionality
> > - The maximum supported periodic interrupt frequency is 128Hz instead
> >   of 256Hz
> > - It requires two reset lines instead of one
> >
> > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and
> update
> > the binding accordingly:
> > - Allow "resets" to contain one or two entries depending on the SoC.
> > - Add "reset-names" property, but make it required only for RZ/V2H.
> >
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > ---
> > v2 changes:
> > - Added "reset-names" property and made it required for RZ/V2H.
>=20
> Thanks for the update!
>=20
> > --- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
>=20
> > @@ -61,6 +63,39 @@ required:
> >    - power-domains
> >    - resets
> >
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a08g045-rtca3
> > +    then:
> > +      properties:
> > +        resets:
> > +          items:
> > +            - description: VBATTB module reset
> > +        reset-names:
> > +          const: vbattb
>=20
> Please add this property to the example at the bottom, too.
>=20

Thanks for your review!

Please see the latest v3 series:
https://lore.kernel.org/all/20251103121848.6539-1-ovidiu.panait.rb@renesas.=
com/

The first two patches were applied by Alexandre in the meantime.

Alexandre, would it be possible to drop the patches from your queue and I
will send v4 to address the latest feedback from Geert and Conor?=20

Thanks!
Ovidiu

> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
>=20
> In personal conversations with technical people, I call myself a hacker.
> But
> when I'm talking to journalists I just say "programmer" or something like
> that.
>                                 -- Linus Torvalds

