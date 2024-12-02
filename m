Return-Path: <linux-rtc+bounces-2652-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA549E02D1
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 14:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CF128551A
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2024 13:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D68EEDE;
	Mon,  2 Dec 2024 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DFEEpBy2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28368F6B;
	Mon,  2 Dec 2024 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733144810; cv=fail; b=DkD3HJiCrLvw+Re8GWNtg5Q76SuSo36yd2VHkG5X5pRXF5DW14DKacbNIDeY5Q2xYAntlJS4LICovYt/8RzOeRlaiRuFTNl0lY93KaMXxxwN3E0a1DsrnW8b05oGOD82a/jATdxYtCIQNQuepKVaI0e4pjrRuBFxNP0/qBN1GC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733144810; c=relaxed/simple;
	bh=6g1Bjk/Fu3jx2yXOGK4cj4CqoyvfB3VBUdhG7CPw4UQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KKPUX3UR2YgsOJTpGPFMQjaKLZRpfTBBOySIhKnmT+mudHBOVUPswdztHsFAQu1DjMqflR0cRXRNUoUIaIYPx0pN2Us/puGur8UeN115IkOXE/yUMUre+KrUBYZe5Q0AH9u8lb79ZrRQVlNwYsUlxuw+0KKF/AiYxgd9UZey10E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DFEEpBy2; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+LvjE4TGo8INLu7O5BjaMTjZmT+pWmo6oH1u7x3QG/rQRwkdHg0PThiYYEqFHkCJRoVQf4tAlA1MFcOJUfJcFtwxvseM1RgB9jzZcj1W/J/qwWOJUdrz3mYYC2widsjYU6WY/BGclk787l/vzqdpMKPr3JvLGwzdCzs7pU3fgtypAx/g5Cgf29q4df/kVgqU5PW0FpE6RCbhUzYXCd6UU97UnlUpeD7xC1Hl0Jn+g7Kook9m2ToN460xNiVZz6BdlCM7FI9x3ZBMpPU6H4/6G3FiMxMVeMPG4N09prQ0hiADTesaC1DQusMGiCgzAOjQoJCfnkPYuH2w3OH0LX2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14MP4AG3bbVf4OvK/l6vQiZZ8GvKBfb+E3gtEZ2JMus=;
 b=ylVPqyxu2eoGd8RUmxdrxMAm+2MFe5NCowcvLR0fsz3TOdEmSuqpBJ4rWXd10znGNcXxuQzgF52NPb+DCUgC9WU8pkIkCQdX1TrIeicKsUPjZ2/9PHvZsI0573gsrct8QRLpZVBwH6JEhRcBD23u8w8qS3b2avXvx4RIu1tK3/B2l2QA23b9w4p6qAw2l+HRCGZ9uUQVF7V10fec6+vgFQ9g0Ipedn/LiIX5PTsMNEPNbSQIMtjNDIdmJiFKf3ZbTtn+HVDxD8BfJrjj3J1dcxvzLtuWiGvYUGGUwHejw333qLd06M4RKCBoP9KKj4fFUSaFbr5HL7BOSuoneEdENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14MP4AG3bbVf4OvK/l6vQiZZ8GvKBfb+E3gtEZ2JMus=;
 b=DFEEpBy2fZOakIXGqTd72zJ7ujDd7IY2uV6z+rnOjh5mJ8yYoiUcORidpwbXcFgIkam+/fbx9lXNI4MRsPxcKK85NBeyd6I0yyT3QjIFdPyPfdpAAikxdxIWwECC16D0iEnoetzrZzIMzMnHW5XwkhVig3m9PEcLOaw0dRikAJWZr0CWuCqWYzBJcIPx1JGGVjtTIX9axlcCz7X9CnTRMNigY8KkAO3LDl5Zfb4E7UVrTWW9y4b8v9tGWBMny3IJQoYL/GMSldiNg/Wr5wqh6DG0UBi0dTCZllDyZGIDajtHxzrajJYNpekUb8R1tM/JOfb/sOjNC0cd+orZo9oT2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA4PR04MB7582.eurprd04.prod.outlook.com (2603:10a6:102:f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 13:06:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 13:06:44 +0000
Message-ID: <e2329870-2e4b-4c38-ae20-c6aa5108a0da@oss.nxp.com>
Date: Mon, 2 Dec 2024 15:06:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
 <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
 <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
 <2024112715321236991788@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2024112715321236991788@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::49) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA4PR04MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf37398-4f4f-4615-3647-08dd12d22b72
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzBSVHRob09yQ0V0dUxPaUdlUGg0MVZVSldHUnk2TmV5ank5aUFKa3ZYSGp6?=
 =?utf-8?B?TEVtOExtYUliTXNHTWtzeVVuTGFMb1dMUVVjZFpEMm5zTlhaVzFoRGY5a2xR?=
 =?utf-8?B?d01oMDMxaHdGNzU2QmREemxQRFE3Zzh4RVNpdUE4VnRDM3dxZHRDTDMyaDJR?=
 =?utf-8?B?TjA5UGsrQ3FaL1BlbnFrQ1JBQU1sNVdPZUFhNWFod0d2c3dKNk9YdlBDRFAx?=
 =?utf-8?B?Yk4vYnJVUVB1dTdaQ3NOVXlXUGRrS2gxaFpvS09SSGdLNHNnYXI0S3BRYlFY?=
 =?utf-8?B?ekR1TTAyQkJLb2lDYWJ4YkhacHp4bTR3ZlJWU25qK1UxMHlIY0Nyay9wZ3NU?=
 =?utf-8?B?TXYzMWFmRDJvRDNYTlNaTGdMYjI4TEJFQ1RIYU5jc0lQOGtZRnFUcHdQeG4x?=
 =?utf-8?B?eFY1ejhpKzd2WHdVNFJjRkdNL2luT3VZRFk2aUxta2tFaXZ5QWhDQ0t0dU9x?=
 =?utf-8?B?N2ZpdTE3cHd5c2Zjbll1ZjNRektacWIrbU5nTGprUVM2NEFSTDVVQTNFOTFN?=
 =?utf-8?B?bzI4K0hQVWltS2FPTkRtUUN4b1FWNlNLNVF0L2ljbWhpNTFuSVB4V2dBLzZ4?=
 =?utf-8?B?cm1PRHo5cHFHZWo3bnVRc2JiNU1WNHRmZDM2K2lmenBSUW4wa0RFSTJzaFQ3?=
 =?utf-8?B?TDlnU083MUdPU3VQV0tRUENxNnV6cjJML1BheVNEMTJkcUhhU3QxMkdaRGpL?=
 =?utf-8?B?VnJEc1dpUUZaOHozT21heHdxdm84d05YYUR2bHVIb2JqWjlFNEgyZWh2aXV2?=
 =?utf-8?B?QUZJTTdIVUNYdEhwN3B0VDRxUGVMSXp0cDVGT2lxTFZXUEJSTnFlelk5ZXUw?=
 =?utf-8?B?YXRSQXlXL0dpNU9MOCt0bkg1VTN4eEdJTE9UZVNDZjlQQmM2VDU1d2Y4L1lm?=
 =?utf-8?B?QmY5UDBWcHdacVRGdDFjVWVWeWZsR05rQXRnZWZBaFl4NEo1TlFMTjZZdkhG?=
 =?utf-8?B?TUc0UmNRbFdKd1FVK0h2cGVySVRzRVRKSmNuSGtiN0MyU2t4NndWUVl6RTBu?=
 =?utf-8?B?Zy9GeTNyT0V1ZlBVZjRSQmpmbTk0QjhjaXVxUEljVG1UY1BLZjdKaVowVyts?=
 =?utf-8?B?L05FZDAwanUwREMwdGNUSVM1L0JiRWF1QnB6U21MaTR6N0M2R2J0M2VoTGJV?=
 =?utf-8?B?VXlBcm5TaW5vMEVJRlE1d1NiN2tMRU53dk01Wk13YkFWbkNUenVScDdjTWww?=
 =?utf-8?B?bXNaMFdDcFd2dWEvd2h0WXBQL1pVd0pIeDJmQlRNcnk4QnFVaTBxYTZ2NndM?=
 =?utf-8?B?dUtGd2twUWxrTDhUK1JOSzBWN3YySmliOHlPbGE2clRWWFd0Qm92RTBiTW5J?=
 =?utf-8?B?MCtBRWF0K2JQcWlUajFSbmtwdTdoUm9PUndPTlMxOUticmxla1lxelRlNlJk?=
 =?utf-8?B?ZWZjTmo4SlBTNmx6V3ZhRHZQbkhUYk5MS1NlTGc4N0tVbG81czE0ZVRDdGJh?=
 =?utf-8?B?eERJUFptK3pRUVBtNThqd1plaG1ld3pnemtpSkFHUTJyRFVBczRCVmJ4aUVo?=
 =?utf-8?B?NGtNSjBQVDRDS3RaQWUvc1h3OUp2VWYyZUpIV2s3OTFyU3MwcGdyVlovTDFq?=
 =?utf-8?B?T2V3dFltSzFObGNFelArdi8vUTFBSzJIeENkbXFVMFZaOVhiRTUxUCt0UENF?=
 =?utf-8?B?TkFKd3pFVU8rdGpvM2VXT2hFUmdTd3RsWGhtM1hVUGQ4RmZRdkFxbTNvNHdI?=
 =?utf-8?B?VE84ZlN4VitzWmZlYlM4VDN0ejRUTEFlM3lVbVA0OTV1UkVrTEpGVVJLT2s1?=
 =?utf-8?B?ZVVTVzRhN0hBdUNVZkRSSytzSGUzSlpFTUhXajE3VE5sckRtSFdnWnRxc2Ez?=
 =?utf-8?B?TEZBK3ZPYVRwQnFEUGJxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDc2a25vSmozbGloUlFzdlQ2b2Z2WnUvZGdCdHhKeVFUdmU5MnBINmlnWi9F?=
 =?utf-8?B?dGZNQlhpcExoLy9WMWVMaE1lamVDZHNpZnNHeWtEcHBBWXpHRVVXY0JhQVo2?=
 =?utf-8?B?MWpCNVk3M3NBY2tmaWJINjZKa3oralYxN2RHenNOdFBIZDVwVHpjVXIrUXFh?=
 =?utf-8?B?TEFPV2J4TGIybXFPd3ZBZDIxaVFhQW5nUWtsWk9adit3UWE0bGhXVjRjMHF5?=
 =?utf-8?B?VVZhMktlajVld1psL2ZjU2duOEQxU3JQWjdJMkliaU0wdmZyU09rbTljeE5r?=
 =?utf-8?B?VG1JTVNwOTZXOTFHWngwdFR1NHJ6ejluODB3Sm5ZY2lEdlRYNWVJTjJENmc1?=
 =?utf-8?B?QjlrUVBWVFN3VWRnL2pGcWZCK3VQL05GdmpJSDdaTFFpcDVrRlBsa2QzdHUv?=
 =?utf-8?B?TDFkQzE5bWdSakNWcWlzOUlVTHJOM1VuVjhnMXIrQTNZYVpLUjEvUGF6eUxy?=
 =?utf-8?B?cE1zT3YzK2s0WW9TUEdoY3doTDI1STloTUpTMDZlbTZmdnA5ZVdSblUwWEZR?=
 =?utf-8?B?RW1WN2lka1J2K3N6djRGdmNONjgybFVBUS9HQXRBN3pHelA5WUl6TUpFTXk3?=
 =?utf-8?B?eGdXdWZOc2NHK2x1Z1RjajJEREpXME1nUDhnZHcwbm80U1RaaWpFR3VkTDFa?=
 =?utf-8?B?cFdFdTRFVWJwTU0ybUpyZTJHSTg4R1lEMWgrTUhERU5WZ1pyRklwSzhaOEM3?=
 =?utf-8?B?Zm4zYlovWEJMaVQvM3V3UmhhN1c3ZG1PSnRPQ1ZIWDhXa2VxUmJXN2dxd285?=
 =?utf-8?B?UDF2Y1NqeDQvdXBlVDZjZGgwVENpaVlYbzFBZU42SWpvcGNoWmxKSnkwWWIx?=
 =?utf-8?B?cEprZktGd0x5Ym1US2M2NmtGRGFIaEMxa0VheGxiSzNIYWZTLzl4REpoT2Zq?=
 =?utf-8?B?TFRiYjlpYVA2d1FlQ2JRc2tSRmR6elZYY09WcFllSkYyOGRPbFNkQ3FmelpC?=
 =?utf-8?B?NGNIZ3Bpd0VQUitMc0wyYnNiNFdYb3FjbFQ0SW5VOXQ0L0I1ZUdyT05SdGRI?=
 =?utf-8?B?WDV0Vks1Qy9VN2FNVnZhVytrMWZiM1llK25pK0hhZ1Mya0t2b0ROQ3lpKzlv?=
 =?utf-8?B?VGFKRkNFM2tuU1Bxd1JiYUJ6bnpnSCtid0ZabExrZW8xM1d2dUJqL1JRZFFI?=
 =?utf-8?B?YWlmL2lwYWV2REhZMVA2clJEQ2tNMVdOK0Ntd3B0SGdrckIyOTd5VmJNMm1Z?=
 =?utf-8?B?YUJkbG13R0FKdmo0eXpGSkF6V0lIeU5qSFNrTW5oMFN4eVhWV3hFSU9JZkNH?=
 =?utf-8?B?dU4zSGZKR1N5YXlNMkxzaVhVcmVNcStTWHlkSURpMThsWFNJSVUyaVNSYTJQ?=
 =?utf-8?B?VUpnZ2tPdFcyYU0zeksxVnczK2NoQVB0cUE5NlIzbVVqbURsa2dXTlFtRWhX?=
 =?utf-8?B?c2p5MklMaTlTcHNaeDY3NW9Kbnl1aVkvckliZFBTUFFOb2VFajVvTStheDk1?=
 =?utf-8?B?YituT3RXS0NZOXJTVzc4MnNyUUNCZzI5aE01TEZDU1hWR2hRVTJPNnBUVTZu?=
 =?utf-8?B?YWNiY2c1U1dHTEp0NElKUVpmQ2QxdjFwL3pZNGdTbXM2bk1BVXc0eVN1NFRR?=
 =?utf-8?B?MkN6S05EUE9YQUo2Z3MwR3JUUDZWRFgzWGFLRGIzV3d0ZFNiaVhObHM2RGds?=
 =?utf-8?B?a3JncVMzVTY0NVQwL0ZhT3FEcjFCZVZ1ajlhM01VNFY3Nk85ZzNheFFQeFNi?=
 =?utf-8?B?NldxZVlTNG5ZbCtWZVJTR092ZjMyRkowb1l0U0NQazhnQUhhcEo3ajZvN3c1?=
 =?utf-8?B?cWIxQ0o5MGdmbjJxdDRTQVNWREh1Z0ZhdnZKQXBuUG9RQk14OVE3Q1dNYmh0?=
 =?utf-8?B?Y0tlWSt0cHYraEU5MXVjdWp4VjRIMGRNUXk2alpTWGYvNlJMM3lwQXpONkgw?=
 =?utf-8?B?LzNMZkJKLy9WRDJtZEJUQ01RWFg1dmo0VHI1SFRzRmdXR3NZVlJaL2o3NGZE?=
 =?utf-8?B?ZDhMbWlNUmZtSXVBSTAwaUhmTnd4ZGJWVEFmZ1d1SVV6aDJGR2ovcVdaMnJH?=
 =?utf-8?B?elJNd0d3bVdYSytGYlM1cWduRmZDMUZtUUgwZzhqYTAya0JJUTdnYXQva2dw?=
 =?utf-8?B?S3RlbXppbHRmR0cwOTZRUGdsZC8ydVpqd3R5WHpkUmVUTklzSjFnSDRrYzRW?=
 =?utf-8?B?bzhQRGZQU0ltL3FGVnR4MEtsVU9YbFg2eExXT0kvbzV5RW1TVDkxR3FoMUxY?=
 =?utf-8?Q?V2pD45yrnVhvXNoWxPD5l9s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf37398-4f4f-4615-3647-08dd12d22b72
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 13:06:44.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3SfIz9gB0Tg76fRgkc5jBEsAU4V3SgrZQ2Gzr6KExntl+ZUc2C52qQIsxU5E7Tq9mgv45OgQiW6XshbZlrxu4tW1XcmV8sCjZnC/xRHz5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7582

On 11/27/2024 5:32 PM, Alexandre Belloni wrote:
> On 27/11/2024 17:07:48+0200, Ciprian Marian Costea wrote:
>>>> +	if (priv->dt_irq_id < 0)
>>>> +		return priv->dt_irq_id;
>>>> +
>>>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>>>> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>>>> +			priv->dt_irq_id, ret);
>>>> +		goto disable_rtc;
>>>
>>>
>>> Already enable rtc at rtc_clk_src_setup(), you direct return fail after
>>> check clk_get_rate();
>>>
>>> if you want to disable_rtc, you use devm_add_action_or_reset() to add
>>> a disable action callback and return dev_err_probe() here directly.
>>>
>>> Frank
>>>
>>
>> Thanks for pointing this out. I will use 'devm_add_action_or_reset' in V6.
>>
> 
> Won't this disable the RTC on driver unload which we already discussed
> should not be done?
> 

This is true. Thanks for reminding me about this discussion/issue.
I will just fix the error paths for 'clk_get_rate' and 'platform_get_irq'.

>>>> +	/* Reset RTC to prevent overflow.
>>>> +	 * RTCCNT (RTC Counter) cannot be individually reset
>>>> +	 * since it is RO (read-only).
>>>> +	 */
>>>
>>> what's happen if overflow happen? I suppose it should go back to 0 and
>>> continue increase?
>>>
>>
>> Indeed if overflow happens the 'RTCCNT' counter goes back to 0 and continues
>> to increase. The reason for resetting it here in 'suspend' routine comes
>> after dropping the rollover support (as agreed on V4 of this patchset) to
>> prevent an overflow during the standby state.
>>
> 
> I don't think the overflow matters as the comparator should continue to work
> properly after it happens so you always have the complete range to wait
> for the alarm to happen.
> 
> 

I think I can drop the RTC reset from the suspend routine for this 
current patchset.


Best Regards,
Ciprian


