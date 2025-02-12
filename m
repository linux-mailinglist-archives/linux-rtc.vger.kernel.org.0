Return-Path: <linux-rtc+bounces-3165-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEFA31DEF
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 06:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC8E3A8AA8
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 05:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6661F12EC;
	Wed, 12 Feb 2025 05:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D2uAUGTV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F781DB12C;
	Wed, 12 Feb 2025 05:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338124; cv=fail; b=e53Mwh9fsUzMuVj99gVevZeYIdwZK22x6weULyIdi//YGaNA85pCDaNgaHdliraRcHeIq7AQRfeR/4QivuitVcNeGB+z2TRnlzpsAnHu2qou9FZTrGa5XoNhhyfXgIbp0fxZFuoZP4vwWUE96jaIl3sY7Vdno2JtMU8z0+Mps+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338124; c=relaxed/simple;
	bh=z4cfjAEdjNXCZpzLdtZ3fMUTeDfyblRHPWSSGFBkLtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T0zq5NqzX1kLxRqhHeSomcoXVEsiGOA9+fMs1NfIYNblULh1pfOeBVxr416OdpH9hrgWmw/Tz8X9qtKBll2TWHDur4r15Y/jGucmyZXQgF7s1vumi1LZppDNk8ugu3XCUvPm5XDwUDwHL7P4dqFNV8xAPk2Yj1j+Vu0zKbiLbFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D2uAUGTV; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RI5c1nz0GaMJWo3rJIJPDOS7V/emZj0D7su+VI4EhcsaZ1kCJXDhSVkD6LKi7Q84Bhw8EIBuK+JM8XLokjQgioIp8Cn+8gvmitbGOHdrbS6KdvXgSmeEl5vdA4iDouNw5CPYaeSgmFaut2x2/veiXVvRJcrR9GECos1mgUrntNB8krULF0gyO9jpoueTybu7SXfmSTPoXnQg1l11OynqMWI2XUIu4iB5F+7BGprCjYRac4fFnvT76GXhaeu0V5EPnxAQC1zs9erxGLzY6GC1oG0xbRsfgImdpJo8gzRN3wFlGM605Neue1Zs3i4IdzPTVypGstdhRxBH4E0XQLr3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZERk0L1BQoqQPS+o8X+UwNROPMfRw/iP4srLi6i/ReA=;
 b=jJW0ZjP8XQXA5v0MUut4lIOXX9MMJk8qphYf8GrHh2KK06D6tTKZ9B9/w2uMyn9SDMDvCxpYQkO45IVLI0kFIwcH7UnS1UqX6Jr0uw5mvCS+JJswLAMy+rRtUfjYL4HXIXCkg12sKu7fAUwfALd2gy5xKJYLI4CyL6FUFboaayFmkwcfQn0ykNcEH73e2LoaBI8D0/w2cTdLUQQZ8T6YtuIMjDfgPGWjrLRq4NIQda0iWzmQUCA5X/VidOa9gvJOEb5nHZSpmoYNXXljQ8qzByHVpPVEyof3QowIM+8fjGsRBSyPg9/rJmPmAc9jaKz8B0gdgqnMpVRsqT2Qw5Nf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZERk0L1BQoqQPS+o8X+UwNROPMfRw/iP4srLi6i/ReA=;
 b=D2uAUGTVDwBwdbMxRAiNGov/ycL4ThKom6hJPhOKQ6rQp1vxYvOZacL5WTSp7zEKIGV4Jdw6zGTZ93JJCPbkZBcWSlV8xzBm89SsfUXOKIoR2Mmm78py335fhSbQNCEmSP/Z1HIsdxaexzZtV2M5MFZc1Gfs6FFyak9Z2gZVRMUD5mXG2kmXvVbV+CC3ZVfMgSgcYJXhrJJUwYgn3VLQ7aBFEkPEktwYDg8Z5dY2iQfwtxC6vTZem8UJZvL13+QD1e0FJaGAJC0ISARArcLO/lFMdfd1PdvDNNGxiK3t62IkhO0/ZZW0dc74BDeP7crSQ3QB/HnXOvKIc7y7K1dktQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8115.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Wed, 12 Feb
 2025 05:28:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:28:38 +0000
Date: Wed, 12 Feb 2025 14:35:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250212063532.GB15796@localhost.localdomain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uCCeG2d395ZGDS@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a2f203-d9a3-4a94-0bd4-08dd4b261abc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HAbIv8ck6aJnfQDCjlW/7W+YSgPqCEv55d4XNOoFVh7LzkKMXp71XxE5jqgg?=
 =?us-ascii?Q?J1njmD9dBoDZhX64Ae6VU/r1JUQ74gq+UN/4SEKlTFNM8r/RFHfYuh41Vc5n?=
 =?us-ascii?Q?PpaLbygs9c13Ob0ecNEmOCZA/VaTmG3rXZ9k4JneWbvh+0WTGzVHIO37i5fA?=
 =?us-ascii?Q?4n4UaFWzQFaQqPjHRknj0/fnIF5BvVInJicQ9AS8VNQNBN/Jc2vloCaWNyL0?=
 =?us-ascii?Q?TFrUrj7mCOBM+/eBM3wIc7X5YvdHMU6dHEPshwDdBtXrs2wrif4LKuE2pwcF?=
 =?us-ascii?Q?CJSCRA/Nv8JXUNEs0jiWZyJvV9OYrxI8w48cAq/oyD+cBcHHVREzNuqoqLsC?=
 =?us-ascii?Q?8UJmep4ZojvETDxmXaU5Wh4BSMrgmfDgY6Rf9BDMovmzxtXIVKKRfQen2JMM?=
 =?us-ascii?Q?4zqg38WgdkLCRrLo1mNaSqXHk+sJjpYaNylTUXGrU+ErrNQY3IjH6hcwZPUK?=
 =?us-ascii?Q?PsyTlRwJNlZbQQV/WeaKbRwCtmVbD4NttxagFg9TqLGiN7yMhmPq1SubP6EW?=
 =?us-ascii?Q?ovyE8j0BVyP3ChNmkSaTxa3GKctsTPQn/zqQ2ZjATFcXLZkTL+Frf1kNui5I?=
 =?us-ascii?Q?G1Iy3LwCheMdSGcyPPqb8XmFRTo6HyY16SQiH18rR+XE2vbtW0MKFt7biMk8?=
 =?us-ascii?Q?x0/hrrUlFgdWzQKcyDVS5EbSlH4KhWDaDUTtl4EQLeq5Wpho0iHUq7OMoGYU?=
 =?us-ascii?Q?/tVI6AjtrW6VojWY4NV9j/BPWFa7vFs7dJVVRLv3GU9IM9GHqdpDckBsnwmr?=
 =?us-ascii?Q?vr0A3XpP/US1qwnVbyc6APTwOG2Y0Bj71639hHey0oDEXRXgSr/DdxWKEBP9?=
 =?us-ascii?Q?+fmiXUQ9VXGHbc5oQwk5ztT/roQMgewCUFxgcP/dd9PXuTsQfnXFhgyUWsso?=
 =?us-ascii?Q?Qn7pXvjYenYz8KtCtduMmuS9k8zGQWwvjcuty17u9+mNIcsA3VP8mWI3H8gK?=
 =?us-ascii?Q?v7obVgM8FD3G0zGA7DOLvBw0PoPk/zSA6hGQziCYqNknL2VTAM/ks4SXfAzP?=
 =?us-ascii?Q?RYKRDYmICxOhXdZaAviTMYVCgyzg0Yw90LhSodjp+32f/J+FYFw+u4/1SBUz?=
 =?us-ascii?Q?S4j9GdltFMI0IjVFqLRBLFHUsfLUQPcwiBQuGjeC+BK89dfd/M5cLjim/zf2?=
 =?us-ascii?Q?ScJ3MmDW4lKeJ08xOISJngxQGEUb61rFjtcz3xJ6vIwAKX6nqLVXUzXqKn5o?=
 =?us-ascii?Q?NthtIGkSP4ttn/7Kix2/52AGy7t/SZXWP7wKkoA/76V8WYoRHAAMgKbKMJhl?=
 =?us-ascii?Q?OnvO0ojPt4SzDO6i7w00CLfC4F5ZQPdzQdNNfcovqXs6felwbRauS+yM9Fmk?=
 =?us-ascii?Q?jrewvR1C37fjPARe3IcscIuA/bjYV8HBU0coyMNBqmZIQh8zF+bBiuNomAPg?=
 =?us-ascii?Q?JyuzJJc0/Y93uukC+A6Xz2mFdlIN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ReJI2qZvcWMpJweaVcAa+g4zDWuu4V7CK731oodVe/S1jd5nZTUC0Qob6d4w?=
 =?us-ascii?Q?P/zPXvtlltrG7s7Qmu803f9rJo2Kw/rGMJR34g13g2pl4dsBXGZnjbCXARkC?=
 =?us-ascii?Q?dmqroWgIdrIYy56FIgImUjELCaI/trTluxCa3h9YTLCGuHQnv4XxEELvewi1?=
 =?us-ascii?Q?dkt1rmTrbntvY4kxdrmbrfi40UN751oO4zKGz2Wjcfv3m+osU9GzLubR01Yo?=
 =?us-ascii?Q?cH0IYhwbH9FKe7uSajhiXnfEMRii5NR9ZfNyZMhvk4wbYtKL6SP9ZtsiMF0N?=
 =?us-ascii?Q?hwtpyMupHJotiEZDXtF7pFUsEs/5ptDJf6FqsslVv3Mw55tKk9DWObqo5tsw?=
 =?us-ascii?Q?ChboLfBMj+QWKq2hEoQJ1cH/TgRZFh7sDSpsb3V9kLmcmdQsKyKckVE+Otch?=
 =?us-ascii?Q?os06ig3iVrjcDMfgLoz4aJm7RguTGjHBfbKYglK/qbwQ69c/5piclxkFxyRM?=
 =?us-ascii?Q?ldezG4LejnCGY8pSHtItYex5H9Hha0b+e0FWffjj2Qk9swpxBy0WQ1wOsLEJ?=
 =?us-ascii?Q?N0dpUGlAn1bU2DhZztDYNCOpVsNkcDZjWbiJrvv29GUrS/t8w4etcH0eVXss?=
 =?us-ascii?Q?oMU7HuuwjDCIsrqhEKQFxCMgVJVMU5asHg3dQBguukiqdFEqmOKpOHaVwsx2?=
 =?us-ascii?Q?YKG75+e3Dk2W9W7pyV6SEQqL0298NXfb2h7G7tzpMiZU3xiVocMbMY5ZEeYt?=
 =?us-ascii?Q?DmtFaafYxf/iCe+nl15W51FVd8Ygt2bWxLy2G0FR7pHuGApr1+netvvA5M49?=
 =?us-ascii?Q?GoSTpYFYkmPnfcn53R4Z8vKd36sMb+1APBAwX3LJBsnLGgl8Z9BJGFAPKrYb?=
 =?us-ascii?Q?G6B2DuSKJgsntgm/Yk9ARfoxCALmLv7UDpWNHYWRUthvdRi1RvuVwx1oVcph?=
 =?us-ascii?Q?Ga8W21EbiqGJZTKvft0L5Jf9kNEjUarVPZ0+CDfaVq9aav9x9GqNs+hw7dAH?=
 =?us-ascii?Q?AAjHdD2y65CPkHAvcllCA7Qe1JN60oosOUvVlKDLoYHvAYLwVVIlS31NYA93?=
 =?us-ascii?Q?bibyjVvWrYmr95/D4LxlniZcApHfGDUezc2jVQKcrrP7Jeuby2q4SOVIoHD9?=
 =?us-ascii?Q?wo3tdTSqzlMd4AlalLHkqMENXnhHHsz090JwJnWlwsK85AjSXcWRrK+0HI+8?=
 =?us-ascii?Q?cn6tlcEopf8PdIx7M9Qbqz1+jBplUHv3X6zIwIulke5hKm9KwAgSfLmSI070?=
 =?us-ascii?Q?5ivxASC89dwgNv/Fx4Wb7Rhxh6fvV21zPEOguizj8Q9bE/3jgyd1YmPG+83i?=
 =?us-ascii?Q?oX+X26vIuHDsb9n5ZRGD8OAWpzz30lJ/GiGQqmTXspur1uzRO45NLbV6PUwS?=
 =?us-ascii?Q?gAx70qRJWa/yX90yJL+7nlX7b4n08IrnQlc7XPyj/ckQqmoJ57ufGUjJuQ37?=
 =?us-ascii?Q?3HUlmKPftG8WtykGwxJhMyXLksER7XfKciEciey/rqIK2SwMC+zGDUBG1Mc0?=
 =?us-ascii?Q?Q275JQGbP6nw75lp9mj6ALGUx9V9hPQRimAccLz/lHr+6bZ3VT+JFadNAfwl?=
 =?us-ascii?Q?9MmUDJywL/zg4RJ73a2u7SCLc+FcHqQ9PE0KIaYjw6MA3hSd2srhkj8IE3Xi?=
 =?us-ascii?Q?2D/ZC5KIAPv+DqxYTvFMgj9tqVIqpyvUozUCtnWG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a2f203-d9a3-4a94-0bd4-08dd4b261abc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:28:38.8563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye7dag+RUjhGFtMVr2KjEg8Ux3XMZUTnY7WWrXcHTTKW7yC149W6YHrMvHucsQYfd88Pq8p0ePf9cEujOdcH8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8115

On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
>On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
>> 
>> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
>> 
>> Two RTC devices are created, but share one parent device.
>> 
>> Do you mean each RTC device should have a unique parent device?
>>
>
>Can you point where is this check for unique parent ? I am not so familiar
>with RTC but I couldn't find myself with quick search.

The RTC ops takes the rtc parent as input parameter
https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
"err = rtc->ops->read_time(rtc->dev.parent, tm);"

So in the rtc device driver, there is no way to know which rtc it is just
from the parent device.

However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
current RTC framework, we could only pick one RTC and pass the id to BBM
server side.

I am not sure whether Alexandre wanna me to update the code following each
parent could only support one RTC or else.

Regards
Peng

>
>-- 
>Regards,
>Sudeep

