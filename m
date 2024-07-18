Return-Path: <linux-rtc+bounces-1549-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 212799348E8
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8089283379
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A267D41D;
	Thu, 18 Jul 2024 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kmj/4G//"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E637D3E3;
	Thu, 18 Jul 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288011; cv=fail; b=tmf64epBxmqw9v3S7Yx7sN9ra7QNFqmkqvHHoQhcbrFxIylJicLz4YtuwO3Elm/3En8JzPm4L6nYxAjS9B4B7yEu5vrlZR+B1e8vuzHXiPg/Y6XHFiocbp6wrdwqSjWsSVxGA6OgGsgS2KHorB99krcAMi5l3meomG/6tWKV7DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288011; c=relaxed/simple;
	bh=5R7x1rhj1TYPjKc6u9bHCeGcNZSKvIA3B92jHkks3vc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p5N2+ZTk9k8S+Z13ECohIHKHE/cTa6tzGtRKq5ruI814Xv46BrjPOIzN4lGkvaNQV1o4FKbLyB2pNk9BRp/2ob115n0bLmt/qwN0c8wf7PpMNLLrmVED+7SxI/rQ/3VZypFcWNyDfNCJ7vV5tl9xXZr57oVwOxcvdN+3oZok/Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kmj/4G//; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phAc4YjfyWp1MBM+k94ffWsPu6EDkJKSgp9ql978R0eF/bdyXcXen8waCJDEbgYwQIXD1sjalWRGR+A26E5LENrAjV7LmX0XIZnYPd1BQ9T5fAIKldh35cGENHF5XM88CDZcFdB67l9uXmtCFkQFMvPecOmADeWg/TOxqQ5mMTBSq9L7Mr3H75RaDTw9NPinei+CldJVbkY/MZtU5fUmL+1IQ94/Eif8qC5yzJW0CJ6IO4zqKY89yJ7cqYonjmAQKJuGukNKmTfSqFIA5fkMpn7/RxFFbqjppgUA0SOMSm2FUX2MZiJbVav0NGi9WvALSW55AMCMhHD0b0pK1HkUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKqRmRGJCU2bjse9FkKJJPqPuq+AJgTGg1aQq7hRCcE=;
 b=izaTKtp6jfTqRWCExDTLt3Gc9nfXaYRWbvberXwLO0j02vm3PcBoPiTN1jW9GFZAT1Bl0NBRv1+uk9800Mhaoci9WrDI8CIKqWVr1TYoy8ViEEWbVzmhgL/K//QfOZHAJd9qJ2lVSNZ252dXAoxPwdUZ5hqAOh0vsNdavhYW1SXpO8aGImNGA67y9GFKMlHkMTQI1y4rg6eN56xuml87X/nmLPIhaf8R4N9HafatsVV72Fwa/30jRUCZLyxa9fMn58saCfpkJR24/L0Wh2a/0yBjJM2uO2uN7w6LhIdET6wC4JBDTRyjngiLVoIbKe5ZA7KibL7YC2bdaHsZevODNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKqRmRGJCU2bjse9FkKJJPqPuq+AJgTGg1aQq7hRCcE=;
 b=Kmj/4G//guzz0UaUPo0PQ6H/cDo+SgqPfVPVOptPY7tB8AN2NhOqguWD2rx6aUcBfKjXBJuL10MRdBG40bALoj0kUd21QTGSXK517mVgc+gz4gYUwOjNdylNZDV5K6qL3JG3uVOVOvdNq5NwvpjTe9A5SsNfHfAsvZmo9ZSeUsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:56 +0800
Subject: [PATCH v6 4/7] firmware: arm_scmi: add NXP i.MX95 SCMI
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-4-18f008e16e9d@nxp.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
In-Reply-To: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=55298;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=awGI47uCRhda8RgNOE4cyUBLlzqkWBO1IIkfhQqujqA=;
 b=NWUroJqmgV5POPZ5+CH8a616/CC7X1nDFU98BjRvzr0iCDaSjdWyX3TbdzoC1vfx90i8DptmO
 UNhMqh0lFf2AUqToJBkzrDkT0F41osn2N/OqA017GrA5TvNrIcKKRxe
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1ba13c-7b10-4f40-924c-08dca6fbe817
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTdLZTNrZXk4MDArQi9MRUVWWE1UaU40NTUvYWtZcE91dmlCWlAwUjNRSWE4?=
 =?utf-8?B?RVJWYnFvMVh6YXJFMklyY1YzOE1ZVVZMeHYvUGpYekw5d2ovd3d0UDNPb2RG?=
 =?utf-8?B?MEFPOHhwbWNGUUdrWHJjSEp6cVAxd2poWjJvcnJWR1NNMFcvZVlxTWhHOE1I?=
 =?utf-8?B?b1ArSVA1TXltZ3Zpbnk5NGRJQlBkaS9BMm9CaGZ5QW5vclZXRGlmOGpHVWFI?=
 =?utf-8?B?NEUzVVdtOGZEZ1pKc2lYOFNwbXc1VkFiM09Ta3FBakhYY1NuaU01L0JSSXVO?=
 =?utf-8?B?RjVycWRjem8vUXVsYiszeXJPandaRGxFaGpBNy9WQlRKWjVzU2VyZEQxNFFu?=
 =?utf-8?B?ejRSZTZQd211Y0Y5WDFpS2xITW1SUm9ZMk1ZcmRHZk1nTDRLNFdvQWwyenlE?=
 =?utf-8?B?R0tiZ1hoc3BsNjFGZW12TnkzSWZScVhOVGdrL3hBZmg2Q2xOc1AwWDFuWllr?=
 =?utf-8?B?U0V0RVJ0Mll4YUxzVDBqSG5DK2NJT1lLZ0JSZ0d1RkVFL0ozQkVHNzBqK05l?=
 =?utf-8?B?cFBQS25EMG1YMUozMG9sWiswNnE2MXRmK1hHam5UTk9LbWthRURHTDNIemFN?=
 =?utf-8?B?VXc2ZzEzRGtudDVJUXZVcllaOTFlNE5MNjhEQzhITFp0ZER3V2NxUVlrejcv?=
 =?utf-8?B?QzJxY1NzUnhaMS9tSW1QU3IrQXpnTGxwUllzc0NOMFRyMVNxSUJVa0pad0Fn?=
 =?utf-8?B?bFZNMjYyUjAyYVRMekZ5Q1IvOUFVRkhkVzZrNUxDSWk5OTMrVnpHQm5PRG1o?=
 =?utf-8?B?N1JjU3FFZTNVSEczT1RTVTlTcHVFdEw2ZDlZZTJVNTJiZ09JTXR3Qy80UHdS?=
 =?utf-8?B?UTFMT2M4NVlzaEIzYUxhamZmTzNXa3BLNld1OUw3VGtPa1phYTlBU1RISGtX?=
 =?utf-8?B?d2JjRDljU1c5a1JvZHNhMHBBZ2Y1ZjJJZm8zRk9SVkcvNklpcy9OTlVZblRH?=
 =?utf-8?B?ZzRxemJQSEJCc0lVZ21jZ1JlbHhXWkIxeS9TRExubDAwSGJaOGxiWDM2ZHFZ?=
 =?utf-8?B?YVhOd2tpV1NVSjhvMk5hR3doNENPRlQ5UzMyZS9EMFBXWEVMMDBjS2h2Mm9v?=
 =?utf-8?B?T3lHd0R4dnJIWGNqVjhSUnJ4UTY0Z3puSmlQRHhhNmtoS1Z2Y2c3K3hMRmVO?=
 =?utf-8?B?ak1wWFRtQXQzckV4VG9VczQ1OGl4VTVYZ3J4WGppcHVmNGRRNDVzcjlITnYy?=
 =?utf-8?B?WW9sUmFsK0xpYjltcmlyR0szZmo0VHpXU0FuTTIwT3pMbHVKZFUzL2tOM2JI?=
 =?utf-8?B?Y1VkalJQNGZlMjdhd1J0aDRUVHlhYTFweXVEbWg3ejBSZURXaC9lMHFHWmF2?=
 =?utf-8?B?K2JLUjJlNUJ0bUVLamhvZ3phYWt3czA0ZGdoeGZuYy9tZ1cwMjVadXdDelJH?=
 =?utf-8?B?UDNkMWoxb3dPSlE3Vm1QZ3B3OVVqZzcxaHRpenUrRVhsRkxWN0FPU0dnaXBy?=
 =?utf-8?B?RnQxVEo2QzdyNG1IOUlnTjBCSTRvWGxmdThwUFRwS2gxT2pUbDRTSjB1R3c2?=
 =?utf-8?B?T0JHdjVmWFpoY1JKalo4V0JQRUM2U2gvcDFiajNZV3ZxeGFVZVhmMlQvRDhW?=
 =?utf-8?B?c1lNTjhqa1duNm5Ib1A3dWt6eVVqMjZGK24vZDgwck1GSEZGNE9tb1gyakZs?=
 =?utf-8?B?bDB2TmFjbDdsTmtYQzlpUDliR0M4V1lUSGtnazAxdFc3d1lrV1BsTHZ1Umpk?=
 =?utf-8?B?WmFRZnhyZE4wTHJGUzd3VlMrb0Z0N0RlUzgrQkxPak15S2FEaWN5TllmMTMv?=
 =?utf-8?B?Sk9QNzVLWDVvYlVVL0VvWHhoS3lnYzhKcnlieml5WGhZTlFyVTZQUEZKbmdz?=
 =?utf-8?B?NEttR0pWbUhLellkNjRoTXVHUkFQUGdkaFczeThDR1NtZkdjdDRwNzg5SGps?=
 =?utf-8?B?YmNuU29SbSsvbU9VZVNBc05FeDljeTdTbm1rOVc5OW9Oak9odk1JeUVSMzdu?=
 =?utf-8?Q?cYDBsrq1gHY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SklKWkFjOVlnOTdqRkpNQmN6UitxME5sdzkvREJPcGN6TzFhRWpEWFNFb2Vv?=
 =?utf-8?B?andMMkJtQjZxNFZxbWo1ZCt6N0UrOGVpeWNUYW95Wk8rUkhPVFVrSWUraFBI?=
 =?utf-8?B?N0xLeG4xSVVWYUlTN2hOYk8zaUN4ZUZxTllJTyt5TVRQYlV0eHBDbGNSVXBC?=
 =?utf-8?B?ZW51M0RVYm0wVmw4UmEwNU82UjZ1YUpqT1lEYlltK0lhMUIrc0JHeE51MVdG?=
 =?utf-8?B?TjYwNk0rUW1KVk0vK3YzbFFxNzRVOWRmUnBsNmcwZFlkZjdGMWIvWWh0UGQw?=
 =?utf-8?B?eVFEN1YxUm5KNkFKdmtHZWNzNTZsaUk2TE9XTUFFSi9rVlQxM1cxSEQ5bmZY?=
 =?utf-8?B?Y1NTNXQ4NldwRWgxUmhWU1kzZE9LRDlPaC84UFZKelRGcmN2VXZXN1daOVJG?=
 =?utf-8?B?NXBQUkNUZ0J0THovL0JjRzRLSnZyY21iV2hjc01IcTVEc2FUQWpKZ3dVUmJY?=
 =?utf-8?B?WTRYY0hvNVQxUmNQampmVUI5M1AwdWxuTE84VHFROWFQbUNnZHZ2dld0RmNV?=
 =?utf-8?B?eW1ORm9uNkttVDlxeUhqbkxKUTVDTTgxLzNpNWwyNU1HcjluVitpNTljdXJ5?=
 =?utf-8?B?b1JyWUxsV1dSY0JraDFrRUhjS0RhTU1hTUFBT3gzSkxZam03L1FrS3FncWpx?=
 =?utf-8?B?OHVXT0t0MHhhVjJ0ekVEdGFRNmlYVERNMHMyMjlPQW1KbmF4cmRqZjkzRTRr?=
 =?utf-8?B?cWEwV2RQOTErcGZPRmlKUGRrY0pjbTRUMnUrS0Z4VHkwMmtGWkJKYXNHU3pT?=
 =?utf-8?B?MVlXTXpHNXFyeFFlV3VjUWZiSHdmNFJiNnhjMm9vVGd6VW9UYmM0NDVKU2dj?=
 =?utf-8?B?aFNNVTZaK1BvcGdzTEZhdFNLSlA0ZTNIVDViaVg5c3dJdThZWXRScDdQbkUr?=
 =?utf-8?B?U09mWjJ1TjB3VFJRVnJhMFhnVkxYQldJSmM1STJOZ0JuTHoxR3M4eU4wbXBl?=
 =?utf-8?B?UFkvMXAySVRLN2pIbk5UK2p2cVhneDdFdVk5QWNoUEhLRytaMkdvQkJ6OGJi?=
 =?utf-8?B?dENvb3ZEbXpUVWlRRmR2THVhQXpSdVh5cGVtMXRGZzhKTlJGQzFuNlhsUGxL?=
 =?utf-8?B?RXdmV1FKcHdwQW1nNHBDTE5FMUxodjNNWTkwMDBjL0xXMXlzbmRsMmcvRk8x?=
 =?utf-8?B?V3hjUmdEVW1sWlNWK2ZmV3h4NU9DTWFlUG5Ra3E4bXZ5V0dwS2FhenBTUi80?=
 =?utf-8?B?YiswTG1JYlRBQ3dDUDQ0aGNhMnRmVmMwMTJndldYSXNIdGhObElidC9WaEVr?=
 =?utf-8?B?cjV5MDFrRHF6TFI0R3oyL0RoK2NUQXVsZGYvbGNQWDhiQ3N5TEZUbk5zWUxT?=
 =?utf-8?B?N0N4a2NHVUEvbTVrMmhrQml2MEJmb1pjWE5wc1c1eG9hQlgxN2hoSzAybGhV?=
 =?utf-8?B?MWQ1c1Q5MlhzTllLVFNaS2V5aVI4OVNtVnNWODF3NUhaLzVLSlVOOEtxUGxM?=
 =?utf-8?B?aXdYS0F2Sm5Nb2d6c2dUaUVkZ0ppbTNCOS9wSlQrV0xZOGVtS1V6V3ZFNnRD?=
 =?utf-8?B?Vm5yeWlvSVIxTFlqNTF1Wkx5NDl6UmxJQ0F4YkpkSU9wZkFycThCWE4wRHE3?=
 =?utf-8?B?S0M1WnVJNkE3T1pGU3BydnovbnYwaE1zVVBSRFNFYkRtWDVkWlp4dk84RXhX?=
 =?utf-8?B?Tk0vYUZKNVd5R1JneGo0b3NSWXp3YWphYXV1ejlId2FwZlNZdFJOZk5ITGFH?=
 =?utf-8?B?RlpCVFNyMDJzOTF5Sk9aM2dFbk8zMUwzMWhwNHg4aU5MeW53OURZTVRCbTli?=
 =?utf-8?B?NkN5Qzk3bzdlZVFtTWVJTjVsSjc2SXJJQUEyVFkrU1FjbjlQTXF4TU9qRkZC?=
 =?utf-8?B?YmFSTGtjcUF0NEFPZHRQTGJtQk1oNTFPb3h6aU5WMUlVdk10dmJTNXpCcE1l?=
 =?utf-8?B?Yml4NGFmem5tN3VpMFdvMVdHN2xJUGtsZGQ4VWRDeXZnUlp1ZmhrRW1jVjBk?=
 =?utf-8?B?UUxhWi9Uc1h1R3VxM2QrR0kxNUMvcXowSmN3ZDhDcGJla01ZVG9iTVhxb2k0?=
 =?utf-8?B?V1VBZU0rZytjQ0RrT2xYWG5NTGxCcGJ2YjRaQ2tLSUpXYWVPUnVianV6aDdK?=
 =?utf-8?B?d1FXdzN5bVZNSmZqcWpYd291UlZmalhvOG9DMFU1RUdBVFZsVHdXRExkeGdR?=
 =?utf-8?Q?l7dr8Ia1JIzNYKf9YDlfLAyLF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1ba13c-7b10-4f40-924c-08dca6fbe817
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:24.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQAIdG7RF85lEL88BJQpHNgkypHYJYd6rHXhv2kQH9MHVsV2FDL77OWz5DejWj3sGLp3fg2dm3NcRMbZQSAIVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

Add NXP i.MX95 System Control Management Interface(SCMI) vendor
extensions protocol documentation.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/imx/imx95.rst | 886 ++++++++++++++++++++++++++++++++
 1 file changed, 886 insertions(+)

diff --git a/drivers/firmware/arm_scmi/imx/imx95.rst b/drivers/firmware/arm_scmi/imx/imx95.rst
new file mode 100644
index 000000000000..6a9e53c17df1
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx95.rst
@@ -0,0 +1,886 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| 2024 NXP
+
+:Author: Peng Fan <peng.fan@nxp.com>
+
+The System Manager (SM) is a low-level system function which runs on a System
+Control Processor (SCP) to support isolation and management of power domains,
+clocks, resets, sensors, pins, etc. on complex application processors. It often
+runs on a Cortex-M processor and provides an abstraction to many of the
+underlying features of the hardware. The primary purpose of the SM is to allow
+isolation between software running on different cores in the SoC. It does this
+by having exclusive access to critical resources such as those controlling
+power, clocks, reset, PMIC, etc. and then providing an RPC interface to those
+clients. This allows the SM to provide access control, arbitration, and
+aggregation policies for those shared critical resources.
+
+SM introduces a concept Logic Machine(LM) which is analogous to VM and each has
+its own instance of SCMI. All normal SCMI calls only apply to that LM. That
+includes boot, shutdown, reset, suspend, wake, etc. Each LM (e.g. A55 and M7)
+are completely isolated from the others and each LM has its own communication
+channels talking to the same SCMI server.
+
+This document covers all the information necessary to understand, maintain,
+port, and deploy the SM on supported processors.
+
+The SM implements an interface compliant with the Arm SCMI Specification
+with additional vendor specific extensions.
+
+SCMI_BBM: System Control and Management BBM Vendor Protocol
+==============================================================
+
+This protocol is intended provide access to the battery-backed module. This
+contains persistent storage (GPR), an RTC, and the ON/OFF button. The protocol
+can also provide access to similar functions implemented via external board
+components. The BBM protocol provides functions to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Read/write GPR
+- Discover the RTCs available in the system.
+- Read/write the RTC time in seconds and ticks
+- Set an alarm (per LM) in seconds
+- Get notifications on RTC update, alarm, or rollover.
+- Get notification on ON/OFF button activity.
+
+For most SoC, there is one on-chip RTC (e.g. in BBNSM) and this is RTC ID 0.
+Board code can add additional GPR and RTC.
+
+GPR are not aggregated. The RTC time is also not aggregated. Setting these
+sets for all so normally exclusive access would be granted to one agent for
+each. However, RTC alarms are maintained for each LM and the hardware is
+programmed with the next nearest alarm time. So only one agent in an LM should
+be given access rights to set an RTC alarm.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes | Bits[31:8] Number of RTCs.                                |
+|                  | Bits[15:0] Number of persistent storage (GPR) words.      |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_SET
+~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to write                                      |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value to write to the GPR                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully written.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to write     |
+|                  |the specified GPR                                          |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_GET
+~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to read                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully read.                 |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to read      |
+|                  |the specified GPR.                                         |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value read from the GPR                             |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: returned the attributes.                          |
+|                  |NOT_FOUND: Index is invalid.                               |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bit[31:24] Bit width of RTC seconds.                       |
+|                  |Bit[23:16] Bit width of RTC ticks.                         |
+|                  |Bits[15:0] RTC ticks per second                            |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the RTC name                                    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC. |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully get.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ALARM_SET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC enable flag:                                    |
+|                  |Set to 1 if the RTC alarm should be enabled.               |
+|                  |Set to 0 if the RTC alarm should be disabled               |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds.          |
+|                  |Upper word: Upper 32 bits of the time in seconds.          |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC  |
+|                  |alarm                                                      |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_GET
+~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the button status was read.                    |
+|                  |Other value: ARM SCMI Specification status code definitions|
++------------------+-----------------------------------------------------------+
+|uint32 state      |State of the ON/OFF button. 1: ON, 0: OFF                  |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_NOTIFY
+~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[2] Update enable:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[1] Rollover enable:                                    |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[0] Alarm enable:                                       |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |DENIED: the agent does not have permission to request RTC  |
+|                  |notifications.                                             |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_NOTIFY
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Enable button:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |DENIED: the agent does not have permission to request      |
+|                  |button notifications.                                      |
++------------------+-----------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x81
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+BBM_RTC_EVENT
+~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
+|                  |Bits[31:2] Reserved, must be zero.                         |
+|                  |Bit[1] RTC rollover notification:                          |
+|                  |1 RTC rollover detected.                                   |
+|                  |0 no RTC rollover detected.                                |
+|                  |Bit[0] RTC alarm notification:                             |
+|                  |1 RTC alarm generated.                                     |
+|                  |0 no RTC alarm generated.                                  |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_EVENT
+~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
++------------------+-----------------------------------------------------------+
+|                  |Button events:                                             |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Button notification:                                |
+|                  |1 button change detected.                                  |
+|                  |0 no button change detected.                               |
++------------------+-----------------------------------------------------------+
+
+SCMI_MISC: System Control and Management MISC Vendor Protocol
+================================================================
+
+Provides miscellaneous functions. This includes controls that are miscellaneous
+settings/actions that must be exposed from the SM to agents. They are device
+specific and are usually define to access bit fields in various mix block
+control modules, IOMUX_GPR, and other GPR/CSR owned by the SM. This protocol
+supports the following functions:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Set/Get a control.
+- Initiate an action on a control.
+- Obtain platform (i.e. SM) build information.
+- Obtain ROM passover data.
+- Read boot/shutdown/reset information for the LM or the system.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x84
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:24] Reserved, must be zero.                        |
+|                  |Bits[23:16] Number of reset reasons.                       |
+|                  |Bits[15:0] Number of controls                              |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the value data in words                            |
++------------------+-----------------------------------------------------------+
+|uint32 val[8]     |value data array                                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was set successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to set the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was get successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0, num - 1]   |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_ACTION
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 action	   |Action for the control                                     |
++------------------+-----------------------------------------------------------+
+|uint32 numarg	   |Size of the argument data, max 8                           |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|arg[0, numarg -1] |Argument data array                                        |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the action was set successfully.               |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0, num - 1]   |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_DISCOVER_BUILD_INFO
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+This function is used to obtain the build commit, data, time, number.
+
+message_id: 0x6
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the build info was got successfully.           |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 buildnum   |Build number                                               |
++------------------+-----------------------------------------------------------+
+|uint32 buildcommit|Most significant 32 bits of the git commit hash            |
++------------------+-----------------------------------------------------------+
+|uint8 date[16]    |Date of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+|uint8 time[16]    |Time of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+
+MISC_ROM_PASSOVER_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+ROM passover data is information exported by ROM and could be used by others.
+It includes boot device, instance, type, mode and etc. This function is used
+to obtain the ROM passover data. The returned block of words is structured as
+defined in the ROM passover section in the SoC RM.
+
+message_id: 0x7
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the data was got successfully.                 |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the passover data in words, max 13                 |
++------------------+-----------------------------------------------------------+
+|uint32_t          |                                                           |
+|data[0, num - 1]  |Passover data array                                        |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_NOTIFY
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of control                                           |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags, varies by control                      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: control id not exists.                          |
+|                  |INVALID_PARAMETERS: if the input attributes flag specifies |
+|                  |unsupported or invalid configurations..                    |
+|                  |DENIED: if the calling agent is not permitted to request   |
+|                  |the notification.                                          |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 reasonid   |Identifier for the reason                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid reason attributes are returned           |
+|                  |NOT_FOUND: if reasonId pertains to a non-existent reason.  |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Reason attributes. This parameter has the following        |
+|                  |format: Bits[31:0] Reserved, must be zero                  |
+|                  |Bits[15:0] Number of persistent storage (GPR) words.       |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the reason                                      |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Reason flags. This parameter has the following format:   |
+|                    |Bits[31:1] Reserved, must be zero.                       |
+|                    |Bit[0] System:                                           |
+|                    |Set to 1 to return the system reason.                    |
+|                    |Set to 0 to return the LM reason                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: reset reason return                             |
++--------------------+---------------------------------------------------------+
+|uint32 bootflags    |Boot reason flags. This parameter has the format:        |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Reserved, must be zero.                      |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 shutdownflags|Shutdown reason flags. This parameter has the format:    |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Number of valid extended info words.         |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 extinfo[8]   |Array of extended info words                             |
++--------------------+---------------------------------------------------------+
+
+MISC_SI_INFO_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: silicon info return                             |
++--------------------+---------------------------------------------------------+
+|uint32 deviceid     |Silicon specific device ID                               |
++--------------------+---------------------------------------------------------+
+|uint32 sirev        |Silicon specific revision                                |
++--------------------+---------------------------------------------------------+
+|uint32 partnum      |Silicon specific part number                             |
++--------------------+---------------------------------------------------------+
+|uint8 siname[16]    |Silicon name/revision. Null terminated ASCII string of up|
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_CFG_INFO_GET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xC
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: config name return                              |
+|                    |NOT_SUPPORTED: name not available                        |
++--------------------+---------------------------------------------------------+
+|uint32 msel         |Mode selector value                                      |
++--------------------+---------------------------------------------------------+
+|uint8 cfgname[16]   |config file basename. Null terminated ASCII string of up |
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_SYSLOG_GET
+~~~~~~~~~~~~~~~
+
+message_id: 0xD
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Device specific flags that might impact the data returned|
+|                    |or clearing of the data                                  |
++--------------------+---------------------------------------------------------+
+|uint32 logindex     |Index to the first log word. Will be the first element in|
+|                    |the return array                                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: system log return                               |
++--------------------+---------------------------------------------------------+
+|uint32 numLogflags  |Descriptor for the log data returned by this call.       |
+|                    |Bits[31:20] Number of remaining log words.               |
+|                    |Bits[15:12] Reserved, must be zero.                      |
+|                    |Bits[11:0] Number of log words that are returned by this |
+|                    |call                                                     |
++--------------------+---------------------------------------------------------+
+|uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
++--------------------+---------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+MISC_CONTROL_EVENT
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ctrlid     |Identifier for the control that caused the event.          |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Event flags, varies by control.                            |
++------------------+-----------------------------------------------------------+

-- 
2.37.1


