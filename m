Return-Path: <linux-rtc+bounces-2624-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234B9D965F
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6EF1285F48
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C771D357B;
	Tue, 26 Nov 2024 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ICGdlxh9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E131D1F4B;
	Tue, 26 Nov 2024 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621474; cv=fail; b=a0fXB+zkX4Qs070ePzlFw81oQQ2fMEd3iquNWAWIDIhKCf6Cin+wpUEtE2DRhDpGz8rU40ojqrWVjxQUtVUFtGnewSHyhf0xulpkQciYU2Pc7PxwtVE2Lw0/yx5ydztxgGSoMjhkApq4Rtqzi3FdXmMFOzflO9Jh5M2puY1OCIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621474; c=relaxed/simple;
	bh=ghYlrrpdO/U0GFlUgKLCeTLQf/z286Ld4c+VTyZ1XkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F9lZsvkKcfHtaDkc7VrmhVS+AiZ7ftJ5BujeGtrlfmOphDuthBO2e3n2IgW6YYAoTL4nsmxkZ0vR8YuwbBFUDtirCskZBVD2y2594xUtllpYkvuq7ZAs3hcsT9teMqXmjh8OpI5lIAOzy/MS0PYXv25Y54cpaWt2z3BKNVLuKsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ICGdlxh9; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbvUiQSV/F4a0/tInVM9Dp/twOCz2r9YLfwhhRx/uBxpBcQbmBfDdD7m8AlnZ0jO0Q3s+rVciGPokPMF7TvfcYlBDzfoFqWtu/57CSeYw1UBR/wikASGCwUeZhLscl5WmT6V5faBjpk9fXtdz3Yg93qLlOb4ahPi9zdEcROeli3kIQoe5+fARKrrzM00OZ77kTKq/ANshdCS2EpRFb/2iQfVRYrjrh6FUkYu7qdRqziOfnzDgvobfP2MpEe2RP5fqoFDp75KcAs8RLp0815MXW8JeXRwJrvz/jD3FV0SPiKRKogE3w/ExNBNv3KrN5f9abU0s3J9YtVGcimQp0cUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGT7f9f6ionItdWDsRmqGZGyk8+LLofWhC7Kl/ZQ24o=;
 b=uTw6aqlYSj1fXOBNoM2hi0fDgCsAVVc5LbOAk2c7fhYPOs7rfGvZ/vrWYIkOfbXCrZhxoRTFXQQg8ixfRGGZW5QSyxNXMk0GJ0pI9gN35ZzV8rq58Xm8vos18oxV0eyZQPdXnM9ouuovZCmd+css1h1spjkLRBb3arnUhVCLISfBMtM3KOSssLjQae/2siq0WhPUGhNAkEbwe1S9Xke8zcoUzaNXfR8Tv+Q6zaUwm6YAkV0yxNpJHNVzlKLtwtTqVORwoGr/LzEXD96t9KSwoRcJIPvBuU6Uj1gy5ZmRdpNfahGM0yPvICcENx9+0OnDTdzMRm4nSlQ4eggBvqbHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGT7f9f6ionItdWDsRmqGZGyk8+LLofWhC7Kl/ZQ24o=;
 b=ICGdlxh97bQLV40D1uVj549SfU8H2yBZj1OUdjGA10pwto/EfTkYA81UCEjLUnYVCbjaN/W4e9eHUoVk/dy2KHkwAUwUz6f85h1ePoOzAHE/0JQW31YKvDlbD466TXidVNTdnJQVpWEisv9vWDbYpPxNiPFZngSBphOZIChQyrF0Z3cK9O40QT7h3xCxElr0jVXuo3tJpV12czRka77kMSocUtbQb7rqKDw4Q4oqgxIHfQP8AL+ZhErfbRW2RQCWuOxBdk6ukbruyTg+h23u7922TbmD4Us60dz8EZJhBDYiJJOezVxUsWC/qLphrLOJmiipalE0WDLAblszgqoQQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:27 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:27 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Tue, 26 Nov 2024 13:44:12 +0200
Message-ID: <20241126114414.419469-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c5608f-a3f3-4f3b-4212-08dd0e0fae4a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uzc3OVA4R2R6Yld5b1FqcTZLdzlMemtJRjlWcDkzdEhCbVZ0T3NSNlMwNmZO?=
 =?utf-8?B?QXdBVHZwYlhnU0dTaDA0NTRYMW16ZXNIT0dVdlo3elR5QVhzSUNjNHk4UHZk?=
 =?utf-8?B?aFV5V2YwRkFRVDJTYXA3TnQ1SVV5bnRhZFl5eVprejhqeEJzVEJGc25sQlBC?=
 =?utf-8?B?eHk3cVdPd0RSQWZtT21iN1VsWk0zdGY2eStTNmU0SkNKaUtFVHpSdk9Pb0Ru?=
 =?utf-8?B?bllQb2ZPVWkvSG5EVjUrOGR3ajl6ai9sQmxOU3drak5GMThDVU5aTWJ0YmZD?=
 =?utf-8?B?OWxmTUorY2pIbkp4eFNBOUZ6cjAxajRuOWhmQjRYU2dsMkJEdTUwVDhJc2o0?=
 =?utf-8?B?NE1vVUNaYUNxWTNtY1ZMWEErUm1oNlVtekhaMzJsdyt0VGExb3l3M2E0MURx?=
 =?utf-8?B?ZW5ZRnhtQWRBdEVEczJZNnEwYW8xa0RIcXloK1FOUnd4WVpackRwbGNUSktB?=
 =?utf-8?B?dWNHb0h6VlpObHhRU0t2RXBwRUhxR3M5bGRoTzQzSUtyelUwbGEyODBTVDVt?=
 =?utf-8?B?NGVKKzVwSkhiVjBleFhKTmhsYnFESWN5NEJyKzAvWVkxOVRWM05jYnZ6YXlN?=
 =?utf-8?B?dkFiaTZZcHFkUWwxeklnT2FPSTdpV0V3RHMrNlZhTUJWczVhMXdZNkRCVnBO?=
 =?utf-8?B?V0xMcWNqZ0tPcUhiRjd0T0F5Q2VFaW9zditST0VjMnBrdmIxSUxRaXdSa2Rr?=
 =?utf-8?B?Y0E4ejdWUEJUMktDYzVtcTVvQ1NtanVkbDFrVWdsWUN4VURnRzMwRTlBVk0x?=
 =?utf-8?B?Q1Biby9WSGEzdWpBOEx5L2I2YVpRUUdJN0szWEszNlB0dUJWWCtLZ3c3d3hv?=
 =?utf-8?B?ZHZxUGxqdG01L3JoNDI2VERXM3BHN2V2RFFZemZ6U2REQTkyY2RoNGYwaTBi?=
 =?utf-8?B?V21HcVVkNTVKRWhOcUFaRkJPNnhlQzlGbExsSjNXWTYvcytuYTJ4ZWFseUsy?=
 =?utf-8?B?cDNrYTlldjZMY2t2d2V1cG5PR3VEMXcvWlNmTjMyZGZmcjVlZjltekh6NUdE?=
 =?utf-8?B?TzZSZCtTNnZRYWFXTEh6aHdTSjRpQWZNcWZLaThWbHNLK1R2L01tdzhlK2lt?=
 =?utf-8?B?TDJ1WGErTVR0RjF2RFpXK1VWY00wSVJGWUV1L3J2Q0JWK1lXaUNSSGRCZTNt?=
 =?utf-8?B?MlFrYVZ3aDlEOFlFQmJsbmpRelZCMU9wQzQyc3hka0t6Wi9zNndhRDhMcjJ3?=
 =?utf-8?B?QWd0cEgzOWo3TndUN3lRTHFzL2lHZmEvN0hLYzBlZVBiWllZOGwwSnh2RW9M?=
 =?utf-8?B?N21vQjVhbjNwV1g3MmwyMWhqeEl2Q0lwekU5N1BmRWZQM1lZRDhPbE9lU1JV?=
 =?utf-8?B?UjlXVTZBZ0ZXVXkrZ3FCMUExcUdTMm04VXNHSkRpbVdHMk1DenpJNk15RWR0?=
 =?utf-8?B?aU5NdzhyU1NSKzhJZ1pxblZUYllpS0hROVBzT1k1cHZROUtRNi93WTB6T0xI?=
 =?utf-8?B?RlQ0WlloNjNweHFaZGRVRzBsa0xWREUyelp1TlZVOVNSRlk3THhxVU85bnlG?=
 =?utf-8?B?NFcveVVqK2ZSbGlQMGtzY0pNeUtBdjJ3VytudHZUeDNUUk1DQmZkMU8vRWVj?=
 =?utf-8?B?bTUvaUQ5b09GTzBucmxjcGV0a2ZDZFhObHNSeXdYMW4rNFVlaDBJdEZ6cEMz?=
 =?utf-8?B?ZjE0c3F4SjhSUWR4VjUzWGhTckltVmQwdTNaWnBrRkhIQTMrWXlaRnV5MWxT?=
 =?utf-8?B?UDFHaG1GT3FGb0JIY0pXbFdpekdUKzd6Nkt4N1c1QTVtVVdjNVJlYndSVVRI?=
 =?utf-8?B?S0tCMElySVdvbnNuR1NiVkR0RytyNlFvWUIxc3Nvd05hOHo0dGdEQTByVC9t?=
 =?utf-8?B?Rnk2cmFKQmpMV0dvSTF5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWxFN0R6dU9iTFlTVFR5aGx6SEZvLzlETnFFWmdDNnhLR3VVVWZQZDlIeGlW?=
 =?utf-8?B?LzI1V1RqQUVLYWk0WFBqUnZUSDlGOEh2em93UkN0Sy8xRTFoVjIzZEZFNDNu?=
 =?utf-8?B?MlNEejhoVkY3UmFwV0c2dXF6cnlKQytEQ3FKZktyVm5Wd0IxdjBGWXNWZGRR?=
 =?utf-8?B?eHBaUXFnTFVIaURZaWt4R1crQ3dWWGVMY3Y4b2thOXA5aUoxOE4xNWRYUjlY?=
 =?utf-8?B?aHAwcW9GWUZjZitiSlRaN3NlU1FIcS9ndWNvakY4V0FhQVFLZ1NOekxrdktq?=
 =?utf-8?B?cUN5RlQ2ZXRuMUlzbHRUWlVBSlJTNlhFcm5yZW5aS09uVWFFVWZtdmhpZlJ1?=
 =?utf-8?B?ZHBReEVzZUF3QUpOVEJQRnRNU3JGY2V1MHJaLzJVaDNMb2RxU2F1Vmt6cHQw?=
 =?utf-8?B?TkU5Q3IxL3VCSlFvK29HN1FlSzFFancrU3Y2eGVXWmhlNFBMQkdoN1drdjBE?=
 =?utf-8?B?QkZ4MzhVbkFMazhnZmlXRmJwYkw0dTh5NTVRTVI4dzdMM01NSWNzZ2diTnlJ?=
 =?utf-8?B?MlNhODZoVDFGQjRIYmRSVDhBdkJkWkR3UDZER1A2TkhYMHpUcGQzd1pkWWlB?=
 =?utf-8?B?RW9jR0FZMFQzVEJUZVVZWXVzUDBZbVF4bnpBTXVpcU1YWm9URHVDeldHK3Nm?=
 =?utf-8?B?UVZ0SUduSlUzQ2JuczdoNEhYbFdIMDBDR1BmM1k5NERlTHl6SDV4ZzlXSCtU?=
 =?utf-8?B?bHYwMXdVMkMrQzNsMU01MDJLTU5HOWp4VlEvVStMWGtzblBua3JXUS9OQWFM?=
 =?utf-8?B?NVoxMzVNOUFYa1BvYmdmR3E4anYxOUpCK2wvUTZubDNEdUM1VjlrME1DNUxJ?=
 =?utf-8?B?SlNYNWNMMU5HV2I2c25RMitrV0Vsa0R5a2FHZW51eDMwZHpUYTBEcFNVa2Vn?=
 =?utf-8?B?WlY4YjZDR2dRQWFYajdLSkVjNm5OQ2duaXc0UkZnVXNBMkFvL3dtblpsczFC?=
 =?utf-8?B?aGpxdkRjRm04VTN6ZGIwTEFEcXlLMDRTenhwOElQZDc1Wm16VkFvM2luRjl3?=
 =?utf-8?B?OWdiZDc5eWZZam1IKzBJMmVxOXpIdm9OWDhUcnlFZXhmMHdNT01lRGg3UE1p?=
 =?utf-8?B?ZVBhZURrKzRRbkRMMjVod0I4NUtjb2hTRXovN2hucFBwUnVXbXBOT2FFdW1Z?=
 =?utf-8?B?NThnWDlock82RkM2MksrdHFLRzAwQlk3YTF0YmQ2bnBjaU16UG5RRXUvalFa?=
 =?utf-8?B?dGp2eUNCWm1OOHIrRHMvS3o5anZ3V1BLVWF2ZW1qTlZmSkl2dlYzaU91dGJW?=
 =?utf-8?B?cGg1dmwrTERjNDBIK1ozWDRBUWpuQllsTEFrUTZGVTMvMS9nNzkyMG9jKzNC?=
 =?utf-8?B?L1htb3dJd2NSckRId0tJdERSQVNHU0I5Y0J0d0NDSUt3a2crVVBRR2xRajMv?=
 =?utf-8?B?aUhxeTZmYkZNN3hCRkFSK2owc1M5dUJHWHcvbnYvT2d3S1NRaW1xZFpFVjlZ?=
 =?utf-8?B?VkpuWDdHZGNjZ1hwcDJtajN1aG9KU0lsNnlvOHJDemtySG5XbFlsUGJZODNR?=
 =?utf-8?B?Uys1bGJ3OElINk5WNFlsa1p0QlN6K1NCRWUzTm44clZwSEhVbjBoY01kWFlX?=
 =?utf-8?B?MzRRK2NkMVk3dU9sU1Yzbm53UHlWaTFtYTVOdmUxUkpmYlNLUWVCdE8rUXJp?=
 =?utf-8?B?a0YyNmszNy90UUY3U2UwNWg3M2wzbkVxMlA5TCtnRDc5Q3g4UjVtUTVvV1E3?=
 =?utf-8?B?RVhsMms4QmpCN3VMSG9BREpsY08zSTI4Mi9XclVJS29IUEtyellzTE41NWJj?=
 =?utf-8?B?MUhCU2w0c0ltRmRjNm9rUmVER0NRZ3dnZjFpTFYwSFdSZFE5NkNnYks1djNX?=
 =?utf-8?B?NGZaTG1WUk4vemdRRGZsUGoyQm42SmdjWElCQWdMeXhwVXVrNytyS25UTHh2?=
 =?utf-8?B?U2FDcDRaL3RHT043MDFySlJKZDhncVpvVDVWR1JqanYxdGVreVQrM0dNVlcy?=
 =?utf-8?B?bHpjdUdWRTMrdDhoWjQ1bVZMSHdUaVhMbDFvRGtYVEpJdURDUGNkMGUvN1pG?=
 =?utf-8?B?TzA1dTlVcFlFMlhCQkppbHV2eWN1T1h5SDE1N3FEWVFZM2tuaXVTbWpxK1Vv?=
 =?utf-8?B?RGVuWUt5ZmYwMDhaYlczSDFBWFdUNWZXOWZ0L0Z5ZG9hZ1E5RVN5eW5uNXk3?=
 =?utf-8?B?NzY3eHdOMG8zN1JjNDczRzZDcXNMWEwvaGYwODQwRHdnVUUvM2pmT2hUaU9H?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c5608f-a3f3-4f3b-4212-08dd0e0fae4a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:27.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oamWofeWR56AYXzzGVYr/LdUp6GbYwXPLgzw+TQTBMIfcD0eb/mQBxUu6xroO/pPU0PbaSnngrTVLp5Ln5K0Y4jZP74Mu03AEP8oCus1ULQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It can be a wakeup source
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 554 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 566 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e87c3d74565c..18fc3577f6cd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8ee79cb18322..a63d010a753c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
 obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..ad78423783da
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define RTCCNT_OFFSET	0xCul
+#define APIVAL_OFFSET	0x10ul
+#define RTCVAL_OFFSET	0x14ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_RTCIE_SHIFT		30
+#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_OFFSET		12
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_RTCF		BIT(29)
+#define RTCS_INV_RTC		BIT(18)
+#define RTCS_APIF		BIT(13)
+
+#define RTCCNT_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+#define RTC_CLK_MUX_SIZE	4
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
+ * should not be used.
+ */
+#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
+
+enum {
+	RTC_CLK_SRC0,
+	RTC_CLK_SRC1,
+	RTC_CLK_SRC2,
+	RTC_CLK_SRC3
+};
+
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	int dt_irq_id;
+	int clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 quirks;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512,
+	.quirks = RTC_QUIRK_SRC1_RESERVED,
+};
+
+static int is_src1_reserved(struct rtc_priv *priv)
+{
+	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
+}
+
+static u64 cycles_to_sec(u64 hz, u64 cycles)
+{
+	return div_u64(cycles, hz);
+}
+
+/**
+ * Convert a number of seconds to a value suitable for RTCVAL in our clock's
+ * current configuration.
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ * Returns: 0 for success, -EINVAL if @seconds push the counter past the
+ *          32bit register range
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 delta_cnt;
+
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	return 0;
+}
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_RTCF) {
+		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_AF);
+	}
+
+	if (status & RTCS_APIF)
+		rtc_update_irq(priv->rdev, 1, RTC_PF);
+
+	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
+
+	return IRQ_HANDLED;
+}
+
+static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u32 counter;
+
+	counter = ioread32(priv->rtc_base + offset);
+
+	if (counter < priv->base.cycles)
+		return -EINVAL;
+
+	counter -= priv->base.cycles;
+
+	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtccnt, rtcval;
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, &alrm->time);
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
+
+	alrm->pending = 0;
+	if (alrm->enabled) {
+		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+		if (rtccnt < rtcval)
+			alrm->pending = 1;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	if (!priv->dt_irq_id)
+		return -EIO;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= RTCC_RTCIE;
+
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	struct rtc_time time_crt;
+	long long t_crt, t_alrm;
+	u32 rtcval, rtcs;
+	int ret = 0;
+
+	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+
+	t_alrm = rtc_tm_to_time64(&alrm->time);
+
+	/*
+	 * Assuming the alarm is being set relative to the same time
+	 * returned by our s32g_rtc_read_time callback
+	 */
+	ret = s32g_rtc_read_time(dev, &time_crt);
+	if (ret)
+		return ret;
+
+	t_crt = rtc_tm_to_time64(&time_crt);
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return -ERANGE;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_time(struct device *dev,
+			     struct rtc_time *time)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc = 0;
+
+	switch (priv->clk_src_idx) {
+	case RTC_CLK_SRC0:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
+		break;
+	case RTC_CLK_SRC1:
+		if (is_src1_reserved(priv))
+			return -EOPNOTSUPP;
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
+		break;
+	case RTC_CLK_SRC2:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
+		break;
+	case RTC_CLK_SRC3:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (priv->rtc_data->clk_div) {
+	case DIV512_32:
+		rtcc |= RTCC_DIV512EN;
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		rtcc |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rtcc |= RTCC_RTCIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.set_time = s32g_rtc_set_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	int i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
+		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->clk_src)) {
+			priv->clk_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->clk_src))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
+				"Failed to get rtc module clock source\n");
+
+	return 0;
+}
+
+static int s32g_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_data = of_device_get_match_data(dev);
+	if (!priv->rtc_data)
+		return -ENODEV;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return PTR_ERR(priv->rtc_base);
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return PTR_ERR(priv->rdev);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->rtc_hz = clk_get_rate(priv->clk_src);
+	if (!priv->rtc_hz)
+		return dev_err_probe(dev, -EINVAL, "Failed to get RTC frequency\n");
+
+	priv->rtc_hz /= priv->rtc_data->clk_div;
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0)
+		return priv->dt_irq_id;
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       s32g_rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret)
+		goto disable_rtc;
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static void enable_api_irq(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
+	u32 rtcc;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= api_irq;
+	else
+		rtcc &= ~api_irq;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	u32 rtcval, rtccnt;
+	int ret = 0;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Save last known timestamp */
+	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use a local copy of the RTC control block to
+	 * avoid restoring it on resume path.
+	 */
+	memcpy(&priv, init_priv, sizeof(priv));
+
+	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
+	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
+	sec = cycles_to_sec(init_priv->rtc_hz, rtcval - rtccnt);
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	/* Reset RTC to prevent overflow.
+	 * RTCCNT (RTC Counter) cannot be individually reset
+	 * since it is RO (read-only).
+	 */
+	s32g_rtc_disable(&priv);
+	s32g_rtc_enable(&priv);
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return -ERANGE;
+	}
+
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	return ret;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings.
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
+			 s32g_rtc_suspend, s32g_rtc_resume);
+
+static struct platform_driver s32g_rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= s32g_rtc_probe,
+};
+module_platform_driver(s32g_rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


