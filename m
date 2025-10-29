Return-Path: <linux-rtc+bounces-5207-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A01C195A1
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 10:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25A53B0778
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 09:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A02321441;
	Wed, 29 Oct 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uK4PN7gz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EC2D3724;
	Wed, 29 Oct 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729627; cv=fail; b=R6NCcSOcmAMU5PDJOukD6bD1rEqTyqZTBCLIe1InQZszZs0XYy3eqKojYFDin+d5/H1TbuescM+H6daq4DNx9MgxVvgo2IEE25KFeOQTe59q4zR3f0BgPpbTRw4a6pkTCRkMsLbMbhnQFuejtjj4ROV8Mrc3MZIXJza9vYdJK44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729627; c=relaxed/simple;
	bh=4iX75urJJ0lT4RLZIdmyzKVD3QTErHrgz1SodZn2yoY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JArjIu8b2SQghnjALV7Ssg9i+OXkqNePmJpoFLYQ/td2RSc0zXcjX1bRuJ5OLBB9CbqWnWOzc5x5R+2EQHAhjFpxTWSm2PnLK6Qg7NUrPsyPMOdE/ifFrSEU11YnPW1joRG1Tg6wvDuMHuu7NL1oQ869ghvzmkPR/8+N84XGYFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uK4PN7gz; arc=fail smtp.client-ip=52.101.193.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4gFhjq2BTOdCKzA8sBW+A4CGMaHSTuBj7UU42vf+A47hzlA9o6J759xbG303vBQRxcNkUpEHALKYDoZHNQt0AbAbtfuSQsQ4wWUJRcSHOGL1+K874r9i/8cwpfpfM9V330vIc2KtbanMm2sWM1VTcK38A9fWuXMqh1RC3uo3/xcdzOJARZElVavLrgp21ZqUeCGjiuBgYks+79cXldP9i9fkNDHSksge5dcWyNMTdsxiAt9nrCMfDrLFfI7S6pzwXqOtCIvf0OjQ+IDuZGr/i5X0ViaTErriRSVwv+qcUMDxtyD7M6GdQEGscL8SN/cS9KqkhVD2dUmKrIuUOm3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edK9UoOKp5WWr6qKOcwoZxfbzDdcsriijGzUVgwLFWo=;
 b=n1wsCdFsUOoBB8DSJ5Re5YdsTPN4dqSpiDnPAn6kIWtDas7q/xJlQeLRowDGwHHYz8O0SigqkXVO0Gm67p7Dn+mAWMmH2l1IWrrl3JB8Pde6/ilMMboaBnG/FIaGUCBHSYaGacoPolTGT3zfkiYhTquHEdf9qOOZPtTLkTXUeyTMY43oxPMf/AChjfid6XaP1y+ysVD1i7DsU6ltPtJ+vXCosVU/YwidrbSTyjIOSzSTsKtEXUQENXOqAlWUr551dgKrYLDJAFhvElySkz9R6DRjgwQurNRgsMKFGDTTPgoHx6F/vwYjKvyVf6mcDxN1CHVc2nnRdfhOdfjWtrzppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edK9UoOKp5WWr6qKOcwoZxfbzDdcsriijGzUVgwLFWo=;
 b=uK4PN7gzFsO6vOl0hhzqIERoGECgNn1HGSTeoNgLyIEwSO5Z8Jrsp7Fb1baQecujGmMfwHg7YLrGUeJNuU+imgIyIWW7e4/6p6t8681d87JeDNDhZICPGNgL1ABYrWrmZCHDkU7McjIAAJQTKzy3MUSXdmZFTx+x1MA1QctzT1Hx6Eu4G+320yT3hMYZ9GzvB98X/50pNtJIsPLYAXgd0CMr8oMIqkwIwSjgq+byto7KxXPANfJIK9hPOPkCE5XgZzOJlngcoN/wjcGpKflPxfTUdY6JsOoGtzxpXCvWRCDHuoxNiliOR7rqjaFeXduIcfv2iNrGHuCW/mWjIJQECw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 09:20:21 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 09:20:21 +0000
Message-ID: <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
Date: Wed, 29 Oct 2025 09:20:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
To: Esben Haabendal <esben@geanix.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
 <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: d0577079-797f-4586-2d9b-08de16cc626e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk50UEtvSWVNVXlPK1RpUFlTNHVXNEFJd0FOenhLSHUwRjZRcklxQjV5NVZL?=
 =?utf-8?B?VXBjM1ZiZ1Y4ZVYrZldOQ3Q4dWRtUzJKS0E5WFZVZTNUWCt1RzBJYTF4U3dt?=
 =?utf-8?B?WTZQZk5KSTJZMWRuY1FEdGtUbXZWQ29yMHRnd1I3TzJNbUYxN0d6R05kcHEw?=
 =?utf-8?B?d0dYTkk0dFFpVDhXNDk3MzdydDlVZE45cHZwbTQ2MVZ2R1A2ajBoVi92cU55?=
 =?utf-8?B?c3M3elVxL0lxWVdCWmZFVHIvTW1ndkpseTRSRjFZcmovakZsTVF5S1o4Q2Vp?=
 =?utf-8?B?L3F2WDMrWUg4TXEvbDFFdDRBdy9nUnhueDcrRCtINGh1UmllakZva1k5dFgv?=
 =?utf-8?B?NC8xTzF5U2R3RzY1VFIwaUViRU1yKzZuNVJ2eWJ5SVhCdnNHeGliY0Z4SG54?=
 =?utf-8?B?MzlzUENNRUNwTDRLK1dHYStHVWlzOXNLYjd6S2RLbkdadUlDQlBxVjNXd0E3?=
 =?utf-8?B?ajhjTUU1RDlRL241Q3J0OW5DQkpsZC9sSWRBS1Arby9NdFVDVDBIdkNHYWk5?=
 =?utf-8?B?ZCtzV2ZnanRmM3JxRTQxN2VaZ3NZWklzaCsxZTh6WDFQTkRQcS9yTlBremtP?=
 =?utf-8?B?Y3lBNzR0MG1BZVQ3aEhabG1nYlAvNU1qTHdhTlZGSGVoM2M4cU5Vbmc2aUlF?=
 =?utf-8?B?eGtOS0ZQWmgydHJZclFzTU1KYkYvcVFFeFNVUFIzMzdlUFlWVnVTZDdQNTdn?=
 =?utf-8?B?U0VKcE5RbVhCTG5pYlF6MEVaUUFMMmc5MVIyVHVRcXBWWVlMbXBGQ3JvVjNo?=
 =?utf-8?B?K041WjZCWE56ak1ZU1poSFpxcTFGN2RGc2ZNSVJCQVJmZ25ZakNQaEk1a2RH?=
 =?utf-8?B?Umw3UGZWaFlGNittSEN5VDlkK003V2Y4TTJZc2p3UVRTbC9zNUIyZlBtdm1R?=
 =?utf-8?B?U2o2bklSNTVZZ295bUVmQ0IwWFJVRmJKMVl6bklHMDBVRnJSdHB0dGRlUjZL?=
 =?utf-8?B?OC9MVXN5U2pQYjVhVTczQ2hsNVkybEUyNjJ6L29ueURtNWpYcEV2K0N0ZFlj?=
 =?utf-8?B?R0d2amlGbEhuZXhkb1hENUVSdGVZNHc5OThJelJLUUlnb2liWTdIcEZrbVB1?=
 =?utf-8?B?TkxCZm9iWmZSdldQb2dkaEo0M2ZJMVlBQ0x2RDdOZm9aVjFpQS9VM0lMT3c5?=
 =?utf-8?B?ZU0vdU5VUlVTY3Fwb2ZqdGtKdkpUZTVTMVhhZDFrSmVOWkJmTHoydVpWYXY4?=
 =?utf-8?B?ZWtWbW9HR0ZQdjU4eVVzQ3NlNDFWN3RpeHhmTTJObW9qZ3pTazNFdnpWRDNY?=
 =?utf-8?B?aTdzN0Z1ZVNYTWpUQ05pN05Md2tyOFhVZFNpeWxVZUpvcm4xeGxFMHRWaUJu?=
 =?utf-8?B?THNhWHF6R2RSRHlRVXpGTlBrM1RUaWtWR1JIQWZvN0RURDExQU5YOXNOWk5G?=
 =?utf-8?B?aHpOVVBxQnR6Ymg0NlNvdE9RbkxHTVhoRjd6a1QwQ0dXaWNZa0plMGdnK1BE?=
 =?utf-8?B?alJyaXNCMEdqbGpDZzhoNFZvNzBZRlN6SzFLak92bVFYODY2RlhPQTYrSldm?=
 =?utf-8?B?Y1QwbE5COHlrTkR0RDR2TVBOWUZ5MEk0cUJTZThVZnZyenR6UTNzNHVJbzhK?=
 =?utf-8?B?TWdXUks2UTIrSE9KRzY0emVibDE2UWFNM1BrelVMS2pqSHRvT3JSWWRqS1BW?=
 =?utf-8?B?ZUl2T2NzNk1yaHR3bWxObTZxcmpZYmNZZ1Rqd20yYWpOVEN5MkwxRmp5STlq?=
 =?utf-8?B?SkF2bmpqMGFXcld5eGlyQnFCVGdqWUhrWHZIbWhzeEczNFJNT1lBb2VqczU3?=
 =?utf-8?B?dTgxZDVwS2VYWHQ0amxybU5KT01UOHIvQmlYV0lMQ2ZWODU5eGZYOU54L2xa?=
 =?utf-8?B?M2xLZWdKZVgrZGZjTUVndWdzUm1UVkM0b214U0hyK05nbnozNzIxU25SU09C?=
 =?utf-8?B?S3BXOThGYnlhSUQ5TFRZeGRGYWhydUFPRTVTSXdERGJWUTBmdDhRS3hXM1BE?=
 =?utf-8?Q?MoJTiH34Xi2jcli1KLdNN7TwvGPJvLGw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dENWcDhEZSs4NlRpR0srakovV2c0U0R0aExmdVEyRWV1QnlQazFYN3JuVVNF?=
 =?utf-8?B?YUlrSHdLRCtTalpvcHBVSExXN2hqMGRHY2htcWptejVUdHIyMDJaQithbWRI?=
 =?utf-8?B?Q0VxLytQNnRLemsyeGJZeDRKZ2Y3dkxPY2R6UEMwUGVaVVJreEJscllSeU1T?=
 =?utf-8?B?YU9tL0xqcU1FZ0ZZU0x5TURtZzlFaWlMMHdPSEE1SGliRlRiNU9senJHanBl?=
 =?utf-8?B?dkQzTEdXMkh2ZVpha2NKMWY5a0x4M2hGellaeHRmRnViM3d1ajhuMkdlVDE0?=
 =?utf-8?B?eWNKa0VOL1RJQ1B3emQvNDJLVnlibDVHZ3N6VkdMejI0Y0lHWGYxV0RKTko1?=
 =?utf-8?B?V1kxb1VlaUg2SU1BU1NoSUdIeUZlUnptajVHTFRwaGVGaGF4NTlKQ2xSVmRW?=
 =?utf-8?B?YmdLNGgxTHczMlJzbkRsYVR0U1hOZWYreW96cEx3UzVCM3IvRE5iMUswZndz?=
 =?utf-8?B?NWlJUHFvb0hiMUZyVVZ2UFI3V0pzczdpWHVTQVQrYmVkQW5nVC9oYWo1eVlS?=
 =?utf-8?B?ZUdtaVZqMnBsMlhqWjZNb2lGYnRPbDJXVFBkbENrUCtjN2tWelR5akx2amZF?=
 =?utf-8?B?V2hUejNjemUvV2RORWtNeTBFSEpNREFCZDJscnY0L3Y0UzljNnIrK1VFMVhS?=
 =?utf-8?B?dFdtejl6TUpkenhtYXM4Y2VNRkRZV0tPYk1oSUhMcmQvaERXa09hMU5IdUlo?=
 =?utf-8?B?VXFPT0xRV3VBOEdQakFLemR1ZVNobWhJdXNoWDlCczkwLzlQNXZXeEpnUWRM?=
 =?utf-8?B?WWRWb3F6T1FWUHdvQXE0MVg5ay9hQ1BtT2htY3JSZjZUNFYzTGJKbWx5b0NT?=
 =?utf-8?B?eXp1VFpGczl4Y3lzMXBRdjR6VHdYREpIR3pIS294N2V4eGFxUmd0VUQ5TW16?=
 =?utf-8?B?Sk5mMVVNMFJNd3YxSmsyUlp3UUFZampJb2xqaFV4ZTBVY0lkZm1yUGxLcFQw?=
 =?utf-8?B?WVhTQmQ4b3dWbktOMnhkYXRLMEg2Qm5CRW9pdUVQcCs2OG5CbkJ3VWlFdEFh?=
 =?utf-8?B?ckRhbERNTTR1clByK0F4bFZQRXJ0S2x1L1FjNGlOWEtHb0F5VkQxemdFb0ZY?=
 =?utf-8?B?SXdoaUtwelJXaFhFcktHRzRYdU1JODkxN3psV01EMnVhdnhoUFZLb2FXQkZs?=
 =?utf-8?B?V29EVnRIWUgrdGVOZTNncEkvTlR5OEc1Z0NDZ0h1dFcwNDdSMlJiTDlnN3FD?=
 =?utf-8?B?VEpiSDNmamM5ZTd1UjUrV2tJYkZRZDQ5SXFoVVV5R1FWMHVxVmsrdnlEc3lD?=
 =?utf-8?B?ejNnbXNRa21OMVZRbWtFVmt2cEdBM3FUOTdFY2tic1gvQXZjMGJrRU9wZndE?=
 =?utf-8?B?SU96LytCbTd5LzVYRTlySUsxY1NlVTkvUzZUU0NSRGZUSHFjeVJkMXk5L214?=
 =?utf-8?B?a24zWm41NnBIRGM5N2ZoUGV5QTFQWUlaWWZoVVBaaDhFZThJcGxTd1dwWTBy?=
 =?utf-8?B?Qmg4WXIrWGVJM0tCdkRHeG5aNWtTL2h3SE9ZZzFTVlRqeXNpOU5iem1KLzF4?=
 =?utf-8?B?enA0ZjVhWlBkZkgwNG15MDRYMk5UaGZmaUMrKzFZQUFEbGtTdExHdEk3QStJ?=
 =?utf-8?B?QWVVcHZXejFqTkpDVG1JQkZUSWlJTEtzUlY1YWwreDU1eHJvN1JteXZCVkZn?=
 =?utf-8?B?QWUxMTJxRUNsdGh5OE5FMlhNTmVDWEJ3NklwM2pRbFRrbGh6UVBnV1FYdDZz?=
 =?utf-8?B?ZHlsUFE4bTVwTitMMDFBV25TL1lXNjhaWEhTYUcwYmdIZzlvZjlSODdvbTdy?=
 =?utf-8?B?VDdoamplQkFIQVNBQnhZWlVkUnVqTVozM3V5WGtTcjRRdUtBRC95UDhUbTNk?=
 =?utf-8?B?dStLR0UzVzM0RUpMa2FiT3FHS1cxb2E5d2RQd29VeVF3Ry82b1pNMmRmZ011?=
 =?utf-8?B?a3BmaVJaMUI1OWYzVFpTQmQ3RldUUElnOUpyTm11MTBwT2I0Tnc3U2hiUFFJ?=
 =?utf-8?B?RGF5cTFjRkphWFdnZmhybEhkeW5yZWI0RHYydEJCZDVjdE5YUUN1eTIxZm54?=
 =?utf-8?B?SWY3T2Y2dlNJQ1psSHdYV0ZxSUM0VVRPZWdyaGcvNitLQ0lSc1NsY1pGWDZL?=
 =?utf-8?B?M242dytnOXJ0OVgyZ29ETVlLR3lCcms3eFZwK21CYUFKenAwaG9zREsxcDFu?=
 =?utf-8?B?VThWRHBPWTZYZHNscE50OU14bytpcXU3SU84RXhybm5VWkNnVUFDOWo1WnAw?=
 =?utf-8?B?Tm4yQnlpZ2N3UVB1UlZBd3hXN3ZGUDJNU2pod2NXS28rb2ZHM21aQllWYWZH?=
 =?utf-8?B?YUpLOTNDYzdvdXdjUFpMak5LY21nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0577079-797f-4586-2d9b-08de16cc626e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:20:21.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN6hZRb5MHMT5xPGIs1AT47DRYbJhtwIqULh5fz3jdZX0l2tPETa9vpOwejyEfrca3szC89ITGXWMpolJX1Znw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

Hi Esben,

On 16/05/2025 08:23, Esben Haabendal wrote:
> Interrupts are automatically enabled when requested, so we need to
> initialize irq_en accordingly to avoid causing an unbalanced enable
> warning.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>   drivers/rtc/rtc-tps6586x.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
> index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
> --- a/drivers/rtc/rtc-tps6586x.c
> +++ b/drivers/rtc/rtc-tps6586x.c
> @@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
>   
>   	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
>   
> +	rtc->irq_en = true;
>   	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
>   				tps6586x_rtc_irq,
>   				IRQF_ONESHOT,
> 

I have bisected a suspend regression on one of our Tegra20 boards (that 
uses this driver) and bisect is pointing to this commit. Reverting this 
commit fixes the problem.

Looking at the above I see that the flag IRQ_NOAUTOEN is being set and 
so now with your change we never enable the interrupt. Hence, the 
wake-ups are now broken and suspend testing fails. So it would seem best 
to revert this.

BTW, I looked at the change to the CPCAP driver and that driver actively 
disables the IRQ after requesting it and so I am wondering if that will 
also have alarm issues? I don't have a board with CPCAP to test.

Thanks
Jon

-- 
nvpublic


