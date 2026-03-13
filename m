Return-Path: <linux-rtc+bounces-6194-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN1vG0/Ks2kqawAAu9opvQ
	(envelope-from <linux-rtc+bounces-6194-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 09:26:55 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B027F9ED
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 09:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B67301A723
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 08:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DB4366DDB;
	Fri, 13 Mar 2026 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VCYZPEbv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF431714A;
	Fri, 13 Mar 2026 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390244; cv=fail; b=NHmOk0oDoAywfGlmC8xqjka2snAKA6mpvJvN8BU1a7R7tSL6tjKKFDHxbDof7FG1yavJKHu47MLYAyt5Sp/VxK/7R1Xwfpk3LDJav5aMmf3KWgat0iCiWeTv429lje/se+fxIoueysmekeHgNM/K9C0XwnFpRo13vdCS3vtrvlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390244; c=relaxed/simple;
	bh=gfwVFrj2zhZtch92wPZiBnF2fgJ7nlp6hptZKfyzAkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cNyuZXb1KDBFuO1eeqfQqmGiLEw1eM/dlCrjJFQaWMY1po4ht4UFsYa8dPYZxW5P4ZMwZqhsbVmRZYSBMuJbrPRRvU0WFT1CYkcVcI0N4ppkdgc0qM1XGzWfsKOyHYikKKGTyVUnvSMH5DxbscXETFfAkARUlTmsrgiuaGoR60w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VCYZPEbv; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKcipC5GMwdPTVT++S5aSDqHQ+fm3jR/BpT90MkxW7UzViNPzgaYTMv/0TpjG5WC4TNrnJtjJDPB3BxVrJu6oIXRMUo4nIbNcw7gwjZ/uosXdiF0swGAw47yrflj6hRiIuHn1YWJOjb8NlCz9U7hsngqeB+RfxI+WLZHylOTC5ZDWBy0ejaV330QMnBln6x7wz9gZPgetg7Hw4sRz4PGzspYHQibD30tPXej60xVVTLDlVujAJn9mILLmJmHG32NWsUFZAbDTCseDEGPE7LMjypd6M5FIiVdD0vI2mDnHqdY41Ho+l9rFuH2va5AqlIbVBbxW+feIfG0M0hvmYKCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euk2oIs2vnoJI/8LL/xV1mAi7f3fjkYUdfbp5BmbWww=;
 b=mpbhMhkKxCDukzl4xHclNRdKaw52V74ZoDPwQNh8olFYTEclIAe0yhDGghi9uHfo/v9b0HNEG08Dk/jhVV4WKNoKLA3hQ7vPSY3RF4tMRJmOYA0/tbVCx9ybrrZvDBsOHqzzeCX28XG/Dy4X+hcErFwbuyz8kotPtMkY6AO4GGqJnwZynsLXXFGu7Ger4RnEY7Cux6P7DFya5tZVE/cBCQYhveIqsDCUzL87gtjBTaVCO4MB4DjnjljQkKlG/i5JswYn+nLnRDflgrzYjsVDmRk4hgAzVb1Mf64rT1t79An/y55oigXRyPX9QxFNv3ZYD+nwlxxgUkhUFSp2qkOi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euk2oIs2vnoJI/8LL/xV1mAi7f3fjkYUdfbp5BmbWww=;
 b=VCYZPEbvVva53tBPaxNbcspVrCxiaxe2sy5xmwlw0m51v40IVM+iHrzBVprlbTUmesU12H8PERQU68BIn3o0GDVd43Kif/X6tRDzHTVGY0WJgcGF1u0PtGU+goV1LKgtPZ21YlOzXX7YHxT6FzFie2HgjIzEGqfw9h6ioH0Szcw=
Received: from BL0PR05CA0029.namprd05.prod.outlook.com (2603:10b6:208:91::39)
 by SJ5PPFD1D499C15.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 08:24:00 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:91:cafe::35) by BL0PR05CA0029.outlook.office365.com
 (2603:10b6:208:91::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.15 via Frontend Transport; Fri,
 13 Mar 2026 08:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 08:23:59 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 03:23:59 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 03:23:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 03:23:58 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D8Nt9l3898331;
	Fri, 13 Mar 2026 03:23:56 -0500
Message-ID: <04d217c5-e95f-4507-972f-6a8bda201bf3@ti.com>
Date: Fri, 13 Mar 2026 13:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ti-k3: Add support to resume from IO DDR low power
 mode
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <msp@baylibre.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<d-gole@ti.com>, <k-willis@ti.com>
References: <20260311070214.3589965-1-a-kaur@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260311070214.3589965-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SJ5PPFD1D499C15:EE_
X-MS-Office365-Filtering-Correlation-Id: 20931760-aed4-44a7-f2b8-08de80d9e099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	M5uBVNa79xtW0xz1eg5oaK4s1unMkHnGaCjGcv2xW3YVSJkvlhjmXBjwF1HX4toFWz1vokgojiqiTlaLvl33jfBnMB+sj+cLz4BIhpHwaJw97icreviz4iFIQfNvuIcm06rdBrZ7KC7o/wS9NDTggpTzbSITooFfLU3Xs59xzpZ8Tk03b+5flU2+jMK2bHmWTYinq1CEZ0IpgizxTBFtowkKoAFNrudkeNatyivR4GjryYHYic4fi4fRGvT8nFe+PYy6Uus+K0vr0qsi+5lab1dngxrna7Vueyz4AEIXmjTzvJmT996MCsr5lKH4011kVuqdFopsvERRnhmDtzClfAwwSD4BX6v76oao4B8QOTYp/p/LgiH/WB1RTNAiENqmlD7EPE4CCEkNnl1/lImAO67iJNYNZZpo6uvauVmPziR/vPmWa/m+MKdf1l0xU5R2x3G794bzlo7cSszdUMySReZHwjqPPz2w22vt0nL4USvvdQe9knnvwsg7QeIlpooM54Y+d9rWl/FUr5h1W6/fUG92D4QGCBb+unL3lOLWKgjWonIg75ZzvLZhgnqj4TBbt6M5meJb6P2MpcbYBakMuMIh8oFnORQIGsya/xQVuYpVNLKs7qXO5ZK5YTLbpeVVbByHswzrgiW7R/+i2/WsJAY+gXf0dXbz00cJ4HtUOlPklxRSVRVD8lOlSRuty49pAlKH6wBI9cC6CO0oGrY1RnLzl+gmWF7IgiXNajsTv/ti/j1ijNMB5ivKdNhGqxtC0cdqKYZbJQjMkkZopNlurQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SqIrVIfvIfnGE9Ht470D0bvpSbBk+tWqMu1LvzuUhfWUiBG917T57dakqoLa7jplA9Y5uOQ3z0m5V2mjuhuTtY50i4yukVN8w/QQefmH3mjFPoNIOPVjGmKhYKJqngBPNvkGc9hYfvFjsCFxlaYQe1HXN14IqwcEjmKz+govu+Z52nOHmckRcUMpovWbRlv+g8/PO0kGKC3EMO1cRLGYZccs5AUI1XSdVpRTPt5pIgLcnbHMs0TLjW+5xfDFNfVU3aVsmgZDuTLKExOcFBCoqUAVW1Kkezo8trFO1i85wVEQ4z6DnDbHaZYXwvpZOve0jVymrEQ4/wyzS683k/uVSERu8B+WKcEi5emE+3B9CLnZVfijZx+KTqQPs7xaW7qpXZQFVfKsIaHMb57JhMgtA4EI/Uj7KAwrFe4xV6gzxsNy5HUhwPWRWYG96WuuJHME
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 08:23:59.6458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20931760-aed4-44a7-f2b8-08de80d9e099
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD1D499C15
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6194-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:mid,ti.com:email,ti.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vigneshr@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F00B027F9ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 11/03/26 12:32, Akashdeep Kaur wrote:
> During IO DDR low power mode, the RTC IP is reset and loses its
> register configuration. 

> The DDR memory still preserves all driver states
> (reference counts, software context). 

That's the definition of Suspend to RAM

> System clocks are saved and restored
> by Device Manager (DM) firmware during the resume sequence.

Not relevant for this patch in particular.

> Add support to reconfigure the RTC IP registers in resume handler only if
> resume hook is called during IO DDR low power mode resume.
> 

Above all is probably bit too verbose. Below text is all thats needed:

Restore the RTC HW context which may be lost when system enters certain
low power mode (IO+DDR mode). Check if the RTC registers are locked
which would indicate loss of context (reset) and restore the context as
needed.

> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
> 
> Tested deep sleep with rtcwake after IO DDR resume on AM62P-SK.
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

-- 
Regards
Vignesh
https://ti.com/opensource


