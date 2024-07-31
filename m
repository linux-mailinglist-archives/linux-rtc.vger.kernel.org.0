Return-Path: <linux-rtc+bounces-1647-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54156942F0E
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A716FB2537A
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5A41B3F1E;
	Wed, 31 Jul 2024 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hl9mXs/p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013052.outbound.protection.outlook.com [52.101.67.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A61B3F0F;
	Wed, 31 Jul 2024 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430076; cv=fail; b=iv20/seAyMvtOK8CdGH+NxnNiSxej26l0QyJEr/ac1xdisBGwZW79UaAIwtZuTQ4bTqRPGelpQP0jmrxRfzydfNYdRh7+PeqyhGsDfp8mcheT4D6UGyTy0CTBfpIAnMt2tI2X2jBTBak+3uc1jc9UiE5RW92Z/MTln5aQVFWts4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430076; c=relaxed/simple;
	bh=QQUxD+WrZ1BoCEejLUiFnTZSyCOU5Rftc8RYqexva2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ek/7fkBsvIhCEWrhntDYm/UASiY6ew1nC35dmsMKLS0fvdY2PItsK/B6pZiYAPQJS3vtmypy4m0GSmG2N0fQ1Lc2eWL6bTNFhrYv3HSmKsBZ9bpXN8j/6z+yuqrYW7GajsSCieO4PIhSXgIgAOuSCuioCi/PjhPVvg/NODuRkTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hl9mXs/p; arc=fail smtp.client-ip=52.101.67.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw2f7C8tLgS2BGLiXIhpjxIGJwg9zfdK80Tgocb19NsZEsLFafMKF7tDJmN1kEQa1C1d70DvaGLMMHvRvs8y0WQBfKKjG5p+hoIZ+O8C6rb9Ul/GYTXzO6wIOjF33Vsn1JcqlcK0/mksULbxmyvH6Us+MZmD+JS9oqdhzFOJS4/s49NW2Hkdoax1BCL4iLfgkeNOZ4ExXqTBCJE+Ob1kFRpu/Ul59CU3JihZ5yoILHj8+j5hE9KvJid1fZr1TxyLrTOIpxxNgz0Cur7wqZI7hwPPTPJe0A2AbMx0pym9A1aeoZ92sKEQL5CSbVE35vLkyM0fLgJyZVoBJ9dqIjf8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WPWBl+UNIF8UJOX1QJA+qTKK8dUxDTksPWRgdZNkUI=;
 b=lCpGzQw5JIaWsNw90G+JAAqvnLXsuAFCkIbiCe6dIMcivVAUAi9g9WEsQZCv/Gi45CdViWQgOsfGlepnfvMZ8Sptzg9Un5xmyFxsfbE8S0LczgzwQdD8KGBxiAerrrRmsJaOtt28+Pm6ZNF+pB92tZ3Z9+wpunJQFtK11N4qysDKSJHzbwnoxC4AYKTyDbHudlNoh6XuwATwRHSnYRLlUC7DyuH+b6/6Ej6HhLWSBpQ/oStq8ehMqoF30iQrHDX/1ZemGc44FzNGtPebGpI3BHQ9oS7vzPWnSUkt5EUwHz9CJqQW1BVBAQrcuZje/wXJ+FR+mgjaThHO3QdRvrgKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WPWBl+UNIF8UJOX1QJA+qTKK8dUxDTksPWRgdZNkUI=;
 b=hl9mXs/pkYuGYXtgy16pN8kduYri4oiATn7eEbF2qMBvacet20MgA7saNIMWTTMr1j+5Rt9QjoNryt3RHNdSn4T9Hjl16/hg4eQL+mrpnJfLLfwjYmYE77FhLHRjxPA96058v8YhGTFgN1GTKto7iVS9DpQZAXUmIvWNn8Y5MGmBdfHZk70a5kMJ4+y4ZKZBu6Hy/IZ/eemHQv746mmqoPCaDuycViGgMCgu5xz5zGY8vKDDmHdiPYC2IWeSjHBIpYNX20lq3/7U3i4jfXPZeUCuTHtAeqGU1sgKvdCyBsPGFdK8nYUIhUwwHzhiedmj61KmHssnSRvZ2SDPnY+bdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:11 +0800
Subject: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=8472;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=nWz3HeeWJlo8Xe0FnLKszmcU0B0giCY0FEpvD/2NDGs=;
 b=EeBKm/mxlzkHVZ43xChsPXtv+gjLWs1SubwDtlbFcta0NE71w4rksKlRu5qeAhJx0WEd0rJGY
 z83MSy8I0HDBpSxGZQ7h/HzFebi7HutXaRfQJgNmp9BFsA63l9/xrQK
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf38bcb-a461-42ba-6c5c-08dcb15efc53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTFrdXBOQnk0QysvcGRLdTd5YTB3TnlGdW1UQ1NURWdrb3p4TjZOVUJNTUE3?=
 =?utf-8?B?SGtsRkRvWVpNYy95Z2dOaHBPL2h0bDQ5SVdiaTQ4VzFCTTlCQnRmUzhRVWRm?=
 =?utf-8?B?Y3ZSZnEzQlMrSE5wOW5wY01vQVkrSVBMekpBa3V4Q3FpTEQrcHZsR0pBMXBa?=
 =?utf-8?B?RmYzcHVMSW9tT3c5RGdscVc0YWE3a1dnanVBdkJSNllCVEJLb0VWViswditw?=
 =?utf-8?B?ZU11LzAweU9xRXpFMER4K0hreEFqdHUyNjErdDR2bDdORXltRUtkVS9TOTZo?=
 =?utf-8?B?ejZaZS94d29HVGdZUnhVZFNuaG9DWHBaQis4ZVc2S2VXSzJyNllNZjNhcDJo?=
 =?utf-8?B?c2RoNXZWeUpoaHd3Y0swSlU3V1RYeFFHTjZjeDJHcWRQQllmZkorSld5Rzl3?=
 =?utf-8?B?Mk1Pd2J2RzBBdWY1UHRXekYwRW1kZDNxdC9ueEczMFlhcm4yUjJBWUN3eFlz?=
 =?utf-8?B?aVdKemNVV2RwK1dpOGlMOGIzL3A4clpua3NtWnkxTmZHSTJhSTVkVTJqb1Br?=
 =?utf-8?B?ZFVaejlsWDNxVlczclhiSlh3MGd2cTBGVWdKbWN1aWNoM3laR1JGTGRmb3Rl?=
 =?utf-8?B?aGlWZFE1Wkw4RVdVckxlVW5xN3o0aTk5WDRnYmhwdEVyWk1rcVhkVUdTSDZa?=
 =?utf-8?B?d01oVnhxdkd4MFQrYm4yd2JYQjNIMGU3bi9rZXdtYnRnREJrZmZrRnlCQzVx?=
 =?utf-8?B?d0o4MkM1UlZFSGNQT0c0cWJuRG1NY0RzTXVqU0pYckFkRE9YcnRPblB5ZUY5?=
 =?utf-8?B?Ris0SDBJdlhHeDM3ZjVUYi9tRUlNYVhwbXR4cWl4UTRsMWlMT24yZlZsa2Fy?=
 =?utf-8?B?NjhwOXFRMjF0eWxQU3VLMVhuMVZRb1p4TzZGdjBieXlVMVUyWFVCUkYvWDRm?=
 =?utf-8?B?RUtIZ0RpeGZJYmF0QytVajZRTUlkS0lNc0c1a2ZUMStWT2tSMURCOUNXNGtD?=
 =?utf-8?B?V08rVllVT2V1QkFUNXFDdmUyd0JKaGRRcU5samZYclFEVklIWlB5d2RSR1pU?=
 =?utf-8?B?MWZVTW13bGZnVVJRcU11Y1o2N2E2dXEwSm5JNFdXTmhTaHp4TkN3ditBV3Rt?=
 =?utf-8?B?T0FIM3lWc0RrNm9QTUVTYzVUc1NuUHV5eUNTck14YXpxZGJHS2FTckIyMDBX?=
 =?utf-8?B?emNpUWkzRjNDQ1pMQTE3d1BUZmpGUnVkMEFjUUE0KzVHOHNINDdlQTZwTVFl?=
 =?utf-8?B?L2pUdXdzcy8xZzVYSUo1ZEgySVZDWUJWQlByMW1ZUmhwWXhCUmpVT3FRY2R0?=
 =?utf-8?B?M0Y0WFVCZU9nNlNjV1I4Ritua0kwaGdDME9KZWlrVTFtN3pPV2E1RUR0eGhP?=
 =?utf-8?B?YUN3UzJBc094VDRUQkFUNXExdEFYY01wSGtBaDUyQkNsaUVrTDJDdnZ0OU9N?=
 =?utf-8?B?TU5yUkZuUy80WVloSk5KVTYzdEZxUFVlOWxSU2NkTW5KbFJDOGVldmlMUzFH?=
 =?utf-8?B?MDRFZ3ZvdEFnNXlTY25hUExIalprTE1QVXczc1RoUTNRdCtKeXcwUVNIeGg0?=
 =?utf-8?B?bGgwVVpJNjRyUkY0UDR0dmZidGJRa0dWTkZlSmNjb0l6VXJDSHlEZXlBUTRG?=
 =?utf-8?B?S0kvRWVrVnRlZUVLLytNSXNxdXU2dFlrTHJxUzU5SkxYcEtCL2k5ejVSR3Fr?=
 =?utf-8?B?WjR0TzF6Y01DKzROazFjRENjZjZpQWx6T1ZLUXVZM0RNUU9UVWJMejcrUE5a?=
 =?utf-8?B?SGVnSVcvZlU4ZEo3SkNqSXhoSHFRWHpEUmlXUUVBNjMwUklROHNnRHFrbXVF?=
 =?utf-8?B?UnM2MkpRd2xmdzQ0NEpQUmw3UnZWRWsyOUxPR3NML1RyYlRNdnpybDRDUVBF?=
 =?utf-8?B?RjAxRFo0b2R2akQxNDNOSGY5dE0xelUxNS9UNjZxRWU0OVQwblVGZHFZN2da?=
 =?utf-8?B?U3piMEkzNWptdWVBQndpMEhGNHVDaXFXTlVxZFlSendQQWdWU0xyN3N5OWJw?=
 =?utf-8?Q?cfTABXPaai8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFl6QVRXNzNCdCsyY2p4eFA4bE53UktHZThXTmxsMmh4MmZaUlRuaUhUSHdU?=
 =?utf-8?B?S3VielRDYVhYTzY0aGJma1R2YmUrby8vdjNVUlEwamFoK1hNVHA0VW1pUEhC?=
 =?utf-8?B?WVBZK3dXZjAvTVBPMGk5cEZ2UTJVRzVxd1J6WTVjM3Y2S2I1Qy84OU1CcWFa?=
 =?utf-8?B?N1R4VWlNL1EzTHl3T1crNSt4dEV0NkUrZUFma0hLVVc5MVdacW9nMHJjcW4v?=
 =?utf-8?B?Y2JWakFOLzNLb1RNWVllYTlFZG53eG94RmZGYngzdHlSaGN4NzhJWDA0SkJi?=
 =?utf-8?B?Y3doNmY5NzFjRkFpS0U1M0hBZElQWHR3bmJHUHFQNGQ1bXMwUWJtMFZFdXRH?=
 =?utf-8?B?RzM4NjB5MjFwbURqb2dGVmRZdXJYbFJSd21pYnNZemFaWWc5OHFzYWRlaUdX?=
 =?utf-8?B?SFhHd3Fhejh0SE9yZGtXaHRmM0tFdTQwbWh6YmU5cEVpWTArOWFNaDY0MTd5?=
 =?utf-8?B?ckZ4azFIbUxoTUFDeHdJaXUwekpNdGluN2gzL1MxbmpDZXpsTlJDdHpxSWRj?=
 =?utf-8?B?bERlOWhEY040TmpuWHNLQU4wZVBwSDJkMU5hYWxhK2xmejJuNmVvZXRSQklQ?=
 =?utf-8?B?NHZhUEE5MlR5TDNwWjB6OHRwOTRCWVRhanZSdUxzRmlxcTJFYjhRUHFIUTRu?=
 =?utf-8?B?R1J5aFJyQmdGNUQvWktRMlpNd3hVV3I1UHZ2aVpPeVdQTXh1azNWdGQxblVL?=
 =?utf-8?B?cTc5ZDgrdG53eXEzNW84bklyUFVKK2RUUEhzcTdpRlRlSzhra1l1QXVWVTZL?=
 =?utf-8?B?V2haRzBzNFBDTUNGRE11VWRTandCd3VFMTRDWThGRWlkK2NkZGRaRVBQZ254?=
 =?utf-8?B?MDc5ZjB6NGVRWExqbDRjQ2I1QkxZdWdGSTI0WDRCbHdsc0dWQWQxaVFMdkNQ?=
 =?utf-8?B?S3pObHQybWZvTDllSDdIQkpOTmFFdEhTNWRSUk1NWnlEakdQb01pR0hsSXBS?=
 =?utf-8?B?WkhVK1hMOTFRV0UzVTdnWFBKRmY1cE9YOWFpRnZqQTdneDQzQzRGdHlxS2VB?=
 =?utf-8?B?cTFKb2YyRHZsejUwVVc2UEhZSnpFVml5aFIwVmtnbGhKSVBXZTVXY3ZMRk1N?=
 =?utf-8?B?TGlNZVpsUlZacVo5OUhEa25PRTRaNGpmQjAwN2VRaGE4eFhod1ozK1pzb2ht?=
 =?utf-8?B?aTBiQ1BmY0NzL3lWeTBsQjBvOGdWWk5nZllLQ0J3ZDhzMTBQSFRFM1hmcWZP?=
 =?utf-8?B?VG43ekRtZVlpOFN1Z2NxS1FEaitKYUlRTFczQnl3eHBxMWRGVng1M2RhM0kw?=
 =?utf-8?B?TkxxVGN1eGNIaEtLVTdqTFhRNi8yRlIwdFBwQVVsdXNEVjVuUkc1RlhXSGJB?=
 =?utf-8?B?MjBaalpLbkljRzR5Mm1rZ3VaMmdsSUsxNXAxeTBVeTZ5N3F6K2RyRThvMUV0?=
 =?utf-8?B?VHNHQUhlWS9SZStuSENnN1JMVjZpR0NQbzB0S2NoVjZhNjFkbDJjSWRNd2lE?=
 =?utf-8?B?VENpVDhrWjZnSmJia2MwaXU2VmRxUkZ2aVpZVC9icUZoTERidk83MFQ1aXJt?=
 =?utf-8?B?SCtoYjlGdG1veXZ0N3p4ZHczL1FGQU1qVWFyMHk1Ry96N25OZlNNOGx0UFZX?=
 =?utf-8?B?bUVXeHg1bTJQOGFPdG80MzZ5MFNGVFloUTlIeXF2T2xPVEllb2JVSHdWY2VZ?=
 =?utf-8?B?VytjSHhidXNGZGUyUmVNbGhubFdia0ZYaFpRRnVOUzBqRTVTK1kzMnpKQ1A2?=
 =?utf-8?B?SExxZjgxTlFIQlRaSkI4MExNZkY0TUJDZXE3eGRORGk1UVVObXo2Uk9rOGx2?=
 =?utf-8?B?KzNURnloOTY2bHRYM2pHWmlta1MvZFZpUWd3d0ZMOG1aZ3k2QWQ2RGtuSzRq?=
 =?utf-8?B?a0NIeGk5VlRuWUw0SmJ0eUlKTFY2TjY1STBESGZjSEVvb1YwRTFWK05LaFNn?=
 =?utf-8?B?TzZLUVVuMUxsNHYvbVZDUTNxUW5CV2pNQjlRNzFhSC9zcE1xMjhxK2pQeTdw?=
 =?utf-8?B?QVIzdEZacEZnZnFvd2E3M1FEbkZLUmlqb3ZUczRDdHZnT0Yxcm9oL2oyYnBq?=
 =?utf-8?B?YXowczZQdlRzc2JkaklRd3RIOHhXakI1blBJL1o3amV6RnVkR1ZsWFk3WU9y?=
 =?utf-8?B?U0s1Qys1WnpPYVVLSUdsRE1CRVBmbjFWRG16UnlabHk2MHVSQk9GL3lwSXRq?=
 =?utf-8?Q?6KB6VUnaOA686qcZ838EZXf7z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf38bcb-a461-42ba-6c5c-08dcb15efc53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:49.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XH0hTeTJy+DHltuEhZjfMn/U6hqdAiSqQkg63wqtFSA6JDB4q9sXwRyRICYczLOhTA3mFwKiAawHhkV42YCnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides BUTTON feature. To i.MX95, this module
is managed by System Manager and exported using System Management
Control Interface(SCMI). Linux could use i.MX SCMI BBM Extension
protocol to use BUTTON feature.

This driver is to use SCMI interface to enable pwrkey.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/keyboard/Kconfig          |  11 ++
 drivers/input/keyboard/Makefile         |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c | 236 ++++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 72f9552cb571..a3301239b9a6 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -454,6 +454,17 @@ config KEYBOARD_IMX
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx_keypad.
 
+config KEYBOARD_IMX_BBM_SCMI
+	tristate "IMX BBM SCMI Key Driver"
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  This is the BBM key driver for NXP i.MX SoCs managed through
+	  SCMI protocol.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called scmi-imx-bbm-key.
+
 config KEYBOARD_IMX_SC_KEY
 	tristate "IMX SCU Key Driver"
 	depends on IMX_SCU
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index b8d12a0524e0..5915e52eac28 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
 obj-$(CONFIG_KEYBOARD_IQS62X)		+= iqs62x-keys.o
 obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
 obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
+obj-$(CONFIG_KEYBOARD_IMX_BBM_SCMI)	+= imx-sm-bbm-key.o
 obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
 obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
 obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
new file mode 100644
index 000000000000..ca430dbb61d0
--- /dev/null
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/input.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/suspend.h>
+
+#define DEBOUNCE_TIME		30
+#define REPEAT_INTERVAL		60
+
+struct scmi_imx_bbm {
+	struct scmi_protocol_handle *ph;
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct notifier_block nb;
+	int keycode;
+	int keystate;  /* 1:pressed */
+	bool suspended;
+	struct delayed_work check_work;
+	struct input_dev *input;
+};
+
+static void scmi_imx_bbm_pwrkey_check_for_events(struct work_struct *work)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(to_delayed_work(work),
+						  struct scmi_imx_bbm, check_work);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct input_dev *input = bbnsm->input;
+	u32 state = 0;
+	int ret;
+
+	ret = bbnsm->ops->button_get(ph, &state);
+	if (ret) {
+		pr_err("%s: %d\n", __func__, ret);
+		return;
+	}
+
+	pr_debug("%s: state: %d, keystate %d\n", __func__, state, bbnsm->keystate);
+
+	/* only report new event if status changed */
+	if (state ^ bbnsm->keystate) {
+		bbnsm->keystate = state;
+		input_event(input, EV_KEY, bbnsm->keycode, state);
+		input_sync(input);
+		pm_relax(bbnsm->input->dev.parent);
+		pr_debug("EV_KEY: %x\n", bbnsm->keycode);
+	}
+
+	/* repeat check if pressed long */
+	if (state)
+		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(REPEAT_INTERVAL));
+}
+
+static int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
+{
+	struct input_dev *input = bbnsm->input;
+
+	pm_wakeup_event(input->dev.parent, 0);
+
+	/*
+	 * Directly report key event after resume to make no key press
+	 * event is missed.
+	 */
+	if (READ_ONCE(bbnsm->suspended)) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+		WRITE_ONCE(bbnsm->suspended, false);
+	}
+
+	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
+
+	return 0;
+}
+
+static void scmi_imx_bbm_pwrkey_act(void *pdata)
+{
+	struct scmi_imx_bbm *bbnsm = pdata;
+
+	cancel_delayed_work_sync(&bbnsm->check_work);
+}
+
+static int scmi_imx_bbm_key_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_button) {
+		pr_debug("BBM Button Power key pressed\n");
+		scmi_imx_bbm_pwrkey_event(bbnsm);
+	} else {
+		/* Should never reach here */
+		pr_err("Unexpected BBM event: %s\n", __func__);
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_pwrkey_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct input_dev *input;
+	int ret;
+
+	if (device_property_read_u32(dev, "linux,code", &bbnsm->keycode)) {
+		bbnsm->keycode = KEY_POWER;
+		dev_warn(dev, "key code is not specified, using default KEY_POWER\n");
+	}
+
+	INIT_DELAYED_WORK(&bbnsm->check_work, scmi_imx_bbm_pwrkey_check_for_events);
+
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_err(dev, "failed to allocate the input device for SCMI IMX BBM\n");
+		return -ENOMEM;
+	}
+
+	input->name = dev_name(dev);
+	input->phys = "bbnsm-pwrkey/input0";
+	input->id.bustype = BUS_HOST;
+
+	input_set_capability(input, EV_KEY, bbnsm->keycode);
+
+	ret = devm_add_action_or_reset(dev, scmi_imx_bbm_pwrkey_act, bbnsm);
+	if (ret) {
+		dev_err(dev, "failed to register remove action\n");
+		return ret;
+	}
+
+	bbnsm->input = input;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_key_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_BUTTON,
+							       NULL, &bbnsm->nb);
+
+	if (ret)
+		dev_err(dev, "Failed to register BBM Button Events %d:", ret);
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(dev, "failed to register input device\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_protocol_handle *ph;
+	struct scmi_imx_bbm *bbnsm;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
+	if (IS_ERR(bbnsm->ops))
+		return PTR_ERR(bbnsm->ops);
+
+	bbnsm->ph = ph;
+
+	device_init_wakeup(dev, true);
+
+	dev_set_drvdata(dev, bbnsm);
+
+	ret = scmi_imx_bbm_pwrkey_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static void scmi_imx_bbm_key_remove(struct scmi_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+
+	device_init_wakeup(dev, false);
+
+	cancel_delayed_work_sync(&bbnsm->check_work);
+}
+
+static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+
+	WRITE_ONCE(bbnsm->suspended, true);
+
+	return 0;
+}
+
+static int __maybe_unused scmi_imx_bbm_key_resume(struct device *dev)
+{
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
+			 scmi_imx_bbm_key_resume);
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_key_driver = {
+	.driver = {
+		.pm = &scmi_imx_bbm_pm_key_ops,
+	},
+	.name = "scmi-imx-bbm-key",
+	.probe = scmi_imx_bbm_key_probe,
+	.remove = scmi_imx_bbm_key_remove,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_key_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM Key driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


