Return-Path: <linux-rtc+bounces-3237-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F81A3C3B8
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 16:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32017188FAD5
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 15:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17E11F8BAC;
	Wed, 19 Feb 2025 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="EJ9SeYr9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEAB1DED7C;
	Wed, 19 Feb 2025 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979233; cv=fail; b=CBye5cINonQ5J7ciiZlUO3veBVieTpYc+2ZaMLwOo0M+OarSxkYDLnbHStnirdBcHTU4OjQrLXL5peDbuKeGYML0YyKpB4S2hI3dr4aVtlNMCyRMBA/dQ/IJ9sSFwR0ctZuU3npK+YDDSc3phJlSOW9OT9o9OUSR6cdrGCtBHvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979233; c=relaxed/simple;
	bh=RaPn3PsCNW0KudSAXfC/t1MhyGLRsu9zj39BN8KJ5lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ctyf7PHUcsYYq468UITmI7iidHpaBzwNRPzw3XlRk9GGmXMyG+hp/3nYL4hkhd2M07EvvaFTav859RxhJyx+4sEOZRgA0dgxIqr0GtmPk6XxxdJADFBlezZm5uG8zi5ekCXe0U6gE4iLDGAqB+dOdDOczOU+aaXKyeQF2lwIWh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=EJ9SeYr9; arc=fail smtp.client-ip=40.107.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfD1MmizEdtna2+THGlO/GmpzDPD9T34z4uSTKy/hjqhluIFX8bP6kFG1OakQLMr0UWcUyKsh9Kbzw2r8ALUwK7Ft09FD1umKcAk5m6TiU/iih301zwr+1qzL8cUIQOQ3VjF8AOmTsH27sdzNe+BmCoUbREETQ4X77tXmzBANdoXOjEy2zpqti5SXYYJg5Kws36pJClBMdaGKajokZ4Q+GnIv4LvZjtiCm77FKNAhhGGwM+uyE8eMOo+tBTQl9rO7F1yK/w3lzdWMebbR5e7dLaV6A51Da5Lz5PyzBmG8rsbrtWkcA0UzMsAwI7w4JCi5GqJzYpiuIArIF3wgGHckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8e5ZnBVwktQkwMi2BOk9tmJ96iz1TSBBAxYPF8X/40=;
 b=AOBEg6/befUu/HdPXSVZsc7AQDpClsap0/YHGuPEutnJk9sXyIr4zQtB4go46P3JZRVx6Ti/NPQ7MHo/L4BubCMBAO5OTXRhPxZ3CF2zYownf2zZ6X2WNSnTbKR2Rxi0BUL32mUEJvRmO4kvF4z2733AYq48cr4e9cj84Zqg1Cs3DjQvXXIeexS1d6wIg8rR7GirBnq2ZiKY/0e6enfO8+Y7P4PP6TrRnV9uSNXbpc7WyGYYllkDz3JY0oe1HFaSKN2cC7IjsSzGCpzWnRKYfU86x1/AteuSn76KpQDdnFLRFl5pC6tebd+v77DLftGi2erZ/bYndyjfVRrs0ZhxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8e5ZnBVwktQkwMi2BOk9tmJ96iz1TSBBAxYPF8X/40=;
 b=EJ9SeYr9+G4yV+gYXINZ15onAQZHCXDJFlLJmNjToKW5286TnJDnbXQ3yrviBgFzO7NfWeTPimoexSHEtF8uoajsq+lJoVmzfJJaQjb9eGSBKpaQGqDuOxWziX1bZyTz5ADFglojHwgEnXmzLzliL2Pk+Aaxlt3lw4Pe6QGF5/gCD/aAJK/DntcdtsuPQuinqKihaKmOcm/lu9cR20vwYOfWNr9k67eyXcD1G6ul0sTG1jR2QGFudRgoRO7YCiwdbwOHkG2Jo7ptxopfXNzJGd5CNscXK9OBAWcoS43gnhZhdtkjQ9171kSg1DVZbxovYeLZujnCbt9JmFI6DC8zQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DB4PR03MB8660.eurprd03.prod.outlook.com (2603:10a6:10:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:33:49 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 15:33:49 +0000
Date: Wed, 19 Feb 2025 16:33:42 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] rtc-rv8803: add new type for rv8901
Message-ID: <Z7X51iji1R8X0UAJ@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
 <20250116131532.471040-3-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116131532.471040-3-markus.burri@mt.com>
X-ClientProxiedBy: CH5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::8) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DB4PR03MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d9a58e-ac44-4ad9-236f-08dd50face70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vab0Wpz6v3J1qom1fEwhX/z68fDq4nmvcDzNJdKA8auwglz7AgZr4S3DJOl1?=
 =?us-ascii?Q?qSLrcWWYxOQ/na1SWh1KEPGNPVPKAX6n5VLvyfJpfI1ewFvTKmxMLaC/HWR/?=
 =?us-ascii?Q?Urhb+5S0lDjo2jsBO8YaidlWqWPsSTmAsGsgsPzzlWV+E2ehHf1h/n3CyjBS?=
 =?us-ascii?Q?d6uIb3wI1xNVTW75q2b5bSBBddhII84G6zTmN9vEHs4zdvpZNqylWA2uUbT6?=
 =?us-ascii?Q?Qklv7O3bPU8hlR2yzX2sKyz6kTe07tilEQyCj0EbHbaqvvL062oXkzkRiLZ6?=
 =?us-ascii?Q?wBd0Djl2Q4A5jedZBP9YmkpwnCgYVebM39m5wlsPK1h1EJKHSwbfud7Wrq3e?=
 =?us-ascii?Q?kG+QuOBodJwZxWB3r6+F+Wv+1+M0yFsKeEodpoy3uAcuel7/5BoAWk4UUUUb?=
 =?us-ascii?Q?VkHF89thm6sbsW41owlPVd8Du9ZN7nyE3fhKwatjqUo+Ar3n1h4qxVflvQkR?=
 =?us-ascii?Q?rccGzLV3G4ruq3GYA3dc38w7k7P9TukzRTY73HBe/ANJYDz+2FG5nenj/MY2?=
 =?us-ascii?Q?ODe58cs7TEVll9rYD/AEV9zKiywJekhiVq+jzYtnY3QiOY+phCSOCRVZUTvv?=
 =?us-ascii?Q?F4wnd7syV/bQtIbWTgIATFLEzuehYRcNlH0Pfjhq8RMhErJlosqE9K/bTwi/?=
 =?us-ascii?Q?tyLsvszdg4FWqRge86ZwSy3hiVof6AIYEq5YXGYaLYMpSM4gLMi4QmFYjFea?=
 =?us-ascii?Q?lJrGQXL7eucIY15y4zyiyvvq6UdhbYSQC8Wj4Zzq7snFSMiV27Wd7Z010/IG?=
 =?us-ascii?Q?HXrEtC6tmkrRpZ4oTri01vbzPiULebVJ4LiYk8fsFxhTspifxAvmJlqV34SN?=
 =?us-ascii?Q?0kjPAF0XrCnI9UaNBUO1hrg7KrhpLWR+grIRdLBbhcT5z3LSCCB5l5ZNKJGN?=
 =?us-ascii?Q?qt0zGz2YwPAhF8A1CDcY7Xu/wsZc0VavN6XM8uxwgDGvVNS7ObKukU7X9RFM?=
 =?us-ascii?Q?lSCRiw8m0eKv3xiEOeiWqS+h3hkeNywBuy324qYrRaux4qD6OCQp1mHjvEYs?=
 =?us-ascii?Q?mdZZp95v/rBdjBdqZu/h1nhPKIn58FNWaszWXV+nS9xPs8Y10zKt+yMHkwAK?=
 =?us-ascii?Q?QBUk8iATTmKmykD4idCUz+Vqrf5GcU2xKAHWhFAkXMof7rvOjYXKQ4sSFdsp?=
 =?us-ascii?Q?Bmakr4XMqr9IGegESCMSaA+IhAKqq7oib8zp0ByW46esP47pI77GW794zgQ3?=
 =?us-ascii?Q?urLqgiIifRS1TvUkZ0teUHrugNNzbTS7yiKLsyvXBaZJylqf6nfc8D+ZNvC8?=
 =?us-ascii?Q?oJeSnBUzsGwxdBsuof6F+dbDCW1giNUjFcBNNUVQ9+b6YZ+10ixwLMJoweoe?=
 =?us-ascii?Q?B67gDaG+rtok7GmrTVwS6W/Rnd4kOXVfzY3VEp65x7Y1JN4kSdX04Uqvyz0+?=
 =?us-ascii?Q?rUkcZ8YbfFTeQoaXt/+XTrNfHuuO9REp2yXpodLSXSQc6bqIZurzz/fUzXZ/?=
 =?us-ascii?Q?52tR0wAXa15TGPuF/j09HfH4vm7mnZgQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDnIv1uxXrcI+7cIIDQVyKdgm4GX3TaCIQAaD9U9JhzUTCqPjZrBwjEmFI28?=
 =?us-ascii?Q?zHCU32g2ienIMT37Fzvjxr+oC0BiBCzkNACB5osuSFooMTCiJgar4N070Bhm?=
 =?us-ascii?Q?tHtTgODLzCShhekek3t/+QZQ/e++pXXou7k7SiMCxjQwL0pdn9Sf7mwFDflE?=
 =?us-ascii?Q?6iQ5o+UO70Ha47ryRV+A3CsWyZF55orPFcgY9Kf162vBNYDUs5+g+us5mqwz?=
 =?us-ascii?Q?QuCnU8QHAdfFTkK+gborpu8QUis2pmFMRLEI/6iSw/59PcUlFN6OCkB7A598?=
 =?us-ascii?Q?fRnrn/L7aKHsrAOiY1ebii9uBWZnyyL9RgMC9EpPLF4TEoHulhjrVDms6qQ7?=
 =?us-ascii?Q?a1+Ptfyo2X7liruTa3RQNRjO/DczR1UME75F8QsaGyYxRHjSC0RJ2wBy0Ey7?=
 =?us-ascii?Q?WCP9+sPBGkeSKPdUm60Urqh4WaY12o/TIB2IwsVIrbf8U+67uGRayuI1gf0L?=
 =?us-ascii?Q?QP0Q0WBUZz2gftNj/Zp+aq4uwAoUBOsMFKggec5YUJFCW15qt0ZTTLovO0Du?=
 =?us-ascii?Q?zmqWm8sIvi0Gvf8E/dJ2xgNp+bKMCHfplfUqNE66BltLnltYX48+7ZQlDNj4?=
 =?us-ascii?Q?qjXJFpZLusI9B1XnHU8nNE5EHay5afclFY79k+BF3EaO3gQliwMwZbZzZnts?=
 =?us-ascii?Q?4taH5CnjwQni+FztlzaRS1RyT5aZ8irW3+ZwyS2TLUggCog7PyLSrleDjSc3?=
 =?us-ascii?Q?ioT2TPvgh/TV6CDcZP1fa9548NR4UaUg5n98c6B5AZiVCl1WBCWzvaBYSr+O?=
 =?us-ascii?Q?XPVnRPLjmwV9AnBnXmj5IVJL9LtgWvUKbtQMUKr7J+anyPT72Fob7uqouNhe?=
 =?us-ascii?Q?DHrSxXfkU2cWSqNLtsfeMdXQtOFNCOp1yTCN3Z7qdVeKn7j0YaVdRmjBazuN?=
 =?us-ascii?Q?39x07GDyiFcnUU/7Abn+NtIJlhHqXTT+1Fcv5P7D7jtx67vKNdj+TNkq8EDH?=
 =?us-ascii?Q?2S9ekVR0nGJO/NnghzDSLka1/c6IZ1t77LlEfIWquBeDRyDQ/ObK5cnE5GCW?=
 =?us-ascii?Q?7AHi0ALCinfwg6SexfhCUs8eh16+5B07fm3vxHUjBQ0DZu3u6cEGvSpFjw/w?=
 =?us-ascii?Q?iqRRAV4xi23U9FZopCeO1bGZkalLw+A3SyqyS8I169BxRXM0ssaecuOtOeEw?=
 =?us-ascii?Q?T6wIV97UyBT/7a2N6tKjhfZrIfpwOecNhIaqn9MAAeik06dLUYNNE1zkSn3u?=
 =?us-ascii?Q?j1gyAAzC5NTHK0KwyINlm43gcvd0sgAsYWPNmcH3Ewxnflmb2CFVvziW/8+G?=
 =?us-ascii?Q?GUzj7yrGRl3J9VDS0VyYMk19PC1e+QXxshxr4iIv1YwHskDi3TcOxkdwudDi?=
 =?us-ascii?Q?38EwZcU+ideiSfV+wYkJLwaaDGSBMQ7kP+jk/6M16EC5PHxijKVS+hjBrBRY?=
 =?us-ascii?Q?fwk2YiEgZI+9lKDOZwmKIhPhZQKlbXc/9YCPvtGnmfEFgV5bBCuLtiH6LXtQ?=
 =?us-ascii?Q?zzTgWrF0xtQuPBCGZKVpDQimUyfbPEA5voKcwamdJ6TDlywHff/GXMOr3lLT?=
 =?us-ascii?Q?HqPntUTh0OpOxoXtqN0NRE7vepxdbk+zc8EKIZ6EL+sxdGtSMp5hVZVgG0L7?=
 =?us-ascii?Q?Lb/Lqabbej8L62IcUVQmxniV9YOxlrXkeS4YxXEs?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d9a58e-ac44-4ad9-236f-08dd50face70
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:33:49.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDNhI1x74ZN9+xQ4XKut7gz/GLPWUxwgESQm2qlAdmIfwIVYM0/6a+PiWnbVQZuf48w8aef++o/tdmTTyXVa9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8660

On Thu, Jan 16, 2025 at 02:15:29PM +0100, Markus Burri wrote:
> The rtc-rv8901 has additional functionality (tamper detection).
> To support this additional functionality the type must be extended.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  drivers/rtc/rtc-rv8803.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 1327251e5..50fbae931 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -62,7 +62,8 @@ enum rv8803_type {
>  	rv_8803,
>  	rx_8803,
>  	rx_8804,
> -	rx_8900
> +	rx_8900,
> +	rx_8901,
>  };
>  
>  struct rv8803_data {
> @@ -173,7 +174,8 @@ static int rv8803_regs_reset(struct rv8803_data *rv8803, bool full)
>  	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
>  	 * the Epson RTCs don't, so we manually reset the remainder here.
>  	 */
> -	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900) {
> +	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900 ||
> +	    rv8803->type == rx_8901) {
>  		int ret = rv8803_regs_init(rv8803);
>  		if (ret)
>  			return ret;
> @@ -635,6 +637,7 @@ static const struct i2c_device_id rv8803_id[] = {
>  	{ "rv8804", rx_8804 },
>  	{ "rx8803", rx_8803 },
>  	{ "rx8900", rx_8900 },
> +	{ "rx8901", rx_8901 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rv8803_id);
> @@ -760,6 +763,10 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
>  		.compatible = "epson,rx8900",
>  		.data = (void *)rx_8900
>  	},
> +	{
> +		.compatible = "epson,rx8901",
> +		.data = (void *)rx_8901
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, rv8803_of_match);
> -- 
> 2.39.5
> 

