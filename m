Return-Path: <linux-rtc+bounces-5127-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CFBFF604
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 08:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10734E5B4F
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 06:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D2729BD8C;
	Thu, 23 Oct 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DN/5HKIz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013021.outbound.protection.outlook.com [40.93.196.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F12285041;
	Thu, 23 Oct 2025 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201889; cv=fail; b=nNfoQHSG6KkCI6AeuiZqxgkxHQR2pRYL/lFM8LH8aBZeKwzZyVe/VztrQMQcfTgirLbeo7IL8tv9wiPul7C9rf0pmPUHX5YKGwLJEUMxed5dgDrdOUFPpqJFtgQw5+kkA9anVXSGRKJ/bx7JsLin0ADf7UL9ygmQ4lkYcgfinq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201889; c=relaxed/simple;
	bh=jo8CLbRwNAY9+wWCPRzBxOVLSIi3Egt1+deXQ7eO8bo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zs9BV+mgxu1ac0ci5JVz6FdRCf0bgZTC0/uHQT2RQWdZfySs23GujNK5P45bRusgDinNpI/w1r3ZcJ5V6m3XOiG+h9k43MiYN6CfKYi59pAJvPhB25xcCfkGnyq20LaY4c8EFjY/24VfktBUiqxM3uGQB4dC3ECwkvRMx0A+wH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DN/5HKIz; arc=fail smtp.client-ip=40.93.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihfjbd/Q/O/FGlRPBsr32u9UelsvR/Pe2oH4loX56gLuYipYT9tBw4LZxWlZJk5U/imcrJAIXKrZjc50Ow4uX8b9oAyjifti4nxY8GFq5dnQsaAlGa3lOP86w70mY7mxH78sSTokczxq9sCtOmg1ejvoby/oUc8OuExUWoD56c5k+DT81xEj7DBSVhMTa6JTYX6y8HukSsdLtJSLN9t5glWr4V5DfYA7iA11KDV9nQxbiVwam3WsXWvLU1XC6VQCdUM3V0TQBHj+0bTaagFgQswx0iYevcKPeM6303LsTI6ok39iC9yLK9yksFSNphkkoHnln2M/w0JbWacUq34cEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huBODFm4BtnmH2F/qCCtVsZtdyRnQXxQokkW1UeF7Bs=;
 b=E9eRDGvp9tH3bC8OgO1jDOASjgsWLa0W491svlU6BO5phS8+OfxGXTZSOtNlAJfnTWRi2Ry1NGKdADF0g4m1P78eM4X+4e/tkNflAwv1urDTupZut6QlYOQfF5GpyUwW366m/ov8obPb0q1I2OFuthyWBCYEydP4RQLGquqGrBXcf0hshUNiOz4wbzJRBUsEPRhXgnvl3DqZWsX5S/yT2OpF7f57vmZWJ9i+YLhKQ/Q3g4uUCkbz1D4jdoEEWGydd69dQzmXZU1DO5aNId55B88QKTFF2Y9OPWb2z9EUxMTIdkO/SEKvG8hNLDE+mMBO1dNdQuLFsWj4UmW0mI3hOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huBODFm4BtnmH2F/qCCtVsZtdyRnQXxQokkW1UeF7Bs=;
 b=DN/5HKIzjtkljrMoS+175wJOjNVYPO0zBPLX8XTxyTzvFdPEMBRVSxPGTrEFRKkkwC9zPfq0U2op/7Gz197ZBtGAUk/P6YvwDt0KueRf6JHsQRNKIhD9o8PUwSSQHIWGfv7iSsnstDp0nVp7Gk5EM/6MUL5tJej6QZwjzjXcCIYyQ39Kq0q/RxQOYKsx0au1FxovLmlBBgWSAAsRBRAYXPEmUHPpGsNWQojUrkPUgYcaZ8EgtS/ns3T0O04G8JXK6n38fndP1A4pgxV6bq+p2B+/w7JdxLRjxBV9ikpHq51jqfg9c+qc4uqiVDcpbk9N11NzMduo2Nl4hyua9mqSYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 06:44:45 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:44:45 +0000
Message-ID: <f4defdc9-2cc0-45a0-a391-cb8678eb1b23@nvidia.com>
Date: Thu, 23 Oct 2025 12:14:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: tegra: Add ACPI support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022063645.765599-1-kkartik@nvidia.com>
 <aPkPkHr0Hp_MabPx@smile.fi.intel.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <aPkPkHr0Hp_MabPx@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS7PR12MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 849a1ab2-690c-49e9-af33-08de11ffa6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWx3MG5lSEZjR3pMbkdXVmhSbUtnSHo3eWg5S2NiSmJOM0NNajd2K0MyYXhi?=
 =?utf-8?B?bjVZMTBWeTBxT0EzR3Z5QVR2VUFxK2pvWlMwM0c1M09oell5aSsyY1AralVM?=
 =?utf-8?B?L29VdHd4RVEybTJhL2tYZjJTZlIwMDRPbUNDc2puSFhFK1lPTHNkcmR5Tk9Y?=
 =?utf-8?B?YnBzNUJWQkpEeVhxQ29GcFRTTFN0eUs5K3dETnlEWUUxL2QzdFNBVkdId0E5?=
 =?utf-8?B?NUw5SVpYOHVwZ01XTU1VL2dTYVJTcVRMQTZSYTYvYnl1U0paVXZXbEMxWVdj?=
 =?utf-8?B?aGpUSkVsZWZHRUY3Qlo1NnhBaXhxVFV4QXpkUlNMTzJJVE5kQ3ltS0lPcWd1?=
 =?utf-8?B?aThTUVk4WFZFNWFxUlBSbDBBTk1xdk92bFI3b01aM1lDUmR4OUYwQVVMVGRR?=
 =?utf-8?B?RTQyZzZVOGQ1NHNvSFoyL2s3aXdyVFJia0dZNzVOK3lWaVdvaHk4L1VrUFJM?=
 =?utf-8?B?T1pSYjZZZHBaZ1ArU2VKZFM3UUVBcTdkSTlGOEZVRXpjTjJkaWN1RFZIb2da?=
 =?utf-8?B?MDBrYjZwOHBqelpnUDBZdUIyUEtIOS9aTDlWN215bVBvTk1UUEJObW9JZWNF?=
 =?utf-8?B?a2MzSEdYVDdKbGoybG84K0ozWUJWbWlmS09WN003ZkRzY3JBdjMxcUo2dGc4?=
 =?utf-8?B?cGkrdXNhNDVDN3RwZ1pZVUhtYlVsWGpwcGwxYW42WENCTDBSSEZFelJib2FM?=
 =?utf-8?B?aDVENW0wYVhHdkFuQTlYUmV5NDFsaUovOWJrK0VoWFpYTWQySVFpRHA2N2FD?=
 =?utf-8?B?OW9xaGt1MjJTZkxkU0RRWE56djdMOG9ONTM1NlVWSlZHMHkxSVkvU0paamhD?=
 =?utf-8?B?bklOTDR4ZHFXZmF5ZWNHeFd6czBEQVhEVXoyOEJWdXR2c1FsRHFkNXZKeWlv?=
 =?utf-8?B?NXNBdEErUWtybUljYk1OS1NYWW9ucWZheEhIZm90REFVSWhTUWJlbzNuUnI1?=
 =?utf-8?B?Qk5zbTZiYnlMcG82K1BVbTNydnRFUTAxZUhLMUdtUG1QM1gzSjNRVmhnc1lL?=
 =?utf-8?B?K2VQWEdlc3N2VnZwVE0yT29JYWc4VXNDdysrWVNOTGcrNnpjRmhNZWRSbXpt?=
 =?utf-8?B?Rmhwc05mYkNTMjZzcHRETDhYR2NoYkRtRUY3SGxjTXk0UTREVjRtUER5QWVp?=
 =?utf-8?B?OFhMZGl4YlhXOExoTFFHOUVzczdrRUYxNE94enNmcjd2a2N4Nko2OFhGZ09l?=
 =?utf-8?B?dURETDJsUUJIVmVkUTZLcTQ1WkhwbWgveHRUS3N6dU5Mdi9PcmZlUVNMakwx?=
 =?utf-8?B?RW5zWlJ6M05HZTFXN1d0L2pVRnpRcVF6b3dCemRxMmdONDRJMVR2c2RYMDFS?=
 =?utf-8?B?MGtzcDUwS3ZHakhqbUFWYStiM2Y1bFY0Tldya1l0Z29FYTlXdURtV0JybENa?=
 =?utf-8?B?U1dKSFdtbFYzVU5TazIxT3IxK3ZSaDI4eTRqcy92LzRuWm1veXFobnhzdzZ0?=
 =?utf-8?B?UVpXV0VCekpKSFZFSEZ6bnluRTB0bDJPc2s3NkRsd25YL1R3aDZOTThkSk5P?=
 =?utf-8?B?WHhycWsreGRWK3c4Vjh6UHNJc1ZHTzhpR1pKTERnQkJENHhFeVFEVTczZjQw?=
 =?utf-8?B?bS9oNGFDQ2h5RnlPVWcrd2xMZzVORGxFRGg0QXhieVhLT3kyMXI0bS9hTFVr?=
 =?utf-8?B?SFAvcmRWV0hBcUQxSWVVYTBEZk5iTUZKQkdVRG5lTkpsbmpTOVZMc1ZsTkNZ?=
 =?utf-8?B?SHVoMnhZdFZ6T1BIdENUOVV1Y1d1NTJmSG9GZzRGS1QzVko1L21Wa3pFbVNx?=
 =?utf-8?B?em84UERxYldESlh4alRNUFVqQjZoWlJrWFpIalJyZ3g1N1o0M1kvemhWcTh1?=
 =?utf-8?B?UnZ0QzYvY21jOS9MNFd4c1JVWVpURHM4OHc3S3BpbUFOdHNaMFNST1F3eVJw?=
 =?utf-8?B?NG1sSHNUQzVjSmYzZmNOVjg4MHZFZGlwclBqWk82cFEzWTFGNjc0TG4yMnJC?=
 =?utf-8?Q?WYwV3Ydu/tgM/mIke+k/En0JrOuAhm5G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG9maU9nRzFobHVjOWlyY1VScVkvbTdNRmNPc0txUTFEbm92M0lCUXdzRjZ3?=
 =?utf-8?B?Ykp2b2xnZXluVTBYN2o0NG5MZ2tmbWNyT3FnT0I2clFlN1FJR0dkZEFFT2ts?=
 =?utf-8?B?M1ZhZzcrRnY3WkhTdUJhUGlrQTlhREZSNTQwSE9LY0lSbDhSRHA2S1NZTTB0?=
 =?utf-8?B?TnZrWks3YndTc3UyQ1pqR28zRWtRM0MvTFZnQ1hLUy9rNUJhcDA4dHZEVTdx?=
 =?utf-8?B?V3NmSVY0bnV3T1pNbEg2VUxqSFJtYnZJeHJlVlNUcWJGdW16endJMjFGME1q?=
 =?utf-8?B?VkpWYUUxWW5oM21HS3NSVjZibDJYUjJTTWNoWDg1TTQ3alc2WHZTQnFOQW5I?=
 =?utf-8?B?TjE4cDNVUU9JK3pVSWp5ZEYzOXdrY0tnbzd0ekJDV1NiYWs2ZXZ4cHBJY2ZR?=
 =?utf-8?B?SFpMNXpySlRVbFRBbURFdi9tOFRaWVV3dkd3bDFLdFFPMXNoOUpSL294d09z?=
 =?utf-8?B?S0w5Z0dUcEpUMTB3RzZhVlpCRXUwTlhuQ05HWWZkZ2daSXBsWkdRZzM0VmE2?=
 =?utf-8?B?cnY4L291ZW5PT09qb3hxa0szWnNTVXpZYTc1SkIvY080clpxckRFaGRJWTFE?=
 =?utf-8?B?ZjBlY3NtYVVjUzByVGFUSWtpa2gyZHFjTHlVODlLcjlDNWQ4OVNBRmZ1YTUv?=
 =?utf-8?B?Q3E0Vyt4b1pkV0xlQldnTHBCRTgxWitzL290dENNc3V6M2s4dEVzUk11TkMz?=
 =?utf-8?B?K2IxSE9BdDlmVW50d1BZek1FSkJMMndJUG9hNW1WS3ZvWVE0VUh5M2ZxTFN1?=
 =?utf-8?B?c2VPaUV5aFJ5V2RRUU1sdGFZRlAxYjZ6Y0ptZnV5YUYweFFUMnU2dDZJM2I1?=
 =?utf-8?B?Rm9HNzYyVUR5bkNVamRvTlZhT1MyK3h0L3BWMC9iZmNlOUdoKzcyVlgvam9M?=
 =?utf-8?B?eExxODZYcld2Yk9KVDNoT29iaCtxNSszZ0xrK3k2Sml6NUFDS3J5WkxjbkRU?=
 =?utf-8?B?VS9jcDE2ZVZSQVZhRW5NZDUvMnJrVlB5emZla3lvTVVWTlI4UjhrbjA5TVNL?=
 =?utf-8?B?Z3BGZ3VNNVRnZFhxQkREV1d5SEY4NVVoTXZKdjNKbzB4ODlQWjh4SzZBaTZL?=
 =?utf-8?B?S3FwWEw1SE1wS0dySkpMKzdNd0ZteUE5NDh6RkN6Y0N1RnUwSUtDck44SkJi?=
 =?utf-8?B?UW5NRDBQcnVWRlg5aXlFTzJGd3JhdFMvTm5xa21WenZiQnIzVkwzclpqdHF0?=
 =?utf-8?B?NnBONkd3V25mNHJHdTY1L2JUamtLU1FKSm9zTlNUVzkrK3lUeFRhM0ZrRGE1?=
 =?utf-8?B?NndVNlkyUkREN0dGRVZOcnUrRERxVUFNSjgwMmxFY0dPTFAzZzhZaXdmUGVa?=
 =?utf-8?B?Zmg2VmVOSTlNRk5YaXkxbmdyU0VIdTluQjB1MEhBKzVwOEViVDdCMC9pNDZt?=
 =?utf-8?B?QjdwdnhHZjlRTm04YVlBUCtxZUozNDhHV0JINVFYMTJFajNQUnZJMEV0bE1h?=
 =?utf-8?B?QW1CQ2VLZzV1dDQ5b1F1YjhEL2RkcGdVc3ZnS0RHcTNBK3ZOODBLQjJkSEEw?=
 =?utf-8?B?WTd4M21nZWpjdFhjaXlTS0JIUTBoTE5kbVZTWEQ4bzBrVG1oNmc1TXF6K3BT?=
 =?utf-8?B?V1lJRXJjS0RGSzY1ZjBVL1RnN1ozYmZsczBNMWVueTRFU2gvcGxyNWhFem9Z?=
 =?utf-8?B?NDl1SVhwVmpIZXVkWWdKelRjbTFYeS9tQUxNUy9NZ3R4STZQSWNvTUtIcHJk?=
 =?utf-8?B?ejB0Yk1VUDlrWVhqZUo1MUthbGQ5c0RjcUowczZrK0V2eUFzVEZSQUtGVzJ6?=
 =?utf-8?B?RDNmZ2NxYk1na3AwanhZR0V6RStUbGpwMUUyS21zSTFlMmJXM3FXZDFFeUxC?=
 =?utf-8?B?a2Z5eTE4RGY5Tkc1NSswblQ3UXRxYjZyd1VFb2w0RFpmenZhMUtpSWVENWRH?=
 =?utf-8?B?bjRheHhwekZOS3VQbjVpVkFINU5VRnZ1YVNNeW92V0I3dEtnWHloT0NDSEtC?=
 =?utf-8?B?Q0hKSXdwL0dJeU80UWxRQmJ4Q21aekt4SzNZOGpnL0labmU3M3Vsd2QzODlL?=
 =?utf-8?B?TWIwOEF0bEx5dlNIaDNCSGZ6ZHAreDh2WnBCeGZuWVVrTVNHU1FJUnM5aFQr?=
 =?utf-8?B?TE90T1BpSHhxR1dFbDhVWER5RUxER2xScTBMWk5ONWlJblRCOGFGSlA0OEJN?=
 =?utf-8?Q?M6J6IHMsAhqyu/IZwctWSdJ2E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849a1ab2-690c-49e9-af33-08de11ffa6cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 06:44:44.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AnsVh7UHFxZPfrqJcuwCm18b3wCvshzJfVACF5pDoldl4ChVo9T+K24+eTMzMHFkpL7f/8AgQ+6u/HdfKoPGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9474

On 22/10/25 22:38, Andy Shevchenko wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Wed, Oct 22, 2025 at 12:06:45PM +0530, Kartik Rajput wrote:
>> Add ACPI support for Tegra RTC, which is available on Tegra241 and
>> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
>> The RTC clock is configured by UEFI before the kernel boots.
> 
> Thanks for an update, looks much better now!
> A comment below, though.
> 
> ...
> 
>> -     info->clk = devm_clk_get(&pdev->dev, NULL);
>> -     if (IS_ERR(info->clk))
>> -             return PTR_ERR(info->clk);
>> +     if (dev_of_node(&pdev->dev)) {
>> +             info->clk = devm_clk_get(&pdev->dev, NULL);
>> +             if (IS_ERR(info->clk))
>> +                     return PTR_ERR(info->clk);
>> +     }
>>
>>        ret = clk_prepare_enable(info->clk);
> 
> Since we still call CLK APIs unconditionally here, shouldn't be the whole
> approach just to move to _optional() CLK API?
> 
>          info->clk = devm_clk_get_optional(&pdev->dev, NULL);
> 
> I haven't checked the code below, but maybe even one can incorporate _enabled
> to this as well (in a separate change as it's not related to this patch
> directly).
> 

Hi Andy,

The reason I did not use the _optional API is because the clocks are required
for the device-tree. Therefore, it must fail if clocks are not provided on
device-tree boot.

Thanks,
Kartik


> --
> With Best Regards,
> Andy Shevchenko
> 
> 


