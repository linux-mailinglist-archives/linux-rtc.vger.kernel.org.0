Return-Path: <linux-rtc+bounces-2621-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE99D9657
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50EE3B20BD0
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCCF1CEAA3;
	Tue, 26 Nov 2024 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B00uqy4r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336827EF09;
	Tue, 26 Nov 2024 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621466; cv=fail; b=iTaHV4hc5sK6hPpUXTiIqDvpTZZZGHVd520I6oKq8IAZcmEhr/zkoXF5tPU2eWnyrGT404bodduAh7DPhUF3IBuYFLXvQigbi3F9Wm2pn8HtglQuO+ZY4oYR1wt55O7jQDoYdxbYhevTAIOYDcsjluLNEnOAIBCGtXRU5tmsRjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621466; c=relaxed/simple;
	bh=HoUe0C6pVV4kmDj3XBaqaUM1T84TyDQTt7WeEbqigzU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sLA28qkq6ES8p2cY43c4Sat5R5Qy5j2AxCWrGhAiCsxoG2jXDmkhsPsP8AlfLv/VEeP35MH0EOkEn9gtvY3dHlY4vbVS4JTU5Aqcqyqxj9GKfVr6DX77Fxo+rq75a7RoBrDdMATmGOYQV5e2BFwzcuZb4BY3MtQe1Kov6Li7mQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B00uqy4r; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AePMjZljkdssojP87XOIMUMHtNDPbU3WfTOo9EgXsiGC88UMXw1VqevXxSAr/LJRn16cniC8+zF5T+Hc7RTJ2hE9PWUB3PaJUffA4XqPlhi91R5CUKccItqs2yVzEW6UJQweZRMf2mNLwjJm4JkY6pnOILjrRxeWI5S5BImWuN+nRDXsg62x0dWs29RNGwIfZicVNwhuvHdSRxGRd6Bn/J6QoC+9l5dHWF6JU+EY0qAu9mmKct5yC+uNY+AxSgxR/2iTS4MegEj31lTtyBxUZtAg5Qt5YQTJ598X3eL7mnHw/mb3yRLLJ767OxupA5xjO1QcFLHBIVfzlp4obviRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DdgRaImBJGrmY31w50BHnYNZsbvbj/gDz5ekYx+7Bk=;
 b=V376h7KANybjX9/JqMknCCk2NBFwOjntcXg/LuqIL1R0Ek2+HXBAeEAy1RmVzIDPHmvuwR1obinlrEYh/EuplncZO7C0vNEAURteHM7dkSbdYzik3czP3KdPfgYDbCQonY1aMHUl6uY0aAYbq7PnYggqxlY7Ru9/s8XDi4oqhJel6vDPNqeJQU9QX24UagZ3387xHuZ114CbpyXhuKdGV1U6dsHVdtdrLCLezETGukUsYMgeOnoO19L9VY2/Th9Gk2wnTvZI5KZfjR2Mi/FMRmc2mWh/U5txTifU7YQ97qxWEcG6BB/beF++H57rIbWzZOp30TEfdnBl0eRIL4af3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DdgRaImBJGrmY31w50BHnYNZsbvbj/gDz5ekYx+7Bk=;
 b=B00uqy4rAnyQgdZnoUcMdC8AANl/m8JZiOGYZ1HQs720XAmObBhQt2YZDzky0Hg/glDi7l30Wrj6qJiMxpl2F2je1K2SwPrUSDLHA9Nj0GH6+Ib4OJslcgUKckxBRg4855RGAF1pWP2ILNWeHPgGa+wVfgx6mhzr7B1ZyklPxHCzduAjr0f/xmgTJtZO9Z9c1FDDygsKKtAiwkhl72hsk8ehPyBK4Md6Bic6tdphu0p3kaNmPKVHlucxQBBlJJqVUspE9A9GkTPiis7kD0tlp5CAJO5ExdZEYneOpe/oapRSoYtAyqnkfAIqjIazwXEgqQuuKKhby3ReeFvO9y08yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:19 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:19 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk for S32G
Date: Tue, 26 Nov 2024 13:44:09 +0200
Message-ID: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0275.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d15946d7-9e4e-4b40-28dc-08dd0e0fa9c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bllqQkQwZ1JodlYvVFllaytLT3c5aDRvZm9pOVJwYWIyZVlHSnEyYlh5cUR3?=
 =?utf-8?B?dUs4N1RnT0JPNDIwQ2UrS0kvd3FJTmRnNitvQnJ1UUQ5bTZ3YTB1SkNSa1Rs?=
 =?utf-8?B?RGFsZjdLRkUweCtiZlFmaXgrSGx0Qy9nU3I2dU5oWis0VGNoZFUwTW1xeE5s?=
 =?utf-8?B?RGk2V015V3FDU2QrMWFpanNlaXAzT1ZCNi9GakxmMFI1ejNJUHZMQ0FXblU2?=
 =?utf-8?B?RUl1MDJkb2NlbVgzUnhyYm5TeTREbU82Y242YVZlY1Y3T3NDTnZZclA2KzJs?=
 =?utf-8?B?REhxdFp6TjVCbk5WQ1haaS9nbmFaTTQwMFJYMmZNajNiRE14ZE9zYlpOUHlq?=
 =?utf-8?B?OHBaVmhvRllNZDc0SStYd2k5S0pUSlk5VHZ6d3ZVZlA1UWRndlV6WkJ3TzNO?=
 =?utf-8?B?SS9RbkFGdXJaNTJUTnBZU2V2SWtHSHFKcTJtNVE1cUpSOUljNHhjZHl4Y0xm?=
 =?utf-8?B?VnUrV2xUTFZkcjljWStMa2ZmTlVmZER1UFA5M1dQT2F5OFYveFIyUlh3QXZK?=
 =?utf-8?B?dmRlQTJkdWlsSlBpckxlRWF6WXY5djZDSmVndS9QSlBzMFV6RnJwQTVRUVA2?=
 =?utf-8?B?Y0RObjlSYWZWS3Bjd3ZoaTRCR3pkZ2xaYmF0dDV4cUU4RDhucklMQUM3RWwz?=
 =?utf-8?B?Vi9qd3ZoUzRsYTNoRythbjBFZjYzMHN0MWhlcjRZTEdWUEZmcjhqaE95WGYr?=
 =?utf-8?B?aGRLb2cwcVE4dVA2aGJWT1hSUDVQRGlXbTJaVU1hejlDdnZuYzN6QjdXSDdD?=
 =?utf-8?B?ZSttZDdyMlRvU2t4Y0R3T3ZWK3AvdHNBRnkvT0dNRXNlRi80Uzg2OUlXay8z?=
 =?utf-8?B?OHdQWE84N2MvRHpwWEJ5N2dudXZOQVA4bGNmU2syZ1J4MEVaN1pBNWs4K1g5?=
 =?utf-8?B?NnRZUG9VWHdVaUVDdVY0VVlaVTdxem1MakV1UGxlUjJ3eWgxVDJEMzBBK0hs?=
 =?utf-8?B?TDNPdEFIdHlvN1BRN2czTnk1ZnFYaGIvYkNHS0FyTzViSE5jdlFKbTRXZm5a?=
 =?utf-8?B?eDVKYkFsYy92RlQ0bUkvKzNqV0IvSG1WNlZqVXJpeHNPVU5UWnVMNXlYcHRQ?=
 =?utf-8?B?WVZVZlpHZVNLY1pPcFpVQ0xWL1lKM1M4bjNtM3AvRzNIaitZK3FsYlpKdVZF?=
 =?utf-8?B?VVFmOTVUM0JXY0t2UHI4M3lpNjJldHZaWkJRMGtUYU85RkJXdlpxRVhzallE?=
 =?utf-8?B?aVBTd0ljMHpPb0RZcXgraHJnRko4WXhHK0hDRURqanpnQ3BoSzNWdFlYZi9n?=
 =?utf-8?B?YkYrZzk1N1pzNUZIQ1pmN0JzYmVJYlIwb29TZnVMWldkemVPY2cwUFZHVkNG?=
 =?utf-8?B?V25hN2t5WnBrK1ZVb2UyOUR5cldPb0plb0FmV29wVnkxbnBNd3AxMWtpTG1x?=
 =?utf-8?B?alEvZUxhVFRWRTlyRjVBb1dRUlI4Z0lYOW1oUldmM25SWC9mT2hsbitjQ2x0?=
 =?utf-8?B?eGxGUDFXcW5XMU53NG8rSDFtWWxYOXJsaDFSNjY1aGZKbERKOHJzenltbnhq?=
 =?utf-8?B?UmlHMFNlU2haaHRUMTJ6U25BNkJFZXRrU2Q1MkluU2hRZjRkakw0dlJxWHlz?=
 =?utf-8?B?TEh3SE4rV2pmM0l2SWJlK2g4aUVIVkZIVVMvSVhSeGhrNzlNbXFDZlRXa0l2?=
 =?utf-8?B?ejFTenN1Rk1YYTh6RzJOeFRuWXBaQVhWNUM3NCtuSVljUnhPS2FFS1M0TTk5?=
 =?utf-8?B?VmswUFFFaURhQk1pbGFRZFR1V2pqZUpwWEhGWGpLYXovbWV3M0VqTjMxYkl2?=
 =?utf-8?B?ejlqRUxueFF0TFVCNU1hTjdsL3ZCdDNQTDR1MDUreUQ0WWgwbkFKWmJuN2Ja?=
 =?utf-8?B?UW1jb2pYc1BwUmQ3bVVtZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGc4SWxQeFB2dHFEVWpiOXplYXJYekJWdFZOTjBRODEyYTZyTXYvU0xhWHM5?=
 =?utf-8?B?ZGtqdkI4cXIyOXNqTVV5MURPMms1UFRUSTVoaDJrWTNXeGxmVFpVVWRDeDFZ?=
 =?utf-8?B?OWp5ZUpiYkZNZlBocVJxbXRIeHd6a0dlMjcyMmFKMllSOUxoellqeXJkU21y?=
 =?utf-8?B?MCtkVTEvUlY4M0VuWHFkUEhyVXpWT1dXdW82M3FWUDVWMmNsS21Zbnp0WEp1?=
 =?utf-8?B?TGNCRm5HVjkrYkhJTlhKR1M0N0NoUXI3REN6di9DSFVDbXlHMzRIdDJ4dGMy?=
 =?utf-8?B?SUtUbC9PNWRSTFRXK2xHQlo2S1JGYmdYMHRXMFpQN1dhSjBmejRXQlFLTjJx?=
 =?utf-8?B?MVgvenE5MHlEOHNZTCtQOVU2RzB2TTlsazhQdmphQk11SXNpK2tnZ3lVMHo4?=
 =?utf-8?B?K05WblNPS2dHeGFFU0hRQzJyNXllYzVCNzVNYUwwVDVYUVBhRTB6Uno3UmVU?=
 =?utf-8?B?VmxpUWFjZkJ3YVN1a0psWWZiTEJsRW9tY3NjMktvNjR0d2VwWFBCL1NzNWoy?=
 =?utf-8?B?bmhraDZEczZlanhCMTYxUnhXSlp3aTVXZXNqdnBUbzlqdGZyY3FwZ1VRcVVR?=
 =?utf-8?B?UnFvTndrSHExMzY2YWdkWm11VUtGR1RQSXNIVEhVZ0pQY1lYT3BSTVdiejJ6?=
 =?utf-8?B?SElaYmNnUk5VMTY1UXBoM3VKU29aVXJNaWI0aSsvUXAwRVFjUWxYa1NsWmZX?=
 =?utf-8?B?TGFTOG9tZ2VsbEQvY0d0YWc2OVJBNndzOFEvS1FVVFRsSnQ2alhWeEcrUjZR?=
 =?utf-8?B?bVp2L3ByaUNlNzBpQkFFRi93L0ZxdjJReUp1UnRSUUd2dXJ0THdld1d5OEpt?=
 =?utf-8?B?VlkvajRxMFliaUJsVkRwWGVVdklWSm96WFJTeGVtaS90WGQvTGlzdFdDN0pi?=
 =?utf-8?B?MkIvUkVhMVFGOE5qbU9QQnRZMkl3THFLSklBTWdoZ3loV0hOQ0VveldBZzZS?=
 =?utf-8?B?UXBBQVZuVnVBanRKZFNqUms3bDNnL00weGdtaVd1NVBXckF2aStTU0xLeThO?=
 =?utf-8?B?Q0o0eDVyOU9aZEszUVpTVkdaRFVoR3IyQk8vemNkTFB6SXJhYStBUlkxNXBh?=
 =?utf-8?B?eWRETEIvN2ZDNkQ2RjVRaE9CdnpSUSs4dDZkdHFlU0tndGdYKytmbEpmM2I5?=
 =?utf-8?B?TUpjVi9na3A3Qjdub1pGRkRRR3EvVGtNRFdsVDFEc0xIazk4VkRZNlVzdnpi?=
 =?utf-8?B?UzBwckM5N3ltdFRGcHFlN3JXTlA4TUFSWGFwMDhqa2cxN0NBaXNCRElqV0ZS?=
 =?utf-8?B?UnhvSGkySVIxZjArbTdpUVYwUDdlTHBwODFSVXZ2WVgwV3pEY3BmU2ZWUmZq?=
 =?utf-8?B?SUh5SnlyaU5PMEFGSHJtU29nVDVxcGtVTXZ6bnRRUGY3cWlnVmVVTUVqMmsv?=
 =?utf-8?B?bnY3TXQ1VWRMckpENitqRWZRbTNkUjJ3a0ZPcE8wL29qNjA3UkRNSGk1MHRC?=
 =?utf-8?B?UEVCdmZWNGFtSXFQaHdPU1RrNjNSS25PNzhaZk1KajhOTjhxWUNuQ0pzOERn?=
 =?utf-8?B?NUFuRXQ5cjNwemlmM1Q1RVlFMXNVM1oxWGUzUXVzTWZQK0F2eWdpUkM4SzUy?=
 =?utf-8?B?clhKYlBiYWtOdElFWCsxTmF3NlVIWHJpamhHbXQ2SWgzekVZNXdFaXRQL0RI?=
 =?utf-8?B?SW5wT3lycVBtcXBqeFpyUE9OR3V5TFQrMW9HRUVsT0JNUll6M3FNdkIzSkJ1?=
 =?utf-8?B?NHV5VDhIQWZwSzZJM01iT1g0Yzl3d2VPZm9wb3l5ZFRlOHY0OUpDY0NUNHlk?=
 =?utf-8?B?QWZWWFAzWE0yQ1RWT2NCSGVJZWUxZ3IySnNyQnFnR2VPc0k3WUVqakVVM0hT?=
 =?utf-8?B?QkJMbXcxVFYwTTIwRTY3OXgwUXZReGQ1aFZhd0h2bkVjUXFFWGlES0M4ekhz?=
 =?utf-8?B?amhDbGFVR01xcTVyaExwbVVnaEpaYVFqK08wM2t6V1gzMU92Q2JYRFpyWVR1?=
 =?utf-8?B?dTJ5TTFCRytXZ2pBcUJmd0lhbHJ1SmV0TVpVUWZNYWpINEl3dlo1V09UMURq?=
 =?utf-8?B?MUVMbXBaRWxtUTBlalhvcURHc0JySUVvSjV4Wk43RVZoWlBTRkZHK0V5aDVN?=
 =?utf-8?B?MWd6MHZobitzaGVheHYzMjFCOStYME5PWVNUN2FxdW5yUjJJSlpUOTNDYUh2?=
 =?utf-8?B?aVdYWTJmYXRXYnU0S25YeEJBaTRJeTdEM0dZNlhNdXdOYitDaEJVT2dRUjgv?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15946d7-9e4e-4b40-28dc-08dd0e0fa9c1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:19.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97oYCaOrHus8lGSmKsg9/Gj+ui6Xtoa3Jy9Ud5iFGedG+C8ayN5PZujiKWSUbGozWWXIQqOrn452JvJX6o26zWpUTRof3gYtApejPZ5sozk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
S32G SDHCI controller does not have a LED signal line.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index d55d045ef236..e23177ea9d91 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
 			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
 			| ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
 static struct esdhc_soc_data usdhc_imx7ulp_data = {
-- 
2.45.2


