Return-Path: <linux-rtc+bounces-1836-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9056969548
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F76F2835BF
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856471D6DBC;
	Tue,  3 Sep 2024 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="if6PEP31"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EA1D6DB6;
	Tue,  3 Sep 2024 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348323; cv=fail; b=R5Iep/iM6qUq1HlKIYVWeYk8seJsZ2TOow+sSFp9xTHXiclN1TEtj7ZCh1tXpSrgTRysUvblmjI0RHPE1LVXtrqUFkZ35ObD25D1IbrYPj4fN1iWkHYIucpD956oBInahqzc5OE/mcYyPY9p/qZBzrxYsIPH4kEUAAwRVoUUF5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348323; c=relaxed/simple;
	bh=wARnfZvShgqiTVWzT3HZE/nO324PVgojkO4Nb007Vx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KPHdhnL2dM6x4PcoTpe8oDFHVksa6LkL3u2WWuKsts18Vb/ckU6b4bBm/QTMvAzYuv5wfwvFQQz09c6AzQqHBTVzvgMONuQ69RmkfKCJIl3iREoKV9PbC+w51QASG/9DDaP+9/XHz+GvoKaMlG7Q1mCFYIMqOrC/JR2S/yi7QLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=if6PEP31; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne1cF328+4x+RIbxorR7kyrkZGTDaQ9EalqdEIxccUZ+zRgoohQ01i9rjbsqPpjkcUkF3844A5yLx1mhUg9x5zeGAPSFZEt+i9Nu1T346ne/1OnGN+gCM4s1R/Ryp0k0dNZoqaQQ9Bcgfg8ebEKerbTLGa3pnIkCYJ2teY89ATeY8HY9+/JH6tCP097S+xYtK4dbKi03rDlBzSAoOcerGDZrwchF94ijbbpILhFa3JigCI0N3hNufoQ6BVhXw5yKf05sIv/sBdaVvQRBwzys6lXRP89txYtVPQXa7L9ZyI+y9OEKDsKYs7MuXb5W4Z57JibmKutTXWQyFHZRaA/g9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wARnfZvShgqiTVWzT3HZE/nO324PVgojkO4Nb007Vx0=;
 b=Xhlq0rPAFuqeftee3dI2E2QgmNtqLMJeC8IOuvj1/XRLxTF7jIjdHmTQlnDQGXU9l323bHdMG9HNe0eU+SIHfk3tMnRStSGrpJQkHlyj0wSIj7GyZlR6PBrSRI3MxzJ4eWdXcl/yZ2Cie8bb7H+CjbKGQWVpQI9q/Yq6tthEUcYn9s2W7Gf9JhyCoH18wqbN6/GRRCSss9nqElstGcDXa9zxRV8YYMCtWhSCKmekRpmvf4wMyP12S6IfTUbRUfsISqXPW4iA+MfZPbPwf5WNHjr9kzpFMFfa9BzduaOBu/ZMTF4UFzdDCf7IrIrPI+Em1z0XL53kbzdUFW7QUxM90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wARnfZvShgqiTVWzT3HZE/nO324PVgojkO4Nb007Vx0=;
 b=if6PEP316k5vCBJDlU6rnoI1+ER7ZXD8IYxxJEfTovnCSHtLYc5XreotLzroiXfQA1djZx58QFwErRALXhdjQVWaF+tSuKa/oH62LPUGm1rVoAnQQnR/C2kuEoRdiCUJR04vBliGfcRAgqHw16jmhfZmSKIhrgeZ0OAEa2941ws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12785.jpnprd01.prod.outlook.com (2603:1096:604:33f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:25:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:25:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Topic: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Thread-Index: AQHa+tztyXN6WBwX60SzraGfzO2XvrJFpXxQgAAJC4CAAAArkA==
Date: Tue, 3 Sep 2024 07:25:18 +0000
Message-ID:
 <TY3PR01MB11346A650D267A798BC2E23E986932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVUW7a-i-K8WoN3FwGaam+17ngr4Hp6agBzAG+9SermOQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVUW7a-i-K8WoN3FwGaam+17ngr4Hp6agBzAG+9SermOQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12785:EE_
x-ms-office365-filtering-correlation-id: 5a773958-db9e-4473-a624-08dccbe98fda
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXpydGpCcXFBVU9DNlZRZzkvc2xmVyt0MmJoQzZ3YU4wOXEwNVZNVUxURFAr?=
 =?utf-8?B?ODdSNlpNaVJpN1A4NDZsS3Zod2RFME4ra1JHL1RtcGxMY1d5YzBsbVVlUlJn?=
 =?utf-8?B?ZWxzdCtWRVNnL245OVQ5WiszNFIvY0kzTkV6eU1qWGZWNUFPTXFGaWlHNDI3?=
 =?utf-8?B?cjZZMkpydEZ6TStNTUVGcm1YZ0tvLzQxcjdsM1E2azRLOEpNeU9Yc3Y5Z21J?=
 =?utf-8?B?RWhvRkozekxOdHY5Zmt5UTBSb2ltK3FGUmVtVE8vWDQ5Y3A0RVNBbWNqM2ZZ?=
 =?utf-8?B?Tys3OXlndndpeW56dGFMREZET2MvZHdNRUI1eVVuRFZpcWlTTGZmTEl0c1Bo?=
 =?utf-8?B?eXBZMnJCcUpPQVhVeWJFZkliWEJjNndwOGxRaWRqTzU2TXgwQTJTUkRGUkw2?=
 =?utf-8?B?U2UvZlhReGF4UVpEZ0c3S2ltZk9YS21vZEZROXJoelJOMzlGNjVCSTdUTDAv?=
 =?utf-8?B?Rk1GNTl5SCt1UVhrNEpsMHBUK2E4VXcrdUtwZW54dGExemx6aG1MTDk1TUxF?=
 =?utf-8?B?YS9uSzNwV3gxcG1NeDViQnBGbzJPbEtOZ0VyRGVvTTdKOGwzSWZwekFDd1Mz?=
 =?utf-8?B?MDNvTFRCVXo2L2VaRG5ZTXlZY2N2WUVIZ1hmTFdrQ1RaYW1xTEtseGIwNlNa?=
 =?utf-8?B?NUVEdXlFcWFzbEV0UkxWT1g5amxickUwYmJLTlN1cDExaW9yc1FaSmhpelFv?=
 =?utf-8?B?UUdyQ1lnb2p1QklweUtkeXNoallTQUVEK2hmNE5TRnhzNW8zVmZZbElLWnE4?=
 =?utf-8?B?eVl4NWE4YUZoSkJpbUhrbUJyVU5RYmVuUHpSaldERzBKbjNNRmhaQlpyQUFJ?=
 =?utf-8?B?TlJHRHE0ckluY0N5bXQ0c1liZGxDV1JHamRxTGFObnhHOEVmYzk1Sis0WG4x?=
 =?utf-8?B?T0M0dlZwb3F6MVBOaUdJUlpaNTRLWE9ZamlCOXJsbHREWFc3TkJodXY3OVgx?=
 =?utf-8?B?bzZpeXVSVVoxN3JPc2VVaXgwaTh6aVRSZnlOajBLZU1jTkUvd2dUb3BHMTZn?=
 =?utf-8?B?L3h6YjM4TkZ6NkJ0eWl3bE1DSTRzRXRkOGU4eFdtV3VQVFZWM3pUOWM0TS8z?=
 =?utf-8?B?TzkveEpTOS9nbzF2SlRDU0x6V2IvK2o5Q3hUc1NvQzNxRmhsb3ZvWjNJOXZV?=
 =?utf-8?B?NFdxb0diVndUcHBQWENMb0s0eldkRklrTHVDOTQ3TEdmVmZpK211Wms2d05B?=
 =?utf-8?B?cHJJaTBFL215aHlXc3hnMGlLYjNoR25pdDcwQkxzNkhjQXJ3ZHlBUXFFZnJT?=
 =?utf-8?B?eUw4TWlnNUZoRVVvcG5Cemx4emwxRkJweW1ZcVhaWWJWZ1lkY09vYlZpRnNn?=
 =?utf-8?B?Sk9aWktFejNtVk1pMXp6RGZXaE15UHA1T1dnRUVwZGRwd3RaZmRqamxGRm1h?=
 =?utf-8?B?bTJrNGhUMHZVenUvZUhTMnlWNnRhTWRNcFF6aEk3NUFqRFROUXlxN0dvMU81?=
 =?utf-8?B?YkVhN1dEZExvZGRNZEsvemFZY2NsSU5vNnJUMnVsSkxQYTdtVmhLQ0w4ZVNE?=
 =?utf-8?B?MGVodVNmVFV3dDEweTZiaW0yRy9SUGlXUjAxMlRPWUFQNnpROFNERTBHeDlh?=
 =?utf-8?B?WUp6NThHZVZlL3plc1dnYVpLUGtISFA3Mm00R1ZST21pN09aVGdJanpjS2ZG?=
 =?utf-8?B?V0Jjb2xCTElVd3BJTGlYS2ZkY2RGL3gyWWt6SXljbE5VZFQyRjVRa3NQZm1R?=
 =?utf-8?B?YytsTFRRMGdwRXQzYWtYL0NFcnhHeXZTYWNvNzhzVGpRTS9FeFJSTXRCZjRZ?=
 =?utf-8?B?SFRCK1VVVEl1YkFDUm9iWmJlT3JKb0EwcEI1bnZ2dGdoR3RhNms3SFhuS0ly?=
 =?utf-8?B?RDJ5bW1hSktpS0pvS0lzS0xPQlk1K1ZyRmlEeFlSQmNsSmNjODV5aXhuSVNX?=
 =?utf-8?B?ZUVmVjN4UitObzEzREkxUisyVlJXdUxKakF1VHpRM21jb2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDUvdlBNdlB2bzR3VUtyYWdabDdNdlJ0czNia3hQNldRRjRoWkNNYU1WWjlW?=
 =?utf-8?B?YnY3Sm9LNmZqSjRVMldMdlFHd0R5dHZNbVY0a2F0dVgzbTZndFo5TVpYSW1Z?=
 =?utf-8?B?cTBTb0VoQkMyd0tydmFicjc5ZEFETEZTSENvV3NDU3pGcTVUQVlNbWQyelk0?=
 =?utf-8?B?L1JlZVhoZlUrd0psRjZrWmxVZU9XaEczQjB6eU9BUjJxcFJFRGxrekNmNXlw?=
 =?utf-8?B?dW9YVnNyZ3lIcjVFdUhRTGhONENlcUhhamg5b0l4aFdHcmhJbHF0ZTNESUFn?=
 =?utf-8?B?R2ZjK0U3QnZkY1pUbFd1ZEMzSDdYeGpzWG02bGx2VEhBMFZSQ0FTOG5pT1Zx?=
 =?utf-8?B?d0Yvam5XL3F2c2dsZUsrMkQzUjdrU3pHd01nTHBsUjBHYUR6SGJJTUF4WkVy?=
 =?utf-8?B?ZVcxNlQ3ckFVZ2M2K2FqOGR0TnJtRUluclR3NkdFV0p5Wk1za1dyTUgwdUJF?=
 =?utf-8?B?c1lCQUpuODM1RWx1bDRrcy9xd3R6QlVhVTFCRlR1bnBUYVlmMnliZmlRVGM2?=
 =?utf-8?B?TzRaWWhHdzVONUl2dHBnM3drOURqZGZvV0dxV0gxKzZWbUF4cHB6ZncvMmNY?=
 =?utf-8?B?Tm5aWTlkbk00V3RTZEVvS3hrOUxqUjE1Y3ZTb0V6eFVVVFVBMi82UC9Gak8z?=
 =?utf-8?B?VXhEVGZZVEJ2TU5JdUkySnJRU1hDalNsNTZ6VVc3d1l2U29Ha1lXQzNlZE5z?=
 =?utf-8?B?VEVPamRVd0R0bE90dERzdWpWTk5GVXh4eXF6VGtHbnlRVC9hS0Z2OXRUMW1B?=
 =?utf-8?B?eS82RkFlcEFVYXpCSnFLU1A2L0JPSEpkeVZqM0l1NXhkS0VtTmtzRlRDZ25s?=
 =?utf-8?B?dHN0aE9vQkphUTVtNWdBTzd5NjNPZGFEbDliV2FTQUJpSEkrYWxvaEg0WU9V?=
 =?utf-8?B?NUhLWGs3MWJmRG9ySzUrNjExMDNqaFRtVUMxSjhReDhHSTlWY3BSV29qZUsv?=
 =?utf-8?B?SXZTMUtZWWR1R2hhWUtuVXpuaklmeUVBa1o4TThQRVpiQW0xWGRzb3Jxamcz?=
 =?utf-8?B?NzJjUHU1SE5PNTl2YlUxY3E3RG9lZmZwajJTN29jL1N1bWJYSGxzampvY3Nz?=
 =?utf-8?B?MExDbXhQY1drdE1Jc0xhcEExVDJwY0RkM242ay9WMDFsSnhnSGRxeVRXdzZT?=
 =?utf-8?B?a0w2UGtCRGhSOWMzbENxV3Y3Z0Z3Y3VyWFVEU1pEK20rZk0wZVlhMzdPR3Vt?=
 =?utf-8?B?MkhXMk5aWXJpdVRYUU83aStra0FYZjQyRTBMQTNqVXdTa1NjRGtKdi82L0pv?=
 =?utf-8?B?U2NacHZOSXluTGFkS0R5TnJHUk1XRG9lMXNadzJPc1NwMkpTVkxiVlRQdDh1?=
 =?utf-8?B?Vy9yVHVXNVJONUNvUnR4cDEyNUhEUE1URFZyeVIwQUhob1lCSkRHcnJIekRO?=
 =?utf-8?B?WWtKdlpWUlRHdTVNQzQ0eWFyMzU4b2NGMWxVdTU2RGlEdXVROE1hRlNVeE02?=
 =?utf-8?B?RVZpSHBxbVI2dDVQV1FRbUVpRUNKM1R4RWQ4S3g3anpFQjlESk5TYmlRd216?=
 =?utf-8?B?dm9FYWI5QWl2N3JxbXg3QTBjYmN4b2sxa1grbUV5YjV5QjFzRzZmUEZxeldj?=
 =?utf-8?B?VzhWY0s0bHEzNzZPcFBmSHo4RVZZUEpvVGxzeGNqM0drdDJtUzdvU3ZFOERy?=
 =?utf-8?B?U2R4YmxocFY3UHZ1TUw1TGk1MzhiWlNOK09xbmhFRlJ1U0cvc3BEajhIUmdi?=
 =?utf-8?B?SDZsblllczVxSW44Qkk0M1NSVXFoQnRFeXdRVDVZM3pubGlDRUhSa2QxcWUv?=
 =?utf-8?B?L2lzUUI0MHd0TlQ3MXBlMUhiaUZDa0t4VWI2bWwyZFk1VjVudUsyWUorUVNS?=
 =?utf-8?B?MkVkNTFSR1hSMTUzRElzNUVsVzA4K1JCNm5EdHFkQllsUVhaVXBSUWxvMGVE?=
 =?utf-8?B?cHhNZzY1Z2lhdnBPV1BobXJmZW9lWUV5OUVPbXpSeXhTTjN1S2svaHpYSnY3?=
 =?utf-8?B?b2pDU3FENEhyd3gzNW42Tjh3U3FpUnl3ODIwcUdXUE51VE4xZmZZd2JmWnV5?=
 =?utf-8?B?QmpGYkI5dXVDR3RsQU9pMGxvcnBEUklQUlVnb0NwMU84ZWJmZ1NNWVdHU25K?=
 =?utf-8?B?U3BVT2Z0eWRoSlRFQ3pvRzlYZkl6MWJWaDZqdVBYZ29SVUpsMmV6SmRkcG96?=
 =?utf-8?B?aVcwY0dvWk5zT3lSRjc4SFQ3K1BBeWlmSzVFSGIzTW9wT2xGbUtjd25RZjZF?=
 =?utf-8?B?NUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a773958-db9e-4473-a624-08dccbe98fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:25:18.0554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkMryKHs9Sx/rvZm8ZWDrHnQXZX8c9HhRY+qNfr8z0AXga+O7Fyml15tIyKKxW2VTqatH2UpIUfDEcqCCnovFXgu8r7Ku31Sef0ix/q1AuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12785

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVHVlc2RheSwgU2Vw
dGVtYmVyIDMsIDIwMjQgODoyMyBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAxLzEyXSBk
dC1iaW5kaW5nczogY2xvY2s6IHJlbmVzYXMscjlhMDhnMDQ1LXZiYXR0YjogRG9jdW1lbnQgVkJB
VFRCDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBTZXAgMywgMjAyNCBhdCA4OjU44oCv
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJl
em5lYUB0dXhvbi5kZXY+DQo+ID4gPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAzMCwgMjAyNCAyOjAy
IFBNDQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDEvMTJdIGR0LWJpbmRpbmdzOiBjbG9jazoN
Cj4gPiA+IHJlbmVzYXMscjlhMDhnMDQ1LXZiYXR0YjogRG9jdW1lbnQgVkJBVFRCDQo+ID4gPg0K
PiA+ID4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4NCj4gPiA+IFRoZSBWQkFUVEIgSVAgb2YgdGhlIFJlbmVzYXMgUlovRzNTIFNv
QyBjb250cm9scyB0aGUgY2xvY2sgZm9yIFJUQywNCj4gPiA+IHRoZSB0YW1wZXIgZGV0ZWN0b3Ig
YW5kIGEgc21hbGwgZ2VuZXJhbCB1c2FnZSBtZW1vcnkgb2YgMTI4Qi4gQWRkIGRvY3VtZW50YXRp
b24gZm9yIGl0Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxj
bGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVu
ZXNhcyxyOWEwOGcwNDUtdmJhdA0KPiA+ID4gKysrIHRiLnlhbWwNCj4gPiA+ICsgIHBvd2VyLWRv
bWFpbnM6DQo+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiBOb3Qgc3VyZSwgeW91IG5l
ZWQgdG8gZG9jdW1lbnQgIlBEX1ZCQVRUIiBwb3dlciBkb21haW4gYXMgcGVyIFRhYmxlDQo+ID4g
NDEuMiwgdGhpcyBMU0kgc3VwcG9ydHMgMyBwb3dlciBkb21haW5zKFBEX0lTT1ZDQywgUERfVkND
LCBQRF9WQkFUVCkNCj4gPg0KPiA+IFBvd2VyIE1vZGUgUERfSVNPVkNDIFBEX1ZDQyBQRF9WQkFU
VA0KPiA+IEFMTF9PTiAgICAgIE9OICAgICAgICAgIE9OICAgIE9ODQo+ID4gQVdPICAgICAgICAg
T0ZGICAgICAgICAgT04gICAgT04NCj4gPiBWQkFUVCAgICAgICBPRkYgICAgICAgICBPRkYgICBP
Tg0KPiA+IEFMTF9PRkYgICAgIE9GRiAgICAgICAgIE9GRiAgIE9GRg0KPiA+DQo+ID4gUERfVkJB
VFQgZG9tYWluIGlzIHRoZSBhcmVhIHdoZXJlIHRoZSBSVEMvYmFja3VwIHJlZ2lzdGVyIGlzIGxv
Y2F0ZWQsDQo+ID4gd29ya3Mgb24gYmF0dGVyeSBwb3dlciB3aGVuIHRoZSBwb3dlciBvZiBQRF9W
Q0MgYW5kIFBEX0lTT1ZDQyBkb21haW4gYXJlIHR1cm5lZCBvZmYuDQo+IA0KPiBBRkFJVSwgUERf
VkJBVFQgY2Fubm90IGJlIGNvbnRyb2xsZWQgYnkgdGhlIHVzZXIsIGFuZCBpcyBqdXN0IG9uIGlm
IG1haW4gb3IgYmF0dGVyeSBwb3dlciBpcyBzdXBwbGllZC4NCj4gU28gSSBkb24ndCB0aGluayB0
aGVyZSBpcyBhIG5lZWQgdG8gZGVzY3JpYmUgaXQgaW4gRFQuDQoNCk9LLCBKdXN0IHRob3VnaHQg
c2luY2UgRFQgaXMgZGVzY3JpYmluZyBoYXJkd2FyZSwgYmV0dGVyIHRvIGRvY3VtZW50IHRoaXMu
DQoNCkkgYW0gbm90IGFuIGV4cGVydCwgU28gSSBhZ3JlZSB3aXRoIHlvdS4NCg0KQ2hlZXJzLA0K
QmlqdQ0K

