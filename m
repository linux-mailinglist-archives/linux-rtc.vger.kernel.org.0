Return-Path: <linux-rtc+bounces-1830-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87278969465
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBE81C22EC5
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663351D6C58;
	Tue,  3 Sep 2024 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GjwwOTob"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606851D61B8;
	Tue,  3 Sep 2024 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346707; cv=fail; b=AfarLzAXTTR3gGaf0cJBD83BXWFl4NAB7A6OPH7rjWKxzIzeWyyCW9VD/LL3md5o+RMaxGqJqGQM0j21oJdm8pFOf+TF6UryTallPe1IHeTZyOg+H8KCm298eYvItzOxh/jAnGQ85teDvwxKhCuYbY0gYy8umi5zPKY+VjNGSis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346707; c=relaxed/simple;
	bh=omje5I0/uemsv/t3dPXMFX7YHF59nNHxbsXYRgO2fAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M//Yv89LXJRFA0Xh/ol9e1/ZICyeqFWPk4d0blql1GlXr/TX8kbfy3ldmHoXVO3OUuCTD4Ui29ArYZmjOUwsFtjamrT3kPq12OMI8H4+OuQsg9l2B54YgWmChK6aPDdBASDzVeuw9fm2+eRqmDpIJYMThKUzEiuwqVXIMSrI01c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GjwwOTob; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CH+Kb/GmNKY6pKmGIDng9x+ySfNrWdD9t6/P165+GEQP2jhCK+hCNWTGZ4VMF1k9Eh3vrGZ+AF/hcm151mLkNU8l/ZhXQxRSsSBx7Wl3RHspc+XlAE8UMmEJCHwMDJcjo+hBjeLMFjike3W0GnyfggBnB1eS1cWapP4yu5MlBAYY6J+IvFOHjQow2mc3ltm4/kdl4JexIoT7Nmin/PV8txy23VwJgVo68xArzo4ym6x3wuxbPcjaDB3jJLI3tlHTL39nF0X08NaxIdHjFNaNnDJayybkalQYcP17RyGFciOHcZ921edtnvLhYvmzZpNTL/ocLbvVhT5Ul6daIHsPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSz+bcrPCI9ycBf1DlZlA6+9c06Lx42YY1bzF323Jxc=;
 b=W3L7d+a+f8FkQAuGkBpPvabSyRda1AASIoozwkqGB2M8gi1ym1OG5bpP4XrM2Bhv+JA86td7gNETlcNMiGwDyfV1cCEAEwfNzf8l3i9s1qdE3ePR5C827NqMp3sX/a/6MuLcmumPjhzAbekTDzY/MKJRsxgzoA6bI30+v0SGRN84RDfGUUyGmbCusHNp7CE+lMOrlk2HJKfu7+HHZBxaKHMwiF3vQyROVmS3NBHh/9VgTaqNOD8MLOceO92qZkzDzf9FgssgQKQnBujkrZ1+hU2QIkaoXyP1xl5LdkdPDx2vnykkyoFviSte2v3KQAZ+tU8ySyH8A5KdKc8/RRfbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSz+bcrPCI9ycBf1DlZlA6+9c06Lx42YY1bzF323Jxc=;
 b=GjwwOTobe1zZ4GnoxsMu14csFr4LBfU7QQ0bEzKGCIG6KxYWMnwKchexndDfISlcQc0Z4mfuLR9ZxZYOATwpTZynvvU14TL4+ytFisQfs5/pdUBbV+FgYwOQHutz170Z4lavPWI9If02AtDV4/hoee4wbxv/i5cjtR4tyMl3qes=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB13305.jpnprd01.prod.outlook.com (2603:1096:604:30b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 06:58:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 06:58:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Topic: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Index: AQHa+tztyXN6WBwX60SzraGfzO2XvrJFpXxQ
Date: Tue, 3 Sep 2024 06:58:15 +0000
Message-ID:
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB13305:EE_
x-ms-office365-filtering-correlation-id: 72e97183-5bbd-41f5-1489-08dccbe5c87f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8eoQyF/px/x2qGsqCQKbDHt3bwqrEhWpmXB/eSuDC7J4600bARpLIOltx7Nh?=
 =?us-ascii?Q?5W08VhkbdBQYG7R/JdvKZt3vdY76MYI5EceJBz62C70nJNzK1gveSz7BkqLa?=
 =?us-ascii?Q?IoK2oRvf2aJOPqLUE2ErK0lE0l7hofgo3hMVQUabo2cyyHcZ0MSZLKOO/VqJ?=
 =?us-ascii?Q?gySOVsJfzBll0YSPArJy4U+A7WEDD2A2rnoHNjj88VD+u1o3KFiN9bLtA482?=
 =?us-ascii?Q?op8TmHW8gC6a9Y4HXqEpLfkYp3ZvbBxMlE/pLcEdq3r101Ni/zwwDTtThxHC?=
 =?us-ascii?Q?aOf18VHOzbaVl5ARfC8EqUYTcji6qJSxAIGaokp2VgZh/jeHJEZbORbp+Z43?=
 =?us-ascii?Q?dSoOA43I7aZ811uCDJUzgcNahWagUTOKeR6ga3DV6YD13IkOZehRXgGyPgoJ?=
 =?us-ascii?Q?5/xQbYRz+LM/5FpMYg/wDbTPN1UYCq56pL8BNRCsKk1E45Aw/HQnyoQpTi8f?=
 =?us-ascii?Q?0uikiMYNjY5hxya/0eR2cAziOltAKaHxDxZlYELagCPnREB9HrSASmIQ2vva?=
 =?us-ascii?Q?UQirXbne6Gkk7o/xBIaJ0/CYgxxgakzMvNy85uNXPpEFvvc7UrFueaoWbjiV?=
 =?us-ascii?Q?RoX6B75ANuZLVSl8hZMLuYVZJqwOa7PZT+NRfbMlK0wRc+j4L3GmzgYjmDpg?=
 =?us-ascii?Q?zufIWxFrMRhRAGkDd5ZnKQ7ijEuFJc/G93+dCJcbYe5AZ6fL8W1fNpUjvGss?=
 =?us-ascii?Q?R90iVeKGfahh7cqwJhdk8W8IWhH4FmSx9QdYdFUZhx5NrEOTUbT7u59BSm03?=
 =?us-ascii?Q?BL3Y3hrreTyDWl2lFlpe+N/qtt+7d0v+M77/A1Q8LzPvEQQTIvTg1lraUDSv?=
 =?us-ascii?Q?rJUSteIRQ9rdn5ejbvaSMBFRg3AMzAX1lAoIYZ2pkDK/8+SPi0gT8xR42v3P?=
 =?us-ascii?Q?asa25pn8+UP29nQyZbyrRLhSi0R+FHzh26a+RherxnwhrOaZ5RcIoWWTUdsI?=
 =?us-ascii?Q?HqExh965Rz4hIer+2/n9EQDcZIZbgs9E2oOrtzmoO7Ob3DRgOTDHhcwtholU?=
 =?us-ascii?Q?7g/OI0+FRy1mPIo7vzQ6PHb9FJE/14NOPo4pbYFMxCHwKmqHbdiXbFgLnjUr?=
 =?us-ascii?Q?6DOYYlM62fE42KHYV3hIqFhMBSZE6etl+t4unWaTPJwDXGn1Cz01fe+OHw3s?=
 =?us-ascii?Q?EKzDP7QVeocD3N1/lW6zeBAwhPLnYDkw7Ldf9l+8i+pbngth+px07JszAe6l?=
 =?us-ascii?Q?Fe7oDPsG+b9zzQAwffbalWtdDEtjzcHhh03VWmvTYLtGVi1YNEW3OZtd1Q0K?=
 =?us-ascii?Q?9YHtNKnDUR6pZ5ru8p1vvlmAA6glCMeulfH/jFcglR4x7GmmlpNuwCAzTdPq?=
 =?us-ascii?Q?6Mo/vhRAOBeNVuAzGphbSslpBY3bFFsYnwRdcSQb1CyJrVjzur4+eJebwXwC?=
 =?us-ascii?Q?X2M3IJfB1Hpl+ei2WIDTanSkob2k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8gi6i3k0dcLwdGTUqWwlpVZ8Y9IJlLYVzvPUDLquk//g+Tgki+TahMqhhR3i?=
 =?us-ascii?Q?mrkQzQZkjAULGV0u2C5oISOoExvlrJDw8cYujBXYJ6Z4iFJ/fGSXKMxOcZbD?=
 =?us-ascii?Q?3tS53TQevZd6TAE0ddCu73k59/4vF4I09zj2Yl61R/qtxA0g7BgbCyxMtEuZ?=
 =?us-ascii?Q?zbhGOF9Gd/i2Rlw4lGVFgwSf73TYhHpYbVnA+1pyk3yJmDCtq20zSGAqp4F1?=
 =?us-ascii?Q?uJKsHQGzrThTK0W6OKhdSbb/KE6lkC2b08U1ywo9u9V7440iZwsgtE4TGwxE?=
 =?us-ascii?Q?RC/dbEYaLzsQrHpXkVPvsNDSfPdRni1QFFjwVHjI0vR4XwCDjkfPxFbKVsN5?=
 =?us-ascii?Q?DaLVFP3neJGXxiFWqwkZRrcbLR4ijxGd583fWfXOH8E+P38nhdjQVjDuGF0v?=
 =?us-ascii?Q?3Vhuik/2vhan9nZwmMCe/FOQ4sd+7ZYcjGOK5LXBMEfp04+nMObw5j4N3kr8?=
 =?us-ascii?Q?T4EJGOfcN/n4E6QFW3sET4ymUvHrLciZgJDPlJWKeNzlgVHACg+bwePR5Ub+?=
 =?us-ascii?Q?1ZSJyakYbnhC7f5dTsWdt+Ik+rxs7ua6eMrmMCGj+sBj4KCuAljSoivoFpLQ?=
 =?us-ascii?Q?mjCJ5cLbwJjyUfR9U4g1pODlXbIbZja3l5QtC8OuWhWGNzZ25G8cTEROHhDo?=
 =?us-ascii?Q?VRsbq9pHNWE3Dtt2H6Lq9+YYgse4P1A73YkMXu7ZP6ZN8sifA5wLEOhGbjFE?=
 =?us-ascii?Q?UDjeC534+q3ILx3VieC4BOPjDBjl4DbCLSOfVvjgYDSH4ERtE85Kpd9rp17K?=
 =?us-ascii?Q?bHxnZ9s37OLWl200o4mHNwyQ7ctmYrSX5Uxlpm81TzdWKHh1Y9WwFHyjmdQg?=
 =?us-ascii?Q?kbkfVcmu5Nb9L4Dx5Q9AWIuJ9jYuncD0NZjJNJQU3gFuLIpCdOa70QYUIupn?=
 =?us-ascii?Q?HGbnq7PE3AMpHKjeAVDWS073kMovIZgui0E8emBfqoa1MGsyRNvVg7QRyy7F?=
 =?us-ascii?Q?MDO1flxUqvLu9Xqojynv4fOR4OPgm+bwOiAM9kiRsvWzxCwKZmH+bfa6W38j?=
 =?us-ascii?Q?SWuklz6U8DZJSfMw8mRl+9PbiYZWB+r6bZCip8L9ilTlg+gKKWWIq9ctcPet?=
 =?us-ascii?Q?qqmr6YHv3+uIlHPJGFuMAsUitmS9ffLy3eaLWb9RPnPn7qCJq2eZkXB7szZa?=
 =?us-ascii?Q?NlKFWJfSzqT9+weHDkee1KsgWpakwBx8+nZf2eIo12dUjCfMS48rePSvLsqc?=
 =?us-ascii?Q?7dXsdqAo8ExqsbjM5U1NST6TrB/dMUTQwsIYWdXtKmBY9SHg6jg9lCo1jsrC?=
 =?us-ascii?Q?kqlxNVW/Ez8R2c2tZnLbJDj84jDBCkf7RLOVvkGCZ/voJmZ4euqbDJ1YKylO?=
 =?us-ascii?Q?CkqQL9XxX7GFe5fikrqSC5NyxUa7Qz8X2ZDAhoMW+SfqWDTxgjthdp4c9qP6?=
 =?us-ascii?Q?4xTiyyrq4dyU+eagRK6tOHvjbyF9XZ/kwTXo2XLu/nRZZF18aqJrBW+H6dFW?=
 =?us-ascii?Q?ogfLcMfiq5+4zuIjXhQKMMt9fEimQ2TnyElW1JPBHiKDkNM3DiF0lSM1prEs?=
 =?us-ascii?Q?cYjSTuRgDCG0n+wRC8bqnt9EYPRC0d3PwBZWI3Nt5cfEk1CsoGAyHvRE6G77?=
 =?us-ascii?Q?bmszLLrgRiVbEyfgGXvcAw7AuIo6lLW33ZGYDAuXmWiAFJFEEue+zpOSj+2k?=
 =?us-ascii?Q?RQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e97183-5bbd-41f5-1489-08dccbe5c87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 06:58:15.0992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tm4IjhCT3zyRDlolfLwLl9jD00AbVb8l9TlCuU7VQgYp8lsgkAfijY+FJaXOHaBAwKBuNEKEC8C6vB7g4sKiFTclTgeYAxfBogb+gntyhto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13305

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Friday, August 30, 2024 2:02 PM
> Subject: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb: D=
ocument VBATTB
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC, the t=
amper detector and a small
> general usage memory of 128B. Add documentation for it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v3:
> - moved the file to clock dt bindings directory as it is the
>   only functionality supported at the moment; the other functionalities
>   (tamper detector, SRAM) are offered though register spreaded
>   though the address space of the VBATTB IP and not actually
>   individual devices; the other functionalities are not
>   planned to be supported soon and if they will be I think they
>   fit better on auxiliary bus than MFD
> - dropped interrupt names as requested in the review process
> - dropped the inner node for clock controller
> - added #clock-cells
> - added rtx clock
> - updated description for renesas,vbattb-load-nanofarads
> - included dt-bindings/interrupt-controller/irq.h in examples section
>=20
> Changes in v2:
> - changed file name and compatible
> - updated title, description sections
> - added clock controller part documentation and drop dedicated file
>   for it included in v1
> - used items to describe interrupts, interrupt-names, clocks, clock-names=
,
>   resets
> - dropped node labels and status
> - updated clock-names for clock controller to cope with the new
>   logic on detecting the necessity to setup bypass
>=20
>  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08=
g045-vbattb.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vb=
attb.yaml
> b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
> new file mode 100644
> index 000000000000..29df0e01fae5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.y
> +++ aml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Battery Backup Function (VBATTB)
> +
> +description:
> +  Renesas VBATTB is an always on powered module (backed by battery)
> +which
> +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
> +  general usage memory (128B).
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a08g045-vbattb
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: tamper detector interrupt
> +
> +  clocks:
> +    items:
> +      - description: VBATTB module clock
> +      - description: RTC input clock (crystal oscillator or external
> + clock device)
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +      - const: rtx
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1

Not sure, you need to document "PD_VBATT" power domain=20
as per Table 41.2, this LSI supports 3 power domains(PD_ISOVCC, PD_VCC, PD_=
VBATT)

Power Mode PD_ISOVCC PD_VCC PD_VBATT
ALL_ON      ON          ON    ON
AWO         OFF         ON    ON
VBATT       OFF         OFF   ON
ALL_OFF     OFF         OFF   OFF

PD_VBATT domain is the area where the RTC/backup register is located, works=
 on battery power when the power of
PD_VCC and PD_ISOVCC domain are turned off.

Cheers,
Biju

> +
> +  resets:
> +    items:
> +      - description: VBATTB module reset
> +
> +  renesas,vbattb-load-nanofarads:
> +    description: load capacitance of the on board crystal oscillator
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 4000, 7000, 9000, 12500 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vbattb@1005c000 {
> +        compatible =3D "renesas,r9a08g045-vbattb";
> +        reg =3D <0x1005c000 0x1000>;
> +        interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
> +        clock-names =3D "bclk", "rtx";
> +        #clock-cells =3D <1>;
> +        power-domains =3D <&cpg>;
> +        resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> +        renesas,vbattb-load-nanofarads =3D <12500>;
> +    };
> --
> 2.39.2
>=20


