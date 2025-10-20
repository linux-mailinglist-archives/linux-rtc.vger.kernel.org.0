Return-Path: <linux-rtc+bounces-5106-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FEBEFD74
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 10:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588653A8E72
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 08:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C10A2D6629;
	Mon, 20 Oct 2025 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p5JlOO5d"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1E2AE70;
	Mon, 20 Oct 2025 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947998; cv=fail; b=oHInLU5D0s9sE26L0vG0Xup6dd3GTs7b1DSf0gWeBhGPXPOYw/dbraDQ4N8iWpxNlJP76LXTHO4M2kaAWrVADgFEgdCdyX5Yp0eG/ToU43RL98SKGIg+DHDMXkQ6JW3MPNfZSAN+2XmbGD+LyHdGkVFOJ8fAirfAB1rN5l1k0EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947998; c=relaxed/simple;
	bh=xamI5uUms4hsYDUclEfoE5Kml2Iv2FBznxhGt5ISNxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iwl3ToNxiRAByC+kX1SdqEl+2EBHP9sweE/NldLC3mjrV8DpiJvYb9GAXjn3TAIB77TZJUuWLLNde8sAIPAZVTPoB9XvveV3MCrgTF7z1Hq69JDgGySJm/rursf1ZnqN9XONx8rzIihoKGTmbOnHNMydzmaqUBywz3leDydGOEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p5JlOO5d; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLO1rvqzd//LD7rYUWlQpGGdbWkxfpGBzYVFOiilcJdZOpSiMn+kF9X+yNWI0JasrJl4fx/u52smSAl1qBx0jOVA3iddb1aHMInUighELPm7DUzjy3IIWvbzQOr8V0OlrF7qpgYg0nmgAwZTw0KjKAWVprtkpz5+9iISzVfICcziJ91Ax5qOznXhStFH0FMOID7ckJ0dourdW89JSbMA0HVOmMWPB3HXtNaOIwwQ8aQDk9CgdQWvF8cdrtiiLXuaZURHGwupTrqVTuJC2G6/S1cWZdKJV3GJRzMh440iVU62qUF8vl0lyfduDmCaNFPpdUOR9F87oqxzyWCaIuK61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0/qFwzROcUf8lpSQdscNQArf+KVp25wbb4r3a/Ky1w=;
 b=MuC+OFLEhm/ampR+Rsz1VU4vu2vGlV5S544HhGQnQc3wHG695Bm/EkRTe9k7EmUNOLm/FvxP0TarHA+KI05tuy3gG1rXXcf0pgz1H7eVkuvZ6Lmjewbk4WE2B07Yh9ubKnH9aykkSNtLqTbnQb6VhBjnPFsYiZiknuYBcf5T+ZOrVCyy6CbD2SR6SW6/bRkFmq3ERtrh4+EAa99Fk0Pm1uGUNDJOZDI9oA3rNWO9YJhTerphbzF8E7k2nuUt7Sli+M8nuE+KwHIgknff9/gKKXRo9sBSXhjKzQDvr096wwzBQcDh5oepJLXTsEWUELhE8I/YH9ahK2BXAXJ3qNC8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0/qFwzROcUf8lpSQdscNQArf+KVp25wbb4r3a/Ky1w=;
 b=p5JlOO5dVaQRGuXf66CFU2hrCmhmlkxQXfArfLGKyzFm/gmalAubMHwy+Tx3B15DpkcNhaszKCFWqh14S4btLaIA5T1o/QCTLw0OOWttYnMwqaZP6YgzMvmlFur3+UphORA0KDqWpQY97Jb4F7ZmeRJYzWNylN7M37IEsbrGIW0=
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 (2603:1096:405:253::12) by TY7PR01MB14308.jpnprd01.prod.outlook.com
 (2603:1096:405:245::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.11; Mon, 20 Oct
 2025 08:13:05 +0000
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941]) by TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941%2]) with mapi id 15.20.9253.008; Mon, 20 Oct 2025
 08:13:05 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
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
Thread-Index: AQHcQNnpD+MZABpK50GyV5pRHAKx9bTJQMBwgAFjJ6A=
Date: Mon, 20 Oct 2025 08:13:05 +0000
Message-ID:
 <TY7PR01MB14910BB6AD621CC7BA42D56D4D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
 <20251019092106.5737-6-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346CBE1C135CBEF82E3E7BE86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346CBE1C135CBEF82E3E7BE86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14910:EE_|TY7PR01MB14308:EE_
x-ms-office365-filtering-correlation-id: fb416044-d561-47f1-5474-08de0fb07ee7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ok+tyGhseJGw+kOek2ODyQ8KHo28Ihu5SpBKexwTJJVKqOyLgUEFK03iPGUB?=
 =?us-ascii?Q?sqesuId1FyhnZr+kNY/4SfYhDt28h6H4jS/OF46woX49UgzR+oexp8DDd1ZU?=
 =?us-ascii?Q?zU2f/2mcNvdbpVVN+9GSrpDzGi9P5he8jOFK9Ir2Plvg7KXQw6SJdq/Hd/Vi?=
 =?us-ascii?Q?vxwB4Hm176hqDqKFnd+Y3ajO812iGS+P4dZW4zpJRXU0/EdL2B9nDrAec9Pq?=
 =?us-ascii?Q?h2T3rgjuu47zYnS64aTOXO41Bu25EiOMN3TFfv5jVoYGSzwR0ZvO4uZUGaWn?=
 =?us-ascii?Q?PQ9JcnUSlcPvpDbkdq5zemFK/EYZ/mtHLmxW66ibafI5V/UlodpyWu7rnivw?=
 =?us-ascii?Q?/cbjy7qW9iSAlKHNsom9qmri8s9BTtkJBdDlnX+vVfyZMglK5pHj0a5VlhNa?=
 =?us-ascii?Q?ZyHEILvWn4sy5xJIq6wJnj7Ru24sJR+fRLB7MvIPsg36nnJZDltCV3lV7oBR?=
 =?us-ascii?Q?hlhhym/oQ9ePZPQZo83pDym3cnY5y8rAXBY3v39TfHn3GlbDZiG6UWuQc3SL?=
 =?us-ascii?Q?KMHLdRQYdg+du3665G0ghNxvV36MgSFJ3isF3b5dGDDghV3qQE2Jhm+LlvAw?=
 =?us-ascii?Q?EEVriEwh/EoHXXjO21nv8N2RGKn6oUCrOHPQjL7/OTGhNe1H4WBtkMZqH0fG?=
 =?us-ascii?Q?0v5IHd/Xrgt5Khv1cYrfudsxZGKox1b25CaC5eouQQ7gpfP6ObIO+2OtcqUg?=
 =?us-ascii?Q?h67XQS/1mOFY7xgqitO5KF2l5KQADZhjbVXIaHTEgO2JBNU4M2QLasnxvaPK?=
 =?us-ascii?Q?yc9LFOHZ/ktWe2xO4f4DLKbzuFeTMYMa8qoEio199iPL79ZBKp/gWucwq/Jd?=
 =?us-ascii?Q?h3gNbGCDmw3p5tPQGFuMYN3P+J2/pUS+bVNlyV5eTAAqjICHxqNYTlyGmT+A?=
 =?us-ascii?Q?P09NUextlp5a0/cFSfy47UHCI/PlQ8hyLPd8bkor90wmDn3ymt+TTJwNVCfu?=
 =?us-ascii?Q?P3WBno2jUS6kLjJZtQKvbaRoOP4WTmpjk0UcBwn0k4MffLWsRb9AVzLm5Wto?=
 =?us-ascii?Q?AVJFQsl68uKSNWUTdk+9oEC0/+8ax4+OlUfuSbaXqV1re5/9ygODNH+sQrF7?=
 =?us-ascii?Q?wcZrDQ0I2xqrd5uj6yMgIGOMyOMzbV+uIjXlC3ceV3/ltunWZBoIqEluZ6QE?=
 =?us-ascii?Q?5QDFKFbtWW8xl3RO+i1HMWdHMG/fn4CaXt4iIDqhv/SFqjVHr5MsvID7Wfwj?=
 =?us-ascii?Q?5pcR5IJ/vw2o2D6HflmUr1EvfIOz9pESY6KjtGqJvJo2k/0rYaAoo/Ou2Vp/?=
 =?us-ascii?Q?JhASVrq3ElMpzHWAFcY2W0IRMD471zYwZnfqFnn+dQMZKtVxCeWTNUeZ2HDt?=
 =?us-ascii?Q?Y+Si3CXvjpZOiqJuNXazC5BsqWfCA4Pw9fz3YihbNoeVEzawthS1yGxa8AfX?=
 =?us-ascii?Q?r2OBvImty0dsBN1tzt5sUUGjQDHV5gusAQkE+nFE8zF4YSyEQ6rX2o+DAy+E?=
 =?us-ascii?Q?JLa1EMiRYMoppQy1D45U7jvvvccKr+MtVIBptWnapM69//KB9CwGric4zmgr?=
 =?us-ascii?Q?5lJJjRKGgTnJpWW1Y1eKx93GCwi6y8PUjYHAXoHp4IJLjkuhUt8xF4psrA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5k/SoK3jcpR0LO290OY0J924reiv32LJjWXIEV6klcSD34jdiE4zeWSTRueN?=
 =?us-ascii?Q?jm9oasKUge8wuE8KZ4QAd5Sk4X19UiJUHCqyaTWHFsEZD6UT/XOMMlWkuAVY?=
 =?us-ascii?Q?uL4rcqKEFskauxyHBNbpcPMBt3icshjs0AaT2qWojHWvnc0ZGae+SMhMFFoF?=
 =?us-ascii?Q?o09zijMnCMn38gEqcymtx+MhNwaX+i0DmfNtkEDwjGSDm9jHYx0fPSfbLIDQ?=
 =?us-ascii?Q?Rt2tkDObmBIFWvLXqlis4NOFFpqZR62iFNvwTCKsSjll3SspgDCGJEXKyX6k?=
 =?us-ascii?Q?gT3PkcotM8a9rFH/XN5Ucf5ewEMoCWYIn3cqKOI0qfPJUjoThRFrd04FPtf3?=
 =?us-ascii?Q?jR8MN8BCq17A6fYARn65k6cNl2Q/GclymplPMtAhtpA8t4vh/b9won+DiCm6?=
 =?us-ascii?Q?AMHeAG1Sq/77dJ0TBBeF7lHpvLEt/Vt12H5i0bV1spzVxLtLcpbuxHSXncFM?=
 =?us-ascii?Q?0ncdPWCu05jLkDELLta/KifRWCHdQc0Z4HplBARO2L0GLsAh2gDZqzjE4CbK?=
 =?us-ascii?Q?djX7ikNK5Rf5x5TIss4hEKefGIJUbkoDvAy+0Tu8tZrVbmDT1SrXPVaEUre0?=
 =?us-ascii?Q?lqr60VlgOK6jxkyrrsWO22cuapP1pjEvpekoMUm8Cz4XcDoO1oy/tfA9nPHO?=
 =?us-ascii?Q?wq7cQaeyFpvVs1CjGAL6hGdHiz4NgJMPiktkrM1p1xhuBp7um5tK4Xc3N85T?=
 =?us-ascii?Q?d32QrtmqyNpQxVOWqG8u5EDFM71yyyKYwoX60gYHlxe3GoOs86pC1HXO4Jy3?=
 =?us-ascii?Q?y5qVE3lLE0FbHo8dGT9yFnCly0wXaVrsDIyBrfYLoDDl3ypGGP5ned0fXSqI?=
 =?us-ascii?Q?Hfeb0pals2QspXbhVP/RCNt4MR9IgJwWSix+52MH19AXHde6MY25LU2Nb5En?=
 =?us-ascii?Q?VQ3F4NLNFbELovkQ+Krf93OYLDr8FC0bcCZIFH2CH0MulZRp4lpXB9vs3dpr?=
 =?us-ascii?Q?7zrBQj9is5kIPn/cM4Eim3ew6qEGryNEDomgBI6dxL1XAwAAW2N2uI8oY9TK?=
 =?us-ascii?Q?o5s02ggw8nypTRaeAb1bR0cbgxL/nnler/ZbRq7RwP+1qcoRCozjAVPsrEJP?=
 =?us-ascii?Q?m5+WphbIgqbffrqBeN9OYaoZDuaiyiq34+wvMXMUUTc54FqEP98QQ43JJq3I?=
 =?us-ascii?Q?BrCM5PGF/91nXEl9F1WWZ50QAeHrYMnkkcFAaS71VsUo3kKaVDPYDKih/b22?=
 =?us-ascii?Q?zN2fTuUtrjohAM5AbAiJoGyNTpR/wqrZjauJOV45cuqgokGgzLnPf4y4pgPc?=
 =?us-ascii?Q?FQgQg34XZ8pLNUh0WB6wAd3YynNWG+J1U6AXeKlZqTbQl3nwDGfOFKNoYcqa?=
 =?us-ascii?Q?b1aiJl+I4DrDctqKLT+bi9vpLcwuT6tcNIGU+eXHgZHBEzVwXThfOXsh5FM0?=
 =?us-ascii?Q?3z0UOVCLiqHvWVTJoA5fo4u7sBdfgSmhnhQiGqSpZ3921hopUbdOd/X02PH4?=
 =?us-ascii?Q?zv3udKDDxko9UOk2oWLMXPhZupJ49dnwQOf7PKkyO6dPGafXdoouX3EmSEPn?=
 =?us-ascii?Q?yWvwjx8tGtD1zhzUNCQssXencqqh/MvpISZ0ot9dS86zKUY1uwtq3XdXS9hw?=
 =?us-ascii?Q?DNRiyHFBuDBU87llvUoiGdHnPj6OEmGNXXoPWtnxhlyc+KqOwKhPzXiDvXDI?=
 =?us-ascii?Q?Zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb416044-d561-47f1-5474-08de0fb07ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 08:13:05.0318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CVLwhcX4XFpwXPxTgR+GbjXJwTvmem2351QnuxHbtvmHALJQecB1nkKOKhXIWRv4NjahzmfuRC02ffK4CLY8jv1/KI1/eLTRFEHX+MLo3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14308

Hi Biju,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Sunday, October 19, 2025 1:16 PM
> To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; alexandre.belloni@bootlin.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de
> Cc: linux-rtc@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Sent: 19 October 2025 10:21
> > Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
> >
> > Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > index 40b15f1db930..e426b9978e22 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -591,6 +591,20 @@ wdt3: watchdog@13000400 {
> >  			status =3D "disabled";
> >  		};
> >
> > +		rtc: rtc@11c00800 {
> > +			compatible =3D "renesas,r9a09g057-rtca3", "renesas,rz-
> rtca3";
> > +			reg =3D <0 0x11c00800 0 0x400>;
> > +			interrupts =3D <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
> > +				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names =3D "alarm", "period", "carry";
> > +			clocks =3D <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
> > +			clock-names =3D "bus", "counter";
> > +			power-domains =3D <&cpg>;
> > +			resets =3D <&cpg 0x79>, <&cpg 0x7a>;
>=20
> Missing reset-names??
>=20

The resets are retrieved using devm_reset_control_array_get_shared(),
which does not rely on named reset entries. This keeps the
implementation minimal and keeps it in sync with RZ/G3S, which also
does not take the RTC reset by its name.

For this reason, I kept the rtca3 bindings without a reset-names property.

Best regards,
Ovidiu

> Cheers,
> Biju
>=20
> > +			status =3D "disabled";
> > +		};
> > +
> >  		scif: serial@11c01400 {
> >  			compatible =3D "renesas,scif-r9a09g057";
> >  			reg =3D <0 0x11c01400 0 0x400>;
> > --
> > 2.51.0
> >


