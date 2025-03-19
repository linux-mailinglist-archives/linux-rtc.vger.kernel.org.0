Return-Path: <linux-rtc+bounces-3550-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3DAA68182
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 01:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5833919C24E7
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 00:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C6B28DD0;
	Wed, 19 Mar 2025 00:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BUFL5vVX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010014.outbound.protection.outlook.com [52.103.68.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455BA935;
	Wed, 19 Mar 2025 00:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742344286; cv=fail; b=bLanNXAjY2vX9iTCpvhFX6MtpsNmvSgVHdOpLV7DC0jWe9HN2GEh1gE0eXPCeD0CXyOvtcDxcBNztUZXgorRx7eQGstTL5yg6tQ3h+a/PhKm2sLzoMlF8/djYqNN/mAGeNoRoZ6lr/fkZvmugI5BVROgoAdepT9I6nKL21ydNao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742344286; c=relaxed/simple;
	bh=heOerPDx2+z44356AOywBIMY6SjxCSyJi8JtRtKX//8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LRBCUwkpcl7fx4XhmHHq5UsKFW6vU3Vf+XSAn4v6SrzCmam4u8qY6twO5y3CNFY4sdLK7ux3/l9Osn++6ORXRnU99cq3DZSw/TSJ+mjVU5ril3t91q/MCXRdqiy2DEhHAU1Av3EDptLsq/IrnlwnOzcusrtGTdj0ojTFHqAZX7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BUFL5vVX; arc=fail smtp.client-ip=52.103.68.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmWdh+H3tflyKsrmLcdAk0LrCvFosR9/TK7hurkeCVK6LkVW3wvaK9/uKx14D4NqYKnzOEf/LU2KPxbJrk9tdTcwU7Vc/eDetFJybnqdbjtJmHsMaDM1+Z/K+mRZDYZIiT97DLHjtJUk6LgzdQlRSGW3BX8QiI9CRaKIdpc4Cl0KyLqhLBqCzY+mW2cFrh1binLfgul85kVKzLGiCXanzfLjZALLDDXL+kLYHj2cCilizeKpBiuq3YoUj2Z/12xgY4DzeDzg1OxR4tzcFwi2ii70bc8AUR5VNmu3KvldobuOUVsMmPibYzAQlA8OMrX8XwVNaktHCWqSLXcY0/tWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s+CUm5/PfqO6O0ioAoRTTtf7Otph0hB1hVrlpTA2s4=;
 b=qJCtJdulJnqfDeBwhllBCy8eZWS0+LmcCnuB3K1L0FXwsEgOJHzh+FK9LTEkdLasPqJoJyVU6/Mc1btl43gndsMOVHVFlJyyT4Q0FVx4yY1BZKstaBTYCjQUsoCQysNFslTpzI4q1PK292+/xXj7J5AP8maIBQ6znh312zJk7vOabJ8xIe71pLQ0VObWP2BeCDBCOJwUPRyZ4YnxHNj4VK9BK5KcWaYtA11KuTq8ShFGKuhVxyir+7wWsLCjZZy4SwC/RcdEC8625nBTeNA1PVPEockjMMAoXF4HNcw00deQw6fG0XhL+figL38L2VHNRdqQJeUCb0MwGmeJ9mrcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s+CUm5/PfqO6O0ioAoRTTtf7Otph0hB1hVrlpTA2s4=;
 b=BUFL5vVXB09iWcMwGBRn67o3qogtfFrFdxmU3cV1bjYuFg376YAI+pHczcmn9kuIOly159ZOvSfOg+2HHxmNiVUkfaIhn5eD47/ZmewDXzTORb+PlHsKJ9RLPg0aqYLAa64RYXaRDYJM4VSlA47/BKkk/VwzyXnID8QW+O208Ss2bXSFjTm3DBU6Z8g9nH0iRbcYzUBvOzqd3jLhS/lEfCSgb0Ltw2bRwNhQ5ay7ySLdoVU6Wz3vZkfI4rErWfwk5VYWhzokLk4SYdtoq6tpnIgVcMIo3fLl4yxMMSz51Zqz3WrcWJRBclYmcnUZc+HnJLagidTMFG8Pxyk6TF5/3A==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PNZPR01MB4288.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 00:31:16 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 00:31:16 +0000
Message-ID:
 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 19 Mar 2025 08:31:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>,
 linux-kernel@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0103.jpnprd01.prod.outlook.com
 (2603:1096:405:4::19) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <3e12f8d6-0eee-4ddf-83b5-f746f10a0eb0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PNZPR01MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ace8d22-daab-467b-65fb-08dd667d5c0c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|7092599003|15080799006|6090799003|461199028|5072599009|1602099012|10035399004|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WC9HU1ZXNjNrZklzRlBhc2pVbG1KdWFseFQxSjhZM3doWEVDNlZXRkNlcmxY?=
 =?utf-8?B?Wnh5SUVDSUFqdzQ1dlBGTmlQZHVZdHRrT2ZEMzJHOUFMa1VzdlhUYjVBUUxt?=
 =?utf-8?B?Zi9RT0dlQ2MyN0RhMUN5enBxVkxUcFFadGlCUHd1eGVvUEkzWTFIbkRpV0R1?=
 =?utf-8?B?WCt1a0hXN3E4V2orbjJpdzlpcUtFVkJGWHU3Wlp3cWlGYXQxTzM1WG9OSXFP?=
 =?utf-8?B?YVJsZkQ1dXBtbFVlUzN6Y3ZwMVdwNlc2NktLajhlSFlEeEs3K0cvbU1GTlFJ?=
 =?utf-8?B?SnFXc1R1THR6ZDlEbW5UOWh2dGliaWlkdit5TG1OTGtha3BLZ1E1NzZBNng1?=
 =?utf-8?B?U2J3QnVpc1VsVHJ2YjFuR25DVkdCUGk1ZkVSL09sUU0wSTJ3MmIzaVBMWGF1?=
 =?utf-8?B?czNoQVlQZUZjZTZjeG5hZzFtQ240RDN2SldrdTFmVzhNYjVVaE9KRWtFWXVY?=
 =?utf-8?B?OTQwdDZrTk5qRjlySjFoOU0rUlZpYkdWaTVVVHN2ZmtzVUFDU3ZFQUkvU2FP?=
 =?utf-8?B?SHNGVSt1K3h6K1BSQm41QzdpSDhtZUJxV2c5ZExKVlhJUnhYSWdSNVp0aHNM?=
 =?utf-8?B?YWhvcmhxZ1RvMDJ4VnBWRlBhTG4rUk9jRFd4MDR5dUE3azd4MU9hZTRVR3lx?=
 =?utf-8?B?TVVRT1dFc0l5QngrY3llaXFBODFFWVhybFZVeUZpMzJialRhRTNVemRxMFpH?=
 =?utf-8?B?b0R4UkYzMWQyWERrek94ZndqQXhIWU9qTzI0M3FJRVRyTEZjSmNIZTVOa2RW?=
 =?utf-8?B?Q05kZWg4a0FPL3BXOXFmTFhBbDhrSlViZzFtdnV5bERSYVhUOWdLV3plSHNV?=
 =?utf-8?B?NHdZc2RVb2dZVUVwaWV4bWtmSzk2MjRvbkpCRngvOXhndWhVbU9nY1hZeE0v?=
 =?utf-8?B?N1B0NTIza2IzUDYxVGM0Y2p4UGorTitwLzQ4M2Npd2dmWjlKd201dk5Xcyty?=
 =?utf-8?B?MWlOOTV5UUQ4ajBaZjZTZVFwS3FKY0l6YlRtbTFwNTBFZmZoS2xnMFF6Y3BE?=
 =?utf-8?B?SWo0a3ExL0ZraWQvdjAxK0Eyb0VlNzBYdHdoYlNjdVZFSjYvYURabE1jUWIz?=
 =?utf-8?B?blVHUEVyanRXK2NmUE45alhtVzdQZ3o2Skh6aXQ3OXJyL0hWZ3lxbWJGNjYy?=
 =?utf-8?B?dmlWRDBVNVpzVDc3Ry9yOUJEbHBkamxZbDFRWisyZUEwR1IwRWhTZnlGMGNs?=
 =?utf-8?B?NWszMUdSSG9NUExsZlBURkxqZVFUWkNoSWdIRFZxTWpxV3JLWTFmWk45akY1?=
 =?utf-8?B?WFRRNnFhZ3hzNnBGQ3Q0a0xka1MyeVpweTNZL2pmeTFzUG1aSXlMaTFRTlBV?=
 =?utf-8?B?NFBLR0Q0UEd3ZGJsQ04yaTdSdkRabU96NXFxUFlBa01YWlQvODBQcmZhS09v?=
 =?utf-8?B?aG5Jc2RLM2hoU1VxdlRqSC83VDNzcGw1Mmp0bHpFaENSZ2VTRTd1aTZhUjFw?=
 =?utf-8?B?WnhhMTRtZjVMVnMzTHdKK2YxeVFXV2JnS1AwTVdpbGRnNWd5YUY4VEVFayt4?=
 =?utf-8?B?bzkrbXZXSFBab1E5MEhhZmgwV0xnL09WRkhENHZtWnU2VmR4ZXpaUVlNcWMz?=
 =?utf-8?B?YjdSbmZZY2JkQ3VrbEkwRXZYbTFPZ2ZTdGV0RElyMjZ2NDNGeDNzVXlvU2sy?=
 =?utf-8?B?L0N5SnpuNUtWdU5qWDFKYWZMMDhEdUdpWFB6TExGNVd3THpmOUk3dUdwdmhI?=
 =?utf-8?B?ZVY1V256UjhqL0JtL0NFd05GbjNrNWt4SW5HakxXOTQrQzZ6MTdNd1pscmpx?=
 =?utf-8?Q?EnuNgtYq1fQyS9gpn5ii07afSxOZPtA1DWZZ0gI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amIwT2JtTkRtRmZMTVFQckpJZElUdDl6d0hoZHpOVVYwOFFLYzdKWDNVOXE4?=
 =?utf-8?B?M3lUMWRGVDlhUHJ1eGtQYlBMQjJwSHBTM3l5Q09VQis2OUF0QXY4NXBNSXEw?=
 =?utf-8?B?ZVhEVGhKVDJFR2RZQnBKQU12T016VDlvN3pBTHZnUnlaR2RvKzlUdHNWNDF0?=
 =?utf-8?B?TmlueTREclRaakVnUnFjaUVqNTdVWmVFN3NscjJtMHRZdnVaYWUyVWsyQzBE?=
 =?utf-8?B?eHp3QzJNV0twbXJ0WTBZYVdiWHJKaW1OS1J2T0MxOHIwWlRlNFhvbXFWT1VI?=
 =?utf-8?B?SDhGcHFZbW1RSkV2d2JmTW1IcW1jaHdkR1lZSWFKMDEzSVVRNkhDNzI1S3FL?=
 =?utf-8?B?RzhVaHZDWGFBdldMYzhhZVFCNUl5bnBVY3FUWG1sV0tCWXRYck5XcnVYY1VH?=
 =?utf-8?B?YkRveThOUHJ2RmF6M3gwZDJkTGhuakJaSmtzTGZMOUlza0xGMm8rTkJraFB0?=
 =?utf-8?B?MzRZemduaVBMTlpab0FZN3NIdzJTaFI0UjFCTHdtNHdPbjJWSFdxMFRvd0ZW?=
 =?utf-8?B?dm1zWWlRTEpDMW9lUUtyYkQwSjNlM3I5RnZlb21INmdtbzRIV0FhbWpSR09O?=
 =?utf-8?B?TFc0MisvTHdNK2VhaE9LSDQwdnFWQkIzbmk4dnkvSi9mUk5kcXR3T3FqTXlm?=
 =?utf-8?B?K0xGcm9RUkFYaVJnV0xEZlMyWkpCeEdrdG1Pb0p4d3Fiek9GdUdENmtaNkg5?=
 =?utf-8?B?Tzd1UXZpSzlKa2R3Z2NYek13emd1dWJOVC9YR0dsa0ExMkZZbFR0UE51alFQ?=
 =?utf-8?B?UG1hN2NQQmJtZ2dzaWVxS1diaXhIanRVQmlud05sZVJ6ckQyY3A0ZVVhbGxB?=
 =?utf-8?B?dm9vQyswWkZ2OGljWGJEdSt5T1JEd0Y3VWNhSWQzNHRoSG5SVzlZcnhnTDZ5?=
 =?utf-8?B?cE9YMTExYTVRZ0xINkJqNWhxVnBWNVNoY3VMbXVkSEI1azZ1VGI2ZVBYYitj?=
 =?utf-8?B?L0VaY0FKWDNUOTVHd0pZQ1RCbEI3L2UvaGsvTXRjcWNXd0JuV3ZkOFJYZ2NX?=
 =?utf-8?B?MjQrRGxnNGQxQ0lySUpya2RsU21ZRFpvUjdRcWlvOXhlejBBdlZ4ZWQ4d25s?=
 =?utf-8?B?SFJpUDAwV09yejY2SDFEeWQ2SjdZcDI4QUhUc1VQTnNXMmI4a0dsbE82bFNC?=
 =?utf-8?B?OXNSVE5hcUdyeUgxcExJMjhvLzdkeWcvcHFRcWR0cWlMRjhPN2kxTnQ2THJU?=
 =?utf-8?B?WTQrZDlSb2RnTHVDSWcwQ2ZvQUhXaE43YUJ2clV5R2l3T2s3TlpYd01hdVM1?=
 =?utf-8?B?MmFMaERhWUdLZ3RHQTN1cVJ0OUJDNC9uMWg2Y3VIcTgrNWhSd3JNcEdOdkdx?=
 =?utf-8?B?N2R5NVczbFlFcER1WWR2RHNhWTNBUG5VUlZGc2RLT0F0Tkg1OXRCVnBvMEFG?=
 =?utf-8?B?RnNaSGRmZ2dqVTJvSkQ5NGJpZnl2ZDNhMjVaeTBaeEZmT0VRMFBFVzBsK1Ax?=
 =?utf-8?B?bVhBMHJDREh2RG4yM2pmaUVRRkVZZGhHekZmWkxvUW9BS2szZlc3S0xkaHNy?=
 =?utf-8?B?UTBPc2xCNFl2aDhGaU9mTHY5Uk1OUTNFekptZlJVb2xpalg2N1JLZmpzdVdE?=
 =?utf-8?B?Q1ZGWm5HTWQrSWRBMWF5NmtrSHAxTzdvN2s5SEZVek5KRnlnK3grVThoaVlP?=
 =?utf-8?B?N3FoaTVkbU5CWE9kRGUydGt3MS9XbEcyQzE2aXZwZ0I5MnUwTFZ4VDNuRU1P?=
 =?utf-8?B?K056NTYxQlRSVWZKei9aZWdGS2pINWo1YVFCVlJLUXFNV1E0ajJ4VDZnZDFx?=
 =?utf-8?Q?FtEWTiT6NR4wy/j6KhClWqZTEUFQ63FuVP0BfAQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ace8d22-daab-467b-65fb-08dd667d5c0c
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 00:31:16.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4288

Hi, Inochi,

I see Alexander add "drivers/rtc/rtc-cv1800.c" in "SOPHGO DEVICETREES 
and DRIVERS" of MAINTAINERS, would you like to take this?

Regards,

Chen

On 2025/3/16 6:49, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
>
> Implement the RTC driver for CV1800, which able to provide time alarm.
>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v14:
> - platform device name "cv1800-rtc" -> "cv1800b-rtc"
> v13:
> - Change in the Kconfig dependency caused by the move of the previous
>    patch from MFD into SOC
> v12:
> - added MAINTAINERS entry
> - depends on cv1800-rtcsys MFD driver
> - use syscon for regmap
> - get named clock from parent MFD
> - corresponding platform device is expected to be instantiated by MFD stub
> Changes since v10:
> - only start RTC on set_time;
> Changes since v9:
> - further simplified bitmask macros;
> - unconditional RTC start (rtc_enable_sec_counter()), otherwise
> didn't start on SG2000;
> - dropped ANA_CALIB modification (has been forgotten in v8 with
> the drop of SW calibration to switch to HW calibration);
> - successfully tested on SG2000;
>
>
>   MAINTAINERS              |   1 +
>   drivers/rtc/Kconfig      |  12 +++
>   drivers/rtc/Makefile     |   1 +
>   drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 232 insertions(+)
>   create mode 100644 drivers/rtc/rtc-cv1800.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac15e448fffb..be8fee50a49c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
>   W:	https://github.com/sophgo/linux/wiki
>   T:	git https://github.com/sophgo/linux.git
>   S:	Maintained
> +F:	drivers/rtc/rtc-cv1800.c
>   N:	sophgo
>   K:	sophgo

[......]



