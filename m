Return-Path: <linux-rtc+bounces-1838-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C6969574
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44D6281238
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A07200127;
	Tue,  3 Sep 2024 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ctlPh0+j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2B1D6DD2;
	Tue,  3 Sep 2024 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348576; cv=fail; b=bNZzvGKrbTAmLdgmEPN6jMsq6+kgYBhAMndSWegnBVzPIJPWXmamWvYRFKo+qUwxVC5wvL02ch6Y21+8spCzb0ZF9V2PrlgDc1yj4A2tguo3Ykkh60xB/iu4ZVBO2jlPaMSUJGX3jt3ytelpp/5lhY/7wwXfx5w639XuckFKclI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348576; c=relaxed/simple;
	bh=wPsrnQjOVIgoJihnvnF+FLAUytjBK2qOWjaSc7PXCtY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhrYY6ko07cdVoj8Y1jj2lNA9nh9GkxRC8O8mVnjwTaVlgyQyBJXRS5on80FjyNJesWxMfTG9yLS54hIxtbdtEAUlBR+oRqkf5fgsTPBxSK/rqvNPYm+00/g2wVNOLPLB7ae7YZ0HpIrFr/3x/ohP7gWZWiWXnUsTDLIu4O04VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ctlPh0+j; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKi0IWC8WQGeP+srhFDMrZRsW2CTVrKPTm96/f5+5wrwdV1QmsyaL1EiQBXb9jcssT6x/6DPfHmlHxsvfoG6DcqppsD7CC27r3SJVnA28Oj4nVgwnmq5C9td/eSVVUSaNZdGtsoc0Pxww6xnShMRwRbnyr5WNpmauwYdUBqM1+V72wtBpDxHoec0mrspHy8pbZUIuVegzrMjnzfHzX4Lt6pDA8Ko4I+0cXpaW5qJROISYWde0oMscH3FN6YMtjS0A/5SYQ2h1ZZJdzTAhgNDyKFTn2b1K3J4zG4y+yJNEuvHnW9onIu6hWb7m3Eo4Ks8pULXMQDsypiEp62AMLfM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPsrnQjOVIgoJihnvnF+FLAUytjBK2qOWjaSc7PXCtY=;
 b=ju/B9h7kjLI+A+AEkCJY4teqzoHt/ueLms92KclwqJDRzJCTxnHxLJ1UBY5RvRcJ4Qtfa9EwvZVcm6E9JJ8P/+qgNe+Xc1UKpVO1rqoL9JLh7itHLXB6H9SMpPrLnwI5VWDXiICZgvg7jq0DjuS8XrMwBCNV4LAEb2zjrphKltsQB1IGzKJGrhf2vr7y6Ns6xFU+v+bTRGRBHaBStKNBe1QlusIhRPWj2YHrda/MDNiU17nNVMeZe6EOrWg+8SuJizcP3wCEbV3fDIwcygW9PUJqM4fWHT77GMUDFIbFtjRcmkOu3KzUPlHPDahzIem2G/PS7HcQ7PgEzgatYQP7Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPsrnQjOVIgoJihnvnF+FLAUytjBK2qOWjaSc7PXCtY=;
 b=ctlPh0+jLFTDyHez7LVUta1fSFu1bYbkl+Wr0fLrIfOdOzWiHIyvYdgoCiYmtD5wnfWDrIikQOVq+g8Bb31tfBEYSwLuBJaJ+HmZCgFN8QBdc0HKOLrzgdW/kksOjc81sktvalC+wCL65afjx2e2gXKus9KilOSc+a/nEHPif8I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6671.jpnprd01.prod.outlook.com (2603:1096:400:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:29:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:29:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
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
Thread-Index: AQHa+tztyXN6WBwX60SzraGfzO2XvrJFpXxQgAAJC4CAAAArkIAAAQ8Q
Date: Tue, 3 Sep 2024 07:29:29 +0000
Message-ID:
 <TY3PR01MB113460D6408A9B17DDCBFCB8586932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVUW7a-i-K8WoN3FwGaam+17ngr4Hp6agBzAG+9SermOQ@mail.gmail.com>
 <TY3PR01MB11346A650D267A798BC2E23E986932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346A650D267A798BC2E23E986932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6671:EE_
x-ms-office365-filtering-correlation-id: d56100e9-d1bf-49e7-6812-08dccbea25db
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHpCU0JFSjlmbjA3NmZmd1NOVlNzc3hRQ0oxR3VmRVAwYVhwcXNYazJvK3RI?=
 =?utf-8?B?Z2FqcUttSEhmV0RxYWNPd1ZlMCtmL1poUW4wb2ZNZHF5VEFia3hncUdRTEJD?=
 =?utf-8?B?UUZOb1dPZzg2TEkreVpZd2pzS0FiTG1abm1kUCtSSHNoTmlXSFE0azVLNkpw?=
 =?utf-8?B?VEhPdzVyUkJmWkx4RjdXbEZCcGxxbEhOUGV4dHkxM0gxbnAvcUJkUHUwMG1N?=
 =?utf-8?B?SkRrSjI0aW94UXN6T1pVelJOT2xuTHZnV1lyMkxTVFNhcFBKa1ZHbGtJd0xT?=
 =?utf-8?B?SThIVENFQTFOOFZDWjJDZlVST3gwRXlkMGJVN25XNWRCTTdPUHQ2d2lxeG1Z?=
 =?utf-8?B?eFIra3FNVVJFcFNRSHBWT2RTSC9vMmNTLzhlK1A3RWYwMW5mQmNTcVdxcVY2?=
 =?utf-8?B?d000Nmo2RjNhUHRhajNYdkZBYWtGQUZjdDdGemIzb3k4dkpEcVVTTDArWlRL?=
 =?utf-8?B?aXoxdFp4R2pLZklIVHVsdEdjZkg0bkJGNVE3R0FhZ1dTWDBOQjQxWXlYeUtQ?=
 =?utf-8?B?K29OUGh0SFltNGZjbW85T2J6eHArbUlSSEhTZWJtc2ZVTGl0RXVZK3JGZjJS?=
 =?utf-8?B?UVBadk04VHBvUkJvWXFNaWUwYWxpZjVicnczeTZGd1JsTXd2Sk9nejBFTmJS?=
 =?utf-8?B?a1czWndKanRxaHdPc09vUGZydlJFQVl3akppWkhzVG5SSGx4WGYzQmFZM2dk?=
 =?utf-8?B?RWhoUEs5bG9aTHN3ZjZFR21mRC9aU09IREh3MkZzTHVFa2pyc09UMmtlS1pN?=
 =?utf-8?B?OUw4WHo5bVlnZUMzY1NkWURxeVRkNXhrcXRER1BFR05TUnhyMHVMMCsyVVpQ?=
 =?utf-8?B?bExQRW9sQmdmeUZxWHdDZy8wOVEwc3YycXRnWVBPWi8xMXhnTEkwTXBCTlV0?=
 =?utf-8?B?cFprLzZsUG9iS3F1ZEdiejI5MVIrYXlIdnVXUjc1RHhhQWpDWVFhZ3Jvek4r?=
 =?utf-8?B?cUgrL0E3a2RLWGpCYk9SQWJ4TUx1Qm44ZGR1TWxyK1VicHRiMDByS3RYbW4w?=
 =?utf-8?B?MFcwTnBDUGlEdzZkbEZkRjhsYXovZzRPTEREYkZ0S29RUmxCODVnM1ZibXlp?=
 =?utf-8?B?cmpoWFVCMmpSQnU1cUl5TGM4UnlYUzg0U21tVzliYTN0QkUwV242MStCZHdT?=
 =?utf-8?B?ZW5OZlcvSHQ0NWR2bkdVQmxiZWJPQkplQ1hjaklSN0ZTcGREdWg3NTVDa2VM?=
 =?utf-8?B?bXVVdVZuVjhXcGdMNGZrT2RxYWtZZEZvUXNZWDAyNTJvUWFWSEtjVUdaZnZx?=
 =?utf-8?B?bUZJR2xJMVpIYmJ0emg3bEF0cm1iTGFNWDF2QkpSQTFaa0s3Uk9OeE15Wi9R?=
 =?utf-8?B?RjE1QXE2SUQ4RHdHcWlGd0JVbGhoMlM1cGd6SzAvZ1dKcTBBa0pOYWdNMmps?=
 =?utf-8?B?M1UvaVZVSWNUUTBsZ0hZNGpwaUZqbmxsNnBRcGlVNG1PK0x3MEw5ZEx2RjJR?=
 =?utf-8?B?N0oxdHZ3OEN6Q0QzcE9ySUdiTUVGK3o5eGxWcjQ5bm42UmlnTDhicXZaa0ly?=
 =?utf-8?B?OWJ1eGtSS1AyL2tCTW5DU0ZzM0ExYy9hRC9MNC9ySzBmblBQMlZhRllDV3V0?=
 =?utf-8?B?VXlXelpoL0paYjVuUkNrWTVCcWQyME5rc05lWTdhTVlYbzBkQ0N1dmx0T2Rn?=
 =?utf-8?B?ZFg2czU5NFkxeTluYytYemlHcGVJM0dDb05vKytScUY0TXoyQllRTjc1UW1K?=
 =?utf-8?B?K1FJODBwYzJjaWthUnQyQmNYNyt1SlRHYiszeTh6Y0NEbEhwcWxFL2l4MUQw?=
 =?utf-8?B?NWgxMzR2andPMW5qbHhzQ2pNVWVmbEF3YzF4NUw5MUJiTFdBSkFjWGV6T3Bq?=
 =?utf-8?B?TVhYUEJhbXpjVHYwVWVOQWVJOUxJR0ZxMjhVaUMvaTlHWFMwSHZxUlRTUU5w?=
 =?utf-8?B?RW9yUTdSVlBuWmFGMGZ3Y2RIbmcrTEZZVXdia2JmbWRHVlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGZxWnNkSTdsQ0p4ckI0U1JhNHhVUU9vb01NY1FnUHUzdkZlU2hpdmZYQUZR?=
 =?utf-8?B?MGtRT0ZKYWJXVWd4SFo5NTJHSkFRV25GRlhiLzRBVDFScC9QK0RQd0t0R0hY?=
 =?utf-8?B?bVc5Y2o0OUx0VE5yMHM0eEQ2SEJNVTZJcnNQR2t4QjBmR1pTZVdvU3dLRlEv?=
 =?utf-8?B?d3VKaFVXQ01rUFFJWm9rNWl4c2JuSnowQ3Vaei8vb2NxVTJkdVNGVmpyTy9p?=
 =?utf-8?B?OUdiU3YxeWhVakpRdnVrZWtCQXVnRzRGK0JyN2hOWjJ4eW9GNTZNSlpmbVF1?=
 =?utf-8?B?ZDk5bHEzMXN2N2pocWc1NmFKSFNFWUw4UUQwUTc0c1VFbXRsV2FBREtFMFRl?=
 =?utf-8?B?RkhWaUxrTXBJZ1NzbzJpZmV5YnRqcjdMRU1hNTBYS2xmWnQxWVNZenZaQm5k?=
 =?utf-8?B?SS9jT2Z2ZkFOcDZ0d1BZdllXQkJwQVJPL284Mkt1OVFzVStWcnQzWUc5cmo2?=
 =?utf-8?B?aHp0aDhyZUM3VkM0ZjYyY2swZ0xVWkwrM3ZHNnpHSFVuMWo1ditlSDQvSnJS?=
 =?utf-8?B?RVNOT2dWTG9aSTlDN0pMYjY3ZDRhdWxaako2Z0RvYzc3V25jcjBLejhFSis3?=
 =?utf-8?B?UTdkU0gzdTJVR2dSd1J1WmFUUS9jWDJnRVViZ25sWGpVYkVESm9QUzFhZGJ6?=
 =?utf-8?B?ajJ6dUE0N2xyYSsvZ29Ed0JxL0dqdHhUZmMrUHJFbzRyN3lKWmlIWjVERzFy?=
 =?utf-8?B?a0lYV2hYOFIwMEs0UFhuSXRPOVpOWWxOckk3ZGtCdHFLTEpObjAveHlHa3ls?=
 =?utf-8?B?V3NQWHZQRmFuR2Jlb3VSSnVoS3ppc2FoT1ArbGlvc0hWVlFoM2JSS284L2RK?=
 =?utf-8?B?eGs3QVJzK1N2cm9BRVlseXdvSTY2UVFkZlFTWjA0end1WVlOL2NVVmZDU2Jk?=
 =?utf-8?B?WElpSnJabG5RdVZ4RUhZd2NJQzJJYnVLcTNhKzJQMEtvdHc2d3ZHdmlBb2hL?=
 =?utf-8?B?bTJSSVFEcloxajZsSndoUVZhMndVZGo1SkNhZDJGVG16NzU1NzlyNjI3WWVk?=
 =?utf-8?B?cjRWV1BTOGVia2tTbkRGSzdvL3R2VjFEV09idHVUSVJacjJsU1RtWDE0M01r?=
 =?utf-8?B?V3V4VGJaam0xZDZxNzUya2FVZ3NIRXlNU3RiUEkwczFLSjlBUDNZeWpLVFph?=
 =?utf-8?B?YThGT0JRUVhZb2FuL253Y3g1bFc0c0s5RGpFOHV3dFp3Y0ZGQ0VGNWhoTDlJ?=
 =?utf-8?B?OTRYMXVKcENZWitTV0IxeXZ5VDVkQ29Md1NkeG5xRmx3OHQrMWM3ZmxyQTMy?=
 =?utf-8?B?cW5TK3M3OGpWUVRvVE50ak96Wlp3QkpwMHkvL1FWc0FFbUhSVE1BUW9ZcDFQ?=
 =?utf-8?B?ekFaMGE2RGZSR0pWYU9SV3F2SVpuN1IweHV0UEJLQlVpSEFlTzlCaWE0TUJl?=
 =?utf-8?B?Ry96OEdlYmlQdEE5TzdrZDZlUFIrc3VHazBVd2VvVjRoRWZxSkZHUlhQWitP?=
 =?utf-8?B?UWhnNWJrNmVmUmtZdC9HNGlSdlJCQy9qOWp1SUY4SDJFdWtONXQ5eFFveGo1?=
 =?utf-8?B?VzhhVmVUc1ZiZDhMRzBPTStrYnNNVWJNZWhvZlQzMlZUZCs4WDdGSTRFMG42?=
 =?utf-8?B?U25IVXNWUDNPZE5DcE5vOWZiRElrQ0NKRFkrd0ppa1h2cVhrbGJUNjBvMFIx?=
 =?utf-8?B?RUlvK0hPWTgzZ2l5L3BwT0VnQzVWclRhUlE2UWNmQlN2d3k3aWpmWUN1bllZ?=
 =?utf-8?B?blZNNGE1TnZod1R3eURBa3NkcDJjSStzaDFacDFqTlpWR1A4WlhGYy9TUmI5?=
 =?utf-8?B?dS9jWGxtenkzeHprNXpuSUdMenRrYlFwa1dPR1lORW9WUm9hSUFEMDVkNkZ3?=
 =?utf-8?B?ek1lVmNJTHVTQW5OdThRVG95QW11QUlOTUgrcUZ4eHRBazZNaGtJcTNiTC9a?=
 =?utf-8?B?akt4Q0lqeDVqaHVJMHozVVJTVkw4SXZVRnVEWjJHVnVlVkZNaDBFUVZHanZI?=
 =?utf-8?B?UEYzWS95SmE0QXpLWVJVaHNnWTVOS29QcU8zSk0rRDlYRit5U1BVTW5lMXFE?=
 =?utf-8?B?dmxtOGVxZ2Q5dEJIa3VYaGwvMW5Sa29uQWNFWHlxTkszMG5tUVROY0RLNjdL?=
 =?utf-8?B?cHdnL1Y2OXlQTm9pQnZjWFB2dndwNk5zUnBjZmhROFlITjFVOEhNS1EyUTA5?=
 =?utf-8?B?VXd2cGdnOVVWbW13YStYMEdXa0J3RXVyd21ac0tLd1VTWms5c0NsVkxqNnda?=
 =?utf-8?B?bUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d56100e9-d1bf-49e7-6812-08dccbea25db
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:29:29.7381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uV+hoRaK3Wi1O3qF+0W/ejFEunmF2rly1wBRiKg/E4RRozEF7rsxyw0WFgEa3iVsyDUR6oZmKti7DkJH0c2l0DQha1zqKm6/eWK4yEXqocg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6671

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1i
ZXIgMywgMjAyNCA4OjI1IEFNDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjMgMDEvMTJdIGR0LWJp
bmRpbmdzOiBjbG9jazogcmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiOiBEb2N1bWVudCBWQkFUVEIN
Cj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2Vu
dDogVHVlc2RheSwgU2VwdGVtYmVyIDMsIDIwMjQgODoyMyBBTQ0KPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDEvMTJdIGR0LWJpbmRpbmdzOiBjbG9jazoNCj4gPiByZW5lc2FzLHI5YTA4ZzA0
NS12YmF0dGI6IERvY3VtZW50IFZCQVRUQg0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IE9u
IFR1ZSwgU2VwIDMsIDIwMjQgYXQgODo1OOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPiA+ID4g
U2VudDogRnJpZGF5LCBBdWd1c3QgMzAsIDIwMjQgMjowMiBQTQ0KPiA+ID4gPiBTdWJqZWN0OiBb
UEFUQ0ggdjMgMDEvMTJdIGR0LWJpbmRpbmdzOiBjbG9jazoNCj4gPiA+ID4gcmVuZXNhcyxyOWEw
OGcwNDUtdmJhdHRiOiBEb2N1bWVudCBWQkFUVEINCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPg0K
PiA+ID4gPiBUaGUgVkJBVFRCIElQIG9mIHRoZSBSZW5lc2FzIFJaL0czUyBTb0MgY29udHJvbHMg
dGhlIGNsb2NrIGZvcg0KPiA+ID4gPiBSVEMsIHRoZSB0YW1wZXIgZGV0ZWN0b3IgYW5kIGEgc21h
bGwgZ2VuZXJhbCB1c2FnZSBtZW1vcnkgb2YgMTI4Qi4gQWRkIGRvY3VtZW50YXRpb24gZm9yIGl0
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVu
ZXNhcyxyOWEwOGcwNDUtdmINCj4gPiA+ID4gKysrIGF0DQo+ID4gPiA+ICsrKyB0Yi55YW1sDQo+
ID4gPiA+ICsgIHBvd2VyLWRvbWFpbnM6DQo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+
DQo+ID4gPiBOb3Qgc3VyZSwgeW91IG5lZWQgdG8gZG9jdW1lbnQgIlBEX1ZCQVRUIiBwb3dlciBk
b21haW4gYXMgcGVyIFRhYmxlDQo+ID4gPiA0MS4yLCB0aGlzIExTSSBzdXBwb3J0cyAzIHBvd2Vy
IGRvbWFpbnMoUERfSVNPVkNDLCBQRF9WQ0MsIFBEX1ZCQVRUKQ0KPiA+ID4NCj4gPiA+IFBvd2Vy
IE1vZGUgUERfSVNPVkNDIFBEX1ZDQyBQRF9WQkFUVA0KPiA+ID4gQUxMX09OICAgICAgT04gICAg
ICAgICAgT04gICAgT04NCj4gPiA+IEFXTyAgICAgICAgIE9GRiAgICAgICAgIE9OICAgIE9ODQo+
ID4gPiBWQkFUVCAgICAgICBPRkYgICAgICAgICBPRkYgICBPTg0KPiA+ID4gQUxMX09GRiAgICAg
T0ZGICAgICAgICAgT0ZGICAgT0ZGDQo+ID4gPg0KPiA+ID4gUERfVkJBVFQgZG9tYWluIGlzIHRo
ZSBhcmVhIHdoZXJlIHRoZSBSVEMvYmFja3VwIHJlZ2lzdGVyIGlzDQo+ID4gPiBsb2NhdGVkLCB3
b3JrcyBvbiBiYXR0ZXJ5IHBvd2VyIHdoZW4gdGhlIHBvd2VyIG9mIFBEX1ZDQyBhbmQgUERfSVNP
VkNDIGRvbWFpbiBhcmUgdHVybmVkIG9mZi4NCj4gPg0KPiA+IEFGQUlVLCBQRF9WQkFUVCBjYW5u
b3QgYmUgY29udHJvbGxlZCBieSB0aGUgdXNlciwgYW5kIGlzIGp1c3Qgb24gaWYgbWFpbiBvciBi
YXR0ZXJ5IHBvd2VyIGlzDQo+IHN1cHBsaWVkLg0KDQpBcyBwZXIgRmlndXJlIDQxLjEgUG93ZXIg
RG9tYWluIGFuZCBQb3dlciBTdXBwbHksDQoNCklmIGJvdGggUE1JQyBQV1Mgb2ZmLCBQRF9WQkFU
VCBpcyBhY3RpdmUsIHNvIGxvb2tzIGxpa2UgaXQgaXMgY29udHJvbGxhYmxlDQpPdXRzaWRlIExp
bnV4Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

