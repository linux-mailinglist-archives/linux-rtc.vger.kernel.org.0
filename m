Return-Path: <linux-rtc+bounces-6198-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGzBLZjys2nYdgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6198-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 12:18:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E87982821CF
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 12:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6995330193AB
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA7F37B407;
	Fri, 13 Mar 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h41MAcKa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94E31F9A5;
	Fri, 13 Mar 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400661; cv=fail; b=KoKR8Qs9MkmAoLlqgI9hVRF/3YFzJbNCeR5HijUqimFcBOLGx/GcX7VIpONoDw5gVR1KmxOmrkhmDP9nbc3ana2bkxK266s5+AQON24yw9MnRJtdzH4A6KkERQiSGcYwaVVcQKNySn4gt7YVlF8AoUfTYUC7Z9eLJudk1ciR+WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400661; c=relaxed/simple;
	bh=0A7cWvYuo2r29vaTtMHznS9e22xtHqlI3RQf9WMZVFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hZdKQzsTSsKHWd+uGPbOnxQhapn7OH7CQelB4W5LxSe923h0U6jw+932Z8cQY++dIJQWpF0d0eyFyWlC4yKnW2hodSynbsAHvUsC3FuDMbD8SWCan0u/wPiPRLXlDL9vzSf4QRGdZpo/i2I/XNST3aTGQpNXBjfAZnk/E3EzBRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h41MAcKa; arc=fail smtp.client-ip=40.107.200.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWLE+MzGHa3TEnb1uw+x9fCxAoISGVCufMuG7GUG6f1N+YR66d4Rb0MGJWn7gmfwgD77lTuc0+wQLufDSaVw4YFlIuUogVTAuDbdXVn+Z/iEUp42E4JdqxVT09P/QIvgfjBY7ji10LgTuLlf6eR4n2oniqBjzFbrZ+G5U3BXTBkBbt+mE20dhw2yxj78JiWKNshKxxPe0fOjkFMQ4y63fYPtWWUhYbOr52UAoiKNSrBPxUy0oLScOzs4dX7GnFScec2szpRBqvdKknFHYfJmXifAhBLACRn1O0wCFR7TAs4B3uGE1IndQ219w2iikA6zOWzcmmDr27EozYdgzUiJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpo4bRF7rLwVCLsgKdrHD8T7qBFqQKGWheCX2h9paXw=;
 b=c4tGbZX6EuIKLOihXSnm8xnoSjeiWKMqor+ytu3k9yx1qXeBGhOql3X+xpXRmxgqP3AE87W8r8FpjpsMrtWUtVEJyVbt3dzv0+U1fEm3EXAjjyXAfgTtUwY1AES1ccycUQzll4wc9REdpWCgjSyjeFQ+n6TShQAiyMgKDM7VljvhpFDoF/TlZJESeqOSaB+svSrdCMsOCUNYTfglduZCI5khakLfg1DNnpCuXeENbxUtTyYusPXONm2EbXCbAz1FEMWngLWVooYbQ9sStL/IYc5Uxass5EakM9jY0ve/6HcSIhbZtWtllXd8yzn7hD48gBp3VCcRBUPgUdh8jSq2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpo4bRF7rLwVCLsgKdrHD8T7qBFqQKGWheCX2h9paXw=;
 b=h41MAcKag009Q0YLNTj2sUTEBGyciMMM5FLdUZYOouY64euGIFp0B66nGT9Vz25w/dhqmohBZ/ru2R4+CgTlFZyMUveh5awGM2x+HzaGqWukJDHlvHC5ptoThboY33TsvuNkQ/Ga16z5le/7xbG4v7d3kQz/h+xMd0rWUQHFgxk=
Received: from BYAPR11CA0060.namprd11.prod.outlook.com (2603:10b6:a03:80::37)
 by BY5PR10MB4228.namprd10.prod.outlook.com (2603:10b6:a03:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 11:17:37 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::5b) by BYAPR11CA0060.outlook.office365.com
 (2603:10b6:a03:80::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 11:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 11:17:35 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:17:04 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:17:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 06:17:04 -0500
Received: from [10.24.68.91] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DBH0cA4129486;
	Fri, 13 Mar 2026 06:17:01 -0500
Message-ID: <64b4ccfd-e440-4f48-b743-160527b26b42@ti.com>
Date: Fri, 13 Mar 2026 16:47:00 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ti-k3: Add support to resume from IO DDR low power
 mode
To: Vignesh Raghavendra <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <msp@baylibre.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<d-gole@ti.com>, <k-willis@ti.com>
References: <20260311070214.3589965-1-a-kaur@ti.com>
 <04d217c5-e95f-4507-972f-6a8bda201bf3@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <04d217c5-e95f-4507-972f-6a8bda201bf3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|BY5PR10MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3e1db1-3aa2-4642-8a30-08de80f2212d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ulxolxuCloDe51tlBqSEuAEMvOETXKKn/t7+3KRLDOvwEOolzNeiL3SgnkseVZ9C9GxNnsh9EkgT5dPuUVzwmXPlcxtfxTM+D/526Bu1hgftavH/dohtYSx6Zh7Ox7c6qLS00Xd7gPYdDrxZIX3kiSTtBZtkIBk2gA4F4E5oN+nJ8esnsoOgisyl7R2NUbSksLrRQ8onjeGlRikXphcgFz1p00WAqzxUIRz1udQ5M/osunx/kxZkfvYPlOvq2cbSnYuP/LZIMfqKhBiViLn5Vkbhw70c+PEgytC/kU090Las+lEhlX7FQMtqpokepwPEpdtgcqEZ3LkNxkCHhS6Jw6GtWxW1NlSz/A5YPJ9+A6sOxEfRfrpLB2x6LjDmKYOF4tldVTX7120DYH7xx92AdgmyqqwaXJKyBJ1fP/tNZN1RaTXXyXBumzP4nZpAjUbfBVZgxLRuXlZRm9TBuxMx29ofNq7/sZVAtGHTJOVuK1SWlG+k47DAF/yBhFXQllDJeUIp1oVhY9wSHefr01u/vc0YcEmFnccC8taCeUI0E8RdHL7EY5veRYAf+KTbHzJvJ6HbmgX++KIhOK3JnObR9EiofR6id8a5o5R9FCVTDSoRiNXaYyndbSOM2NtQQXYsX9/5/EjGOuJHGyX2FCBENaqM7pfLeYCogVO/BqJsvj2XrFJ/kdPYydRI+oQA6UUzFhpJEefo/BP3FLfNDryqJiwm5F85WJwzvnwGTI5fvsgPTEm4PhzuspAHezbEQeLNUvJ9saN8FUNYOWVYSRcG9w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r2L3blAJo+wUtWWjh9oIUbKjO0mQtgrO6wpC3FaRHvUwgw7toPLr0MFhYj9eJQYg+7UYfaSa6mF1V65UsriXuy22nXk9KFENiu8hsAyHu5CZ/q3h4scg5s7Igc0ZTHbMUtMyVbZk6hZDqnbdmZmxNq3SQ/Pg/mA83EY0LoDp+GhH1AajOIr47c1f1XcfqO6YKH4jIaOyooS+zHYCM8n+S4xWLc3Q+PSdFT7usrAwaDwdArGEP3vK0A0sX0H/xvKJp1WEVjZNjEGvGRDse3lXgo7vpHYYvruQvz44H6PbOI7W6LD+oCOfwqea0ga+4G2Xxq3xKBDbUh2yM9b89hqN7ejkqIomsvGbw7DFtS/RWeyFzb9xQV5zSrEYCHAifLl/8Z8bFStRtfRHPfP6mLlIGSZ6f9H0wdlW9jKnhZddrc6ubMq/zTdZhPyZUPleh9Wr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:17:35.8934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3e1db1-3aa2-4642-8a30-08de80f2212d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4228
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6198-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-kaur@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E87982821CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vignesh,

On 13/03/26 13:53, Vignesh Raghavendra wrote:
> 
> 
> On 11/03/26 12:32, Akashdeep Kaur wrote:
>> During IO DDR low power mode, the RTC IP is reset and loses its
>> register configuration.
> 
>> The DDR memory still preserves all driver states
>> (reference counts, software context).
> 
> That's the definition of Suspend to RAM
> 
>> System clocks are saved and restored
>> by Device Manager (DM) firmware during the resume sequence.
> 
> Not relevant for this patch in particular.
> 
>> Add support to reconfigure the RTC IP registers in resume handler only if
>> resume hook is called during IO DDR low power mode resume.
>>
> 
> Above all is probably bit too verbose. Below text is all thats needed:
> 
> Restore the RTC HW context which may be lost when system enters certain
> low power mode (IO+DDR mode). Check if the RTC registers are locked
> which would indicate loss of context (reset) and restore the context as
> needed.

Updated the commit message as suggested.

Regards,
Akashdeep Kaur
> 
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
>> ---
>>
>> Tested deep sleep with rtcwake after IO DDR resume on AM62P-SK.
>>
>> ---
>>   drivers/rtc/rtc-ti-k3.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
>> index ec759d8f7023..e801f5b9d757 100644
>> --- a/drivers/rtc/rtc-ti-k3.c
>> +++ b/drivers/rtc/rtc-ti-k3.c
>> @@ -640,10 +640,18 @@ static int __maybe_unused ti_k3_rtc_suspend(struct device *dev)
>>   static int __maybe_unused ti_k3_rtc_resume(struct device *dev)
>>   {
>>   	struct ti_k3_rtc *priv = dev_get_drvdata(dev);
>> +	int ret = 0;
>> +
>> +	if (k3rtc_check_unlocked(priv)) {
>> +		/* RTC locked implies low power mode exit where RTC loses context */
>> +		ret = k3rtc_configure(dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	if (device_may_wakeup(dev))
>>   		disable_irq_wake(priv->irq);
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   static SIMPLE_DEV_PM_OPS(ti_k3_rtc_pm_ops, ti_k3_rtc_suspend, ti_k3_rtc_resume);
> 


