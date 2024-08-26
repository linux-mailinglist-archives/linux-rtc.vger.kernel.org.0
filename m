Return-Path: <linux-rtc+bounces-1732-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33C95E6BD
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 04:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FAAC1F21719
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 02:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43038C153;
	Mon, 26 Aug 2024 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="bclQSNuo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15615645;
	Mon, 26 Aug 2024 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724639815; cv=fail; b=VRF5bVTQPcHFzlytp4K+N3wBbiH87+1713uB3JiQdV2ntAEWfY/DdMs2/TWoWRIFZWRPyZZMPWUSmZ/Ydt8Dk2St/oXQbbbc1bP8UVJHAGkJdM+3njjxBNIhyOCEkJiAC6UqZK9buezhRnGGXdEAalh+5h+sJ3/eZeP1WnW16+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724639815; c=relaxed/simple;
	bh=bsTVXlM9Ma+JS5ZTpMJUBeSXOmijsJYhHbojsVMjFZk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UoQoSi8m1danTCcMFtfWo4Qra+VWnHczcNAs5KSqrcKEz5CvyJXCRSFb6WP5yj/F/lpnnCLLtwrRFGJbkVPFTQBNA75paFLastYNN2emDL6LeO2LfUmdoMaNBlyCFyfdwdx3NGRSNWRUcSMSFnP0dg1Be4f6oNyRYU0pVh8T0gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=bclQSNuo; arc=fail smtp.client-ip=40.107.255.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0T+y0ZJsXvC14shCRbchhxEjWJb+0iE96dkXt6fKOtsdJteTPkbho9astNwZ1okGn+5XlGVuSqNnz3KpWQ5xqHfwotyymxy0Oa3YbW1wU7hje1C4kfI7L7/XWJ5BB/OzCnM/m3jGwnkGugBKq4vu3bX4ELc1HPJ10yNfMToMxyY3dk7OeAwXnH9FE3yVpRxVAomKB4oipZ5xhbt9evu/ZJG1ECRKQ/zWK0aTV76tFLdt7z1fNwk4EBhKzGrBXZhk63amI9hwJV1CmvwlzfRVys62J15vM1eK9hjXb0ZTguzsxdXULW1rzE7PnAtEr4/tRZW1dKImegvB7Tubz0qRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P9jK0UKJVJCBfyRP4+uFbiWtUVuLDxp/HcFemXDGsc=;
 b=bv/LYHoF6/uBT/92hTsfsF6eWGxp1mp8PDA3UifpTkU3AclzWhKvvfyrV+Y6TE19e9LdAymCk7QaDfJZfwUX6tc1Rg4+8aEmy1FadPEm4pOyMhhouie20KKKGMnNb1cK3TNzxYheV6/me9YG/5Wtz0hpnDNXRePwMjWXAEh0iVg4tnxEt4gjL3xdb4peWYmytECUIHF4iq5ZEoRzqLd0ns/nsz4u7bukpxxd8adUvneYRt2oOuvPlT+CbxAmKxDnoOf1QH/eu1MGb6uAIVklD+Dze6l1dwePY6oBEF15CNlBL5Gsl9NS8SnScWBPeeVdJWuCU6Qr5YFh8S8plZeACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P9jK0UKJVJCBfyRP4+uFbiWtUVuLDxp/HcFemXDGsc=;
 b=bclQSNuo7fJXZ4EjoLNkLKrkms+t7MMVdrc+gcbIXciMkb8TXda9DcUYNzjir9YnqDVFDq2nCj66O+1fcEmwZisJcpVcLBcOWCr5io7pACK7kYgcxWn/P4Uf08OHWHOXX0cjrVTXltelgAtj1xUknSakCS85q5rOEBHyafyqflWc/wuNeHXse9ZHyyrolLWjELMPs4P2lKN0bBiMe+lz96ibosOPrXLMA3AcJ+k/8tUVJuAkirx8/scTsBpxSB9hG/JwXjwP8QnvcYzp2UN0b0JQLsJbHRdncBRpRgPKtg7/OpVv19fHmpwn2b4KIvJx+yZ6WFWnx7YLsXkTvSsEGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7950.apcprd03.prod.outlook.com (2603:1096:101:169::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 02:36:47 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 02:36:47 +0000
Message-ID: <1039f02d-ca89-438c-b1dd-f49c2ffed6ff@amlogic.com>
Date: Mon, 26 Aug 2024 10:36:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-1-6f70381da283@amlogic.com>
 <20240823-rotunda-machinist-4f8dabbff479@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20240823-rotunda-machinist-4f8dabbff479@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: f53bbcce-ed01-49cf-334e-08dcc577ee50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2JjSVlxY0FZNFNvMC9VdXlyd2Y2amJ5eEJlcS9hTFVCT0RTbDlFeDdYeTJU?=
 =?utf-8?B?TkpVK0dpb3BlS2ZHL3BNNU5hQzFPak5MVG1ROGY4bmp5aFdPSzNBa3ltdlNZ?=
 =?utf-8?B?Z0FlUTBmN3hwc3B1elcwTGd5Y3dzMmMvV29kUVN0dExvUEJicDVHZDVQNFVO?=
 =?utf-8?B?czZHRHVGTlV2b2IyS3F4c0Z2dnBRdUh6QkF5QngxdEd4dGViZWZPbjk2ZlIy?=
 =?utf-8?B?NG9MeEZ3OVRGQnZseDkrNnA5RStHOTYxdTNWVko1cjFSUk5aVVkzalhUR3Vl?=
 =?utf-8?B?WDVTeXZ6TExFakFYeDlZYkY1VDBHUmdqaysxS2p4SzRwR21rSk84N2VkYjZn?=
 =?utf-8?B?S3VkdFpTczRPRVU2eXFidFNDa3NHczFKLy9LVjJXTWVYcUZtOSszK01tK1hV?=
 =?utf-8?B?UW9PNHJNaWVaNm4vcGZCdDU1V0tQdkRUTkhuTEVFdHFzSGloUFlJSk5IK3RJ?=
 =?utf-8?B?VS9ITXpVZ3p5SDBaaWFjMmZnM2VLbzVOTVlHZzM3OG1jTHJld2lQYUMxMWxJ?=
 =?utf-8?B?ZWMyWUF4Z2d4bG9Rb0t5eVNGYlFGTWFnRkh4OXc2TGNWeVpxWS8ycVlGOFIw?=
 =?utf-8?B?LzdhdlBrdHllVjRxWFB5c0pnMTlObDR6S0llUFNrSlM5ajc4Zmx5Y0xpd3Bt?=
 =?utf-8?B?Y245empZNnhSN2I2RmkrekNtVWtwaHJDZGZzM3NJeTd3OXhSdnV5cm4zakJW?=
 =?utf-8?B?RTl4UnRQbW4vTkpKS2VKK1lsYkptK3R0VzFWMFl3SWl1aHZzYzZGMHc1WDFp?=
 =?utf-8?B?Zk1LUzYxK2ZIVzUwdGl6L1BvWkk2N0xxaHJGaXQvak1wVWx6cUNheE95bkxj?=
 =?utf-8?B?T1pFZUxyYzFJWWo2NGxFTFVtMW9mbUxPMzQ4Q3JPV0ZUNVJkdUx4d05EUEVu?=
 =?utf-8?B?SzByRWhKOTBhaGpTY2gzakVTRENwUnF2VTEvOU9ySXhwWXVSYjZVWm50Q0Vq?=
 =?utf-8?B?cXpwTUlvNVA1MW13YzNubXhSQlltWExJQ0xiRS9lWEpIbHNOMHlkOG1iRE43?=
 =?utf-8?B?Vzk3M2RNcFVnd01ZMzBveXZVTjBZeG9tNHdNdWJkcGpmUkozZnVVUkp6Tmp0?=
 =?utf-8?B?TXJSTEpLVjhzZTNBMVQ1U1RCME9TQnVPRHROZTJ2VHF2QTVSWEU2bzBHSTBh?=
 =?utf-8?B?c1NOOGpPbHVZL2NUOGhMUHBXS2hjOUZtNnBORFRGU1Q1UGZzS3B2ay9MT1Fh?=
 =?utf-8?B?ei8rQTRzRTQ1RkhMUG5YQ2ZQY2c5ZlpRdUJiT1BkeGtjaVM0a0g1WVdnWjdm?=
 =?utf-8?B?M1k3VWVKbGJhMEJCMW9xZktyR3YxWnVtU2JqdnlYZXVhVnBiNnpVTmlkWXVi?=
 =?utf-8?B?WEZWMkhRc1lZaTdlYi9tNDFJSmJGeHoreEpDS1g0OXM4Rk9QUkNkTVNSbENo?=
 =?utf-8?B?aDhMRFZzM3l5Q2t0N2lXM1U0YnEvTVZZaENVQ1NJQlRLQ3ROUU1jRDZYTndX?=
 =?utf-8?B?L3ZyL3g5alU5d0w4MXk0SE9pTHNuaUc0WjJQNmc2aFFnK2RTTFNWRDlFZVA1?=
 =?utf-8?B?V2pVL01iNmE5MHN6dWNBRTUyVHQrSkNocU03UWpDcTJZSzhyZXNEcFdEN2sw?=
 =?utf-8?B?ZUdKV1B1REdPUjhXQ0JtZFF4MldPM0NzL3ZNbGpQeFNORTllUzFkTFlLY252?=
 =?utf-8?B?RzhCd21jbVNVWC9KNGVxUVdjdDc1L2gyYW00TXNmQVl1aUNBbE5ncHBuQndE?=
 =?utf-8?B?S2NFNjhuNVZRSXNqT3lydnBRR2FmOHFzelBhbklyd1dvcFR1SlNzVDVwdmh0?=
 =?utf-8?Q?M9pXDv5KzEs7zZlHZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0srd1YxdWptNzZhUndpWGxRVi9RMDlSSjR0NkV5MkIxTDZ6WnkyTk56VG1M?=
 =?utf-8?B?QmVKSEE0aE44RVNqeVhMNEM3RnBQUHpxdGQ2bUFDMVd3UXpLaHZaVTF1d0d4?=
 =?utf-8?B?U3lJbVpNclhOTG5XQVVBcU8vczE5blcxMVF0ZHNQTnZidG9zTEg5M1RrQnJG?=
 =?utf-8?B?eFF0SkF3dGlJVDlxcHpoRVQrY2ZlMzB5eHJPVmJCYTlHQm5tTFFENForMVFk?=
 =?utf-8?B?dnRiOFZzemxpQWREeXRCMUVES0thTU03WWplNXloMDZiVlBMaDFLdlVjcllL?=
 =?utf-8?B?RERSMm1Cb2tJaTUvcC9abFJxVDcwQ1NGbEc1WE1McmFQaFJvaGh5dUVDejJw?=
 =?utf-8?B?UHkyK3dFdnFmR2s3aElzb21aTlFQaGp4YnV3Mys3S3Z2eVhsOUsxemdOVzZv?=
 =?utf-8?B?SzZWWTJiWkVyNmhZMWwrNjZJOHE3ay9TS1hhRWJhbVR1N3Mvb202T3RjbC83?=
 =?utf-8?B?cUpHOHZaRjdMejJuQVE5TjM2ajNwRVVrL1ZGeHYzdlVxNU14c0NQeGtucUVL?=
 =?utf-8?B?TS9OTUhHU0xka3lSS1hDa3R1SW1pMmRadGxINml5U3pwSXN6NVdwQ2NEdjlS?=
 =?utf-8?B?bURHaGhhTHZHcnNUYmZvNUpCK1pBd0FxNmV1cTdTdEJ6dU1wZ09pblltWHRi?=
 =?utf-8?B?QkxYYW51NkpmWG1ZL3JwaXQ0ZTJDUmg4OXJXRHBPUXFJa3p6QW5EcGUzVDJ6?=
 =?utf-8?B?OUJkWUg3MFNDRWE4UElqdGI1MVgvTUhzaU9TcTVUQVl5VmN6aXVzS0hhQS94?=
 =?utf-8?B?UEpGcXd3bVlvKzk2RzJBQUtwQ2QxcDVaNTJxS0V2NjRLTzFnVUtDdUZpZ2Ru?=
 =?utf-8?B?Nkp4N2VxVWNNZzhLZ3h4MG9LcG95YUFxaEpGbTBuSm9uVS9nbXloWjNLRW9X?=
 =?utf-8?B?S1pDUVdGSysrcjBCbCtBbkxOdjVKaHNIdmZvazZqVlQ0OWJoRzdVMXM5Qm56?=
 =?utf-8?B?M3ozK1RXWmxmZ1BXcVZFRG9Xbys5Q0ZRVFJqSkxybGxEWWxyUGdSdnB3dnhC?=
 =?utf-8?B?RlFUU0t6YkJJTjFMMVBpT1liWmRQUFJETHgvN2R6OVF2dXg0eTB5WDNjZVUv?=
 =?utf-8?B?dHpQNTdzSElvcnRmV3A1b3IzdUUzVUtUL1pFaDdrd1ZwUmx6NE9kQm81czZq?=
 =?utf-8?B?NVh4MFZTUEhXWWVlaXZrcUdJSXVLVjVOQlFZVUhDR3laSEFMa3BqNWtsMU9u?=
 =?utf-8?B?Z1I2WXRYdzlWVGFOUERYN1JCWTR6R0d2Z29XbFBCbFhXZTZFYlpXRUZhZGZJ?=
 =?utf-8?B?bWpaRWZIOGhiSzNoem9ObUxqNk16NlplYUZ2bWwvNHR5N0ZsK2h4UDVGQXpx?=
 =?utf-8?B?eE5zWDh5Ny9XZlBHRnNDMVM0NzBaWFF1cHpLMlVZNW43SGgvbHVWVlBsemZx?=
 =?utf-8?B?TTNBUlZ3aFhPTXBGMGVGUTRoZ1VlZ2dBTllBMTljdFFZZ291L2I2c05MUzE4?=
 =?utf-8?B?Y0VyWmRld1EySEhvbFEyY1FCMlR2amNuZy9McURybFZKUHIvaURPRzVBbTRU?=
 =?utf-8?B?bzBKSmlVWnB2T1VCN0UzNlhteGxHd3NKaFJXenIrbWN6amtQQ0RKY1E5Zjlp?=
 =?utf-8?B?cGVaRkNnMXgwTHJmdXc0dFo0TmpnMjM4VVI4MWRRNWtjR0lrT05qeUcrTjhL?=
 =?utf-8?B?WXdyTmE2VUZLWFRwMFYyYjlzSlBINTU3YW9acWVNY3pvK28zVGtJZE9UZVdD?=
 =?utf-8?B?ZHFCSWZ0V3dUdGNGSUdrckRlK3VwdHBVKzhIRmZRZkt6L0svaGZheUF5N1lx?=
 =?utf-8?B?blJYSVE4Wm05eTc3TmtoL21BTVpTQ1pvM01HQitXYWh1RHFlelNURUwyd0th?=
 =?utf-8?B?OXZ5WmtQL0NYQ20yYU1nTVJxVmdPdzZFR0h6K0QzdVRtUUVCY0FGMFFTQS81?=
 =?utf-8?B?YjV2Vmk5T01peXRGcHN2OWtJV3RWQW4xLzVvdWlxQ1dIUUdKV2REbXZhVGgx?=
 =?utf-8?B?NVduTVJ0Ni9uajh4M1V4NEpvanZob2kyMjNobG9HU2ZPcXRwNmlOclJsUVlD?=
 =?utf-8?B?Q1FQUURsanlTMXU0akpya2tkb1RWY1dXdjZwdHFuRElIOG5sZE9Ib1BFTFFq?=
 =?utf-8?B?TzNOMkxmaXlEdTUyNkhBM2tISUpvWmJmVS9yQm4vL1dUZ092SnZ5aVM2Z1c1?=
 =?utf-8?B?MEJ2MFEzdHJldlhsRkZvMTJ4ckpyQmFZemsramcxUlhQWXovbS9yQ2xEejFo?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53bbcce-ed01-49cf-334e-08dcc577ee50
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:36:47.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5E8Rsid3+K9kIywyM7JesdR8/5Q1zy/Dvi4e7leHVMof0MEXPqNM+zYeH0F0UUpzKZ1UB3jd8Fsk+BirhsCw3ZtVWkmmylCas2xtOtCxkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7950

Hi Conor,
    Thanks for your reply.

On 2024/8/23 23:51, Conor Dooley wrote:
> Subject:
> Re: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2024/8/23 23:51
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Yiting Deng <yiting.deng@amlogic.com>, Alexandre Belloni 
> <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
> <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
> linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
> linux-kernel@vger.kernel.org
> 
> 
> On Fri, Aug 23, 2024 at 05:19:44PM +0800, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng<yiting.deng@amlogic.com>
>>
>> Add documentation describing the Amlogic A113L2 and A113X2 rtc controller.
>>
>> Signed-off-by: Yiting Deng<yiting.deng@amlogic.com>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
>> new file mode 100644
>> index 000000000000..fa3d7838022e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
> Filename matching a compatible please.
> 

Will do, modify the name to "amlogic,a4-rtc.yaml".

>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Real Time Clock controller include a4, a5
>> +
>> +maintainers:
>> +  - Yiting Deng<yiting.deng@amlogic.com>
>> +  - Xianwei Zhao<xianwei.zhao@amlogic.com>
>> +
>> +description:
>> +  The Amlogic new chips used RTC module.
>> +
>> +allOf:
>> +  - $ref: rtc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,a4-rtc
>> +      - amlogic,a5-rtc
> The names you have chosen here do not match the patch description. What
> is going on there?
> 

Will modify description to "Add Amlogic A4(A311L2) and A5(A113X2) rtc".

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: RTC clock source, available 24M or 32K crystal
>> +          oscillator source. when using 24M, need to divide 24M into 32K.
>> +      - description: RTC module accesses the clock of the apb bus.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: rtc_osc
>> +      - const: rtc_sys_clk
> s/_clk//, they're all clocks.
> 

Will do.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - interrupts
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        rtc: rtc@8e600 {
> And the label here can go, you've got no references to it 🙂
> 

Will delte rtc  label.

> Thanks,
> Conor.
> 
>> +            compatible = "amlogic,a4-rtc";
>> +            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
>> +            reg = <0x0 0x8e600 0x0 0x38>;
>> +            clocks = <&xtal_32k>, <&clkc_periphs 1>;
>> +            clock-names = "rtc_osc", "rtc_sys_clk";
>> +        };
>> +    };
>>
>> -- 
>> 2.37.1

