Return-Path: <linux-rtc+bounces-1965-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6E9769EB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 15:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 343C6B25BC1
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44D71A4E8A;
	Thu, 12 Sep 2024 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D7pzEc/p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C01A2554;
	Thu, 12 Sep 2024 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146187; cv=fail; b=K+UaBdki4mLYXzVYdLFIJcYVjnsK4NBv4bQOSJPo5o6Ea1F6dAtys9ANVNRdOrhV6yEETmbzS+tbUUWnaHrYhPgoZdPD1jDq0SbfdV4xX3+CEbY4uETuKguwc26FuFfJKVLqFFL4q6DnT6m826yvNZxc5Dp8uVImN1X1JcfGh/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146187; c=relaxed/simple;
	bh=s6u4GqkJcciYCOqqaPHrdCc0cU1Iifvd7ZvAwVmIIWk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eX+TNY1FZTdWmiNq8otMGXrM/QpYGjVCsq7YAFE6jBRnbbSmrzm1dItw71GFcmIToQA/QLz+5vdzoIbXm53uStu24EBaAERL/ezdseab/trjtze1UWeYrjjCHYENUUCjcnR5wqvzrAyJgTTj0LGv5DSCPhMVsymNNCxbREA5I5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D7pzEc/p; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpnKUJ02CZmyS64RSYaCxEKzXwbW39bxMM0UP2EzRRBeNkw80PBJeCiUcbezxIVaq+9B3VeyI/uOfLc1LHDmFCO/5R97JQwxC+gVr06cO3dY0LcmxVZDgvb0w/XeBGR4hCXThmyn38TMghXGz0iTe2iQZaEG/trKC/16PBU2doQg9mUqZMYKXSfzxWVlT413m9gIbT8iPRKDpeHOylB/TiIDfBTxnNFf8kXxz4GVgF0PrZTyZUv2VyWllrJfH6Q55d93FzI1e40baoAreGegAyUJ/7W3lwbP0odX5glOiPZsgNru61c84E703QPUrXa+eTJy4RkhUAdMgwHbn1QdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1MW5Raa1wXIi4OHEVAE6eJfcXKvTNtVnwoYRd45f7Q=;
 b=IaHgVS1Ch34gpjxqjsEnkEHJKjz1tXzsbyIu5MAODfxOkBmk158LRTtZ22YmXPjXHeX7lQ76ZYbkl/qrh2mixfVzMh6FViqchrE3O0ZO7bUyT79y/WLymcNUlN8+YGTOsOiSJ0xhMTZ4o6UfcafE3ryvHHiDfVdy0VBlmecYvxdlM8zluFnKN1zcv5b6Ml8Wf/HwW9WLc9CNsGa6g9Tk3W9oxTNJ08wlgd8j/v9XDp5hiMA+GQvsnccoFRxcBMfle/TTdGs0ANdOqHWJljYBX9uwPbbzKhlKRkAsZMZ7DsHO5D+YgAqUiIy4S9v4K5SJ+Ps5pmSukVHNMZi6N5tGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1MW5Raa1wXIi4OHEVAE6eJfcXKvTNtVnwoYRd45f7Q=;
 b=D7pzEc/pKH4zM57Vfh5kae13Xq4eicrKzV2m8dedhVzwg4jS8Ti4FKNxjeio4z4uscsx5Oc8LBThjaFN1gms3eMw+X8kHxwsLGvGCgO2RR8APR0+1z5EQXyPsY1mNEZwBDGbgsBPa47q75ebyxEAuvTyUyrhTaNqMO3gaUtI6x1eiyOUemAb+blmy7mjzgiABMuiQ9SuOn9Geos0MNVzlwCh4kcC6hfnFSEpyiEUGePEt/acw0UALLsnSyJVp14057cUbr7oNQXFw7NxMhxg40beySfJYkM2UcpVBNfmWXeex9F+gM0M0U5e5BpGEd1lwanYn3aV5m8tCoMkh2bIcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Thu, 12 Sep
 2024 13:03:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 13:03:01 +0000
Message-ID: <2d870984-fd5b-469b-8157-ca5ad52a0e01@oss.nxp.com>
Date: Thu, 12 Sep 2024 16:02:57 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <20240912-immersion-obvious-81a2a0c7a9cb@wendy>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20240912-immersion-obvious-81a2a0c7a9cb@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::22) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 915e04a0-fdeb-4247-24ae-08dcd32b3b5d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clFlT0VkR3NGbXBCOFp5UC9ybDBtVUJrSW0wYkx3MGZkdkxFMlRrdEZ6Z2U5?=
 =?utf-8?B?dERsakdxR2xMc2J0NWdSczJpRytIQWRqdUZ6ZUhhUWxHVmdrWHBCdlR5Rzds?=
 =?utf-8?B?WkNFTTB6WDVMUGowSVh4aVJ6cS9DNWpUYVk3UUhnOFZWNHZQKzZhdTNFY1lt?=
 =?utf-8?B?MlJUbkd1UXdtdk5KM0lOeHQrWE9wT1VpS3MyOENNbzFUQjFFQk1aZnRrWThR?=
 =?utf-8?B?WnJsQ2I4Zi9qdkJkYkh2UktOWnNpbElWWHJZai8xbW9CakxtdFRJUlh1SlFy?=
 =?utf-8?B?c3JCajVFbHFzOUkvOWxCZmJncW1MOVVkMWdmTEZKQUZKTEtkNC9VT2JMTVkr?=
 =?utf-8?B?ZnNsQWFLYitUM3l2cjJveVVzRnA4dnIvcjJSanF5Z1h2T0JoNzhpR3MxTDFC?=
 =?utf-8?B?azdCRHkzU24yMWgrNUdSS01BVkN6RlN4RGc2WFJIYlRjQThQeG5JV1BYNkVp?=
 =?utf-8?B?ZEMwYUVGdDRGUHNLNnNEUjljcFFudmVxM2graWxTd3V1aTBOaXNTZy9TR29s?=
 =?utf-8?B?eTNUa2FyeWFlc0JMUitxN05kbWcxRjgzaElIQmQrOVZucVcxaW9DZXlLUlJm?=
 =?utf-8?B?emtaQitURUdxeXdwTjN3RWZxdmp6L01PL3BBTEVIS0tKanBBaytVVGR6S1JT?=
 =?utf-8?B?RlZOSGQ2ZVByT24xN2pLVjFnRVhoRzZpUUVEZGtpZ0NWNzRsdE1zOUtXNXkv?=
 =?utf-8?B?MnlBL3hxWW5DTHovaUh3U2N4T1Q0Vko5ZTJxejIzbXRpQ2RObXlHdXF5TEV0?=
 =?utf-8?B?eFM3STQ5czBWdVRZK0dRYWFVV09NeDMzZ2JvMStJc2luVy94dWRSM1Z6cnF5?=
 =?utf-8?B?VldCYjZla0pxaTJvVVBpVy81SDFGV0RqSzJIdjA4WTNrZlNITXN0Rk9FcDY2?=
 =?utf-8?B?Sk41bnZGcjRhMUZKUnBkQlNxa1F5NnpmWURkZWREQmFlWUxaL3hsWTIrem43?=
 =?utf-8?B?cUxUenV4aFVqSjhzSlAvNlpwNTBrMEtoWjFqM21CNllyRlRQSHE4NW0xS3V6?=
 =?utf-8?B?TkhpSUlpUkM1bTdWL09GeDB6cDZlN2ZJTTgvelNkWnJLU3Y4YlRpS3JoTkEy?=
 =?utf-8?B?R3d2MS9QTExRdjJVY0VIQUpiWURrWG1vOVVsY0hiV0Y1eEJib0dJZHMxZ3ll?=
 =?utf-8?B?dHBpMUh4NWdzNThWbW14OFkzZ3FKSDFtSTgzRnZwMmVNdHByYjA0aEZKOU5W?=
 =?utf-8?B?ejJOS0kzNEo0amdYdk1BbHVDdUFTQUp1S2VVMk9hWVpNYmxrV1pnOHVXbGw1?=
 =?utf-8?B?WmhxN0VMdG4zenFtZFRlajlyQlFQZ0ptTFloM2UvRE1vUlhQRmtRNFV0UjNL?=
 =?utf-8?B?YTIyVlhEZzlUS09LLy93b1dHKzBheFJkWnc4TTRDMTJEZldyY05abE9FV2lr?=
 =?utf-8?B?d0V1OW4wd1VKMUlEZml5NlNtNXF0aTFDQmZWWVcyVmpKY0lpR1RObENmN0sy?=
 =?utf-8?B?ajlVVFhYWlBjNWxxUVVUWmJQaC9mVWZHNkYvZXBKbnJLUll0c245NlhPcVkx?=
 =?utf-8?B?RUVWT00rOThPU3B3SGxXdHVmNWF6WUI0dEprd3p6OENrbjFvNWpBcTkyUXhs?=
 =?utf-8?B?akxPR2NGSkcxWjQ5RnFvMEtXbUN6aHN1SXpHYUtlOEZSZXdpT2REaHFDVHlP?=
 =?utf-8?B?QXJZNnRpUG1GMlk5YmhVU1pWeGZWcFV0b3loaS9WOFF1Y1NJZE03Vm1mSU9k?=
 =?utf-8?B?V3JpbmVhTGJTdGhiQmFwaGh1Y3IwbjFqS0EreElBWjRpSlZoamNwSzlCWkZi?=
 =?utf-8?B?bUU0b1d6MWNFUjA3Q2NiaUpWeXJucWtuS0JHMDR5ZERWK3A4ZEdEV3dkT2NH?=
 =?utf-8?B?RDFFY0dCenJVNnVhMEpuUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEd4Q2FCRlFiZE9MVlRwZ3c5amsyRmlRUXVzS1dKNnZmZGFwU0d3cUVHRHdy?=
 =?utf-8?B?YlZEN3lONlE1UFlOQzB2RTVJaW9JbE5icWIvMytNdWp4UXowOStSMFVWNHlq?=
 =?utf-8?B?L3BpOEd1V09nTzhjRHBHOGR6d2tmSU16QWJMcGRWRlZzcHJnZmlScTNham14?=
 =?utf-8?B?L3crTXNQa0w0TzZUWDBHK1hqcHlZa2tVVmdaWE1IaUpEd3VqckNjTTFpS0FQ?=
 =?utf-8?B?SktVbGpyME1ha21TZDEwU3VQbk1NR3oxVFlZTVZZT2pkQ2hUMjJGRkFKWGVK?=
 =?utf-8?B?QlB2NTIrWXF0TitTZUNHSS8wVDI3L3RMSEhzNWt2MmRJY0ZBS21HRXBHZDFF?=
 =?utf-8?B?OUdFbXJCSnBhR2dzcDNGZG1xZ1FiS3VaS0Mzbi9SRVcyNVh6bks2TjRrTkdS?=
 =?utf-8?B?RlFDOGlUQnVtSTNsYWtWdGlsSVNFQ056WU9TdUFjU2t6MDVBUlN3WHc0dWVl?=
 =?utf-8?B?Wk9QbGVUSHJudzNxa1dtMHVpUDdHbWNUZXRNRlFzNVhQS0czT0c3OWFQRXQw?=
 =?utf-8?B?alY5Wm83TW83Mzd2WmdiNGVWWG93UzlzbTk3bEU3Kzl2M0JBMVZZRm0xdTl5?=
 =?utf-8?B?WGNOTFZ6WENSU1ppeWJ5SmVOUlByUnNhR2R4WXVLUVQ4dlhQVmV4bHkveFBU?=
 =?utf-8?B?YlE3a0Fvdlp4UGg0OXg0encyY0ExdnhVQXltU1lPR3gvcjNsVXprbVFIYUVV?=
 =?utf-8?B?QW50ZDUrWkdWMDlhcGZuLzJsTFdmeHQvSkQ0QklIeUFkRDVXM2hEWVR4ZEw4?=
 =?utf-8?B?cmU3UTc4bHR5YTB0T1F1eHNySXZ4L3hzUmdPN1BSbktXQlNrSXlnL3BmZC9l?=
 =?utf-8?B?c3BFNXc3Q0lJRmluZnZobTdvWXM0MFNHdW1kNWlpeUh5TjlaaWpaOTlqUWsy?=
 =?utf-8?B?a25kVnRXTjhJbFRRK3NNUjdldTdwZ244dUVFZXRZY0pyeDJLdnZBaWo5MTF5?=
 =?utf-8?B?eVNYUmxJRVZpN2FCRFFQSzhGSnVYVGRHbDdIUE9EWTZISmZRaVVOdldXU2p4?=
 =?utf-8?B?dTBKZ0haUkxITFllcDR0M0RDTmhZNmdvQm01eGhnZmJtc1c2WnpSMWJhR0hr?=
 =?utf-8?B?WXdKS0dkY2ZKRjZ1cXAySWIxbU40dzZNc2FGOWVXTW1LY1loclBGL1Fmcmo5?=
 =?utf-8?B?MEcyNzlnVm94djhYSnFLejJ3WEJadG9wL0hWZlZaMHpqV3BaVDFycVhyb0RD?=
 =?utf-8?B?Zmxvekx5c0ZIQll4eVlVNnVVbGd3Y3R6S2hzejZlRS9oazlTSDJ3LzFnNGVv?=
 =?utf-8?B?Y1cybEV0b2ZEUW9iOFNuSVNIVVEvd0dDb2gzSXNEZllDVGIvamVHNklQTWl3?=
 =?utf-8?B?aWFUcXF3VFhDalIrUzBYelVSQU94ZmRpT2NlNlo5L09vWHU3b3ZLRFlvOWJO?=
 =?utf-8?B?cFV0WStKTlp0Qy9FcEJDNWlDbXViUktqYWQzbE15bTgzbjBjQW1PWThXVHFP?=
 =?utf-8?B?TEpqc0FtemJXL29zNWVLZGZtZlhkODNST1VaUFJKa1YyUitSZjl1NTFJQklT?=
 =?utf-8?B?MkhPQlJ4SWhjQ2UyZmtQOUJBWUNQMnFRQmZBd3hnZEFYL3NzQVBiTnpkSDBy?=
 =?utf-8?B?OWFWclMzK1BPQWdDandZeVQ0YXB3L01wWjEyWFVDWnQ2MHZ2cGljckl2dXRD?=
 =?utf-8?B?bkYwcTIzbjVuejRDQnkvWnhhTEVsR1d1KzBSaHp1S3lQSi9uYTlPWXZ0aTFE?=
 =?utf-8?B?SzllRGFGTHV5VVFDWVVGdVQ5ZDRGK0pvRWJJZzdSd2RaQWVkS1BHMnU3MGxJ?=
 =?utf-8?B?SGxKSDdjZkNsQ3Fyb2FaQlR4dVV3VXg4SVIwaGl5Szk5MEwwbE1DTnMrdy9O?=
 =?utf-8?B?Zzgvdkg2dGsxT1dnakY5eXJ3c3VMMytJR0RRK3Rkd0NpSGh2K2NlZVdDWmli?=
 =?utf-8?B?U1RnMTZWRnFreVN3L0JxcllaL3psRnBjQ3B3TFZKazVYOExqeXd4eVkwZFd5?=
 =?utf-8?B?N0tTTjQraVppLzlzdnRPYThyN0lRbjRiQStIVThXbGdJb2FPa0JFc2Q1WndJ?=
 =?utf-8?B?VFJ5dHNqUURaN3lha2kyaVlnYWgyTU1BdURIbTk2UmhndTBpVkdwU2gxSURP?=
 =?utf-8?B?RXk5NTdmWkYzOC9ZU3dpM3lnYXhCc3h5RG1sSU1yL0F0ajBublpNNXpMZW05?=
 =?utf-8?B?dVlEWVBqMndzSEhZNktObXRhNEJsZnMySmJNa2RYZVlJaW55UE1wZjAxbVpn?=
 =?utf-8?Q?6cZogud4SS4QU9yeRj3j/Us=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e04a0-fdeb-4247-24ae-08dcd32b3b5d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 13:03:01.4787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC0F+14Vol1EwO1dG/31TbmAux5MWmnL6JXT7B+3MM9/fV+Rq/DV/06NliQWJ4XWKvonS44l/YDVrZ7zGvd70U4HcnTJRPZbXKyZhl2Tli0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911

On 9/12/2024 2:27 PM, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 01:50:25PM +0300, Ciprian Marian Costea wrote:
>> On 9/11/2024 9:21 PM, Conor Dooley wrote:
>>> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
>>>> +  nxp,clksel:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
>>>> +      The reason for these IDs not being consecutive is because
>>>> +      they are hardware coupled.
>>>> +    enum:
>>>> +      - 0  # SIRC
>>>> +      - 2  # FIRC
>>>
>>> Could you please explain why, given both clocks must be provided by
>>> the hardware for there to be a choice, why choosing between them is a
>>> property of the hardware?
>>>
>>
>>
>> According to RTC module's clocking scheme for S32G2/S32G3 SoCs, it has three
>> potential clock sources to select between:
>>    1. FIRC:
>>      - fast clock - ~48 MHz output
>>      - chosen by default because it is proven to be more reliable (e.g:
>> temperature drift).
>>    2. SIRC:
>>      - slow clock - ~32 kHz output
>>      - When in Standby mode, SIRC_CLK is the only available clock for RTC.
>> This is important because RTC module is used as a wakeup source from Suspend
>> to RAM on S32G2/S32G3 SoC. Therefore, a temporary switch to SIRC clock is
>> performed when entering Suspend to RAM.
>>
>>    3. EXT_CLK:
>>      - has not been tested/validated for those SoCs within NXP's downstream
>> Linux. Therefore, I did not treat it, nor mention it, for the moment.
>>
>> Now to answer your question, all above clocks are entering a RTCC[CLKSEL]
>> (RTCC - RTC Control Register) mux. Therefore, a selection can be made,
>> according to one's needs.
> 
> Given both clocks must be provided, what is the benefit of using the
> slow clock outside of standby mode? Why would someone not just always
> use the fast clock outside of standby and slow in standby?
> 

Hello Conor,

I cannot find any benefit of using the slow clock outside of standby 
mode. Hence, I see the reasons for removing CLKSEL support and 
defaulting to a static configuration.

On the other hand, having the CLKSEL mux support implemented and 
available would help if RTC external clock would want to be added, as 
the RTC hardware module supports it.

>> I will add a shorter version of above information in the bindings
>> documentation in the V2 of this patchset.
>>
>>>> +
>>>> +  nxp,dividers:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description:
>>>> +      An array of two u32 elements, the former encoding DIV512,
>>>> +      the latter encoding DIV32. These are dividers that can be enabled
>>>> +      individually, or cascaded. Use 0 to disable the respective divider,
>>>> +      and 1 to enable it.
>>>
>>> Please explain to me what makes this a property of the hardware and how
>>> someone would go about choosing the divider settings for their hardware.
>>>
>>
>> As per hardware RTC module clocking scheme, the output of the clock mux can
>> be optionally divided by a combination of 512 and 32 (via other two input
>> cascaded muxes) to give various count periods for different clock sources.
>>
>> With respect to choosing the divider settings for custom hardware, it
> 
> What do you mean by "custom" hardware? I assume that you mean on a per
> board basis?

Indeed, I was considering the same S32G2 or S32G3 SoC but on different 
boards/different scenarios. I just wanted to expose the ability to reach 
lower frequencies by using those available hardware divisors.

> 
>> depends on the clock source being selected and the desired rollover time.
>> For example, on S32G2 or S32G3 SoC based boards, using FIRC (~48-51 MHz)
>> with DIV512 enabled results in a rollover time of aprox. 13 hours.
> 
> So a different user of the same board might want a different rollover
> time? If so, this doesn't really seem like something that should be
> controlled from devicetree.
> 
> Cheers,
> Conor.

I understand your point, indeed it does not seem to fit the devicetree, 
but maybe exposing them via sysfs would be a better approach. I will 
remove these bindings for now and consider an alternative, in V2 of this 
patchset.


Regards,
Ciprian


