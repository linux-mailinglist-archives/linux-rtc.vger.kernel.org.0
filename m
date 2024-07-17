Return-Path: <linux-rtc+bounces-1539-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C53CB933886
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 10:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811D81C227D5
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 08:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9424D22086;
	Wed, 17 Jul 2024 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fvNgd05W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1CA2D05D;
	Wed, 17 Jul 2024 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203664; cv=fail; b=VIKxrs1LD5d8ZQZeDX0YgGwKDYXqffSMCJAG0u7tZoZs0+VOU6dkKvbDPk63khOvEU3Ve/WOQ+2tSwQ47tqJDmW+/nrcb0n8W7dU/jwJ1Fa9YSb69xgODmRJarXSy3aFsSf0T27ueNPKvnc/gHCcX1uDf2SD3P/3OuYi602iaIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203664; c=relaxed/simple;
	bh=/33GE5KGaavCdwTK3U8wsPGSkLoa6m5MT/hON+q6Mj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SovIcxRukxucNy7K4je/8IuZgwU3nvXMxGgBw/bXVzPGCwL/qzoR4Nbw9dZPfqJxe2EW6h/jhmxalZFvFzA+Ze2YJostyeuJTAqQzd1jw7TKQrH92AySQJedJKWkwswQMaYQmFskd3ObAHo0YzX1bPhD7qOpDmTujpzSURHVqqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fvNgd05W; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eopC07+jHt4z92HBT1TqyNrRywW1JxkizUkSnSgQiqADF0B5e+2ET+/EaVbwXSxq2nl4NCzgByaMMWkhmJTfI7yvObMSAfXW4EF/j/+/SLhcL+ewUoRxEmwoqXvMsLlxyMT1ukZYRwWvRPvud5ZFr3ZTGf3b0CuA1jR+ESEQZ99vzAQkLWfPEGwNgjOoJU2REu/qqSUevrezUbezgJuU6zZFkAn2Pg7x1CpuErwV9/hRiPsU4UTthcYQlFpmsHnQ/MZsq5RF4kmWlv6UgGbNobAH8s7oOi9urqhWDQzDHOrOVxQAq+emYDuLiUnJmL2WJO9nFohAC9VNbrJ2FmaHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/33GE5KGaavCdwTK3U8wsPGSkLoa6m5MT/hON+q6Mj0=;
 b=UxEPhcDG9p/XJpXhs0al97s+xe5A5CUcAxrlYHJDUrP36rNknsRuis/Ioe5xQBkbn1bQQ1l1xHv91JV7vP5FF5eJiKGKDv4KtQM56zIOssB/Jap1CWeY1KU175HE/Em7odpPWYUv0nfYcoyfQaJN+0h459VfF1MyOAFIUNA3FhY08m3cmybT+Mje5C9TtxAIJLxEzs0nyWnmkU5x8KjZ2LjId8UG9nRIge21h0OvCC4vCgx8qUmrmVrxQf/xQxe2sNctj4NmDgSl87Oz2jZstX/mQJ4HGudyU0M15PbHj3FJq37Vzthr2w5I3Rwea0fo5U7TxlprbLpPZh+xu4puMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/33GE5KGaavCdwTK3U8wsPGSkLoa6m5MT/hON+q6Mj0=;
 b=fvNgd05WIMo6tnAAG/w5FdGX1PviL7ZEILcYCL9aU8QsgBCIRMz6a9sbtL4/+3wNgHm7kJ9t/5+y2k7ldX6z7QFA9NuumEh2DuS/ZAfQib2+H+92OIrlw3Qy4/glcCAspCHOXD+bnxrvSku3Byen1Xivm0seeEWiMy83OFhL9qY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6516.jpnprd01.prod.outlook.com (2603:1096:604:e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 08:07:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 08:07:34 +0000
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
	<linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Topic: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Thread-Index: AQHa12tDxiFdQX5gCUGHOGSoT2m2RLH5LPRggAFcnQCAAAejUA==
Date: Wed, 17 Jul 2024 08:07:34 +0000
Message-ID:
 <TY3PR01MB11346090BE80DDE52D7C1B2BB86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346ABDBA306410646D3861A86A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <42216215-4db1-4015-878f-25a7770d44c2@tuxon.dev>
In-Reply-To: <42216215-4db1-4015-878f-25a7770d44c2@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6516:EE_
x-ms-office365-filtering-correlation-id: 335168cb-9f33-4ec9-a0b1-08dca63783af
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFYrTjVUSjE3b3N4REt0WWs0eXRyemtvemZDbmdmMlVDQzIxQ2VZUUgwVm44?=
 =?utf-8?B?bS9HL1J0OEdOWGRpU3ZkQUU5UjJtME80Y3RWbVFCd3pWd1gzbFc4U3lDbDZk?=
 =?utf-8?B?Y2RTUTRxKzgvMitsV3hvQUYyTkg4a3RzMEREWEF0Nms5Q1NKNHhobzNSRGFU?=
 =?utf-8?B?eGpuSlJSQmJFWjBXT0p5Tm9kZW41ZkJQTFAxdHJYQm1kSW1xR2w5RFBNUVlt?=
 =?utf-8?B?TVc4enVzeUE3SVpsRWYzM1c1SFNHVmVaak9QUWp5WUx4OXI4MVBIWXhGQUlq?=
 =?utf-8?B?R1VBUW13RXNFS0xoZXFKK0lZdlU3Tk03WUNQR0JXNVJlOWpoUzN6eDM2VU9S?=
 =?utf-8?B?TWlTd1pOaUpXczBxekIrNlBwQitrc2M0T3VRR1BwY2EzTkU3QjBGc0M3Ymtm?=
 =?utf-8?B?ZWMvNHRRdTZBUTQzQmFCTzVNTzA1dW8wbzBEdFVhdkU4Z2lLQkRiS2NJU3Fs?=
 =?utf-8?B?OVJlbXN6aUVyMGZuS050KzFzdHVQTWtRT2Y5akdYWFl2N3dNaXp4MmZ1RUVJ?=
 =?utf-8?B?UlpKOUlMdmdnV2E2ZXBBWnFhb3VKMDZ0MEZuNklxdHVqRytZdnp3L0ZHdXhu?=
 =?utf-8?B?ZUVSbmVhS0Mzcitpbm82TmlzWUY5Mm5vbDA0cmY1amQ5Vk11Qm5lbWhuTWlD?=
 =?utf-8?B?TXZSU1VnamhYTFZHRlYwN2dGNlJSM3I3bFU2U09iTitNK3drV1d4b1VTaW5u?=
 =?utf-8?B?N0xES05XcEJ0Qk44NWFNZE9wTzB4c3JqdFN2L21oMk5USWJtYzR4U3h5Zmcw?=
 =?utf-8?B?T2hzU1pqTWRidzJSTzNGY2ZRbGlqL2lwb3JEcWsrOGZIdmhqL3Ewei94NFZl?=
 =?utf-8?B?VTJ3Tjl6R0orS2p5WEgwelVnN1NqT21sNHJNOThFZlQxa0pnaFFBdldxS3M0?=
 =?utf-8?B?Q3hWOXRaSFg2QzJGV24rbDg5eGMrUVQ3anpNcFlEb3lsbXYya1RRa1habDhH?=
 =?utf-8?B?c0Q1cTNDQXRGQjhOVDRLc2ROOUNqbGVZYi9DdWoraFNXWERoVDIybFN6M1M4?=
 =?utf-8?B?eDBwQjRQOEQ2dU1kT0RmTTdNeHdUZWQrdHd3eG1YVklwSWVtemJBam52Sndp?=
 =?utf-8?B?MXpDTXY1L3FWZjlvR3JPdXFVQWRGZlZDRWVTYTE2eDFhWWVEaXFpb2dMQlAv?=
 =?utf-8?B?OEJtS2FFQnpEWDMxS3hZQkxFcjB6TTRDNHNPczRBcVFRdFNWcGVxNWZMMEJw?=
 =?utf-8?B?NWhWTE9lNU92cTczSlMxb2poclpJUEVXdVdSZmtydnIvcTNuNjZ1QVNYeDgw?=
 =?utf-8?B?eGFQN3M3WWo4Rlp2VnNtQmwyNTlwbmJiWmpvVmp4RjdRV1RGVUlpMGdPckVK?=
 =?utf-8?B?NjZSSDhWYzN5ZmhYQXlDYklGNVlXOUNxV0VXcHJ3UzVJdWlsdDNzMjE1cCtj?=
 =?utf-8?B?SFBtSDY0R2lVWmpUMlFiT09EWmVPM3p1dHlvTVdyMHlVd1pCNUo0WnlYUy8v?=
 =?utf-8?B?eWpVbGNBMlhHYjlKWENnMU5kTlBuY2RLNk5qYWtJZHpmMEJXeFQxRGtqVjBo?=
 =?utf-8?B?aGNVcnd0eS9SUHFYMVNJRkxlVEZ1bDRrNmE2dHpHdUZTVGE5UDJNVXdGUzNa?=
 =?utf-8?B?ek5jMkRlc2IzcjdlVTFnckY1bDdlTXBsWUl5U0RHNW0zUTJXYUpQcGpXc2ZG?=
 =?utf-8?B?NGFhOUlEWnZPeEFmZnkyVVIwbTRZNGJ0VFFYWEx3amFCclNEZEk1WmZFS0JI?=
 =?utf-8?B?SU95QjRQOGxwdE0zQS9TSWF0bmwyOWdyUlBqd0xXcUt4MkQzM1ViazR3QytZ?=
 =?utf-8?B?cVU0Wi8vTEhyMjgrMXpOTE1oN0QzejM3c0xJcjcvenJyUjE2ZU94YlZuOHJP?=
 =?utf-8?B?V0FUQ3NVZTduMmlGeUlwWkx2LzJtbEZLM2xaTDJpNFp5c3doYVliUGRpdnNi?=
 =?utf-8?B?QWpZR0l0OWhpamNQMlZmNmdJWDhUQ3RxTFBuWXpyMWlRNVZHM0YvRGI3b0xl?=
 =?utf-8?Q?CAkiZtl45Nw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnViUUF3QytuVzVSbG44U1dHL2VXMGFVOHFpU2FsdXNrVVppNzMzYVRrL3pt?=
 =?utf-8?B?cDlDd3RweFVHZmFxb2hQTlJmWjljSzJ5UHpNRnhZUjFMMng5d0ZpNU9Ec0pQ?=
 =?utf-8?B?QjdjczR0aGlaTVRsaE9XcFFoc2R1UTc1LytyRFQ4NWV1S3N6NUgzYWVTQ3VP?=
 =?utf-8?B?aDhEWDlTeXVCcTJhaHh2aXVYWWdFbkN0MzdzL3h3MnRNTCtENEN1QTNNd0x0?=
 =?utf-8?B?OXRuczBkdEkvM2FYUm8zTGVpUzdhbmoxSlJyTkwyTUVXS0F6dG9vbDRpTm9S?=
 =?utf-8?B?U3FSWHdKMmsvYTd6YXRmUDlqakJFY1U5M0hVS2JadzJscW5oRWF1eU14eUQ4?=
 =?utf-8?B?L3Q3SXk3VVFyMUxiMi9ETEhoeVhUc1JVZmdDdzdNMWhpTVJwbDdyL1VJNUxG?=
 =?utf-8?B?eXZycVBZRitnY3lEZHYrakJML3JUZGtjRjl4ME4ySCtJMWhyQnpmekVXSThW?=
 =?utf-8?B?bEYrTk51R2duY1g0c1ZTSzBIZEh4OWJrdERCQ3dMc09KTmMxdUJBb1oxVlBk?=
 =?utf-8?B?RVJQL24vVHlJUVU2anNmOCtLeFVab1dTYkJDSjJxR2JWcExuc1Mva2dOajBE?=
 =?utf-8?B?cGR0UnQ1K0hMeGFMMnU2eDl1ekdnbzZvQmxXN1dsYWtBdjBuMS9HWGNPOXdx?=
 =?utf-8?B?clRmUldiYjJpekxNN0UzMmpBTEJWRVlhcEM1Y1ZjdnpPSjJ0anZrT2JNbnJB?=
 =?utf-8?B?T2ptbWNwSnpuazNuTWxXODZvcWJhd25XQlEweUVPR0VGKzkrRFFKMzhnOXdr?=
 =?utf-8?B?YVRuT3JYYVgwbW5qV3hGQ3FrQUh6Zk9adnkwUEV5bmJSVXBrdk9VV0tBOGJF?=
 =?utf-8?B?ZnRENDNacDBOUnBhWkE5SHNkbXdRNkhvVGJva1poeHBnR2hXcmlrV21CbDNl?=
 =?utf-8?B?blJhL3lVT0w1dWZTRjhMYWhsZXlhUFB1OGszaVdKKzV5TVAvTm1qNzRFcVdU?=
 =?utf-8?B?ZWUxVkVIQkpxbzN1d25UZ3VJMUNLRkVUdmtIL2liSE1GTVZTdTYwZVdzVjNq?=
 =?utf-8?B?K0lEMnNCN09uNE5vWTZnM0RHSzdSdlJ1dGlwY2tlNStINHlLbnNVVmxSMWQ3?=
 =?utf-8?B?dEszaUNJQnNCWjBGalY5R1cwMWQ2bWZ5WXBUd2NtSlBYQytsbzdLSWFnN3R3?=
 =?utf-8?B?dW14d1ZTTkRjazR6WmlEdE1EYWtnWHhMU29ZY3hZZnVES2xEVUJpWC9BM1Nu?=
 =?utf-8?B?c2hxWE50QlZCUW9La2hBdlZHTXpYbGdhZ2VIL3UyQnVmaFRaMlk5QUh6S2V3?=
 =?utf-8?B?K283M3d4dGE5bjNXbmYvOHJ1b0wxTHpzWk95T0cxZ29ZZW5lQjd1UFBYMXNS?=
 =?utf-8?B?Szk4NVBMcjkxUnZ3b3o3NzlIVno3N3JRT0p0L29oLzQvMGM0RytpSldXcEV6?=
 =?utf-8?B?VmNsZkcwTDZyT2JFYVA0WjlTTlorZHdIYmNCT0JiSmo2R1V4YkowN055VlBv?=
 =?utf-8?B?aHltMDRueTVFTDgwaVphTG9yak9MbjBaQXJMRzFQOWVTSG9YSE1aTU02aEha?=
 =?utf-8?B?Q0IvT1NBYzU3am5wSUtGRmFURVV4YkpiSzhDVlhoY2o0OVZSTnh0Uk9VbmVo?=
 =?utf-8?B?VzRvdTRSV3VWQi9rdHpmY29RMis0NFNabFdIT2RCVmVJUGdrRFU2K3JkcEJh?=
 =?utf-8?B?bmplY2pQL2dvbDNScGk3TDlJcWwxaVNtMFVTNUlSZytlWDFFNWJoUXRFM01W?=
 =?utf-8?B?SEpCTG1QMkZXRTl5YlhpK3JqYUtlMkUySlJjTXJERHNGYlF6alAvb1ZkN29w?=
 =?utf-8?B?NG5DOHBaSDBVZ2w3cy9kQWp3V3kyNDZZY3RrT3Jkc2N3WFozMmZaK1E4SWhl?=
 =?utf-8?B?VkdtQ3BQejZxUzRxQTBleitUN094RGtIRUptVjZXUXRXOGR2VXY4S1BnejVE?=
 =?utf-8?B?WnJmeThBSnVCb3JEdW84N09KQVZNN1I4aEdEOTBRd05ZcHpHdzdrV3hnZStE?=
 =?utf-8?B?TlZLQkljbGdhNXZCZXp4SUNnT0dTbWpnRXlPZkJiNVFDMVJ4NWk2OVVNNlB1?=
 =?utf-8?B?ZnA2SzdtRHVLdXhPQ0lvSlk3LzZ5azQxNHltNXNtS0prMkhSVjhGNUxJeUxP?=
 =?utf-8?B?TDZ4ZVF6dlovRGhsaW0rNUlHSFFkNW5uOUcyVEJvamQ4bDZ1aVByR082V29Q?=
 =?utf-8?B?bkdCRFBKZ3pTRkZjMHVodzlERXZqSVNiSWE5OTljOHcwNjh3QVRwT2RKMGdm?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335168cb-9f33-4ec9-a0b1-08dca63783af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 08:07:34.2207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9o7HfrWDMNSLfoS6AcWvN8ftLwPpF9pluRL3rTkao7x1LfL7cwL7YQ7msCMeEe5u5gaOn3Z0OojBxznRobOHoSMxjFTDB2q2DsF5+UQKmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6516

SGkgQ2xhdWRpdW0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMTcsIDIwMjQgODozOCBBTQ0KQHZnZXIua2VybmVsLm9yZzsgQ2xhdWRpdSBCZXpuZWEN
Cj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDAyLzExXSBtZmQ6IHJlbmVzYXMtdmJhdHRiOiBBZGQgYSBNRkQgZHJpdmVyIGZvcg0K
PiB0aGUgUmVuZXNhcyBWQkFUVEIgSVANCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4gT24gMTYuMDcu
MjAyNCAxNDowMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+
PiBTZW50OiBUdWVzZGF5LCBKdWx5IDE2LCAyMDI0IDExOjMwIEFNDQo+ID4+IFN1YmplY3Q6IFtQ
QVRDSCB2MiAwMi8xMV0gbWZkOiByZW5lc2FzLXZiYXR0YjogQWRkIGEgTUZEIGRyaXZlciBmb3IN
Cj4gPj4gdGhlIFJlbmVzYXMgVkJBVFRCIElQDQo+ID4+DQo+ID4+IEZyb206IENsYXVkaXUgQmV6
bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4NCj4gPj4gUmVuZXNh
cyBWQkFUVEIgSVAgaGFzIGxvZ2ljIHRvIGNvbnRyb2wgdGhlIFJUQyBjbG9jaywgdGFtcGVyDQo+
ID4+IGRldGVjdGlvbiBhbmQgYSBzbWFsbCAxMjhCIG1lbW9yeS4gQWRkIGEgTUZEIGRyaXZlciB0
byBkbyB0aGUgYmFzaWMNCj4gaW5pdGlhbGl6YXRpb24gb2YgdGhlIFZCQVRUQiBJUCBmb3IgdGhl
IGlubmVyIGNvbXBvbmVudHMgdG8gd29yay4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0N
Cj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2MjoNCj4gPj4gLSBub25lOyB0aGlzIGRyaXZlciBpcyBu
ZXcNCj4gPj4NCj4gPj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgfCAgOCArKysrDQo+
ID4+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgIHwgIDEgKw0KPiA+PiAgZHJpdmVycy9t
ZmQvcmVuZXNhcy12YmF0dGIuYyB8IDc4DQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspDQo+ID4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvcmVuZXNhcy12YmF0dGIuYw0KPiA+Pg0K
PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMvbWZkL0tjb25m
aWcgaW5kZXgNCj4gPj4gYmM4YmUyZTU5M2I2Li5kZjkzZThiMDUwNjUgMTAwNjQ0DQo+ID4+IC0t
LSBhL2RyaXZlcnMvbWZkL0tjb25maWcNCj4gPj4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZw0K
PiA+PiBAQCAtMTM4Myw2ICsxMzgzLDE0IEBAIGNvbmZpZyBNRkRfU0MyN1hYX1BNSUMNCj4gPj4g
IAkgIFRoaXMgZHJpdmVyIHByb3ZpZGVzIGNvbW1vbiBzdXBwb3J0IGZvciBhY2Nlc3NpbmcgdGhl
IFNDMjd4eCBQTUlDcywNCj4gPj4gIAkgIGFuZCBpdCBhbHNvIGFkZHMgdGhlIGlycV9jaGlwIHBh
cnRzIGZvciBoYW5kbGluZyB0aGUgUE1JQyBjaGlwDQo+IGV2ZW50cy4NCj4gPj4NCj4gPj4gK2Nv
bmZpZyBNRkRfUkVORVNBU19WQkFUVEINCj4gPj4gKwl0cmlzdGF0ZSAiUmVuZXNhcyBWQkFUVEIg
ZHJpdmVyIg0KPiA+PiArCWRlcGVuZHMgb24gKEFSQ0hfUlpHMkwgJiYgT0YpIHx8IENPTVBJTEVf
VEVTVA0KPiA+PiArCXNlbGVjdCBNRkRfQ09SRQ0KPiA+DQo+ID4gVGhlcmUgaXMgbm8gTUZEIGNh
bGxzPz8gIFdoYXQgaXMgdGhlIHB1cnBvc2Ugb2Ygc2VsZWN0aW5nIE1GRF9DT1JFPz8NCj4gDQo+
IEkgbWlzc2VkIHRvIHJlbW92ZSBpdCBmcm9tIGhlcmUuDQo+IA0KPiA+DQo+ID4+ICsJaGVscA0K
PiA+PiArCSAgU2VsZWN0IHRoaXMgb3B0aW9uIHRvIGVuYWJsZSBSZW5lc2FzIFJaL0czUyBWQkFU
VEIgZHJpdmVyIHdoaWNoDQo+ID4+ICsJICBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgUlRDIGNs
b2NrLCB0YW1wZXIgZGV0ZWN0b3IgYW5kIDEyOEIgU1JBTS4NCj4gPj4gKw0KPiA+PiAgY29uZmln
IFJaX01UVTMNCj4gPj4gIAl0cmlzdGF0ZSAiUmVuZXNhcyBSWi9HMkwgTVRVM2EgY29yZSBkcml2
ZXIiDQo+ID4+ICAJZGVwZW5kcyBvbiAoQVJDSF9SWkcyTCAmJiBPRikgfHwgQ09NUElMRV9URVNU
IGRpZmYgLS1naXQNCj4gPj4gYS9kcml2ZXJzL21mZC9NYWtlZmlsZSBiL2RyaXZlcnMvbWZkL01h
a2VmaWxlIGluZGV4DQo+ID4+IDAyYjY1MWNkNzUzNS4uY2QyZjI3NDkyZGYyIDEwMDY0NA0KPiA+
PiAtLS0gYS9kcml2ZXJzL21mZC9NYWtlZmlsZQ0KPiA+PiArKysgYi9kcml2ZXJzL21mZC9NYWtl
ZmlsZQ0KPiA+PiBAQCAtMTg2LDYgKzE4Niw3IEBAIHBjZjUwNjMzLW9ianMJCQk6PSBwY2Y1MDYz
My1jb3JlLm8NCj4gcGNmNTA2MzMtaXJxLm8NCj4gPj4gIG9iai0kKENPTkZJR19NRkRfUENGNTA2
MzMpCSs9IHBjZjUwNjMzLm8NCj4gPj4gIG9iai0kKENPTkZJR19QQ0Y1MDYzM19BREMpCSs9IHBj
ZjUwNjMzLWFkYy5vDQo+ID4+ICBvYmotJChDT05GSUdfUENGNTA2MzNfR1BJTykJKz0gcGNmNTA2
MzMtZ3Bpby5vDQo+ID4+ICtvYmotJChDT05GSUdfTUZEX1JFTkVTQVNfVkJBVFRCKQkrPSByZW5l
c2FzLXZiYXR0Yi5vDQo+ID4+ICBvYmotJChDT05GSUdfUlpfTVRVMykJCSs9IHJ6LW10dTMubw0K
PiA+PiAgb2JqLSQoQ09ORklHX0FCWDUwMF9DT1JFKQkrPSBhYng1MDAtY29yZS5vDQo+ID4+ICBv
YmotJChDT05GSUdfTUZEX0RCODUwMF9QUkNNVSkJKz0gZGI4NTAwLXByY211Lm8NCj4gPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3JlbmVzYXMtdmJhdHRiLmMNCj4gPj4gYi9kcml2ZXJzL21m
ZC9yZW5lc2FzLXZiYXR0Yi5jIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+ID4+IDAwMDAw
MDAwMDAwMC4uNWQ3MTU2NWI4Y2JmDQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvZHJp
dmVycy9tZmQvcmVuZXNhcy12YmF0dGIuYw0KPiA+PiBAQCAtMCwwICsxLDc4IEBADQo+ID4+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+PiArLyoNCj4gPj4gKyAqIFZC
QVRUQiBkcml2ZXINCj4gPj4gKyAqDQo+ID4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNh
cyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+PiArICovDQo+ID4+ICsNCj4gPj4gKyNpbmNsdWRlIDxs
aW51eC9tb2RfZGV2aWNldGFibGUuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9y
bS5oPg0KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+PiArI2lu
Y2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5o
Pg0KPiA+PiArDQo+ID4+ICtzdGF0aWMgaW50IHZiYXR0Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KSB7DQo+ID4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gPj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsNCj4gPj4gKwlpbnQgcmV0Ow0KPiA+
PiArDQo+ID4+ICsJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXRfZXhjbHVzaXZl
KGRldik7DQo+ID4+ICsJaWYgKElTX0VSUihyc3RjKSkNCj4gPj4gKwkJcmV0dXJuIFBUUl9FUlIo
cnN0Yyk7DQo+ID4+ICsNCj4gPj4gKwlyZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKGRldik7
DQo+ID4+ICsJaWYgKHJldCkNCj4gPj4gKwkJcmV0dXJuIHJldDsNCj4gPj4gKw0KPiA+PiArCXJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPj4gKwlpZiAocmV0KQ0KPiA+
PiArCQlyZXR1cm4gcmV0Ow0KPiA+PiArDQo+ID4+ICsJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFz
c2VydChyc3RjKTsNCj4gPj4gKwlpZiAocmV0KQ0KPiA+PiArCQlnb3RvIHJwbV9wdXQ7DQo+ID4+
ICsNCj4gPj4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCByc3RjKTsNCj4gPj4gKw0KPiA+
PiArCXJldCA9IGRldm1fb2ZfcGxhdGZvcm1fcG9wdWxhdGUoZGV2KTsNCj4gPj4gKwlpZiAocmV0
KQ0KPiA+PiArCQlnb3RvIHJlc2V0X2Fzc2VydDsNCj4gPj4gKw0KPiA+PiArCXJldHVybiAwOw0K
PiA+PiArDQo+ID4+ICtyZXNldF9hc3NlcnQ6DQo+ID4+ICsJcmVzZXRfY29udHJvbF9hc3NlcnQo
cnN0Yyk7DQo+ID4+ICtycG1fcHV0Og0KPiA+PiArCXBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4+
ICsJcmV0dXJuIHJldDsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArc3RhdGljIHZvaWQgdmJhdHRi
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4+ICsJc3RydWN0IHJl
c2V0X2NvbnRyb2wgKnJzdGMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPj4gKw0K
PiA+PiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOw0KPiA+PiArCXBtX3J1bnRpbWVfcHV0
KCZwZGV2LT5kZXYpOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCB2YmF0dGJfbWF0Y2hbXSA9IHsNCj4gPj4gKwl7IC5jb21wYXRpYmxlID0g
InJlbmVzYXMscjlhMDhnMDQ1LXZiYXR0YiIgfSwNCj4gPj4gKwl7IC8qIHNlbnRpbmVsICovIH0s
DQo+ID4NCj4gPiBEcm9wIGNvbW1hLg0KPiA+DQo+ID4+ICt9Ow0KPiA+PiArTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgdmJhdHRiX21hdGNoKTsNCj4gPj4gKw0KPiA+PiArc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgdmJhdHRiX2RyaXZlciA9IHsNCj4gPj4gKwkucHJvYmUgPSB2YmF0dGJf
cHJvYmUsDQo+ID4+ICsJLnJlbW92ZV9uZXcgPSB2YmF0dGJfcmVtb3ZlLA0KPiA+DQo+ID4gTWF5
YmUgcmVtb3ZlIGNhbmJlIHJlcGxhY2VkIHdpdGggZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkg
VGhhdA0KPiA+IHNpbXBsaWZpZXMgcHJvYmUoKSBhc3dlbGw/Pw0KPiANCj4gVGhpcyBhcHByb2Fj
aCBuZWVkcyBhIG5ldyBzdHJ1Y3R1cmUgdG8ga2VlcCByZWZlcmVuY2VzIHRvIHRoZSByc3RjIGFu
ZCBkZXYsDQo+IHRvIGJlIGFibGUgdG8gaGFuZGxlIHJlc2V0IGFuZCBydW50aW1lIFBNIGluIGFj
dGlvbiBmdW5jdGlvbi4gSSB3YW50ZWQgdG8NCj4gYXZvaWQgYWRkaW5nIGEgbmV3IHN0cnVjdHVy
ZS4NCg0KDQpZb3UgY2FuIHBhc3MgZGV2IGFzIGNvbnRleHQgcGFyYW1ldGVyIGluIGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldCgpLCBmcm9tIHRoYXQgeW91IGdldCByc3RjPWRldl9nZXRfZHJ2ZGF0
YShkZXYpOyANClNvIHlvdSBkb24ndCBuZWVkIG5ldyBzdHJ1Y3R1cmUuDQoNCkNoZWVycywNCkJp
anUNCg0K

