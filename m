Return-Path: <linux-rtc+bounces-2638-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468F9DAA22
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 15:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D981D166A78
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 14:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3362F1FCCE6;
	Wed, 27 Nov 2024 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HV22R6AR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5CB652;
	Wed, 27 Nov 2024 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718962; cv=fail; b=OmD7jplc29e854BAlOXs22q+ExeAXIsouyv2SpH34uAP9qR9UEiK9SMmMFddAaFCX3on50S2DCk6weq5ZuX/ESx+MAiwBrpcMV4zaVPrJHBoyH+bYyE8pUbzRzwq2K5Qv6F0XHN4ugX9M7xSwJpJUidi+b1/3pte5NLIwkrwXo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718962; c=relaxed/simple;
	bh=yQ4Z9bXwqqM+q6DBOF1L/S/AFQy8kDgVjcZAEBlQW9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K7fptV4RlXgDGNYOwQCriIlbt1vKUKrCuSnxruL7jBgXokERKCi+EaCOn0749OnPLXhdcKtOwHKbMq+IvsS3YNSVe29aQj5l8DsMwHWcc7ajqI0j3e99qXPHBwcK2Di0ehmy599zQbIe6kKKDw4PT/5UD4wIHtU9In4VydJk6xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HV22R6AR; arc=fail smtp.client-ip=40.107.20.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+CEGMScT5Gx7RFNPBajVc865VCZogT50rYsRJGjdSBeMviSzJixvmMu17XSUFsPL4Cr6wSPoprd+x33x5ceLCPmfxWuv0nhDfCuQPxd6zpY0s6vvHrIllFfYxilnsercEy/AhzEYt45ZE0kWsSACEe3W0LYJ+LC5wrEIfFhcuLyW7UBl5UeP785XrPvuuED6MNgmAwate4UbBaAc+kGlwbDlY1Td+ox7O8xYIkwcG8PC+lX6mNRRhZ5++NCVCawMYL2l0D2dw7PPqP7f5WDrRjJwvFaJjBRUiY+XDVoWrok3qqRsGZ8sZJwLd36/05PK6vMjCb0XK57qnD1GkR6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux0eOjHmvOTwW65LvXnk+TeAZ2iwgp+CTCPGmVPByCw=;
 b=pDh17Fs9TMYzbulpa9SqVKwISR5rfutE5Fn8qM5WNSnXDl8HDfyH0LUAlRf68zXvrEERvt56jCVscX/A/aymVTEyN7a6SBi2kx+IacmF0APyZxj+OyxDSSpCKLda3nqRgbLTQzh3nu7eryPjHK8+VFxS9eeN7O0QTolfT5HihUFPLkj33S9X4SDaVuxhetw8ivi2psn9NuVuQdKlaGxXSu1vKX2OYe4d4X4J3+96t5p5EYNzP25UBcPv/TQtJMV07lqpMn/v94HheS7Dg511GgPa3CWibBjVs4fvaHEnxnpQQ1WRLy645lefFTXlbaoFUOAGEhmX45aEp8/Jnur6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux0eOjHmvOTwW65LvXnk+TeAZ2iwgp+CTCPGmVPByCw=;
 b=HV22R6ARYlyHbGngD00kEVlVd4QICIE6n6tLOQUufDHt1p2ueYHh46q7gaQwx4hDorzJQXaXk7N+dH0wUsk7SnI4KDLaoputOhX2rOctJD7V/PoVyF1P2baNuyqTNMI2jLwpaa2GwnCT9tDy7efkByQfvNa5Aw7CTpvmRvmNK0hEG5fIqTXrkTG7Fd1fLXuT5ygB3YiC08a+oPV9Y/q/WpNa6fG8IDnRTDgakBs24LaDTj9ShQolpH67gXWVzd7xOVTN4D1GMRxOZ9V5a+bGzQCNyf6rAVipzFh+qbJt30avGT0TBojZv+XGmCBquXK6qxuzzQnOP4pRxeG7pSSsFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 14:49:15 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 14:49:15 +0000
Message-ID: <59261ba0-2086-4520-8429-6e3f08107077@oss.nxp.com>
Date: Wed, 27 Nov 2024 16:49:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
 <20241127144322.GA3454134-robh@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241127144322.GA3454134-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:208:be::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM7PR04MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: e204f064-f190-4674-c013-08dd0ef2aa1d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjBSemJTZkZBRWJRTko1d2pPalVoMXFNSUNFVWlNWEt3ZUdlMnhWaCtSbXRt?=
 =?utf-8?B?WVJSTlp5Nm9KUktuYTltelpLK1J5K21lbXAwS3ZUNG44bjFZWjREdkZmVmFt?=
 =?utf-8?B?ZnZweFZRV1J5ZUc3eUFxdm5BdWZTYUp6cGJXalE3SWxHdnRkV1JKbXIrTy9J?=
 =?utf-8?B?alpGek02SE9FekxrQUUxbDFJMk03R0J1UGl4SG5yVnpJNG5KcmIwVGJWL1Y4?=
 =?utf-8?B?VkNKYmJvSGdsOXVPZlgya0JLK2lvdVErblZSdVhqTUJvbHJaSnFjV2gxK1dh?=
 =?utf-8?B?RHdJNVZSajZCYVU3VlBRK0g4OXczVDlPbVpBa3VzYVlTQTU2WkZHVlViYXBw?=
 =?utf-8?B?TW5Wbks3S24zOUt5TmQxbWc1MmxjNFZyUVFiMDY1OGVEOGVmNGpCVWYyUk5v?=
 =?utf-8?B?Vys0Vmhvem1kMUp1SU0yTWxzRC9icDVINzg3L3VmUTNmakJXRWdsRkV4Rllp?=
 =?utf-8?B?TTZaNkE5UHh6aExjdTdTdEpMd3F2NU1zVDQvMFpidUlqSExpZVMyMmFDSkky?=
 =?utf-8?B?REtYb2VwVnJnZDh1Zkhjb3h1QzFwaXNpRzYwbjJld2t4MlFTVU5CaXA5UzN6?=
 =?utf-8?B?azhYOFlESG1tV3NRN0hTV0ZvZGhDb1ZIOXBWeFNjaWcvZjB6akNSaE1laG0z?=
 =?utf-8?B?MVBuQllBS09lcE1WV29kc2JqSC9aOUdySkFCNEJNQTNWdE5FZzdVOUZRNEYv?=
 =?utf-8?B?WkhkeXpLMmpqbUNTY0R6ekZWTnA5eHBHcDJYRzdISEFCQzhLMlVYdWVYTHlB?=
 =?utf-8?B?bHlzdjNCNHJ4UXU4QWQ2eTY5UnBSM0M2blUzb2NnQ3Z1VGR2a1dhUHRsSlc0?=
 =?utf-8?B?OS9maW52SWRLUnlQeDh6aytyVmxZZVVrOEhGTGdtZUpXdE5Ndnc5eWxxY1ZN?=
 =?utf-8?B?b01Vd0wwZ09IMThiMlNYNHoxUHpkby9Ec0ptYkRTbURtZlNoSEN4MGZMWHRa?=
 =?utf-8?B?amxwOEQzMG1rQmh4NCtPUFJFL3ZmdXpFckZRdkExSTMrT0lURUhTVVFXbzBK?=
 =?utf-8?B?OGpheVhuQXppWXZCTzNrMk50S291Y0JBbWRrbENRcFRTeElMM3dDdXJYL0lV?=
 =?utf-8?B?REtIMkxUWi9WRWpFdUMzeG90MXRMcVA4VEgvY2ZMM1BrQTBBTWlRTnc4K0l6?=
 =?utf-8?B?ZER4dlRSbDN1NXhpQWZHN01xdzl2VXdSY3Y5UmJsY1NGR2N6ZFkvTUtxZFUr?=
 =?utf-8?B?d2RIc0gxVjJKdVhhWkpEMWpTTHZpdUZXdW1tYnIvcnFjckhFbjg4ZUt0MzI0?=
 =?utf-8?B?VVhSVGxuQTlacnlEOGZOT2FwMjFoWmxOdHRNT2oyemphL3FKeW9oajVVc205?=
 =?utf-8?B?WGV4OVJDNXYrelErek1JRm1CdnNXNGZwUnVsa21sTThCdVhLZGtQUjlubTlM?=
 =?utf-8?B?UUxLRzFZaStHQ0ZTMU55OW5nSHd2TWhkb01qbTlvZXUvcEZITHNMVjRncmV3?=
 =?utf-8?B?aHltUHk2NC8va2VKbHBkSGhHVXU5MitTaVNDNWQzWEJxdHp4eCtsbEVhTFpK?=
 =?utf-8?B?aE5Bcy9VTTltalJ0dE5McXpCT0NJTTlDbjAwMnVPeG5LSHJYZHpWK1hpOTVP?=
 =?utf-8?B?by9hWDBhN0MwUGttbFZCOVQ3bVFnWWliV2VUN1FyMVRmVUhVK1k5eEs4WEd4?=
 =?utf-8?B?VEFWUTIzbGZNaTBnaCtGb3RmMFNOamR0cS9LMWpIQkVxdUhES1duaFJxZFp3?=
 =?utf-8?B?ZSs4UDhpREkvRmRKeUJXbW0zWlJXZXFGbFFBdFF3TCt3SUFnTm5pSGUzYmZw?=
 =?utf-8?Q?/H5CxFfW37YTKO05F9EXdXIbiHK46T6cOpjP/f5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFpzYjZZSHp3dVN6ODBCVUJRamVNUkVnTytnNTBjclMzU0h0OVJZdzY3STRp?=
 =?utf-8?B?bXYzQ1FURzlXSWptVkl0dm9YSkt5Nkl6VzQ5NURjc1Q5Ly9HWTNaeTVSUHEy?=
 =?utf-8?B?QVJFck1oVUU1YURhUmkrS1RWZGxUZW1jajNuRjY4YmNuZ1lhZGVteWg0d0tr?=
 =?utf-8?B?ejNZcjQwUVkzTEhrTnEzSmwxK1ZQMWdpTlRHdjNnQWFzRmpEamFlSU5FMFJq?=
 =?utf-8?B?UFBSYkIzSjN6NTcxYzczZE9EalNoTnBiQUQwOWtwajlneTZ6Z3pvR1VnUlJO?=
 =?utf-8?B?YXFMc2QyL0ZIRmNDZEQ4bzZyZHc4NmFaVVF2Q2U5QUNaVFJ5NndjTHEzTHN2?=
 =?utf-8?B?c2d4Qkg2M1loY2loRzdqd1M1RjVjeGwwR3kyalB4WFh2dFVMRzRuaEc4bEta?=
 =?utf-8?B?REwwYnF5anowRlVlc3Y5VW1sKzhEMmpHcG1waTg0b2FhSkdIRlpqNmlOOGtl?=
 =?utf-8?B?c1JiWlpQU2kvVUZCalpvNWV5a2VyR2h3UVQwSVkrampRajJOSERxZDZpN2RW?=
 =?utf-8?B?dFptci9LZ3UwK0xmK0VFYmFJRis1M2Z6MCtGQUkxZTFDZktCVy9LdHMwUnZG?=
 =?utf-8?B?L2RXVEJ0YVhSOVAwWTE0ZXdjUUVIdUJuUThDaWJZWVhGc2JYdlVaZmhmWVF1?=
 =?utf-8?B?WnI2aHRMYldUK1gvSzREWXFrMi9lL21HOFhZdkRnaTFXZHMrb2FhM1hVMERq?=
 =?utf-8?B?OURRQ1doMnZFQzI1dUJ5eVFwMCs0Q2tycEMybEdheU9weDJobEIrS0txTmpT?=
 =?utf-8?B?MHVhWFVCQ2loK1BrREFuRHhiaVhmUTJXVUpQUktXSmhGOXRlbURsR2ZHcG1Z?=
 =?utf-8?B?dXppYWFuZnoxWEZxeHlldnY3TG1QSldUcXhrYWVFQkFVUm9Hc3kwMDlmeHMv?=
 =?utf-8?B?d3ZLT1ptNXNGVVVtaERkZFJYSTNoMVljWmNaQkoyOEZMSDZ4NUJDUHpUNTlz?=
 =?utf-8?B?K3dTa0ZobVY5cWlPQXRVTEZTMzQwZ0RjTlZqTmR4L09Wb3dYanRzb01rZksw?=
 =?utf-8?B?RGpnckdzb3dHdDZZY3lVWGFtUGczMDVGZnB5TG5wa1FsekcyVjZaZHZSVXlZ?=
 =?utf-8?B?UHVLVHVGVm1pdk5GRkNOUzVxaUNCalp0Z25WWTVGZndMblBSNjRTSFMzakVw?=
 =?utf-8?B?MVB4YWFpS2p2N2VNbHVLc1FoQjNpUWt0NWZOaTAxWkRGc3dELysvZmRKT1RH?=
 =?utf-8?B?TGtqMWJNNXA2a2Y4RWRuRUZWNnlmamF2bWgwLzcwUzVlaGRMMkp5MkdGNnZB?=
 =?utf-8?B?UzIyazdIME56dTBBdTNPemp0ZWVxc1ViQ3hMc3RjbVZjZVNXTGhXelBzQkZx?=
 =?utf-8?B?cnpSQmxqYURRelluRFRyVGNuZVVjRmhCeGxsZXpPV1FyVDZxcTYrMlM0Q2RR?=
 =?utf-8?B?L1JKVE80MmlVSVoyTEhPQ00xNTFHemduYk5Nbkt6OGc0TFM4Tm1Wa05udllm?=
 =?utf-8?B?M3E2Vi9vSFNneGNERmgrWThOS2tZbElMMTRYQ0N2THcyRy94dlNhSTVUcml1?=
 =?utf-8?B?V2pSMm4waWpwY1FTUWg5MzhXa3RyNHQ3Qk9vTE5tcVVaYXd2Yy9tOHp3Mllh?=
 =?utf-8?B?clFpNElRQ21EZnliaHpRRDNOVWloa1plcFh5NitVMzd4MWVWRnpqeXQxVzhV?=
 =?utf-8?B?WWV1L2M1Q3NOdmVVMi96RnhYOGpOdTY3bUhTSTRPSW41ZVZYd0U3OURldHFV?=
 =?utf-8?B?RXhmRnNEMTNrZEF3aTRuaTBtbnBxMjNRZFp3MWxOS3I3L2tzL3ozdFM1dy9J?=
 =?utf-8?B?ajFDRkFZdUhQOHNzTFQ5ZEpTWXNHUTRJZGNwcjZiYlN2SUgrZ2R3Mnp4dW1l?=
 =?utf-8?B?bkZkRlNiUTJEMnRZays2UzhGVVF1NjFqaFhOZUgzOHphKzVYK1FnQldHTTZi?=
 =?utf-8?B?NUVOd2E0N1J1SXNMbHV2NklEeE82b3pnWU5aT0V6dHFuSkNXMCt0M1lSUktY?=
 =?utf-8?B?RWc0cjkvTEZxK1ljOGlQM2dUOEg2THNVODVhemJkam5nSFFpTjRYczQ0dURi?=
 =?utf-8?B?SXFOZ1NNREo4Y1d1cTFJSmcrTlAzakpCalFDYlJjTE1mK2tBclNKU2xPY25x?=
 =?utf-8?B?a1BmeTVOWlR0VzlSeEo1R3VOb0txL29CQ0VLd20rSmV0VkRqZ3VXS3pueUgx?=
 =?utf-8?B?MndaM2MrSnR4enJUVWJoQjh0WlVDeGxKemJOLzhGTDdmbUpNS09Yc3JKVTZx?=
 =?utf-8?Q?oEk4PKzaN5edW8jbA5V6b7Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e204f064-f190-4674-c013-08dd0ef2aa1d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 14:49:15.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5E+40JwUUC9nCUJMSJryPpIPzbFWCtFOWpZ5PZh8ZAPRWrxx35mqj4MDTs5+goj2PFiOvOmPSqIrjr/CbvAb5roy7ahEL0j/24iEVasdbO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093

On 11/27/2024 4:43 PM, Rob Herring wrote:
> On Tue, Nov 26, 2024 at 01:49:37PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> RTC tracks clock time during system suspend and it is used as a wakeup
>> source on S32G2/S32G3 architecture.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
>> during system reset.
>>
>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> new file mode 100644
>> index 000000000000..89414a0d926c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>> +
>> +maintainers:
>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> +
>> +description:
>> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
>> +  It is not kept alive during system reset and it is not battery-powered.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - nxp,s32g2-rtc
>> +      - items:
>> +          - const: nxp,s32g3-rtc
>> +          - const: nxp,s32g2-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: ipg clock drives the access to the RTC iomapped registers
>> +      - description: Clock source for the RTC module. Can be selected between
>> +          4 different clock sources using an integrated hardware mux.
>> +          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
>> +          available during standby and runtime. 'source1' is reserved and cannot
>> +          be used. 'source2' is the FIRC clock and it is only available during
>> +          runtime providing a better resolution (~48MHz). 'source3' is an external
>> +          RTC clock source which can be additionally added in hardware.
> 
> Is switching the clock source at run-time possible? For example, use the
> 48MHz at runtime and switch to 32kHz or external clock during suspend.
> If so, you need to list all possible clock sources. Really, you probably
> should no matter what as you need to describe what's in the h/w, not
> configuration (though configuration is okay when it's fixed for the
> device).
> 

Hello Rob,

Thank you for your review.

In this latest V5 of this patchset, clock source switching at 
run-time/suspend support has been dropped (as agreed during the review 
process). Therefore a static clock source configuration is used for a 
specific S32G SoC which uses the RTC device.

>> +
>> +  clock-names:
>> +    items:
>> +      - const: ipg
>> +      - enum: [ source0, source1, source2, source3 ]
> 
> You can do:
> 
> maxItems: 5
> items:
>    - const: ipg
> additionalItems:
>    pattern: '^source[0-4]$'
> 
> Though I will have to relax constraints on 'additionalItems' to avoid a
> warning.
> 
> Rob

Thanks for your suggestion. I will consider it for V6.

Best Regards,
Ciprian


