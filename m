Return-Path: <linux-rtc+bounces-1309-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955890855A
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65B21F284B9
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE23157E7D;
	Fri, 14 Jun 2024 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TQpulAxu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2079.outbound.protection.outlook.com [40.107.114.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF8142E80;
	Fri, 14 Jun 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718351600; cv=fail; b=q2IxMuppDnv9w4N4x3N5LPfVnAsQIVf1/nlC3jtiABsLy47mEwHTJFHbD+Oqg/l/OYLCVpwpKa+Lo9/eoydEcXnwzgG+tqppQqzdSwDoR6fh65y0B6TkMpj2ASbD45no+e1Sbhx5UjD6m+BHnPiuIQ6dtSN8M/m4AQ+NtlTRe6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718351600; c=relaxed/simple;
	bh=fhGy+QNh2k0ysvj5EyW03NNPZRsvhbzEfA/W5g6MONQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hn3x3XDsTk7jcsuzCKbAEBDU/ZP44gLpPEPWs9KpMyZw/B8wqkc6OsXC7sPTXuRdo04m3QLtw5AHns1TGkBrWDbdDD7Q/eR8IMgITzv6F8yZw70yW5Mj/hsmV+SKCaAgydBAQghQWuIk43eNVuKuklpqsJ5I7b1cRG8ekwpJibk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TQpulAxu; arc=fail smtp.client-ip=40.107.114.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czkhNLw6CUXvieI/eWghhj2eSzx328BDLrWKqtDlLKHQVdYEIfNM4riGmbAgCi5UyDEfP0RIkzBV3J+Ix0vPxCiyFJIW7cN7Bx5ZJrBH/ihJwROSiMekdBwBgvIqG6LnQ4T0IUpDuN/BYZShWIHok3ks6S0QxOt6Hb5GJOafxH9hOzadxl4AtPxM0gobmpKjz39tPMHVjEHsD1cIzLxcK28+PSzGnfUdt7Zh2JKbz3VJ+TwEKS6cIv6Za6DjoSC2Xu34zofUsn056UDar814vj3qR0vOxOBOWhabgnSt7iovQsn7JbLsfppwuKWz8BAFesr/4c7NiasuFGsCDewaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WZUdkZASY2Ft5zzdGRtR3MZ21JRQXLa/CtRduliH3g=;
 b=Jj56GqT3gdGHKjMTTyNmnGquTqpOPWflFpKVn7mgsXl2M68ultpo0XLX95/RxqpNwmq2L0rJurvCDZfnfuOZQepuiAgDom3MdS70XvOBQSGAF1jLwQ5J0ePo5mQok6w0R3vZ5QDGbG1g/1HDksrbDhwbF+yN0lz7f+JISOiJf775VEhe94N0IzoB8K7T6CtplcK0LfCWmt5TDa8NX/zKIDa4yqLLmIXzY2v3zhtSNvvaLVIXXrsiAy5U53JYdp0wYEA3/qPpf/+AkaCZgxdh35rnwbLUa1gzdcg82tSCVxvCdzAKqy2qzmlYJkGI+b9rasaag6h6g8UX/s0NyhpeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WZUdkZASY2Ft5zzdGRtR3MZ21JRQXLa/CtRduliH3g=;
 b=TQpulAxu7qhVfWhG7rrpKY/1uV5kmKUcmWYjJSAwQMJiLJ9T5YYlQf8sChw+XczxCOv2Mq6LA8L+v9o8KtOy1iZKf15TpOMAZxbYpF35+rjiigGsynb1zfQueQNGvyhdJLEhvqH94X6mPt86MY5sjmJswvS6qRd1E7vMm3vZ9ak=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10171.jpnprd01.prod.outlook.com (2603:1096:604:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 07:53:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 07:53:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Thread-Topic: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Thread-Index: AQHavitbIcpiZE+kDUKhRF+4WvcTrLHG4xNQ
Date: Fri, 14 Jun 2024 07:53:14 +0000
Message-ID:
 <TY3PR01MB113464811F43F19115FCF62A786C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10171:EE_
x-ms-office365-filtering-correlation-id: 5e6c4731-9a8f-40b7-d8fc-08dc8c470b81
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230035|376009|7416009|1800799019|366011|921015|38070700013;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SjarPygngMWDzHEvLORVQGnYtv8mbRxGSqfjBOo/whEDBw9PqlHkNujGw8wh?=
 =?us-ascii?Q?zq5QOO+7TIxf1uWAEdmNzFnvarNX6iLm4PkK747W74QjGOAbiQAeTuY4sUi2?=
 =?us-ascii?Q?eLfHZUwLMzBZkdFghuqnl8QZj7H1QT+zW4TT7To0N2TW/snpd2ne/CAkdymy?=
 =?us-ascii?Q?O5gYS9GVSGLAqUUxYpwahAKSJVGvIv66oAoOOF1BFik/wx40uLPMqL5Sgngu?=
 =?us-ascii?Q?Pie9QahWGTYuyjvbDw4VRXhjD0vzYlrZ9lLYuZAz+W3pPKYGsmfnAZIy98HT?=
 =?us-ascii?Q?+Mr3qpMkv3R1RlCsAwpoIJqyayr03ujKEKQrG9s/4G8Jn27OS7IbdhbWcz5W?=
 =?us-ascii?Q?w/74+2EwBESfpQUcJObVrXo1IaVI/tCo9OWVxhaeJ/hlZ6nspFV8bW6WJ5EZ?=
 =?us-ascii?Q?toTRgZsYk4DqlLHQMj3DzOK1174ZOezE9GWLjJHTyODyInTgzxMFrZnOJVdr?=
 =?us-ascii?Q?Nsopz1j81WAAfBeckHpazh8QIEwPkqIedocEAzLH0rQh0UY2BCK3ixn5GjOb?=
 =?us-ascii?Q?vrNrh0fziLF7rzVK9kf2sDAKM08c03BV1JfmQWZzoUFSbWpI1O/YRIs3D+DW?=
 =?us-ascii?Q?4r1xawQEHTg9AmmfIy8PxwxMzlNUByNN/52qMcyFVJ2q3zWKSv4asYaGEe4j?=
 =?us-ascii?Q?LtskXeLyEQQ8tGFbBo81gkSqM0IoD5KseNiBwtOg1W8sfMC/O46/t32ak3Nv?=
 =?us-ascii?Q?ZSJtiFqbnFX8aYrrbFbJQUWtI/fiz4pEsUfueeO122nEkDgxO0BWauoTWn81?=
 =?us-ascii?Q?wSGA9BA6VRM7Wch5NRPC44diePtMnr3I/Lj4UDFjnxuGU8w+FsYe7peyA+mX?=
 =?us-ascii?Q?J+svpHhCOD3nYf7s2DTf8x4CrI5b/bfJ+lsX0tJrDLG5T+tt5c4uXcA2KXms?=
 =?us-ascii?Q?E8LWiN/3nrOQPelMgWuwbvreiz11rDLt4MBzXrcQytBrfbFU5f3L8b1sGSAZ?=
 =?us-ascii?Q?i+hQ83N+vvvHC20CfI6S9QZ41Jf+r9vFWAUMd1HUdfYMEXui3NUTuFFB8YZs?=
 =?us-ascii?Q?RFCJcnifAe7D4aiH1nIrfSy1PSO0RUK1RB45Q7vS/2oVlvd/VUtzUQibfQyT?=
 =?us-ascii?Q?BfxoPaeqGMnrieJxZCBGCYJrcgJTKyUOAthKgLBrtDrNsIkB/5tRWSEl2Xkg?=
 =?us-ascii?Q?Fn+PO+XHPaMdTO7IHAbgBh+GQPeEy1WrQUn5941SeEHE7x5nx8V5MAVn3SuM?=
 =?us-ascii?Q?yJMPFJTzMmEZIClmXbpOJBg40AaLszfTAWOTS1uJpK6UPOgB3msMe4piw+CW?=
 =?us-ascii?Q?TYPLkyLe9CPzkvvMmCHdAhbVmm5M/osGPivDGt4q+vouMt/YOpKI56iXYHV4?=
 =?us-ascii?Q?TTVWfcrZjvBzsgxEiHSzWLHoADrmigvd4MOFNKDmK98IjQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(366011)(921015)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m8F7BIAENstgr5BypBqq82Hgy3ZJAbVbvVO5F80cZq2yUPjefeQz35KTtVOL?=
 =?us-ascii?Q?ZPkWsMDRVfAV9lfbebndWBL6RSyyWpySUZbKTMis+roJgbIPhbOdtvkJA2Jh?=
 =?us-ascii?Q?1Dm/5Xp7m+uTCbbrlNOZtvFCrax5V6aQ8XmDa5GVi70V+u9eP/HI5I209tTp?=
 =?us-ascii?Q?4w0wCsdFLdSPioMNwTjuUNxlU/4dEJEqKmAEcQSxcoMGGeTL5hNE/D3k9NMg?=
 =?us-ascii?Q?h2UHhhBPn92NBWOPmQSXZjV7veG+BOxuPGGg33LYpVazxenTWZSzBXnISnY9?=
 =?us-ascii?Q?fLVv/fPdp/w8iwZpHvIRkwd9OzDlf62WPv1FW87Xza/4quDBGunV6Bd/Kmno?=
 =?us-ascii?Q?f/8/y5UfyV/6Dc2jbcNEZeO1JhE2nl7Y9DpovhKGHW9o5nQ90ns4cd/yeYUJ?=
 =?us-ascii?Q?xBVW8mT3fc+E0qkIg5LCtadLzBgF1rRKxKSTvcjIhYSjwCMyH8prXEgXc/Na?=
 =?us-ascii?Q?T8ySHeW+8w0PwDSXZ4mzLo/4z8BuwvwUmcMkdFqlSUFZw31YhSjLIicwu3hw?=
 =?us-ascii?Q?D2HALdV1NugavZMhzdXs07D8TpXHhLcqQAvEHqGWor4u4tzXHBAjpwZf0atX?=
 =?us-ascii?Q?/5Enw80jSrGHRQHQ9oWX0JwYa8W4qlKDti9qyLtUAi1A1QgfT7IRGoBEDDmR?=
 =?us-ascii?Q?DV5M7DlSaGmjpy6jnCGlHe7p1af1dkauCI1eoaqZnXL3oj5qyFS4CHIs0/h5?=
 =?us-ascii?Q?GVpp0fxE7bLcpR026gw387ELvyKHq8tw480yuBQmrXWG3MZ9ba9Mz/cXhzGN?=
 =?us-ascii?Q?0bxFLflPMQkiT+sn6jIy4f56ZGjUOWzNavmJzQeHWE2rQvsVNkl/3dazHZvY?=
 =?us-ascii?Q?myTcDYpSARc0jy4TFl95vlaejniEPBqIvNf3JdSnGtg6DcZaMR8pPppXfalK?=
 =?us-ascii?Q?zroq93x69t9ewTceOWbgtOQf9fScrBpW5RI6KmvK9TA+205HdLgEfFQOUEkx?=
 =?us-ascii?Q?etojhYGptbULaUffLFJMK8wICRZQW1HwMWQUPFkR7tmDLVxcFUdye9zm3XB4?=
 =?us-ascii?Q?xKJrXsYffr32QEgYSDn3HcvE1l+pGwwU1qA8dx3Wg/kwMprgIfeWZ9I2Ag8j?=
 =?us-ascii?Q?bEdkLE4fBAP3R1w5lSiPjpB6hawb6ccG+ebLQQZuiZKwyF9U3UEeTp/Nv0o6?=
 =?us-ascii?Q?/83TIMqQPMm1gHnHkNQYRuRNTbrmh5TwT/b4Lg2GZx97Mpnh0ya7Bj7Xgg4L?=
 =?us-ascii?Q?rcGv6DZ/KiMJh+3aBMTfwtPg1UvIFuHxQH7jukWuYWMNwdlP86ThuP1k5lcn?=
 =?us-ascii?Q?fe6gUw0sGw5QH/4jOuzhoCIJpZUFISJ9TgBaHhmPU5ypSl0hAlevwBER9cyM?=
 =?us-ascii?Q?6B1+Zvlr7lLmz6X/LMoghVbsJi5tRYSoWkLUuzIu78U+LjED37IOb5YBKEYC?=
 =?us-ascii?Q?XdMVad6lQeLou2rjg6DY/rRP2sBWQe4HVP7TP3eEKyFWO6LADpXsRuTpcQkw?=
 =?us-ascii?Q?2BsrzzDnriDmBSeKDhoZj/YG0ALsS75bdKspSezdcx2Qhk9PEsInJ/Xok8lq?=
 =?us-ascii?Q?lv97eSfwvy1wpB+24PagJITr/Jl46t/D7eok2afSpwQmDap8UVyQp1CpLWya?=
 =?us-ascii?Q?fayaTXzWuao5AJTyv+Juj9Vemd3EV+6+MWY8QZfffT6Ks6RjqpAmMVs4FicE?=
 =?us-ascii?Q?fw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6c4731-9a8f-40b7-d8fc-08dc8c470b81
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 07:53:14.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htP/azTCDHM9nU37echMFbN4ETHBnVg9PzcCo8H82aiDsoV3GqWg8bZuSnFM+7lr5hVyhGCnRvL7ev8lwB8Rj5ekJ6XbyRlJt91A9SbtnM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10171

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On =
Behalf Of Claudiu
> Sent: Friday, June 14, 2024 8:19 AM
> Subject: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the =
Renesas RZ/G3S RTC
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-r=
tc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> new file mode 100644
> index 000000000000..0e17f8a36155
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#

Please make it generic renesas,rtca3-rtc.yaml. Future SoCs may use this IP.
So use IP name instead.

Cheers,
Biju

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock for Renesas RZ/G3S SoC
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,rzg3s-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: period
> +      - const: carry
> +
> +  clocks:
> +    maxItems: 1
> +    description: RTC counter clock
> +
> +  clock-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc: rtc@1004ec00 {
> +        compatible =3D "renesas,rzg3s-rtc";
> +        reg =3D <0x1004ec00 0x400>;
> +        interrupts =3D <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "alarm", "period", "carry";
> +        clocks =3D <&vbattclk>;
> +        clock-names =3D "counter";
> +        status =3D "disabled";
> +    };
> --
> 2.39.2
>=20


