Return-Path: <linux-rtc+bounces-5217-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF1C1F2F7
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Oct 2025 10:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B923ABCCA
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Oct 2025 09:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3F340275;
	Thu, 30 Oct 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGj+CFqm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390A8F5B;
	Thu, 30 Oct 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815247; cv=fail; b=DD7tNgmOaK97fw9Sg0gOgdJnsSaDUvF3u6Od/DuY+5RwbQS5C5dOgmVh7VH4zEuRY0lu1PDfteE5jkGL7Ziqs3Zl9ZYgjbW5CNja8f/0xFM3V0shp86uvpweWUxsZnX8v/w3oxggKHhkeF6b6RjJtDYfJ/CwLlOJWmm+2DhrxVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815247; c=relaxed/simple;
	bh=mejAzYxEA/iV1f6G0BV4xHq+B/AsounoWvZqCNHSa+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fq9d5+xnV4x/mrYZu6l1goEab+vbPBjljLaZXxkbv4OsQoRm6bmkqxZGPpI/V9XogwDanaf+/7aQFFGar3+YE4hDB4JAfQVaBUViKBPZgBAqRGBz9IikG4P8MPDAlQjivOYSD5AzXYf27KqnIIszNatno0CDbbqTQpVYIvcno+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WGj+CFqm; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itxZFbIoFoagLr97XZf3/BRECc7OR4S2X3ex8XnEcnFNEE0k4KgkIbHBXdqUWV5MYf9tXPF4rV04sUGlh7sgkei+IZjAl1nDg4SeZGP+RlQPhOGMtox+q1LsSZRl67oLq/pUwRuG/QCjgzTpjW32haE9G+SmGHVBQPSRu1Un407jJ70nqgjtXsj/Mi9lYEQ20rFv6jamFHAgBmoNUtupTfi44HQKdBFG700zjg44G3P6tXAd1WdLkTx85bTc+uNzQZEwUpKn+lCk8s0hWj0lZp7rd23QLjfY2T8oFt5YHOlyNOYu/WvSMbOR7KTrODVM1CVV73DfNY0IoKXgqJ+PWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqwvjE0AV/JoDiaYHXx+bZz+jmmwaoIxnKRhbnlNBv0=;
 b=Jp5mrd8FpXxX17ShVRphaS2X+2X7YsQdnUQXrNh86mujONrClJgfjRk/mu0Ulwg0u/XFu+9gMk68JBlhimuggQx/5h94yDPsTTRVPefX3kbyYu2nrlvMrQPw9w4B4UyU1XsKbA6G0BdkqKsJvdubqglIM3acKk/yrk/P4QtWHxp5/F1OlIAj98+HOpi6Rf+5DHmkSN/HU7P+p7glRiBNv1axWhhB7r1IS4cmN2gILrmIGsfZTSMc5YVYzc99qYthsVr3OoqUSagyEW3QW5n5TcgyNpZ014Dg0u6PWYwl5JJRyBgf+/YjRyb78FWFfJDJv/6S9lKtteBYZ+3gvHwv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqwvjE0AV/JoDiaYHXx+bZz+jmmwaoIxnKRhbnlNBv0=;
 b=WGj+CFqmfTd4zAeC0YZaQOggrjcFix6qVfBnn0fX8nW17ddehIg1mZeudoiHcesJOE/KLGvWFQ//eTW/t7DqSUAKErjYMHX4k0DthLjZ3iwIUmQQJziB5pwepXKSWgomtVRCKGgDXwPPv9EudkWcqyjmfI3uotcLdLwd0DTjHxKV688+d73KX+3+JJN6501sU0APWM4OUtDAUVUhhbiWx7tz3eyV75fSHbMvigybn3v6JFyLdkAaMKWf1/JE1Y/H3gaNIsluXJj03TjAyKnbhxpumlxVTGNJ9OkbrZjix6KaAWuzyHmL0kSbZ4JNQEQ48PigZvYyJ/Y9Qd+h0dS33w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 09:07:23 +0000
Received: from SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157]) by SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 09:07:23 +0000
Message-ID: <3f3d2d41-652f-4c30-b553-e52b9f5e373e@nvidia.com>
Date: Thu, 30 Oct 2025 09:07:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
 <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
 <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
 <2025102910393819d18ad0@mail.local>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <2025102910393819d18ad0@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0581.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::11) To SA3PR12MB8761.namprd12.prod.outlook.com
 (2603:10b6:806:312::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8761:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: d589e5b2-336a-44c1-3261-08de1793bcc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZElvLzQzSmFXNHhZT01xdmJzOW1VTTd2K0VTbG9sS0Z2ME1HdCs0eDFLVUk0?=
 =?utf-8?B?cjdwWG16VkhYam5IVnRsMDJxZTFFenJrNkhTd1d4My9qTTkxRGt4ZVhtc1Er?=
 =?utf-8?B?dzZ1WlpBWDBPeEp2YklFcGZRcnBFZGZpWW44MkhNSzhOdDE1b2dHOHNNazhj?=
 =?utf-8?B?U3REWGhCWVM0aHV4aStlc2dCWkhGVjBRYnBpalpqQStMYnl0VUJicUR2SEVR?=
 =?utf-8?B?UFdiVjdQcU5yVVlhMmxZNUJ0Zm1TM0lYcUtrZm9RL0hybThtV1FDWjh0VGFC?=
 =?utf-8?B?Y3QrSGRXRmE2OVIweVY5YkZjTXNiaHNuMWpVT1RqK2hCanovSnI3YWVLeVI2?=
 =?utf-8?B?dit1QlZ4Q3Fva0w4cjRHVThCemUyMDNYek4vWkUxamNhQ2xZdlU4UlJiODhI?=
 =?utf-8?B?VkxDSW1XQ3laN2RvWlZtT2tFRDJaRmJIZU1sc1RjR2ZPaEtndVJOdjdwWGFF?=
 =?utf-8?B?WENSQnJKRUF4ZXZhUWYwUDJSeDhycDZHaVNNZm45eTdRMkR2dHNHdnB0c0NH?=
 =?utf-8?B?UVduVEcycFBaS2o3ZDgwOXFiamV0UGNpREcxT2ljODhYNGk5QVV5RGJUazdL?=
 =?utf-8?B?Vk11QWVwL1U2c1NpRXIxMjhacUlveFhxNVVZU3NVU3QwOGU3Sk52Nzd0NGxT?=
 =?utf-8?B?NkdYM3h0dUNqUDhpaStkSUxOUUlFbmxUNDRYNy9raGQ2Qmd5SHhLbFdxNDVs?=
 =?utf-8?B?T3JUMi9JblhSUlduTlkydHhEYmhyK1h3MTVoTUg2Z0pnTDBpNXRVdEZudjBj?=
 =?utf-8?B?bWNQbyt3NlIwMk9xSEFHQnZTalZtN0wwdTlTaGhUSDVjSjlFdk1yS0RRRXhR?=
 =?utf-8?B?ekZKY3pGdm1GbE1IekhjaGN5MGpNSVlGVmY3YmJjalMrNnBJSWxpWXRGUysv?=
 =?utf-8?B?ZzhxdUNmeXY2dWJRRlIzRXg5cllXOGJHcnh6Q2RkSWRGbzcrQnQwZVRMWmkr?=
 =?utf-8?B?cC9GeXlHNnd4cFBMeldhbTNLWUVSV09LL0FMWXZya3E4WHVNVmJtd1FjRDZ6?=
 =?utf-8?B?VzBBQjBiSnhvWjdzLzFLYmdIbzlNYTlIS3NKZHE4QmlDRE03cVBlYmRRNDBo?=
 =?utf-8?B?SUcwTW9ud2NFVWZ2OHM4YUhQRUR0Nks0NEZmVis2SlZZU0h6MVNLcm53MnNP?=
 =?utf-8?B?aXdLMksreExiNXFZSzBGMnRVbFAyYTB2VUhwTVJ1eTRxTkJZVC9ReHZJaHJw?=
 =?utf-8?B?cDBQTGw0b1BISDRQNnZEeUY2cGMzWmNGb21OcUxBUUt6ZThCbnNHSGhFMGNV?=
 =?utf-8?B?L3c0YjJkbzU3MmZQbEd6ZUxkUWRjeXp4VG5kWlZwREhvblZ1b2VZN1BHdnRs?=
 =?utf-8?B?M3lXRU9LSEtXODZuZ1B6clNkM2RSNzNUZ2UzQUZwOFRzNjAzZFgwN0N3NXl1?=
 =?utf-8?B?Zm0vMWZhUXRodEluNmptdUoxQVcvSlZXZ2RPbVlZMkF2T2JwNFdBeEJkenBa?=
 =?utf-8?B?VnNaZ2NWMi9uOW1qcmlZVnk2bThKSGg2aHpZVW5kVzhUQTROSGZHQVNqNjZt?=
 =?utf-8?B?eXVxZFoybWRLcXhIQzNpREM1M1ZrM3RDdldPZ09pbXpXRjd0U1Uyb2VCb3Vu?=
 =?utf-8?B?R0FCWWd1UUNqWnZaMjloQWQ4QXhsS0crT3NhOFkzNmhiK1A2S3ZGNlNBUG9E?=
 =?utf-8?B?cDh6TnZaL0RKeGg4YVJidmdvY2pqOTd4TlUvaHpMSXdPQ3ExZnE5NTdNNFdo?=
 =?utf-8?B?TmMzbUNWZzN1K1ZWSnVlazVSQlc0VkZmVUlFVjBML1k4ak5oMnZIYTFtdFA1?=
 =?utf-8?B?TGtBL2xCN2p1R2w2ZkxjMkpRbTlVaCs4OHRvcjNSQVplR1k5UURGRkV3dlhu?=
 =?utf-8?B?eEdNOFk4N0xsbCszRVVFbmgxdThPYS91U3ZMUmtIOUJHQ0U4a283bFRkZ21B?=
 =?utf-8?B?aW5RditXWmpBSDVUUEM3SUlFdlV1VWZUdXBDNFhQTlc5aG03d2gvQmp5ZFNs?=
 =?utf-8?Q?n5+EHGiZI2dhTW7sqB1iQdqJGDiUr5S/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8761.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXlXT01rUTcrMlpFVkNzamhiVmpVUE1qOTI5bjIraWJRU1ZqbEdSQ3VaYlRs?=
 =?utf-8?B?dGtkU3h0RUsyZjg3UUdkYWRBMDZHZTB5WGx0MmFnaFd4YlY4bWt3b3REaDFG?=
 =?utf-8?B?SFp5NStiR2twS0RCYzRYMXFzK29PcFBmUEh1Tmp4NTk5cnFYTFFNYzdDUmx3?=
 =?utf-8?B?OVNPbGMyRzJ6YkFXdHcrSFFmN000eXNFeU5pMmxzQk9BQjhLRkM5VWVZcC9O?=
 =?utf-8?B?c1ViMkpsU1pOdDlETWUyb0Y4MmV0ZFZJcUx5MzFDWmI3eGJkZkFMTFJrZzE4?=
 =?utf-8?B?OWNJY1NQTnVjWnBqUGQyTzUyRTlhSGVJaDMxMG4zUU1vTVJSZ1BvSmNJRGlJ?=
 =?utf-8?B?ZUE2OFdvWWhDQU1nSGhmdGoyZjcvWGpHcWNFbEJibWl1QjM4QkNDOTlxejQ2?=
 =?utf-8?B?N1RHTFNIU0Vid2pmQ1hKek9sVlNIbnVCYjBqazdtbE9STENQK2QzSjU0YWhN?=
 =?utf-8?B?cDBSYlgyaE9yMVdEZytKdk5nL0FZZUNsT0hiS2gvQk9MR1I1R2ozcVNmb3dL?=
 =?utf-8?B?M2xCTkF2djZBSzR4QXVLaVZXNk9ORU9lanVMSUovRklvSTZYLzlTWVhGdEll?=
 =?utf-8?B?ZWtpMUpqNldTV28xWVBkMDlES2lqRGJtZk1yT2wvUFlSR1h4djFkWCtpU25X?=
 =?utf-8?B?bkFCRGwzV1ZTZm5Ub0U3c3NNUkdUY1Z3WW53Q1ZtT2VVWWlJa2Z2VFUwVmdT?=
 =?utf-8?B?cXRPYTBBTy8wNGxhTGVYQXJpbmE1QWdqbkFkVmxPV3hLU09hYmtVVkhZdWh5?=
 =?utf-8?B?M0xnQnlONHV4ZDB2M2RBMThyTHhVQkVTTXdZMzVDbmdHdEJBemU0bVd0VExF?=
 =?utf-8?B?WHE2UUVnU0ZBdGxOdW1kbDJzcW9UZ0tBKy84YnpSYmZraGRYbkRWTExxQUNi?=
 =?utf-8?B?ZHFnV0lKMmIyM3NjY2tROFlBUFNwanVyWGExbDZsNDlidTNOWWovNzhXc0lq?=
 =?utf-8?B?SU5zc0JEWStnaHYzSDE4eitSak9jSitzcVdZSTlyWWxLbytmME5CVGJQaXRj?=
 =?utf-8?B?d0FvNmhCeWNOUVlYSXJ0RThncE15amZWM0p1bzBHWm1XVkg4RWVsS2dLUEQx?=
 =?utf-8?B?bnVWUDY4c00vKzNxYTMrRitENnpaM01naFdzbjdUR0E1bm8zVHI4eUFkcitX?=
 =?utf-8?B?Z2ViSXg2ZWNTeU1GRTJOcit1MExaZFR1akNJbkw2anBrNmxTS2lVNjlaSUtr?=
 =?utf-8?B?bVZVcTBRSVYxYkNpNVhVdDl3SFc5WVUvYU1qeTdPZXB2cDdhOS9zTmhxZVVl?=
 =?utf-8?B?bDZCYUxEdEJWays5UG9sdlJjRVhBZTVFZjZCUFpuYnMva01tZHl2Y0paNzBW?=
 =?utf-8?B?UFliZUo1UDZETG1GNzF3cmxxaXE4Wi9Zd0p6TUg2T09pWTFqSG9Wd05oK0VR?=
 =?utf-8?B?a29NY2wrS1dhMlc2K0xSRW9RQUl3aFVSODc2bU83STNacm0xWlFMZ0V4OXdn?=
 =?utf-8?B?S2hva2t4dGNHS2ZzZUkrbytQRCtIdVJlWmYzcmxqMVhKK0hBV0Z1VGF4NDlK?=
 =?utf-8?B?YmxnSU0xSDFPVUF5OEhEbEd5cTVITVB0WkgzeXhQamg3MkszaFNNYWpVSGVj?=
 =?utf-8?B?aTB1TVpqcC9ENUtGU3NZenFseU53Kzk5eVRYWm42dXArbkx3VWFqQVFwUkRS?=
 =?utf-8?B?MEJKUmpweHV5aTA4NHNPZVV6VU9KUFEwdlZKcUQ2bnRrZkxMSkJYVy8xU2Jn?=
 =?utf-8?B?cXpVR3YyRmhtQ2FwYUJDZytNZkpFZHF3ZncxckhHbW8vVEM2cjJ4MGE4eUZD?=
 =?utf-8?B?aFVuR2IwZ0ZoT0d2TGI2YVV2eFpHc3NxdUVIRUJrNUtyRmR6dXVYc2FzTW9O?=
 =?utf-8?B?WExMZXFnUlVmNTVWWkhWRjcvOWxCMkJLOXZnRUF0Umxpc3BNQWJzbkxReGtV?=
 =?utf-8?B?SkdSQndPd2Y1SnFhbE00aG1tZ2tVQVppNWEyeGlqam5BdXcrM1VJWlBMNVdQ?=
 =?utf-8?B?V013VGVCWFpDYVZxVHJwbXBTNUJkQy9OeUZrMGZoN1psTDNaaVFMVXovck5U?=
 =?utf-8?B?UUZNZEJDcUdWcjRvZS81UEZhSHIvWlMrNFVKNGFHRzdZTlJnLzFNZEVjaWJB?=
 =?utf-8?B?N1E5MXMvbWk5MHh6NXd1NXpacGw5dFR1SXluWGU2M09EYkJpSjhDU0ptRm54?=
 =?utf-8?Q?uVBRHgpGVHXy0A1XEskEDNf2Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d589e5b2-336a-44c1-3261-08de1793bcc5
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8761.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:07:22.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj6PI/Mk6lK5/ki/tT7CwB+kZzer2ycG7AevTEoIBuRNZDJ2V6XfVWjNIAMWWhvSvIZGnSwv57a6VAYWfCuJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877


On 29/10/2025 10:39, Alexandre Belloni wrote:
> On 29/10/2025 09:20:17+0000, Jon Hunter wrote:
>> Hi Esben,
>>
>> On 16/05/2025 08:23, Esben Haabendal wrote:
>>> Interrupts are automatically enabled when requested, so we need to
>>> initialize irq_en accordingly to avoid causing an unbalanced enable
>>> warning.
>>>
>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>> ---
>>>    drivers/rtc/rtc-tps6586x.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
>>> index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
>>> --- a/drivers/rtc/rtc-tps6586x.c
>>> +++ b/drivers/rtc/rtc-tps6586x.c
>>> @@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
>>>    	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
>>> +	rtc->irq_en = true;
>>>    	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
>>>    				tps6586x_rtc_irq,
>>>    				IRQF_ONESHOT,
>>>
>>
>> I have bisected a suspend regression on one of our Tegra20 boards (that uses
>> this driver) and bisect is pointing to this commit. Reverting this commit
>> fixes the problem.
>>
>> Looking at the above I see that the flag IRQ_NOAUTOEN is being set and so
>> now with your change we never enable the interrupt. Hence, the wake-ups are
>> now broken and suspend testing fails. So it would seem best to revert this.
>>
>> BTW, I looked at the change to the CPCAP driver and that driver actively
>> disables the IRQ after requesting it and so I am wondering if that will also
>> have alarm issues? I don't have a board with CPCAP to test.
>>
> 
> That's right, I guess you can send reverts.

You guessed right! I certainly can. I am happy to send a revert for this 
because I can clearly test and verify this. I am not sure if you and 
Esben want to review the rest of the series.

Jon

-- 
nvpublic


