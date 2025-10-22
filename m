Return-Path: <linux-rtc+bounces-5122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA8BFA1D8
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 07:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CE874E2B45
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 05:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F93BE5E;
	Wed, 22 Oct 2025 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="sAzHVBr5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023110.outbound.protection.outlook.com [40.107.44.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFF350A1F;
	Wed, 22 Oct 2025 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761112091; cv=fail; b=YqccRM34UbcHKGjke8vmj6NQY81goAByY6mqQUcTrAZ2e9/xyPb1ZV/mZpcYUE72Mv2bZ2AKbmUtyOw6vefq2322alxbv8k4+UuuImbj32h6J+OimYzALqhLnqZAxG0NcQANflOXdXXHP1aha66XU7xkrOwZ1MSTwrqseTuGVrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761112091; c=relaxed/simple;
	bh=irnvZBQe/tyT5BwyMN4EMoAV3gnFIQFnD9q+wSUEDCQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S7nR2FhP/0vTzS1T6INEcxcrRpJnspMVLHHLMNiraRcjU3NP666yYpKs5/wHaiBThaONscl2Z6uGOZI+CVn251fD56P6ftS9+Z/53iEWA1Vm6MbQPHJOdv9T1RsEzhI6vbGA3hDMKdAD9JkF0uswxWG0BjYzvE3n5mWGu2eP81o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=sAzHVBr5; arc=fail smtp.client-ip=40.107.44.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmBKIbUtVMxSX9wG8zZOPYtWZrK0WfrdOo86k0mwkr6vFbZCG5nusQrg84KGgs1zCzce9Q3YQxX1zQpnSObovVCIClZSXu7n4qRT+oJC+hV+RG6VGkizvJ1lXRNVgg+2Q+j8q2fC+dEeEIB0BHekbrYeKz2yc5YJzSKReUbZzQ4bZ6cY8ZhZOJqqzI5Rr75e2Zev/pHhhp2Y1fSlVj7oVq5umZmFaoORM5CXYBcpkUiTgHhXbeXsGVPmb3nXOEbxzwkBd5pD5/q2dlkWhvwFUhJQMdzF+Pqmac1nN1IHzuj8WcbYv4BVfBRpq07u10Mai/UwmSWp419qCd6214P5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtAkpN6jOsjpaunBLl62k6fnI5aJM5IQ1L4U3tU/Q/o=;
 b=DrbqONKE/gpMiJ9NAbNZoRDmRrPVTvbHu5OzrPnGakDyGqAyF4eeh0D+BlTxuTnkGzpp1cR93s0emDfCq5k37pldRXNSbEEIg2xVBVfe7OTqxuHFIIuQebgDbwREo/4jCv4k4PG0mlIvWHf/ai5Jo1i7BzLPL7NUaaMQ9/EJqmP7+8879Fr82J/RreFsa3BYIdbCsHb7LozrDZCG13r9r4ngciSFvNtEP8pbrgJbVwtH2vOl+Vz8E4r/u+m7O0yH7E+4xIw4lMqVdp0mRYfF58Q4aaSPzVi5ABR5XWTie2gzbQtOV38Y6PVEifEsaPqOZaU/C/eAyL0T3b3AbQPbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtAkpN6jOsjpaunBLl62k6fnI5aJM5IQ1L4U3tU/Q/o=;
 b=sAzHVBr5YPMjMRzvHaY+r493LfJyjQ5jA4sm/y8kONo3iaeFXBn9UqpOeK0/gkuHaFhSjnUWxHgq1uFUU32XAYsr/fdK/8jQG0KujPc2hqsCGYcnGKZ5mKVhBlgG4vTymksZMKmCafwBUcDev9vUeeCJ5XxyyLTAnPnASPUGqVbIthHZNQ2OXAscx6ysetGjqSaTadq8ZITBZq72VmVPDEF1Jr7WdibyxuYAn1VLxFfkJRiNaFworoofr0unXHR2ks/0m9WDjr8e2shcKnMVGxSoffd8CHJKM6NWbKHBbsEds2bxEbTevsBnN8aPJuAwo4P8bxuKbQlHKnfjjGu68A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB7619.apcprd03.prod.outlook.com (2603:1096:400:412::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 05:48:06 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 05:48:06 +0000
Message-ID: <126bce2b-d899-40e8-ae45-07dfd1e3f8c7@amlogic.com>
Date: Wed, 22 Oct 2025 13:48:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: amlogic-a4: fix double free caused by devm
To: Haotian Zhang <vulab@iscas.ac.cn>, alexandre.belloni@bootlin.com,
 yiting.deng@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251020150956.491-1-vulab@iscas.ac.cn>
 <20251021103559.1903-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20251021103559.1903-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a1a611-c449-47b8-7d6d-08de112e92a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE0vd2NqK0l6Tjc2c2NKcmFUWFYyUm9ad3pCc0JLYWNuNml6SXZWbzBIaVJ0?=
 =?utf-8?B?LzV6WjY3akdHaVRIS2kxZGR6Mm5KaVhsQjZnUDVheWJmUFNsWDRVR0plYzVn?=
 =?utf-8?B?L1RaWWM4Y3JhMW9CQzBDN2NvZzNDcFhKT0N0S0tBYjVadGlpK0VJcG0wMWlG?=
 =?utf-8?B?eGtxWXFxZGhkSmlFOHVyU2VNV29EdVEzM1JXNWk1d1lnTlQ1NVhEeDZOaUdh?=
 =?utf-8?B?NzBJVFZxcmZGTEY3RVppajllTG82eHlsVnFsNnp1OTFvVTYrazROaEM2SG9s?=
 =?utf-8?B?ZlZTek03TU1mQkdYWXpXQ1l4S3F5N0hhOWF1cVRLaW5HUnkzaGVVcHh3Q1JG?=
 =?utf-8?B?alYzSWtQb2U5dXZrVyt0K2FOTGhMVWpnblJyNUYwR3ZrRzZBU3RYSk9zNmsw?=
 =?utf-8?B?VWc2c2hsRUQ0dDkzSGxsOG94WGMwSHFLWko1WjZmVmNkVndkeEhIZThBbVNK?=
 =?utf-8?B?b0NOUWhFMVBEVWJHTG9idk5lWDFQaDAzeXA3cXJBNjhqUHNWM0RtUjBGRkZm?=
 =?utf-8?B?amxQN3dUdWZyUGNLbHFDZC96cW85cXh2UDFTUlpjY0U1eFBOR2U2NEU0MkRE?=
 =?utf-8?B?KzR0VGRaemo4Y1dZNVZ6SlExT1JpY2NESVNKdlNpQVpoNkR3S1ptNEt1Yksy?=
 =?utf-8?B?VHMwTDJlTVR3dnVjZGl2WXdVekU0Smtxb1V2SUdMV3Y4TTgxQkFyVjNueXRZ?=
 =?utf-8?B?S2FaeWp6K1Z5eTJQYlVYRXlua29jL3d6Mzg0MTd5UXFWWnRLekM1MUV2VHpp?=
 =?utf-8?B?NU1kOU5CWEIwdUEzeDRLRElSbFRLU3U0aVFyUVdYaFovMmpWS1FOWWVBdTJI?=
 =?utf-8?B?NW9Jei9SVmVZU3ZIQVJOOVhsREJrbTdwVkF4Z3AyY1pjbFVhbjVyQjQ0dFpv?=
 =?utf-8?B?MDhUcXFFWENNMFVheGExeFhyVVpDbUJGMzdkZ3pGOG5XRllhMU1BMWRCSnhR?=
 =?utf-8?B?OU5LK3RneVNjbGZiNHFLa1ZqYktGMlRlbitOWnhxendiWFY3R1Y3UmIwRktI?=
 =?utf-8?B?MlhnV0JQTjBVVUtmbkN2ZWNzamhKc2NnWTQrY3BWY2RLaC8rUVNUMlkrVCta?=
 =?utf-8?B?R0pPY0xiZnhDQnlubmlqMUk2bzNSZ001MzlhcXhhaDdVNDBvaHN4ZjVLUG9w?=
 =?utf-8?B?UDV1UHFTamtKeVRXVlM3U0xvWkdqeEtsSzE0Zy8zbkFSUnRaWWgvTnNqQ1lE?=
 =?utf-8?B?WnlXQUZ4TXZ1K0JaMVU2U2tyWWR6SDh6b09BWllpczArZTRKSDdEc3ZtM2tp?=
 =?utf-8?B?aFlaQUhnNmxTNW1pUkpLbEg4TkRmMXF3ZityYTcwcy9JZ05YZXNvYkhPTFU5?=
 =?utf-8?B?UzhzMElaOWdwTTM5Wm9qcjUxNElXSmZQK2g0dUswcTZYUFBlZkt2QTNtV0tq?=
 =?utf-8?B?R1ZueEdLL0NyY0JnVjdNQlVQbkxVRS80S2IvbkN6VWg3eXhXSFk2WDFFcWJ0?=
 =?utf-8?B?YjNkcHl5NTlyak5JUkViRjFsbXAwdzlYY256NC9jdUxzNERxaDZCclNBUTVZ?=
 =?utf-8?B?YlgrR3B4amY2R0RPZjZ6QjRZeG9tSFFtWFhHMzdLdGtxd1VNS0V5UXVNVWlJ?=
 =?utf-8?B?d0JSdWdQQzNGWmJtTlFQSWMwRVVGSlBVR0hOL1cwR1FtYmxZZ0l4d1lVbjVY?=
 =?utf-8?B?bTdpeDN2WENqeks1U2pMSVZCSFptelZ1d3NSd1hNdmpyN3diTDJ6TEpVdjdm?=
 =?utf-8?B?NityViswU1lsSXZPZTA1ZGJhaW1pQjhtSVV6OHhjeVlYQnJ5dys4YUZodkNZ?=
 =?utf-8?B?ckVISE5NWHVPS3ZuY1dTdHVmeUZQQzFMREZiY2RvUXFnYjBpMGI5eXFyQVdM?=
 =?utf-8?B?N1UwVFZSZWIwUGhRNDF4SFlTZFB3MkJkNmpXSHd6alVHME9QYnljMmRWaEls?=
 =?utf-8?B?NlZDVVVqUkRDeEtXZFFsM2U4Y3JLMzBOLzlqRS9KY1hXSVJvQnI2R3I0TENT?=
 =?utf-8?Q?R6X56x4ew4FK6J7w6lu4ZObwlEV60e14?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2Z4bHgrUE1ORzE3cmNDTnFlSnpSbHZOMXBUM1QwZHZzUHRSM254NERQVmh3?=
 =?utf-8?B?QkRUSklQOVMwTit0N2hMWC91c0ZsWjV4cEYrakxnRW9DcmZaczkwdk16TXZK?=
 =?utf-8?B?ZHphNWFhUENobUdKS3ZzWS84ZEdJUlVZRG51SDhoWlA0R2xBQ0FFaXg5dStS?=
 =?utf-8?B?bGFuR3ZURVMzR2IvN0VwdzRLZ1VGTHhiN2svWU9kdnE1SHpmUmRNWThMdU45?=
 =?utf-8?B?TmJGQ3dDZzNOUmV1dkNsejBJU3pNejZiSEZMZkRqZmFQT3hnVU0xbE4xSGdn?=
 =?utf-8?B?QTJveHRvRDZ4b2dHT3NhQjZOZ1ZTM21ZTyttZUM5Mytob081UklFaGFJZ3hw?=
 =?utf-8?B?anFsN29ESlRwcUhiQnczaE9WUk84RnZkZFhFU3dybnFuRnJkUUZ5dVNNcTJH?=
 =?utf-8?B?SlpnL3ZiUFFnOVJDQmlNN205bWU3ajR0LzVWTXNObmRZSmNKTTVYa1FxMHZs?=
 =?utf-8?B?RDhUUDl4R2lXMm1qcnFSOXlwd1FLVVh2ekRzd05DeGVValFETmtEKzFKUFB1?=
 =?utf-8?B?NmJjOWd6Q1VTdUdVYmwzanlVMkdieHdpR0lNZ2c0eGkwNTZra2hGZy80ZDNW?=
 =?utf-8?B?UE5udUFOdjIrRUtVc0w0SFVuelhnNExsMGZFQ2RWbWpBTEVnOXZ6ZXNkalBZ?=
 =?utf-8?B?QUNJaFpCZ2YyaHgzaDFCVk1DcmIrczNJampFeFQycTduQnRaMnZmVHYzNGR2?=
 =?utf-8?B?MU1NN3QyUjhpUWRNTGtOOWJSRmhRSUE0UDlvNGJrbjdKOGRxQXRUYmRPN3lZ?=
 =?utf-8?B?aG1CQ3JiK2JmejJCbTFHK1RYR0JrN1UxQy9DcHRmdUpzbE01S1lEUE5zV243?=
 =?utf-8?B?KzBEblA3RTI2YTd5R0FUR2lOUTFpdTJrVmd5WVhWdjRMRXVrcityM2p0Nk1w?=
 =?utf-8?B?dytCZXVpNG1vdnFFS3lzVkoweGdNN0ZFdjFhZHlTYityRm9UNDlnTHR2RFZK?=
 =?utf-8?B?cytnWVRZSTBDcXY4WUtjTXdWN09ndDZ2S1FZdGlud0FsYlJ3QzJ3cm9yVUJD?=
 =?utf-8?B?R216bWRxTFVOeWNaUkxKUTR6OVlQK0N4SzE1WTl2RDQ0Y1ZkZDJXWExvWjVn?=
 =?utf-8?B?eVk5MGpMbTlyZ21xM2RGUjJGc3VDSnVHYUdIUWdrL3FPRzlxYVBrcnZodTdZ?=
 =?utf-8?B?c2xyN1VNUGJyNEFGU3JEdGQydk5ZWFhpSXVFdHhod1JSWGpJVGJEMzZHNlBw?=
 =?utf-8?B?NksxSFJFN2Vnc0JBRGtrWWR3bmttNi9PTWJySG1GdTBkanlNbWxJeTM1RDlF?=
 =?utf-8?B?NDFaNDVvRCtnY1FmV0dieWNGcS93a2NUWlczZEFLSDlQRmJ5cG9sckFzUHgv?=
 =?utf-8?B?RjBkSEdpQnAwZmFMUjJJNi9wVlNmWWNFTGN0bjJ0ZUk1dHlCb25MSW9iUWRS?=
 =?utf-8?B?U2I1alNjZVpUZTl3MW9QY2tmRWV4SzliaVBVZ3JHbE53OFJlZUw0L040cTM0?=
 =?utf-8?B?VHRhK056bXRFRnNOVXByZGJRbXJnUW9GVExLenZhR2JvaGxCeXpCbGlwSEJx?=
 =?utf-8?B?MktpSnFNNEs2WjJrT2R2VkxQaXBPbTV2TUVIRlJvemN2Rkx6Umk0Yy9DWlRr?=
 =?utf-8?B?bWUwUlVjL08zU0UzcUJ3RndmN2JBeDlKRGRzakh5VHBPc1ZEWWZ2ZnVsRkVG?=
 =?utf-8?B?dEJrU0V3WXM4RWZXamdnZncyeC92a2xWR3kvY3NPa3IyczJRMlF6bjVUTnBh?=
 =?utf-8?B?Z1E5ZmNaQVROQXl3UjZmN29CbGhCS200Z3FJZEZzMy93L3pLcUgwSzlFK3lX?=
 =?utf-8?B?eWZwb3MwRnRyNXo4aW5DUlRyb0ozanlnWXM5TkZQbTErVm5wUmRSSUlGVFZh?=
 =?utf-8?B?SUdpV2ZURy9GS2lNQXd1NlAyeWJzNkY4YzdxL0U1T1V0K3BHRTQxaFBORUFv?=
 =?utf-8?B?QmlCMXpSekFPS05CbnFoVGQzYVVrdVdrVFpoeFZKWmVJaUxLRkRpWHpZTEVj?=
 =?utf-8?B?MWJiRTBHYUJ1ZkIrZFVZcklDT2h0NHJXZ24zVDkvWEgwOGRXQlZzRjJad1V5?=
 =?utf-8?B?Wk1QOUdnYWtndFNvMHAvZ044aUVnVUEwVmZBZ2IwaXdEMGZEQmV0Y2U0VGtl?=
 =?utf-8?B?aXNaa3JUWjdZKzdRTjhZOFpmRm93ZGNCY3h3T2YyVlR2K0lRcENxSlNtZk1m?=
 =?utf-8?B?UHlEQWd4Zjl6amx1TmZUUVhrbmhsNVJYVVRZaC9Hb1dDU2M3T2xHNWNXOVVS?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a1a611-c449-47b8-7d6d-08de112e92a3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 05:48:06.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkE6SmZ/nnyzbHwvZxSRnz33l2cafuzN/AgP/Yn/POeLzaS7BvTYafBJgUNzoFCanFDTlKer93Vl0C1KoaBQxH+Z7/cRfaETW7BAc93SoRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7619

Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
On 2025/10/21 18:35, Haotian Zhang wrote:
> [Some people who received this message don't often get email from vulab@iscas.ac.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [ EXTERNAL EMAIL ]
> 
> The clock obtained via devm_clk_get_enabled() is automatically managed
> by devres and will be disabled and freed on driver detach. Manually
> calling clk_disable_unprepare() in error path and remove function
> causes double free.
> 
> Remove the redundant clk_disable_unprepare() calls from the probe
> error path and aml_rtc_remove(), allowing the devm framework to
> automatically manage the clock lifecycle.
> 
> Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> v2: Also remove the now-unused local variable 'rtc' in aml_rtc_remove()
> ---
>   drivers/rtc/rtc-amlogic-a4.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index 1928b29c1045..a993d35e1d6b 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -390,7 +390,6 @@ static int aml_rtc_probe(struct platform_device *pdev)
> 
>          return 0;
>   err_clk:
> -       clk_disable_unprepare(rtc->sys_clk);
>          device_init_wakeup(dev, false);
> 
>          return ret;
> @@ -423,9 +422,6 @@ static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
> 
>   static void aml_rtc_remove(struct platform_device *pdev)
>   {
> -       struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
> -
> -       clk_disable_unprepare(rtc->sys_clk);
>          device_init_wakeup(&pdev->dev, false);
>   }
> 
> --
> 2.25.1
> 

