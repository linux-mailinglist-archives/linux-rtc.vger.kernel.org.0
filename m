Return-Path: <linux-rtc+bounces-2563-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA09CDAC1
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 09:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31C3281E47
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A518BC19;
	Fri, 15 Nov 2024 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j3x3bSXV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2063.outbound.protection.outlook.com [40.107.249.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7212B9B9;
	Fri, 15 Nov 2024 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731660057; cv=fail; b=In/NQVgpYEE81UapM2PvEvfxRHEMBe2h/BqesSI8E8pnTJURCrJar9QNBR/ROo8BeuMBGEFCyzqM4aRMheEz6X021ULuHDs0z9ucdexEtgpGfCPuxj22sXZcvOGF9Lv1mZ1e2fufxx42Z7COQThtzUY9Iseh/eC7Zm/pNEMulvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731660057; c=relaxed/simple;
	bh=UaUg1IEPi3EODk/Ugl5t9OIhmAoR1AFFXvLXQEpW798=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oRgGVlxhy5eD+PbQqfUCXsjh3KFo8znt6C6jzRwA4T4TxBYYbTgadmD9I/zmjEq22ODLgTrksKiK4Or6JuANzLZNqzCdwAItRqu/47p1e4LBbhLbC61GweuQPFfXBZbU7diAGfproUVMkXlrtFApndcTqSAMasHXlOniGN0nLG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j3x3bSXV; arc=fail smtp.client-ip=40.107.249.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poiZcz8U3/E/xjaMe4f8E3xyRtNNvEnzEITyH87L1XPgpjde0++r4QP7rT+AgqmWZVh2xkxUbM++tPw3qnzZPkzpGLcqRAIIUwNk0/2EDOhkZG8AVW9djO3A3PKixmUiviHF32qQLkduYbBkKXasUK1jgJSzCnw49yKZAAN4h8I4HnMzRsBhALltNp48kC6nhtYxvsJYvXX3kcZ04WmoX7UPNflj3A87xhc//70pzTPwHInTfFLT62DNHcLHxRpQlwWgkU/Q/E6u4yaLbEP1C5NqzNoNzMvzgiCk3sWcJU81BJEzILKp3SLW4+lFJ3f/b/a1RuqxKWl0OyuG8QoU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk0TaGd2HBC3G+7Ndzhmnpupl0VwJy9pHTcFQiymjhk=;
 b=WDokHwmY9g7+vdMEMnGzez4oWxFT0Mw9eMWLTHYV6vWTJfW3bKfnpJP3fViruUQ3KE0DisUi1pe5aPw2HDkknMZmXAsEBmHp1O+jj9b6vzLVNIWljcPY/YrzfiCjnY4NGwn9yscSIcAAcHJK0nEyDVJW4u14veX4hW0fuAdUdkdythMCTv3L8SqZHWlFkPUefA4l7pLv+/cgFZAQy+46y7jqUyzHEM1TW1NljauXffizhrwKbYqbFY6tr0Lmy+/Us9WfO3Usq8Of8z34Xl1LptQ2xYI0b6Gz1ONniW5bCZ2PvIRulH+pucBNREFcuiThGiTvTtssg1VuKir68qXx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk0TaGd2HBC3G+7Ndzhmnpupl0VwJy9pHTcFQiymjhk=;
 b=j3x3bSXV1TjzC/Lw8qhrMBB86NbmCiS6G7KHg0+eIMVsSeHLcVBhKNCFEQnOn5E/MYpyO+b0MrbAqxcKSJUzRqiyxDtUzEuX+JZm+bl2xY5/akSnsEPnBHh0bsZ/eOmsW7bXQWoxtS/8ufI5x3+lOoFM7q6c2zbDw7RvN1ZE3nJgtKAaYf8fgw+wxkyXJoMusmw8xU934AwqLR7MlqWWwiCYdQJdnfGPx8WS2F/KCp/XY62cPV4b/1QSNXUUXmxBgXksPGWSdrJfgceHAKuBuA2W4NwAp6j97qkd8pAOOs4vZnoNj7EspXCRGuj38h+6F9gTMoEqYs1dZlVYDvhcjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 08:40:49 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 08:40:42 +0000
Message-ID: <c6d3b7de-ee23-4a68-891e-7b37ae01714e@oss.nxp.com>
Date: Fri, 15 Nov 2024 10:40:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
 <2024111414423117e158e3@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2024111414423117e158e3@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9dac3c-b45b-44f1-a6ff-08dd05513059
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Smc2K1FGZEFyMFoyWHd3NS9xbFc5azVxRkZ6WXZYdTIzdHdlVlVBVkJ2YTRX?=
 =?utf-8?B?UFoxeUJqMHp0UjF2dFd2ckdTQloyNzBmVVFmeWMveFBYQmh4WEd3S3NSbFZj?=
 =?utf-8?B?d0xCakgxZG96cjk0U0xCZDl1RnRIVmp4Yml4VUgweFJYNHBJMjhuVXhjK1Fv?=
 =?utf-8?B?NmxITzhBNVA0Wm1SSmhHalVSK1BxNy9OQVdiM3NnVjRoVjFCc2NxM0JNMWpF?=
 =?utf-8?B?U0paaWNQTjROaWtkOE1zTHhjc2JlU0o5emxIcDdnaDNHWFp1M2dWTFFWc3Rj?=
 =?utf-8?B?RmRiYnp3NjY0UVliNGMrcXJmZUY2cHpCMENiMVlIaUtwRGpVclRJVys2QjJq?=
 =?utf-8?B?ZGp5SllTQUJTSW44TWxocWlUWThQeGVZalRWdEhHVHU5cWlqUGRBa0M4UTlt?=
 =?utf-8?B?VlJlbzBsOWh1Tm1iQ3NORkRCdWl1bnhzVDNCc3dHR3kzWEFxaStwVk1jN1E5?=
 =?utf-8?B?TVliUnY0M3ZPWnl1eXlDYzV1UC81cFcxWlVCTXFBaDlsMHdpbGZzdlZwd2Z4?=
 =?utf-8?B?Z2J4aVJYRndWeUU2NDVEMXFkOFlxc2RmblhhZWlNb2Q5bDZEUDl4Rm9uK0xz?=
 =?utf-8?B?R25PM1FyTVVoa2M1Z0lISEVvRHgrWHlFU25qODJzZ2ZOcVl5TlJJYUFtN3I3?=
 =?utf-8?B?ZUF6SnpjeUFrTzN3NzlRUzVmdUkwN1JFZ1BUdk9NUlppNkJKMHJIODVmTGhR?=
 =?utf-8?B?b1hIQm9aNHFFTFlDcDBBUFlQN3BmS2RpRVlGbjhSTThQa2tFOTNWN1o2UTdP?=
 =?utf-8?B?TzJMMXhmMkErWkxVZkpDbzVPS21wT0RCQ0VaZ3ZLNkErU29LeWtBLzh5VCtQ?=
 =?utf-8?B?bUsrUVprSFl5dGxUMitWanhZUmdlNG5JaVQ0L0g4cDdCK21wWHhqWEU3RGs4?=
 =?utf-8?B?d3NEWEJwZ09WdWZZVkNPM0Z2ckxUMzhMOFh6dzFpVGpib2gvSVFlS1VjNmZG?=
 =?utf-8?B?bHowN21HNGRLRjlEYzlZU09OakN2NXl2TTZwNmxXbG93WDdCeUs5OFJFa3g0?=
 =?utf-8?B?SmdNbUhnUDRjaHhGQ0tWbE1CTmFkcDI1L0k2SXNmdHdNN0tORjN3WG9mR1Ay?=
 =?utf-8?B?VFpIRGtTckI2UE9adHd2UmxjMDdlbGpHWE90dmxyTkxPOWVCbjNaNDRCYXc1?=
 =?utf-8?B?V2RxdU01Zng0bTNmWklnMzc3NXFSZEJMajhIaWdCYjcvZzV4OTJKUExNR1NC?=
 =?utf-8?B?ekJxbldZS0hLMThaemRldVh0QjVlcFpUKzRXREdHd2wweXRxcjR2SnA3c1M1?=
 =?utf-8?B?dlZtc3BWRFdZRzVHNUJIaHFuazBWSTkxeWdKRlJ1ZUM0TS8yY3VjWkNQVURq?=
 =?utf-8?B?NkFJcTN1d2VoVGJ3N05mZUo2bHdWUUIvaFVYdmluMjN6SGg2eFY0a0FvNUxm?=
 =?utf-8?B?WSs2OVhtM2pEZFFPNWE3L1ZnVmVlNFBkZlk1aG5uZzk4WnRCNUZtdVlRNTNX?=
 =?utf-8?B?Uy9MVFV3OFJOZXVIYyt0MmMwcHJEaFVpOHZXMzlLa1hxK0tyRXpzemlWK3BX?=
 =?utf-8?B?eW9JRnRQMFJLQW5iUmJQU0dab0taYmM4bmE2RStXMFdYTStHQ1VlaHJTVG5u?=
 =?utf-8?B?cmt4RVpJS2VXeE01QjZpY1BMNWNLZzRpRC84dmpuZHA0clNvMUp0cmFWeU1Z?=
 =?utf-8?B?OEJMeDY2aGYxSytLL2h5cUJJZVhWTWltcE5QaUdPT0QvM2NXZzUxOXMxbkRm?=
 =?utf-8?B?cjJEb1J3Q01zc1BKZ1NzbWN3QTcvdlV3cm96T2xCMURhZ244S1pxSHphVVcv?=
 =?utf-8?Q?bnfLeIOcRtLe+7Re4SCJqPIiGUfu3sUF2/9wFJ0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEN6VDJvV1RVdWRvVENlTU12MDRFeHJlMHQ0OHpyRnB3MzhobnB3WnRRbFAv?=
 =?utf-8?B?emRvTld1VWk1WEZ4Zm5kNWdtOUpzQXkzM1ZmVTZuNjl5ZURoaXpqTkVROUNv?=
 =?utf-8?B?YVVmV1BpZGxaMlBLQUZTNUZTZWxsT3R1L3BJaVgwNWpJMTIrQWxVYkZwY0Na?=
 =?utf-8?B?UXBQYTY3dEx2ZCtOQzRqOHJVZWtadVZPK3hOckxkYURrenRra2JLbUJQQ3Fs?=
 =?utf-8?B?ZEJnNmw3ZmsrMXYzUUU0OTVxU2VPWDdCa2hkRzUrNnhIczEvSERRbUtaRVJZ?=
 =?utf-8?B?YjA3ZmNJS05BOWQ4dGt0Tm53Smx2SkdyeEJoOXhZRmFuVjlvS1k0QzZWVkgr?=
 =?utf-8?B?KzBSdEZUVktpT1JzWnVUdVpzR2RkNUl2OW80MWhuKzNuWTNiL2R4VkdrYXRU?=
 =?utf-8?B?Q250TUxUWGtIVENXQjBIODlSNEhSbE9CT0JDbGl3dTFBdXFFZGN1ZnhzNUlq?=
 =?utf-8?B?WnQvYzBWVEVsaXVPS2ZNamF5ZjY3V09yR1dvSWhuZEFUWkhBNmZlcjEvb0sz?=
 =?utf-8?B?K2VORFVWMDQ5YUxlWkJ4Ym5BNnJ4TmRnWmxpdGN3eXFIOE1yZ1RIWEpDNGth?=
 =?utf-8?B?T0thM25URmR4ODVSVXpsdTBWUTFTVE9HaG1nc2xIQnQya1dVM2J3SUZoaGZj?=
 =?utf-8?B?TDlFOFlNcnJmQW0rdzdkWFRpemlvRHAxWTFqUUdRUlBNN21MWG0ya3Jsd2lj?=
 =?utf-8?B?Q05IczNpT29aS2tqTCtPM0Fjd3V0V1pyOU5zR1FFS0ZIaThHdi94dmlvbENx?=
 =?utf-8?B?WjJWVnQvUXJTbGYydk1KSVU2QWs0MmYvS3ZLa2tYeGNEY2ROZmhmbWV3N29M?=
 =?utf-8?B?clFPUGR5QTluNll6SlNXMk1sc2dDOEtpTUI5SnkwR3JRMlZsUjFnYUF4SHAw?=
 =?utf-8?B?S1l5U0ZpSEszTERVa05QNmdJNzJjNWlaeGV5Z3czMlhBVEdPMVNhQzZCNjhE?=
 =?utf-8?B?STRFMEpEcVFxdWF2aUtaN3JGVWZKKzlLanFNRXVVWkdSOVBjTjlGTXprb2cz?=
 =?utf-8?B?WDFuaWhzT09QZ2t4RVdVc0hnY0drLy9TeFF2Tmd5VFhDSHI0cXZPaEkybWps?=
 =?utf-8?B?Z1hwRW9aeU44dnc5dGJJYkZEc3BBdVdCQ0o0MEIzY3NNM21SRjk3MUJlUk93?=
 =?utf-8?B?Umdkdm1jd2lGS0Nid3phQmhCS0FnWUZvWTFOaHZBbWpnR0FqWTdsOVN4YUdN?=
 =?utf-8?B?Tk1IUDFNL2NiWVYza1A1MXJIUzFxamNIOXpmMEFPYzFGekhyOXdoWVZtM1I0?=
 =?utf-8?B?d2hnQlBwbTF1OHZOeWM5ZncweHY1M1dkTDluTjFjVmIxSkxoZEttRVZsSmFK?=
 =?utf-8?B?MlpoL2NYKzNjVWRqUlNjdURqSVI4Uk1LbnVZZTlGM05YUnpFQWFrcmxEVnNW?=
 =?utf-8?B?Q1BvdGhqZ00zN3lnYVFhUXlBL1prWlByZEZmT0NGTGVwY2hrbzdjeFpxRmhN?=
 =?utf-8?B?dStKZWJJWmtPU2UzZ09sNmM2SFc3MTV6R2hsWUl6OGlYNTlBbUJuZWpYb2ZU?=
 =?utf-8?B?cUU5anhNT01OcU5zQVVxWE4zaDdkR1ZwQ3RDbXpiR1dwVytUajFYZDMrbXAx?=
 =?utf-8?B?aEYyWXVRd2swdjJpSHFiWXRKdG5Gd2s3QlJjNkhqbWFpTkNZZmQwOWNKY3I5?=
 =?utf-8?B?OEphMU5XdDB0Z0JkeTU5eWtacDcvam1ZZzR5aE9KSkI2U1Y5WVNNejJMTWVr?=
 =?utf-8?B?ak95eHVDTlYybUpEQXFBcTU5VldKSlR3T254cjFIeFd2YTJwazhhWmZSS216?=
 =?utf-8?B?T2M1YlRvV0JTbTZOY0NBV2grM2Nra0c1cG9VOVpsVTBDUDBScFJzRmlSV01s?=
 =?utf-8?B?K0NuREFHNE5FZ3IwQlkrM0xab1RQUXo3eEFrY2xpUDlCM1phMkFTZ2cvY3pj?=
 =?utf-8?B?MktVR3VZU01GNjU3YkhKRUEyUWRIYnd2VVVNclhKSUp4WWFhMTdiQjdCV0RY?=
 =?utf-8?B?VnQ2alhaMWJkODgwVS9zSG1FVDFvWFYwVysrdG1JL3FRNnZCUFVGSkFreXpm?=
 =?utf-8?B?dGNJNG1vdzVZWUlaUTIrZmVsWE1HNkhibU05Z1Y3dWhuaFl4b3oxU1JoblZl?=
 =?utf-8?B?VUJ5QVVTVGgyZWNzdTBFT2RCSmliUXp1YXpFTi9qTk5Bc0lSNGxXMWc3QTR1?=
 =?utf-8?B?OEg3TDloekFab3J6K1B5SUF2eGpEUUZpRVFkNVlCaU9CZTQ4TWdSV0ROTHBD?=
 =?utf-8?Q?s4bA9HbCYUO4LX0H8em/O/I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9dac3c-b45b-44f1-a6ff-08dd05513059
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 08:40:42.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4yIOAD8FfqX9l1h8F4zN6EdJFF/ljMJnp1sMiZSqKphWGJukSfd/rPyQz2EDt7EiDV4pJ23Mks403hkSqDaAwwE6BrLGcG7YM1dSrLpeGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

On 11/14/2024 4:42 PM, Alexandre Belloni wrote:

Hello,

Thank you for reviewing this driver.

> Hello,
> 
> On 11/11/2024 15:59:38+0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> The RTC module is used to enable Suspend to RAM (STR) support on NXP
>> S32G2/S32G3 SoC based boards.
>>
>> RTC tracks clock time during system suspend.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
>> during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 704 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index e87c3d74565c..18fc3577f6cd 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>>   	  This driver can also be built as a module, if so, the module
>>   	  will be called "rtc-ssd20xd".
>>   
>> +config RTC_DRV_S32G
>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>> +	depends on ARCH_S32 || COMPILE_TEST
>> +	depends on COMMON_CLK
>> +	help
>> +	  Say yes to enable RTC driver for platforms based on the
>> +	  S32G2/S32G3 SoC family.
>> +
>> +	  This RTC module can be used as a wakeup source.
>> +	  Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 8ee79cb18322..a63d010a753c 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>>   obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..c3792b674a18
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
>> @@ -0,0 +1,692 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/math64.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +
>> +#define RTCC_OFFSET	0x4ul
>> +#define RTCS_OFFSET	0x8ul
>> +#define RTCCNT_OFFSET	0xCul
>> +#define APIVAL_OFFSET	0x10ul
>> +#define RTCVAL_OFFSET	0x14ul
>> +
>> +/* RTCC fields */
>> +#define RTCC_CNTEN				BIT(31)
>> +#define RTCC_RTCIE_SHIFT		30
>> +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
>> +#define RTCC_ROVREN				BIT(28)
>> +#define RTCC_APIEN				BIT(15)
>> +#define RTCC_APIIE				BIT(14)
>> +#define RTCC_CLKSEL_OFFSET		12
>> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
>> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
>> +#define RTCC_DIV512EN			BIT(11)
>> +#define RTCC_DIV32EN			BIT(10)
>> +
>> +/* RTCS fields */
>> +#define RTCS_RTCF		BIT(29)
>> +#define RTCS_INV_RTC		BIT(18)
>> +#define RTCS_APIF		BIT(13)
>> +#define RTCS_ROVRF		BIT(10)
>> +
>> +#define ROLLOVER_VAL		GENMASK(31, 0)
>> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
>> +
>> +#define RTC_CLK_MUX_SIZE	4
>> +
>> +/*
>> + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
>> + * should not be used.
>> + */
>> +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
>> +
>> +enum {
>> +	RTC_CLK_SRC0,
>> +	RTC_CLK_SRC1,
>> +	RTC_CLK_SRC2,
>> +	RTC_CLK_SRC3
>> +};
>> +
>> +enum {
>> +	DIV1 = 1,
>> +	DIV32 = 32,
>> +	DIV512 = 512,
>> +	DIV512_32 = 16384
>> +};
>> +
>> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
>> +	"rtc_runtime_s0",
>> +	"rtc_runtime_s1",
>> +	"rtc_runtime_s2",
>> +	"rtc_runtime_s3",
>> +	"rtc_standby_s0",
>> +	"rtc_standby_s1",
>> +	"rtc_standby_s2",
>> +	"rtc_standby_s3"
>> +};
>> +
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	u64 rollovers;
>> +	struct rtc_time tm;
>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	void __iomem *rtc_base;
>> +	struct clk *ipg;
>> +	struct clk *runtime_clk;
>> +	struct clk *suspend_clk;
>> +	const struct rtc_soc_data *rtc_data;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	u64 rollovers;
>> +	int dt_irq_id;
>> +	int runtime_src_idx;
>> +	int suspend_src_idx;
>> +};
>> +
>> +struct rtc_soc_data {
>> +	u32 runtime_div;
>> +	u32 suspend_div;
>> +	u32 quirks;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +	.runtime_div = DIV512,
>> +	.suspend_div = DIV512,
>> +	.quirks = RTC_QUIRK_SRC1_RESERVED,
>> +};
>> +
>> +static int is_src1_reserved(struct rtc_priv *priv)
>> +{
>> +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
>> +}
>> +
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +	return div_u64(cycles, hz);
>> +}
>> +
>> +/**
>> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
>> + * current configuration.
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
>> + *          twice the rollover interval
>> + */
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 rtccnt, delta_cnt;
>> +	u32 target_cnt = 0;
>> +
>> +	/* For now, support at most one rollover of the counter */
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
>> +		return -EINVAL;
> 
> Honestly, I still feel the whole rollover handling is useless as it
> doesn't bring any significant benefits. The workflow seems like it will
> always be something like:
>   - set time
>   - set alarm
>   - wait for wakeup
> 
> Without rollover support, you already have the whole 32bit range for the
> counter. Obviously get_time_left is then useless.

I understand how rollover support would not bring much benefit. We can 
live with the 32bit range available for the RTC counter. I will remove 
the rollover support in V5.

> 
> The whole clock switching code also seem over complicated. What are the
> actual benefits? The accuracy of the wakeup will always be the one of
> the clock selected while in suspend and this RTC will probably not be
> your system clock because of its limitations.

I see how the driver complexity which this entire clock switching 
mechanism brings just to use a higher resolution clock during runtime is 
not worth it. I agree, I will drop it in V5 and use just one clock for 
the RTC module.

> 
>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	struct rtc_time time_crt;
>> +	long long t_crt, t_alrm;
>> +	u32 rtcval, rtcs;
>> +	int ret = 0;
>> +
>> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	t_alrm = rtc_tm_to_time64(&alrm->time);
>> +
>> +	/*
>> +	 * Assuming the alarm is being set relative to the same time
>> +	 * returned by our s32g_rtc_read_time callback
>> +	 */
>> +	ret = s32g_rtc_read_time(dev, &time_crt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	t_crt = rtc_tm_to_time64(&time_crt);
>> +	if (t_alrm <= t_crt) {
>> +		dev_warn(dev, "Alarm is set in the past\n");
> 
> This is never going to happen.
> 

I see, I will drop this check in V5.

>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		/*
>> +		 * Rollover support enables RTC alarm
>> +		 * for a maximum timespan of ~3 months.
>> +		 */
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return ret;
> 
> -ERANGE is probably appriopriate.
> 

Correct, I will update in V5.

>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret) {
>> +		dev_err(dev, "Synchronization failed\n");
> 
> The driver is very verbose. Most of the strings will never be seen by
> anyone because this is an embedded system however, the strings will take
> space which make the system slower to boot an use more memory than
> necessary.
> 

I understand, I will try to refine and limit the error path messages. 
However, usually the S32G2/S32G3 SoCs have 4GB of DDR memory.

>> +		return ret;
>> +	}
>> +
>> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_time(struct device *dev,
>> +			     struct rtc_time *time)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +	if (!time)
> 
> How will this ever happen?
> 

It cannot. I will remove this check in V5.

>> +		return -EINVAL;
>> +
>> +	priv->base.rollovers = priv->rollovers;
>> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	priv->base.sec = rtc_tm_to_time64(time);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Disable the 32-bit free running counter.
>> + * This allows Clock Source and Divisors selection
>> + * to be performed without causing synchronization issues.
>> + */
>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc &= ~RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc |= RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void adjust_dividers(struct rtc_priv *priv,
>> +			    u32 div_val, u32 *reg)
>> +{
>> +	switch (div_val) {
>> +	case DIV512_32:
>> +		*reg |= RTCC_DIV512EN;
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV512:
>> +		*reg |= RTCC_DIV512EN;
>> +		break;
>> +	case DIV32:
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	priv->rtc_hz /= div_val;
>> +}
>> +
>> +static int rtc_get_clk_src(struct rtc_priv *priv)
>> +{
>> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
>> +			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
>> +}
>> +
>> +static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
>> +{
>> +	struct device *dev = priv->rdev->dev.parent;
>> +	u32 rtcc = 0;
>> +
>> +	switch (src % RTC_CLK_MUX_SIZE) {
>> +	case RTC_CLK_SRC0:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
>> +		break;
>> +	case RTC_CLK_SRC1:
>> +		if (is_src1_reserved(priv))
>> +			return -EOPNOTSUPP;
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
>> +		break;
>> +	case RTC_CLK_SRC2:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
>> +		break;
>> +	case RTC_CLK_SRC3:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (src < RTC_CLK_MUX_SIZE) {
>> +		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
>> +		if (!priv->rtc_hz) {
>> +			dev_err(dev, "Failed to get RTC frequency\n");
>> +			return -EINVAL;
>> +		}
>> +		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
>> +	} else {
>> +		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
>> +		if (!priv->rtc_hz) {
>> +			dev_err(dev, "Failed to get RTC frequency\n");
>> +			return -EINVAL;
>> +		}
>> +		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
>> +	}
>> +
>> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
>> +	/*
>> +	 * Make sure the CNTEN is 0 before we configure
>> +	 * the clock source and dividers.
>> +	 */
>> +	s32g_rtc_disable(priv);
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +	s32g_rtc_enable(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rtc_ops = {
>> +	.read_time = s32g_rtc_read_time,
>> +	.set_time = s32g_rtc_set_time,
>> +	.read_alarm = s32g_rtc_read_alarm,
>> +	.set_alarm = s32g_rtc_set_alarm,
>> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>> +};
>> +
>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>> +			     struct device *dev)
>> +{
>> +	int i;
>> +
>> +	priv->runtime_src_idx = -EINVAL;
>> +	priv->suspend_src_idx = -EINVAL;
>> +
>> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
>> +	if (IS_ERR(priv->ipg)) {
>> +		dev_err(dev, "Failed to get 'ipg' clock\n");
>> +		return PTR_ERR(priv->ipg);
>> +	}
>> +
>> +	/* Get RTC runtime clock source */
>> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
>> +		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->runtime_clk)) {
>> +			priv->runtime_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (IS_ERR(priv->runtime_clk)) {
>> +		dev_err(dev, "Failed to get runtime rtc clock\n");
>> +		return PTR_ERR(priv->runtime_clk);
>> +	}
>> +
>> +	/* If present, get RTC suspend clock source */
>> +	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
>> +		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->suspend_clk)) {
>> +			priv->suspend_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_priv *priv;
>> +	int ret = 0;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->rtc_data = of_device_get_match_data(dev);
>> +	if (!priv->rtc_data)
>> +		return -ENODEV;
>> +
>> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->rtc_base))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
>> +				"Failed to map registers\n");
>> +
>> +	device_init_wakeup(dev, true);
>> +
>> +	ret = rtc_clk_dts_setup(priv, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rdev = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(priv->rdev))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rdev),
>> +				"Failed to allocate RTC device\n");
>> +
>> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				"Failed clk source switch, err: %d\n", ret);
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->rdev->ops = &rtc_ops;
>> +
>> +	ret = devm_rtc_register_device(priv->rdev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register RTC device\n");
>> +		goto disable_rtc;
>> +	}
>> +
>> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
>> +	if (priv->dt_irq_id < 0)
>> +		return dev_err_probe(dev, priv->dt_irq_id,
>> +				"Error reading interrupt # from dts\n");
>> +
>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>> +			       rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->dt_irq_id, ret);
>> +		goto disable_rtc;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_rtc:
>> +	s32g_rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void rtc_remove(struct platform_device *pdev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
>> +
> 
> You really need a comment here stating why you feel this is necessary to
> stop the RTC when removing the driver. Also, you need to prefix your
> function names with s32g.
> 

I will update accordingly in V5.


Best Regards,
Ciprian

>> +	s32g_rtc_disable(priv);
>> +}
>> +
>> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
>> +	u32 rtcc;
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= api_irq;
>> +	else
>> +		rtcc &= ~api_irq;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int __maybe_unused rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	int ret = 0;
>> +	u32 rtcval;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (init_priv->suspend_src_idx < 0)
>> +		return 0;
>> +
>> +	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
>> +			init_priv->suspend_src_idx)
>> +		return 0;
>> +
>> +	/* Save last known timestamp before we switch clocks and reinit RTC */
>> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Use a local copy of the RTC control block to
>> +	 * avoid restoring it on resume path.
>> +	 */
>> +	memcpy(&priv, init_priv, sizeof(priv));
>> +
>> +	ret = get_time_left(dev, init_priv, &sec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	s32g_rtc_alarm_irq_enable(dev, 0);
>> +	enable_api_irq(dev, 1);
>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	enable_api_irq(dev, 0);
>> +
>> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>> +			 rtc_suspend, rtc_resume);
>> +
>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove	= rtc_remove,
>> +};
>> +module_platform_driver(rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.45.2
>>
> 


