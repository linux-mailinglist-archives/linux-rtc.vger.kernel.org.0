Return-Path: <linux-rtc+bounces-5107-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB56BEFF13
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 10:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3085189E6FA
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 08:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E4C2ED872;
	Mon, 20 Oct 2025 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NeMe+DIY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE1E2EC559;
	Mon, 20 Oct 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948770; cv=fail; b=thvT1AwSDQHGjj8UcTVJYTAnMZjibyWVhMCH5o4rT0QB21v2oj+KoZ7HXx0eXYy34uIzNd0+1hiFypz5uGOOzeu/MccaHEeKNlQkQXHLR/6p2nkZCo5qONdjFHax0V/mKS3RuaLGDIQXkgdB9V1WGkelKl2yZjs82UXVSX0AHD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948770; c=relaxed/simple;
	bh=w70zj8XoRaE701vZ/d9Q2LRh1uuTn78tozI0x3txN0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KImU2khlhecRUYq6q/6QkhsXeTULR1t8Lf0r9fKU6JAO1UQOj8X+KN8oLqwHBoRZdzt8jNjhc5TgNJncRdBX1gInzkNnxw92Y1WMorwKNS3rXxlclHx7zPjwushD78lCyxsDd7+UKh+qbSX/jJQJMSIYq6YURoydajxqb0VsHMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NeMe+DIY; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFr655xnS0ln3emfv2bL/knKqfuBLJMIvIBkN93iUcsafQw0WKIj9Nej0SieL7A8Na/eC4HdOso1BhbFzbo9F8mtVPzSPi0r0ds5IXM84IxMKa8PxW7Ed2fSxYlOPRJMzYSKoksYQMnNuBSmxi+Pjt9JmyDOEUjIv0ab2l15+qEBZYxptDpAL0cjJvNBLCgSaBAFq0WoNGiwYSGaa6G0ULaZV5lfY9H90ff2k5zBhZRwDaDQd7PDc/fX50XrEtaiwlR/KyPUkNoiOL2dSz7HISz6ANFs8cG/HHg3RkvOGpLBnbgr1+ZRJYORDwf5P3aaItnTo2vv4sFkJBxEDULnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeFW08K6I0sAPnH91vi0zmMmOwMZMYPokMxkNrVH/eU=;
 b=Bty3eJOEUDpQyPoVpsI6QcUugTniFMeeogXvrGGYT0YlbJdl5jub8a33UxmpI+pigjXLN27CsQbUs5Av2bvr3d5fxYt7gB7C9FMJvxrRyq2t4VZaPxgdzI/zxe4cy69gtfVKIUyOJy75kINp4Qjp/NbVClNWsLrkuu6B2m3h/QaC6A2/iQ96f5qyfD4uH9exN74Q39vpQ1y7uEXAL0/Qsu6vkcdO19uVo6VXkz5NAivv8FNsyvEmaNzqD23u6KNAOpQQL4CTOR2D8rB5EkCknA6yYtFdzyWPyavBPF5rNYiEROFMSBRxVagmdywNjp/6f5CURF4Jw4LPay2pcjDfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeFW08K6I0sAPnH91vi0zmMmOwMZMYPokMxkNrVH/eU=;
 b=NeMe+DIYQBi6bcilfmURZ6HB9D+2QJVVkew0UgIH8odXT3hPyhn52cwF36lG2ah3vygFzPWjtFZ/Oe1HAxWmtmlIN6XK7KBiM5QSBONz/VO4tjmvwrNJAYsit+qxbhMvEuwTSVBbJ9NBIPT4TcJabe/gG9XPNoJmc3Nh/fnowyY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9713.jpnprd01.prod.outlook.com (2603:1096:400:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.11; Mon, 20 Oct
 2025 08:26:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9253.010; Mon, 20 Oct 2025
 08:25:55 +0000
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
Thread-Index: AQHcQNnpD+MZABpK50GyV5pRHAKx9bTJQMBwgAFjJ6CAABCSMA==
Date: Mon, 20 Oct 2025 08:25:55 +0000
Message-ID:
 <TY3PR01MB11346C43D1C7B52B2E8580AD686F5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
 <20251019092106.5737-6-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346CBE1C135CBEF82E3E7BE86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY7PR01MB14910BB6AD621CC7BA42D56D4D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY7PR01MB14910BB6AD621CC7BA42D56D4D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9713:EE_
x-ms-office365-filtering-correlation-id: 014ad684-9893-48ab-d50f-08de0fb24a08
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|921020|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?asXvmZ1oFJWsrjXDYFNdqObzuQXneULlNOlOV/9wnRc8b44pzJQwVew881Yq?=
 =?us-ascii?Q?JQ8NP8xVq20Bgx4r59SLT2dS+yJcIuN7Nbzbzfy/DOpvY9+coVSirhsEzjKb?=
 =?us-ascii?Q?oVl9/RNlenJf128P78cpeN1UelHb6wUOtiRU+LHIckmYPp1ieVIW4VTbxkX6?=
 =?us-ascii?Q?PoTh0LorBZK5Na3BkPDW0x+lYct5wj/Wq1MFSYmR74WopCm2H0/YTbLdFFC3?=
 =?us-ascii?Q?FY1GZ6oPdVfg+NfbkSmoDWvR03fqKW+ssm6EOwCIxXc9lvpGVyH/Ny+RS0RP?=
 =?us-ascii?Q?kqu5VIJTfcJwKm0Kyb7TS/1dGtAIZZ4pvVH4rc0jN3WaJwhliJJs5Uc9Xllv?=
 =?us-ascii?Q?543/eDad9IECp2FIRToaTqYrJaL1icapUxLlsu7UpmAitIFYSPva9XPhTmk6?=
 =?us-ascii?Q?B9IDWvQ5151pcILxewk32KrdiCaWI9ZDcS9r3RikyS0pFjbbR1IxVeaJimB4?=
 =?us-ascii?Q?VzBnhPm/Ii5E87kw8LE9kyPBpO/hn/hGewmKXz1BI5AcYxwq3WW4aUs5gXQ8?=
 =?us-ascii?Q?NPE7W+tkev34lphpgeQTeikj85Fn5htd51VF9a5yR1G90J6u4F4CoOZ4Fo3F?=
 =?us-ascii?Q?3Sd8ZRcH1NIvmAqrSF3zei9SbiwKJI6LSzGzgHwLvRdxJuBhIDXUHu/WSjKU?=
 =?us-ascii?Q?UgkM+i6MHymH+kVGBlbCnwyrXyRHDwcg/uPURRGYQmboPzjRErD708bNboZZ?=
 =?us-ascii?Q?o5+EpHG1glCWFhnpV333tOxQgiL9AJAi8nk6jDdflpZjutvZLWwpYrCpZF+L?=
 =?us-ascii?Q?uZRn6M73s1IkpI1nFVY+g5fLTKmKdFwGxX3yQMU7a6iknqp/R71NP7P6AMCB?=
 =?us-ascii?Q?f5WjCIcY7k3Z2fqm50DktEjRSM54inyQsFKx2IfMVs5gdtVSZG6fETzmSsd0?=
 =?us-ascii?Q?ItBr3NL8/OXxtSRBDSz/1yNr5O5yV6YVPnsaokYyxI/EXdFFKL+9RBWRTiFd?=
 =?us-ascii?Q?Hl2wFsQ7Rn5Rz71lUF715bUfgyvtL99qn1z1rdBIxJ4Vrb0/IWI83J56cACl?=
 =?us-ascii?Q?iFbu1NDsrs2TrU6O603KeJjB31dwERdBow/b39ygziA8CJtcp/uOZjYzCdVY?=
 =?us-ascii?Q?uDtiplX87I34PfgmwFOVq2UnmcLsIhfwXRhqrNe2roLaM83jIi3/wqwuJKi7?=
 =?us-ascii?Q?3xSLi14fSR3gL+Gu8t56aBMqvJnp6NaOe+FKxN6MEmwBq9GK+JQH6S1EqInw?=
 =?us-ascii?Q?MuZObABPTSdqkeffJmitovjBxJoJdT+qQVK5qnI6WKrXSfklnjbt1xvPgxo6?=
 =?us-ascii?Q?1H32qavYWKHRBmEIeTqPpOveo600mOlNGWGHrd2w8ewe+JrcyuP2GwIY4IRp?=
 =?us-ascii?Q?Btt0ujXHTFiKmvxk96xBjfprJTUHOPG7SaVIZj6hlaivGHBNAd7c/ZajyV/q?=
 =?us-ascii?Q?kidvm8vPZCHxzc0Qizz/0YBNMqsgROsEQ0L9wr2lE2PNU+hHzmZ1p4xntYdB?=
 =?us-ascii?Q?hTweoIGb76iP7vCbznU7bSEBhN/MHBFUgZh9989BqPUjd63wBbmOYabdq2+n?=
 =?us-ascii?Q?zKO6V0Mi+HLzeIQv6J6vZVA4OJ0YwVNDpgmZh7uOqrmWMmiCumsdXR8I9A?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(921020)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?chqzZY01bKnCFq02C8p1dFITvIFcX/dSeB1Xw90uD9ioHP8r3xPU6hVHGNPe?=
 =?us-ascii?Q?QioXdsmiATMsTeJRA6o5dSK9JlMSYpi05JAA4ldHsKgIBGTBWFsD3TH5TfoY?=
 =?us-ascii?Q?AvO8M8zziANcEADGZ5POB9hk1KC3EMRRnfFcdqes88lu+2tm1ltTnmRtU9Ba?=
 =?us-ascii?Q?79T77P21KMBc/7nn3qhI8r609H+fdfUODGqIEGbuyfT/L/Q51Pwb3LhU+IJy?=
 =?us-ascii?Q?+5hIMNQYQ3twk7aLH35X3riZ952ckpnQ7WOKHUFEEJ2CS2y6k3eaPBoRQ188?=
 =?us-ascii?Q?TArBCW113vdeWOzOVqbav79nU50+NCs4Nq8aBBBHRZZDx7j9e/pfXLZDbhbA?=
 =?us-ascii?Q?y61d11VHZ9uRR+IH3AmR4nxz7xBp8F1+anj35qmd5dS6u0EPB1vWezLt1056?=
 =?us-ascii?Q?4x1qGjtrpirXjFjKXiFl4yy3u9Z69wnk/3LSWpJMwcUQiPSeO/gt5G75K+0n?=
 =?us-ascii?Q?+JMFf2rD8635F8z3qQ9m8GPmL3NtS6nznxdZXH/2nObrPKAT090H4ho3E0nK?=
 =?us-ascii?Q?LEgAprBOiDlZm83pPXiznXeKavpT0ec6A4GEr+KJn5lE0XgKknfYejMB+KjH?=
 =?us-ascii?Q?Xb1HHBHzK/h6FiZp4kn4gKuZ3kMKnndLmhDBvw3+fMzc5+QFxcwRfLunh6Cy?=
 =?us-ascii?Q?ZIY2O0atgGvWd61Smf3ObzQZTnsYz5uJCGVhq1I8DNxLx5AlSp+cfS5hevqi?=
 =?us-ascii?Q?o2U/N37O58BOt6p8/zsfAI5+/7DnoWN9m9B/FPnKknt8PdveLEvg6qhE/Ib/?=
 =?us-ascii?Q?XhCnqinI4oRJ3XSMQEGku38d68/kA3RlftfqJCzKsnaSux9J1sZD6Y3k+NAD?=
 =?us-ascii?Q?ylO4eOhllGsnfJAVNLB74MIW6XCgazccFB9NW/6m+d99nB94hIieQE9vzgib?=
 =?us-ascii?Q?HS36YktJHMDdD4Ny4xdGXxcLGElF5u3lxe6XWu7S+nT4b+/X6/SZDQjly4+H?=
 =?us-ascii?Q?ZudOF+ecoaMmQbm0qH09nnj5mF8D4SDCxt/J8W4ufEWJkLclZIQoSCvwoRGW?=
 =?us-ascii?Q?9gdtcOvUkSYNzoF8cx8VHpqEaXquY/gvuGF/uMK+KgHiHKFrz1UoLs7kCS3b?=
 =?us-ascii?Q?8yueDB1gjgSjeasiL/67mCSVImReLbiV9Z0r1+xuKeOvXimTcx7HugTCT6Bh?=
 =?us-ascii?Q?bH9/pRbFvFUa/iMw4mwTQ0IwqQbGF1KbqDBJxd9uRdrStpq/LnXBJharnz15?=
 =?us-ascii?Q?O7U4c9SoeyqUOq1n6xalY1T6xt1ylflGidGnlhOmVlfijpXhFnyDbcvqNwbl?=
 =?us-ascii?Q?VcD/nBJpBmzQGNL9Yc8Ye8Jn2ookZGghbknoRwxbRbYYoPs57YhGPX7BtYf+?=
 =?us-ascii?Q?IpYD4ORl774iNyNt6G3daePtOzKwvmtd7948PGT/uBhVwyLEscPqFwOduUht?=
 =?us-ascii?Q?DNvIjz4iU7zzO0RcG+vku84bX0bWP5ssa76Yf48rYlBx5ORTxvCc56b6NJTQ?=
 =?us-ascii?Q?/IUDOF8bVr1QoS+6X9ZHP0F7NxaOHSzLB0iX0CcbTbQU8MCoQubNzMlRT/mh?=
 =?us-ascii?Q?hmcWqd5mqdlwSGeEteYfj/0zJMtk1CJS4MOKYvt1k1EXAWcTDqb1Cw9tWCSi?=
 =?us-ascii?Q?QIZ6wv5x5wwz3RR6etr1QZ17ipw9+CjoMIPWFifI9+gwUCFGB3unL+TxSq4h?=
 =?us-ascii?Q?ZQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 014ad684-9893-48ab-d50f-08de0fb24a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 08:25:55.3769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ziu00daz+bBQbXo1GUUm0IENaozCMjBG0TeqHMWxMSMj2AoiC/Zl0RYhkWns/Ur/MJsGTjARWkf+4RUqnxgDcHvIAO6oSBs76HomaGTc5vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9713



> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 20 October 2025 09:13
> Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
>=20
> Hi Biju,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Sunday, October 19, 2025 1:16 PM
> > To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; alexandre.belloni@bootlin.com;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de
> > Cc: linux-rtc@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > clk@vger.kernel.org
> > Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
> >
> >
> >
> > > -----Original Message-----
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Sent: 19 October 2025 10:21
> > > Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
> > >
> > > Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
> > >
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > index 40b15f1db930..e426b9978e22 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > @@ -591,6 +591,20 @@ wdt3: watchdog@13000400 {
> > >  			status =3D "disabled";
> > >  		};
> > >
> > > +		rtc: rtc@11c00800 {
> > > +			compatible =3D "renesas,r9a09g057-rtca3", "renesas,rz-
> > rtca3";
> > > +			reg =3D <0 0x11c00800 0 0x400>;
> > > +			interrupts =3D <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
> > > +				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
> > > +				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
> > > +			interrupt-names =3D "alarm", "period", "carry";
> > > +			clocks =3D <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
> > > +			clock-names =3D "bus", "counter";
> > > +			power-domains =3D <&cpg>;
> > > +			resets =3D <&cpg 0x79>, <&cpg 0x7a>;
> >
> > Missing reset-names??
> >
>=20
> The resets are retrieved using devm_reset_control_array_get_shared(),
> which does not rely on named reset entries. This keeps the implementation=
 minimal and keeps it in sync
> with RZ/G3S, which also does not take the RTC reset by its name.
>=20
> For this reason, I kept the rtca3 bindings without a reset-names property=
.

Thanks for the explanation.

Cheers,
Biju

