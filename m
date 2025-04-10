Return-Path: <linux-rtc+bounces-3910-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3925A846FD
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 16:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E79A3B55A7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 14:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA26128C5D2;
	Thu, 10 Apr 2025 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H1BlZ+Ha"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5D283CAF;
	Thu, 10 Apr 2025 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296676; cv=fail; b=YVA6ZfMrxSbp4/68yaOHy4rP9ztPhlgfjVconeIisNgexMiuVbepjtAPGfqVKR/xGtgg73/zXNrlnXfsosDyimvY5eUt8XUQ4z55bjPPUGy5+HBRvugi/2o5D18Ph3UCgIw+D5W6p8I9YqLkCGKBejRj7/FaBjXc8bR1N8l1OEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296676; c=relaxed/simple;
	bh=tMM9YBF3S7iefeNAkt4gRGF+YAi+Su0esCO/YLtL2tI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UV+g2PORWptf+vlOQImE87DvXgh5tkXidG0rew1udGzTe70mSYdsHX+OA8Sh61SgMfBhM1y68sFAa4sEPp8m6kH/xSh3aTM0I2fPlYm8Dx4uzABe5xcT6L9Cy/M8KXVrLJaBS7GdCUt8pnRdnp22eqbuZexhmqVjwE4Ob2K1fGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H1BlZ+Ha; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqxPWXhZbSa9otXHxEUV3NPoi4XcgpHroKkUEgywUlmCplrX4Y6KVaRh3q7IeIJlh9GelMsfI6orhCvoRPzu3s48AuASRg1Dbqv5piYAebB1N1b7PLUusrAcCQAxIxajG5zTRyND8QXSDUaF1SDzfGd1M+VxyNwn3ET9iuMUdbpTX+BWqcvaXKDST9KauRMrG1pIub9wDFnX9isK37e62elz1BSwcJm0/4+XvIE3ehdFm88xIfyTGmMNRC8pk4guImBcDB82WeglKn5s9yChKCJau86xWh8OjBuG/wtSOAONrAZ5pg+rgNnmP22VVdJUmOLBFiwQBLPM02CJLjJq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBcOcZq6nvwAUFOhGPFgTVMrk2YbR1K0/NVCkSNcEmg=;
 b=KmNsQxGmkErDbp3mkzb/vd2276NLCKUCYJ4iROt5jL0Fi/OcWfYWI+Xn29Hgz/HfLn3evNWffYHRRgnJ4/q5goRvy/zvwDCBhOaygzagibgaQ5Dhl9atGBDdYDwPpYJ1eLNPoglIF/B1yyMntV2jqME1PrnM4KmPNlxtyCEDUxMhUPFiYxETkcGpSP+XGj9a5wSQJnIMwRsSM+QXtYPmTE2l4isRszD1FZjw3iLZ/SQDHBi8MqMTUOVO5emXsuDxNbmb/dZpJ7WyGmweFNdG2UAV3wOiiRJLQa2I+m8qcC0xre6SaMnlnijiGYyjAxj/qd4LSzsN93vODDroNypdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBcOcZq6nvwAUFOhGPFgTVMrk2YbR1K0/NVCkSNcEmg=;
 b=H1BlZ+HaLqWiZggq99wZbkHbZo+23IgZCrhgqREZ/+9S1r49H0fuSjoQNk0XRyYd94LrFhEjobUhg1d34qpn9G+lByBjCu14L5TEbDoVqigpazq0HGwXA14PR6jjRpT0eWo/Bo+jz+n8/fFopkf/rx/gnTAjNVaBt7p/WCwUa0oy1r2FL13fbGMq1HXo4nvzklfUB8Mkh/s4JRP+k26mfqxmrt0BiwMOwaVD1t2cUTDPsG9kRH79dtUZVy8RKfbDG8x0RJwLyYiCU3S4o/BM6+V59IMsazNuPtcOXr3HypltG/xn5eGGdBaaSGQk6n8hgpBFroBjOf022yMZV/bxlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10752.eurprd04.prod.outlook.com (2603:10a6:150:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 14:51:10 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 14:51:10 +0000
Message-ID: <652aa23b-ba12-42c3-94b7-8d0bbe548aec@oss.nxp.com>
Date: Thu, 10 Apr 2025 17:51:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nxp,pcf85063: add 'no-battery'
 property
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
 <20250410082548.3821228-2-ciprianmarian.costea@oss.nxp.com>
 <Z/fZww9TDLhm66O3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z/fZww9TDLhm66O3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9dac1b-683d-46eb-f13b-08dd783f21a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1QzRWNQd003cjI4SlViZmNqRytQVDJxUTF5Q1JUdnpVbFpIc3o3emRtVzZU?=
 =?utf-8?B?S3FkYm5GRllqQjVYQzFtVE9vRnNiNmxqNENKQlZGV1M0cFZqc0gxKzRTL3Ir?=
 =?utf-8?B?MHZUcTVzNGs2alNmeDRHV21rM3lFRkFRUE9YNlM2K2RLS2FkU09ZWHhaRUZG?=
 =?utf-8?B?aE9vQWtsS2liWnVVVlVIT3hsZ2FwN1Y5bXM2QThqblVkalBzSmpmQlpyQ0Yz?=
 =?utf-8?B?TzR1bzhocXphUGpuTDlRUk1UN0FCMmxsNDVIQWRGcDhhNDcyVWViUEdTS3dr?=
 =?utf-8?B?ZytLaVc1ZjBYd3pIZk1BL1h4blVTL0FZbmhEcVFINHBvR3kzTlZDMGVpMkV3?=
 =?utf-8?B?bmg5OUhFbkNWUnVXVTRQVUQ5Y0RkUGlWT08va2UyWXZkc3FRN2ZhL1RYM1BR?=
 =?utf-8?B?S1FYMENXR2I0eGlmUGNTdjJoU2txaVY0STJpanJuemcvREFKV2paT3lGcTU0?=
 =?utf-8?B?bWFRM0F1VWY0MHo0OCt2Zm0yKzdvVVl0dGdIZzEzSTNyOW5xR1I4Um1uQXE1?=
 =?utf-8?B?aGRBcU9wV0taVldqVjhqWDFnSnZSak8yckI5M2dOUTVZTEN3MVo5dnNDRnY2?=
 =?utf-8?B?RW5WK01HQnhXRmFiYVFlNVdBYXFWRHY3bWozQnBmVWpQUU9sQnZHQWhaR0p5?=
 =?utf-8?B?djdRYkNzVm43RHI5cm52T0NpZkRFanI3OWhQbHZkWlRZNlhISW85dnAxWnVE?=
 =?utf-8?B?a0ZVQVIwckk4bm02TmxONE81RFpWaHFtcmYwVXQ5cVBQdklMa3EyWHNYWTd1?=
 =?utf-8?B?QVlhbHpockNBZHJvamlxSm1tQk85SFFBeWRoMkdxamRvRWpzNnBmU2ZGeW1Z?=
 =?utf-8?B?b1BVUVBPMGFVQ2xHTVZxZ0ZBNUpJUGI1VE5yNEtGd0JON3N3NG5VeDFrc0hx?=
 =?utf-8?B?UXd2cmJLdDBSYVptZ0RoZ2grNE0xcnV4Tzc0REZRL293dWw0eVFuUHV2Mm9T?=
 =?utf-8?B?aTNkMmRhU1d4cnhHeCtyLzZHNEpWREhrMW8vSkNJbWNnTkkwVW5KN1BOYXZj?=
 =?utf-8?B?T3dkdU1TY29rYzZRRG9CQ0tldlAza250d2JtTUZtQmJpdzdlTGQyZFRzUnZ0?=
 =?utf-8?B?ZmNqT21Ubm5kOW84dnQrcjY4SVJpM1FDMjBhem9mWk9FRUFnOEhIV25zNDBZ?=
 =?utf-8?B?Q1JmLy9rY3FNUlRoU1B5ZnF2ODF5UktZUnZzQS85akhUdi9tYWlIZWgwZ3hO?=
 =?utf-8?B?cFBUMmJoV0s2emxROGc1QXlJT1hOcU5KNVFDTVl5a09KMnBqcWlmZU9uYlZB?=
 =?utf-8?B?aENpQVBGTm9HMGZ5ZDI2RDhYWTZNNEdsZUNxNzlrQ2M3NS9OYXRUaHk1MnFW?=
 =?utf-8?B?am12ZnZTNWdNdVI4UkZ3b3JPcnhVRS9HaUxpcThyODU0bEdqZFh2dkdZcFdm?=
 =?utf-8?B?R09IM2dKRklNQTh1S2FpWVdDVUdoNlppQXRsdjdGOXNrZC9MMnJrbWs3SS9U?=
 =?utf-8?B?aTJ0QURhLzlBcG1RczBPbU4rRUswOHNtQktaNURTQ0JiUVhEUUpZU0RkTXU2?=
 =?utf-8?B?Q25rRUx6VlhCR1ZXUDZFeDJNaVF6Y1NMZjN0UndHY3J2TkllWlo4QncycUd1?=
 =?utf-8?B?QWZzQlMzZUhUTkNqNTBJR0Y3cDdBdXZCSDBheTBsaHVqbkVib0dKaS9jeHJU?=
 =?utf-8?B?T2tSMkY2dEE1QVRHazlwbVlCRnVqZnRoMXc1c2RBQ0NiMkcwdG91ZEVnVlRu?=
 =?utf-8?B?RnNRSm5XRVFsaVVxcUFhd1JFeVNra3RnM2s2b04rWUZTWlRKZnB6VDhjUzc5?=
 =?utf-8?B?M0dMZVd1L2d3Tjl1MzQvUWxNcXJDWTJBeDNJQmRsaXQzVldzbGl1RlV1Tjk1?=
 =?utf-8?B?Um5MQmdyQXRWWUVIS3hYS2daYzlGUzhiWkROT2JQZXoxOUJPZ3hqY01jVllh?=
 =?utf-8?Q?hdHFORhwHh5p0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmhWUDlxNTF0T0FUOXQ5aThuQjdnVGMySEpVMERVdmd5dTZXV0g4by9QYk0w?=
 =?utf-8?B?WmZ1bit3QmlMeEFvSU4wZnVEb2hLajZVZmlSNU96Mm1XNkg0dXFWY2VoUzhx?=
 =?utf-8?B?UmZacWsrYUYyRU5EcTYrZ0ZNL0lVb3BTTXFMeGF2MmFRc3RHYnZESnhFc2M5?=
 =?utf-8?B?ZTFqL3hNdVJ3dThObEpBaUEzZWdRUGRsU3BpdDlyWDZUbFgxUXJHdHBTMVVD?=
 =?utf-8?B?TXczcW4xUFpqOXJUV244V3RkZStWZVNnemNiZTFyN2o0S1N6dHlzd0IwdTZL?=
 =?utf-8?B?aWNHc3NmUlBkTGNXUnluUWpkK0FBT1IrK1lCQ2pFU0U2bmlTY1RTTkZ2Vngz?=
 =?utf-8?B?amlkUGpZemlYdUxqbGxtUm1INGRVbnd2aDFvaG0xQzMzWjJ3a3huMHVnOXhS?=
 =?utf-8?B?S2lHL3dqODgvR3Q0cFRrMXFmUEFrTlIra1FVNUI1emJvRDVFR2VRS3M0SC9S?=
 =?utf-8?B?SjB5TjV0MnA0MUVueHlBWGV4dzdaQk9kTGhFYm1VSDhKRmVOMkVxZjNVVndC?=
 =?utf-8?B?TXFwZk9EdUtLRFlWNXNQV2h3aXJhK0xsb2tSZzdBdlRLUFExMDhEdWxSaWhy?=
 =?utf-8?B?Y3RYQVY4MlhSSVp0OG9GU2ZCNnRVL2FXbVh1SjFUS0dneitaKzBDUjhMdldl?=
 =?utf-8?B?aS92cHZHNUZWanNQWFg5bk1zNmt1VzN1bm5wTlkyUVdyVEVaa1NnZk5iT041?=
 =?utf-8?B?Qjg3UzZHNkp5aG9YUVpQbzJBci9LZXdUaHEvV1ZWemlnM2U5aWZXKzYzb0k2?=
 =?utf-8?B?YnU4bHV5bE0rd3BhdzhVNDE3RjJFRjJ4MmZCNmxTQzJ3OE9jaDJ3TDdHVHBu?=
 =?utf-8?B?UVJEd0ZpK0lJdm56UVp5L3VTWWtHUllwQ0hzbEZ5SWs2b0x0cmZiaE1jZDdR?=
 =?utf-8?B?ZHFIKzBnYUhGM2pmeDJCdW9XZi9VUWhObDluaFBmY2ZXRlp6RG5TWWFmVlR6?=
 =?utf-8?B?QzFpNWhxQklpZEErNDYraytNVHcveDdzR1lnUFppR2I2U25LRDhaMkE5TzJ0?=
 =?utf-8?B?UHROdzZZTkE1eG11Qnp2akFQRmVPUEJFeVEzSWNhdWl1Y3VQNm5GZjZuWmhM?=
 =?utf-8?B?eS90dng3NVU3SDdhRk10SGhxRXpIUlpCeUdSaFdodkNKTFRBWnVEQW1mSTkx?=
 =?utf-8?B?SjBEb2hvek5ZZjFXdis1bUNZcnVwcU1pSTNYdnJSTEw3UmxrTm1JOFFFZDZi?=
 =?utf-8?B?ekp1cU1NenBzSG5uU0VPaStmMUNaUmlqVTVaYTVkM3NkK2NyblBaRTFPUHJB?=
 =?utf-8?B?a1lGc2lTN0lLYUtWd1VrU093V2JLeTcydUV5L0ZUYU5XTlVlS29MSTVSUTBi?=
 =?utf-8?B?MDhOT3pSNmh0UVFrbnhtYWVYU1IrZGwxQ2lRQjZFNm91T0ZzdWlMdllGNlE0?=
 =?utf-8?B?WFJGejg5SjVvSDRQQU5wNWdHenZHYUZKM2RIQ0gvMFNLQVRZM3RJQlNGakRj?=
 =?utf-8?B?cmhaZkVTMW16amJ6eDhQZTVPRllqbjFvZmxwcFpLZkhOcHdSelBUOEJJbi9x?=
 =?utf-8?B?aUg1LzQ5Tis4TFZuMjZzWXRvdmhLTUFqSkg0Ym9hU3pGbFdVbW00YW45R0NV?=
 =?utf-8?B?Q0RYcVlJcGNYc082Yk14ME4yci9iOTJlS3lBMFNrcjdmcVpndmJOYlFmWUlu?=
 =?utf-8?B?SWxzWnRUQWUrRXAySlYrVHBxejZ1K0o0YXNaS1FrVTFkVE1pd0E5ZDJiajdY?=
 =?utf-8?B?RWVVN3FlVnlQSng1U3FpSmhNeUFidFJPTGY1d1d2bVN3Rnl4SlBrUEVjMmNr?=
 =?utf-8?B?aTBWMmV0cHdNaE9JaHlZN3lPNmdxbWthSDA0RFVGeTNDd0tKUEROcXl1WVBS?=
 =?utf-8?B?Ujh5S0VUckRDRHNLYlpXZzFQREE5a0RycFRyeGVCSUNsN3NzUDFvR05mMGoy?=
 =?utf-8?B?bmVGOXlzU0tYWU1QQ3RRc015ZHg4TU4wdmpXTHF3VXkySEhaYUhsSklBZUZC?=
 =?utf-8?B?bFlVMVRQUS9DMjhnSnVFeGk4U2cyaVUxYUpVZ1g0WXJlV1ZJK0grRGx5Um1H?=
 =?utf-8?B?SEZZcm1rcWxITDhaSlhjY2FGWW84L2dhNHI5ejQ5MStFdWxQN1NLNmZwaHlo?=
 =?utf-8?B?YUdXOGJtZlF2amM2ekw5eFB3THV2N1lEWkR3by9pT1hRTmNBL00yZXQ3bnQr?=
 =?utf-8?B?WFc3ZnlNVG5wTjlaUzl0QUN6K2swUEtFbmZFZ09ZVSs1eEhtblNXR2QyeXhW?=
 =?utf-8?Q?dRBmkNj366uJmAb2qdsfcnc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9dac1b-683d-46eb-f13b-08dd783f21a9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:51:10.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGZ0HLP1geVBumMddaEXUe1uEiNlXaV1uxOTGl8YQmD5QxkPNPawuhsQFYaOW6O2R1/ToG03raziuQKyRZFDYZiD5BUJfLY5clMOA6LBGdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10752

On 4/10/2025 5:46 PM, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:25:47AM +0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> In case the RTC is not linked to any battery, the oscillator will
>> be stopped at startup, triggering a SW reset command for the PCF85063 RTC.
>> For this setup, introduce 'no-battery' property which can be used to
>> manually start the oscillator.
>>
>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
>> index 2f892f8640d1..b342eb13fb2e 100644
>> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
>> @@ -36,6 +36,11 @@ properties:
>>       enum: [7000, 12500]
>>       default: 7000
>>
>> +  no-battery:
>> +    description: Used in case the RTC is not linked to any battery so the
>> +      oscillator is stopped at startup.
>> +    type: boolean
> 
> Can you use optional regulator such as, vbat-supply?
> 
> Frank
> 

Hello Frank,

Please disregard this patchset, as stated in the next patch review [1]

[1] 
https://lore.kernel.org/all/e64083ee-3374-4bdf-92a3-ce91e1402b13@oss.nxp.com/

Regards,
Ciprian

>> +
>>     clock:
>>       $ref: /schemas/clock/fixed-clock.yaml
>>       description:
>> --
>> 2.45.2
>>


