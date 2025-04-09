Return-Path: <linux-rtc+bounces-3851-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3BA8297A
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 17:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13AC67BA065
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 15:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F66269D01;
	Wed,  9 Apr 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dlGpA5os"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298126562C;
	Wed,  9 Apr 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210714; cv=fail; b=hihy0KQy7hk5NgF5XX2gutuyl0FWIBFkCZR/CKmN9FTfuJrxKj+3RjMcM6hb2mA8N1/n4I6Ncm2eiTOJeAiK9BsSlsRMdN3eI4HmvyWO1TdQXCgDJl6jVlmVnTGSAWRqIXG+Jv+mw2aUX1n1aEPnOcc8QlJTcmajMASgipwHzQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210714; c=relaxed/simple;
	bh=ZIjH+1vKsW2t0Y/S4zJ7xRHV2+Bhe29Z/noM/8zoUtA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tgBDeAhFb9It6NWGq7WedyRviSGU1d1kscZ80cqRtYcpPpZmMvp1RxFjXRT1l+jr79JyZeYUsShzBwqE6u61ZqVHdfBcFQaq6luUWOtqqXQKRhfJzX3MWw3OO+A9Sy+rTGYnKiDo0lxeLyPm36LYGH9cc0vQwrAyhAFfz4rIaTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dlGpA5os; arc=fail smtp.client-ip=40.107.105.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvrzBWPETu05FYStF+w6DxpMWvRHgbIgQMkpunryFg/eU/2wQypVCYyQG8SYh61hvoyQntYnLNwtM05WUxVAA71CI2jLHxabPZqX4O7NccnWepF9FQl8rk3avOxKAK3Rz7F+RkKt77FYt6fxZVY4bAEwGVAuJnaDf2nVL6JkxD2PoWKBBz514AliW+PEUKKnfm0IkuZIVH8b9wF8rGUeHKkS6Ts9d53/p6DkF4ecLR4L77zmyHbEbEMo9qoCjEAku3QGO9PDgjkd4F7yTd0SlLf+lpgeLJDRhicasmAaIPbq97sCENhiB+Pj0giIEzjdd4oo3gzEC0guW/6J2XyBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mgDpr6OAeLovGANvDxK6sAepvhZF6DklSvQWdSDK4I=;
 b=bhgsMj2VbRDRoV6yVPHP3Ah6BVebmvtUZl815R6lsCEQ9O8PWXU7gsWL/7uC+qyNpPtdtbT0JMMuylMwIlOYczj/uVD1M0gIe51bluvxPypWFPvIR83j7XACjGTxLGNppl41Xc/y99iCt48HFiSqEsH8FKa59CDFOrIZmdhE3d9nLVFd8piUCz4wH+YL7k2TAdVx94xjFRVxP+Mg8GM/V7cvLcWQ/t+JLyoFI5nP7iLDDAfytExkdXRl1hoBOSCZ7KKDC4dr9otM2kv68U0+wa58ec7NZUVUFu7Le0lLEeGUF+Eb8ZIB5vVqT5gCbKc4owWZc0shzDMLORPzbc6U9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mgDpr6OAeLovGANvDxK6sAepvhZF6DklSvQWdSDK4I=;
 b=dlGpA5osKQETlLS5l84j33C6jFCPbJG36QQT72e540YzvZCkC9MdNVoHM4lUhq7VJBpD4j1gotdonwGJmrY7zqdNZbVT88HvJg84sX2K0FLApl5AZJvcUVwwBNS5MvJCarlif6uI4/jX6ZCeE9+lIoNzOGRFRUX1aWThQGMfrBN6mieMBZKKFT4L+gwD/rh8Pk0uTCZo+OdxZ64N6O4UPnKRdmWrd+tPQ/xY0TeUT7dYoJ0wQUODTw29W3+mLGTjxwn/Qwrxzr01VEvhsF12JjytqJU2O7wuarTRTeq/KWaM0NmnhI3vN2LlvMNN32P1rlVrGHY2LOzdmogRWYNcOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 14:58:28 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:58:28 +0000
Message-ID: <64843c72-37e3-4080-880f-a020e372b521@oss.nxp.com>
Date: Wed, 9 Apr 2025 17:58:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-3-ciprianmarian.costea@oss.nxp.com>
 <CALE0LRs3VA9kLy4QSEOBCixZbptW4B4DVjZqbN=GDoONHq2oeA@mail.gmail.com>
 <9f982548-c5e3-45ed-963a-afb5256acf31@oss.nxp.com>
 <CALE0LRvUXck_FSP0jCZ1Ene-LCEa8MDFQWVCHGpOzd_yGk+v4g@mail.gmail.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <CALE0LRvUXck_FSP0jCZ1Ene-LCEa8MDFQWVCHGpOzd_yGk+v4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0044.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 57aa0074-4f65-4a65-957c-08dd7776fca7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1VXcW9XK21uaTdudHh1SDMvUlJHa0V0Vmxyc2srb01nZ1ZXM3lOUzVDN0lo?=
 =?utf-8?B?Si9hTUlkdzhBVS9YdDdrOTdmcVpKSUZJekp2dXpSMnBEWjBLZm81cERtZDJp?=
 =?utf-8?B?ay9ndXBQQkZhZ09pbHRGZXlJYlVFSFFpL3NmV3ZGTHRpdG1kMGhTTmZKMys3?=
 =?utf-8?B?Z3RGRW1scnVNdkszVzBsS245S21VYjF5cndtRWlpbU5LSXNYT3BydEVFRVBv?=
 =?utf-8?B?d1NOZldEK1NhOURIVmxRY3l2alZPVFBoNTMyRFp6VExObUhidDhoT3hFdlBp?=
 =?utf-8?B?T2JDZG41R0lyWmJvZE9BMlFWcEQ3S2NETk00SUVPRVdCbFlyWmxxRzJVcXN3?=
 =?utf-8?B?RGtnYUpWRmg1SzBFRUd3RlRwU2FVUWdKVUNTcEtxcldlZzZ5cWF2NkpveVVG?=
 =?utf-8?B?R1YyczhYN0h0MkxPU0JZVThJM1lCV283VVNMa3J1ZGtCZTNzV0NoRzI0VzBX?=
 =?utf-8?B?SjhJa0VoSXNReWN1UFRRSGNiNUkzNHh0anRETEdiZnhxN3pDVUhZTitCV1VD?=
 =?utf-8?B?NXFWN29MY3MybWdCaDhkTGJDczNGWTdvNFQrVUlLZzIvWmdDaGk3UGhqQ0Nn?=
 =?utf-8?B?ZmZiZ0d3NC9LTk9CMTAwMFFGcmMyNTVGT3lTMUV4ait6OEV3S0p2OExnY3Nn?=
 =?utf-8?B?dm1sL2hnSkQ3RTdWenMxRFVBRHRiZDBLa0NydlYvT2syVmJlb3o4bEVlcmIw?=
 =?utf-8?B?b2hiOFZzaFdzeG1VM3FsekpBckdEYUpvNDUyYll6VVUyZXBLWnlsRllNRE1j?=
 =?utf-8?B?N0xicS9MTDdXNjlYQmk0OGtBcnV3RmRHQWtiNjVTRjE2UmRyckdQV2NpUjR4?=
 =?utf-8?B?VnUrKzZQcm1KUmpIaVE1VlViSGg0SHV2MXQ2Vkl0Q0NVTllhVmdKT3hNUkZn?=
 =?utf-8?B?cDJNem9QZUNLaDVZbzdmVlB2akU3VGxZSWo4WmNUVDZKeFhZSVBtQzVOSEdl?=
 =?utf-8?B?S3lhTXRxM0NoTlVQdGNYclNSR3ZITHRtSjVQSG9sbEY4bElhZkJUVkhtT1BQ?=
 =?utf-8?B?Z0U4aDdRWkZ5MGJ0MGJsdWt2OFBINXpsOHdKVXpkVVQxMDIrMHlmTDFNcHBp?=
 =?utf-8?B?YU5OaUtYeUxBaGtqL1F5WGxGL2tOc25oOEdxK1AremoxWGxPQkNpTUlTV216?=
 =?utf-8?B?RkdpVmNFS28vcnFuaHFVaGREMGtIdm9VY0Vkdy80eTg4UGVodWQyZ2h3MVU2?=
 =?utf-8?B?Ync3K29FQmVvU1d6UVZENEFXeWdOOWovUitYTTM4TkEyOTVraGhrdWpoV1pK?=
 =?utf-8?B?TE1yUlhQQjNEZ09pamlJVFQrRGVzWm4yREdRby85TDNXNW1GYVZ1LytrUzlo?=
 =?utf-8?B?TlBuVTJUOHpLd081WkFsZ0hGZ1p0VWxSSEZDL3FLOFNRZktrMDVJZzJVZW8v?=
 =?utf-8?B?MFRoeFp2NS9xTkxTb1NnM3RQYjJBMldTNFgxYXRSV2xic3ZtOFYyNE14WDAr?=
 =?utf-8?B?dElDdnRTYjJwTXRlSlI0eWdmNUZqMHl2RmU0LzhISFV3RzY4NHgrS0tCczVJ?=
 =?utf-8?B?QndvcXk4ZEgvMjdsZVZpMHVucEJISmVRZnhQMThaaTc2bjNEcS8veCtSV3Jq?=
 =?utf-8?B?OTFQQ203Vi9XcTBMU1FOemlBejF2STJsalNvSnoyMHJBRkYzcXdNcEROT3o3?=
 =?utf-8?B?a09STkwrVmtkcHc4amk0d3pBQU5nRGFTSEZTcGFONWVPWE9qRVhSc2cwUzdN?=
 =?utf-8?B?ejlXN2ZEVE52UFp0NkJ0SVVTWXFWTm9BUkZuWXZTNU51ODR3SXNZK3lhWGFr?=
 =?utf-8?B?OGxZb0ZIc3JmdFB0SGxUd29lS1FqUmpVb2g0b2NXdGt3WVBubXdVN01hTFVD?=
 =?utf-8?B?UkxDbnN0ZDVVVU5MQ0dIVlhQcmRybkVxYnoyWVo3ODYxYTMvcTZxU1UzOTVX?=
 =?utf-8?Q?vfSBYvF21LSzd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QllWeGkyK2FHUFVwUCttTWdsZmtaVzNhYnB2SUI1QURtSDlVcklvU1pIR2ZZ?=
 =?utf-8?B?NENRKzFocDR5eDVXdUl2Zkt2WllLcGpmM2k3RW1Fa0JSMkN3d3ErNVFvWW9s?=
 =?utf-8?B?emhIMHJvNjB3ZFNpNUt1U3pxSEpuTjQrY0VjL3RNMFJTSjNvZWk4QjJGdFkz?=
 =?utf-8?B?ZzhMejI1aHkzVSsyVzNuQ2MwYWpmdHFQUXdwbG9hQjFKTXVjZzhPbytwcXJR?=
 =?utf-8?B?MVBoc1IrYlc4a28xYmhPcWU2T0swN0ExZDFqVnlURkpscWpOYVVtaUx6LzB3?=
 =?utf-8?B?UEFzT0hWVlNlb3YxaitJdllhTnZsT1lGZ2pNam9DaVcvT01HemNwb3pJdEwx?=
 =?utf-8?B?bVo0OXJOa1VLWG8vd25rT0hRZlJFSkpnbjhBajA2Tjl3K3B2T3ducXhQTm9n?=
 =?utf-8?B?ZW1IUTZNTnVyM2lwczIzcVJKaHN1Z1Nia1ZhdnFDTDRta0h2eml1YlFCWnU2?=
 =?utf-8?B?RXJxdnFwYWRpMWdsSHcxcjlGQ3NwenhXcHQvV3FsSjFWc1h1VDNIbUdHQ29i?=
 =?utf-8?B?WTVIclpJeE9mRkhkSVhkSWZWMFNwNWtDbVEyK2ZKOGFIbEYzeGFSbXpzeWRH?=
 =?utf-8?B?bjZOL1E1WDV2T254WnlmYUoxZ2ZSWjVaeFZ0RG5hY29NZm1HZGhLRUU4WFVa?=
 =?utf-8?B?V2xZRTExODdaQVZ4RVpQOG5OL1UxMjYvWXgvVWRLWEVxR3hiSVVNcUdWM3dQ?=
 =?utf-8?B?dWQ2a1l6SnluOWhKa2UrR1dIUHhSZkFmMFdTMDBrRkZyRXh3QUR5UjdaZGZo?=
 =?utf-8?B?RXNLeDltNGdIT2FJRzI4amhwY3NyVFFGYlZUTDBaUTgrTStXc2srbWVjbFRR?=
 =?utf-8?B?cDc5RTNVWmM1b2ZxVitENDBjclVFdHM0NmJ6bkNCMFhjbjVYUTR3UjNRVDlp?=
 =?utf-8?B?RGVrVlNtR28zQ2tuLzYxWnZXdXRXaXkzMHhGMEEzdVB0NHFxYmlzaWdnQlNY?=
 =?utf-8?B?bmVaRGZwaS9uRVkwbUI4VnVqYU1iSGtYTTA0OXZlUmN3bzBoWU9CdjJzZTZo?=
 =?utf-8?B?TUFuUjF2QU0xTUlrVjlGaXUxamIwVTFFMkEvdVhhTHFFY3VCVm12V3pTVURv?=
 =?utf-8?B?Yk51bGJ2OE1UMTZDcWJWRGduUllwWFN1cWRZWUkvZXh2QThUb21INWpaRklT?=
 =?utf-8?B?WEMrc3hwOE13NTkySFdtVXVtbmV1bWNwaEJEeGVsYjhTTjVJODgwWGdNaGNj?=
 =?utf-8?B?NE93SnhPbnNNWk9JSzlZcjVkcUY5SThXd09vY1Z1cGdZTFdST29yaUpLeTVr?=
 =?utf-8?B?VWJ5dHp1ekN3NEhJMWg4QlJXbkU0WENrbnVGVklobkVaa3A0WHgrcXQxeUsw?=
 =?utf-8?B?SnFOY2daSkN0ckFoZmw3L1dGKzcwOWRoNVZ5Si9scTBFcjJtMmFzeUlnaGF6?=
 =?utf-8?B?N0ZXNktUaVhiaURvWGJMNEFaRWVzdDFYVU5NSUNKVS9UVHlkQmhvd1p5WkFu?=
 =?utf-8?B?NWRBajEyaGM3Y29xOEZlczhtM041bllma3JoVkhwTUpCaWJjVjl1R2FPeU5v?=
 =?utf-8?B?cDZkenVtTnJuMW5vbUpjSWpCVFM5VDFtRUZKT0RxL29ncldDdnM0Z0IrMitL?=
 =?utf-8?B?SnlGbjJxY3ZrTjFUTW1qeHgrZnN2dUR5S2N5elUwc2dST3JlNlkxNnhDNGpr?=
 =?utf-8?B?S2t2R2U0TWNRbUtPRHZVZjJvUzNmT0NLR2FZUCs2TG00ZGhzWjZnRHdleE1X?=
 =?utf-8?B?bDNYQmxmWHB5VlVuSVc4aWc1ZDZaa2Nuc0QvUzl5QnhURDVBZWpvTkFRNkZy?=
 =?utf-8?B?U2toMzdXQ0NSa2hNdldRMGs0VTdQZ0NjQ2wrem9QVnE3enFmTTRYS2Z4UjZ4?=
 =?utf-8?B?QU1vcmNKcnlkZ1FyaTNLT0JWSE5WUEI3TGNtOWlUVHM2MERWT3FWYjg1SlBr?=
 =?utf-8?B?NUFrZ0pJK1Jqd0ZzUU5HZkFmYlJhMmFtTTRzNlFCMTg0Y0JUMVVsTWpQREcw?=
 =?utf-8?B?dDBjb3QxOVFUTkpyT2pzUm9ZQ3Y2TzdXYk4xYmZFenBqUVozelQzSXFGNUtO?=
 =?utf-8?B?ZTI5d0hnRUJ0SnZmWWVDL3FtbE12am5yRDV5RlRwbW8rb3dEeUdiNWFBSEEz?=
 =?utf-8?B?VDZTdGsrODNEMzZFbytUaDVPWVBqaWNqRkhhN0QzM1VBWmdyK1B1T3M5ZW8y?=
 =?utf-8?B?VGM0a25LY0VtUU1zOU92eTQ0Yml1R2Z1eVJXYlVhT3FXc3VFSXhudEkzZFFu?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57aa0074-4f65-4a65-957c-08dd7776fca7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:58:28.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPvibDZYGa12mm311fUur+j8iQbzGEUfby7xWoF2wbB9LMnoA44i51OLsP13AiEsqJUC9sxdVNxNcbWppC2BgpirE0GniTchlj6oipj/47E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

On 4/9/2025 5:42 PM, Enric Balletbo i Serra wrote:
> Hi Ciprian,
> 
> 
> On Wed, Apr 9, 2025 at 4:26 PM Ciprian Marian Costea
> <ciprianmarian.costea@oss.nxp.com> wrote:
>>
>> On 4/9/2025 5:14 PM, Enric Balletbo i Serra wrote:
>>> Hi Ciprian,
>>>
>>> Many thanks for your patch.
>>>
>>> On Thu, Apr 3, 2025 at 12:34 PM Ciprian Costea
>>> <ciprianmarian.costea@oss.nxp.com> wrote:
>>>>
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>>>
>>>> RTC tracks clock time during system suspend. It can be a wakeup source
>>>> for the S32G2/S32G3 SoC based boards.
>>>>
>>>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>>>> alive during system reset.
>>>>
>>>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>>
>>> I went through the code and it looks good to me, so:
>>>
>>> However, I did a basic rtctest selftest in my S32G-VNP-RDB3 board,
>>> and some tests failed (it shows a small deviation), any idea what
>>> could be wrong?
>>>
>>> This is the output of the test:
>>>
>>> # ./rtctest
>>> TAP version 13
>>> 1..8
>>> # Starting 8 tests from 1 test cases.
>>> #  RUN           rtc.date_read ...
>>> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:17:49.
>>> #            OK  rtc.date_read
>>> ok 1 rtc.date_read
>>> #  RUN           rtc.date_read_loop ...
>>> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
>>> (with 11ms breaks after every read).
>>> # rtctest.c:151:date_read_loop:Performed 2638 RTC time reads.
>>> #            OK  rtc.date_read_loop
>>> ok 2 rtc.date_read_loop
>>> #  RUN           rtc.uie_read ...
>>> #            OK  rtc.uie_read
>>> ok 3 rtc.uie_read
>>> #  RUN           rtc.uie_select ...
>>> #            OK  rtc.uie_select
>>> ok 4 rtc.uie_select
>>> #  RUN           rtc.alarm_alm_set ...
>>> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:18:31.
>>> # rtctest.c:282:alarm_alm_set:data: 1a0
>>> #            OK  rtc.alarm_alm_set
>>> ok 5 rtc.alarm_alm_set
>>> #  RUN           rtc.alarm_wkalm_set ...
>>> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 00:18:34.
>>> # rtctest.c:353:alarm_wkalm_set:Expected new (1738023515) == secs (1738023514)
>>> # alarm_wkalm_set: Test terminated by assertion
>>> #          FAIL  rtc.alarm_wkalm_set
>>> not ok 6 rtc.alarm_wkalm_set
>>> #  RUN           rtc.alarm_alm_set_minute ...
>>> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:19:00.
>>> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
>>> # rtctest.c:420:alarm_alm_set_minute:Expected new (1738023541) == secs
>>> (1738023540)
>>> # alarm_alm_set_minute: Test terminated by assertion
>>> #          FAIL  rtc.alarm_alm_set_minute
>>> not ok 7 rtc.alarm_alm_set_minute
>>> #  RUN           rtc.alarm_wkalm_set_minute ...
>>> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
>>> 28/01/2025 00:20:00.
>>> # rtctest.c:483:alarm_wkalm_set_minute:Expected new (1738023601) ==
>>> secs (1738023600)
>>> # alarm_wkalm_set_minute: Test terminated by assertion
>>> #          FAIL  rtc.alarm_wkalm_set_minute
>>> not ok 8 rtc.alarm_wkalm_set_minute
>>> # FAILED: 5 / 8 tests passed.
>>> # Totals: pass:5 fail:3 xfail:0 xpass:0 skip:0 error:0
>>>
>>> Best regards,
>>>     Enric
>>>
>>
>> Hello Enric,
>>
>> In order to obtain a better resolution/precision you could try to only
>> use DIV512 hardware divisor instead of both DIV32 and DIV512.
>>
> 
> That makes the tests pass, so I'm wondering if by default you should
> set DIV512 in platform data instead. With that change you can add my
> 
> Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>
> 

This change would decrease the RTC rollover time. Initially indeed only 
DIV512 was enabled, but during review [1] I've agreed enabling both 
hardware divisors to increase the RTC rollover time. Personally, I am ok 
with the current 1 second resolution capability.

Alexandre Belloni, are you ok with the current version of this driver ? 
Or should I send a V10 patch in which I enable back only the DIV512 
divisor in order to increase the RTC precision at the downside of losing 
rollover time.

[1] 
https://lore.kernel.org/all/9f4fc9d8-ec7f-43b4-8bdd-01a4ba4855c5@oss.nxp.com/

Regards,
Ciprian

> # ./rtctest
> TAP version 13
> 1..8
> # Starting 8 tests from 1 test cases.
> #  RUN           rtc.date_read ...
> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:00:34.
> #            OK  rtc.date_read
> ok 1 rtc.date_read
> #  RUN           rtc.date_read_loop ...
> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
> (with 11ms breaks after every read).
> # rtctest.c:151:date_read_loop:Performed 2656 RTC time reads.
> #            OK  rtc.date_read_loop
> ok 2 rtc.date_read_loop
> #  RUN           rtc.uie_read ...
> #            OK  rtc.uie_read
> ok 3 rtc.uie_read
> #  RUN           rtc.uie_select ...
> #            OK  rtc.uie_select
> ok 4 rtc.uie_select
> #  RUN           rtc.alarm_alm_set ...
> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:01:14.
> # rtctest.c:282:alarm_alm_set:data: 1a0
> #            OK  rtc.alarm_alm_set
> ok 5 rtc.alarm_alm_set
> #  RUN           rtc.alarm_wkalm_set ...
> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 00:01:17.
> #            OK  rtc.alarm_wkalm_set
> ok 6 rtc.alarm_wkalm_set
> #  RUN           rtc.alarm_alm_set_minute ...
> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:02:00.
> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
> #            OK  rtc.alarm_alm_set_minute
> ok 7 rtc.alarm_alm_set_minute
> #  RUN           rtc.alarm_wkalm_set_minute ...
> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
> 28/01/2025 00:03:00.
> #            OK  rtc.alarm_wkalm_set_minute
> ok 8 rtc.alarm_wkalm_set_minute
> # PASSED: 8 / 8 tests passed.
> # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> 
> Thanks,
>   Enric
> 
>> Regards,
>> Ciprian
>>
>>>> ---
>>>>    drivers/rtc/Kconfig    |  11 ++
>>>>    drivers/rtc/Makefile   |   1 +
>>>>    drivers/rtc/rtc-s32g.c | 385 +++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 397 insertions(+)
>>>>    create mode 100644 drivers/rtc/rtc-s32g.c
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 0bbbf778ecfa..510dc2db745d 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>>>             This driver can also be built as a module. If so, the module
>>>>             will be called "rtc-amlogic-a4".
>>>>
>>>> +config RTC_DRV_S32G
>>>> +       tristate "RTC driver for S32G2/S32G3 SoCs"
>>>> +       depends on ARCH_S32 || COMPILE_TEST
>>>> +       depends on COMMON_CLK
>>>> +       help
>>>> +         Say yes to enable RTC driver for platforms based on the
>>>> +         S32G2/S32G3 SoC family.
>>>> +
>>>> +         This RTC module can be used as a wakeup source.
>>>> +         Please note that it is not battery-powered.
>>>> +
>>>>    endif # RTC_CLASS
>>>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>>>> index 489b4ab07068..e4b616ecd5ce 100644
>>>> --- a/drivers/rtc/Makefile
>>>> +++ b/drivers/rtc/Makefile
>>>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)        += rtc-rx8111.o
>>>>    obj-$(CONFIG_RTC_DRV_RX8581)   += rtc-rx8581.o
>>>>    obj-$(CONFIG_RTC_DRV_RZN1)     += rtc-rzn1.o
>>>>    obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)    += rtc-renesas-rtca3.o
>>>> +obj-$(CONFIG_RTC_DRV_S32G)     += rtc-s32g.o
>>>>    obj-$(CONFIG_RTC_DRV_S35390A)  += rtc-s35390a.o
>>>>    obj-$(CONFIG_RTC_DRV_S3C)      += rtc-s3c.o
>>>>    obj-$(CONFIG_RTC_DRV_S5M)      += rtc-s5m.o
>>>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>>>> new file mode 100644
>>>> index 000000000000..3a0818e972eb
>>>> --- /dev/null
>>>> +++ b/drivers/rtc/rtc-s32g.c
>>>> @@ -0,0 +1,385 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Copyright 2025 NXP
>>>> + */
>>>> +
>>>> +#include <linux/bitfield.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/iopoll.h>
>>>> +#include <linux/of_irq.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/rtc.h>
>>>> +
>>>> +#define RTCC_OFFSET    0x4ul
>>>> +#define RTCS_OFFSET    0x8ul
>>>> +#define APIVAL_OFFSET  0x10ul
>>>> +
>>>> +/* RTCC fields */
>>>> +#define RTCC_CNTEN                             BIT(31)
>>>> +#define RTCC_APIEN                             BIT(15)
>>>> +#define RTCC_APIIE                             BIT(14)
>>>> +#define RTCC_CLKSEL_MASK               GENMASK(13, 12)
>>>> +#define RTCC_DIV512EN                  BIT(11)
>>>> +#define RTCC_DIV32EN                   BIT(10)
>>>> +
>>>> +/* RTCS fields */
>>>> +#define RTCS_INV_API   BIT(17)
>>>> +#define RTCS_APIF              BIT(13)
>>>> +
>>>> +#define APIVAL_MAX_VAL         GENMASK(31, 0)
>>>> +#define RTC_SYNCH_TIMEOUT      (100 * USEC_PER_MSEC)
>>>> +
>>>> +/*
>>>> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
>>>> + * should not be used.
>>>> + */
>>>> +#define RTC_CLK_SRC1_RESERVED          BIT(1)
>>>> +
>>>> +/*
>>>> + * S32G RTC module has a 512 value and a 32 value hardware frequency
>>>> + * divisors (DIV512 and DIV32) which could be used to achieve higher
>>>> + * counter ranges by lowering the RTC frequency.
>>>> + */
>>>> +enum {
>>>> +       DIV1 = 1,
>>>> +       DIV32 = 32,
>>>> +       DIV512 = 512,
>>>> +       DIV512_32 = 16384
>>>> +};
>>>> +
>>>> +static const char *const rtc_clk_src[] = {
>>>> +       "source0",
>>>> +       "source1",
>>>> +       "source2",
>>>> +       "source3"
>>>> +};
>>>> +
>>>> +struct rtc_priv {
>>>> +       struct rtc_device *rdev;
>>>> +       void __iomem *rtc_base;
>>>> +       struct clk *ipg;
>>>> +       struct clk *clk_src;
>>>> +       const struct rtc_soc_data *rtc_data;
>>>> +       u64 rtc_hz;
>>>> +       time64_t sleep_sec;
>>>> +       int irq;
>>>> +       u32 clk_src_idx;
>>>> +};
>>>> +
>>>> +struct rtc_soc_data {
>>>> +       u32 clk_div;
>>>> +       u32 reserved_clk_mask;
>>>> +};
>>>> +
>>>> +static const struct rtc_soc_data rtc_s32g2_data = {
>>>> +       .clk_div = DIV512_32,
>>>> +       .reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
>>>> +};
>>>> +
>>>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
>>>> +{
>>>> +       struct rtc_priv *priv = platform_get_drvdata(dev);
>>>> +       u32 status;
>>>> +
>>>> +       status = readl(priv->rtc_base + RTCS_OFFSET);
>>>> +
>>>> +       if (status & RTCS_APIF) {
>>>> +               writel(0x0, priv->rtc_base + APIVAL_OFFSET);
>>>> +               writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
>>>> +       }
>>>> +
>>>> +       rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
>>>> +
>>>> +       return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +/*
>>>> + * The function is not really getting time from the RTC since the S32G RTC
>>>> + * has several limitations. Thus, to setup alarm use system time.
>>>> + */
>>>> +static int s32g_rtc_read_time(struct device *dev,
>>>> +                             struct rtc_time *tm)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +       time64_t sec;
>>>> +
>>>> +       if (check_add_overflow(ktime_get_real_seconds(),
>>>> +                              priv->sleep_sec, &sec))
>>>> +               return -ERANGE;
>>>> +
>>>> +       rtc_time64_to_tm(sec, tm);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +       u32 rtcc, rtcs;
>>>> +
>>>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>> +       rtcs = readl(priv->rtc_base + RTCS_OFFSET);
>>>> +
>>>> +       alrm->enabled = rtcc & RTCC_APIIE;
>>>> +       if (alrm->enabled)
>>>> +               alrm->pending = !(rtcs & RTCS_APIF);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +       u32 rtcc;
>>>> +
>>>> +       /* RTC API functionality is used both for triggering interrupts
>>>> +        * and as a wakeup event. Hence it should always be enabled.
>>>> +        */
>>>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +       unsigned long long cycles;
>>>> +       long long t_offset;
>>>> +       time64_t alrm_time;
>>>> +       u32 rtcs;
>>>> +       int ret;
>>>> +
>>>> +       alrm_time = rtc_tm_to_time64(&alrm->time);
>>>> +       t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
>>>> +       if (t_offset < 0)
>>>> +               return -ERANGE;
>>>> +
>>>> +       cycles = t_offset * priv->rtc_hz;
>>>> +       if (cycles > APIVAL_MAX_VAL)
>>>> +               return -ERANGE;
>>>> +
>>>> +       /* APIVAL could have been reset from the IRQ handler.
>>>> +        * Hence, we wait in case there is a synchronization process.
>>>> +        */
>>>> +       ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>>>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       writel(cycles, priv->rtc_base + APIVAL_OFFSET);
>>>> +
>>>> +       return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>>>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Disable the 32-bit free running counter.
>>>> + * This allows Clock Source and Divisors selection
>>>> + * to be performed without causing synchronization issues.
>>>> + */
>>>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>>>> +{
>>>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>> +
>>>> +       rtcc &= ~RTCC_CNTEN;
>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>> +}
>>>> +
>>>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>>>> +{
>>>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>> +
>>>> +       rtcc |= RTCC_CNTEN;
>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>> +}
>>>> +
>>>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
>>>> +{
>>>> +       u32 rtcc;
>>>> +
>>>> +       rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
>>>> +
>>>> +       switch (priv->rtc_data->clk_div) {
>>>> +       case DIV512_32:
>>>> +               rtcc |= RTCC_DIV512EN;
>>>> +               rtcc |= RTCC_DIV32EN;
>>>> +               break;
>>>> +       case DIV512:
>>>> +               rtcc |= RTCC_DIV512EN;
>>>> +               break;
>>>> +       case DIV32:
>>>> +               rtcc |= RTCC_DIV32EN;
>>>> +               break;
>>>> +       case DIV1:
>>>> +               break;
>>>> +       default:
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>>>> +       /*
>>>> +        * Make sure the CNTEN is 0 before we configure
>>>> +        * the clock source and dividers.
>>>> +        */
>>>> +       s32g_rtc_disable(priv);
>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>> +       s32g_rtc_enable(priv);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static const struct rtc_class_ops rtc_ops = {
>>>> +       .read_time = s32g_rtc_read_time,
>>>> +       .read_alarm = s32g_rtc_read_alarm,
>>>> +       .set_alarm = s32g_rtc_set_alarm,
>>>> +       .alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>>>> +};
>>>> +
>>>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>>>> +                            struct device *dev)
>>>> +{
>>>> +       u32 i;
>>>> +
>>>> +       priv->ipg = devm_clk_get_enabled(dev, "ipg");
>>>> +       if (IS_ERR(priv->ipg))
>>>> +               return dev_err_probe(dev, PTR_ERR(priv->ipg),
>>>> +                               "Failed to get 'ipg' clock\n");
>>>> +
>>>> +       for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
>>>> +               if (priv->rtc_data->reserved_clk_mask & BIT(i))
>>>> +                       return -EOPNOTSUPP;
>>>> +
>>>> +               priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>>>> +               if (!IS_ERR(priv->clk_src)) {
>>>> +                       priv->clk_src_idx = i;
>>>> +                       break;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       if (IS_ERR(priv->clk_src))
>>>> +               return dev_err_probe(dev, PTR_ERR(priv->clk_src),
>>>> +                               "Failed to get rtc module clock source\n");
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_probe(struct platform_device *pdev)
>>>> +{
>>>> +       struct device *dev = &pdev->dev;
>>>> +       struct rtc_priv *priv;
>>>> +       unsigned long rtc_hz;
>>>> +       int ret;
>>>> +
>>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>> +       if (!priv)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       priv->rtc_data = of_device_get_match_data(dev);
>>>> +       if (!priv->rtc_data)
>>>> +               return -ENODEV;
>>>> +
>>>> +       priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>>>> +       if (IS_ERR(priv->rtc_base))
>>>> +               return PTR_ERR(priv->rtc_base);
>>>> +
>>>> +       device_init_wakeup(dev, true);
>>>> +
>>>> +       ret = rtc_clk_dts_setup(priv, dev);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       priv->rdev = devm_rtc_allocate_device(dev);
>>>> +       if (IS_ERR(priv->rdev))
>>>> +               return PTR_ERR(priv->rdev);
>>>> +
>>>> +       ret = rtc_clk_src_setup(priv);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       priv->irq = platform_get_irq(pdev, 0);
>>>> +       if (priv->irq < 0) {
>>>> +               ret = priv->irq;
>>>> +               goto disable_rtc;
>>>> +       }
>>>> +
>>>> +       rtc_hz = clk_get_rate(priv->clk_src);
>>>> +       if (!rtc_hz) {
>>>> +               dev_err(dev, "Failed to get RTC frequency\n");
>>>> +               ret = -EINVAL;
>>>> +               goto disable_rtc;
>>>> +       }
>>>> +
>>>> +       priv->rtc_hz = DIV_ROUND_UP(rtc_hz, priv->rtc_data->clk_div);
>>>> +
>>>> +       platform_set_drvdata(pdev, priv);
>>>> +       priv->rdev->ops = &rtc_ops;
>>>> +
>>>> +       ret = devm_request_irq(dev, priv->irq,
>>>> +                              s32g_rtc_handler, 0, dev_name(dev), pdev);
>>>> +       if (ret) {
>>>> +               dev_err(dev, "Request interrupt %d failed, error: %d\n",
>>>> +                       priv->irq, ret);
>>>> +               goto disable_rtc;
>>>> +       }
>>>> +
>>>> +       ret = devm_rtc_register_device(priv->rdev);
>>>> +       if (ret)
>>>> +               goto disable_rtc;
>>>> +
>>>> +       return 0;
>>>> +
>>>> +disable_rtc:
>>>> +       s32g_rtc_disable(priv);
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_suspend(struct device *dev)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +       u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>>>> +
>>>> +       if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
>>>> +                              &priv->sleep_sec)) {
>>>> +               dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
>>>> +               priv->sleep_sec = 0;
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_resume(struct device *dev)
>>>> +{
>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +       /* The transition from resume to run is a reset event.
>>>> +        * This leads to the RTC registers being reset after resume from
>>>> +        * suspend. It is uncommon, but this behaviour has been observed
>>>> +        * on S32G RTC after issuing a Suspend to RAM operation.
>>>> +        * Thus, reconfigure RTC registers on the resume path.
>>>> +        */
>>>> +       return rtc_clk_src_setup(priv);
>>>> +}
>>>> +
>>>> +static const struct of_device_id rtc_dt_ids[] = {
>>>> +       { .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>>>> +       { /* sentinel */ },
>>>> +};
>>>> +
>>>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>>>> +                        s32g_rtc_suspend, s32g_rtc_resume);
>>>> +
>>>> +static struct platform_driver s32g_rtc_driver = {
>>>> +       .driver = {
>>>> +               .name = "s32g-rtc",
>>>> +               .pm = pm_sleep_ptr(&s32g_rtc_pm_ops),
>>>> +               .of_match_table = rtc_dt_ids,
>>>> +       },
>>>> +       .probe = s32g_rtc_probe,
>>>> +};
>>>> +module_platform_driver(s32g_rtc_driver);
>>>> +
>>>> +MODULE_AUTHOR("NXP");
>>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> 2.45.2
>>>>
>>>
>>
> 


