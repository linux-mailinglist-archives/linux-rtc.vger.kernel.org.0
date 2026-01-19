Return-Path: <linux-rtc+bounces-5781-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F6D3A38F
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2B230004FC
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B9B302773;
	Mon, 19 Jan 2026 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="1vaY1L0N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020092.outbound.protection.outlook.com [52.101.84.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C2275861;
	Mon, 19 Jan 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815933; cv=fail; b=nR6bFRXpzeo/CS2PlX0w6Oa4Xn5B/xJt6xZanOSaBYnYzQvv0hBf2F67rHAHHOrl8E+HucSI7AkwLQ7X9OoT+sDUOHWgIH++CUffI5sYt9mO1q+FKO8m9+DadjWVQkhAQu0tboORVQO8DNc7bckifixfGG8EIqJm8GNWpLgh4rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815933; c=relaxed/simple;
	bh=j06Q4e8dk6g59ajagPFMQg/Pb7bpDiaaaPoUlMu7s5I=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jw7BvH+SdYPaaIiZgZ04okZigM1Sdo2YmeTsgC/DOaGkC4FEGxAtbupv2xiMW9NAMysN4LMn4VjpQKHEr+4eahiNH2ntFGC/haBpNUFrJyaFFZnM63W3Z2qfYGzPzf82zUYsaI30YF2WHhvgcogu2XKRnLKn8t1d9Qc8NrBwqX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=1vaY1L0N; arc=fail smtp.client-ip=52.101.84.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcJAPpud3uqBvWTBMr+KmZXyuZky7VpTGyhpqOS9l9pOI64aNBXm3o7RAU3cpuvHHXfO3AZJtqe9Onw4rTAVY9F+ElTmRK2RnlTYblTwyYyghbcsqPOBAOjy7qSzxNuCxvC/YXymYw+TI8NDK9i0kXRl/RfmN4EOxl0lNjZyhB9DUZch99pW1Z3iEEMBvnR6JjXGnekUqHckpif+nvb0zYL63S4eIy1HzE67KJZbtRgt0KDyC5BfUN/y08DTjBo/b6QFkDIfRMBJ1OB4IRmn2d4/wfdU+SdTX6hGgIK4NF9A9rsBbEaa2iPtJlM+kVMfpT6HsKRkiMoKpFUrOkPa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39KH8WwQXvSdyLfBdLNMnrKxO/2ZM0EiV17n/s211VU=;
 b=jzz/kxbtPLeSm057/+vtDBrW7gsFMAKJgliSRm0A0eCuPjd2255FPfkOjay8nPNhaJRtzkpPlQz37loT/4ZkXBXjDtSS1XFIefUYGnolwow1imelkzac0KWtih416bzFROgXoK++N6K3YvfY1IoHDRPskWZGzoUPOjiObZOCaj9ivcVhFcdGvxET0ERV/Ij6gfqnn7JFWcphjATTh9BrGD65M1lohw8eXANgdZlD7fRhvlh839UZFB1YQwV+7fddr/BxeiCqWy7Uv/mHNxXbs/YT4PLxQNFkB8ibe2j53lOc25si0YOmu6BQ5t71rWIAvucJOjzafQQTRrJdAgt88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39KH8WwQXvSdyLfBdLNMnrKxO/2ZM0EiV17n/s211VU=;
 b=1vaY1L0NIVt8ZRCUJjb50q59JqCjnKMbjVHPH8nJR6JuhR1lAqM7CMmZIyzsma3CuRvhqDU+R1ENIMDsxBzhAPy7h00oiyGmX3b7lxbbVOzsUMlUj6GFTwRpJh2HhBM9ETMJPjlbNKRjQiEp5Geym/dS1GmGT84hPoliIh6w6g35wYKk7xJzI1sM6SpgpYaRE6YzLE72gZA3j9UV+kxXbscXIAL+7p7g4QjQ67T/n/M1LmTpC24UsTVrEplSyg4mdJd6Dj6hm6x+B25LiVWWFPpBzXOEVqd0Cm1jXctm9q0CrP8rz0cFgMQbuOKniIzcUkg3/sNiksL9lJAELeNC4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PA2PR06MB9112.eurprd06.prod.outlook.com (2603:10a6:102:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:45:24 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:45:24 +0000
Message-ID: <b4bf6cca-2eb6-4961-b9ce-08d9a4565c42@vaisala.com>
Date: Mon, 19 Jan 2026 11:45:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
From: Tomas Melin <tomas.melin@vaisala.com>
To: kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
 <202601150836.Yk8DcSZW-lkp@intel.com>
 <fded3e4f-f292-48bf-aea7-0c8e71f7e056@vaisala.com>
Content-Language: en-US
In-Reply-To: <fded3e4f-f292-48bf-aea7-0c8e71f7e056@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0005.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::19) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PA2PR06MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba23561-e57e-4733-a442-08de573f780a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2dZcTFDUFhncGlHWitaTC90QjdWM1hOSzFLcjNHUjNqN1NMWTFPRk0zbXMw?=
 =?utf-8?B?Q1BGRm9NZ2NJSGh4TFkzanJydTRCQm1qTkxod3I5bkR6SnA4ejBHdnU5eXM0?=
 =?utf-8?B?dDF1SlNvNjQ5dHNWSVBjeUJiclExQzFTZUtKdmVQL3NlMnRxMDJaZEdxVlhz?=
 =?utf-8?B?eG02YWd1VlYvQndYWEZ3R0sweEYyYVUvc1BMUkJsT0pCQ1dvTGxSNXhndWdm?=
 =?utf-8?B?MXNKL3c2OWxxNHFjNHF4Qm91K1c5bHludHQ5OStTeTNYSDlRTVZucUNTRUFN?=
 =?utf-8?B?L1lvcnNiU2ZiemxULzNpcUFyWEpuZ3QxdTl1dWo1R1BXazFJSUozMXcvMXBs?=
 =?utf-8?B?RldlMjdJbFZmaFl4bTN4TjdpWWZJai9QSjBMVU0zTldOQ09TK09NajI1WEhV?=
 =?utf-8?B?Q2M4QmhoWEw5ME5CNXdTakhSNFFMUGE1VWpXeXdIaU1VMkdrdXhrdllmWC9P?=
 =?utf-8?B?SWkvcThnbmQvNmZsNWd2TThUNDVVMnBoOEZMQ3h6UTFkbHdhMDZRSXVxaGNE?=
 =?utf-8?B?YjFqQ2dCRng0UUVPM0x5TzhRVzJRQStGaXhXMGNBamhiSUJDSEhydXVGUzZY?=
 =?utf-8?B?MTBWZDdXb3J4bWlQQ08vSzdrWlhYa2ZUY096NWZNRVErZ2RoZVRNbkwzWDMz?=
 =?utf-8?B?cTdXREhqdTRUWXY4N3NtVlo2dFRvMDhZTHFTb2dsK01sOHQvS2QvZVcvZFho?=
 =?utf-8?B?R1lraHJjYkpZNzVFZFRzMlpEUDJGMUVEQnlBK1UvUWFCaTdYUGNGT1hobVlC?=
 =?utf-8?B?bXJPNWJ5ejcwRGlXS01LOW1oRW14Rm0vK0ZiWUpYV3RyeElwbWZhL1VEdjlB?=
 =?utf-8?B?alBRRnlNTk9rTTYxYzRJb0dmR0xoK203dkZXczFCOWtmd1IzSEUrU1BVczhp?=
 =?utf-8?B?UHg2U2RycjR0alFlL0xyU2p4WE56T3ZGRnE2ME5aM0ZMN2lEUGVEWDVsL0VY?=
 =?utf-8?B?RzRLTEovMm1DUE9GVlBzNTZQUndxVVlGTWJBYmdPTUtOL2pmdmxZS1haeXN1?=
 =?utf-8?B?Q2tpSFluV09rc3lLMkdJcHlBb05Sc1ZPYlV1dHI5YVhmUm9IczFXT2RqM0Ev?=
 =?utf-8?B?SEZBUXNNSHF2cEZPL1k4YkYxc294emg3d0pGU09ROGVvTUJWMUtJOG1RcUFZ?=
 =?utf-8?B?SVZYbXlQQnFHYklyam5FTnNhRG55eDhiZHl6RlVxc1FiR1VYYmlqN3AzblNQ?=
 =?utf-8?B?R3RsWXNBcmxzOXBEdlUrSTFXcHBvU25PNFovWDBWVWZvLytac2s4UDdIdlpL?=
 =?utf-8?B?Ym5vc0VBdWxMS2Y3M1NzT0FmYlRiVHcwWmpZdy9KRHRZK3V0L214QjFCaTN5?=
 =?utf-8?B?YVBSa09tWkttOEtFdWdybE1ZSTZ1eTNxcmxuUUdQUXV0cDl3SnE2YVNIMUlX?=
 =?utf-8?B?SFNzQTNtUUpqZm8zZTFTdXlqM2FFZ0FOYlc2ZVJkd0Vlb1FYVmxkd1A1aHlm?=
 =?utf-8?B?U0doOTFHVE8wUGVGaTlsa2UrTExJZnZpRWtVSis0MzJxaENXMS9Gb3dwOGZW?=
 =?utf-8?B?UmIxTi9VaWRWUDBlSGxrY3E2bHJqR0Q2a3dqMnBLcVpoSHFQQVppNmVzTnBo?=
 =?utf-8?B?SUgxbjNBRGRma0xCektrMEFLUkdrVkd0SlZVTkJqQ3hEeWQ4ZUxoRHpmOGV5?=
 =?utf-8?B?aWRId3ZVaXNkN3lkSCsxKzdaOXFRVVFlU2NjY2UwNSsvV2U4cVNUWVVlb3Nx?=
 =?utf-8?B?bTlHb2FjazR2dHlwYXRCU1VJU1lZdjcwWWJNdXdCaDlzQzB1ZnNYYXo2T0VM?=
 =?utf-8?B?dVd0L29nb290UlFvYWtyMnZ3TUwvWlk4cjZvU0lOYUVIdU5wQjN6VlNXV29w?=
 =?utf-8?B?cDlrN2QzUHh2SVhjNDVCemFTQTNnU3oyZ3E5QWxoTGdFaUpVY0wybUI1dlUz?=
 =?utf-8?B?NzFpQzQxMDdTbHZVcXdDQU1CTGdoZEk2a1ZKd0RkTzNGdGFlNy84QlV3ZGs1?=
 =?utf-8?B?ZlFtVG5iYVJkaytkNUhDT2pFMy9yM2xpZVFldDNBNnlRQ084UVpiVHAxb3o2?=
 =?utf-8?B?bWFFUDdtYWJJd29wTWdJeDBYQjBnV3RRbzcvNVBQaWxuZ1YyNUt0N1dENEJC?=
 =?utf-8?B?SUsxeGpIaWEvSWtHelZrUnFPSlF4eloyN2ZBLzZGcGV3SHJRQlFsZDRnWmxJ?=
 =?utf-8?Q?7S0U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2cxUDYyVmovZEJqOGw0ZzBXcVNWNzh2WXM5UTFBQUJWWjVEMkwxNUc2MkRz?=
 =?utf-8?B?NFRablVaQmc1a2NTYzFvZThVNFhZUzBMbEFxbFdialdJSnRVUk52bDM1L0tS?=
 =?utf-8?B?QzdHaDNpRmFEYzczQ2RrQTZsTk03SkNUV0pnZDUvL2c4cG9kMXhDTVAxMXIr?=
 =?utf-8?B?RHJqbXd6VzVUUTVJM1BldXBtaXczdUhMT3NleW5UQW5YbzFxR1VBTytIUThL?=
 =?utf-8?B?NE53bzBnNldhQzlrSm9NcWVWQjNReFRYS3kwQ0tTY2I0TXFGSHNxM29rUlhQ?=
 =?utf-8?B?RllVSDZ4aDJ0emlaUlVqbnlPbkNXb0FtSWltdlU1djRTUGUrQk1hczlhdy9K?=
 =?utf-8?B?MlZJczBGbnRPTVc5dWs1a1J4NDRRM0V4ZElTa2ZTTlZDbHZFdmY4NlRlY3Mz?=
 =?utf-8?B?SWF0anRYN1RZNHE3RlBLMkltdW5vUDJiRVlsdmdkc1BXR3dlbUpQcmtSa0or?=
 =?utf-8?B?cFgzNklaQWFlT1V6RlVwb243aXdHRXRSUWpHU0dQOE9hN0tENllDMzNhSWxK?=
 =?utf-8?B?c0wyVmFLTU4zWVlUTEx1Njc3cUh2bHBiVjlDZjV5UVJDRUxXOHJwVVVxWFpO?=
 =?utf-8?B?SmJVSmZtZUQ3U3ZVcnFEaVAxVjB1cXd4amlsQkdqOGFBL2Zvd2tqcnlDZ1Ni?=
 =?utf-8?B?UVFHVUxJMml0azBqOTRueTFSQXpnTDVUdTJrMkI4VnRqaEpVUlo2bmFadXJn?=
 =?utf-8?B?WnpUeGliaGcycUtpaU0zcytaVDIxL1dBOERvenczeWZnUW40VytyWHZnaEE3?=
 =?utf-8?B?OVFiRVJCSjU2TkxYaURHTTNQY2tVUURNZzBXMGZJbkgzelllT0ZoSWlYVjlV?=
 =?utf-8?B?WS9kVk5IQmRnQTVwUktKNkVZeGpzVkFwaXNqTi8xT1J0cC93d3dwR3ZPWTln?=
 =?utf-8?B?dXdVS2ZualY4bmRWWVI4OS8vbU1LVTJmUnNTekJSR0t4T1g2OGZnclhvMVpv?=
 =?utf-8?B?K1BGZ2V3dUMwZGJCcXJ1NC9zZDZyL3JFcUt2Y005SU1tcnZoTkxvUDZLSThs?=
 =?utf-8?B?c0t4SFg0VERUVFhjTnY2czlVZ1pDT01meFVkZE0wUWp1R0l6dkRvQW5mMk4r?=
 =?utf-8?B?ZFY4UzI4Y2o0TVJzamlmQmV1THRPMVZZK1BEZ2lkbHdUT0hoaDF4czNGNmwx?=
 =?utf-8?B?RHN0azVUVElYYTdwdkIvUmJPejFyZVNzNVVTVUwva1VUaEZXM0ZRcFl2QTJj?=
 =?utf-8?B?amJjc0lrVXg2ZVBIaWtEZ25uYngwWi93RmpNUjEzZ1N3S0pBOGROcXhPeTV4?=
 =?utf-8?B?a3FXTC9QcVdlQ0dDL0p0STJSWnpUOHhScnJiL1dqbUhDbVhKbllKdWRrWVl5?=
 =?utf-8?B?QzdQeG9iRWQ5WUZNeHRrVVRkL3AxSURYMmw2WlZTQUZGQ3RFSHh6ZGV6TnJj?=
 =?utf-8?B?ekZlMGZlQ3M1eG1NSGZ3UFIzeTUxR3VxNWZUUkNiOC85NTVTRGk0STUrMDlM?=
 =?utf-8?B?RlNXSUpwTjl4YXFFcmZxdXBscG01U1M3UjEyYkFJd0YrRTR4czJ1WHBhYzZM?=
 =?utf-8?B?NkI0NDdJTVRmUjJmOVdmck50WXFDUEQrbDJmQXdCN3d2amlGaDRsOG9FbnJq?=
 =?utf-8?B?UHF5dEF5TmdlY0J0SnhoeGlFOWxIYS9MbWZEbHQ4L2Y0QzA1bkkxdzBqR3lU?=
 =?utf-8?B?OEFWZ3BWeEZvaE5IbURxTm05YnVZWC9YYkJKdkpIYUxyS2Z4ZHAzU1B5NEQ2?=
 =?utf-8?B?R01BMC92MzAyTGhJTE80U3gwVE1KMC9QZUhGZVhSU0xBa1REdWRaazVjQ0ti?=
 =?utf-8?B?R2g3QkxxN3BjWGEwRXJQUEFtVmYzeUFrRWFFYVYyZGdLZklaTlp5cVA5R25W?=
 =?utf-8?B?ZFRaLy9ocUxBbnVXNlUybzZMZklWUTJhb0tYZ2xZam9sNk9OaUE3akFudVdm?=
 =?utf-8?B?TWJBcXQxTnFFaTgwN3ZuT2p1OHd6c0xVcFZTR2VyWG9zR2tpSHZEdjhVQ2Ir?=
 =?utf-8?B?azJyWWlRQ1VRVnZNQTVQUEZUNklpMkRmYmFSYzZkRHlvV2JEenplRGZEVlh1?=
 =?utf-8?B?aDNxUUdrTVFoZURkb2E4UUxsSmtTUlJzUU9QekQ5TE15Sm8xSkQ4bVJJZzR2?=
 =?utf-8?B?ZEpLZzIzZ1U1UFdmNlRrZ3kwMUF0OUdBU1R3bVZuNTJQSmovZEx3Qm44MklH?=
 =?utf-8?B?dkNzbW5ETkVEZTJDNjZnb0lNeXZocDF1N2Z4TVZWNXoxN1BwQTV6OFNZSzdT?=
 =?utf-8?B?RWoveWl3aWtSZ1JuOVYvcEQxbk1mTlNlTWdJWGxOU3I0V09ZVGloNm5uQlRC?=
 =?utf-8?B?QWFBeW5sTjdMN05zSUM5aXNNblErd3Z3d0pDbDdsZkt5cDJQVkVnLzZyMnBs?=
 =?utf-8?B?NE5NUFErNnlEVW1YMlAzY1U2ZHliOTdheUZHTmpMTnUvb2pPYXEwSzBYaHBv?=
 =?utf-8?Q?Do0Tea8mfLqtA+m0=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba23561-e57e-4733-a442-08de573f780a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:45:24.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1besQLFL+s4QzuqWkyZl1IAdkLsCgXVcfJxDrgfoK7L4KKDlCruapQBf1dBx482etkz5fEJ/+r6u1pTX5TL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9112



On 15/01/2026 09:41, Tomas Melin wrote:
> Hi,
> 
> On 15/01/2026 02:42, kernel test robot wrote:
> 
>>
>>    arm-linux-gnueabi-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
>>    spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0x8c): undefined reference to `__ffsdi2'
>>    arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xac): undefined reference to `__ffsdi2'
>>    arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xcc): undefined reference to `__ffsdi2'
>>    arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function `xlnx_rtc_read_offset':
>>>> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to `__aeabi_ldivmod'
>>>> arm-linux-gnueabi-ld: rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0x15c): undefined reference to `__aeabi_ldivmod'
> AFAIU this is related to compiling for arm 32 bit target. Is this error
> relevant since this driver is for aarch64 zynqmp specifically? If so,
> what would be correct way of fixing?

Answering my self, I think correct course of action here is probably to
limit building of this driver for the zynqmp architecture. I will add
this in next version.

Thanks,
Tomas


> 
> Thanks,
> Tomas
> 
> 
> 
>>
> 
> 


