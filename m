Return-Path: <linux-rtc+bounces-5588-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F952CC9B97
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 23:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BFF6300378D
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 22:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765E0313530;
	Wed, 17 Dec 2025 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NjOglj5d"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E722C32D;
	Wed, 17 Dec 2025 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766011121; cv=fail; b=MWqPUbCLzpw+6PPvtfCjAuFlSNCcm7F1WLd2HgCmEJnOak1UHEPhGZRsGQN3Jdz3n4ifYY7pvT6ufsHSS1AgR2Xm4VDcltFeqBfJKgWH1ahuJJCoj7dhfoWja55CIABn0uB97Lb5CNJQArsH4YaGJ7YBA3wdEBI8izXG4Q95+Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766011121; c=relaxed/simple;
	bh=sLMm/QyQ9DU5OVftzpj9Zt1Kyock672A7rdFWeZSk0U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kpr07Kjk0HYUXmguO30X1nWniUV3r58GNlwVwlG78dX5cy1YBE6Fd15dwMw/ukSxiiHIC8QuTTYghz7cqt65skPZDly3Tbq9t7aYT/iromJDGRgLgJi1kwEFdua0r79BrbgGm32/+rrX8P65ar8QO/DrZnwZnBCkRfM+zlBpWBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NjOglj5d; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/4mtEeTxonsRnqZ9YhnTAj5jlcDm9aNsa3VMVbOQJiuYsrLFbhFnglZSRCrMIXYet/rHhv6mEuXCdODZIhcCq+0irggnBVPnwQMJOTKVgnE304gZhBlU4j/2dRjl0rgJY2j/3ZIUSupCgVM2FMsPTN5qd259npzAf+uxNPscaaPhVrv89i1HHhFV+XgEsMHxfxmhYrxAgNghaoulMEE8p59ImFfMc8Gz8bp2s8bLoeXq6D+SJzSn8zICgNJsbxkeh4z4oLmfZdVVR37Wlk8qRhLNNp3BIX+8BK3zCTng593AL+JvTh3/obh43E5jJEBT7rfmT62VQJEtQv/Aqb/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLMm/QyQ9DU5OVftzpj9Zt1Kyock672A7rdFWeZSk0U=;
 b=dZAOcR6WNvHSMgFBa0yRKJ3pu34rma3h94fBApzluOdcvxVpR1hn12v4oDrPFzw5dmC9fbCKvO5drZz3a6I0WfkZOlIgICb65epGZvMKLD0TwYLLGRc3ZiA01SuWyt9jVSA0LT3pRyAdjNqWibILgG/3C9tv8BXP73TayuDE3jVhS7xcIbZ0Ln9Kj524kY/SdvBIS9LoaCQQDegW96F+LYJHfvmrMz8m+TMTU/icHEGJAkHcEQ0qaKHn21+c70bw7aM3TxZxav5La316hZ9kWeFOVI/RiouUlydwSF13QnOlaM/8vPoiW0vg45f8erqjsnkA0fn7YbC47BxyE0m+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLMm/QyQ9DU5OVftzpj9Zt1Kyock672A7rdFWeZSk0U=;
 b=NjOglj5d7nrykMYx9nPF9lO58wJGKlYp2Y67WXq0HEX3K2jNEipVZHkk5zVwiUzYBB0LG1y2/NpbZLF2yg074AP0Pa67ztZXaDlstdZhRKafLQAzDUBuCCFTG6UxR5i824EUT88RQbOw9qHswyZi9bXazPOHHOoSTb+6F1gZ1H4=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 19:03:30 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 19:03:30 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
Thread-Topic: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
Thread-Index: AQHcYsGwjR9EqaGou0mm1zqAQ8hFQ7UZu2wAgAEfMoCAC2cgsA==
Date: Wed, 17 Dec 2025 19:03:30 +0000
Message-ID:
 <LV5PR12MB98042BB367DAEC6C9BD9D96392ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-4-33875c1e385b@vaisala.com>
 <LV5PR12MB98046A63E80D7A7FA299366E92A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
 <ea85c8d6-ead8-4fda-905d-909968de5056@vaisala.com>
In-Reply-To: <ea85c8d6-ead8-4fda-905d-909968de5056@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-17T18:33:40.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DS2PR12MB9751:EE_
x-ms-office365-filtering-correlation-id: 8fae6574-659f-41a5-c065-08de3d9ef7b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXd0QTJKUXh2YTZDdVRSN050N0ZyQlNNRmlxK0U4Nnphengyc3o0NEM2MTJq?=
 =?utf-8?B?b2RpMjdhS0VrdithdGk0WmpuM3djN1FMa2NrcXorQnl5UFJPOXFhWFowS2dN?=
 =?utf-8?B?MjlJVGYvU0djMXBkWkVmMFFRaU1vZFIzazIwRGdaZ1hVTnMyOCs2d2p4cVNE?=
 =?utf-8?B?aVEwdGllTjA5RFh5RkpDOXZ4Ykc4Q25xQlZMVm5kei9BcVNFdVRYQXFMZ0xv?=
 =?utf-8?B?TVRzbmRRRTFSZmNXSytLaTRkR1Y4aFN2K2lXdUxucXRqNno2VUNtZytxSVJq?=
 =?utf-8?B?OUlwbUsyZE1ZSDRFY1dOYzV3YzRNR2paTFZxLzhITW1iR3QyeHp1d1NUM2JI?=
 =?utf-8?B?cDBmejQ4akhFOCtuN1E0VHQrcUVhckNtaXZWdEp2N0YyOFpEWlhIeTgwZ2Z1?=
 =?utf-8?B?cHd5KzB6cjZ1TC9yUCtjWmNNZEdRVE5DMVR0T3kyMzJEOGVsaHQ0cmpkZndP?=
 =?utf-8?B?eC9WN0RnaElYYjJtcXQ5YytVQ2VrNStHT01kVEhvcWVVdzRsWlh4dEVnZGVW?=
 =?utf-8?B?RXlVdzI4czZySDg0VTFmNkxHVUo2djNEM3h5UEpDVVhyejFkaDNGM1owZkRx?=
 =?utf-8?B?VmVkM1dEV2w4a24rZlRyOGlpeVB0V2pjZlVIb0RHYWhPZlFvaEtYM3VPVG5n?=
 =?utf-8?B?SExPYTNmMG1jc2ZmQk15NndOaGdjZnpDeDJURkhOOUZmVHl4ci9QL2kyOHRD?=
 =?utf-8?B?OGlwMDJFaGtQcnFIVitBMTBkYS8yUWRyS2lEeEpqWlpQalRETXJ1dlEyZGQv?=
 =?utf-8?B?ditDbFZ2OEwzVENFOXhPbWV1d1ZiREZ3UTNQZURRQnUycStGeDZHbCs5NlAx?=
 =?utf-8?B?WWhNdzNFSFBKaFVBWTJkbUl1Tzd5T0laRnhXL2RJbk5uSllsUy9zUHBTZDgy?=
 =?utf-8?B?L1BkT0FncVU1YmVSandRdis4cHg2N1BlZVlnc0tNNVlSYW5vREhYNUR3ek9r?=
 =?utf-8?B?KzJvSXU4YXVyZGlWNmI3cENWNEk1VEYzbnhtUzlBTUcwZ3RxbnR2blNrSFFu?=
 =?utf-8?B?OFdObHFQcWF5UWs2amJ5Uk4yTlVGUVUyUExDR1MwOHJlZDJlNGxnTytSY2cv?=
 =?utf-8?B?MVZyaFhQb05WcjRCdFA3Sll6VklrQ3UxeFJ2YW1vN0R0MkI2dXNWb09UcmtT?=
 =?utf-8?B?ZTZzVFdzR2cyQkp6ckx3VktnVjFrR2tpUEdVK0pUOVJoTXBQVkxoQW95bnow?=
 =?utf-8?B?b3ZSMThrQVhFTnljMXQ0dXB1bzdSMlFrMnVZOW1zMHJGZWJXYjlpRDlhcDlq?=
 =?utf-8?B?RGdzWVR6ZkZwTkpNZUpXaWdsWDY5aE55T1pFVENsUDBqWTBWR20vUkg3amN2?=
 =?utf-8?B?bGRUV1J3ZTVIM1RYQ0thajRvcG1sQkJRQVBjRWgwbmcwUmVPTm1UM0JFOGRL?=
 =?utf-8?B?bG8wcU9CZDJlQk9EYmZVWTFZUExHOEVNelNKZDgxVEtYdk0zM0k0K0YzTThX?=
 =?utf-8?B?OUphUUdXaDVkaXFTeVlWT2FZdFNtK1JjMmx2MFFrcFkyV2IwZjBJU3hMQ2xM?=
 =?utf-8?B?OXV0Qlc5VDUxTFoxelVCK01IbTRVbFNlRjJ5UlJRL3ZLYzBuQndoT1h1MEtP?=
 =?utf-8?B?aVhISXZqZ1hTWlpMRlBEcmVHakZRRmFEVW0rdGlQWmQwa21BYmtBcVVMM1Y4?=
 =?utf-8?B?aW43WUNjWXhxUVpiRll5Q3ovaTBFVjVEb0tHNEZUNG1DZlZjVUVsQ2NMRlRW?=
 =?utf-8?B?VGlBaDJsVHYrMjVzdDJnTFNMZmloZDRuSDlrcCthREhMV1RtbytacmViYWZM?=
 =?utf-8?B?ZTdiT2pWbldqK1JCRlJtS3FDM1hRcUQreXlXQ1kyclFrUlhWK0xkaXI5aTR6?=
 =?utf-8?B?M2M0NElDSTVvRTE0b2tsbzZHbmJ1RllvYlc0a2wrSXBZdmZORTFBbThwb3pV?=
 =?utf-8?B?YVVIMElCeDArdFJKeGxZRHB0WE5nVDNNdDJtcm94QUVYTjZud1RrSzRnbkZz?=
 =?utf-8?B?OVVjVVhseTRYWEN4cG5WL2VnZmdPUEczVmFyVU9nRVJoYVExZGRMUFJSUlFp?=
 =?utf-8?B?VlZXSDJ5M3o5OExra0ErL2VBd1JTeFlISC9GRXhud3ZWT1kxS01QUzJxcHBC?=
 =?utf-8?Q?9R9LyK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmhScEVhVHpwQVhVM0xtVEU3dFlsd0UrdWI5Ulg0dVVBblYwRHM5ckFIM2R2?=
 =?utf-8?B?ZHM5MkE5c2N1VFF6U29kMGxFUy9MMDZEWW5WUkpuRlpVL1o0cktSRGZKZjE4?=
 =?utf-8?B?M0JTVGlUemJQMC9sZzRGdVBMNnk0eW9DTDJXOEJiZDR0cldpb3R4M3lBaWV3?=
 =?utf-8?B?ZW5jUkpxZXpDeHlQenFteVc4d2xtbkc1UEFmb0lYMWptc2hBZ0lwMU84Yy9I?=
 =?utf-8?B?KzJ0Wmozb2RicDJOZHY0YkZVUW0xZUlmVXMwUWlmajRSL3gvNEIxcEpsQlRp?=
 =?utf-8?B?aGxGTVY5RytST0E2dEJWOXlEb1pPd21wVUdWbUx4L3I3UGtCQ1hENndrUkEx?=
 =?utf-8?B?Y1k5b0NnNFg1M1B4YmM0TUJtblpUT1FCUzRrcnhMMk5wSXdOdmZLZGkxa05H?=
 =?utf-8?B?Z2twVHRkVDFGY1laSTZzUi9UTStLRTJEOVNxOVFDenZuQXVFb091cVk1ZHJj?=
 =?utf-8?B?b21kemJYRGZSWXdMcG53UHRDeHNzeFZtNUx1SmtMb3NpbFlaK215cm9PYlBN?=
 =?utf-8?B?RmxMODRpSHA0K3AycDQ4STRPck5FN2hMU1NKWjM1ZlhMaVZnRjh3Z0k1bVBC?=
 =?utf-8?B?M0RmUU5JR3FkY3VHOEhuYjRvTVU5d2VhTXNpUndSd1d5dXZRNDRnWjRHWnQ2?=
 =?utf-8?B?MEo3ZHUrVlZEd0krcldHcUErR0ttQmoxRnpCOTgwODlxcUsvKzAwZUl4Qjdm?=
 =?utf-8?B?c2dWWTZwMFdEN1FFbTBTanY4RzdNVUN1Tmg4ZWJYdnAzSUN4K0k1ZTBHR3Zq?=
 =?utf-8?B?bHZscS9JZEpZVFBxcFprUGxWMWxseEdESzczQTNzdFZ3cVl1YzI0SFpHeExa?=
 =?utf-8?B?M05HZG0rWUxYWXFieHpCUk5MUTNQMHFxNU83a1FBd0F2d3Mzd1V4R1MrclBH?=
 =?utf-8?B?Y29jWVlKNVJLUk5qaDFMQTRsWnhTRDJzQUMxaGtOUDA4KzZrSHF0MUE4TmJr?=
 =?utf-8?B?SU4yQnFnL3hybFVFRnFzNFhtSHBRTk5JSHpCYzBTUlVod0J0NkFLTFU4RS9m?=
 =?utf-8?B?WXgyVHBRdGJWa1cvdXNqK0w1RldjOGVlbzV4Um1pdUs3azl4dFBDV20wWGZ5?=
 =?utf-8?B?Z0xVekM3WXc5dmdCZTV6MUFTdVpvckpVdlBsUE00dk0xc01wSnR2ZDRPOXEz?=
 =?utf-8?B?Kzdxd2tndkxTRnBSWkNXbnVId1FGRnM2cmxyeCtaTG9GbmhPRllPMUtjd0ZX?=
 =?utf-8?B?SDBiS2lDeWJybjYyRXFwYjcvWDM2YUozbktmSWhOMDA5bzFqSG9KMWNINTlK?=
 =?utf-8?B?aldFZWxRamYvQU1qbXFQNS85MDBuTms2ZmoyL2Y0RnFCNXdadzZiQzZJMDVr?=
 =?utf-8?B?OTk0Y1gyUnFyQ1FqM29haEFiV1I2cTZLMWtnS1B4WWtRanNTN0MzUVVUQXh0?=
 =?utf-8?B?dlZGYzJlUVhwUG9rTFdUQnh3V2ZBcVBGckFqY1N6QzBDbmo2YVZFZnFTZW56?=
 =?utf-8?B?cXBIWWs5VVplMDJlSmNCL1k5M0NlQ3UveVBpUDNZdkVQM0p6Y01aWTQwWU5h?=
 =?utf-8?B?Nk9JSnhHczQ1enRFV2tqYjI3K25RK1hablJRZzh5K0l2VWxzV1BRWWJERHE1?=
 =?utf-8?B?T1poeWpiNWIzc3JYb29RTjRqQXNhRWtscVI2RU5UbzBoSTlhcGplSTVMVHpB?=
 =?utf-8?B?KzNpdDFXWjJEeG80emU2Z21ZZ0lpa1ZleUFMc0VsNkFlS2kyaE4wcEgrUUcv?=
 =?utf-8?B?bTdoQkRVK0xFUm5ybEdhdVM5WGl5c3liRExZd1ZmbjQ3WktLSTdSR2xJNFQ1?=
 =?utf-8?B?VDAwNWRSQ0F3K0twQUVKNkE5VUxsTnRKTEVCcWNMVVg5clVZRlNyRHlzL0x2?=
 =?utf-8?B?UjMyWE4vTGs4dW8yV2tCZy85emU0SjZuTFl2dytJREp6M3pBczBVSFRSY1h4?=
 =?utf-8?B?Q0xRVzdZWlYxb1A0MStETklyS1Q2VVUxVDlFTVEzK2JlLzg1U3JnNzhKd05o?=
 =?utf-8?B?cHBzY3BGeXc3M2hVVG5ZaVRncVJVbVhOc2ZHYjBiQUVaVTEwYzFRbVN1MXF1?=
 =?utf-8?B?eTJLUzViNUI0bG5adW5FR1crdHFqL1htUmUyQVJTdktzQnNMMTV1dGNGN0pZ?=
 =?utf-8?B?UVMyMkFjazhBR2FGUUZmK0ZOa0hPQ0o3N0ZiNXp4eVR6Q3lxR28xS2hQaDRK?=
 =?utf-8?Q?82LY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae6574-659f-41a5-c065-08de3d9ef7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 19:03:30.3140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYGSCNHnfjSkpto9gqsjvD5T0EEPT96jrjo8UrY6VjhzWjFHwAynqWGkAg8e1wAC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IERlY2VtYmVyIDEwLCAyMDI1IDU6NTUgUE0NCj4gVG86IFQsIEhhcmluaSA8SGFyaW5pLlRAYW1k
LmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNv
bT47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBDYzogbGludXgtcnRj
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQv
NF0gcnRjOiB6eW5xbXA6IHVzZSBkeW5hbWljIG1heCBhbmQgbWluIG9mZnNldCByYW5nZXMNCj4N
Cj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3Vy
Y2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNr
aW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBIaSwNCj4NCj4gT24gMDkvMTIvMjAy
NSAyMToyOCwgVCwgSGFyaW5pIHdyb3RlOg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4gPiBIaSwNCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBUb21hcyBNZWxp
biA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIg
MSwgMjAyNSA2OjIwIFBNDQo+ID4+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJl
bGxvbmlAYm9vdGxpbi5jb20+OyBTaW1laywgTWljaGFsDQo+ID4+IDxtaWNoYWwuc2ltZWtAYW1k
LmNvbT4NCj4gPj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4gbGludXgtIGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gPj4gU3ViamVjdDog
W1BBVENIIDQvNF0gcnRjOiB6eW5xbXA6IHVzZSBkeW5hbWljIG1heCBhbmQgbWluIG9mZnNldA0K
PiA+PiByYW5nZXMNCj4gPj4NCj4gPj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQg
ZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gPj4gY2F1dGlvbiB3aGVuIG9w
ZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPiA+Pg0K
PiA+Pg0KPiA+PiBNYXhpbXVtIGFuZCBtaW5pbXVtIG9mZnNldHMgaW4gcHBiIHRoYXQgY2FuIGJl
IGhhbmRsZWQgYXJlIGRlcGVuZGVudA0KPiA+PiBvbiB0aGUgcnRjIGNsb2NrIGZyZXF1ZW5jeSBh
bmQgd2hhdCBjYW4gZml0IGluIHRoZSAxNi1iaXQgcmVnaXN0ZXIgZmllbGQuDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+ICBkcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMgfCA4ICsrKy0tLS0tDQo+ID4+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+Pg0K
PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGIvZHJpdmVycy9ydGMv
cnRjLXp5bnFtcC5jDQo+ID4+IGluZGV4DQo+ID4+DQo+IDNiYzg4MzFiYTJjNGM0YzcwMWE0OTUw
NmI2N2FlNjE3NGYzYWRlM2QuLjBjZWJjOTliMTVhNmRlMjQ0MGE2DQo+IDBhZmMNCj4gPj4gMmJk
MTc2OWVjY2ZhODRiMyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5j
DQo+ID4+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiA+PiBAQCAtNDQsOCArNDQs
NiBAQA0KPiA+PiAgI2RlZmluZSBSVENfRlJfTUFTSyAgICAgICAgICAgIDB4RjAwMDANCj4gPj4g
ICNkZWZpbmUgUlRDX0ZSX01BWF9USUNLUyAgICAgICAxNg0KPiA+PiAgI2RlZmluZSBSVENfUFBC
ICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwMDAwMExMDQo+ID4+IC0jZGVmaW5lIFJUQ19N
SU5fT0ZGU0VUICAgICAgICAgLTMyNzY4MDAwDQo+ID4+IC0jZGVmaW5lIFJUQ19NQVhfT0ZGU0VU
ICAgICAgICAgMzI3NjcwMDANCj4gPj4NCj4gPj4gIHN0cnVjdCB4bG54X3J0Y19kZXYgew0KPiA+
PiAgICAgICAgIHN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGM7DQo+ID4+IEBAIC0yMTUsMTIg
KzIxMywxMiBAQCBzdGF0aWMgaW50IHhsbnhfcnRjX3NldF9vZmZzZXQoc3RydWN0IGRldmljZQ0K
PiA+PiAqZGV2LCBsb25nIG9mZnNldCkNCj4gPj4NCj4gPj4gICAgICAgICAvKiB0aWNrcyB0byBy
ZWFjaCBSVENfUFBCICovDQo+ID4+ICAgICAgICAgdGlja19tdWx0ID0gRElWX1JPVU5EX0NMT1NF
U1QoUlRDX1BQQiwgeHJ0Y2Rldi0+ZnJlcSk7DQo+ID4+IC0gICAgICAgaWYgKG9mZnNldCA8IFJU
Q19NSU5fT0ZGU0VUIHx8IG9mZnNldCA+IFJUQ19NQVhfT0ZGU0VUKQ0KPiA+PiAtICAgICAgICAg
ICAgICAgcmV0dXJuIC1FUkFOR0U7DQo+ID4+IC0NCj4gPj4gICAgICAgICAvKiBOdW1iZXIgdGlj
a3MgZm9yIGdpdmVuIG9mZnNldCAqLw0KPiA+PiAgICAgICAgIG1heF90aWNrID0gZGl2X3M2NF9y
ZW0ob2Zmc2V0LCB0aWNrX211bHQsICZmcmFjdF9vZmZzZXQpOw0KPiA+Pg0KPiA+PiArICAgICAg
IGlmIChmcmVxICsgbWF4X3RpY2sgPiBSVENfVElDS19NQVNLIHx8IChmcmVxICsgbWF4X3RpY2sg
PCAxKSkNCj4gPiBUaGUgY2hlY2sgJ2ZyZXEgKyBtYXhfdGljayA8IDEnIHNob3VsZCBiZSAnPDIn
IHRvIHByZXZlbnQgd3JpdGluZyAwIHRvIHRoZQ0KPiBjYWxpYnJhdGlvbiByZWdpc3RlciB3aGVu
IGZyYWN0X29mZnNldCA8IDAgY2F1c2VzIG1heF90aWNrLS0uDQo+ID4gRXhhbXBsZTogZnJlcT0z
Mjc2NywgbWF4X3RpY2s9LTMyNzY2IHBhc3NlcyAoc3VtPTEpLCBidXQgYWZ0ZXINCj4gZGVjcmVt
ZW50IGJlY29tZXMgY2FsaWJ2YWw9MC4NCj4gY2FsaWJ2YWw9MCBpcyBub3QgZG9jdW1lbnRlZCBh
cyBpbnZhbGlkIGNhbGlicmF0aW9uIHZhbHVlLiBBRkFJUyBpdCB3b3VsZCBtZWFuDQo+IGEgZnJl
cXVlbmN5IG9mIDFIei4gQ2FuIFlvdSBwcm92aWRlIG1vcmUgaW5mbyBvbiB0aGlzPw0KPg0KWW91
J3JlIHJpZ2h0IC0gY2FsaWJ2YWw9MCBpcyBoYXJkd2FyZS1zcGVjIGNvbXBsaWFudCBhbmQgcHJv
ZHVjZXMgMUh6DQpvcGVyYXRpb24uIFRoZSBwYXRjaCBpcyBjb3JyZWN0IGFzLWlzIHdpdGggJzwg
MScuDQpUaGVyZSdzIG5vIGlzc3VlIHdpdGggYWxsb3dpbmcgY2FsaWJ2YWw9MCBmcm9tIGEgaGFy
ZHdhcmUgcGVyc3BlY3RpdmUuDQo+IFRoYW5rcywNCj4gVG9tYXMNCj4NCj4NCj4gPj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRVJBTkdFOw0KPiA+PiArDQo+ID4+ICAgICAgICAgLyogTnVtYmVy
IGZyYWN0aW9uYWwgdGlja3MgZm9yIGdpdmVuIG9mZnNldCAqLw0KPiA+PiAgICAgICAgIGlmIChm
cmFjdF9vZmZzZXQpIHsNCj4gPj4gICAgICAgICAgICAgICAgIC8qIHJvdW5kIHVwIGhlcmUgc28g
d2Ugc3RheSBiZWxvdyBhIGZ1bGwgdGljayAqLw0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjQ3LjMN
Cj4gPj4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBIYXJpbmkgVA0KPiA+DQpSZWdhcmRzLA0KSGFy
aW5pIFQNCg==

