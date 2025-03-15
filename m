Return-Path: <linux-rtc+bounces-3499-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7943A623B4
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 02:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA1319C1B57
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 01:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C356E182D9;
	Sat, 15 Mar 2025 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KfARCQ37"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3C3A27B;
	Sat, 15 Mar 2025 01:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742001097; cv=fail; b=afJtCo4tZxFXxziAK5g2Taa9eOV275baGO/XnuxW0WTzGQgPnfgLeF5QNrq/xueXsH5D4gKmtft9kXU2bLBCS0DatyR4yrsMLZ7ewk9ecuWg0eafHxmBmqxNW5kbzZUw4ZpKJLrrawe4Queh2D3TEBs+G/rIUhEH4fWi2XcqkHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742001097; c=relaxed/simple;
	bh=MPAWx84xWYukZjblY3XdFuZzSSMJmm+IAunXBOSzVkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NRJnfTb4Tx4pJGLfY8LdAdqUtllHPQhg7iIK2tVeF9ZaECNjhYGi5eTOQMK+yxfHamXRMNQ2Or0dNMzsaF1kmpqZvWvKBoCJhu/oaq39upowb9bs3M84e9LiBmUyjh7/qC8Vdch5Y8QdcxBGI5qvIlf36+ysCdi/VHyvGofgZ8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KfARCQ37; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZFxzAFiRwWjmUq7n7x/i2Z3J0uKe8wpIEf+a7Rl3T8zOhAqaBKTXUEuE0GQlUuk0FQFktl11PCUS8A481cTC5ep1j6HAF3U+CXpErq25ZOdrqyQU4Q+/uXpK0m68Z80caWCqOuG1jyfxBzTbFuBK2f6q9mS147U0Ylmq/J1mz1MnCh4sabrsEP+R+4WFrKvh8hogsGtHKcucF9lyFoa46JsS5ctyN7puwBZFBHpn7V0MDbs/J8WxHbDAX/ZoH5A+r2LWgL3oiSkNdDwNtRDe0Sn8d0w0NUtSN8hLfYji4jvp4gJjR309447JkjC3nC6zloXtPTZZASSq72T6MCepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ4IpC49WLg8XrHyDG1YHYMIGIHlfHWItwT2dAtTvpU=;
 b=BOOBP8TPQKhKWEFi0Yc+quxEAfZl3MQpISxBQtylZZr+tmI3qe2yMWGk+yMI74xkh8ALroMwawA05oDVLeWdQRptZA7ZPPEGJeao7D7syvEppxPf+PIeArFecD63ESaXK0kbOWbA3g1wWNiw4cWtutP28YCRJSUkCWDBoM2MXRcflJpg4IukkBUwHwBGh2ZFYgffRxDbtfe1N5IWCVlqzqfWImHDYgZrxWTnma8mMeiEtfNnFpHf5XWhkfIjgmbfVekotVUh2bnJ/uiWd1l6OWo1gpwRPrUfikKC2hx+TEEXomp9rwslQk/NagHjm7G3biL0WuZ2zNTtDZ91jV/pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ4IpC49WLg8XrHyDG1YHYMIGIHlfHWItwT2dAtTvpU=;
 b=KfARCQ37BxSLJavrfvvpLIkJuTfdBxTmHv16/Z8XF+p/LwEBpPkxN8TexqztnDFnFRh/LMshIMHaiv2Vqh0PdrdChtrIOV5ShxMtV/WQNvvtrGEePLsT6Xqfg2MgHYnba4hLabIl9bgsDhDoL6u2n3zNjxcIMBeaX5uZW5hwpG9InLQEJ2x7+zFNx9P8fya/5vCG+7mHdXLhNmnn2zviLEdisWkuBdZSXMBnGzg0Gfq2xj2XZLNBz+DO+lYFpa/8mRtnJTlzRuEksBuaEc57wAgcmCebV/m7SnJw1UV7LP4dJFq9o0goutUj5n8iIO7rKQiluDN0sgVT14pocbVSAA==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by MA0PR01MB6722.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:79::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.29; Sat, 15 Mar
 2025 01:11:29 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.031; Sat, 15 Mar 2025
 01:11:29 +0000
Message-ID:
 <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 15 Mar 2025 09:11:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling
 RTC only)
To: Inochi Amaoto <inochiama@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <c4d48ded-78df-4bd1-af62-c08eeff704f7@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|MA0PR01MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 2771954e-0fc6-4678-401f-08dd635e50f3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799003|461199028|8060799006|15080799006|7092599003|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TytZYS9JaDM3ZUZ1eFArQ3BCWThnbGZyY0hYbHdPdlJSVURlVDlaY252a2dr?=
 =?utf-8?B?Qnh4SndrTHdjRVpaZ1ZnL0J4bThycmpGMGM1aWxIRDc5cmhnQ2QyV2FCWlZG?=
 =?utf-8?B?ZjZickpvWlBOMDlWcGhmQTV2bUFQUUdKbUZndGhpbXVacFd2cTRpTjhrQUtN?=
 =?utf-8?B?WUpZWERwdjlBeXd2OGJUWndLUmpndzJkdmlad2JBVG01U3lGenpmSHNSWkgv?=
 =?utf-8?B?dUs2aFI2Yjc3VHhyRy9OWHhxL2U0eDJyVmN3bUdnL21Yck9zb3pUcGNtM0JP?=
 =?utf-8?B?cndHcjROV1hvSy91OHk3ZnVQNVpKK29FMVkzRXhJMFR3bk1XcFJmc3N0RERH?=
 =?utf-8?B?YW1SMmpVU2U4UzY4d3Byc01MYlN1Y21WandBRW5aZFhqaW11SUg2RFBPbE5E?=
 =?utf-8?B?dGw5a3dwRnJnY29DNGx5elJOcDQ0d3AxYVJIU0lieWU2enl5RkVYSUNUL1JB?=
 =?utf-8?B?eXNQWTZnLzhMMjk5RldoWGJHTklaL3VndUFORXFrR3pYYVpReFhvNUE2dXRD?=
 =?utf-8?B?bDBjbFhzVHJwWHdYYzMrTjlHZWNIbGNaakU2UzRxbFMvQlBSZWp0ek0zcHo1?=
 =?utf-8?B?aTFJRHROQVQ3NksvSzQvWS92c2thV25qVmFPS0NkenpaNUdGbmhNUFRBSWVT?=
 =?utf-8?B?dlVmbTVmUndYeDhoVm91ZnUyZ3ZEdzN4L2IzWUNtUlAvMC9ldkVVRm1SZVJS?=
 =?utf-8?B?V3JtVlU1d3lrUjFaMXNkOVRPN0hjazNHRzBabERQZ0p2YXJzdDhkbUdsdUZa?=
 =?utf-8?B?SGNyMHRHZThCRlRKd1RMVUcyRlBXSHdrYk4rNEVQZXNORGNRbkFHVUNKQzAz?=
 =?utf-8?B?TnJPVHpYVjJyQ2d5RDJRMy9YVlo1Q2RKY2NiZCtCTHhwNVlPTGg4WEZ4YlJ4?=
 =?utf-8?B?QlIrSXlFMGVmOTFueGNrSjNoZzZ6NVp1S0I3c2tFcG8wUGR3by9mOXFyQzRK?=
 =?utf-8?B?K1dkQ0ZFWG1qU3FwTUMxRjVpR1llZkQ2ZnozLzFvVm5QQlh5NG83cmpSTWRx?=
 =?utf-8?B?VGlGU0x1cDZWVDNDM09ZSGxwYjh0MDgxVnZrOGNFZmxFZGZQdDYxZmZxQXA3?=
 =?utf-8?B?S3JONVRRNFhzMEhkMzZ3K0YweFRTVVZqb0d3aHozVUphaVhwaS8rckRQVXRK?=
 =?utf-8?B?emliSXVBSXZmMzhKOWhoUzBhaFQwYWkzbTQrb2xLSmtiUWxYMGJMekpMU0hF?=
 =?utf-8?B?QVk2SnJmS1BPMkZkZjAxYXk0a1JPN0hXZkdpWDBFVkZDZU5HWTlLaHZjeHdW?=
 =?utf-8?B?NXAxdDZFcHNJNTg1K0VwMHI1WXNMMmI0Y0hkOHYwSDdYQ3c0ai9WVm5uLzJr?=
 =?utf-8?B?akRSMXlncU5xdGV3Y1lvSGtwU2dxb3N1bnZTRlI1SWwxVDBCajRZcUdYWG1T?=
 =?utf-8?B?bXNJeitGRE15WUVYaXJ3WFBWZzVBUStEQVpXZEVRQWJMSlNFODI0TWppOStK?=
 =?utf-8?B?Y0xFdExjWmY3S0FrTk5WRHBpQjZPWXNBVUlSMU9IendMT1M0Wm1qU3BMVHN4?=
 =?utf-8?B?dGR2NklpYVBla1lwOVVrS25CbnJzQ1ZMai9FTSt2QWVwcmZVUEl6ZXZXcHF3?=
 =?utf-8?B?WW16Y0VFQzZETURlcG5GVzR3dUNyRHRYdDdrcmc0MXZqU0EvSW0rOStJUjFh?=
 =?utf-8?B?encxMkwwT25CaXJLUXo3QjZvY3IwRmdPTWYwSEMwenNTRExUV1h0d3NjbFBw?=
 =?utf-8?B?VTEwOTU5YXArdHk5QVBQVURLZDZiOHRXbVNOK2k0Tzh5M3I1ZjArUzVMVzRi?=
 =?utf-8?Q?n3qZ2lcUwexedG5dtAtwOZV4guHq/+hqxKkWK39?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlROWi93VHZtT2gyczRZb29leEp3OVRzdXBwZmhOcTdTODF2YTRNQ3l5S1ZX?=
 =?utf-8?B?M2sycjNuaGt1SUEvb1h5WXFESndhUUdidHJSS2lNTjRlbnpJZzJ5WFkvdTQ3?=
 =?utf-8?B?Z3dZdE9WQXZyWXVhb1E3a3lkc1YyaFFIbWc3NVhGbW1NTDJQVHZ6VVdCWGxj?=
 =?utf-8?B?S3M1NjgyMCsyMElsT0pPdVRLZTZ6UU9Yeng5VGFpRHVlekFmbURwT3JnalJX?=
 =?utf-8?B?UUxIVkFtS01KcTF2QmZiMlVtWlEzeVJLTng2b2dCeEFxN0V6c2RCNGlDQ0JU?=
 =?utf-8?B?bFhHTTBhczI5WHRMdk5qMEFjSEVhUzY3dCsxRlZWNGJ2Uld0Z083djQ1eHho?=
 =?utf-8?B?ZmRkMnhBL2VFUEE2NzVJU3JDbGY3aTNhTUZHY05ORHF5RW4yUzNXVW9mTjFu?=
 =?utf-8?B?YzFqeDFIcjlvMFlnT2FSeVJFMmJ3TXdKNmtISzlRU2k0SGZoQmRqamd0UlEz?=
 =?utf-8?B?OW5jcDBjZlRKaThvMlBvMTBWd2hrWWtVMDhvZTVzNXE3ODNyZG5MMTZndmtL?=
 =?utf-8?B?T0lubW93V0VSaTJCMjBXZHBTMlg3Ymt2TUUxenJoSmd2RmprYUQvMEdXMnd0?=
 =?utf-8?B?dmtuN1ZjKzZzM0hObHpaaGZPRm1WeHdGUTRlWUtrTXVUcUI1Q2dqT1NwdEgx?=
 =?utf-8?B?dWJRanlWL3g5T0dFUlVBY0R2UFVvVzdTVkVudnliWUNuSklpNXBjcnpwS1Va?=
 =?utf-8?B?dmc5SFBVeFFHZW95UG85c05uWnVTU1NGUG5tc1lvekUvdFZJVTlocVNTWE5o?=
 =?utf-8?B?MWh5N2E5dVN4TWRScmxuZUt3VXcrbHJQa25PQTFvbUlXaWdwTkdFY2VybjJ4?=
 =?utf-8?B?VDVEakNyRk5xTUNFbTQrUkZYbVd3cDlwVzUwMVlpM3VEZ3pPNUdMd0Vnbit6?=
 =?utf-8?B?TlN2ZnFmUVBQekhkemwzUVRNdHVPazdCWnM1V1A3Mmc4U0JVMGhSWnFndHZG?=
 =?utf-8?B?NllSdURxRFhHeEprWG01b1ZaaVZld2x0bzhnNG9CWUVSMDdFSDlYK1dmN3RJ?=
 =?utf-8?B?QStkSXFQOVFzNFNZMWRLOUczOUozVXgrQXVxK3BGd0dUMFdFaFFPTXBiVGFY?=
 =?utf-8?B?MWRNSXgrM2trSmxMZU9hQVBkR1NQLzFYZko5UW5XaHM1b2w0SFJQMFlkZ2tv?=
 =?utf-8?B?c1JHOWc2T3pXZHQ5SWMzVjA3UE5tR2dFaWNBQXJhVWhXeVNkTkhHcGxoMzFB?=
 =?utf-8?B?MFZMSnQ1UDF2YXdhWlJDdXkwVklFdnc2MlNKS1BUTXYycFJOTTNaRVZxM1dr?=
 =?utf-8?B?K3czMnlTVWxtOHZEMUFGZXZGUW1tcTlXYm9XRWNnNkM0ZW16WmZZMkxsT1VH?=
 =?utf-8?B?U1VOVUxoRkVCSTR3MmVZZFgySmlYd2o4cVNzMVdmRExDbnlxK2llR2txWHZl?=
 =?utf-8?B?WWJQZFE5S3NYVHgwN3VnK0JrUXR5MW9USitGSEV5UmprNERTYXdKY1VlODQw?=
 =?utf-8?B?VVd1YjV2Z1ZpakMrbzBhQ0FQaUJNTWwvZ2hIMDliMHRtVUhRNEdldW55eUZO?=
 =?utf-8?B?WVZudURnUHFVNXdSdm9URWZXM0lFcUEzVWRaUFZzOHVUbHd3TjdxcTZSUUlV?=
 =?utf-8?B?SjBCNVFEUUNVNWh6djJMUUQ0b3MzUzJ3NVlEaUtIcDBaaXlKYSs2Q0ZOQlNO?=
 =?utf-8?B?SGFoM0lEbnhTZEdNRmJnekVtVW5YaW9wNktyK0JHNmEwK3FSVjRxc0tZT0tr?=
 =?utf-8?B?RGpsbForNGJ0SlNtVlM0RkdTZkM3Zzl6YVNoa0pmR09NcnVFcXdrUTM1WU4y?=
 =?utf-8?Q?4w3IB1aOwZiOksi736+Yz95uhmVlHMcPgSlTX4m?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2771954e-0fc6-4678-401f-08dd635e50f3
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 01:11:29.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6722

Hey, Alexander

On 2025/3/14 8:51, Inochi Amaoto wrote:
> On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
>> Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
>> comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
>> machine to control chip power-on, power-off and reset. Furthermore, the
>> 8051 subsystem is located within RTCSYS including associated SRAM block.
>>
>> This patch only populates RTC sub-device.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>> ---
>> Changelog:
>> v13:
>> - Moved the driver from MFD into SOC subsystem
>> - Dropped unused "cv1800_rtcsys_rtc_subdev"
>> v12:
>> - new patch
>>
>>   MAINTAINERS                        |  1 +
>>   drivers/soc/Kconfig                |  1 +
>>   drivers/soc/Makefile               |  1 +
>>   drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
>>   drivers/soc/sophgo/Makefile        |  3 ++
>>   drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
>>   6 files changed, 93 insertions(+)
>>   create mode 100644 drivers/soc/sophgo/Kconfig
>>   create mode 100644 drivers/soc/sophgo/Makefile
>>   create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3eee238c2ea2..ac15e448fffb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
>>   W:	https://github.com/sophgo/linux/wiki
>>   T:	git https://github.com/sophgo/linux.git
>>   S:	Maintained
>> +F:	drivers/soc/sophgo/cv1800-rtcsys.c
> Please change to the drivers/soc/sophgo/.
> We should maintain all files under this.

In addition to what Inochi mentioned, please add the following line:

F:    Documentation/devicetree/bindings/soc/sophgo/

Thanks,

Chen


[......]



