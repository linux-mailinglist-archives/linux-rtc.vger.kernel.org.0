Return-Path: <linux-rtc+bounces-3342-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE6A49D9E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 16:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4796D1899B16
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F885170A2C;
	Fri, 28 Feb 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aC8OWdm/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2074.outbound.protection.outlook.com [40.107.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371251EF399;
	Fri, 28 Feb 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757087; cv=fail; b=T8mFNPMmQGoCnHPOFOL40Tkm8vGNwib0ldYilv23C3OBvNUsE1IKSUrzhqqWjbI7kT4xJbiz2M8rSCVK5h897sdyWheomMcml4Zu+WK/jtz8PYXe7jQjmuGlSWq66CJ0yyvRIgkqwwwt5EMrCcLlD1G5mnluTSWajiruow6l04k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757087; c=relaxed/simple;
	bh=pRvFGEWkMpfTIx8VquoJC3lSmqkL4yUxVdB556I7WuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZKKwJY1W39qXyun/JM9MkVSyJHf4g7alcGC+SlvZ2c+ZjxO22awV7fvsu9F19nU1b8J4KpKCeKHDom6jJcBFHm4klkEzIOwZ1xuDSId5jzMXCHFxFgJrXAmY+ORg9GfzuUuSAAaWTvJ90B1cylw+jKLR2wthrTSZE6Wd0rNQnVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aC8OWdm/; arc=fail smtp.client-ip=40.107.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTF4a6RStoT2bBbMv/h8+XpyQpBBQyM4bYkvC6NnGb92c2xQszm6QuauNdu89GSqRWJ69r2PVl8WUMZRxy57JdatDJLWLGBFH8zXZVGiJFZMxUltW4UV5I5MkTusAsVULyRYRUbJuAphYSW8g55Ngt0p9MelZyUvnn7o+1qh2PD95+f8Jwtng8SPZGXLxTe4UW5kmLcWVes+2a3xvxrdFawudbKDD2seI7/43MyHf7A3nTANMqV98CptZfeZRyAQidH8f45b3145irUXjWL6TmXiER6nbcGyHevAk82sWEw7A00rL96SvqwZtKPrVVtdv7JSRVTmWDNaTVaU4EHgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPrdJFRFn59ARtf/d1tXroJOa7V4JrIR97fj2e3g0jY=;
 b=riWxyzhlzjFn0BpEBz5PsXrrekV6wwmmaTeQab0yMcBzQXtA93CLLzrE7O8Fn4TMDN79Tb9qGWJ6qwYNzKfxXsCXyvVcWPDfCoq7WV/lTNF98sEW9T9ObwoP4IWR0MO+TezEOYt6dJVKgnZKmlkbtGMD97yQe2Om8/2vZJKjDsiNO+bcIge+g71iFY9xiRODuIfdF60Gau3kQHYpVmEaFH7B2ZREOf8rO+PUsP8u/PRzx2kEzmOGzE39BNvSp1TxawkR9kezNpsqXcSPQEmYfIuh5MEi1CVs+EpGCGqpD4bPdOK/Exl8Wq33o98NAri2P/Bl7ab3K5c1gEyQ54pe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPrdJFRFn59ARtf/d1tXroJOa7V4JrIR97fj2e3g0jY=;
 b=aC8OWdm/zq5Qf4XR9jC8+G8kqb2oPpLPoa1cKYCe4E/O8m6Eo3ZYldL0aGrHogYD8ckWjJ+S2aEiiZUxH3QFgSmmu4XCWTbowZ/qYrwvn1TBOCe7fYwIKNnrX7gQTgVqSz/CddcDPnYMMAPR5tWAubv0QyHBxqoRFGXrH2KP58hR1qREoUI6/hkzbDnes1ttcUDryw4V59W06E0ccQM6MRLJTIVqxzQEREjJYqKv6SYuViVkRQzxy6jnvpAGIJIMKqMsoPS4M3B4FMKlD3zKENqpdSM+a5H7vaqQnyeewHItxARoua1fRZXcs38gBHoecGaGykdbEWQtfyoko6IKnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 15:38:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 15:38:02 +0000
Date: Fri, 28 Feb 2025 10:37:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <Z8HYUDy/XG+IYi9l@lizhi-Precision-Tower-5810>
References: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
 <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: faf3b1e6-fe9b-44cd-7bfe-08dd580de2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K7P5WTzEbAjVAzSkPdK8//CdFhC8Sc2hmTT1FNQ0LRIl6DGZNNXscZ/8vomG?=
 =?us-ascii?Q?rNuOAl9iLXLxM79Fr2tEQWUALNOK9Sk0T6qlENEgNTJT6ixwx14FnIM187CB?=
 =?us-ascii?Q?2MuDPQpNrIWpjkkMghU+GQPkrZt0BKPZbRX21nHnZsHr5y9w84rpD5GcRPs5?=
 =?us-ascii?Q?TrXZxYV8orczW2VsghXEIhVsPyG7aYrk9uf3VsWTfuJuanMKo6riGBLDiWJL?=
 =?us-ascii?Q?ubjJGD+y8A31lKPGqZ2vOkTg8/Oq1Cz29T3FGXFAC/E7vZyy/ZYqYmVtlG8R?=
 =?us-ascii?Q?Yrj2Csnw204ENERDZAaq52fv3P5E/gimzN2mg9ZaIcqFLQvsWwfeU/ZoKkxo?=
 =?us-ascii?Q?d5t8rHo5u6H4N2FI8J7rG9agwA8KQdjB/th+eAaZWNXyEdYamghl6aGrwUYM?=
 =?us-ascii?Q?ADJmkN3VmUsvo1YfCNuU2phgdTE1DqGiyM7HcxPedrQ+Pcyo1Ac5zQHnI3pi?=
 =?us-ascii?Q?psbG/uv4iAaNoF+Of08cTDyDShG3RY8gsWYptZKGUzzCvX+ba0OR+SN3foxW?=
 =?us-ascii?Q?K+uT0ks0m2fYxUevVEwW7qTc+MbJLEoODI5UiP9IB1H63wKDPWAx5ClU9/R9?=
 =?us-ascii?Q?rpA6nUnqbagKdvym9s80a5CCkiKSKEO/FaKtcaLlpUwk7dhxbZDPVv7hZWx6?=
 =?us-ascii?Q?z0VV4AWhXZX+W2f2nx8ED4Zzobn1cNhvih49TcXpdCT9V2Rs9aplyWFFGuoK?=
 =?us-ascii?Q?3U/zQCB3a6LVFJel+4KAzTeBCTmhXrtRYJXllu7isytyPfZbyuQanXDW6/N5?=
 =?us-ascii?Q?9RO10KuJybV4ei7mGxz2PnKhnJQEff1bzLfWhfJSQhZBQzxM+Oa4CYB7NGa6?=
 =?us-ascii?Q?CTmNQ2tLd2XpqOSw2RhI9iKmmN3Tz5seGWHmH1VSKYTUXX+VHPDTXJqXliV4?=
 =?us-ascii?Q?QgD1QJQXOPk+ecTU47tgzJN5apeaHQ6ICduCW/Vu36sNPW8msUYj5QOCEpoi?=
 =?us-ascii?Q?a2mwf2/Sq6Luu3cAWPTq6qswnVJNnJryUk7hVzs+4IPxu4Vy8ViCWjzyTFq1?=
 =?us-ascii?Q?3eCMslwZZUQLGgOKaIgDsSJcj/EFJQIS+oywkNfQmxP/U8IMeZYy/wdwC+ER?=
 =?us-ascii?Q?Xo4SYmgAgLrLxn5/pNxwUf53AaBffroqVj28sQwy1LJqqlEhh1DTkkZA3Onw?=
 =?us-ascii?Q?wrbCCnEqR4hPU3v7SuTokbIzzs0PNUDTjgGuheWdoVMEq6f54uGsEeeVniit?=
 =?us-ascii?Q?YmIy4UGmPyDQkrmrUT/QGcWwVR3Dgkg5a1JGYkBsJY39L4Z7F3r84EahPQcS?=
 =?us-ascii?Q?m2LK2heGay/Oi+2cj1EuKZjDsspYMSMjT6DhjZ3AVoBmiQY3amI/OZ8a62JC?=
 =?us-ascii?Q?yoIfyyHfZFpJgEmI4kUtsN5nOjZMHNsQ0LHMbXuLr8xGEXP5GZU9WCJMSr43?=
 =?us-ascii?Q?nw6lf3sVAbstBZXWC/OJRKzxV30wxIQ5p/dtrzIUaampa2iKxDsDNLfQy7Kl?=
 =?us-ascii?Q?81wDccuTHQPPjfld+Ncl/PQuvSdZjF+9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXbaZPb4+O9SwZ12VHJkkhuu3b8wAdet8WncpvVdpVVdRRt8ywPmHhRg2woP?=
 =?us-ascii?Q?4VtXnFJNJG7MA0wcpzyv677kj8Zo5IPw1Gw9A8msTQNvvNLN+Cst99IMD7LI?=
 =?us-ascii?Q?pr18BBsUFkeq5a4DSgpWgDawT2SmLZLFFievP4hSGrnR78yjx39aF+UhYJwN?=
 =?us-ascii?Q?chmADD1L9BzX/0lrcOt+t68iMm7SybmUNH4PIxbDwo55qlOedX104ic0dArM?=
 =?us-ascii?Q?o2+6Cv9UfQLirM3awyYz5peB1/P/4J1nKLsOpOwc+AD7tQ9sAtsRgNiaeNth?=
 =?us-ascii?Q?TqD9ieCICTU3FolNwpVBtnVIGlS/JDBCRVymN1SRq/HDJ/6WkWH9NdE4bYtx?=
 =?us-ascii?Q?OCle9D3EZPGuTp/8z6Ms8Uu4pLM4v+75qnwM6ln99jGbYEker9yioPKHp80l?=
 =?us-ascii?Q?zVJpity9/LEfjMs76vwXCKLMH4qUREj1NjIjBRHIKTuR9hmp+ZdZ/x/1ogBJ?=
 =?us-ascii?Q?j53XTs636DSUgZiBj41TUVjwWo9WaBk1lfoymRBkoPONK/ltg0JidDNPMYhs?=
 =?us-ascii?Q?ldiImQJUvMdX8Lc778jnQs5+H7e35g45qZdV/5lfXW2gAzit5I3f4i8Ht+js?=
 =?us-ascii?Q?mU1mRtDQjfzJm3mGUwrAdopmoVMoS5yFY83ULHDAqYZyqCSgce1+XUjt+gSq?=
 =?us-ascii?Q?fMePyuryFPZ8c6tLzgFooWl8Yh2bedX37C40hfESmUaFLBCtPfUniJHkIOSK?=
 =?us-ascii?Q?5UMxz210MQHAf14ACbYBlRZl5j15CbMrPY7iy2Vyj+JkLpJ9e/UHXT1Lg5bt?=
 =?us-ascii?Q?hHmjCoQEP2TeRV7Kovo/s2dBc6yo7/tRPXWh81rn0z7Q4BOHBighZ80FfjWi?=
 =?us-ascii?Q?65rtMUXN5NMew2lRI52KNe/PzYZSqpfl18bqUnKUo3IGwC6OIM6Twv24HKSd?=
 =?us-ascii?Q?E3lT12S0pSuH36mQnegf4ZTp3QFxyfU4VFc4vCQi0gaFdHtCqSDQebkr1Vhl?=
 =?us-ascii?Q?Mqw3gnChBfDRbbCLfB3nOaSkF84b9mQvdGDahKKschXUwcf06XIVLdFqQfi7?=
 =?us-ascii?Q?apeSaWFC90LiKsSglAmmQJ+AS7J5f/9AZPbCEzzBBJRFdBoQtK5CiO1lPiq/?=
 =?us-ascii?Q?mbPzC1ampZ9viQwseuJNgfnISL+SjUDXQXYP9IIgJT2YQaVs7CJYq9U/OUyQ?=
 =?us-ascii?Q?79wJf/GxrPy8aKL/KH8lyAAuuk2MuadBly03fOXntsU3kdLaCDsJJ9qp6iuX?=
 =?us-ascii?Q?6U3CMw1AOMpf6IXkg/INophlTQI7J4w28mDOX3sgI0ZRJe017M2g8xdYmL7o?=
 =?us-ascii?Q?NeCITq8Gbl6tTxcCWHUiy3A8jW0v6JsgVSgtd0hJZOcJ78EikKvZgSMRomya?=
 =?us-ascii?Q?8Kb2xYKK56rnkypWcgeD03bIt06no96fFOjtKe6RS5AfQ0w32UiIz4LMxItc?=
 =?us-ascii?Q?debCCwI2tbic2h+MDHMukvdU7E52RjxgL1mPM/tVnoZcacS4ZN3CFKiIuivD?=
 =?us-ascii?Q?PacxOEH4+aR7EmXXwdjZw2lonT45GqxtDSlC1ecrRhEO/+EczmrTEHukxfat?=
 =?us-ascii?Q?qqcTE8z4IjKao2UO7YM54v5+wnc83gonUm3TaNCsq6ZA9adCHh3SDomLNnTS?=
 =?us-ascii?Q?+SxO3EUr20lgX05oA0PsapNh5Yc7NvuBxzp9Fxb+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf3b1e6-fe9b-44cd-7bfe-08dd580de2d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 15:38:02.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TR2VMEc7HnwqwOOsWsdFHtCJtcRL0lP8Qhk9cek/7+RDMa99Y5AGL2yhCrrBHAcC3GztOE46ApYT0oHl1u5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

On Fri, Feb 28, 2025 at 10:18:10AM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> RTC tracks clock time during system suspend. It can be a wakeup source
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> alive during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/rtc/Kconfig    |  11 ++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 386 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 398 insertions(+)
>  create mode 100644 drivers/rtc/rtc-s32g.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 0bbbf778ecfa..510dc2db745d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>  	  This driver can also be built as a module. If so, the module
>  	  will be called "rtc-amlogic-a4".
>
> +config RTC_DRV_S32G
> +	tristate "RTC driver for S32G2/S32G3 SoCs"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	help
> +	  Say yes to enable RTC driver for platforms based on the
> +	  S32G2/S32G3 SoC family.
> +
> +	  This RTC module can be used as a wakeup source.
> +	  Please note that it is not battery-powered.
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 489b4ab07068..e4b616ecd5ce 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>  obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>  obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> new file mode 100644
> index 000000000000..251d86ab3046
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +#define RTCC_OFFSET	0x4ul
> +#define RTCS_OFFSET	0x8ul
> +#define APIVAL_OFFSET	0x10ul
> +
> +/* RTCC fields */
> +#define RTCC_CNTEN				BIT(31)
> +#define RTCC_APIEN				BIT(15)
> +#define RTCC_APIIE				BIT(14)
> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
> +#define RTCC_DIV512EN			BIT(11)
> +#define RTCC_DIV32EN			BIT(10)
> +
> +/* RTCS fields */
> +#define RTCS_INV_API	BIT(17)
> +#define RTCS_APIF		BIT(13)
> +
> +#define APIVAL_MAX_VAL		GENMASK(31, 0)
> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
> +
> +/*
> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
> + * should not be used.
> + */
> +#define RTC_CLK_SRC1_RESERVED		BIT(1)
> +
> +/*
> + * S32G RTC module has a 512 value and a 32 value hardware frequency
> + * divisors (DIV512 and DIV32) which could be used to achieve higher
> + * counter ranges by lowering the RTC frequency.
> + */
> +enum {
> +	DIV1 = 1,
> +	DIV32 = 32,
> +	DIV512 = 512,
> +	DIV512_32 = 16384
> +};
> +
> +static const char *const rtc_clk_src[] = {
> +	"source0",
> +	"source1",
> +	"source2",
> +	"source3"
> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	void __iomem *rtc_base;
> +	struct clk *ipg;
> +	struct clk *clk_src;
> +	const struct rtc_soc_data *rtc_data;
> +	u64 rtc_hz;
> +	time64_t sleep_sec;
> +	int irq;
> +	u32 clk_src_idx;
> +};
> +
> +struct rtc_soc_data {
> +	u32 clk_div;
> +	u32 reserved_clk_mask;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.clk_div = DIV512_32,
> +	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
> +};
> +
> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(dev);
> +	u32 status;
> +
> +	status = readl(priv->rtc_base + RTCS_OFFSET);
> +
> +	if (status & RTCS_APIF) {
> +		writel(0x0, priv->rtc_base + APIVAL_OFFSET);
> +		writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
> +	}
> +
> +	rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * The function is not really getting time from the RTC since the S32G RTC
> + * has several limitations. Thus, to setup alarm use system time.
> + */
> +static int s32g_rtc_read_time(struct device *dev,
> +			      struct rtc_time *tm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	time64_t sec;
> +
> +	if (check_add_overflow(ktime_get_real_seconds(),
> +			       priv->sleep_sec, &sec))
> +		return -ERANGE;
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc, rtcs;
> +
> +	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
> +	rtcs = readl(priv->rtc_base + RTCS_OFFSET);
> +
> +	alrm->enabled = rtcc & RTCC_APIIE;
> +	if (alrm->enabled)
> +		alrm->pending = !(rtcs & RTCS_APIF);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc;
> +
> +	/* RTC API functionality is used both for triggering interrupts
> +	 * and as a wakeup event. Hence it should always be enabled.
> +	 */
> +	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
> +	rtcc |= RTCC_APIEN | RTCC_APIIE;
> +	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	unsigned long long cycles;
> +	long long t_offset;
> +	time64_t alrm_time;
> +	u32 rtcs;
> +	int ret;
> +
> +	alrm_time = rtc_tm_to_time64(&alrm->time);
> +	t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
> +	if (t_offset < 0)
> +		return -ERANGE;
> +
> +	cycles = t_offset * priv->rtc_hz;
> +	if (cycles > APIVAL_MAX_VAL)
> +		return -ERANGE;
> +
> +	/* APIVAL could have been reset from the IRQ handler.
> +	 * Hence, we wait in case there is a synchronization process.
> +	 */
> +	ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret)
> +		return ret;
> +
> +	writel(cycles, priv->rtc_base + APIVAL_OFFSET);
> +
> +	return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +}
> +
> +/*
> + * Disable the 32-bit free running counter.
> + * This allows Clock Source and Divisors selection
> + * to be performed without causing synchronization issues.
> + */
> +static void s32g_rtc_disable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc &= ~RTCC_CNTEN;
> +	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static void s32g_rtc_enable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc |= RTCC_CNTEN;
> +	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int rtc_clk_src_setup(struct rtc_priv *priv)
> +{
> +	u32 rtcc;
> +
> +	if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
> +		return -EOPNOTSUPP;
> +
> +	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
> +
> +	switch (priv->rtc_data->clk_div) {
> +	case DIV512_32:
> +		rtcc |= RTCC_DIV512EN;
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV512:
> +		rtcc |= RTCC_DIV512EN;
> +		break;
> +	case DIV32:
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV1:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rtcc |= RTCC_APIEN | RTCC_APIIE;
> +	/*
> +	 * Make sure the CNTEN is 0 before we configure
> +	 * the clock source and dividers.
> +	 */
> +	s32g_rtc_disable(priv);
> +	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> +	s32g_rtc_enable(priv);
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops rtc_ops = {
> +	.read_time = s32g_rtc_read_time,
> +	.read_alarm = s32g_rtc_read_alarm,
> +	.set_alarm = s32g_rtc_set_alarm,
> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
> +};
> +
> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
> +			     struct device *dev)
> +{
> +	u32 i;
> +
> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> +	if (IS_ERR(priv->ipg))
> +		return dev_err_probe(dev, PTR_ERR(priv->ipg),
> +				"Failed to get 'ipg' clock\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
> +		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->clk_src)) {
> +			priv->clk_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(priv->clk_src))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
> +				"Failed to get rtc module clock source\n");
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_priv *priv;
> +	unsigned long rtc_hz;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_data = of_device_get_match_data(dev);
> +	if (!priv->rtc_data)
> +		return -ENODEV;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base))
> +		return PTR_ERR(priv->rtc_base);
> +
> +	device_init_wakeup(dev, true);
> +
> +	ret = rtc_clk_dts_setup(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev))
> +		return PTR_ERR(priv->rdev);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0) {
> +		ret = priv->irq;
> +		goto disable_rtc;
> +	}
> +
> +	rtc_hz = clk_get_rate(priv->clk_src);
> +	if (!rtc_hz) {
> +		dev_err(dev, "Failed to get RTC frequency\n");
> +		ret = -EINVAL;
> +		goto disable_rtc;
> +	}
> +
> +	priv->rtc_hz = rtc_hz / priv->rtc_data->clk_div;
> +	if (rtc_hz % priv->rtc_data->clk_div)
> +		priv->rtc_hz++;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->rdev->ops = &rtc_ops;
> +
> +	ret = devm_request_irq(dev, priv->irq,
> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> +			priv->irq, ret);
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_rtc_register_device(priv->rdev);
> +	if (ret)
> +		goto disable_rtc;
> +
> +	return 0;
> +
> +disable_rtc:
> +	s32g_rtc_disable(priv);
> +	return ret;
> +}
> +
> +static int s32g_rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
> +
> +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
> +			       &priv->sleep_sec)) {
> +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
> +		priv->sleep_sec = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	/* The transition from resume to run is a reset event.
> +	 * This leads to the RTC registers being reset after resume from
> +	 * suspend. It is uncommon, but this behaviour has been observed
> +	 * on S32G RTC after issueing a Suspend to RAM operation.
> +	 * Thus, reconfigure RTC registers on the resume path.
> +	 */
> +	return rtc_clk_src_setup(priv);
> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> +			 s32g_rtc_suspend, s32g_rtc_resume);
> +
> +static struct platform_driver s32g_rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= s32g_rtc_probe,
> +};
> +module_platform_driver(s32g_rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>

