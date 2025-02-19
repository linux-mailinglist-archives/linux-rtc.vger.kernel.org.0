Return-Path: <linux-rtc+bounces-3239-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DBA3C4F2
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 17:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F22117B5DB
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 16:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784011FE46A;
	Wed, 19 Feb 2025 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="GpxOnN5c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8903E1FE469;
	Wed, 19 Feb 2025 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982239; cv=fail; b=rd3X8X4tpk6iCqTTHmSWKmHu3sGR9qYpMnu+HQOJhdOypLIsBFHwyJwdmTk6QTRrjBFwLMTD5RktoiFc2NJ1Yvro3NFvJC3PSCAqrf7HCgQUyPmZXkQtOb9J/4uMBtrd5Rh71osnckEYtgcTAbgB3HD2WWOSxb47I0b86/HwP5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982239; c=relaxed/simple;
	bh=JtLb3V2v26WXatdwaZxzFsoT2kCIQkygyNxnUxZYg3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=duzFjloK2ifkG3AbfHU4oLW85zqMj8M3/WntjkG4lWWD+mn8esNHSAj9LccW/zP5r3dCSc/SVjwo2gecElUnQg5LS5CKp3zoi3XPiiUC65tyK9WIIMgUvNN2VkxOel8NHe783ML1sJ+u90ckw/bm67CMAcWj8eez6FngVM2JOeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=GpxOnN5c; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFHbcm8aDJlU1CbQ1sRlnXNkPFtyazzegRVSYFZfEKhqVACp9Hoxn2MOxrllzQ9cYp5pIpvK28smMHNwdc81LgSuKNHJMzuvpv5xUlpfpLkWfo/sEhEFm/2+M1nk1EPoffT1H8pari5sESrHY/6KktelOvA5OqmVS6EpHUgHPwLkx+g0mp8y0vQkk3QxY1Lf+4aHbYVuOSmb3fM4Z6nIQmfQHhZ0wsb2wVQ7d8enbRXLDi2HZu2/R+2IaR8lFBEmFdoGzNLfYiSuc8sWDpOPztspQE0R+Qq8OP/tiW0a8UpYwp2xZktPHABnGGDmoZMB1oDOhDeoCCTIkJLoNS4JaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acWuaP7/tiffKcycS+rRgZfZGxHSkrHJbwJhE0LtJN4=;
 b=JOdmvIWZLzAYVl34PQ/7pMPmDfNGL8RWufecFaWOmx7XJzqeDJ8C91TiYSGg+6+9Iyxehce0ZjPc4VsH+r3CGTVz9IVFFj/fiMu11NEmb14R9MaE6KtMOI8f3dPze0RF7kx9ZKnQLDvH3104UxAT3PlzogY3om0AmNNYgpctgCCeFpJnZoCSD0Plmu0VJM1DN1IFRIoMq9LRWfDaYChwOLH28RYlUFYsBi5SxhIRwFP2YCbPtl+UPek1KPAtk33Rn3YU4IApvuUKZjYRYIksIR1VP0moYtphe08hXyiPw29tt1rgJQZUmsS+Bt7cCZohOW8sxbewLeRhxcNmIb+crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acWuaP7/tiffKcycS+rRgZfZGxHSkrHJbwJhE0LtJN4=;
 b=GpxOnN5cRBUVy52R+UzZ+7zN3ebQaXxP77uQkyPxksQSFYVyQMVzzf10+6ST+mnPpHPNVeYosPyiGzANhudhAAmTX24h/KR5K4CS3iYZdZ5WQXwHB/BbVqm6nAPcdN3MMnkKZSUh0N3ATjNJsYejXsfxiFuKM+nMTohc/f6NeXP40W2xm4mBRRmgLzUFO9Ign86s/1VKQldjpJGU73UUvD8VBDRnhiqDzeXQhEgJq7oQdGY3tLFfG7m/ESIvGA67FWkYJcbI1+2HqLkH8yaU5eGJU45HKYS3aGxWPgb+R7urGSGNZ3DN0iQBby1I3LQfFwrEhJBU7zMN30WneduufQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by AM9PR03MB7186.eurprd03.prod.outlook.com (2603:10a6:20b:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 16:23:54 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:23:54 +0000
Date: Wed, 19 Feb 2025 17:23:47 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] rtc-rv8803: extend sysfs to trigger internal
 ts-event
Message-ID: <Z7YFk_SqDaucs092@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
 <20250116131532.471040-5-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116131532.471040-5-markus.burri@mt.com>
X-ClientProxiedBy: CH0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:610:e5::11) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|AM9PR03MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a99deb-947d-484b-2b29-08dd5101cdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wEwFAzk97Npciu0tVpTN+spqJpLcmhzLWDpX5HYJGy6sbMzMMesRBPd6KQps?=
 =?us-ascii?Q?B383F6Z0vfCR6sTuNyJsE3EBxKQMIPzvRJ7JGtsVkbftxJKZa8WSxSsFhX/m?=
 =?us-ascii?Q?nQfjQmx244dIAq/RVgk44SVtEb3NjPG4wCPECJ/mWHS5Djozt77gDynJPTPK?=
 =?us-ascii?Q?Y9KUCSAojRfcEZRr9woe829inKDXnoY5YvjP9rtXtszgUEl2WuBesFHMZsrN?=
 =?us-ascii?Q?EzVhSkJiHvQMuh7yVVQjMZfolt8UpbGy606RkZr/VOg1YfLM/Bka+/vp7GQK?=
 =?us-ascii?Q?0KUS++hmKvn+sEOKyqtrVVsBpetJKVAoyxFID4Ct7+/YuqXl7Z1yDLZcjlrR?=
 =?us-ascii?Q?nWXeaDyxizj4NDMqcb3W///UPjFXGlOKoeEycakF3SW8FOnblBh4GnK9h63q?=
 =?us-ascii?Q?PKdxqmZCbgzgtI56wgSPG89y0Xv33ZpJ5s58ZLgxX9Z6jo9/g39oOU6vk/uZ?=
 =?us-ascii?Q?ieKaWwOUMumfivL079m48d2VokkrTUPRpZGX6sIPVjDu30e5OGztI16ksJQ9?=
 =?us-ascii?Q?zHtF5O1m5FW1tPGp2aUQ6u3a/qGyyWpj3HKjV0gVy/hocPAbxUXRli4nyuD6?=
 =?us-ascii?Q?zMUE/aee5LXg0TLZw+qTsRGRy3NFg2eaj9GeIRJ/6W6cgp6KWctdPkml6pKw?=
 =?us-ascii?Q?wzADcAUdV4x1OJY6o+tc2JFMlC2eZCfXJXol5caZPiR9ikuKmkZo7zFs+EpG?=
 =?us-ascii?Q?Tpwyog3Phbim9vgDQYgmeovt8l+eU6q5NLHaNx3cQxFc9Bu6K5WjADe67VGE?=
 =?us-ascii?Q?7Meu8fflz9B8Vk2oY6/207qClcjlk8GKMNflxtiOVhbZT1BhDZ57Z51RwAad?=
 =?us-ascii?Q?v0s3PKmF+39kDN9XsFlfwRVgcEedyrj0hlCS3ED1TdYXcvz2rVsU0WcCarMZ?=
 =?us-ascii?Q?GQQnDixhrXCxnGPVMsWEZL6u60I5DNcka36DnX3qY6Zg0OoapTNFf/1u+5W6?=
 =?us-ascii?Q?qaC9p5Cqq3n6KA88zYGGPLFkS/AcloQdb/8aj7Ep0QHypI69t2spW0IImqd7?=
 =?us-ascii?Q?XvSMRaLtwq1t/YcxPOdH0dVCjYHKaTGeqnmgzv0tLskvRwHvVeFN/gnvvGRZ?=
 =?us-ascii?Q?eAr+EQVQWODVDnGxHOby8O1o+4GJj5GQI3ANIBuVesD6g2l7FImMSuhaYMNj?=
 =?us-ascii?Q?WIYGFE/65XOFZmqrsxrOywZC1xw9+uqVuX4yRXvCXBQKlxLMmBrE9QZoSXsL?=
 =?us-ascii?Q?XQ1LD0BOKYA+AdDQjaCmknL0WYWsIEOgsS8izoZgxw4AyIsW+x/WiU70FN/E?=
 =?us-ascii?Q?SZVQlgT6BoM5RL6YwRAEUJ/K+cpAjjtbZ+3bWbae4ypZ1r59IsLjYctXOc8u?=
 =?us-ascii?Q?tLRXMOfSb9r9QjGGi+hN/FeY+JKOULdDJsdryWCU4sK0mF4YRp6gej/kLsma?=
 =?us-ascii?Q?MZznfvukxGX5qNn4nr0AyVDh16ewLFgnPDf0YisvIjtoiNtd4Ed8WEl4tZf9?=
 =?us-ascii?Q?+mY+kTBAD+UuiKKnAMhsk6ier97ezXSN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aozmmgBghvoihEKNBnKKJ3G2jhBRg0HIij4TlH+5e+VIiAiSca71TnqhChbO?=
 =?us-ascii?Q?5i2JupdjN1Dl/oz7RXR0S/qVDZiNVqpAByxpdblue5pmDTvm3UNqP7jckurB?=
 =?us-ascii?Q?NIIHHkJmGC9o3PfG7I0u/WiXo5Hk++7sNnQDghAhB3kTo3O8hkA9H3WVyJ5F?=
 =?us-ascii?Q?6EA5FYo/AUWUTANw3ZkYBhI43VjwVQZhhIBw1cdm4VuAH6faInO4bxTMbUNw?=
 =?us-ascii?Q?rQ4YxcJh0/PytYE6YtdVSfg0YZ4hoTx+XwV9GB2q7lusBE+KrWqa+KXbIbKg?=
 =?us-ascii?Q?rU9P3lMMjV5v8vAYVwW155NVp/YRYR18/FhuoqDa0kBJpM8USUyYmva8UPAv?=
 =?us-ascii?Q?6EVF7lADyjbWkbAF4bIXuPj5CZocsQ/DWwmzMO8UhQ/374Fr+jaEWjTx3igy?=
 =?us-ascii?Q?80hlXJZekyIOpyl265gbeysjBVhb5bfmLzT3pcwNDKJZyok1K2Tat99u5wIK?=
 =?us-ascii?Q?UWMbVIghv7V2sYrTpOVIn0oXLxgn/2qlLtzCwP11F5EA1Tw2/91eT2nmvJ1B?=
 =?us-ascii?Q?ww49cKg4o7QnF5JC139hSQIh/ohi0Lz9dw1paXM71KbuKyWpkychWPXieM69?=
 =?us-ascii?Q?85LyLSWGSQORoNox5rXMHz8OCMyzb50aM7lTLJ+ZMGAlGvk8Xg3WhOEx2j+g?=
 =?us-ascii?Q?RfyGqgrd7cQDu2UcysEodO1w7jS82x2dzGbuFhVTzLmwR6BCAuhItTjJJzMJ?=
 =?us-ascii?Q?7ZBmGwkrPb07t9v90hLCqWYJCH/53ZcyAZL/JGiYH1XudMuB0+F/koS9CEZF?=
 =?us-ascii?Q?frxn/HHQTOu2jKmE1ofB7DnEROgzr3GyE9XIt8Nxald87MxlitGfdWCuT+kS?=
 =?us-ascii?Q?AQ+WnpghYYKBf7vlkQx8M2XooCqAyMb8VvfVj7M6A+Eh6KJnKXiCJ0MrDKta?=
 =?us-ascii?Q?bMW8z7HVIGsnMjbqm2BeYzyKGbfGBr3JxZ41MFQGiMv0KYFWN8GAkUrOlL3t?=
 =?us-ascii?Q?kk3pMuphUF+aYKU0aC3dzQG1rU4ktlb6zxmmEyfV4pTr+ZSPr5MEN2LfT5mR?=
 =?us-ascii?Q?jL/Mb/MG4zTD6J3+d3QHK4EelLgp2zOVnMiVwer/EIXcw/ig1hKWBeh5HTLW?=
 =?us-ascii?Q?TZHZyRqvCP4l880L7mRUxAnnsijmvVLFVgzdgnUzNV4qwggziIhleCQjXj+W?=
 =?us-ascii?Q?v+dZE8K+pL5E8te5tKm81zcHyVBgzuU5GinYLCVHuGmPQjiVbyU9kS/2VsML?=
 =?us-ascii?Q?2+c4r2UKo2fC5hjS0z8UKh8CzsJfSHhEv635/QH0HVfkZbVzvw4mxdQA82QH?=
 =?us-ascii?Q?/3BldLNHALHWneUS08SdXCGI098Nt6/rJFh0+6uG3ePH4OjseZc6CPFgGOQx?=
 =?us-ascii?Q?6n5j5TnXzHQ0bSO8X5nG4L0fnbIo+r0fk5ttSu1GH2lVksqCDYRhCetbqy6W?=
 =?us-ascii?Q?YzEyaVxIXd4k96ciiZi6uR2eZR4rR3o9F3qLbTq0bmWrXbvZKen0S2zp0XFM?=
 =?us-ascii?Q?33US3YzGikc/1vOq9rgB2PhPeeXkkfCCH1LhgPi0hkFPRUKxsnEwSoRqBOKp?=
 =?us-ascii?Q?JImfap13ZAB5frjHxt0a5VOErBf7T07E1dbS/TEIkVvwxZWFVzo20EluPPLH?=
 =?us-ascii?Q?uMiQ/+P0m3dN+z0kxw+Y9D+gXDVcAPtUYnuDCAuU?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a99deb-947d-484b-2b29-08dd5101cdce
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:23:54.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h0hZ0IY571UcUgRLZ9RayfPbnVWTiISo6zGWKRTlCv/u1rs5/IBmd+yewI38n6fReU222qgeHnjsaSWGCLcIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7186

On Thu, Jan 16, 2025 at 02:15:31PM +0100, Markus Burri wrote:
> Extend sysfs to trigger an internal time-stamp event.
> 
> The trigger function can be used from an application to trigger an
> internal time-stamp event.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../ABI/testing/sysfs-class-rtc-tamper        |  7 ++++
>  drivers/rtc/rtc-rv8803.c                      | 33 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> index f035d0fa5..2fd6578a6 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
> +++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> @@ -18,4 +18,11 @@ Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
>  		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
>  		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
>  		  EVIN2 changed to high.
> +		- "1234.567 CMD=0" for a internal trigger
>  
> +What:		/sys/class/rtc/rtcX/tamper/trigger
> +Date:		January 2025
> +KernelVersion:	6.13
> +Contact:	Markus Burri <markus.burri@mt.com>
> +Description:	(WO) Attribute to trigger an internal timestamp event
> +		Write a '1' to trigger an internal event and store a timestamp.
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 764e654c2..ca3a19162 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -904,12 +904,45 @@ static ssize_t read_show(struct device *dev, struct device_attribute *attr, char
>  	return offset;
>  }
>  
> +static ssize_t trigger_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			     size_t count)
> +{
> +	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
> +	struct i2c_client *client = rv8803->client;
> +	int ret;
> +	unsigned long tmo;
> +
> +	guard(mutex)(&rv8803->flags_lock);
> +
> +	/* CMDTRGEN */
> +	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, BIT(0));
> +	if (ret < 0)
> +		return ret;
> +	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
> +	if (ret < 0)
> +		return ret;
> +
> +	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
> +	do {
> +		usleep_range(10, 2000);
> +		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
> +		if (ret < 0)
> +			return ret;
> +		if (time_after(jiffies, tmo))
> +			return -EBUSY;
> +	} while (ret);
> +
> +	return count;
> +}
> +
>  static DEVICE_ATTR_WO(enable);
>  static DEVICE_ATTR_RO(read);
> +static DEVICE_ATTR_WO(trigger);
>  
>  static struct attribute *rv8803_rtc_event_attrs[] = {
>  	&dev_attr_enable.attr,
>  	&dev_attr_read.attr,
> +	&dev_attr_trigger.attr,
>  	NULL
>  };
>  
> -- 
> 2.39.5
> 

