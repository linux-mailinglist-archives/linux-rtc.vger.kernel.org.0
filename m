Return-Path: <linux-rtc+bounces-6649-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bfj7BFeXL2raCwUAu9opvQ
	(envelope-from <linux-rtc+bounces-6649-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:10:31 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0E683AA0
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:10:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=FbYcBBA9;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6649-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6649-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2209B3009FB5
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1353388393;
	Mon, 15 Jun 2026 06:10:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCC366045;
	Mon, 15 Jun 2026 06:10:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503828; cv=fail; b=W1sCgmmwC0BfrbCRr81PfaH+7FJX92Nu6TuZ6MLw2n9CeQ0SUt2JS4F2s5WU93L6rBfUIqjm0Lhe4oVW21iybJxk+FYpqxWLslEPAA4Hk0dXkc/8iQweltMYmutZRg5fTR1KYz24wroWox+2IEQlOmQoZmV7wmTDA12zf73gEU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503828; c=relaxed/simple;
	bh=WMBb+gLQXFVNO3thznmowOnbfktLyI0sogFrWY9RD7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=StMB8o3bUDlsmtlW8IW2INA11nyIebD+/Fu0Sunr3CsN56vz1ay2It7zdMY42gJ7SH34P+koTkPWPg6KfhqZ/jooE4c9tVhVuo388GvEkRIADt15cSp+tYuq2mibWiFRDc0YbubH9i8Ozvtbll1Ck6L9CbUhDvh7dwJtm9Mp9fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FbYcBBA9; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvqhziYti6f2HXKYdBjT1InugzjRDqzVh6GGXf5g2nvHdhOKFRByovvc0Ute8TTs9piAYLRR3kMG4K+xYesdIe2t4joGeGVo/3SqGIjeNerdHLCjL1U5bNd5H0dkrv6E3DH9HNw/ck/n00Casto3241ipJNYHlA1NvVvlRccSanWHTTYwfcuD+UzhaYi/A/OfrtZlNannsZAHAzo7yhxeL4daK1ZwWKH7D/ABeF/u/sRh4loQ/CJmLOBJgLBdFS487MyOJtwFF34XvMtey079/KzwBGv/ZTomlkwzZSBf9cz8tazFZTlcbx8HVZizruDVwiQYmvCRMyoGUJTEFN7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMBb+gLQXFVNO3thznmowOnbfktLyI0sogFrWY9RD7s=;
 b=jR8eVyeIHgKXtxaA97US6afRpGgyHpCsko9vyq73co8oi7ZY3l2C4wqDR4XuMwD/1c5S7cyAfYXM+SJ1T7j6dWmsW3E75/eyIGPwvIsZ/aw+ahEuOjaFpr1gqTnuBatH3mf2Ht9ri0UiWoI8tXnvw8j8FbtymvqzpNKQEM+Dy/47DKS8u7IvIfO2MBGBZOVZOCJTZbp7JpRds9sq2AoTQGanlVTOUxw92MDswrLsTYoMheNzKMLwNP0yaSg5tX1oF1XeDyR1Y7f3GaCw+hU7wDJ7MyTg1GXJTvYXIvC4Rl2AXmj7r2qaLIwI0l94fqw/CZbkmrivVpvaQROGi0+yBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMBb+gLQXFVNO3thznmowOnbfktLyI0sogFrWY9RD7s=;
 b=FbYcBBA9qX9ozxxcAyER74HbEDXAv+emRihOxiR4Wz5yJ7VXRLsTUCz7F7N8kl8+kB8Qs4reisDmEtIITrV3jjAoWGFbuTNAEFKY8ECxICM8liTbPDQkirPCPYdtwwB467dX618ZrWBqcZAiik6sd9sQ2WyEc0YmUrTRWd5jckX3lei2nbEQsV614HRausZSOmg4d5x+qp8+gohvgeOQE5iIM35jsipIvPVHnUwI+AggxrNMg3Bi/SP8d3Rwh7N+nZee71WTn/u48CCATghs1gqDmcbEy4igNJfV+1RBNIEh8VJcqrVz2rSObSP+vBkXUMY20YQr+TOIWaQT/03dYQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAWPR04MB9808.eurprd04.prod.outlook.com (2603:10a6:102:383::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:10:24 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:10:23 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Daniel Aguirre <daniel.aguirre@nxp.com>, Pankit Garg
	<pankit.garg@nxp.com>
Subject: RE: [PATCH v7 2/2] rtc: Add NXP PCF85053 driver support
Thread-Topic: [PATCH v7 2/2] rtc: Add NXP PCF85053 driver support
Thread-Index: AQHcX5YU5pUieeS4fkCa5+XGoZ6rvrZAW8Hw
Date: Mon, 15 Jun 2026 06:10:23 +0000
Message-ID:
 <AS4PR04MB936247146477E8312D89740BFBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
 <20251127120456.1849177-2-lakshay.piplani@nxp.com>
In-Reply-To: <20251127120456.1849177-2-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAWPR04MB9808:EE_
x-ms-office365-filtering-correlation-id: 8e4d55c8-c4f3-4696-6bfa-08decaa4c944
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|38070700021|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 c4sI54CfNq6QapaFALxn2c5Y4ppB8tqHLrxp977MwU6RGguUMO+IilkN0pwHIsMsNPcUDVTOqg7VIWxDbe5QYfk9q9a/gcURlJfNUNWE09mKQnxFdZBwHv7NrU81+TMJFK1UwIVf8nAmW56FGftRUu7WB9DedVqixEoz6O5y9XSwTnD0KQ6oAYIJWrs6V2Yv43VVIQYH38u0SqItbqr+aXuOedaXM5IgpGuxkzxWpLow2ITL9ZOcmEv9hT2qUxyTd91yXdLsnZ+EAa6s8067/W+/zRL9iacMXva3PDAK3g3GMQn1GmHW1sBN1r7LZOFOBGna8ekMGhkke+evPwee+EHy5Df6JvJTo+otfEkPVojPni1V5+Acokpsa5pWR+ibfCtIIsazL/ctQ38zxhVfi3/lRqZ3H5kSWhfDMcclAw21I6FoapTJr1hzR4Civ0Y0RJkXiHdGmRiV00oatuOky4uUSyjyKd3d4Go5SDRSiKGKeThNEfLyXyMepNnbJDceE0+XL18uykfPoVtaOEmco4sfreZg6zprDTjdR36a2pC3ZDmo+E961Q2Gd5N3P14Exysuys1TzVNKll7mE4f4dnpPY6BlViD9+Oohq8/iRqd+LIrgpMT2vYwT+BN1YQFRmVWnfwoAdu31rVj5Lh2CTL9U8LaVaV0mvoayjbU09DxMejL/X0orybzOcaNdHwVGjO+4/GuL6riJ1ry/1pOk87o2qO1ZMYqfklIj5dwkvvwi7XJQ+yxa5NNBBjG+Xr08
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(38070700021)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjdYMVV5Nzk3ZEdjYTlhaVJseU1yTVpZRVZDQ29GYVJiTGZIUFpKbWZ0NERI?=
 =?utf-8?B?R2ltT1pzQVhsbm5iS3o4dE1zZDM1ZnpLZnl2d1Z2NDFiNU5ET29STWd1ZVow?=
 =?utf-8?B?ckZrZ1RDaFc4bVhzenVlaE8ybjhPQ1VOVC95V0hMc00xakozZ1l0dWE3My8v?=
 =?utf-8?B?Ykk1cVBqdVlVNG1GcHNZV3dvV01CYnhRQy9EV0E4dXJZbWxRY09wZTZIU3dk?=
 =?utf-8?B?bTF2RE1JZTNnMk9xQTVqTllUcFZ1V2ZaSEo2UXAyaHZjRXRZVTR2bFdaT3pp?=
 =?utf-8?B?b3E3T280dW0ra0R3RGNUV0RMUkU5a1doaVQ5TVVBSm0xVFBTZzNPb1BtT3Vj?=
 =?utf-8?B?Uy82ZHgrQ2pPNVowNjdEZmVTd0dGZnVybVdpTCtSTnU2V2FzbjdhbzZTbEMv?=
 =?utf-8?B?NVo2Z05ka29oWUR6VG52MEYyTlcyaXlGayt6c1J5TEUydHQ1SitvR3NNVkNC?=
 =?utf-8?B?VWU5Vmk1V0JXTEdnVFZ2TnRNNVhvQmlaU2ZQYUpWcEtDNUdQd1ladFlyUHNN?=
 =?utf-8?B?RXNrQ0tjeFc5c1ZKZmMvVkI2b3JaZ3BnMmJucFo0S0FuN29qVzF3TE8yM2Ju?=
 =?utf-8?B?ZzQrZ3ZyQ0k3ZmVyeWRrL2F4MTZCZUliWXJWOVl1UzU2QkpKRUl5QzBMczFv?=
 =?utf-8?B?WWR4M2MwVmx0M3BxL0I4RzVEZWlSNG5RekF3MndCRnJQcWRDSXV4ODFCYUxJ?=
 =?utf-8?B?MllWRU5Vd3FxRktTelFwVlZXRHVjeE5EUnp1MWRpR3dNbVB0eVo0MFd4d09l?=
 =?utf-8?B?ZGcyREtOcmF3dHJ0WnU4T094MHd5NHpPT2RPaVdPUmZDYnVRLzJBQkdLQzZF?=
 =?utf-8?B?T2owNDNMcTVlNEtUTFRGR2h6cHBmWXVic0prZk1VSkVPSGwzL3dTejBVVjhQ?=
 =?utf-8?B?OHFlQzN0MkNzRUM1YUhlWDQ1cW41RndWN1pxRllEOFE5cUFTQ251aUlwZDRZ?=
 =?utf-8?B?Q3RwbmNaS0E4ZnFoTkRFQ0xxU0ZabFVUT3ZhaU9UMWVZcHlCcVAxcjAyODQ2?=
 =?utf-8?B?dk9qKzJRVHNtUDNDdUpxUFhVbFhESkMvMkxwalVqNnkvVUVORWI3Q2pzVUFt?=
 =?utf-8?B?NzRMd0EwN09WODIxSFRuL3dpUlQxT0tIeEpPSW9talEwM1YwRXFVRTZ6bjNU?=
 =?utf-8?B?WXZTQ1BwRXpCeHhiNkt0dWU3ZitVK2MxQ2NQWHo5ZzliL2tKL20zRzlNNzVv?=
 =?utf-8?B?Zm00VHYzaUIyaHlzL1BXUmV6b3FJenkxMnNCY3ArRE9nU2VpUkZyYUgvQjRm?=
 =?utf-8?B?VUhjY2dwTytYY2kzVG5tdXRDR0pkaUJYQVBEaC9QMFVJWWlOKzdJQk5YQS9a?=
 =?utf-8?B?MXQ2a2x1Rk5oTHNIcmE1RXU0Tjk1UGRPNnd3YnpPcE5OTW5ReGoxNXh6eS9R?=
 =?utf-8?B?R2czNmt6U1pXdER1QkVaa0pGanBZY3M0ejNRMXVGbjZ3eGltRmwvTmRmOUMr?=
 =?utf-8?B?cklkUXlRY2N1SkEzSkR6K0lNczFqT0JSUW0rNUpqT0tWYXZPWThnQUlsdDFq?=
 =?utf-8?B?SG4vQU04TmZmTmxFWUJCSkMzSkVMcG9qZDY2ODY1Wk52Q0ROZHE2SXpwa1p6?=
 =?utf-8?B?bTRZRlROTDRlcS9jRFVMVWhoYkJLaUpzRllNaUpvZGRydXUxckwxcEtuaWlr?=
 =?utf-8?B?TUxkN3k5WFoxNnpZYXVQRE5oNmdLV1YyRXZJVjY4VExmNkFMaFQ2SlhIbWtE?=
 =?utf-8?B?OVJYN2hrTkxnUmRJREx3R3lGQ2E3cWs5YUZwcUZ0VG80RXl3SmQ2ako5L2FF?=
 =?utf-8?B?emNzaWRYRG1YNER3RnVrK1BXbzRVSWlQVUV2MUxoSFVIaVN3RE1odklFR1hZ?=
 =?utf-8?B?NEtSNWhnSXN3QmQ1MTBFd0hJeU9nQzRUM1dMblFmOTR5THJJWHU4aGR1U1VZ?=
 =?utf-8?B?ejRFVXpCQzRjVVlHMDF3RGRjdGErOFAwVTNua2x5cjBwdzhuUi9nUkI5dUly?=
 =?utf-8?B?U0RGaStWcytyMVc3T0ZLd3kyZXBUclFCUVprVVFFQTJkb3RUTkNzM01yZFZi?=
 =?utf-8?B?Yis3Rjg1MFVXbU1BL204TDBhYXlDQnBCRlVkdWJPQ0U0M3ROckRZQWQ1RnpE?=
 =?utf-8?B?UUFTeXh6cHFIU1laeFlQcDR4Zkh1Q3NPcTBnREVTTGdaSGdlUEJqR1Nic0V6?=
 =?utf-8?B?VEtWMVQ2V3I0ZE41TFl1Y3crQkZiS281VDRSNDY5TGZoL0RZNzRlU0IvSmJy?=
 =?utf-8?B?N0pPWDgvVWViQS9iREZWRWFrSUsyaXh3TGlQSFBlMjZ4bVBpRmFqZ0hwSXF2?=
 =?utf-8?B?MURvdmc3Ymk0WFpFbFNDekRib0Q3Mm9rMko4Z1kxdGpXU1QrNUlJRkNBcnA4?=
 =?utf-8?B?VVpWamtCNDdvQmZDQXVDblFBQXRjL2dVY3pLUlJhZ3BJaTI1a3Fndz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4d55c8-c4f3-4696-6bfa-08decaa4c944
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:10:23.3214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ik+W1yMX7oQ2nCTv6X03Lqo+NK6vvQGERtQEhXOX3kCQ5kiF/8ytTll6UHwsY3qIorevhFAsTjLqC6mh0tvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9808
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6649-lists,linux-rtc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lakshay.piplani@nxp.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:vikash.bansal@nxp.com,m:priyanka.jain@nxp.com,m:daniel.aguirre@nxp.com,m:pankit.garg@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[AS4PR04MB9362.eurprd04.prod.outlook.com:mid,vger.kernel.org:from_smtp,nxp.com:dkim,nxp.com:email,nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60D0E683AA0

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExha3NoYXkgUGlwbGFuaSA8
bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyNywg
MjAyNSA1OjM1IFBNDQo+IFRvOiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbTsgbGludXgt
cnRjQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJv
YmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBDYzogVmlrYXNoIEJhbnNhbCA8dmlrYXNo
LmJhbnNhbEBueHAuY29tPjsgUHJpeWFua2EgSmFpbg0KPiA8cHJpeWFua2EuamFpbkBueHAuY29t
PjsgU2hhc2hhbmsgUmViYmFwcmFnYWRhDQo+IDxzaGFzaGFuay5yZWJiYXByYWdhZGFAbnhwLmNv
bT47IExha3NoYXkgUGlwbGFuaQ0KPiA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+OyBEYW5pZWwg
QWd1aXJyZSA8ZGFuaWVsLmFndWlycmVAbnhwLmNvbT47IFBhbmtpdA0KPiBHYXJnIDxwYW5raXQu
Z2FyZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjcgMi8yXSBydGM6IEFkZCBOWFAgUENG
ODUwNTMgZHJpdmVyIHN1cHBvcnQNCj4gDQo+IFBDRjg1MDUzIGlzIGkyYyBiYXNlZCBSVEMgd2hp
Y2ggc3VwcG9ydHMgdGltZXIgYW5kIGNhbGVuZGFyIGZ1bmN0aW9uYWxpdHkuDQo+IA0KPiBGZWF0
dXJlcyBzdXBwb3J0ZWQ6DQo+IDEuIFJlYWQvV3JpdGUgdGltZQ0KPiAyLiBHZXQvU2V0IEFsYXJt
DQo+IDMuIFdha2V1cCBTb3VyY2UNCj4gNC4gR2VuZXJhdGUgdXAgdG8gMzI3NjhIeiBjbG9jayBv
dXRwdXQNCj4gNS4gUHJpbWFyeS9TZWNvbmRhcnkgaTJjIGJ1cw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIEFndWlycmUgPGRhbmllbC5hZ3VpcnJlQG54cC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFBhbmtpdCBHYXJnIDxwYW5raXQuZ2FyZ0BueHAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBM
YWtzaGF5IFBpcGxhbmkgPGxha3NoYXkucGlwbGFuaUBueHAuY29tPg0KPiAtLS0NCj4gVjYgLT4g
Vjc6IC0gQWRkcmVzc2VkIG1pbm9yIGNsZWFudXBzIGZyb20gcmV2aWV3OiB1c2UNCj4gZGV2X2dl
dF9kcnZkYXRhKCkvZGV2X3NldF9kcnZkYXRhKCkNCj4gCSAgICBjb25zaXN0ZW50bHksIGZpeCBh
bGFybSBJUlEgZGV2X2lkIGhhbmRsaW5nLCBhbmQgc3dpdGNoIHRvDQo+IGRldm1fZGV2aWNlX2lu
aXRfd2FrZXVwKCkuDQo+IAkgIC0gU2ltcGxpZmllZCB0aW1lL2FsYXJtIHByb2dyYW1taW5nIGJ5
IGZvcmNpbmcgMjRoICsgYmluYXJ5IG1vZGUgaW4NCj4gaGFyZHdhcmUsDQo+IAkgICAgZHJvcHBp
bmcgY29tcGxleCAxMmgvQkNEIGhhbmRsaW5nIGluIHNldHRlcnMuDQo+IAkgIC0gRG9jdW1lbnRl
ZCB0aGUgMjAwMOKAkzIwOTkgc3VwcG9ydGVkIHllYXIgcmFuZ2UsIGV4cGxhaW5pbmcgaG93DQo+
IHRoZSAwMOKAkzk5IHllYXINCj4gCSAgICByZWdpc3RlciBtYXBzIHRvIGxlYXAteWVhciBiZWhh
dmlvciBpbiB0aGUgZGV2aWNlLg0KPiBWNSAtPiBWNjogbm8gY2hhbmdlcw0KPiBWNCAtPiBWNTog
bm8gY2hhbmdlcw0KPiBWMyAtPiBWNDogLSBIYW5kbGUgbXVsdGktaG9zdCBvd25lcnNoaXAgZXhw
bGljaXRseSB1c2luZyBwcmltYXJ5L3NlY29uZGFyeSBidXMNCj4gaGFkbGluZy4NCj4gICAgICAg
ICAgIC0gUHJvYmUgbm8gbG9uZ2VyIGNoYW5nZXMgYW55IENUUkwgYml0cyB1bmNvbmRpdGlvbmFs
bHkgYW5kIGRvIG5vdCBjbGVhcg0KPiBTVC9BRi9PRg0KPiAgICAgICAgICAgICBhdm9pZGluZyBs
b3N0IGludGVycnVwdHMgb3Igc2lsZW50IG1vZGUgY2hhbmdlcy4NCj4gICAgICAgICAgIC0gUmVh
ZC9TZXQgdGltZSAmIGFsYXJtIG5vdyByZXNwZWN0IEhGKDEyLzI0aCkgYW5kIERNKEJDRC9CSU4p
DQo+IGNvbnZlcnRpbmcNCj4gICAgICAgICAgICAgaG91ciBmaWVsZHMgY29ycmVjdGx5IGZvciBh
bGwgY29tYmluYXRpb25zLg0KPiAgICAgICAgICAgLSBNaW5vciBjaGFuZ2VzOiBkcm9wIG5vaXN5
IHdhcm5pbmdzLCB0aWR5IGVycm9yIHBhdGhzL2NvbW1lbnRzLg0KPiBWMiAtPiBWMzogQWRkIE1B
SU5UQUlORVJTIGZpbGUgY2hhbmdlcyB0byB0aGlzIHBhdGNoDQo+IFYxIC0+IFYyOiBubyBjaGFu
Z2VzDQoNCkhpLA0KDQpJIHdhbnRlZCB0byBmb2xsb3cgdXAgYWdhaW4gb24gdGhlIHBhdGNoIHNl
cmllcyBJIHN1Ym1pdHRlZCBpbiBOb3ZlbWJlciAyMDI1DQoodjcgb2YgdGhlIFBDRjg1MDUzIFJU
QyBkcml2ZXIpLiBJIGhhdmVu4oCZdCByZWNlaXZlZCBhbnkgZmVlZGJhY2sgb24gaXQgc28gZmFy
LA0Kc28sIEkgd2FudGVkIHRvIGNoZWNrIGlmIHlvdeKAmXZlIGhhZCBhIGNoYW5jZSB0byByZXZp
ZXcgaXQuDQoNCkkgdW5kZXJzdGFuZCB0aGluZ3MgY2FuIGdldCBidXN5LCBidXQgSSB3b3VsZCBy
ZWFsbHkgYXBwcmVjaWF0ZSBhbnkgZmVlZGJhY2sNCndoZW4geW91IGdldCB0aGUgdGltZS4gUGxl
YXNlIGxldCBtZSBrbm93IGlmIGFueSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIGlzIG5lZWRlZCBm
cm9tIG15IHNpZGUuDQoNClRoYW5rcyBmb3IgeW91ciB0aW1lLg0KDQpCZXN0IHJlZ2FyZHMsDQpM
YWtzaGF5IFBpcGxhbmkNCg==

