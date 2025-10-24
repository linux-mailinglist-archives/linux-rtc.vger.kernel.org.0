Return-Path: <linux-rtc+bounces-5144-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2074FC05A73
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 12:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9AC94356C54
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39633306B0D;
	Fri, 24 Oct 2025 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aBD1VeXD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982B19882B;
	Fri, 24 Oct 2025 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302907; cv=fail; b=uLeN6k6s5fUI+8Ba7X5XTO8inDi1GqbKj3BQzVm5JOmAepze6vsC3nn7Gmsw7Pt4/ErF4IFS5tszerM9mvq2VGSd4JPUEt7N21pizLW1iXZzFJN+KLuD+uQK8hhxwe3jhGt9BxFgUdmXb+aiZ142gpqqafCRU9t/LSeKdvFPd1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302907; c=relaxed/simple;
	bh=rKnAywtRzlDp3oM03DSrvJyEwGP7qqFOnpCXTxmAkXA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c1mMTbEUR0t5k6Q4NqqHcyA3NzO5bOTSbVamYlz6Px4GwXW4Rk30hFDc+Gq+sefVJrbcAM/u+5S+cTJ9N8jnZ0skpXgbl28KJDmQbfZ3jcS2usokbfASKV1h8vnabU84jqBj0WJzGsnT43SSRKQMEfQzXQYlRFcVgtZsebBjX3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aBD1VeXD; arc=fail smtp.client-ip=52.101.62.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFsKzf/YmMUYaSMLrPmxZEGBeHN8gVPDbbk0p2z6IRocQmBt+bmlfyuAkrdEsJj0fJDg56DmrlCd7/AZjzCqEvPvFV4bkx9+aeN+ELj/KhYLJqHrmWnwFJunKk/awmca6J9hcB4vTOn/JggPhzsRvmkFxri9dm49hdt9xHzgoRfAXU05+JREW7XYp+0BXoeFNeyxERNlOncVFimvr7cSgfXNw8Lytf8qNouOd3Nf3p3xxupS9GI/C+IIIUHHoCEbcQZdOsF+UveXMQYH7y4VwPfDsV3QdFVhCBSV0N8SFKKukzxVHeDXD7xksGBGv7nhG6Ch+qwS3u9aM3EmClReyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHZRUtQ6ZMu90XxzL+Btgi9VwwuvZ3kVbjJUJG2LMKM=;
 b=xrp01tauXrG42Z+kscomuQ8jJSi7ejFHOWUqoL31ApHb6zP6Eh8h1QdV4JSeTryOby4CU4Kl/Sc7MRC6LmyYIQA2uAzgkEAXItiDWs7/4cxI+1FZgQvCJiuNTFmFOJtC20nPhuzMZicIX9ZLlVDuymVlYVdmseBMjjTCDoVbfUriVewrTlQA18QupNw31ASvjRHMIGaJ/aI9zFOWuUVq60NKoIpe+7/Lp+DBYqV3tjamm2lyMBJ9NJKeRnVq232nWvlbpzf5uehUsJNQCstYtlPAH8GhG6PMiX3BEd6ui7PpZwae959wLXCkxMOpnV+pcAgR+QTJIhnj/L5xG9Ib3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHZRUtQ6ZMu90XxzL+Btgi9VwwuvZ3kVbjJUJG2LMKM=;
 b=aBD1VeXDnwyUzWeuoivj3e1j3EuMD9Vh2B1px1YZi9wKtOD0wY1XvmQF2Q3Dcz/2tgDR41YIoCkkxWziDJN+XN+rO1ru7Js2egQaDwbxY70XKxnWr40qIKPkgKE0aXlNsagU/n9HbsviqLAOBfvdopcfOO4BIHUdtrQiXER/AEIj9GvgIkXOelgpPVv99aSdl/F8f3Q/Z7vwfg0KPct9c6enuMNdkQreE+BL19ayfH/vzRkMGIN8aLGe9MQOH0F+sBp053yrQzl2bilAKV+xdJOhXd07GFZoVuDqtuYzxJ0q3PCQ0IlQNwtTVUONfzIP2tCk8E7T5f/uiYAdQ293Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:48:19 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:48:19 +0000
Message-ID: <1f36b2a9-bf84-49f3-a27e-f264403c3ae1@nvidia.com>
Date: Fri, 24 Oct 2025 11:48:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
To: Kartik Rajput <kkartik@nvidia.com>, alexandre.belloni@bootlin.com,
 thierry.reding@gmail.com, andriy.shevchenko@linux.intel.com,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251024064952.775883-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251024064952.775883-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0631.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ea9ed0-6e67-4e42-56ef-08de12ead855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHFsbXdTWE5NeFVaTW1QNm85OUNyd1kzNVBOcFN2eFd3Tk11eVZEaGRvVS82?=
 =?utf-8?B?T25WMGJSTmtvSUdRM1h0WUNLYXJ3ZDBhMjY2RmdQbHpodGlvWU1LMWRKd2h1?=
 =?utf-8?B?eWt6MlQ1SjJlWWJzY2tBcUg5V3FvM1VzdXRvZ0tRcnFjN1FJVEc5Q3RwY1Vs?=
 =?utf-8?B?UCtwaW95ZzlGUUk0MUVkbWR3VFZ2cElEMU5EUG5WZUwyMTJFUlNhQldkVFNV?=
 =?utf-8?B?NzB1MTA0VjZINnpYNWh4SVB2K21wVVV2NkVSRXdlOHIyN0prcldOL1pjNm9i?=
 =?utf-8?B?MFpnUDlQZ0V6eE1RSmczaG40Q3RJZEdyZUl5K0orQXg2N1gvMUFCc1FWY0VZ?=
 =?utf-8?B?R214dGNWc0NrUS9DRnJqYmlPZy92T2ZzL0pHM05NVEhxaGdFKzlVc3BMWmJs?=
 =?utf-8?B?YUp3TXNseGtxVFFIZytKV1d5Zi9QT090MDRYOVlNdGRkbGNKQ1NRU2xuS0w0?=
 =?utf-8?B?QWpkYTFzZXFKUmtXOUtKTnJHZy9RWkZ2ejc2OXRHWlY2TUZiMmc4ajAwcmxy?=
 =?utf-8?B?dEZMYVdIRFRGek9ZWDh0QlVmV0lnNm0yalpzaEVjY0dXMFpOeERheWsyMEJq?=
 =?utf-8?B?TnlKU1B0VkoxbzlyeGFWdEFCQmI5SCt6Q3F5dlZWSVljT0lsazhRaklkU0I1?=
 =?utf-8?B?MXlyRlpsbDlnRFVTeWlhT2hiT0NITGdIcGczMnRwbVdaeDlZOGoyTktTYk5l?=
 =?utf-8?B?MDFBQVJCeSt3Q2h0N25LRDRxLzE1OG40ZGthV0xMNm14YW4xTEZPWHhndzdU?=
 =?utf-8?B?dG4rb1RZNzducU9MN3VwWjRldzh6d2swU0dsM1pGUGJpSTlQdWp2QTVTVG5D?=
 =?utf-8?B?ZkVmVk5rendsaTlYQTBybG95MUxTd3Z0dDRWVFV5d1VucXhITDIxamg2Y1pS?=
 =?utf-8?B?a3NKcFZZYVAvNEV2WWZjL08zSTIvMTJYd0RrYnBkNWt5d3JnNTlTckxMRmZy?=
 =?utf-8?B?OTRMT012WkVqZ1VYTjBYYXJtQ3NZMnAvaTAvVUZ1OWFTcll6SzkrdkVjcTRN?=
 =?utf-8?B?RmdiOHJ2NmcwS3J2WlI4SERIVVU3SS9lN25GZFBybHA3REg2ai9PQThIeEdH?=
 =?utf-8?B?QXVZdDQ5bElLSElDc0gyVitzTFJBa1FTYVdEUFZvN3hnWDJTdHA0VThjNFUz?=
 =?utf-8?B?U0ZMSXFNRzJ6VHFqT2lJSVVuZSs5bUVkc0JHTGFPazlqb09QN1crVHYybVUx?=
 =?utf-8?B?S0Q0K3I5d0I2UFlBdDFzVmtPcUhkNU5ld3FoZmJneDVGWE9YSFppZ1VWelJG?=
 =?utf-8?B?czhxTTVFbXEwQk5BZlFtOStSOWNpQUl4ak00VEtSNDI0RVo1SkljNi9Ic3po?=
 =?utf-8?B?emFjOHVnMjdaYklqZjFxNTQ1cUVxRUNJYUo3V3MvRUVnNVJRMkZJakZwS2Mv?=
 =?utf-8?B?VUtlOTJ2dFZXckYwOEMvcTk2MkRydFV5bjRGSnN6MnJwWlg4R2ZXWklVelVQ?=
 =?utf-8?B?Zm5ZU25tdTVUcjd5STlDTkVNeFE5STVqUEVuNnllR1plaWR5Uis1anh0UWhx?=
 =?utf-8?B?M1pQYXBnYi9KalpUVWJYeS9Ddy9KejVhd1o0dDRpTUR6OTh6WWhzNHFCcjl3?=
 =?utf-8?B?LzB3T2c1OE83STJSV04wRFNGcjk5cit4YldWODh4eHdvVFY2Vi9FWVNzV2xT?=
 =?utf-8?B?eFRaVnhkY0lPNWNxRzRwRDFZY0JZaTBYWWRlalk5SVNDWHNlTXJLSkF3bTlQ?=
 =?utf-8?B?NzV2QWQvU1BnL0srSXQ3b2VzV2lVdWpRV3N4U0Q4bUpZUTFCRjN6VnlwSmZn?=
 =?utf-8?B?MlM3ZEZpcVVqN3BBL0RxVVhIcXIvYWxWellMUWVUV2Z0bFJOZDRKMjRqRC9Z?=
 =?utf-8?B?UTBEOFhiQU8wa1hoZWJyNEp4aVVaUndSR21PSkVxTTIzSmY5MzMyeENXaStO?=
 =?utf-8?B?aXRiNlVTdzNoa0FMRWswZmJYWklnSDBuS0s2UEtIUFF6eHBaeXRLKzhSMFRU?=
 =?utf-8?Q?DB1agyyTn4O/uK5nXpJJ/XGDrew1D4SU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRUb0Z4cEdONWJEZi9oSmRGRnh6RXBBTmpUOVpHRW9DS244QUdobHRIdkZP?=
 =?utf-8?B?QVUwRXYwNUM3VXdha01LRXo0OHdrcmdmMC9qVU85LzNIMnMwaVJuUlZsVmVm?=
 =?utf-8?B?NlNQREFJSkVwWmJCQVdWdHBBWm0za3ZGQURpNUNyTDJOalIzMjVwenQxbVI3?=
 =?utf-8?B?VjJwZC9SQXBrSGo4QmRRbWtDamJlQVRqOHZYV0Ywb1ZMM0tRZTYrNDZMRHEz?=
 =?utf-8?B?QURNeUFIWThYZU12dDJ2S2FGbmx4VmFXYXdCUnM0SDk0VHRsQXp0UU8wQXRV?=
 =?utf-8?B?UzBxVjdmd21BeGRvS0o0WisyallFUExUaytabjN3Z1N6QmpJaHhDOTA2YWkv?=
 =?utf-8?B?eENtRXVySFNvMzA2eXV1OC96dG5IcmN3Y1kwdFRWb0l2V05CMGJKeU5NTE5m?=
 =?utf-8?B?VnJXTXErZlc5Y2tUaFpGUHNjblZBUFgyYTNyNDJBYXRyTGcxK0htemppdEhU?=
 =?utf-8?B?N0NjU28vbGNxb3poOXNLcjNUTFpmT1hpeTZFb3c3anZXM01lUTl1QzJyTlZU?=
 =?utf-8?B?aVJEM3FzWWZoeFZKL0tvNUxhbVE2K2Z0dVlvR1lLL24xNzBVNzU3eFJYd3Uz?=
 =?utf-8?B?RjluVlplcHpWaFZlOUNGbUpmTy95YmlVc0h5Q09CSVpQSGs1c1pIbENHdjNn?=
 =?utf-8?B?Ni9xUDRaMHNHUHdic2ZRY0l4VkNYekxyMTlBZUlaVlVudXQ2WThKb0UvOWdP?=
 =?utf-8?B?YXBPZWNMV3NjV1MwS0Fjak1tSW1YZTlMOEVjOTdjK1ZiSHZEcjVmQ2VLanpT?=
 =?utf-8?B?a3M3NzJuakZtMnFJQmx1V1RaaWNSSnJhUGdQdGJnNmhsR2pJRzJEQzZ5Z0Ja?=
 =?utf-8?B?U1N5aUU5b0g4VWJYWUpVMzhkWk1Wa3J5N3EwNE9rOEU1aEFJdWF0bm1WNmhQ?=
 =?utf-8?B?YUhDa1NxcUcrTXZiK2NIL3lLdlVYcGFRM01HOUlTNWp5S2pEa2RWa0kxNmZJ?=
 =?utf-8?B?MU9FRGtOR3B6aWNWTmVSZCttSXp3WEw3M0RNbnBKa1ltei8yR0RnWXVHbzF4?=
 =?utf-8?B?VDNUSHBIMjJsZ2tXNFRmbVoxRjY0dXRVbkZjcTFKNlNJemdmTXVORDRPNDVn?=
 =?utf-8?B?SnJXZS9RRHdTSjE2UzlqOGdRdXFBU3B6NVhRSFFkcWdGQXFUeWJOQ2h1SUcz?=
 =?utf-8?B?YTRQZjZUMmhqWVpEVzE1VlZ0WGZsOXF0ZmxrdjRIZnprQ0x6RS8rbWpiYTAr?=
 =?utf-8?B?Y3hJejBEdlJvLzlNRFlLSTIrcVgzN3dxeVhGVEN4UHhGd2x3blgxRlE3NUxj?=
 =?utf-8?B?VTQ5cUlPVzFtKytqbE85QXp1TGZXeEJLSGg5UmpySFphNmY5WUM4LzBhQVZq?=
 =?utf-8?B?Y3J1MGVGQXVnalFmQzNVaWp2M1gyZjlzNVl3TEJlMjJUS1pTWDY5cTJtcVU3?=
 =?utf-8?B?TEJycmRkQk81R1lGRkd2S2lrVkpaeDlzTVRXUVFDSDRhaFhvUlMybHlnT3lG?=
 =?utf-8?B?N3VERFJSVVpYdVNSSUt0SEs2M2F1SUhrSFRsc3F0UnBsbE1TMmFEeUhCdTlp?=
 =?utf-8?B?NlVGSEpvWm01R3Z2RHcyRjNQYmxOTFNpM1FWc0ZxUC84czM1VWUwOEJTVUwr?=
 =?utf-8?B?cm5mUmFzdDVGRDlFbHpQTG1paERlVmFjYzlaZFdIc1g4ZXI3ZHBOMVNEVmcv?=
 =?utf-8?B?R0VBSTdycVJrMW5GekZ1bEQxRzRjUWpRMjJOY2ZvemcrcnR1b0hubnVWdGVl?=
 =?utf-8?B?eVFYL2xiZGN3RlFFL2VYNTFCakl0eThKK3I0L2JJWGZQZGNkSzY1MlZvbGlj?=
 =?utf-8?B?VWxwbGhoNHlJL0N1THl4RS9MeUlzcVM2UlBUQ3pqeXZjN01DWjcvYnRxYjJl?=
 =?utf-8?B?T0NMUCsrQVBvSU0vUGtONGpVSDFJZFJxSDlzMDg1Y3owbWdIQW52OURJY3Zt?=
 =?utf-8?B?YlJOak5wZk0yMnBQeEdPZWQvd20rcHhiUm9md0FVYWZpcVkyV014MFpCZTln?=
 =?utf-8?B?UmJrU29uell2Qjlmc284SnJIamxMUHNLQjJPYy9ISmk3ZVI2RVZYekFpbGlN?=
 =?utf-8?B?bEd3a2VvZk1FNk1zNzJVYkZTK2I3dGRPTE83dDI1aTBTQ2xFaWh5OUgzczZM?=
 =?utf-8?B?OHQ4ek5nUjMrOWZjZUVmTVA2dVFpUDVvKzVaZUFPWnNENnhwQlNiM0hGZ0k0?=
 =?utf-8?B?bE82bUh6eFl5M1QydWFDd1dtWUtrVWxtWjNGOTdsU0ZmZ1NNNkQvelhibk1H?=
 =?utf-8?Q?9K0RPr+QtjtGAElkxzlyP3zQp07XPIsQXZm2cDt2q+zB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ea9ed0-6e67-4e42-56ef-08de12ead855
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:48:19.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLwic8dWe9YflKFxCdV81puKRjjQa1oeZ9OmDIx5gq3MOMCcIB48AUA1UL/vZBRVNsmyN+V0Nwv0+x+3iXzbuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073


On 24/10/2025 07:49, Kartik Rajput wrote:
> Simplify clock management by replacing devm_clk_get() and manual clock
> enable/disable with devm_clk_get_enabled(). This also simplifies the
> error handling logic. Also remove tegra_rtc_remove() as the clock will
> automatically be disabled when the device is unbound from the bus.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes in v4:
> 	* Removed tegra_rtc_remove() as this is not required now.
> 	* Updated commit message to specify this.
> ---
>   drivers/rtc/rtc-tegra.c | 26 ++++----------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index 46788db89953..e8c83a6a96b3 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -300,14 +300,10 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>   	info->rtc->ops = &tegra_rtc_ops;
>   	info->rtc->range_max = U32_MAX;
>   
> -	info->clk = devm_clk_get(&pdev->dev, NULL);
> +	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(info->clk))
>   		return PTR_ERR(info->clk);
>   
> -	ret = clk_prepare_enable(info->clk);
> -	if (ret < 0)
> -		return ret;
> -
>   	/* set context info */
>   	info->pdev = pdev;
>   	spin_lock_init(&info->lock);
> @@ -324,29 +320,16 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>   	ret = devm_request_irq(&pdev->dev, info->irq, tegra_rtc_irq_handler,
>   			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev),
>   			       &pdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
> -		goto disable_clk;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to request interrupt\n");
>   
>   	ret = devm_rtc_register_device(info->rtc);
>   	if (ret)
> -		goto disable_clk;
> +		return ret;
>   
>   	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
>   
>   	return 0;
> -
> -disable_clk:
> -	clk_disable_unprepare(info->clk);
> -	return ret;
> -}
> -
> -static void tegra_rtc_remove(struct platform_device *pdev)
> -{
> -	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
> -
> -	clk_disable_unprepare(info->clk);
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -399,7 +382,6 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
>   
>   static struct platform_driver tegra_rtc_driver = {
>   	.probe = tegra_rtc_probe,
> -	.remove = tegra_rtc_remove,
>   	.shutdown = tegra_rtc_shutdown,
>   	.driver = {
>   		.name = "tegra_rtc",

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


