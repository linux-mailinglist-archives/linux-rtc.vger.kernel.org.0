Return-Path: <linux-rtc+bounces-1840-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5E9695C0
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 597F6B25431
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FF620011A;
	Tue,  3 Sep 2024 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v+mVAHqW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74B1D6C58;
	Tue,  3 Sep 2024 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348979; cv=fail; b=bEvlZuUrfGw9DywcNCt/LSl2Zg+hGv3T3PPx3pp6gIBHncu4hQqzrc9fFzWjPXRCG5ydt1ZcMteoyu5kHgc0vtNyAaHrwmGaDfE9bmgcaNIEPHyfssiUdpvFuv6t3XHKPzO8tcpncXeNzCy4Wy3V+sTAVjtyagXl29rm32rtbrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348979; c=relaxed/simple;
	bh=O5VHS69ItizykjOfGKrXzDnWd5HQ3pjImQe6WGDtPSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N7zsBQuAwG2/V+VbzSdXrz3/+/g4jImMEfzDCT6uuu9QFZQhhJt8af7waphhrGBoOiA8LYWITJ6j/hnRprR5c7Zf/lX9O/7hE9W0fGKms6mPXaLIimMvZgXlYKEeEv6RguDuunEN3R1FitrwsCU4eQ+EoBBGXlhtm3ExnJgO3eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v+mVAHqW; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUWcnZXTMAq+nCohJNosLRLf7qXFTRAaEVq9yyTlXynWCPkOQIoBJurfeit5IqVTYPAC3o1CLTaXM4zJENJ3i6jFnXkpAU60/u7Eq44/CjBjGJlE2MxEBmyP1QFHvc9BLRLKwXOTZDsdcW5tiXpfYQbnyRuNiDo44BquYi9Ew2Brw+Cu69z1GWuH+vS4qq9b0QgdFlFVi7VPCtC5uviMZhw6B7eqSo+gIKsPCsay7xPLnFKjW+ywWhghkoj7rOu2FvQbt+gpY1w7PK2cBXuag8Er81OWK/TKGxX3ISiuMFPASiIVSxGTaEWd7YgtNg6teZtvX4Iqf7vVcOu629SFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5VHS69ItizykjOfGKrXzDnWd5HQ3pjImQe6WGDtPSU=;
 b=Xymypp2ImT8IqB7V9+3mDOHVngvop635wLKNwZVvnSEIRzqAVNlOEqoeCQP5cRhKX9On7s54UtkBU9c8RCV/06IY9fPwUx6yZbpA2XOHULGkDufydCbk1nNSBlDXu4b4ymBn4axShJjSBlY/GBT6FY79zJ5f6KmRKrwX1DnY+u6moia8E8eLXEbrCvBLQcE7p/ZIyGD5kn34m3VN61OFItulMz6MxEByeI5R4pFWfLxWWDDvMfMJo4Zm7emv62N8bWVhuyciVGKUHku+My3nTF2VaWOEhR0UCcSaUfwn1lEb4KjlqjhSm+36nl+omQyEirTfcMV9yjf5rKzLos3mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5VHS69ItizykjOfGKrXzDnWd5HQ3pjImQe6WGDtPSU=;
 b=v+mVAHqWSU27u7yzAyvMfY/HOqO+w1aI2Di3WAWJnJ6WCg07XhMTUvQ/ByW33v4i5L2sAHmaLfnSE7VlnxH7KO1LmEyKnzBJY+u/vile7W6etYoK/FKDYpGAl/XeIrrhR5zz6bJWz5S9AcbLzyHv77WSPDrggr0iOkIzEAYAb3I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12563.jpnprd01.prod.outlook.com (2603:1096:405:195::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:36:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:36:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
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
Thread-Index: AQHa+tztyXN6WBwX60SzraGfzO2XvrJFpXxQgAAKhwCAAAGFsA==
Date: Tue, 3 Sep 2024 07:36:12 +0000
Message-ID:
 <TY3PR01MB11346F4625C5C7D321490306E86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54d60105-ee5b-48da-92f4-2bcb3dff5c92@tuxon.dev>
In-Reply-To: <54d60105-ee5b-48da-92f4-2bcb3dff5c92@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12563:EE_
x-ms-office365-filtering-correlation-id: e1706efb-92bb-497d-901f-08dccbeb160d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?M2J1bVlSL0VCMmRPVXArcVVRVmp0SE9pWW1lNVpCZ2VvOFVaVExXSm9EWnE5?=
 =?utf-8?B?VHhIenEvTlFSMGlXcVBzNW9PMG1xb0VjZzV2bWk2cFFxNHd5ekNvbGF1SEda?=
 =?utf-8?B?S3VPSkkxNGZjb1VsZlYwUzlaaUhWRTdUWUhXRW9taExPU3V1MFZ0bVRmK1ps?=
 =?utf-8?B?VnJzWW9qMThDYVhiUjJRMWRyalBFOW54NmkxTkZTbDkzRHFyUnJBdG9uYjV0?=
 =?utf-8?B?WmZsVWprcGdWWk9DU201clFiY3JPaGRSTHlDN20vMTgzc2dWQ1VDSmQ3VUJy?=
 =?utf-8?B?Uks1SSt1SDFsNjlYc05mN1hxeW9kZWo3VUlYVDUyWitFOHAvaFpDaU9NSWdS?=
 =?utf-8?B?VnVmUTdmbUdpZWkzRVJUSDMwdmFYRVM3anVsM0JybjUyMjI2emtwai8rdkRs?=
 =?utf-8?B?cUhxLzEzdnEzZ3lHbVp3bWRTVVBrM1pVVHpOWnhLU2RUdVNiSXlTK3FWMXlT?=
 =?utf-8?B?QUJpVmFVZnh6eXp3ZWdnMERkb2V3ZytJaVU4Q25paG1LOTNMWnRRKy9VUnhL?=
 =?utf-8?B?VWlZa1lqaWFORTJtajlMdEFmTmVIYVhwNnRsbHIzMWtrUTljaS9EcVIvMVU1?=
 =?utf-8?B?WGVnVjJuSHNZTW92SUphZ09hK08rb0hWN2h0KzdVMHA2bFUyaUcwNWhQZTlx?=
 =?utf-8?B?eFliTGZaYVlvR2ppcDBneE5oczJVSGRkVE5QanZjcGJsUDFrUmNrUlJ5TE9r?=
 =?utf-8?B?T3NEZS9UVDFQTzdWWUdNN05acHN2MTVzcUhQblRxMU1WdUh4cjNCUE43Z1h1?=
 =?utf-8?B?V0VoUTRTU210NmVSS2NqQ3JzTDd2aTFWTXM2bnJmZDBBZEsvQ0w2cHdmTm0w?=
 =?utf-8?B?a0hhOUN0T2FiZHp2RmJ5ZDJ6QXIxYVg2UVBmdno2eW8zYVBOLzByQzBmelRQ?=
 =?utf-8?B?L3RUMkpOVXA0a2hwMklzQkY2Y0grTisyOCtIanhmTFo2U2lwMWw5dlpxdnUr?=
 =?utf-8?B?cHpyaEQ2NXFpOEs2VkJWSkk5a1E3VmNRRlYwQjFvTWRvMXJqVi9HRlNCU2dw?=
 =?utf-8?B?TEduS2FNMGhwZGFzZy9zNXZVMzA1UnZvSDFYS29jbXpWZFlPTFY4UjN2dURx?=
 =?utf-8?B?bUZoVEkyU05OcmdEOCt6eXYweEJTd3Y4QWJjZ3BUZ1c4NDZxWVRUSktEa0NF?=
 =?utf-8?B?b0tzaFR5ZnJuWkdWeXhCYk1wSUpEV1M2QUVDVGlsZFhlSlJxNWs1TzBDU0dY?=
 =?utf-8?B?S3E4VVJBWDExQlhnRXp0R2VMOGViWDFacS9hbzlZRy96OXZkaHVZZ2Q0QnJP?=
 =?utf-8?B?cVZUR2JpKzh0V2NNQWxVTGVuZnN4Y0ZuRmxHMEFlSEVDVjFZcGFUMStRQ203?=
 =?utf-8?B?bWVub1BBK2J4M1o3VmFheSszRXZCUmtJWTZoSGRIYlpvQlRnZnRaTnBkbmhZ?=
 =?utf-8?B?d3E0dWNpcXZXQk5OS1pObG5iMnA2eUFJU3NqRUUyUy9zYzJJQUFvZTIyMmdC?=
 =?utf-8?B?eW5GQmROU2JWWTc1Z0tJcDBGc0NHOXFKQUFmdXZOMlNjMXB4QVNjcnhtTGRT?=
 =?utf-8?B?djFIcm9Ea3hJM0xDcEFGZU53ZE4xRnRFcnE5NlNQQWRZaUJtaVBXOURjak1a?=
 =?utf-8?B?TCtPemRYTm5RMTBJaFNNQXlmTUlidDJXenlxTWJaVHZqK3F2b3IzVUlrend2?=
 =?utf-8?B?Yk1TZ1hYaVdxS2xLVjBMeVBkWVFuUFJsbkkxQ1lSWkdBNHJndXVqb2daZ3Iv?=
 =?utf-8?B?ei9qbWFIak5hVkk1M1lRSTFHL1o5azJYbW9MNjZuVnl4WUVCTWU2c29NMHdN?=
 =?utf-8?B?NUg1NzlBejZuVWVRRU9lbHIvd2NYN3hPTkxVQnZUenRxZlJCREorRXU1UE9G?=
 =?utf-8?B?WFl6d3hJOUhUWHVMNnZQamxBRGlHUmd1RzQzQzI3UTJIRE9ndmFURE9tOEFs?=
 =?utf-8?Q?AClN91+hI3M2F?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVl3RlpMeTJLNHIxZUhDTTBZcWE3QVpuOU44WFp6amZxdnlJRG5ZczRxUnAr?=
 =?utf-8?B?TCtUenVIcCsydTRvWVoyanltbVJVN016cWdGbkFVS2pUMENPSmNNQjZIT3Az?=
 =?utf-8?B?OThDN3RLYTJMWFhObDZKNUJLeFQ0clphOFVNdk9GdHd5Kys0QWJ0QUFuVDN2?=
 =?utf-8?B?Y3YyUFROMEdBRkhPU2hOWUdpM0tSeDl0eEVJdnMySVkyMmk4clpraUVySUp3?=
 =?utf-8?B?d1NNeW5laUpCS2V1eWxnOXlBeTBvaVdyUHZFdmRab3d0YmZHaTVvZ2VEYnY2?=
 =?utf-8?B?ZWY2TXFoMlkrTVA4K2p3UHo3bnJEaVFHbHo3N1d4bnpxWVBJR2srSXJmM2ZL?=
 =?utf-8?B?aExNQVRCMHJNV3JqVDc2SExYYThkT1dIM0c2L3JlZGhTK3llUnFnOXFmMDhJ?=
 =?utf-8?B?bDVKaDNlcGlURkRxd1QwZVQwOUp3ZDRzL3lQbE4zS0FsQUExODhIRTliSUtt?=
 =?utf-8?B?M08wdmNFZHJqK3A0WVh6N0J4MTVuVGp1K205b00xYmRZQXJCZm82cmpJRHJZ?=
 =?utf-8?B?a0pCa3ZQQmYvVUdFbTkyWGhaNkpDVXlPT0JHcEovRkhzWjlGTEZxcVkvWmdC?=
 =?utf-8?B?bWdaNTdnS1BZN2h3TEI4R3BNVWZVWG95ajk0Y3pmY3cwaTJLUUNWaXF0UVNH?=
 =?utf-8?B?S1RZVGVLU202VURyb2J0QVlXNmIxQ3FYbTBlT3ZpdDRQV1YyOFh0YWM1RjVj?=
 =?utf-8?B?YnltOGltc1g1S0UzNUg4Ymw1c2ZMcTFzQjRFRDZybUNLZU4rUGZUcXJFaGd0?=
 =?utf-8?B?MVFMdGpjU05rQ0pPQkU5TUpVTElRa2U2R05QQ21yTENSenY2K0ZkamM3Smlj?=
 =?utf-8?B?RXNMMWtDY3U5c3JNSjZFWnl0SVAwZ2dMUmdDek00d3VrdE5Zei9BM2hTWm1v?=
 =?utf-8?B?VXB5VncyZEFhbjFoRWs0ajdhTzJIcC9IYlFqZEpjVnlYZTdXaUF3eWNaV3Vv?=
 =?utf-8?B?MWhOWjhYZUhlZTV5eWlIN0pMSWFVWVgvSFR2YXd3YmNnMGxnVlNuS1FyMVZZ?=
 =?utf-8?B?QlliTGJMWTljajNVS0MwbFJxNlFuRW12T1c3UVQyNDJBRzlmWmFuZkZ6VFQy?=
 =?utf-8?B?emV1cjJyVGZJbmlTb3NkUkUreXJ4M3Mxd29BVXpwbFZWcVRmZlAyUS9hY2F6?=
 =?utf-8?B?amlYcnU2UkF4Wm9QVU0vMlJWQWZhemJUb2pXeExxL2wrdithcWR2d2hBTlVQ?=
 =?utf-8?B?dTdSWlFmRHRsa29DTTNzZXFSQVZIZit0UjY1SjNsNm1vU25NZTBnQ3I0TTEw?=
 =?utf-8?B?aWRDTms5MjN1OEs5UDJwQTF5S2xycWJCaEdwMFYvdHVXRTBZNURnY3VJL2ZK?=
 =?utf-8?B?S0J1SFJGR2cvb2ZVREp1cjhBbnp0NTR4YnhIem1Bc2tQY290T1Fnb3NxUkda?=
 =?utf-8?B?ZGdzVFVJcHpJaUFXRFJxZ3Urb1FrQmZ0MGwxZitibC9GbFJzbit0QXNqQjVR?=
 =?utf-8?B?akFhM3NGSTJrM05SL1hHS1hLaExJak12blpTajgyb3ZHZFl3Q0JUOTJHWmNj?=
 =?utf-8?B?S0FBN0s1V3lpQWlwK0tqaDZ4bGdJNURjS2s0MW0yT2ptRmxSQ3lCOFRocjBa?=
 =?utf-8?B?bW91NFRhWk13ZFdQeXFKWkR3YW9JaWhkQ0JVZDNtcjRsQ2V5UGlaUHhrUmxU?=
 =?utf-8?B?WEVDMG1UVHN5VVpSV2U1aW1lSXdNc3IycElxQTduVXRlSjhaSE01clhsNGRE?=
 =?utf-8?B?dG5FWGNnY0ZRcnpSc1VVNVVVQjNCeW1xdjZXT3lPRzl0Sit3Ui9Zc1BaOStZ?=
 =?utf-8?B?TVpmSVBhbXhrN1ljVllaemRxMnVvUWlVQzc4dXVmS0Uxa3YzT1ZBN1NkU1Mv?=
 =?utf-8?B?RFUzQ3Q0UWhCN0lnOU1helJtQi85WnJUb0dnRVRQd1QzNTFJUm5DMFh1UWth?=
 =?utf-8?B?cDFXb0t4cUpGRCtscEJKUlB6c2RDMEd2amVZdVJPMDNvbFl3ZmJEeGFuZUlu?=
 =?utf-8?B?aEpESU5sc28rQzR4ZXg1K2h5clpnR01hR2xJV1ZhdjdURXQ4WWlxcTI2MnN4?=
 =?utf-8?B?ckQrZkt4ZWk0cTNxaEVrNTZLSVRzbHh1K2pKdFhvTU1ZNFZodmg2MmhoR1Qz?=
 =?utf-8?B?L0lEekZBM2V3NGxLTDAxb1V4UWY4YTk3citiWWRUUEV3RUg5VDdIVVAwbkNn?=
 =?utf-8?B?aHA3RHY4M3BVdVhlVlVhckxaOEFET0YzV0kyWEI0NU5YdDdNMG5UY1M3bU56?=
 =?utf-8?B?c0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1706efb-92bb-497d-901f-08dccbeb160d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:36:12.7278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJc5GZAGXEkMffTmc0cF1Gj+8lgo0LwDheeAS9sfUsswr5FrQBYgacoYH7Gd1lvoOV7n1MYLr+7km2xYtwHw/UM8a6+9Aond1hZyBoRSNUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12563

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgMywgMjAyNCA4OjI4IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDEvMTJd
IGR0LWJpbmRpbmdzOiBjbG9jazogcmVuZXNhcyxyOWEwOGcwNDUtdmJhdHRiOiBEb2N1bWVudCBW
QkFUVEINCj4gDQo+IA0KPiANCj4gT24gMDMuMDkuMjAyNCAwOTo1OCwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6
IEZyaWRheSwgQXVndXN0IDMwLCAyMDI0IDI6MDIgUE0NCj4gPj4gU3ViamVjdDogW1BBVENIIHYz
IDAxLzEyXSBkdC1iaW5kaW5nczogY2xvY2s6DQo+ID4+IHJlbmVzYXMscjlhMDhnMDQ1LXZiYXR0
YjogRG9jdW1lbnQgVkJBVFRCDQo+ID4+DQo+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4NCj4gPj4gVGhlIFZCQVRUQiBJUCBv
ZiB0aGUgUmVuZXNhcyBSWi9HM1MgU29DIGNvbnRyb2xzIHRoZSBjbG9jayBmb3IgUlRDLA0KPiA+
PiB0aGUgdGFtcGVyIGRldGVjdG9yIGFuZCBhIHNtYWxsIGdlbmVyYWwgdXNhZ2UgbWVtb3J5IG9m
IDEyOEIuIEFkZCBkb2N1bWVudGF0aW9uIGZvciBpdC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1i
eTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+
PiAtLS0NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2MzoNCj4gPj4gLSBtb3ZlZCB0aGUgZmlsZSB0
byBjbG9jayBkdCBiaW5kaW5ncyBkaXJlY3RvcnkgYXMgaXQgaXMgdGhlDQo+ID4+ICAgb25seSBm
dW5jdGlvbmFsaXR5IHN1cHBvcnRlZCBhdCB0aGUgbW9tZW50OyB0aGUgb3RoZXIgZnVuY3Rpb25h
bGl0aWVzDQo+ID4+ICAgKHRhbXBlciBkZXRlY3RvciwgU1JBTSkgYXJlIG9mZmVyZWQgdGhvdWdo
IHJlZ2lzdGVyIHNwcmVhZGVkDQo+ID4+ICAgdGhvdWdoIHRoZSBhZGRyZXNzIHNwYWNlIG9mIHRo
ZSBWQkFUVEIgSVAgYW5kIG5vdCBhY3R1YWxseQ0KPiA+PiAgIGluZGl2aWR1YWwgZGV2aWNlczsg
dGhlIG90aGVyIGZ1bmN0aW9uYWxpdGllcyBhcmUgbm90DQo+ID4+ICAgcGxhbm5lZCB0byBiZSBz
dXBwb3J0ZWQgc29vbiBhbmQgaWYgdGhleSB3aWxsIGJlIEkgdGhpbmsgdGhleQ0KPiA+PiAgIGZp
dCBiZXR0ZXIgb24gYXV4aWxpYXJ5IGJ1cyB0aGFuIE1GRA0KPiA+PiAtIGRyb3BwZWQgaW50ZXJy
dXB0IG5hbWVzIGFzIHJlcXVlc3RlZCBpbiB0aGUgcmV2aWV3IHByb2Nlc3MNCj4gPj4gLSBkcm9w
cGVkIHRoZSBpbm5lciBub2RlIGZvciBjbG9jayBjb250cm9sbGVyDQo+ID4+IC0gYWRkZWQgI2Ns
b2NrLWNlbGxzDQo+ID4+IC0gYWRkZWQgcnR4IGNsb2NrDQo+ID4+IC0gdXBkYXRlZCBkZXNjcmlw
dGlvbiBmb3IgcmVuZXNhcyx2YmF0dGItbG9hZC1uYW5vZmFyYWRzDQo+ID4+IC0gaW5jbHVkZWQg
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmggaW4gZXhhbXBsZXMgc2VjdGlv
bg0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGluIHYyOg0KPiA+PiAtIGNoYW5nZWQgZmlsZSBuYW1lIGFu
ZCBjb21wYXRpYmxlDQo+ID4+IC0gdXBkYXRlZCB0aXRsZSwgZGVzY3JpcHRpb24gc2VjdGlvbnMN
Cj4gPj4gLSBhZGRlZCBjbG9jayBjb250cm9sbGVyIHBhcnQgZG9jdW1lbnRhdGlvbiBhbmQgZHJv
cCBkZWRpY2F0ZWQgZmlsZQ0KPiA+PiAgIGZvciBpdCBpbmNsdWRlZCBpbiB2MQ0KPiA+PiAtIHVz
ZWQgaXRlbXMgdG8gZGVzY3JpYmUgaW50ZXJydXB0cywgaW50ZXJydXB0LW5hbWVzLCBjbG9ja3Ms
IGNsb2NrLW5hbWVzLA0KPiA+PiAgIHJlc2V0cw0KPiA+PiAtIGRyb3BwZWQgbm9kZSBsYWJlbHMg
YW5kIHN0YXR1cw0KPiA+PiAtIHVwZGF0ZWQgY2xvY2stbmFtZXMgZm9yIGNsb2NrIGNvbnRyb2xs
ZXIgdG8gY29wZSB3aXRoIHRoZSBuZXcNCj4gPj4gICBsb2dpYyBvbiBkZXRlY3RpbmcgdGhlIG5l
Y2Vzc2l0eSB0byBzZXR1cCBieXBhc3MNCj4gPj4NCj4gPj4gIC4uLi9jbG9jay9yZW5lc2FzLHI5
YTA4ZzA0NS12YmF0dGIueWFtbCAgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysNCj4gPj4g
IDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspDQo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMs
cjlhMDhnMDQ1LXZiYXR0Yi55YW1sDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyOWEwOGcwNDUtdmJh
dHRiLnlhDQo+ID4+IG1sDQo+ID4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL3JlbmVzYXMscjlhMDhnMDQ1LXZiYXR0Yi55YQ0KPiA+PiBtbA0KPiA+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjI5ZGYwZTAxZmFlNQ0KPiA+
PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jbG9jay9yZW5lc2FzLHI5YTA4ZzA0NS12YmF0dA0KPiA+PiArKysgYi55DQo+ID4+ICsr
KyBhbWwNCj4gPj4gQEAgLTAsMCArMSw4MSBAQA0KPiA+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+PiArLS0t
DQo+ID4+ICskaWQ6DQo+ID4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9y
ZW5lc2FzLHI5YTA4ZzA0NS12YmF0dGIueWFtbCMNCj4gPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+PiArDQo+ID4+ICt0aXRsZTog
UmVuZXNhcyBCYXR0ZXJ5IEJhY2t1cCBGdW5jdGlvbiAoVkJBVFRCKQ0KPiA+PiArDQo+ID4+ICtk
ZXNjcmlwdGlvbjoNCj4gPj4gKyAgUmVuZXNhcyBWQkFUVEIgaXMgYW4gYWx3YXlzIG9uIHBvd2Vy
ZWQgbW9kdWxlIChiYWNrZWQgYnkgYmF0dGVyeSkNCj4gPj4gK3doaWNoDQo+ID4+ICsgIGNvbnRy
b2xzIHRoZSBSVEMgY2xvY2sgKFZCQVRUQ0xLKSwgdGFtcGVyIGRldGVjdGlvbiBsb2dpYyBhbmQg
YQ0KPiA+PiArc21hbGwNCj4gPj4gKyAgZ2VuZXJhbCB1c2FnZSBtZW1vcnkgKDEyOEIpLg0KPiA+
PiArDQo+ID4+ICttYWludGFpbmVyczoNCj4gPj4gKyAgLSBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+ICsNCj4gPj4gK3Byb3BlcnRpZXM6DQo+
ID4+ICsgIGNvbXBhdGlibGU6DQo+ID4+ICsgICAgY29uc3Q6IHJlbmVzYXMscjlhMDhnMDQ1LXZi
YXR0Yg0KPiA+PiArDQo+ID4+ICsgIHJlZzoNCj4gPj4gKyAgICBtYXhJdGVtczogMQ0KPiA+PiAr
DQo+ID4+ICsgIGludGVycnVwdHM6DQo+ID4+ICsgICAgaXRlbXM6DQo+ID4+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiB0YW1wZXIgZGV0ZWN0b3IgaW50ZXJydXB0DQo+ID4+ICsNCj4gPj4gKyAgY2xv
Y2tzOg0KPiA+PiArICAgIGl0ZW1zOg0KPiA+PiArICAgICAgLSBkZXNjcmlwdGlvbjogVkJBVFRC
IG1vZHVsZSBjbG9jaw0KPiA+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUlRDIGlucHV0IGNsb2Nr
IChjcnlzdGFsIG9zY2lsbGF0b3Igb3IgZXh0ZXJuYWwNCj4gPj4gKyBjbG9jayBkZXZpY2UpDQo+
ID4+ICsNCj4gPj4gKyAgY2xvY2stbmFtZXM6DQo+ID4+ICsgICAgaXRlbXM6DQo+ID4+ICsgICAg
ICAtIGNvbnN0OiBiY2xrDQo+ID4+ICsgICAgICAtIGNvbnN0OiBydHgNCj4gPj4gKw0KPiA+PiAr
ICAnI2Nsb2NrLWNlbGxzJzoNCj4gPj4gKyAgICBjb25zdDogMQ0KPiA+PiArDQo+ID4+ICsgIHBv
d2VyLWRvbWFpbnM6DQo+ID4+ICsgICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+IE5vdCBzdXJlLCB5
b3UgbmVlZCB0byBkb2N1bWVudCAiUERfVkJBVFQiIHBvd2VyIGRvbWFpbiBhcyBwZXIgVGFibGUN
Cj4gPiA0MS4yLCB0aGlzIExTSSBzdXBwb3J0cyAzIHBvd2VyIGRvbWFpbnMoUERfSVNPVkNDLCBQ
RF9WQ0MsIFBEX1ZCQVRUKQ0KPiA+DQo+ID4gUG93ZXIgTW9kZSBQRF9JU09WQ0MgUERfVkNDIFBE
X1ZCQVRUDQo+ID4gQUxMX09OICAgICAgT04gICAgICAgICAgT04gICAgT04NCj4gPiBBV08gICAg
ICAgICBPRkYgICAgICAgICBPTiAgICBPTg0KPiA+IFZCQVRUICAgICAgIE9GRiAgICAgICAgIE9G
RiAgIE9ODQo+ID4gQUxMX09GRiAgICAgT0ZGICAgICAgICAgT0ZGICAgT0ZGDQo+ID4NCj4gPiBQ
RF9WQkFUVCBkb21haW4gaXMgdGhlIGFyZWEgd2hlcmUgdGhlIFJUQy9iYWNrdXAgcmVnaXN0ZXIg
aXMgbG9jYXRlZCwNCj4gPiB3b3JrcyBvbiBiYXR0ZXJ5IHBvd2VyIHdoZW4gdGhlIHBvd2VyIG9m
IFBEX1ZDQyBhbmQgUERfSVNPVkNDIGRvbWFpbiBhcmUgdHVybmVkIG9mZi4NCj4gDQo+IEluIExp
bnV4LCB0aGUgQ1BHIGlzIHRoZSBwb3dlciBkb21haW4gcHJvdmlkZXIgZm9yIGFsbCB0aGUgSVBz
IGluIFJaL0czUyBTb0MgKG1vZGVsZWQgdGhvdWdoIE1TVE9QIENQRw0KPiBzdXBwb3J0KS4gVGhp
cyBpcyBob3cgaXQgaXMgY3VycmVudGx5IGltcGxlbWVudGVkLg0KPiANCj4gVGhlbiBncm91cHMg
b2YgSVBzIGFyZSBwYXJ0IG9mIHBvd2VyIGRvbWFpbnMgUERfSVNPVkNDLCBQRF9WQ0MsIFBEX1ZC
QVRULg0KPiBUaGVzZSBwb3dlciBkb21haW5zIGFyZSBpMmMgY29udHJvbGxlZCB3aXRoIHRoZSBo
ZWxwIG9mIGZpcm13YXJlIChhdCBsZWFzdCBhdCB0aGUgbW9tZW50KS4NCj4gDQo+IEZyb20gSFcg
bWFudWFsOg0KPiAtIFBEX1ZDQyBkb21haW4gYWx3YXlzIHBvd2VyZWQgb24gYXJlYS4NCj4gDQo+
IC0gUERfSVNPVkNDIGRvbWFpbiBpcyB0aGUgYXJlYSB3aGVyZSB0aGUgcG93ZXIgY2FuIGJlIHR1
cm5lZCBvZmYuDQo+IA0KPiAtIFBEX1ZCQVRUIGRvbWFpbiBpcyB0aGUgYXJlYSB3aGVyZSB0aGUg
UlRDL2JhY2t1cCByZWdpc3RlciBpcyBsb2NhdGVkLA0KPiAgIHdvcmtzIG9uIGJhdHRlcnkgcG93
ZXIgd2hlbiB0aGUgcG93ZXIgb2YgLg0KPiANCj4gVGhlIHBvd2VyIHRvIHRoZXNlIGRvbWFpbnMg
YXJlIGNvbnRyb2xsZWQgd2l0aCB0aGUgaGVscCBvZiBmaXJtd2FyZS4gTGludXggY2Fubm90IGRv
IGNvbnRyb2wgaXRzZWxmIGFzDQo+IHRoZSBDUFUgaXMgaW4gdGhlIFBEX0lTT1ZDQy4gSWYgeW91
IGxvb2sgYXQgcGljdHVyZSA0MS4zIFBvd2VyIG1vZGUgdHJhbnNpdGlvbiBbMV0gaXQgaXMgbWVu
dGlvbmVkIHRoZQ0KPiByZWxhdGlvbiBiL3cgdGhlc2UgcG93ZXIgZG9tYWlucyAoY29udHJvbGxl
ZCBieSBQTUlDIHRob3VnaCBmaXJtd2FyZSkgYW5kIHRoZSBzdXBwb3J0ZWQgcG93ZXIgc2F2aW5n
DQo+IG1vZGVzOiBBTExfT04sIEFXTywgVkJBVFQuDQo+IA0KDQpEVCBkZXNjcmliZXMgaGFyZHdh
cmUuIFNvLCB0aGUgcXVlc3Rpb24gd2FzLCBmcm9tIHRoYXQgcGVyc3BlY3RpdmUsIGRvIHdlIG5l
ZWQgdG8gZG9jdW1lbnQgUERfVkJBVFQgZG9tYWluLA0KYXMgaXQgY2FuIGJlIGNvbnRyb2xsZWQg
b3V0c2lkZSBsaW51eD8/DQoNCkNoZWVycywNCkJpanUNCg==

