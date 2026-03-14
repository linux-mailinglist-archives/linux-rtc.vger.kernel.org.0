Return-Path: <linux-rtc+bounces-6204-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMsvHNddtWlFzwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6204-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 14:08:39 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F828D448
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 14:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75D73009518
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3438E372690;
	Sat, 14 Mar 2026 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ea/P/U+D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992001A00F0;
	Sat, 14 Mar 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773493716; cv=fail; b=n2cDwYRVTTY8BqGHH6D1E+OVhwmUUUmIoGTrv9iegOuZBQge/+ur2qO5C6jFAllEN+sliMk2ZawnuQQ8ii3CPPa4FMVDUadzVXmshZngmsmpDvbndnDKpQMtYdlYpnWYm3fHBhPDTvauU/zbUOLaA6USeK559uEZe9d3haNMLPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773493716; c=relaxed/simple;
	bh=uI5yl3Nv23D8oDhw32KhgYJOEHS7P2tyva40nXiKCzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eFAJpyOtUDN7vrKcYf5e+dEpATD5mEHCqlQXneizHW1i1mTkdbLAgegFvno53Hf9eANkO8UxcbEOxx7UmP9mZ95qIgGIfMVkNWf4IGeJGvQWICppw5xOmWFONuY3A7f6noaFLKTJ3uXDg2aJav9PoSzFVDywYL12t2W9O4ZUwQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ea/P/U+D; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKjEM/tDynHwkGj1E+VDmaIAqyLHXm4h60vHYsrTWnjtLl5frPPFXqUSD5xwkf6wl0vGBjihx+HfgIgTuhiR+pK1UQ89gaqb/rh9oXGPwdC7rauV7aV6XYeMh/NiCzvctFyu9zqTApTxeDTmOjLYMUsyjsZS4RBTcb3NSQUVkqlTTcP46Q/YFu0YAVw5rz2O7Rbr0u0/Bu67JJG8NvUGIhLKuxszXBzKCNBlLt2wUoMNJPHOWIpiZANBSUxaPsUDbj3GwxFPNpK6hFfPBVQJEFaU7OtYqlyDy6yVsc0CQV95mgc3sv/yJV0SczaEASMMJV27J4+mN04Q6JXz845o0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CYwk4tZL0SDSU9JnexD5OZ+HbbSRGS3eb2LSuZg2zA=;
 b=YflARd/DC+tT29xCCqGJyh3CGssIeOdKr9fI9xToolc6bM9qcdUL+qAG+Sw06esFUsXQvcsKVTLdgIE/CCPLiwP41teB0q23IZWwo/RcvSflGN+q/3/FAJLRmpchC3pNh3usCtEf6CtAH26nl5Xn7nrTHgDHcBBQP73P93UMes6Md0A4+aSndC2ksqrnj8HRYZlUDBtHUWki8Vc4P1hL6Upuqoel9JKNZRZ1pPAdg8W/LlZXbmrzZU+D26e77IDeIFxHksiEgD2PuLEW3dsKjP4ILMvQ93/P6ElxH7U8wBsZB2JGi2SuFBvATh0Q8fxxKQ5Iaddj/CdRevVIzLc5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CYwk4tZL0SDSU9JnexD5OZ+HbbSRGS3eb2LSuZg2zA=;
 b=Ea/P/U+DJYHp8gYyrUOHvAxbV1WkaswqYsmauYdI/pGkXoqGFoEkVKe4NpYMTiVQoaS0hs/JZ19Q7RPNjO6qgvpQjNFZ6mgRaHTSpx1SEAECegFhSCgKWCGceB6kUVdAIJagYgIkKhSrpeCu7S5oix+emk9FxvTqqWKXl45X0FI=
Received: from BY3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:254::15)
 by CYXPR10MB7899.namprd10.prod.outlook.com (2603:10b6:930:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 13:08:31 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::36) by BY3PR05CA0010.outlook.office365.com
 (2603:10b6:a03:254::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.15 via Frontend Transport; Sat,
 14 Mar 2026 13:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 13:08:30 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 08:08:29 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 08:08:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 08:08:29 -0500
Received: from [10.249.142.58] ([10.249.142.58])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ED8Npc2278601;
	Sat, 14 Mar 2026 08:08:24 -0500
Message-ID: <9b9e0d44-ac5d-4136-b515-a1a951e5b3d8@ti.com>
Date: Sat, 14 Mar 2026 18:38:22 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] rtc: ti-k3: Add support to resume from IO DDR low
 power mode
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <msp@baylibre.com>, <vishalm@ti.com>, <sebin.francis@ti.com>
References: <20260313111740.1492519-1-a-kaur@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260313111740.1492519-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|CYXPR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbf22dc-1f0d-489b-f351-08de81cac9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	An3TnU+CN6YjSW/734MOxw6EsI7W5JbeuEUWIvUHzCqPP0aENG6tLYTLS43xHuvB9n8pvAfg3kn7JpxJA6ncTHqVt38W9QwQwzEB/vS4xPU5dtoZKxJSOzVziCBOO/R9/ZVEAJPaG6lfexyaxEwpK8+HQqkYA5MbvjjKCLxsoxLSN444FjJvCgJgrLQQ9Z+kfNxIZpfYWHM5WctPG4iiVoBss/CJxy7MX5W2NnWjMu/IamVw3SiVQGEfWrhp8YoJ8f2X6gewMOuN5kYugy8KUpTvWZu6MWS+SM4uTIx4m1I77SHDTCKhB/B90pMFsU+48w7c7s2Td5V4BAAcwuFlNsEZ0ywRMHzm95VzXac+5FEJ8Qi0LP9q0y6vwQJU2dpKsVps0UQ7D10SeXACSLJyW1IDD6Dtl80lxqmLHSol3ZXu1hNfAtl9XukdOFdeAqxyX0GVQVLefCBg5Kblhksj/2tKz3/lyoX8f4OOvJr6qA50MZ207BxDBqLZDa1KPr3skhW/utzOzyfHYvKE8y7XHnxsU0qTPxVFnwORiJgzHywcuP4ZV7HlRAaJZ5UWlxnsIK2WfEDzfWSrUkrB7PLXckaexDjKFulBmiMsoSpHfCiFnVfOI3/wCg1i29i/r+Ru9tJRFbVrmabDWvFrnz0U/Hq/C8uidXPHapykoSOOtFbCKyqnWwBDXX/zv4SIbVgCMRDC3221Izh8Q1VulFCBJCtOD+gfoYrlIO4H8nRRLKZB3OeP+9Wj9ZDgiB+bAZyMBTPOlbs0LyJwIZiZvK3jqQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jFLD/ViRnje3RiHBHfjK5WiXJ+pqkE3xV8XFc/aur2vygvyno08Xy1TqhjMPKkT1HiEreSq8JzuHc0M3zYW1O4+KnTUZHyx3dHUGT7FFcUm57Osk0m435uLCWZYVTu3ANLyy5S2w6YQHPDAxqxjW6ZxfN9izgJQ8qarWsrKfV3yY7wolgI71nGNdsjHAEmZKJAGdJFYMPnB8mUjDXQXo5dk9EBsCZbwxKHmn/UwU4jFOchdVgz4y7ikiqv8RUqRPGykQ1G1oROa7hxYgyHA69egLRAjsKOpFXjy1WpIsgVbU6oLjhpbomw/MFfpw1orrWFPkr4Hoq9Q1W9JvYQeV/Bxf61T5w29NyZqsH5z6CEW9PjZ1lZ+H+BNF0tGy/vNS3dkbEp84stPPObIjSlAQIaLpNOtNARVcAhaooUsz6H/lmI/3Lr4YBh2KhJc5x7IC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 13:08:30.4102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbf22dc-1f0d-489b-f351-08de81cac9ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7899
X-Spamd-Result: default: False [-0.15 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-6204-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vigneshr@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F8F828D448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 4:47 PM, Akashdeep Kaur wrote:
> Restore the RTC HW context which may be lost when system enters
> certain low power mode (IO+DDR mode).
> Check if the RTC registers are locked which would indicate loss of
> context (reset) and restore the context as needed.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

> ---
> 
> Tested deep sleep with rtcwake after IO DDR resume on AM62P-SK.
> 
> Changes in v2:
>   -Updated the commit message as suggested in review
>   -Link to v1: https://lore.kernel.org/all/20260311070214.3589965-1-a-kaur@ti.com/
> 
> ---
>  drivers/rtc/rtc-ti-k3.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
> index ec759d8f7023..e801f5b9d757 100644
> --- a/drivers/rtc/rtc-ti-k3.c
> +++ b/drivers/rtc/rtc-ti-k3.c
> @@ -640,10 +640,18 @@ static int __maybe_unused ti_k3_rtc_suspend(struct device *dev)
>  static int __maybe_unused ti_k3_rtc_resume(struct device *dev)
>  {
>  	struct ti_k3_rtc *priv = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (k3rtc_check_unlocked(priv)) {
> +		/* RTC locked implies low power mode exit where RTC loses context */
> +		ret = k3rtc_configure(dev);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (device_may_wakeup(dev))
>  		disable_irq_wake(priv->irq);
> -	return 0;
> +	return ret;
>  }
>  
>  static SIMPLE_DEV_PM_OPS(ti_k3_rtc_pm_ops, ti_k3_rtc_suspend, ti_k3_rtc_resume);


