Return-Path: <linux-rtc+bounces-2677-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B59E6DB8
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 13:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9044D167464
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 12:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100DA200128;
	Fri,  6 Dec 2024 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gq245yHa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649431DACB4;
	Fri,  6 Dec 2024 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486752; cv=fail; b=dFHwHYq8edZHG7cVFwWgxVa6NRHMEcVTulBKz7jZdwgk/qq8AoKeCGE1a/QotfFTBRaXfiUWL8ntkKc46g+mp4+URUo20wHFMD/pugwLgSI0jECbelgJtj7AqN2KdwZ+Zph+1r7VDVJXI0QsbsPyPwoICpYR/PtcxrYbO39HUbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486752; c=relaxed/simple;
	bh=BK6oHkWYNZW7Hczs7GU1g+maVfJ2exGrbCHFhTSS7CU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PIWYNh12L4H/s1xG44CYz/lLYcCbuYSiSMnrOWlCS09WXKtmzE25IyMW8womNnPlcxmF1o/0DJ0wrilU+5eTOaBajXog+FYfXbkVvdrrLunjVpnZiV47Yj6wRP29hQiPMFCF6y0jPtt3EokAwz/qwGjPI4vpQuwzYSXxH6um1Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gq245yHa; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twKYL/eazyGgLVlI2VLv4vpoEv7DGli49YJ+3D++mSwjRcqZ6SlgWzk447F/hb2hpPrq6GOBLY00I+nAmAJUZ0MLu+fJ2hqQ+VFFJAD/RyJcSjWbxFgGnZOb+dE2VvkmqT++LGZ/D9lv0dYWEyi9rLfHfyxxOvN4cEBPIMQ2XWN+U4ouD8ondCJuPk4vV919fuqQjvjmcZcPL5KSYYuwI1aAClq5GC5ZtJSXQzDZvCBCmaib8kH8Y/N9CIkrjDkJxo4RUB5mRDW4Jwwzq3y1pLVLg8h/M7bNRqP6PjcPomxRo5w1z+ENwIk6wGdn+cpFbxf31ylTdRiHiol3x8VgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aM73qPBkgat4pf2SiIS+1PMIz/kgM70Ny1A3v+G0Ls=;
 b=CbgSaTkr5hOJppRTC6e5UTGxdzo5buM26gRdDj2HapNkvYC/rpLVk4S+c6Wu9MlCMIyLS4ReltgYoXn4Y/C33TZ+J9/n96naHbvqmf6Y9UWF3UxFhwQJXMwOr5q5MAgI5+A2ikKz8e/3zAgAGsePmpcsNg+QZ+w0yVIUkjiDfYT68G8N4C6Eq59XPUeJQ2GHLYkWumVx0KzHboKsj1/Qq8XaBimmjBifWq/DefVfjNBOxjwWIVYQNzcjRwvSGOIunhyYSlF/C6VKVMvug/bbODKW7rHWkGmkeWa5MCkgmZyOnCdgq56usCw+iMIjkZ/UuOfNKqFcHFk1IQ478OS2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aM73qPBkgat4pf2SiIS+1PMIz/kgM70Ny1A3v+G0Ls=;
 b=gq245yHaGPDBGnRWkoBMrIIlSA0OCosY7D/wUGmIsdarx2Fq58NlHkLE6/LowDfzO+lQLF9xFXQkv9DON2tNskhX+/Rzf8dc0rJ1dnyAdoz44boKy5CpQecUDjV/WSTvZhQwWXbX7avlEzKFGSwo43QwDmRfK6xBJvWWhRtXxlgZwby/ZSmW6m+I8vLoP2LDdLL81dzYZwKUF5HrVRGysYVEPX5a3u35WJCY83wnwX3pXy0OTDMjL5turgbiuWM5jj2nx2q+Ykak+ALZ/CqlvSPyO0N8CHumzlsmvqRGrcItj7mp1fh+XEk7xp9y77aAGGPxT12blKpjKRgGULELZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 12:05:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 12:05:44 +0000
Message-ID: <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
Date: Fri, 6 Dec 2024 14:05:07 +0200
User-Agent: Mozilla Thunderbird
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
Content-Language: en-US
In-Reply-To: <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 642adc40-ea76-4f64-6c94-08dd15ee4fdb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzRMUXZicXEwc0tpVDJDYXdrYWQ2Y3g5cEFqdlJqN1BsRnJScUF3cWNPM09x?=
 =?utf-8?B?UW5IMG4xaXNMMjZJWjhVYkdpUVdTZlBRSGF1Yy8rczNoTVFyamZlMDVRd3ZN?=
 =?utf-8?B?VVJXUm1ncDArdUdWRkxpenFGVzRPNG1XdkhkWjlIaHhtY01PZEFKZUZJSHpK?=
 =?utf-8?B?VDFMWU5BM0o4M1cxQVVQdEpFYW5xRVJwN3N5MFFYV09QdGtWQ3d1U1FKbjRS?=
 =?utf-8?B?b2NnMjNWVmpCUzBCTjdaZDRKRlptQjJOT2dKY1pFVmRDWGhudHpBekRrZS9S?=
 =?utf-8?B?eG1zckpzWGdnd210MUxGcFgveDk4c3hXeFY2R2xCUGFBbHA4VEo2amZhUVdU?=
 =?utf-8?B?eVpTVXc0bjFvSE1LdDZQME50aCs5VXVVdERjTDNJOUVTb3UvYSt0WWI5dU5V?=
 =?utf-8?B?S25kQVlnS0pxOWtmQm9QcGhKZnRPVFQyMzg1eDJmam5WbVptbnhMSlUvWEtl?=
 =?utf-8?B?MHlXZHgyRmYzVVJvK0dLOVFIaWNUdjlXTFlEMDcvZGtmL1lxa0RsaCtsNmx4?=
 =?utf-8?B?RUJmeHBsb3hld1lvRFducncvYnBHS0liQjg5eWg1bWN2MEZTUlZNYTJmanR4?=
 =?utf-8?B?bG9uQitYenRFMnl1Y01ETVc3bzBZQ3piQ0hrOHdBVnF1Y1NsK3hleURscmx3?=
 =?utf-8?B?Y2t6TE0wcmxlU2IyK0YzaUxUMlBGdlk0ZTY1bFNiR21TWDVJSCsvUXRQRU9p?=
 =?utf-8?B?QjNBTE5xL3VLSTJJRDUxcXVFRVBQaUZoZFhqYklVKzBJMjA4S0Z0LysxUGtr?=
 =?utf-8?B?U0xVWk5VSWJXTXRmVS9EV2w0d20rMWRKVU16aWkwM2JLZWltUVh1ODQ5NWp4?=
 =?utf-8?B?aVBkWFlwU1drZmMraE9Ic1ZKTVViWGhCTXhNTXhwUmtHM0RPclpWVzNJWVFL?=
 =?utf-8?B?VUlBTjEwOFNPUEJBUkM2bGcxbURqVXZCeDl2ZHlmUmIvM2ZKY1hjQ1FEWVdi?=
 =?utf-8?B?MThKRkFoZ3RFSytwYm43OENONWNFREViVEN1N29YbSt4RTRaT1orUnd6MHM3?=
 =?utf-8?B?Y2JhYlFYcEk4a1JHemRKVXZuS2w3NzJmaXd5SWh4bU05UmNDVGpQQU80dWlj?=
 =?utf-8?B?YTBUNVlqbko2WHBQY3FXeFAyQVBuVnpQaFhZa2s0MzBqWWlTeFVKaWFSVUFh?=
 =?utf-8?B?R3kvWDVKVVlEeC9BdTNNUVNENHdpUFZJZGVYRHo0OUJ2YnlmUUROYWFlNFFo?=
 =?utf-8?B?aGo3djI4SHVQY3dGVUY5bWxSKytHT1FNM3dVNW9qSmxGRUF0VDBlTkptZmZq?=
 =?utf-8?B?VHU0WjNTOVN4Q1M1T2l3RGltbTY5UjQvVkhQSS8rYkV6K3JDeklFOGRqd29O?=
 =?utf-8?B?YkRJQ1lMV0hjSDVBT0lPUnNtcHFzb3FTZ1lNMUlBcnNCNkJoOFg1TlJhaXU5?=
 =?utf-8?B?ZlR5VFAwd2hoc0tEZlh6YzQxUktpWW5zMzNBM2g3TnNxYm9ncURTcWdtTnlt?=
 =?utf-8?B?dFhTOXRxS2orQWI5M0dLSHJ4R2U5b041b0JZTkFxWTM4SGp1WHJ4THNMQ2tC?=
 =?utf-8?B?MEJBL3VHSUZjSTJ5M2p1UUxpUW96VHJnNXdQdmlXYWhYWHRDMVRLazlFMnBy?=
 =?utf-8?B?Qlg2clE3cGpMZnAwVTJqTFFvamFydEJtRmF3dVNwSzhQeEhjQTJHVmc3RGlY?=
 =?utf-8?B?UStqQUtxbWdTMUxqenZYbDRPOTRLS2w3cnp2VzE2MUtBa24wVmQrZ2NVdkRl?=
 =?utf-8?B?TVk3OWdmVHVwSVFvQmRIQWw4cHpwbHZzNUdCSUtpREY5KzNTWENnNEErdWZT?=
 =?utf-8?B?N2lNd3Jkei92RGd6SExzTi9QbTFMY1k0ZGF1R3U1UXBWaGQzcVovcjVSN2xq?=
 =?utf-8?B?aFdWUjdzZWlRM2hvK0NFUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bklrcGVjV05wbkpmd3NSSGFibFRGeGxtNVhZMGh0ZHVudmRHRDMxalZLRENv?=
 =?utf-8?B?VkVGTnpJS01YNC9EZndxVGVFajJ6bFdWbURRVXgwTUlMaFoxQm1WUjJRb1Vy?=
 =?utf-8?B?d3YzSGIrbHFxcUExTmVscU8yaERIMi9hNlBDckd5cGNQOG80T0NwZHUrVzdj?=
 =?utf-8?B?azByMkN2dUlpa1UzWmpkTzVZNVNSeHg4WVNYTXZ6Y1cydWE3d0E4cnBoN0xk?=
 =?utf-8?B?SXpzN3RJbHhEdzlkWjVyOEZjdkNxU2lONW9sVlhKTU9JYnlYTkRVcmJraS9z?=
 =?utf-8?B?cktJSFlsQTFGdlRQMi82UktsSDRhWVhpOHJFYjlvQXpPVnhqSGxweDJYaUtC?=
 =?utf-8?B?OFdLSkRkd2k0Mk5TeUFxRXZWazVvY1djWFlvNFZVdFdQdlhzMmNEVjd0QUtq?=
 =?utf-8?B?dzNhYjZmSFE4dlhpUUVFRjFDSldZZ3Q0NVhYeEVCQ1lxNS82bnBvNlk2S0My?=
 =?utf-8?B?TEowaklSZ1JsV2Z2ODRwc0ZaVmRBV1hHSFMxV0taT3JKbkd4NXcyQUY0NzND?=
 =?utf-8?B?OE5YY2NBYVJ6UWpPam82NUJ2ckR4SVZaODJyYnJSZVF6N3h5Y21rMWlMbklY?=
 =?utf-8?B?VVJZdXdkZ1Q2b05GYW04cEdGNGI2bDNGeEpUQU94OXBERXNVWjhaRVdRMnJh?=
 =?utf-8?B?dlp5YUUxZnBwRlV2Q0JSWU1iNXFackNhMkhocTNHTDQzY2FaZFJad21vNDRl?=
 =?utf-8?B?TUc0K2sxaFRJTG5SSk04eHhyU3ExRkZ0eWZaV1poRkpTejJ3Mjc2Z21LVjVP?=
 =?utf-8?B?M2IzUmFRNUlTa29lWFovMm45Mmt1Z1JTeDB1Yjl6YWNRT3F4UUdlS0M5L0da?=
 =?utf-8?B?SEV0SnNHeXhZRk1QTnMvTk4xbVJvZDNvZ21XRTJ4OWljUnpsWW51NitFRWll?=
 =?utf-8?B?eXE0VnNlY01kZUI4WjM0MHEydzdWL3NMMzZpVFJ3ZzdhVDR2by9BTHR3Mkhs?=
 =?utf-8?B?dk1iZzFSM2pMeGRKTG1rekt6Z2graFU3bzNVa3loYk0wQUpiSzlNV1VnUXI2?=
 =?utf-8?B?L0tVYzc1K0ZYZTJvSjZtdnJrOGZTVlRLbTNXU1FrdUh3MWVYOHlNdUFiSjZV?=
 =?utf-8?B?cVVrV1lUbUo4ZUtyMUluaG1WeTFYaTdabmNJdUZ4bVNSS2w4dzN6eGErOU1B?=
 =?utf-8?B?TVMzeDdGMjVBcGlRZndoOTM0Rnc5eUlMUTY2alFNM016a3pPYVdORDhXVFhv?=
 =?utf-8?B?SU5jbVZLK2VhVElhRkJSWFI3bitFb0NCeWUvSG5vYjBBdGhHc3RCN2x0UXQx?=
 =?utf-8?B?NVU1amRqY2RkZTdiSWQ3T3FEVjFKTlQ0OEZQMzZ3NmNVRzA0S1lhVmpDR3Rn?=
 =?utf-8?B?RDdrbU1XZTNkelU5K0NOaTVZcU9zS3pjazJnYnY5QWdtU3N5YTRNTEM5b3Jl?=
 =?utf-8?B?V1Jxc3dhSGVKa1kwdUQyaHdzOStXWmZ2VGlHV3VOMFh1WisvMnR2bkp6M1RB?=
 =?utf-8?B?bmFrbWFNTUpkU3RRak5kbng3V3JPYlBNU2VoNHRGLzRhUU90VTZqK0tkMDlR?=
 =?utf-8?B?N3dqSTRBN2RyQ0NxQTJTek51enpDanErSjBkRjdIbk5KQVFaT1FvdjkyQ1F6?=
 =?utf-8?B?TmNQSzN0NThGOTA3RE5hUUpiMnlUWW1yTlVjMytVOGQzZFBQTzRGRWNjSlZ3?=
 =?utf-8?B?c05VcENYNUFxdVA5VnV4Z2NiVUJ0T2JPbXBJL2JZVGkreVpvZzhjNmsyS3Nk?=
 =?utf-8?B?Q2FwbzlINmVkUDJFeWhSQk1yRU80UEwrOEhJWG16d1I1anp4bVZoS0lxWE5k?=
 =?utf-8?B?VHFSckVhL0FFVEg0VnNUci81YWxaMlViRGtxaGNGZWxRd1VMT0RrRU9vMEdj?=
 =?utf-8?B?ODFEV0xkUVBOd1hjaXFaenNnQ3V5dW5RZTdmWkhRRlR4YngwU25ZckIwUytZ?=
 =?utf-8?B?T1p1M3NOaFphZ2RqMTFIOGFCY0Nsdk03M3RLdHVnMUFkOXZFYkE3bDRzYi9R?=
 =?utf-8?B?eG5XYzMwazRaOTh1cmc5UEFDcVI3V3UxR3FobXA4SVlWeFdDR2NMaXhCN2JS?=
 =?utf-8?B?YWVIQVVOMkpudEFXV3pEa3JjUXgycENnaGx3OGJDUVdVbEwzekNVcDNmdnQw?=
 =?utf-8?B?clBvZ3ZnMmZuQ1pLT0pTVmhaQ1BiRVZlUWwwS0NGSXhQd1NYYXVWVmhKeWRQ?=
 =?utf-8?B?NDJMUkFQVkxwK3dKK2JVdUI5ay9lWmJnNlFiTS96Zm1qS2VZRWt2Z1hTMVcv?=
 =?utf-8?Q?vzwZUYh9U9+supB9x0RiawM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642adc40-ea76-4f64-6c94-08dd15ee4fdb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 12:05:44.5100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb5Z3RKoE/3t1/zsuqbl19vNhXx1S67K2vmjJmJlglaigqhBDRt93njz23rhJHwddzuCzh+0o8KBDzq2gVYepJgUhK8khADtvtHJ36gI/hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147

On 12/6/2024 10:04 AM, Arnd Bergmann wrote:
> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Fri, Dec 6, 2024, at 08:09, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> RTC tracks clock time during system suspend. It can be a wakeup source
>> for the S32G2/S32G3 SoC based boards.
>>
>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>> alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Hello Arnd,

Thanks you for your review on this patchset.

> 
> I read through the driver and this looks all good to me, but there
> are two fairly minor things I noticed:
> 
>> +     u64 rtc_hz;
> 
> I see the clock rate is a 64-bit value, which is clearly what
> comes from the clk interface in the kernel
> 
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +     return div_u64(cycles, hz);
>> +}
> 
> and you divide by the clk rate to convert the register value
> to seconds (as expected)
> 
>> +     u32 delta_cnt;
>> +
>> +     if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
>> +             return -EINVAL;
> 
> However, the range of the register value is only 32 bits,
> which means there is no need to ever divide it by a 64-bit
> number, and with the 32kHz clock in the binding example,
> you only have about 37 hours worth of range here.
> 

I am not sure what is the suggestion here. To cast 'cycles' variable to 
32-bit ?
If yes, indeed 'div_u64' converts 'cycles' (the divisor) to 32-bit so I 
agree it should be u32 instead of u64.
If not, I would prefer to keep using a 64-by-32 division and avoid 
casting 'hz' to 32-bit.

> It would appear that this makes the rtc unsuitable for
> storing absolute time across reboots, and only serve during
> runtime, which is a limitation you should probably document.
> 

Actually there is the option to use DIV512 and/or DIV32 hardware 
divisors for the RTC clock. The driver uses a DIV512 divisor by default 
in order to achieve higher RTC count ranges (by achieving a smaller RTC 
freq). Therefore, the 37 hours become 37 * 512 => ~ 2 years.

However, the rtc limitation of not being persistent during reboot 
remains, due to hardware RTC module registers present of NXP S32G2/S32G3 
SoCs being reset during system reboot. On the other hand, during system 
suspend, the RTC module will keep counting if a clock source is available.

Currently, this limittion is documented as follows:
"RTC tracks clock time during system suspend. It can be a wakeup source 
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not 
kept alive during system reset."

>> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +                                  u32 offset)
>> +{
>> +     u32 counter;
>> +
>> +     counter = ioread32(priv->rtc_base + offset);
>> +
>> +     if (counter < priv->base.cycles)
>> +             return -EINVAL;
> 
> If 'counter' wraps every 37 hours, this will inevitably fail,
> right? E.g. if priv->base.cycles was already at a large
> 32-bit number, even reading it shortly later will produce
> a small value after the wraparound.
> 
> Using something like time_before() should address this,
> but I think you may need a custom version that works on
> 32-bit numbers.
> 

This is correct. Would the following change be acceptable ?

-       if (counter < priv->base.cycles)
-               return -EINVAL;
-
-       counter -= priv->base.cycles;
+       if (counter < priv->base.cycles) {
+               /* A rollover on RTCCTN has occurred */
+               counter += RTCCNT_MAX_VAL - priv->base.cycles;
+               priv->base.cycles = 0;
+       } else {
+               counter -= priv->base.cycles;
+       }


>> +static int s32g_rtc_resume(struct device *dev)
>> +{
>> +     struct rtc_priv *priv = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     if (!device_may_wakeup(dev))
>> +             return 0;
>> +
>> +     /* Disable wake-up interrupts */
>> +     s32g_enable_api_irq(dev, 0);
>> +
>> +     ret = rtc_clk_src_setup(priv);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /*
>> +      * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +      * reapply the saved time settings.
>> +      */
>> +     return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
> 
> This also fails if the system has been suspended for more than
> 37 hours, right?

Actually, the system would not go into suspend (returning with error) if 
the alarm setting passes the 32-bit / clk_freq range.
The check is added in 'sec_to_rtcval' which is called from the suspend 
routine.

> 
> One more minor comment: you are using ioread32()/iowrite32()
> to access the MMIO registers, which is a bit unusual. I would
> suggest changing those to the more common readl()/writel()
> that do the exact same thing on arm64.
> 
>          Arnd

Makes sense. I will change to readl/writel in V7.

Best Regards,
Ciprian


