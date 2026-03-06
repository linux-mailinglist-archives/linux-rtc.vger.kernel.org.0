Return-Path: <linux-rtc+bounces-6147-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMamKzXtqmmOYAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6147-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 16:05:25 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F76223694
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 16:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46C4B3038F2B
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 15:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A52C3AE1A5;
	Fri,  6 Mar 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VJnXY1Y8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6936B05B;
	Fri,  6 Mar 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809290; cv=fail; b=MXuMvl/pOHu9+0+LqDqVPBTRs0taVr9JY+M2oia8v0+j2aauQEIoGdZEAfnkbNCgWVvcGClDQqaTPorRg/IQHpT1i249cG3xE7ArRQBEA3SkVM/sGXpEtfoNIO+XJfiDwSLmpcwP6y/+yHOf0+Cc0C7ZSI0rLSGrQjFWS45dSAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809290; c=relaxed/simple;
	bh=9YPuieJn3OJvN1bxc/B2EPNKSwVY2im/isHu26ETUiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UEtFEx20pO7LzCMxy8SEYcujMOdnpp8seHzTzd38Fh5aYC91u0mHE6gECXkkPjR8pHuxXsdOi2n9gXWa9uKhZObzH6x8JFfG8FnA10Bps4fYrgiDrPQdc4p/oybxDqWCKYJ9I3vQZLQC1qtykAcscJbAJaopKv2XBVBsWbragb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VJnXY1Y8; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLIDIHd+BF8buNj6hz6YA7WTWOEFPo17cD2WMkYIRKJ7mv+ULtQuinWVdAUoC9UIs5UQcYrMOF5Z8yXVH6fbFkZ+0pAiVkN2897pj9pbacK+n1AcnJzX5Iws76zCRjUI+Pw+elSRLYZPqtZ/JR3K+sY+XYoZXkCgyfIKdmzyGGSrNoC/Pc21DWeA5yLPiUIacQ6UvXb8p4dUybAZhpf9xqTaJa5yeLxuV1MrHfhrw4rWlZZGpll9SR0P4TVLMFaLyR7tCFqzdxQjd/DwQip3Fene6me9RwwYbVcJjsmIhls9vEJQBPXHFUH7eHbQB1BQhzFxd2y9PmnBftD/VUyICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54kQqXnxZ87VG0edf92ZTw+KfGSut1rfiRxa2xYBgp8=;
 b=Jm4sEUDbZWIWWNZHNb7Ry2Cim+/UzRYEsiyml7wGG1ktxrbcRe9gMVOr1vwAlzds5U9XojlApFHRXQUBFSZmQKWvzWr3+Sb8mpH0AYLhqF7ExW8ezFXX/1uD/ZIwuisPvdkU+9D8TLCzKbxs8YvgkDh2P+klOMUnVIL3aaq2lmfuJua7qyhz7u1dUWruZK0Hr+OWWfP8tUj63XH7gYPBArdjrJaHz4nbP+W1+wNSlOXxCGxha3x5r4NH83WnDpQJbNVoYU9ih5WOh2Dii+Qjkw6c1hBVoAD53SaTBrfqvX45z0QhZtkmjZd1NOFJZCK56u6/uiRtyNoJ4MIib+EN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54kQqXnxZ87VG0edf92ZTw+KfGSut1rfiRxa2xYBgp8=;
 b=VJnXY1Y8m4t+Mrlj0kpiR7TBwPZ7Y2gaIZq/9pL3oJwVVBlhC6INcoGuPgK3V0LP76CHdC8TfRxVwXHKej0+wcSsVcN7A41YKQaBa42KKAeQ7p02GClTtx9m+S2C4/tfufrplYRTzmI4vjo1ibKyxzx+vZ/3l/y+TW8eHwImrSM=
Received: from DM6PR02CA0116.namprd02.prod.outlook.com (2603:10b6:5:1b4::18)
 by SA6PR10MB8110.namprd10.prod.outlook.com (2603:10b6:806:43a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:01:24 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::e7) by DM6PR02CA0116.outlook.office365.com
 (2603:10b6:5:1b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 15:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 15:01:22 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:01:00 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:01:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 09:01:00 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626F10ae299869;
	Fri, 6 Mar 2026 09:01:00 -0600
Message-ID: <5c4c2470-70ee-4dd4-b769-9f26206145d4@ti.com>
Date: Fri, 6 Mar 2026 09:01:00 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Remove use of i2c_match_id in RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260305193545.796294-1-afd@ti.com>
 <20260305230725ffa875be@mail.local>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260305230725ffa875be@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SA6PR10MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: fa037373-e812-407e-77d6-08de7b913b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700016|376014;
X-Microsoft-Antispam-Message-Info:
	5uAg9CtflUuN23HZvd9fcPg4tggNrLd/M+wmxlRDhy17tjt93j226eBEw6JQwLg3foVtkm4EISaJwl7xqihuWJisuaRfnaSY13pOT4S78Ro9LCiyBT8mG7OhJd6mZY9VcT1Ltfpd+JV8ACbp1ZytenZuaD+5SbTvREbL0fGTTk8nb7JUbHsrspa68qevJjF1mYD9V2Sw7HBI7t/2jakAbh/85C/fghxEFIjrWzLtkRJt4zQSm4VUpJsH7n1EsTJTX5G2WqaOYV64+jxlBZocn1K9/R9AT24J+mcuRmrHIvfV+lypGUp/SwnYWJkT0F/qdk4JOL206HcJkARRsFbcvQnUP2zmALjJ+4xEquLTJmtT7qUVkYKEw/SpDuXmQ6qiLh3hp0oYxlY8v+aZrTSPnCEk2rm3+tyBVPTg8/jA0kbw6wwvDDHxkTjNbazDTtnoMFQaHKEDh4Klv/dwth58kj14cTAdyCH4JdyRENwk4b0ZnVu7DZrO6Al0jpqTTPX4210t0NPppt7+aHPAjmXt3O9n+FhMaEK0YVUIpcvrtnYSv4LWfkSvu4qDDCR1m/C8UdsRDoGb00T14y2/MH8vRXLRFsgwe5i6NN1C/tQHQ16ZzyPndEFfnPklclH3cEhe+M82z061suw4xb1LMraYcBr6+S7NAigl+SIYj7dcVeAan8TNingZdi1tXyqVqKz4oFmaiEF0Ka7I3QXkVPHi69wFXTLSH5VoF1iatZzWQB4HWyjj7Sz5CE8Wl+WQI8aNmhL3gNnMGigSA05fwt2sdQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4LhW6h4kOyXE4wB6UXsnqjYZtIAf4i4MIym3bMqZ7LBLefNw+9tp5udFB54US4OBsBZpk0xXrvwRx4+Sxre6MgapfarontisOsX4cy1kfAVAet0he2+QR/hU2t2RXhltHaXAPeHODe0V8GfkqwXC4fUM78NnhTSmCf8crVC1Zir19bLs6SlqcpmOqbGiDROff4zzMnis1lmc7PVRjSdUVQA9Cq4k+MdAwm8PGJQ4rcmBMp3j/Te0l9OXcKL6+ThT9FICDQKuV2KSaAgrDKAKhq3sbSxqGfuDks240ubolRwZFKmGoGCfj4MYjazC5Yb+qAFCSsgWZH0/3vXbAlMQEbWNZVPqjy8kKFstyLNleuIuWWwJt9Vqndq5cX7vGU4uyoqCLmyq3fFk5J/RyC6t4tfHjvQpnv8eiQJPNprDWFnxeVzl5XECUxeaHVLRA+aT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:01:22.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa037373-e812-407e-77d6-08de7b913b60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8110
X-Rspamd-Queue-Id: 03F76223694
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-6147-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:dkim,ti.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 3/5/26 5:07 PM, Alexandre Belloni wrote:
> On 05/03/2026 13:35:39-0600, Andrew Davis wrote:
>> Hello all,
>>
>> RTC subsystem is one of the last still using i2c_match_id().
>> This is a v2 but nothing is changed from last time. If I'm
>> not sending this to the right folks let me know.
> 
> Do you mean that you intend to remove i2c_match_id from the kernel?
> 

Yes, once I remove all users in the various subsystems (like RTC),
I'll remove it from the I2C headers.

It should be replaced with functions like i2c_get_match_data()
for reasons given in the commit messages.

Andrew

>>
>> Thanks,
>> Andrew
>>
>> Andrew Davis (6):
>>    rtc: abx80x: Remove use of i2c_match_id()
>>    rtc: m41t80: Remove use of i2c_match_id()
>>    rtc: pcf2127: Remove use of i2c_match_id()
>>    rtc: rs5c372: Remove use of i2c_match_id()
>>    rtc: rv8803: Remove use of i2c_match_id()
>>    rtc: rx8025: Remove use of i2c_match_id()
>>
>>   drivers/rtc/rtc-abx80x.c  |  3 +--
>>   drivers/rtc/rtc-m41t80.c  |  8 +-------
>>   drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
>>   drivers/rtc/rtc-rs5c372.c |  7 +------
>>   drivers/rtc/rtc-rv8803.c  |  8 +-------
>>   drivers/rtc/rtc-rx8025.c  |  4 +---
>>   6 files changed, 12 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.39.2
>>
> 


