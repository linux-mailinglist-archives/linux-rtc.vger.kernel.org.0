Return-Path: <linux-rtc+bounces-2275-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 512999ADD53
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 09:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D11F51F22EA6
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7318A6DE;
	Thu, 24 Oct 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="EROtkVsP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2132.outbound.protection.outlook.com [40.107.20.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDA18A6C0;
	Thu, 24 Oct 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753873; cv=fail; b=usaA+hoivAilDMwDbfQzJpTNnWzQb40/T8d+aF/aERUW8ySrAvacJqp9Xp6mctH4BAb7Asmte7pn/RvmRf5eY0sRgliEXZDiFJDvqrodYjo8g3a5B8lHZkRRBpd45jfEh+9WRulJkI7/sa2PFYKXUl6wMt8x/fxQ2QJCPwbR9WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753873; c=relaxed/simple;
	bh=Bbl8q4NagIiEoLV8YNoyG+6MBtJqsEONP6qPdFGIrYc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WzYKkx02cjpFAEAJPdhhuC1WTmzm/Tf5WmutUa/ItEMIaLR4oQ+EtK7UVsJytayRuGIgg0WWzcxnfMrZQHHIEVc996CqU2h8dx4AV1e+upnR0wwPQEnL5Oz6Q6NuNl1B5FDqZLTks+HECJhdONIcnYziZweEZmYcxH3Do25dMZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=EROtkVsP; arc=fail smtp.client-ip=40.107.20.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+5W962wGJxITP4eK8VgBtIJGq7Cv0lqiz7XXF2X/EdCm9Yjr5M4scHE0Xq4u9/96Ur7JGpYXigu2yU9otjfqbm91xwh3JYw6blmGviywEycgTGvQAJsxkacFYT8BOa4JVeohpTdmrknV94sdVqpFnHay4jaTc+WEN6NHc0ZqFVYbMiF2cPTl9M/gV3FDv5utVAOMvZBvgZVSJhP80nhZuf43WQhFpd6KCs5/RBzxivuvhBlmaVmZ9KHTZChy6XY46qLLHmlwhyT1pPrnzCGI0Riuo+49fjxUO3IYnBXnHPsQUFiwh9Unx5j3qKDJIhBV2iIPop/FAKdZO1NjVcGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxoOpqtAhm1vqV+AvmbT2h1XCdRUN264Y6PSQxanc8w=;
 b=HhRCmdEKPaxlWNcO8JRC/NlU1gzt6B3P7ujVepv9dim2EM+CmLaKMIuOHfk9TXJwztHuGt0rg1FuA5WpJII1RI3+JlRcnUDsFuP3F66JBANHKq04Q9PYIxImiMYXd9qrtnD+4Q7nkdH2vnMZ9IkLnjPYYrwWsITlB3+e52Xhr5u05iN3d8wAxq0R+vbWNPF0M9csvHk/Cm3mmRtyfzrvlECUywm4QIVrZIpRWyZvXid7QRMtaEkJQweYI5GtKYknYNGm9gVaYfUImd0i0Nvn0PC58YhetNkqfHb4I6meqmrHcFsS9F27hDfXpaWOjyTbeoS17wTb7ml0SqBbVY4C5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxoOpqtAhm1vqV+AvmbT2h1XCdRUN264Y6PSQxanc8w=;
 b=EROtkVsPId0HjTVKUNyob4xMUT/767VB7DyMUbclVrn1QQ/4qeLIcQSYxyTA+oFIl8WFUWOIUpPJd1ZHJeVMiJ46wEKVqELtitA/D7m7c40OpDLG6O/wRBcGcMgIDDzY66jsrFlcugPYs0WX8s4b3i+7xTgs21DqKpzjz9tOLR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by PR3P193MB0539.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 07:11:07 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 07:11:06 +0000
Message-ID: <36f46d44-8852-4988-9ff9-5b8bf49e2aa8@kunbus.com>
Date: Thu, 24 Oct 2024 09:11:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
 <20241022-radiator-blemish-3819dd4d94e0@spud>
Content-Language: en-US
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
In-Reply-To: <20241022-radiator-blemish-3819dd4d94e0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|PR3P193MB0539:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fa45ed-35f2-4cd5-9869-08dcf3fb0716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0FMQ1JNRk5LcFVmR2VnK21mN1RPa2ljR1JvTzAwUmhndUtVbm5ib0hBcTd1?=
 =?utf-8?B?QVh1U1o4cGZlb1htRlhvaHVxSUViaFJMV0dvdTlRbURWZjZDUlJCR0ZJdE1n?=
 =?utf-8?B?cFZBdko2cUZtZ2RIbkJyWEpNU0JBWm42eFloS3pKQ0hHT0xvcmljaW1JcDVa?=
 =?utf-8?B?NjAwOVVVb0dUMHlHdkduZHFUbmxTcUliZlY1cEM2SUFRaWx1NHo4dmtFOWlT?=
 =?utf-8?B?L1kyRGxXTTl6NWcxZEJWejVGM2d6N3Y1NG5IMXZGVjdnRXp4MWpCekMydXAr?=
 =?utf-8?B?RXpIZWwvVVhialg5UW01aTI3MDlKRkNrV1duMGRUN2hCOUQ1VjdJaDNZdGcw?=
 =?utf-8?B?a2Rmenc1N3hTbWRMYStyTGNueitrakFveHVFVHlKZm1heEYvUWJVcXJ0SXVr?=
 =?utf-8?B?Zzk5ZE9JMGR1WVMrMXpXaXJIbnk4N1I4MHJVeVFTSUdYejNQb3RlVklHTVVD?=
 =?utf-8?B?OUlJODNHc1dMWmM5S29XelVXY0NkOTlOcW14eWZsOHk5QzdLYktBRkxnTys0?=
 =?utf-8?B?bnRvOFc2NE5leWx4bW8yMUNtVlROR3EzTDBrZFNDMzVrbmRFM05pdC9ZQ0I3?=
 =?utf-8?B?Yzd4MHJiRzRvdnVVTWZBVWlqQUJvSEJ1VEROOGY5UlZVcXllMDlrY3hqZk5k?=
 =?utf-8?B?S2h6b05rakhLQWdNOXhWbUtKNWRObmk1OEFldFJDVFhaZ1puY2cyQVNEZXpI?=
 =?utf-8?B?T3Vjd0l1WEpRSFprejdGVzROMGQ4Q0dIZWdFOEZHNG1mcGFnL2loNldpN1Zv?=
 =?utf-8?B?WkpmOFpJbEFyUy9pTG5TZHIxbXNpU1RORmtFeWZHUEdRcW8vRUI3My9Tb2VZ?=
 =?utf-8?B?VlV5N1Fsemp1Zmw5blp1MlJVZ0VLMncyelo5OG04eXl4WWZSQmVGNWZWUndl?=
 =?utf-8?B?dnkxS2tMdGtGYUI3WVNJR1FMY0VNeXI0Nm8vZGQ2bXphSHBjUW9NL1dDRjdq?=
 =?utf-8?B?cm5SOXJnM2Rjd3dmR3FOQnV6dDR5ZWhKbXB4VWx6czJOdEhNVFJMUmZ2NmFh?=
 =?utf-8?B?UTNaNHBGcUtnY1pKMGU3ZjBXMFMrS0pEdmswYW5NdkNLQjdXUVhvZDBiUU1N?=
 =?utf-8?B?eXp2Q0JDdDBEME9CeWpEbWtTUW1CK29sR3M5bjI3Skk0RWRNZ2huTDVLNHpT?=
 =?utf-8?B?eFdqL3hIV2dqaUpMZ0dkS3lhSmR0WFBVeDlRakFuRnZkeWcvempiSHpmUHk3?=
 =?utf-8?B?UkJPWklkdmZSbERYNk4yczJmcUxXaXpUU3VLVDFSQU5rSUdvc2VMM2lqanMy?=
 =?utf-8?B?UGhQM21kTE41MHdzWXVhbFpUZmF3SEdRNlRnQVRTWmJXMFJTdmFWZVM2bG9r?=
 =?utf-8?B?VGtQTlJCUHF3UzFueEIzY205cnczd0w0VkJmcTlYbVNCYTBaZFJDVi9IbTNR?=
 =?utf-8?B?VklNeEYxNGllZXZORW4vVElOc2xqMSsvcXdsd2JvdjhtZnFuM3JEcUhOV3B1?=
 =?utf-8?B?eU5OcDhsVEI4UndPbDRxYlVBcXRnWnV5dTkrZDFVRThvbUJrTk1NdmI2emhI?=
 =?utf-8?B?OEg2TUE3Vk9FRGliWnhUbjFyYm5uNUNCVG12L0Z0OWNzNllXdzg2TmhoeFFs?=
 =?utf-8?B?d1VJSTBGcmUwWVgrbjB1aDFXbXEvY3kza1R4TkdlVWJRL1VnWXlSeVNUSHpv?=
 =?utf-8?B?MDRJOW9UQjlZTkhsbXEvTnkvRUVXWVJnWFAza0NFajdPYnNRMmk4TitwRTNZ?=
 =?utf-8?B?Q05GNi9XRTl4ZERMeU9pQjhxcVdhZkErSEd1eEJwc0Voa2xLMml0Y2ZKS25I?=
 =?utf-8?Q?b2YS5Bc+HqoUrNmvCSGsb1J2SDygqicGisujspS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzNSVG9pTDczNTh0bDl2MnZ2T1gxeDYyZUZkbldqVXNicUt0NHRnUmM2cE51?=
 =?utf-8?B?OElUTjNqS0J4OFBBdzZlV3luMG4wKzA5MnhJTTJKa2xTRU14NWdjZXBUU1Jz?=
 =?utf-8?B?ZEpsTko3U202K0MxRjlOTngzamZvQ1dKaGVEVmFhVitKeWh5TFBidGxxelBR?=
 =?utf-8?B?MEZyUXV2aDJTK1dXdGtpbDVmbVNPQ0hudXpQcjJJUElHdmN5MjRKRmpqNmRs?=
 =?utf-8?B?NzlrOHhxdlpWMjRUK2lJOWZ3bzgrRkpBRVBvUEFzV3JsdWtyZlM0U3cwK0VX?=
 =?utf-8?B?b1h4VlI0STRxYnBIdmlpTGtETHFxenN5ZkZCU3ZKbWd0SVE5eUpVakpxc0lm?=
 =?utf-8?B?TXVzMzZTa081aHpNZjJwUjFvNnVLNk1HL1JhUGZmS2UzVlZ3T3pGUnhFdE9T?=
 =?utf-8?B?RFdMNFNFRHpCbzIrV1hOWFRabXFBZXhiNEVhTFdkN2x6c2tTaU42QlpzdG0r?=
 =?utf-8?B?MWZ0dDNoYk1zNHo0Q08wMU82U2tzWnlPMGtXSjBzVEIyUEswblJXSGREeGd0?=
 =?utf-8?B?RkphQ0FsajdmVnVRV25IbnAyQkdyb2lDUVY1VWM3UGpDa0Riek0wdy91WFgr?=
 =?utf-8?B?SmN5YkZ3UkE1WCtoWHdoRnhDbGpKY2VFQVJGVStkaXVwb0tlMEI2eGQ2U2tp?=
 =?utf-8?B?SHdOT0Q3di9SYU9Zck96RmpWb2NiV2pkcWJuQzIwb0MyeTBwcFBUNEtwTUZh?=
 =?utf-8?B?bk9mY094SnpwZGliS1N3bm9iQ0tNZDFybTMvcWJiYWRqeTF0VFc3WHc4bThB?=
 =?utf-8?B?M1FTZDhub003bkJVeDFFbHF2cDV2aXM0NkNmRWpvdWRock03YlVhWm1TTGpj?=
 =?utf-8?B?ZXM5MVRBTDFwejB6ZEh5U0FyVmN5VXBDTElCZVVlYzBDd2tIQzRYblBobWl0?=
 =?utf-8?B?MGxJWGhtdU56K0ZjVEE5TGl5Wit0WkVsemU5SlNpRk5GYTlWeVN1K0lBNFZT?=
 =?utf-8?B?VUY5aU1SSFQrdUhPbVpaLy9OQUJEUTEwSG43dDZaRDd2bXprY3JVYmdhYVUy?=
 =?utf-8?B?TUhuNytuYjFHblpiRjhBZUVhdDBVMyttUDIyMEFEMk9rOStBcDFmOWZZV0x2?=
 =?utf-8?B?UDJhOURCL3lES2hvVzMyVVc5N1Z2ZnQxd0VOczF0Rng0YjllU2RyOEFNSHNC?=
 =?utf-8?B?UFVGRC9lSlUzZHFhVzhSc0IweU1TSjhYanlyN3I1T1ZkQk5lRWdlUnNoRXVv?=
 =?utf-8?B?aHdsK2ZRYWMwUjk3b3JvQjVNR0tIenJDdy9RR3o2WkR3UmFZZklmbnlGRkJL?=
 =?utf-8?B?a0dXeG4xUUNKam51TzdKakNCR2NPcW8vWkd6aFZLV3NsTFVUNUdIeUVRNjFm?=
 =?utf-8?B?NEM0eWF1NHVRUHYrN0tiN2hhdWlGWFlSTnViWlhNWjcxYnNsOVBnQ0xMYnkr?=
 =?utf-8?B?a1VncFFmTnNibTlaYkZMR3hSV1hzeVF1Q01qRnFtSGxBN25xRmNZeTkrVkZX?=
 =?utf-8?B?NDVxeU1zKzY4dGtkVXZtZG1yS2ZPVkI5VGV2OHJrcjZnTmhLNEpIaTBMbkVL?=
 =?utf-8?B?ZXorL0ZITERkY1N4TDI3VjlYL084WS9MQS9zZGFOOTlpTnZxMTdHc2NUUURK?=
 =?utf-8?B?aXVJbTlQUFpwd3Ftejd1T3B5amVKU2QzbTBNRmVoajFDQnRCQzZDOTBOaVJu?=
 =?utf-8?B?V3JNOUh4SkxBSTBYZUFtNkcrZklaNEhDWSt4SGhxOUl1N1FuY29TdlQ5dW1O?=
 =?utf-8?B?SlpPQ2JIMmpXZ24rWmpEYWZiM3I3MTZEV0RZK1ZIbERFenhwZk41bzlHYUNu?=
 =?utf-8?B?dzYzeXhMK2NJSkhZblAzN2pHUEFIOGVWSGpYVGlTUlJkUW1VYTc5djU2YW9u?=
 =?utf-8?B?cmg4Tk80dEtJd3VzblVYV0NEL3JCemw3RnNSMkphVFpUbVR1T0h3MUZXazd1?=
 =?utf-8?B?eWdMZlh0OHF0VVZFa0hRdTY1Z3VpYWhNSVJuNW40cEFIOHJ5bkpJR3I5OVdn?=
 =?utf-8?B?YTY4bWlpbjNSNWlhQzh6NVFIS2drd1RnQVpxaitiRFdCMTd0Zm5ZUjhxVThW?=
 =?utf-8?B?KzRhMUh6MjdsTDBwRllDaGd2US96bUtVeFpZdVdmdUJ3eTZXZFhzVUJIVTNi?=
 =?utf-8?B?TDFkWUVyM0Q1VDhnZjkxdGxBVGZzSDh3YkloeVBwM0VndEljd2V3ekdtcGt2?=
 =?utf-8?B?eGkweEU1Vi9lM1Y4RXE3MVJnei9tc3hTNTFNWWRhdkhpdllDUHdvUFB1R0cv?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fa45ed-35f2-4cd5-9869-08dcf3fb0716
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 07:11:06.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ldmXamVQC0k+pD2lzsTb8HK08l/alOULnIWFtCOxQEzT3ty+T0ege6C78HS8Sdm/wvRs7GiCRi4PZ7M/HlbUO0V1qkI2xI2UFhCHFXvKJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0539

On 22.10.24 18:35, Conor Dooley wrote:
> On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
>> The nxp,battery-switch-over property is used to control the switch-over,
>> battery low detection and extra power fail detection functions.
>>
>> The PCF2131 has a different default value for the PWRMNG bits. It is set
>> to 0x7: battery switch-over function is disabled, only one power supply
>> (VDD); battery low detection function is disabled.
>> This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
>> With the nxp,battery-switch-over the behavior can be controlled through
>> the device tree.
>>
>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>> ---
>>   Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>> index 2d9fe5a75b06..5739c3e371e7 100644
>> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>> @@ -30,6 +30,16 @@ properties:
>>   
>>     reset-source: true
>>   
>> +  nxp,battery-switch-over:
>> +    description:
>> +      Battery and power related configuration. This property is used to set the
>> +      PWRMNG bits of the Control_3 register to control the battery switch-over,
>> +      battery low detection and extra power fail detection functions.
>> +      The actual supported functions depend on the device capabilities.
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    minimum: 0
>> +    maximum: 7
> 
> Beyond the fact that I dislike register-content properties like this, where
> it is not possible to grok the meaning by reading the property, what

Yes, I'm not satisfied with this solution myself.
There are three different functions, which can be configured in the 
register:
- battery switch-over mode: standard; direct; disabled
- battery low detection: enabled; disabled
- extra power fail detection: enabled; disabled

I'm not sure what a proper way is to implement this in the devicetree.

> even makes this suitable for DT in the first place? Reading the commit
> message this sounds like software policy, and that different users of
> the same board might want to configure these register bits in different
> ways.

It is less a software policy, but a configuration how the hardware is 
implemented. If the device has no battery, it is possible to disable the 
battery switch-over function. In this case the V_BAT must be connected 
to ground.
If a battery is connected, the battery switchover will only work if the 
battery switch-over function is in standard mode or direct switching mode.
Until now the driver has just ignored the PWRMNG bits. As the default 
was battery switching in standard mode. Thus all use cases worked good 
enough. Battery switching was working if a battery was connected. If no 
battery was connected it did no real harm (the rtc may have used a tiny 
bit more power then needed, I guess).
With the new PCF2131 the default has changed to battery switch-over 
disabled. Now even with a battery attached, the rtc will lose time after 
a power cycle.
I guess I should describe this better in the commit message.

