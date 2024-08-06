Return-Path: <linux-rtc+bounces-1666-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA49492B9
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 16:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C23B2BC00
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 14:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD52918D644;
	Tue,  6 Aug 2024 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lwVAZU2O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35418D628;
	Tue,  6 Aug 2024 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722953494; cv=fail; b=bFFlmpYejvrPEzVfeptj+OOJMJ+SBxZZigCWRd5y2bE9Uuq4wZO2LNeMwqvgVt7sVu6ezUtqHZhnloedMp95Mi2WJgJsRQnYSy0W2ppPONMWOf++nYI5vI483e+fGzdSxjydCqvAl8p21X6/CSMHZvw7Z8RQ5vzvw3qVJOkyats=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722953494; c=relaxed/simple;
	bh=9wPK2KlOON7995fryHEHvLh61pXWzAr6u4BQd8SBrWY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l8wf9Aw+hD36bciuskp2UWNUciCqSNLg8Sap9iFakBC0HUL40cYZS8YFRZyOGF9zlBHD7hI/TJ0iSmosaV500z7GqYBgoAiczlJu81n1Q8UBVeV6yasEutvt2CD6UuRJYOjFYtE3M34mInGKMez59F+pliY9gxNT6XcEK0xP1CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lwVAZU2O; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCXhgoNihDuYp4nDjjVx5FBeoaRs/6BN4TewucAoMJtIi+qHOyPcvE7jGKhWK3teCgf1k09uRTDP8gnDTMUMMmDpqrkUrHC5mEs17ey1fyJkegjrGV2PQJfZf/qzgE0FT7MiuJLfb9QeOYK6xuve+coWuTruPlYcEcjPNadPmV9neWaKUbf5Uo8nSajvQVwB/MhMjgQQMKJ6BAu2o0vUlF76/YycHx1L6laW9lt4CJZmqxHSGVun79+B9j0G8dJ8u0g2BsyayCeriWjxcMNUWG8XxK0cnVpAH6uzU1XWwmRyx5aoaNl8NjJTutYV29/AIUGzNRsxmuoo9K9wDAPv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvrCsghJaDjp2UlpetSILCkhzfdLcAfXu0Sy+m73at0=;
 b=QYE+13QFzWNb9q6rsiRQqayoD6sgosQJE3iy6rw21EoMmCqy74zWIJQWhsZa8vX0eaYPn6LEdS/kdEIvgoDf8JbirZfcI+OnPVZ6Lc1eUU99c8m3ObIMTm+erOK846A8VhvED8PbHpJ9e6TBownBukVIWDzjsv2PPzETGChEm51hDAVVKAfmcxpRLWYTxfrkoI+tyD4eH8CQQtIXp+h7IK2qRhOFb7jGCquoHst37yWudP99QzL1KDuNP74B792GNWqONwDzrb4Sc/3tr4cE319XhBjEI56M8Dp0PtcbW/KY3+h5vbpE38eX+3MYiOEGBkb2ZhDpEcbUhR4z+sO2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvrCsghJaDjp2UlpetSILCkhzfdLcAfXu0Sy+m73at0=;
 b=lwVAZU2OzOCnlDJ9RyngzfIz0NsSW+0YFwQqjOorgIku/R/fkX2T8iqlga0sW6LCDvaEle0nGIC86rQeVcuPibo6H4fPazAp2hiL/47tUP8zlGONGzWHcYlSA8gKOg2Ey7+4V/2eSjKVSWbFEX6ZSXZTYNxVj+YgCizCXRa2+fK8KniejPr+claijKVqsWqlwGDHkL71N7IZpGUektBIRDYhB68eCjIAsFgfBVPJZCFpOrdqYVQekekrKhEcr7rYTPXVhol8bOA8XpGL9dJiFCd6L6EJvSa61ej+J/PTWoHbopflKsJkGGdAUOF7CixHJBls9M33YrC29+PL00z1hQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9945.eurprd04.prod.outlook.com (2603:10a6:10:4d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 14:11:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Tue, 6 Aug 2024
 14:11:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Topic: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Index:
 AQHa40fZMc1qZndYQk+4NNhqZFIIlLIQ3I8AgAAZs4CAACEqgIAAewKwgAN/koCABTtbEA==
Date: Tue, 6 Aug 2024 14:11:28 +0000
Message-ID:
 <PAXPR04MB8459473139ABDD1FE25F80B188BF2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zqp0IZfUobg6dq8G@google.com>
 <PAXPR04MB8459CE89FFF5662AED66D9AA88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zq3KkwhB89zUfAjn@google.com>
In-Reply-To: <Zq3KkwhB89zUfAjn@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DUZPR04MB9945:EE_
x-ms-office365-filtering-correlation-id: e06f8707-406d-4fa9-3056-08dcb621aa01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6nxyQfqWTsyy330hNtPGpWBKLDxEO7e9VmIgHVP+DWoVTkh+0q+aPQ/0q08t?=
 =?us-ascii?Q?Lw7btJmVWmIhYxAl7i1QGtLNf20erq156yWNUvc7jJBTKGJNlndtwaJn/Z6e?=
 =?us-ascii?Q?qF89zyYaDtOpb4tTukbzSwNy20F6lTnfLLuveMr1+qAzmgKD55sykw0+Gbi2?=
 =?us-ascii?Q?K7+cEUdfqxpurTWW9of00zkZZPwpIRq8KaYWqxPIjfcAkok+KB1+pkxt2qX+?=
 =?us-ascii?Q?pCjb8E0OK8Zf0XrVFlakaUl5B6yIshceB33vbXYj6YKo3VMXGhUDyNZ7E1nL?=
 =?us-ascii?Q?1U7E80zMwYHm2akJlOYXVynyErlRRxtgsCrtzD18wB3OMYyxQOKkVW66HhTO?=
 =?us-ascii?Q?dE2FacYjzKAX/6VB+etWzQBtpTi0ctStNdMEwRDvQE0PRfTA0w58qKqW3098?=
 =?us-ascii?Q?8cw4PoBmXJV/3V9TtLT6iS9zZggwyUQXgU8ORCB7oKXc9XAEBR2UqDubKX/E?=
 =?us-ascii?Q?n05QF291XMMoE8Eo9eUnO9mBYNe0SwVmDOElOHaM34+40S1APWLwjxU2iW0L?=
 =?us-ascii?Q?30VoRkfRjIKD7HkHWw2JHVRGbz6/FTs0JKAtOI40xDGoAR85p+dRUPY0w91J?=
 =?us-ascii?Q?XSnmSN9sBFKs5tavQgYSDh29pl/kP/joH68YDHPnNQtA3vWUWtoEK38tCJj9?=
 =?us-ascii?Q?ixTOnA8ixpm629RD8T61LAEz0msp1CxWwpm2S+H0kNozqQ09Dv2HSP7O3uZr?=
 =?us-ascii?Q?+SP1pOG/shSMqHJ2OYHbAUZ60fyVE/MxE6SgNxMW4Y43qVVlt4KK5qbAbwRm?=
 =?us-ascii?Q?TF5Z90b7okvgXmsqFgxsMae+tJ7ohjlCnM3N4yZ8ovagEU2aBYMpkwf4WuLA?=
 =?us-ascii?Q?tkG4w6uvLie7+Gqc+VdLNxUroU/3kNtkRNbYik2cV5toOs0fzEEof25xk6Oi?=
 =?us-ascii?Q?p1okJS6S+pZw0qDzys31UfW1FjoZhGh3rRl0k55cXjmHjyISTK/CJTdLnwEr?=
 =?us-ascii?Q?yk0WkC6LAOpC0d9qfGC4nfxqBemJxEhV4dd+QFrmY3MwxLZooEx0J2Zt9b4k?=
 =?us-ascii?Q?RXmqrAzwW6F146/PWaBlshmr0tmDn5+uuqSwn8JfyZih1Fs4C67B6w0Df271?=
 =?us-ascii?Q?4j2ppqDW+J+DnSBFFGjAXgeDgNvVYmR+JrZsrtSytB8cO+xrplIkjPjiryQn?=
 =?us-ascii?Q?QWFe8vszlKxRIHbcVwEqnh5nTN035+c2ml7RKLCpk+kImfoyp+jU64Pv50Yx?=
 =?us-ascii?Q?6XQFxrvz6ax0VijzgQNKCrQxXvK6HUGHpLtMgQPb8HrrYEE6Xa1Nx9aKQC+g?=
 =?us-ascii?Q?SZdQu8zmI0HpgGcRjdP66EaNG8ylbNvnnrzIIcrtcscf8BrWYGuOYZCGRJ+Q?=
 =?us-ascii?Q?XYf0NC7Iq6r/deVMFJ2voC50sFUeXRhQXcvRIVqcSenHx3/EQWdf4lOEnXxS?=
 =?us-ascii?Q?cL9JT2XXDHhG5REi04ICcOaaQchaiupOQPf/bRHb7Uyvh8rWuw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E0Q0AC4sL97r5pr6l3QCwtbvrdwbdfi0pyY8jGaxN5J2/HCHLWKCMsZoj6BQ?=
 =?us-ascii?Q?ohxhXXxLdwcQVzpj/j4vQSgXBIRul7eAbaBXGWBtj88Atpzpm4FZcvBT5Ot/?=
 =?us-ascii?Q?johmFarH4C9a8bHzbNxN8mYKzXSNT+wEP8B5GGzG7xxwx69t4a+6NyN0Nin8?=
 =?us-ascii?Q?8lpQAA+08DIUzhV3DGCsDKWytjy+87bheY5wgNT2enKgOfHVqBTvvibzIaSM?=
 =?us-ascii?Q?AyeaXrCqGDOJVzXTnYVSWlpFZlfWHq3X1LZ/AL1iWsyJ1hAszAKUuyQ5nZBi?=
 =?us-ascii?Q?qoDQoh39LewAuC3tqNELMLmyJNEKL6pBEKsKdH+7RnxCvj6MaJsguseUG1Ts?=
 =?us-ascii?Q?5M/DThLmCaPA0wp7zMQzwkJi6EBpB8ghmo94oyeV6mD1Gj9VlxFiyCzgQgGy?=
 =?us-ascii?Q?viVpkAZd0VazZ+uorCRhwo7kumXtVExLcqjxraPUxGQpRTYyBlPVtxG6PO0H?=
 =?us-ascii?Q?YlezU0jM6v8msoN5VBhjODCDVhYhhprxAfaNnp2kBhcvNeQ10MEtU+e3lAZZ?=
 =?us-ascii?Q?lQ+fjycP2ZWcCPs9t3pA0STsc/2cQl1kY93QP8Ej8ACllzh1/tARq5riqtlR?=
 =?us-ascii?Q?ntC+QpPOIJvuUrGQaiKZDH818xHXuUAKjLe6R0wrV1FjRYOpeJ2OyfHvy6mA?=
 =?us-ascii?Q?aotA9tf8dUGLHvwCs8WnpMHYmZjbmn3WzEt1nJmMrv0PDHOTuNRLMPImtjyA?=
 =?us-ascii?Q?kDYIu6xvQm6UdGC2vLWg+pCsoz9DE0CBx4Er3+sw5ukBKs/FNbuHHv1LKo8A?=
 =?us-ascii?Q?TMo4Mn8yg4GYCeqVdiN0L5mUBAhr515gVrNtVS1yQt9FK2lxF3rCg9PhHABq?=
 =?us-ascii?Q?Eo3DmgfQvNO63qXOxa5eZpQCh5aanfWQGx14LAz7/nYpAt8NZxAhpcsqEEWs?=
 =?us-ascii?Q?rtXDlg04mL1IP61oJrnlGiJdGzGVTKXs/xXH2FD7mrguQdkenjz8HN+2ygLj?=
 =?us-ascii?Q?AixZkqmp7S/G8DkYgkov/DNWJozmQBVDxPTRJrAgOY3PSh+C3lVxvenE3Uo3?=
 =?us-ascii?Q?R9CD0QRm61lU2z/GGH/M1TeOYXyahRvzXsV+CnM8yBbMvr3A3BBE5BeRch5G?=
 =?us-ascii?Q?YfFTCGSpyRoKSrXolOnb3JZIumo69XhKF+oKNImnlDL+34XENnyNF21Hb7NY?=
 =?us-ascii?Q?zYJP4n62uswGzFGryo/ojZhH26FPxg+bDWb/cipBPbB1hbFJEZwOoO6ohXL0?=
 =?us-ascii?Q?Rn0q0CIHF9KU9xvYZ4ByXamTXzXoLOVmVjkBeiOypHXHRzMggKZcYWXAe1fU?=
 =?us-ascii?Q?qMF7E7SWum3J7agtI/rjGPAJCphSbfOwW1VRF314qRJffwcWvfY+8leoKIMi?=
 =?us-ascii?Q?h9eyMqAMoIj7eJ4MUxQNIBkZMfaEOYG5mMa9iIJZ90FzgeQPTn82M2NyPbnw?=
 =?us-ascii?Q?c5UCk0VdAIoHlZB3IT+TcPYhoyemFFSW536T4y5QV9c5zvP39b3imhl5RD+g?=
 =?us-ascii?Q?WOb2jwMWoNy93a+UyWHXBdwvcplzm/h6mVy4PtCmH995L6dXVJrWmk32LnzT?=
 =?us-ascii?Q?XpPxb7AVwdwJBB3cfNbFggY8hokMCXfa/G0u3j7qGBBBjV8fLYM6Qg1ejf1I?=
 =?us-ascii?Q?X9x3Hr3ZgCRDdd42E2M=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e06f8707-406d-4fa9-3056-08dcb621aa01
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 14:11:28.1643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bThEzkKCe43czb6mdWmZ36d13ewXI2/y0Gqz3tbvQKgtsl5mYQWT7WHzrzn40WDpkMEArVY92EEPM0DlNuqkLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9945

Hi Dmitry,

> Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> module
>=20
> On Thu, Aug 01, 2024 at 01:36:10AM +0000, Peng Fan wrote:
> > Hi Dmitry,
> >
> > > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > > module
> > >
> > > Hi Peng,
> > >
> > > On Wed, Jul 31, 2024 at 03:37:18PM +0000, Peng Fan wrote:
> > > > Hi Cristian,
> > > >
> > > > > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95
> BBM
> > > > > module
> > > > >
> > > > > On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS)
> wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > The BBM module provides BUTTON feature. To i.MX95, this
> > > module is
> > > > > > managed by System Manager and exported using System
> > > > > Management Control
> > > > > > Interface(SCMI). Linux could use i.MX SCMI BBM Extension
> > > protocol
> > > > > to
> > > > > > use BUTTON feature.
> > > > > >
> > > > > > This driver is to use SCMI interface to enable pwrkey.
> > > > > >
> > > > > > +}
> > > > > > +
> > > > > > +static void scmi_imx_bbm_key_remove(struct scmi_device
> > > *sdev) {
> > > > > > +	struct device *dev =3D &sdev->dev;
> > > > > > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > > > > > +
> > > > > > +	device_init_wakeup(dev, false);
> > >
> > > I do not believe you need to reset the wakeup flag on driver unbind,
> > > as well as in the error handling path of probe(). If this is needed
> > > then driver core should do this cleanup (maybe it already does?).
> >
> > I just check the driver core code, you are right, there is no need do
> > this.
> >
> > DevAttrError:
> >  device_pm_remove-> device_wakeup_disable(dev);
> dpm_sysfs_remove
> >
> > >
> > > > > > +
> > > > > > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > > > > > +}
> > > > > > +
> > > > >
> > > > > ..so in v6 I asked you to add a cancel_delayed_work_sync() on
> > > > > the removal path, BUT I missed, my bad, that indeed above
> there
> > > > > was already a call to cancel_delayed_work_sync() associated to
> a
> > > > > devm_add_action_or_reset....so now we have 2....also you
> should
> > > try
> > > > > not to mix devm_add_action_or_reset and plain .remove
> > > methods..use
> > > > > one or the other.
> > > >
> > > > Thanks for your detailed reviewing on this. I will wait to see if
> > > > Sudeep has any comments to patch 1-4. If no comments, I will not
> > > > do
> > > a
> > > > new version to this patchset.
> > > >
> > > > If v7 patch 1-4 are good for Sudeep to pick up, I will separate
> > > > this patch out as a standalone one for input subsystem maintainer.
> > >
> > > If you remove the duplicated cancel_delayed_work_sync() in
> remove()
> > > and unneded device_init_wakeup(dev, false); then you can merge
> the
> > > input patch with the rest of them with my:
> > >
> > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > Thanks for your Ack. But I think patch 1-4 needs go to arm-scmi tree,
> > Patch 5 to arm imx tree, patch 6 to rtc tree, patch 7 to input tree.
> >
> > I put the patches together in a patchset is to let reviewers could get
> > a full picture how the whole stuff work.
> >
> > For patch 7, I will send out it as a separate patch with fix and tag
> > after patch 1-4 is ready in arm-scmi tree.
>=20
> Right, but to accelerate getting support for your part into the mainline =
I
> am OK with input piece not going through the input tree but together
> with the rest of the patches through some other tree, probably through
> arm-scmi.

Thanks for your supporting on this patchset. I appreciate!=20

 If they are not willing to take it then we will have to wait till
> core support lands in mainline and then I can pick up the input piece
> and move it through my tree.

There is no rush here, I still need to wait Sudeep's comments on
the scmi parts. So this patch probably needs go through your tree in
the end.

Thanks,
Peng.

>=20
> Thanks.
>=20
> --
> Dmitry

