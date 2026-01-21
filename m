Return-Path: <linux-rtc+bounces-5820-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N4RG4nDcGkNZwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5820-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 13:16:09 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B0569A0
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 13:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF82A48577B
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B3541C2ED;
	Wed, 21 Jan 2026 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GJTGsGRk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9313C1FED;
	Wed, 21 Jan 2026 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997520; cv=fail; b=ObMe8wxKnwcZwl+N6dDwxEP4XSpe7NvnhKmW2/ml2JyrlX+Gi4FXjnINmyq/wskZkOdMMDIZmXFChvZlZrDL4IYesxSgXuetN363DwTm/LELvKuAol6UjZGdhUPLdsXGBqWvZeuCGK2iIXW7YhUB9RYfVWAFPOX9P2EFjqYsq0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997520; c=relaxed/simple;
	bh=5MlufbfMwO3TlBQVk4zpE1YEJKgwNWnXu4gDpCC2v5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rAFDgimiuKUbisAAlSda/yOqOy9YCh6DsAJHpKXoxl94Ou41W3NQSabRlwDMrAXbt/MGq77KQ4BdVDysfY03NtLrep7B1ASUcQoxtZBdGPPMOywbq/7wcWW7xOAp+vEl9drM/MeHLVxeOhQsjv2y+/wtmNSBnpof937fmaKelQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GJTGsGRk; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siR51D/egRD4HlFIxdheRZl32Y0g4CPCVLcJYRFCsHEshktWiEMGa/sSTdqiv2MGz9yRWR4EgZN++Hp9v0LNyz1b5l1G8InVp77SmRvVAzq0LUTDT+XdBHxJx8A+cSFf/Bc+UqnV1KTdVixZzFh6WzZP9BXi4HxHiIJbIwZP6b1QPwPok0q+IDNvBghVrnm60eDmvBBrG33If+HUtL3Fk3BA54EVQr8E+qA7ILUJmROebDRkbpT3m5elzLRAQjXXVzdFMqh2qy5hOVJu+AkG5h1C65jn+PtHXYJaRz+tznbj5aWZMpbq7JqUeCTFs1CaAUlUwu8cfpRaw7gwmsgxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHP/KdNc9r2Ur4eH0i3/jQkEbWyJn/CJ5pF9zmzCw8Q=;
 b=quec8keyTuEv0PQ5fsygJmg7OVoCTVL+nP3E8Wg/OklAlHmYeiV3heGevDm2D+TEWo8qw7fMBUBC5l4MzMHxFFmwxAM0EciuU+wlHR19NM7bFfimlOOPmZKpz6guFWwBTSxzB3RumGQzsz4/enJca8h79eMVQ9NGMysAYe4BkQeG3Y6eLjwDqUOI688FAKHjUCDrCyhNUAoPoLs5UvjqXhJbAG86l0QIQneJ9S3Nc3vl7iAsA/FjvXpJ/HHbEF8YpxsEwOfIb4npgb/iDMSgEyU8977bhDqSKhVR8fS/+XuI6+rX2MiqEwPIo57JKsN0UemPCzCKO8A6Yfg7qjyFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHP/KdNc9r2Ur4eH0i3/jQkEbWyJn/CJ5pF9zmzCw8Q=;
 b=GJTGsGRkSTA7XDENmjHatNPVHnS1mUAb5lG6aQs359LDSMvAZdv5SX1RNZF7W4CgCyrAONKJNQIHixVWj5C/nqPsuWnldlW+23iyLLy4mbCBTHA5XHXU+ZwaE+Js5z7jUWckp4ZSX0OQbc9DMcOlHwldp/UVRMcdf6v/GcJaQpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 12:11:55 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 12:11:54 +0000
Message-ID: <984d24df-cafa-49e9-bb26-f1ec61533075@amd.com>
Date: Wed, 21 Jan 2026 13:11:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] rtc: zynqmp: declare dependency on arch
To: Tomas Melin <tomas.melin@vaisala.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
 <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ceaaa5a-fa5a-4b7c-c780-08de58e64478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anVNRDhrVHI4QW1oUXRhdzhqKzhnYjdxSXFqNFh4NVJQaDNTMzFwekdZU2N0?=
 =?utf-8?B?N0JWU3JjSWIxQUVvZ0VQaXdCUVFPVVJzaGZ4NUxiRWdGQWMyVG5UZ1kreG1z?=
 =?utf-8?B?Q1J0bGRSaUJNMmJmV1NuYktRMnM0M1VwREg2Rm5OZVB3Qk1MZGxLUkFBa05u?=
 =?utf-8?B?RkpkdGQ2T3Y3bmJoMWhseG1VRG04TzVua1N4Q3FyaHBkMmJVWDJKMC9DL0xn?=
 =?utf-8?B?OVZJcW5MTWMxYmlOZnBKSXQ2RHRWcUxQNmQzRDErekJQUFcrbDJGV09GR3lM?=
 =?utf-8?B?T1NhekJRRDc3U1FTZEdtZ25aZEFoTDlJekRIUmUvNkJuN0o4ZFgranB3MC95?=
 =?utf-8?B?SzV3d0xyaW96eVdzTmpNTzBmMlJqME9zQ24yaURWN3huc0tsUXpiRUZTMXIw?=
 =?utf-8?B?dFJpVVpFY0lFbTZkVmt3NmE5TG9VaEJkRG1pRmpnc0YxWHVlUjlkVFVoYlB6?=
 =?utf-8?B?Y2hHYmNWWjM4cUVJdTlRQjBhWlFFenZ2WEd2MHZ3MHlYK2hWakw0WW0wQ0Mv?=
 =?utf-8?B?ekZaMXg2ZFl3UFQ2R0U4c2EvdFB6bmdNWHN5Ym91dVlWaUFhMjRzQURveU9I?=
 =?utf-8?B?VExrZXo5OHB3Y0grWnNnMFlDelpoOHBpc2lqQmJ6eGhUU1ZiT1I0TXBNa2Jo?=
 =?utf-8?B?ZVlvaTJuaVVkMnpld3R6VVZGK0hvWHBVYkU3MHB6VTlYZEZ4MWhQSWsxSUlw?=
 =?utf-8?B?VThXU2lzUUUzUnl5elBhRVpYQWpEMWFCeWlWSjhSc2c2ckRlaUFlcnNJaUtz?=
 =?utf-8?B?QVZzbkpobXF5c0hvZkdmeTBHcTlpWnJnK09BM0lFT2VDM2oyd05iQkdzMHFl?=
 =?utf-8?B?djZGRUZBMTQrSmwyakVIYzQwUzhORFZYaFVCZForZFJ1R0NxQlMzM0NQbVZX?=
 =?utf-8?B?b1duOE1DZURoYnYwUXRubGR1V1FYV2RxVUxqVE96OGxGWkQ2RnVoVnlJVWFV?=
 =?utf-8?B?MzZkaE40UDdOTmwzUTE4MytKZ0wwT0N3ZFlGaFRmNFN2VnJIdUJsNHVtMEV3?=
 =?utf-8?B?amFXeUNzeG9lMkZDcTY3Z2tQK3drVzFJVTBFejVyNzRyaWF5UU4yUll0SDRP?=
 =?utf-8?B?SCtpNU8rWTdJUU1vYlJDOTY5TVp5b3hadGcvMUFLcU5YQkh2RGlxVU5EMnQx?=
 =?utf-8?B?NWM2OTB4M2c4em9Ya0xlNFlqMm1yZ1VRd0JpVFdCaGdPTXp4d2tiV3dQRk9O?=
 =?utf-8?B?bnpGUEw2aUk0TkdyenFLZ1pMVlJhVFhQNXl4NUxobjh2N0FMaGYxRDgrVHNz?=
 =?utf-8?B?dnRTV1BmcUdKa1FGZVQ4ckVtQVhKOWFyOWViVUNnWFJKcUVDRE9ISmk0RTRm?=
 =?utf-8?B?SkJzeHhRZi9jdU1lbC9wdE5EbWY0SVQ1eG54M0tqWVFuTXFwUm1OVGljT2xI?=
 =?utf-8?B?YmFFc1BRQ0NBelE3SkUvalVqZy9jTXl5MVZ1TmxhczZxMElPdzhXZWJBY0d5?=
 =?utf-8?B?NEVqbUg1VE9XSFNwV2NpY2tZTXVxL1VqUWhFM2hzam5WWWhwaDlmdW9SaU96?=
 =?utf-8?B?Nkl3OEFQRUdlbk5aUmtMZElaSXJrY3ZLQ2IyTXhyU1FkYUlXM1B2Ukx4NDg3?=
 =?utf-8?B?cko2ZGJsQm9PKy9OOUdQT3lTam1iNjd0OXB2OWRqMlA5aGwwSGRDNlZPUkJ3?=
 =?utf-8?B?VHE1N2FoWWFIWGhISjFPS1c5S0JYSm9iMmJjTW84dGgxOEM5TDliTFdyN1dr?=
 =?utf-8?B?dGZPYXZVdzFtZUtDNCtPS2EreElKTHIxMndQU3JKYklMaGdBS2ZKdU9VT2do?=
 =?utf-8?B?K0EyZ1EySUVDRExOT2gxdHpOcm1rYjg3Y0tFMTNtZHRTUHlBR2ZHUFBaRG9S?=
 =?utf-8?B?K0JXRnJsdE8yeGxCZDlSREV3MG1ZVndzV2xGUGVGaThUZENReVlyRVhzbzlO?=
 =?utf-8?B?SFVOTlA1Q3hvRll1TXlzNjcvZzBZSmFSYWlHY2tiOVpreVVlbUx6cmJ2bG5B?=
 =?utf-8?B?Mk8yQlhVKzZVVW1mT3hlSk10ZEI4Rzg3czJGRmRwSzMxanlNNU5vWm9OM0FK?=
 =?utf-8?B?a0h2NmlLZ3N5SWdPbXJVUTVhNyt4a1NrL0Z3NWovSExkR2FzOXA4bi81aHZi?=
 =?utf-8?B?WTlZVVJQemF2TndnU053aXRzTU5NU0ttcmNvSTBSUnRIeUN6bHNEdFNCUldi?=
 =?utf-8?Q?pKlw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVBCQ3hwMlNyUVF1SG96em82VHN6UmhXL2d0L0dkQlhKRkxYZmJiL0dwZlJm?=
 =?utf-8?B?NFZCaE5WSEJjbEFXeEg0b0E4UTFpMDRrakJmM0hEckpUMGU1M1BQdDNYbGFk?=
 =?utf-8?B?eGRRMDRzY29UQmF6c2JVYWUwajhGOFlVK29EVnpWUmhuMTFPL0JaaTJXWUlV?=
 =?utf-8?B?bkJzb1pVdFB5SHV3cW1WZ0tJWlFLcU1iSkREL285SytEMkJYazZBQmtmSEJu?=
 =?utf-8?B?cWF4bTIrd3U5V3g1TGJjelhjT1gwMzlVdkZuYTJaMklLR0x5WTd6SkRQUVRX?=
 =?utf-8?B?Qm1qZHZNUlhwOUxEeDM2U3pyeHcxMjZZNUdwcHF1WVpBR1RDcmd3MzROcUx6?=
 =?utf-8?B?WnUxVktnMnRWKzJ5RjZKWWdWK1kwZDFLZjRKRmxXM1cveDB0S2dMWjBmU2hR?=
 =?utf-8?B?a2tMZk03WHpRYVNNbW5TVUxuTFZVYXBtUzgxQTQreWkwQlhTTjU3b1Y0T1hV?=
 =?utf-8?B?TFp6WlFFRmZNbzNiblB3ekJhVE1KNy9MOGdOK0xyQUpaRmRydjEzVTE2N3p5?=
 =?utf-8?B?bjFTTnZTT2ZrNjNXbVowdWdxZUJRa1hhenpQL2IxTUM1ck16R2NWVW5PWG1C?=
 =?utf-8?B?ZmJ6c0M5UHFvZlNjTTU4VUNQL01aRGx4MXlvNWRxSHJpajkxTW9hYUFJc0ti?=
 =?utf-8?B?eXQ0T3FMa0ZYTDZNckxQOTNldFZLbUVwbG5MSXpqL1VDY3B6M0N1Y1ZBOGMx?=
 =?utf-8?B?cXgyblJKMDJyRkpyMkxNMzVvYk84bmtnS2cwOHRncWh0OWtnUmw4ZytIRlZq?=
 =?utf-8?B?dHpuejhXNmlwUVhreXl5UnpHOVorSHN4MktNZ1VaektEWTkzMlNSMEZXWHhB?=
 =?utf-8?B?djQ4ZWZKNkMvQVp2YnBKWjBJM0ZSSEdDK0Y4Nk5heGJCRno2R1EvRFJHRHMx?=
 =?utf-8?B?bXluTWVFMi8wOUZIK0xTVGNXTGNiTDZCc0NjNVZzY2dCeXo3ZGVRL2tpcUlZ?=
 =?utf-8?B?R2J6ekppYjFiZkpnalp3cXZrWjgxaU5TQ0YwQmFjUHdyRkZoeHJFTWU2RldG?=
 =?utf-8?B?cDJVcEZlZmsxbHozN2xqRHZMMlF1WWwzcEtQbjNRYlBRdFh5WlM1UTlFOWhn?=
 =?utf-8?B?UHdUSmtwVkxpQmY3eWcrN0FBaDlDSXc2bzVndlRnditBSkFLYU5XaDFnY0tU?=
 =?utf-8?B?VjJKdXZZMSs3S0ludEZhWStFZkZDb3ltNloyeTA0R0lMdU94QjdzU1cwTVFM?=
 =?utf-8?B?Ukh1STI1Z2RXT0F6Q3Rzb05zZFV2U3AvRXlPRlFXU0ZjZ29SN2RzeVJLM2l5?=
 =?utf-8?B?OXlIUlZEQnh3cmRweFI0KzFkUm9kK0d6K3JKVmwyVXBLVHV0OTNVTFA3bC83?=
 =?utf-8?B?Rnc5eWk2cVJvYUNMOHFHMlhmV2JxSkFoYWptRE9jd05rSnFuZnptbjcxM0FS?=
 =?utf-8?B?WFFnZEV5Zkx6RWM3bTQ2eUJQWVRlVGJkNlU2SERjT2RxTVE5QjVoU2xuQ2NF?=
 =?utf-8?B?T0ZnTHhBN25WM1ExZ1lHTXhuYkZrdmE1MDFsNGZWVHpkVU4vbkt0dlFGd2tZ?=
 =?utf-8?B?SE9JUnJCTnhNV0liVmhZdnZpVjNLVGx5eW1tbWlhUFlsclBxa2txb1hTQ3RH?=
 =?utf-8?B?S290S3hUcHN2cmJORWZwbVFUWXN6aWZvTGNHYTFOemxybG1ZYjdtVkJQMjBX?=
 =?utf-8?B?U0hmbFdJTkxlUFplbHhKQTIxb0FpdzAyQ1owWmlFaG96TzBJZE0yaGRRRG94?=
 =?utf-8?B?cC9oMTNvS0lJUHJPYWE3RkcrQjBXNlZyYU9Tek1sUlRuNEdPUWZnUFd1LzFV?=
 =?utf-8?B?bTNCR2VObWdwVGVJK01lU0dqVG56RVFCQ3VZRDV0VytySlRVYTJzMis0SUpN?=
 =?utf-8?B?MlJEeHlzSlVMTGtEUU9aSnJSQ1U1NmRSRVRxSXRjL20rWWVGUE1YWVRoNFpB?=
 =?utf-8?B?Q2tJVUFXeGY2YlZYRmVVakdnc1hxQ3ZHTTZsSm04M0dCVEQ0YTk0M2MrdXF4?=
 =?utf-8?B?QjI3N29abGR5STN4YkVuNXBaVDB5ayttY1FzV3hTaHBpaEJaZHhSaTdWSmZy?=
 =?utf-8?B?UkRHSE5zcGw2a2JuSGJvNGt2M216NnllOHdBeG9WOG5mNUxCOXluV3BpUDNq?=
 =?utf-8?B?eTVPRVBwaUQ2NTJpQ3RTWlEvb1F5aEdlS01ad3EvTkhtY2toRXJLRHdkSi84?=
 =?utf-8?B?VG1vRjl0cHNlUW1FVllFVmJXRkU1ZjdRSzNRWmtPWkpndjhZLzkwendUOUpV?=
 =?utf-8?B?cG5ydUx6dWtTWU9nL2U0andBSlluWnNPL2pGNWZsYitHdi9XR2VyNGRod2Nn?=
 =?utf-8?B?RFlHbVhxUERNOElyYnQ1UTd0dVU1LzZBVzZ3c1I3YUNzb1JweCt6d0h2a1Zo?=
 =?utf-8?B?dGN2Ly8ybXltSy82cGNRTE1vQjNlZWlBbXJqWExMaFRLLzhUMHFFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceaaa5a-fa5a-4b7c-c780-08de58e64478
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:11:54.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5GP76Q+hK6pOugVWHeP4Lu1N2R/xHSfhvwFsrUV1F+r+GLXjHgkLsdJqs1tq1mt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5820-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email,vaisala.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: F40B0569A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/19/26 10:51, Tomas Melin wrote:
> Driver is compatible with RTC controller found on zynqmp.
> Configure dependency to enable building only when zynqmp architecture
> is enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>

do you have any link what exactly has been reported?

M

> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>   drivers/rtc/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..46b497524cbfb5d0c1662dcaddbb6d28b4ae2abe 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1376,7 +1376,7 @@ config RTC_DRV_OPTEE
>   
>   config RTC_DRV_ZYNQMP
>   	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
> -	depends on OF && HAS_IOMEM
> +	depends on OF && HAS_IOMEM && ARCH_ZYNQMP
>   	help
>   	  If you say yes here you get support for the RTC controller found on
>   	  Xilinx Zynq Ultrascale+ MPSoC.
> 


