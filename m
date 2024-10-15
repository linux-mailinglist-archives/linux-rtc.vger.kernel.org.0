Return-Path: <linux-rtc+bounces-2199-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6F99E491
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 12:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127591F23A40
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E0F1E633E;
	Tue, 15 Oct 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H55vjS2u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC71E7C34;
	Tue, 15 Oct 2024 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989509; cv=fail; b=V2Xit2GBTtYZufA6+P57ojeOI8uMgTvgqNCVg/EMFGrTFlW++4n8MKnrHloHAnE9HOH5w3piQUu+EYdJWxhtDhHwVtciM3BLCFXEVg6GmRFgi/mazZOIVKK9XpNb5Tif+HcGGnNTkLtVR2hg2dGmsA24TnCIJ41Zs3rhvk91nNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989509; c=relaxed/simple;
	bh=H9PWEWU+fH5Zyv/VWrEZqOCrz1LI7bOXimU+PTakqH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ExrtyK5VVP2eY6Enblqsy4mTKBPHZ2srtV5WToI+jbGzWxHBH7895X5NAMp+tzpHWS1pYq8PGRa+EFUInq0MZjx0dON9lKm9jejp301XBU55rjo/WADlKsZep7kJnVjAocxEdbQpN1gRU4pq9cowindSsKE1AGy90V8r0uQEp24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H55vjS2u; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY7Hpaw94dk5YLlu9ST6qwzOGeeps0cDB6CkWtyuvbJLL/C6w3/MRRRFIp6somCQx9UA0jTGfZ8D+zh4zaPRe4AlAZ1OZ/Dq3Z+KxBXmFR8x0fAbYGBNo0YqrqExYHUUKcqoKSeR0PVuZkHCPpHdGjEPccpBQ9xIzwkrQ4AR5+YOVjyWeGlT/k+vGlfe1GoOZX0GBOHxtrioz+xMUvmJxi/oUc+Q+TCQk4I4fsfo8N0gC5TpqI9g5LIO9O5EJBljqO79e1aAWKkSdOGId9m05Q6Mfoxz7HpdnhBPz7Eux1YrtBxpuOiM2bM+HJPsDFNp959TWx480bsFjf/qOlvG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scdQMh1u3pFKc8xvDYykNJLGfhv/s+xVq1xIloBoUto=;
 b=lW41f5fjRYjwCk5rwLJzmUvv0RdrQXxNQ9c10aZUtbS/lrznBonUoeDJ+bqPXzJrlHBsXz1fiSpoeRuAi65vQMAQFZjhJt+NKjQ+Z46Mz10bKgZHSCWzJKJNZFPrbaD0gNCjixzGftxiTIV497k9DtMVrBTddNmRLRBFtcf6SnSybYGArK4LHIInBjoZdkPy0ctRUEoH9Dk4yz/80hQVjwQxYDU7wAoqQYboA2B/M40ofvrXbs4vE4RxVz60qWwp11a2X14NB4akZkP126Ro5ur4wVrliseBjMkiUOquYhv7Xhy0eQLxvBrX6rhD/jCXP4l8l36oqdjrzlySbxLMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scdQMh1u3pFKc8xvDYykNJLGfhv/s+xVq1xIloBoUto=;
 b=H55vjS2u1GfBho9Hl4J1hckW4WNpW04Ev06IOq5wNQrOcGnLB1rSA6GFSMk0z9CSRNwr0HGAeJ1zk7Io8rtKG5dkLliL3/OCAhjLQcNOsBypX1gWbij6N1lrpQaj3jjILNLMI/El6wV/3GOMJSfqNyFgk9V/y7yrQx8108akFVSQFr/KToAM8+Oe3oSq9biKPluViVa6NA9hIuAhrPkkVZy7IQB6Q3v+MVhyDZhh31+Po/CT4yGrNsilq+AQIu5DxNKrc+Z4jFYXdMAgdLqGzMGkhVhMKAjJypSAC+cVXxixK/uHhV0Szl8pIduRE9eACG2eeRToaKBqPQ984QrYXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:51:42 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:51:42 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Tue, 15 Oct 2024 13:51:31 +0300
Message-ID: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f498ae-a0fb-4e40-fe8d-08dced075a6c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUVNTjFiNG9EaFJRYm9PaGVYZ1NUWHpxeXp6V3pRckViS3dxZ3RjVm5zMEdU?=
 =?utf-8?B?Q1grOE9kQUJpQUROK09FN1pCM015dWs2Zlh5eGtTMlk5cWFBOHhoZTdMalFo?=
 =?utf-8?B?bTcrbXV0bnorSFMzeGtpaFQzRkxRR1JaMk55WktwN2hIQWtqTGExckNmK05Y?=
 =?utf-8?B?ZzI5bkd4TWt0R0hUTFI3cjVWYkdwYmJmVWJLdU10V01pQ2VoL2VYVGpxM1Qv?=
 =?utf-8?B?Z3BEV3NVU2txQUVmWHBiMlN3V3pUZDdiNFdkUkM5M0RsL2JLS21vWHZ0Y2JU?=
 =?utf-8?B?ZTdJYVFkdDUvdzNPelI5aGNwNnkzZUtJVmVwaTdSdHR4cmNrMkdOcHJHQ3pL?=
 =?utf-8?B?aEdTeUFicnZ4QzgvYi9iOVQ1YXZ6SVZUNGZicjk2TGJrNVY0QzFHMkozY0w4?=
 =?utf-8?B?d3Z2QlRvMkxlYy9vL093aGxCOUxsZE04TVpsR05IMmdyV0hwT0YrbVhlNzV3?=
 =?utf-8?B?K0IrdjNxK3dvYk5EWkhkT3g4dDNjZzZaWHN0aUVwR09uekluWVR1WlRsMklp?=
 =?utf-8?B?RU1EYk12Z2lpK1JjMjFTcjhNWHJIZVRNeXNGeFkzOTVnTFpOL0NSV1NmOGdY?=
 =?utf-8?B?VDR2SHYrR1p1VlM5b0Jmemt4UE02QU1zTGhWMEw2RmJrU29uSFBRQ0IvT0lV?=
 =?utf-8?B?YnNvanRUdkVKejhSREJWQnV2UFQvc0ZVSjZpR0Q5ZTN6RDlsZlQ4d2V5aEwr?=
 =?utf-8?B?S2FyWVVFa0JDZzJjRHZYV2R3Z28yUGlIQURibC8wdHB4UzVNRmxEZldTUExa?=
 =?utf-8?B?Z3loVnRJRWd2MkxVQ3ZKeEI2aktwbDZBUkhXMzl0RWJJSk8ycDh0cVlCam9X?=
 =?utf-8?B?OE9TTlplZ2djaE90UkpjenNhYmRtajBkeHQ1aUtWekJCNjkvYzZ5ZTJFTWJH?=
 =?utf-8?B?ZzROdSt5TXJ3S2pwMGo4UkxXY0NpQUJaMnY5K3ExM0pnQzNJM3V2bVR4aW9P?=
 =?utf-8?B?YVJHR3VTLzVJUFBMRmNIOUhOQ3QvMXNKM0c2SFlvZEJpVmhOSXYyUzgzRWJ2?=
 =?utf-8?B?S0dXZXJOeFZGZVYvQWpmSVV5ZGZMZ1k0YUNMM1lMMVpqQjN0Z0JLUzFTa0F4?=
 =?utf-8?B?VGpORkQ4dGgzcUJYSG5VK2RxWUZjazdONGtCYXhLSi96aTdxUFNnYjlaSzM0?=
 =?utf-8?B?aTRqWlRRc2I4ZmtDVWpTTitXOHBFakJEaUl6SDRWbU5WeXo4Y1BkV0FiZ1lG?=
 =?utf-8?B?NS9IdzlFUTlPUGQ5T1lPZnpDT05yTWpUT2xDc3VmclN4NW1RRFUxcnpHVHBi?=
 =?utf-8?B?djFMUCt6RllXeHV0RGk3QmpvNTd1UXFjaFVnNnZwZTczTzlFQ01hbGpHaDZ3?=
 =?utf-8?B?bzIxSW4zYWVMcXZUWHJlUEZXT2ZBYTM2VGNsSVVDenlrT2dtcXpHRmsvU3Zp?=
 =?utf-8?B?eVVXU1Q5YlJyR1Ixd3JiTEdnVm1QUVJOQVVhbXViY2dHd1d3MEJVdWYrTnBt?=
 =?utf-8?B?OXlUN0VYOW9PZEt3Y0d2aGRhMlRFM3hQMGNTaXBXMUdTR1grNXJtNHpyc0Fj?=
 =?utf-8?B?eHJUcW9FQkRGa0piOWhMdmZnZ0Jnblo5aEx2Y3lESHVCeG1nUjVwdzhhTDdr?=
 =?utf-8?B?WHZMKzJ4ZW0xbkRJWnVVTmhXb201VnVmMmtlRGRkVWFFTHpId1pJZXBTSjk1?=
 =?utf-8?B?N3RQUnNnQXRkVmZOS0pvRDNrcHBrU1ZheUdJSjdsUHhiejdtY2NuNkwyOC9W?=
 =?utf-8?B?NEhrUlRPay9jMFFpMHpDb1p1RUhlL2tibEpMSXdqZUVob1pWOENWSTRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STZWbktiUTdQaitLUW1md1RWRUpCVmFYbEliSG1iZ0RBQlpGYm5wUlVpc1NI?=
 =?utf-8?B?aUdCbE5GTUxQbDh3bXlreWc5R3JMWmtpOHdCVWJkNVdBWG1JWTZMUFl0cklz?=
 =?utf-8?B?Mldac1FuRU0wN1dvNm5yekhROFJvWmgzcjZKRlY0OERvNlBTdWtub1RoNENn?=
 =?utf-8?B?SFpvdGJyd0RLMmpVeDZwd3NFampqQ3R2K1ZrVGd5L1dUeGZTZjBUdjh2dnVo?=
 =?utf-8?B?VkpNSk9rblZTTWZRR0dHNkxsZEludDBpME9XcUg0b1hWUUF0MlM0SXBPL3Fi?=
 =?utf-8?B?SUcvenBSN0xOOWYrMjRiYm53MXBUMkFhc0Npc1p3TWlXTzhOcDFoWGpWeHZs?=
 =?utf-8?B?S3pGWStUeCsxbDE3MWh1bWJqTWdxSG9HcDdmbmJjMDNHMEpqUEt1T0RxcTZo?=
 =?utf-8?B?NlNNODlaYzRJZmZtSTNvTmpCMUdrTHNGQ2Nwb0h4MHFlQW9tOHlWUHFnM2U4?=
 =?utf-8?B?UFlaREVkcER1eU02RDBkTWZCRSs1ZnRSWmdpM0lVbHIvd29NZlMrblpHblNm?=
 =?utf-8?B?RVFpQ2s1K1ZJNnlBTElBUE01MjhFdUw2TUp6UmU4SVJ4MlIwNmcxUzJ1MG11?=
 =?utf-8?B?dW54NXdCRUNscEpURDBGQnFrVGp2N3ZpOVh2TlBGU1hsVEMvS2hnaWhVZnp0?=
 =?utf-8?B?ZjV1VXJBT3EvNENHd3Qvb01UeFYyM0FRVjZxZjVpTkUrZ0JjaENLeWplMW1Q?=
 =?utf-8?B?ODN2WkQ2OXRYZGJuVThrcS84NW93amQzclJTcHpkQXNZckZ2SDI3MWpjbUk1?=
 =?utf-8?B?NDN2OVd3QldGNGx6VndGZElrYnZORElZSWNtcU5xOW9kQ3hsWU9VWkhjbWhJ?=
 =?utf-8?B?ZTl5cHIvS0NVUHRVMFhQcVl6eVZUNjV6UUs3VjVOOGh0YXVwRFFwcjFueWZM?=
 =?utf-8?B?azBzZmlMZHZ6UmVLVDVjTytqTzZwcmJGOVBFU0hwbTBJVmtvRDNvR29HZXc1?=
 =?utf-8?B?bGUvekNld1ZiMFBCaVZXZVBFWTJsWkxEK1dqR0p0dHZkYnY2dmVUVEd5Q1Yr?=
 =?utf-8?B?bU1JY21DWFlHTGpmTEFQaE1PeU1aamFqNVBsL21Ea3RvTTExTjFaV0t2UXcx?=
 =?utf-8?B?Y3BlcWt0SmFObHFXeW9xNUZONlFLQm1jV21PSjRuUlZUSlljNDlFckFiQ21I?=
 =?utf-8?B?Tm4wOHg4eUU5SHdBN21vUVdDOGEyZ0Rzb1ltTWRFbHB0QUtqS0JRY3lWblRo?=
 =?utf-8?B?TTFoNzdLaGdZMDdDMWtYNnZGemp2ektsUnFndXRFTkdRbXlSNm9LaFVMb1VS?=
 =?utf-8?B?cndzenBYTy9UWGpsUFV3Snd1NkhMRTFlNFZqcEZORnN1aEYwQTE5eXBiYXJt?=
 =?utf-8?B?Y21qOTlCckpscE1QVUhSaXdQdi9KUzd2WFVHMFVqakp0cTJoWjg3NWh4eDd2?=
 =?utf-8?B?S2hjdlArbFB1bmowY05wNEhBcE1BRnFFaitYZTVHSWNsZmUzQWdLWWw4Vjdk?=
 =?utf-8?B?RklNTzRaekVsVzIvK1lzK2RtRHp1ZHU0ZWxKcDBzOWtuZFpuNXV1dk5HbHll?=
 =?utf-8?B?Ky91Y2JiT24rdnIyUzgrRlg3cm1yS0xRWGtIemQ5MHdtNFpPdzlrTDdiL2ND?=
 =?utf-8?B?dWZEOGptdmRhaDZnMzgyY1lnQkhkRTFLb3JaQlN6MTYvaTVRNDFaRTZDb1Za?=
 =?utf-8?B?UHBLN0plbTJUcjVqcWczc09tckFReVdha2VBMWpuY3hkZUlDL3hmQVJUWmxx?=
 =?utf-8?B?MHdRa0J3S09hZ0ZtRnVkRjYrd3dYelVTNmUzbjllR0FSeSsra0YxdFFEbzY5?=
 =?utf-8?B?bFVrWVlOMTFpdktWRUJXNjJ4UFBEMjVMcWRhSmZIQSsydnp5UlJkRVFraUdz?=
 =?utf-8?B?VW5oOWhaS0xIaFFqV1ZkdmUvb0VxMmY5RVBSRUhxK3p0MlJ4cC85U0ZiRGd1?=
 =?utf-8?B?dHFnbTRtS2xVanZnUjhDY1VWaGhBanlBeUZXQmplREpPb3k4ZWtYaWFrQU9s?=
 =?utf-8?B?Rm1YSzB4cXlGVXltVTdoaHNiVlhwS3hlWGxGZDZnbUhlRHhkYno3RjM0cFVR?=
 =?utf-8?B?aHZpVzE2VmtDUFcrQi8zTzVITnRVbXROSkFEQzhWYmRZTDJoVlR4RmovMVNq?=
 =?utf-8?B?SXhGRFJZWVB6VnNVY1BWWWdCNFJlUHZEakUxaGdtSnhxMVhQK2Q4U05CTU1p?=
 =?utf-8?B?V3pzSm4xYzVOSkl6eEhSM2p1UlZEYXhPcWI1Vkd4SDZqMkRteTMvZnR0ZU56?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f498ae-a0fb-4e40-fe8d-08dced075a6c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:51:41.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgFu5kAUdU+8Ub/TdgJhwHtxsw+iNzhcgy8u593XyPxggg7S7lLe3jKtiAQ9C9o0zupwa38oyiTWPCtRwoVuxujjff8TgGnpVnrYceAgvzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support
on NXP S32G2/S32G3 SoC based boards.
RTC tracks clock time during system suspend.

RTC from S32G2/S32G3 is not battery-powered and it is not
kept alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 778 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 790 insertions(+)
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
index 000000000000..d6502d8bf616
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,778 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of_irq.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/iopoll.h>
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
+#define RTCC_ROVREN				BIT(28)
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
+#define RTCS_ROVRF		BIT(10)
+
+#define ROLLOVER_VAL		GENMASK(31, 0)
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
+#define to_rtcpriv(_hw)	container_of(_hw, struct rtc_priv, clk)
+
+enum {
+	RTC_CLK_SRC0 = 0,
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
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	u64 rollovers;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	struct device *dev;
+	u8 __iomem *rtc_base;
+	struct clk_hw clk;
+	struct clk *ipg;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	u64 rollovers;
+	int dt_irq_id;
+	int runtime_src_idx;
+	int suspend_src_idx;
+	u32 runtime_div;
+	u32 suspend_div;
+};
+
+struct rtc_soc_data {
+	u32 quirks;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
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
+	return cycles / hz;
+}
+
+/*
+ * Convert a number of seconds to a value suitable for RTCVAL in our clock's
+ * current configuration.
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ * Returns: 0 for success, -EINVAL if @seconds push the counter at least
+ *          twice the rollover interval
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 rtccnt, delta_cnt;
+	u32 target_cnt = 0;
+
+	/* For now, support at most one rollover of the counter */
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	if (~rtccnt < delta_cnt)
+		target_cnt = (delta_cnt - ~rtccnt);
+	else
+		target_cnt = rtccnt + delta_cnt;
+
+	/*
+	 * According to RTCVAL register description,
+	 * its minimum value should be 4.
+	 */
+	if (unlikely(target_cnt < 4))
+		target_cnt = 4;
+
+	*rtcval = target_cnt;
+
+	return 0;
+}
+
+static irqreturn_t rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+	if (status & RTCS_ROVRF) {
+		if (priv->rollovers == ULONG_MAX)
+			priv->rollovers = 0;
+		else
+			priv->rollovers++;
+	}
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
+static int get_time_left(struct device *dev, struct rtc_priv *priv,
+			 u32 *sec)
+{
+	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+	if (rtcval < rtccnt) {
+		dev_err(dev, "RTC timer expired before entering suspend\n");
+		return -EIO;
+	}
+
+	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
+
+	return 0;
+}
+
+static int s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u64 cycles, sec, base_cycles;
+	u32 counter;
+
+	counter = ioread32(priv->rtc_base + offset);
+	cycles = priv->rollovers * ROLLOVER_VAL + counter;
+	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
+
+	if (cycles < base_cycles)
+		return -EINVAL;
+
+	cycles -= base_cycles;
+	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
+
+	return sec;
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u64 sec;
+
+	if (!tm)
+		return -EINVAL;
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
+	u32 rtcc, sec_left;
+	u64 sec;
+
+	if (!alrm)
+		return -EINVAL;
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
+	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
+		alrm->pending = !!sec_left;
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
+	/*
+	 * RTCIE cannot be deasserted because it will also disable the
+	 * rollover interrupt.
+	 */
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
+	int ret = 0;
+	u32 rtcval, rtcs;
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
+	if (t_alrm <= t_crt) {
+		dev_warn(dev, "Alarm is set in the past\n");
+		return -EINVAL;
+	}
+
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		/*
+		 * Rollover support enables RTC alarm
+		 * for a maximum timespan of ~3 months.
+		 */
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return ret;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret) {
+		dev_err(dev, "Synchronization failed\n");
+		return ret;
+	}
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
+	if (!time)
+		return -EINVAL;
+
+	priv->base.rollovers = priv->rollovers;
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+static void rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int get_div_config(unsigned long req_rate,
+			  unsigned long prate)
+{
+	if (req_rate == prate)
+		return DIV1;
+	else if (req_rate == prate / (DIV512 * DIV32))
+		return DIV512_32;
+	else if (req_rate == prate / DIV512)
+		return DIV512;
+	else if (req_rate == prate / DIV32)
+		return DIV32;
+
+	return 0;
+}
+
+static void adjust_dividers(struct rtc_priv *priv,
+			    u32 div_val, u32 *reg)
+{
+	switch (div_val) {
+	case DIV512_32:
+		*reg |= RTCC_DIV512EN;
+		*reg |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		*reg |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		*reg |= RTCC_DIV32EN;
+		break;
+	default:
+		return;
+	}
+
+	priv->rtc_hz /= div_val;
+}
+
+static unsigned long get_prate_by_index(struct clk_hw *hw,
+					u8 index)
+{
+	struct clk_hw *parent;
+
+	parent = clk_hw_get_parent_by_index(hw, index);
+	if (!parent)
+		return -EINVAL;
+
+	return clk_hw_get_rate(parent);
+}
+
+static int rtc_clk_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+	int i, num_parents = clk_hw_get_num_parents(hw);
+	u32 config;
+
+	for (i = 0; i < num_parents; i++) {
+		config = get_div_config(req->rate, get_prate_by_index(hw, i));
+		if (config) {
+			if (i < RTC_CLK_MUX_SIZE)
+				/* Runtime clk source divisors */
+				priv->runtime_div = config;
+			else
+				/* Suspend clk source divisors */
+				priv->suspend_div = config;
+
+			return 0;
+		}
+	}
+
+	dev_err(priv->dev, "Failed to determine RTC clock rate\n");
+	return -EINVAL;
+}
+
+static u8 rtc_clk_get_parent(struct clk_hw *hw)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+
+	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
+		RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
+}
+
+static int rtc_clk_src_switch(struct clk_hw *hw, u8 src)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+	u32 rtcc = 0;
+
+	switch (src % RTC_CLK_MUX_SIZE) {
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
+		dev_err(priv->dev, "Invalid clock mux parent: %d\n", src);
+		return -EINVAL;
+	}
+
+	priv->rtc_hz = get_prate_by_index(hw, src);
+	if (!priv->rtc_hz) {
+		dev_err(priv->dev, "Failed to get RTC frequency\n");
+		return -EINVAL;
+	}
+
+	if (src < RTC_CLK_MUX_SIZE)
+		adjust_dividers(priv, priv->runtime_div, &rtcc);
+	else
+		adjust_dividers(priv, priv->suspend_div, &rtcc);
+
+	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	rtc_disable(priv);
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+	rtc_enable(priv);
+
+	return 0;
+}
+
+static int rtc_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+
+	/*
+	 * 0-3 IDs are Runtime clk sources
+	 * 4-7 IDs are Suspend clk sources
+	 */
+	if (index < RTC_CLK_MUX_SIZE) {
+		/* Runtime clk source */
+		priv->runtime_src_idx = index;
+		return 0;
+	} else if (index < RTC_CLK_MUX_SIZE * 2) {
+		/* Suspend clk source */
+		priv->suspend_src_idx = index;
+		return 0;
+	}
+
+	return -EINVAL;
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
+static const struct clk_ops rtc_clk_ops = {
+	.determine_rate = rtc_clk_determine_rate,
+	.get_parent = rtc_clk_get_parent,
+	.set_parent = rtc_clk_set_parent,
+};
+
+static int priv_dts_init(struct rtc_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+
+	priv->ipg = devm_clk_get(dev, "ipg");
+	if (IS_ERR(priv->ipg)) {
+		dev_err(dev, "Failed to get 'ipg' clock\n");
+		return PTR_ERR(priv->ipg);
+	}
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0) {
+		dev_err(dev, "Error reading interrupt # from dts\n");
+		return priv->dt_irq_id;
+	}
+
+	return 0;
+}
+
+static int rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	static const char *parents[RTC_CLK_MUX_SIZE * 2] = {
+		"rtc_runtime_s0",
+		"rtc_runtime_s1",
+		"rtc_runtime_s2",
+		"rtc_runtime_s3",
+		"rtc_standby_s0",
+		"rtc_standby_s1",
+		"rtc_standby_s2",
+		"rtc_standby_s3"
+	};
+	struct clk_init_data clk_init = {
+		.name = "rtc_clk",
+		.ops = &rtc_clk_ops,
+		.flags = 0,
+		.parent_names = parents,
+		.num_parents = ARRAY_SIZE(parents),
+	};
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
+		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
+				"Failed to map registers\n");
+
+	device_init_wakeup(dev, true);
+	priv->dev = dev;
+
+	ret = priv_dts_init(priv);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(priv->ipg);
+	if (ret) {
+		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
+		return ret;
+	}
+
+	priv->runtime_src_idx = -EINVAL;
+	priv->suspend_src_idx = -EINVAL;
+
+	priv->clk.init = &clk_init;
+	ret = devm_clk_hw_register(dev, &priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to register rtc_clk clk\n");
+		goto disable_ipg_clk;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node,
+				     of_clk_hw_simple_get, priv->clk.clk);
+	if (ret) {
+		dev_err(dev, "Failed to add rtc_clk clk provider\n");
+		goto disable_ipg_clk;
+	}
+
+	if (priv->runtime_src_idx < 0) {
+		ret = priv->runtime_src_idx;
+		dev_err(dev, "RTC runtime clock source is not specified\n");
+		goto disable_ipg_clk;
+	}
+
+	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		goto disable_ipg_clk;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev)) {
+		dev_err(dev, "Failed to allocate RTC device\n");
+		ret = PTR_ERR(priv->rdev);
+		goto disable_rtc;
+	}
+
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret) {
+		dev_err(dev, "Failed to register RTC device\n");
+		goto disable_rtc;
+	}
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	return 0;
+
+disable_ipg_clk:
+	clk_disable_unprepare(priv->ipg);
+disable_rtc:
+	rtc_disable(priv);
+	return ret;
+}
+
+static void rtc_remove(struct platform_device *pdev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(pdev);
+
+	rtc_disable(priv);
+}
+
+static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
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
+static int __maybe_unused rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	int ret = 0;
+	u32 rtcval;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (init_priv->suspend_src_idx < 0)
+		return 0;
+
+	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
+		return 0;
+
+	/* Save last known timestamp before we switch clocks and reinit RTC */
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
+	ret = get_time_left(dev, init_priv, &sec);
+	if (ret)
+		return ret;
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return ret;
+	}
+
+	s32g_rtc_alarm_irq_enable(dev, 0);
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	return ret;
+}
+
+static int __maybe_unused rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ .compatible = "nxp,s32g3-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
+			 rtc_suspend, rtc_resume);
+
+static struct platform_driver rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= &rtc_pm_ops,
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= rtc_probe,
+	.remove_new	= rtc_remove,
+};
+module_platform_driver(rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


