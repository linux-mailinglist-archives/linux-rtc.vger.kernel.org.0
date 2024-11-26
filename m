Return-Path: <linux-rtc+bounces-2630-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2CB9D9686
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6758B2819F
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290861D27BB;
	Tue, 26 Nov 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LAbLNKas"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35F1CF5CE;
	Tue, 26 Nov 2024 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621805; cv=fail; b=LV2xmZ8HBAqO/oKkZy/kxDvSArBQzkvHsdBr8bE+vJgUQxkp7U1BU2hVRJsmxbSDzXo5K7aifthQMEDul0szOXoEKhPzfPkAWNF+O9+eoEm4UaIGH6LCcuvfIs5m1BnxslQMJFok/FB2KXTi/mFDks9SqSm2MGQbsJX+7dThjrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621805; c=relaxed/simple;
	bh=ghYlrrpdO/U0GFlUgKLCeTLQf/z286Ld4c+VTyZ1XkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D4dhwSNWgivqPWuNSqJFnjtk9IooLwOVsVs+mcRCOPREe2LwF7rwog3piHHcILrvf0K2cu+HkpnZ9u0ZsEkvvkdjytGXiJzdCuMV901LygJDQO5olr+b+uqEqVDzFWB4LXEalcgKp79bZUtrJsD+3mK6BgqPCtMx0JUNT9d7cnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LAbLNKas; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn+fK3blvtUbo+bxwmgVZhp3nhuF5Kkv7uESLbZtbZE0nF9bH4Tr3YuGXKJ2ET5giXtc2WbQIzyintaK3GZXS//8wpKBm16sgkNXdZmNSsF4n/7jp3PLqWkbaa4bfFiTkmwi9G9S6TdG5YQ7AhKUDy8aDpip8v8gm5fc7SvcFKyfikYnfxvS8g4gTdDuaWwHkofkfqQ4160RzlwXqt/xCBR6h7lbPm1IlJcOgUz/K0mfKwcwn08H72XNzipLlqXzZvqnrjeeL2oNIdOuU8ekqohnC2s8LEbmfbK+1LnOKT3uDulH2mC8Mr8wOf6ypPWpqUNtgTOOVVkmflOFTlCNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGT7f9f6ionItdWDsRmqGZGyk8+LLofWhC7Kl/ZQ24o=;
 b=dXb9dfmmGzeZbKpRfnjbybWNDAx+d2ncalJTPhaBD1F+lE0vI36Dfsoz5GkyOARY52xb3M4qhUB9rvV7N33eP5/mSvkFaw+aTRBIgyME1lwbTWaye8RKZCBWhqCACUsuclHUJjR91e8D8rNhcKDSe9t+JDCpxq8MzeNrI99el6q8F9a14WrXSRGMnuZVqKjpXsx5ZHDIasyA5uDYZKcCnIvYiP15C5jU4h7YZ9BwyjSD9Ab5kvZAg/CNnq3TXqSlZHugWYf3RviaxY6Vy/N3wlFp6RmQNLwk6poV6VdaI4pPWlaNsQl39R6NFNIQbobjnBH5XowWqV51QVJ9tUl23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGT7f9f6ionItdWDsRmqGZGyk8+LLofWhC7Kl/ZQ24o=;
 b=LAbLNKasWFt839r/a+s8qaouXq+/GcalBGVWVC9vtYr4NbsFdTeElfapHMqNEXWCyaSDlFaf8rENYIucU+CyJAfR3LDZWM3jfMkUnLX2UMnC0T6bEx0BbzoBv1JZ13dexlqzLXGZ3bu3BAhKRnhB0So/auK/oZQB2mU2rh4r7iM9R7mQiVyMZQKwxd8ry7b1BmvxfS2DSNLjsu4R8dneYeDUgHXPrOxMi1bVJInIakXNXCuOdbuhtzd2uqVrmdM5pZEp0Y7KsrQcp3+4HSk6NoA0MuiAmZnfKkpqqP9fbU2U1hhbayzJbMxY9Tio4BsEk63ShGUS4d01OW9+RmIZ5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:49:58 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:49:58 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Tue, 26 Nov 2024 13:49:38 +0200
Message-ID: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::23)
 To DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd0cf8b-f4ae-40f6-eff4-08dd0e1073c7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzZ5T0s5SlA4dHphb3MvQ2RsS096L3YvSTNpRFVEWkk3NXNnZjVjRWlqOVRu?=
 =?utf-8?B?T0diazZDdWxPYTdMSHpWYzBhY0lROEN5MUJLTml6dE1oWW0xZlRmOTJUOXlk?=
 =?utf-8?B?dllhdlQ4QXRscGFkVEUzV05pdGp2V21FL1lON2xYK3BqZk4xcWJMbkl5Si82?=
 =?utf-8?B?SUJXWGZINkgwYUVTNmk4N1VmTk9mTCs5TEhzbVljOG5qbkFkWmhoQ09zS0tn?=
 =?utf-8?B?M0JSNVRwM3djK09MT0x1ZTcwOERMZTF3THNaMU45TWRYbVZyUXhKK3F3WDIw?=
 =?utf-8?B?Wjhlc3lwQmdZbHZWMExwQ0QxYk1Pc29LVDFHVWhPZVFoUWFiVWtjVXdUdHFN?=
 =?utf-8?B?MjBMb3pQUjFvb3JwRmhxMlBJbld1VlpySkVkQ2RQRDlBdFJEa2tsQzM1MEJL?=
 =?utf-8?B?QVlZZ0FkK3A3OGhLRTMreXp3c1AvVHRKYWl0bDBRUXRPMVFFTFYzcWdNRFNP?=
 =?utf-8?B?bVlJZHM5aytKKzBkbnpPcXdSd3lwbkJZUUM0RlQvYjdzYjNvRzZGN2FyR0xW?=
 =?utf-8?B?Tzh5TU9Oa3FGamk0cXYyV2JweXZUN1VXRVZ3cm1UTlgraGgxTXRNUzU1bmRC?=
 =?utf-8?B?WUhKS3FPOGRlSXgwblBKZCtMTUVVL1dvRlBsanVZbUltNEYwci9xV2dlTWsv?=
 =?utf-8?B?MHUydmhGcTg5aHNrY2Z6VTJxTUl2MkpqV0dGU3BaY2xYM0cxekhFYW1STG5F?=
 =?utf-8?B?VnVpM0tJMWlCSENCbzJuL1JvcGV5YmNKN2tWK2ZSc2Nta3NpWCtGNlRBeEhs?=
 =?utf-8?B?SFlnWWZnTmM1cHptN1pjSHY0bDJIUHBQeWFWYkRQc0NlR3N4ckZSOHQvTE9S?=
 =?utf-8?B?RmEza1cvWmQxKzFJN1hBVStXcE9QUGxoT202WWxzczNBNVBtKy9lbU5aSisr?=
 =?utf-8?B?SGlqYjk5cG5BY0lhcWxpUGM5RGRPRzlwai9ENVZhcFdEZ01Oc2JVY1BGN21V?=
 =?utf-8?B?Y3crNEx6dENCWnZCYmdBVEgzT0NGZ1QrMWlNREpvcmc3MWJ4KzVzWlI3b01B?=
 =?utf-8?B?TWJQbTd0SHR1alBuZ3A1djBqa2VTLys5d2J0a0dxbzU4V24vQ1RRZU0wRkxT?=
 =?utf-8?B?aEVkb1NuMGVKYWRsa3pRejBJT0ZIMmxBOG9YaFAwNEdEdHFCL0N6c3ZLOGlw?=
 =?utf-8?B?SE9tVGtyUmRkeThzL25aOVhiT0E0ZitUV2t3M2RvblZDOWdFRGF3cHRuS2ZM?=
 =?utf-8?B?NmhkZXA1K0lialNQbHc3MmhvOUpsbk5ZR1lick5PcTVMdTFiV3I2Y201a0RX?=
 =?utf-8?B?dEZnN09wYUtxZVh2Z3pwa0hoTUtObnBVOFBQQ0FqRnBaWHplSFRLR24zYXpH?=
 =?utf-8?B?KzR4ZWhrcnpSMi9keTBKSXA1MEVQQmQ2bGdtSlBIVlNMWVpjYVlWdkZCcHMr?=
 =?utf-8?B?UkZtSDY1bmcrWmZXUkhYWFoxdExrUWtxeFVEcXYxUTV6ckF4R1VEdWNGZmVy?=
 =?utf-8?B?YUp1QjVRcG5RMmV3a016UWtRdmx6YmVLZXZ6cE1kcU9hQkZIekdrRW16SmdE?=
 =?utf-8?B?STIxVnozeUxCS3lwd0ZVdkhZUTIxcEFRTzdsS2ZuUXdQeFdWKzJ3OEZlWE5Z?=
 =?utf-8?B?SVptcjRSZzBtZUJHM1Q3cFRKN250OEFxOFhzcG5iQmp0UlIxbDZ4SUhpb3Ur?=
 =?utf-8?B?d1hPckQ1R2lMOFdIckVOS3ZLTDFGS3NRVDVnSEtSMTFRZnpiRVdKQmttaldj?=
 =?utf-8?B?dUNlamRBM3h5MzhFVExJTVVoTFJsNnhkUnZqaVROMGU3YXVuSllHdlhpdGJy?=
 =?utf-8?B?eThUSktuVk52Y3k5M0lQWGpFY1lyejNqRi83TkJUa09KZjdYY05aNmg0QnZJ?=
 =?utf-8?B?bUtxVkVTZVlOT3EvTmNyZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?byt3UkdoNlJVUWZ2NUdMMFpVb0N3NU10Tzh3Y2lCSEpUVktvU1FVZit6TDdv?=
 =?utf-8?B?ak00YldLRkkvNkRMWGthWTNuMElxNFdYVjFzZ21FaHorcXFxdUNTdFZsQzZW?=
 =?utf-8?B?Q011VC8wVnF2N3h3Z3pPQksyU0lDMGZjQzIyYkI4VVVsc09LRjJ5N0loekE5?=
 =?utf-8?B?YUN1QVBtMDU0K3VhOFRCd2VGQ01jb1lpZXE5SFU0ZGZCdHlzbWxia0ZiTXU0?=
 =?utf-8?B?Uk1EdDc5NWNlSDZkRmhyaTdaYVpmRW1zL3B3S2hhNHBnSnVlL1Q4cC9SeWlR?=
 =?utf-8?B?TlRkaVdteVB6N3J6ZzNINzVpSXduZ2hVQVlpTGQxSE96M1JIN08vNWRocXU3?=
 =?utf-8?B?OEVHUFFtZCtialhXSHAyckk5cmJySDRpaFlPZ3R6Nlg3OCt5WnJGaStOUS9i?=
 =?utf-8?B?VWpySlVmUHRVTXhJSFJVZlJqZWJMenNKeWZhRmphWFpWdzhRRXNCTDNVUi9F?=
 =?utf-8?B?U0V5SHFJbTRoWkdFTVhaeHRjZ3Bzb1hnK3JoT0gwWGRNYkxWNC9LMEU3L0ZX?=
 =?utf-8?B?Mm1mMm5HcmF1dXdZNC9FbGJNNjA5b1FOWHlGL1ZoSmVsYXF5Q1lXZTZxb1o2?=
 =?utf-8?B?clpTczZTVHJwL0hOQTY5ekJTMjg1VHZXbEV0L0Rod2NGU3p5WXJWanJqVVo2?=
 =?utf-8?B?dzhaZWdVQUVYRHJhd1RXYmE4dXlTeXJNOEU4SHBUVDZ3MmI2VWxZbElZR29Y?=
 =?utf-8?B?SENzb0FZd290UVV1aWw2YTNRTjFLeHhPbjRkUDVKQ2U1aS9zMlpxN1JQZHAx?=
 =?utf-8?B?QUxtS2s3L2Z2Z0ZSaWZYd1FSd2k1M1Y2dUFROHBxbkxHK2tMYW1xM1gyL0pX?=
 =?utf-8?B?dVFNWnBMRXNUS3IvZStRYWszTXlFdHp0cldXaTc2dU83cEVGNkdtaEZiNncx?=
 =?utf-8?B?ZlNOb1F3bHNLZWVzVjd2K2h6K3IzM1RRZjA3VzlCTWRwZEM1VldjL0ZPR2NU?=
 =?utf-8?B?ODdCcW9oRmtSL2VremJuZHdXWjJiMlZIQk9TdGpUdXF4MmVsR0FZbCtsOHND?=
 =?utf-8?B?MlN1VG5Vc3FyNXVhSXl0ZUZRajRKZ3UvRHJEclRGU3JZVG9sWVVBSGs0Q0J4?=
 =?utf-8?B?RUpVelJ4NHptLzA3bUNPYkJ5ZUtVMEpHbC9xSkVrWVVMRVdLT0ROZDFVQSta?=
 =?utf-8?B?dXV5Mm42WXpIKzlxSHNpbXltVk1DM2hSYnI1ZzFzMk5WK1gvSW5XdmJtWnZm?=
 =?utf-8?B?SDMvc1d5WXVWRExBb0ZKUlBPYzZTRmJscUxySnZYSVhyUUJSTTNzcEJjajN0?=
 =?utf-8?B?QzlCN1pVWTZNSkY5YzJlSUdYVTAwZkdIZFJab0orU1ZPRlZrOTF3SUMzdjVC?=
 =?utf-8?B?dWwxbGhlRlBtY09CWmhjVzR0bEptQWxxMmtkRGJyekJZL29qZFVzZFBKNzM5?=
 =?utf-8?B?MjFLc0VkYW15Y0pja2JTTFZTeFdEK0k5MERjQ2YvSkF4MVR5aW91U0VMZnk5?=
 =?utf-8?B?VXpIbVNHSXFGTWZhUndvemVCMkR1SEFFelJLUFZOM0VYdVQxT1Q2dTcvT2lV?=
 =?utf-8?B?Y0xxSTZKT3BsOG1VVDIvTDhTWHdyY1J6UC9xN3dVZCtWRzFyTGxpd05nMEtq?=
 =?utf-8?B?Mjl4djhFTThaMHZOSFVkazZvaHVMZ01Nc1ZRU1c1Sk9QWm4wcTF3OG1zRmdZ?=
 =?utf-8?B?bzhwM3I2WktGTjd0eG50c1FpZjQrWmtEYXFyamQxWEc5amJ5M0xrN2xyOU5n?=
 =?utf-8?B?QmZzVU9CUEJJdUZ5VnBzMUNtYlB6UGkwQkpBOU1XUGxZTUtpSUg2TTJ0L0dh?=
 =?utf-8?B?VWFWbk1ZVzI5ZWI2NU5WYks3Lysxb3d6WWJFRVhsU29kMi91TUpGOWxIOGhN?=
 =?utf-8?B?Uk5Qc2FacGxRN0lnM3ZXbkI2ellKQXc5MnhiekZKM2MvT1pUbDB2WUp2S0dx?=
 =?utf-8?B?Mzl2dHhRQmNoS2ZtQnZaeHR5OTVvb3VkRnNXKzh1ZXd5cVZRL3ZXZzJnZUF3?=
 =?utf-8?B?dlZCS1dzRG9jc0Z5WEg4M1FIU3ZoeklWNGhMbG14UTBJRUhhSWNxZTlQdTlB?=
 =?utf-8?B?WWhvUUQ5R1VFNjhXVm5KdEZVemNGN3NqMEd1LzRlcUhtYTdySERnSEpOQzBI?=
 =?utf-8?B?czdzcUo2MjBFU0pyb2JNKzAxWXBGd3g0enlNQnBiQ0pFb2toY3B6Y2pTMVRY?=
 =?utf-8?B?eFRHcWNlTGlpK2hTNk9Pb3hNMUc1VVlVK1BOUVRSZUdPY3Q0UEhUNnFLZGlr?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd0cf8b-f4ae-40f6-eff4-08dd0e1073c7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:49:58.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZAYSRywo//xYG73V8DBlaFuOXdZbiFJ0F+37R+BS+iJ/aZEJNwwmaJC1JpkByNhG+qd8G5WkWoaqs7XYfmTFHroCekp2Bxv60lkQyJJFFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It can be a wakeup source
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 554 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 566 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e87c3d74565c..18fc3577f6cd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8ee79cb18322..a63d010a753c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
 obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..ad78423783da
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define RTCCNT_OFFSET	0xCul
+#define APIVAL_OFFSET	0x10ul
+#define RTCVAL_OFFSET	0x14ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_RTCIE_SHIFT		30
+#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_OFFSET		12
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_RTCF		BIT(29)
+#define RTCS_INV_RTC		BIT(18)
+#define RTCS_APIF		BIT(13)
+
+#define RTCCNT_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+#define RTC_CLK_MUX_SIZE	4
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
+ * should not be used.
+ */
+#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
+
+enum {
+	RTC_CLK_SRC0,
+	RTC_CLK_SRC1,
+	RTC_CLK_SRC2,
+	RTC_CLK_SRC3
+};
+
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	int dt_irq_id;
+	int clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 quirks;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512,
+	.quirks = RTC_QUIRK_SRC1_RESERVED,
+};
+
+static int is_src1_reserved(struct rtc_priv *priv)
+{
+	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
+}
+
+static u64 cycles_to_sec(u64 hz, u64 cycles)
+{
+	return div_u64(cycles, hz);
+}
+
+/**
+ * Convert a number of seconds to a value suitable for RTCVAL in our clock's
+ * current configuration.
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ * Returns: 0 for success, -EINVAL if @seconds push the counter past the
+ *          32bit register range
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 delta_cnt;
+
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	return 0;
+}
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_RTCF) {
+		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_AF);
+	}
+
+	if (status & RTCS_APIF)
+		rtc_update_irq(priv->rdev, 1, RTC_PF);
+
+	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
+
+	return IRQ_HANDLED;
+}
+
+static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u32 counter;
+
+	counter = ioread32(priv->rtc_base + offset);
+
+	if (counter < priv->base.cycles)
+		return -EINVAL;
+
+	counter -= priv->base.cycles;
+
+	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtccnt, rtcval;
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, &alrm->time);
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
+
+	alrm->pending = 0;
+	if (alrm->enabled) {
+		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+		if (rtccnt < rtcval)
+			alrm->pending = 1;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	if (!priv->dt_irq_id)
+		return -EIO;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= RTCC_RTCIE;
+
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	struct rtc_time time_crt;
+	long long t_crt, t_alrm;
+	u32 rtcval, rtcs;
+	int ret = 0;
+
+	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+
+	t_alrm = rtc_tm_to_time64(&alrm->time);
+
+	/*
+	 * Assuming the alarm is being set relative to the same time
+	 * returned by our s32g_rtc_read_time callback
+	 */
+	ret = s32g_rtc_read_time(dev, &time_crt);
+	if (ret)
+		return ret;
+
+	t_crt = rtc_tm_to_time64(&time_crt);
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return -ERANGE;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_time(struct device *dev,
+			     struct rtc_time *time)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc = 0;
+
+	switch (priv->clk_src_idx) {
+	case RTC_CLK_SRC0:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
+		break;
+	case RTC_CLK_SRC1:
+		if (is_src1_reserved(priv))
+			return -EOPNOTSUPP;
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
+		break;
+	case RTC_CLK_SRC2:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
+		break;
+	case RTC_CLK_SRC3:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (priv->rtc_data->clk_div) {
+	case DIV512_32:
+		rtcc |= RTCC_DIV512EN;
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		rtcc |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rtcc |= RTCC_RTCIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.set_time = s32g_rtc_set_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	int i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
+		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->clk_src)) {
+			priv->clk_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->clk_src))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
+				"Failed to get rtc module clock source\n");
+
+	return 0;
+}
+
+static int s32g_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_data = of_device_get_match_data(dev);
+	if (!priv->rtc_data)
+		return -ENODEV;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return PTR_ERR(priv->rtc_base);
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return PTR_ERR(priv->rdev);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->rtc_hz = clk_get_rate(priv->clk_src);
+	if (!priv->rtc_hz)
+		return dev_err_probe(dev, -EINVAL, "Failed to get RTC frequency\n");
+
+	priv->rtc_hz /= priv->rtc_data->clk_div;
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0)
+		return priv->dt_irq_id;
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       s32g_rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret)
+		goto disable_rtc;
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static void enable_api_irq(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
+	u32 rtcc;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= api_irq;
+	else
+		rtcc &= ~api_irq;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	u32 rtcval, rtccnt;
+	int ret = 0;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Save last known timestamp */
+	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use a local copy of the RTC control block to
+	 * avoid restoring it on resume path.
+	 */
+	memcpy(&priv, init_priv, sizeof(priv));
+
+	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
+	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
+	sec = cycles_to_sec(init_priv->rtc_hz, rtcval - rtccnt);
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	/* Reset RTC to prevent overflow.
+	 * RTCCNT (RTC Counter) cannot be individually reset
+	 * since it is RO (read-only).
+	 */
+	s32g_rtc_disable(&priv);
+	s32g_rtc_enable(&priv);
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return -ERANGE;
+	}
+
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	return ret;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings.
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
+			 s32g_rtc_suspend, s32g_rtc_resume);
+
+static struct platform_driver s32g_rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= s32g_rtc_probe,
+};
+module_platform_driver(s32g_rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


