Return-Path: <linux-rtc+bounces-2443-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CFD9BADFD
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 09:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89691C214B8
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C141AAE10;
	Mon,  4 Nov 2024 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SLTOPGtA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060.outbound.protection.outlook.com [40.107.247.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A7189F48;
	Mon,  4 Nov 2024 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708686; cv=fail; b=ZoPWUXXKuJf4kA7uM9UjCsfEfMSimtiutrbzOxigeq0P6NFxQLAfjmk3iYNwn7+Z6iKE4rsSWn+YrBtVOImptCcXxKYeA5Axevk8a8Yjm2j3ga6lrkkdwkArqeTpXD7qIuywIOE/i7XvvUGdZ1r/4ZqPYScgrQjnSXh/DROmN7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708686; c=relaxed/simple;
	bh=AuKD/OOELU5OP7m7jD50k3ZwL7+t0bjORnCx4cGexos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l6Wv3tQ0CliZY4TUxMoT3CiFrjp0XO6rp/d6VaQxSkmb997bTE5AV8rymjdFFZR30nA3i69cK6SXR4BrQVznzdJ8Zz1PKqv52fCwdrv0Az11jIYMsNPQ6hW9PyiHRySMr1mZfaagazYDVY6pUPgJoT6b+L6jCbkmj0FeqevsTxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SLTOPGtA; arc=fail smtp.client-ip=40.107.247.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YspFVGsYzdGugsIKqXLTRqZfHFG+nvdpBKHY9dA4g+/JIF+qthpUM0thRHazc5pPZoJhglD0ZevMfQpD1wmwad6iLBF0lymdACjOd/7TwEFc1jzMQp4pvtc3bUOXKYLM2V0emAzgFkRbjLsWRraQkAxffIas/jICxyT+re6eU2rSSTVIuU6MBG7duu26NplFk0iRS15V45AU2nE5M7f5dYRwoWaTx3K+FOnIgOlnzk0cp21z940pPW94OUPeXivfW+zhr/wnA28mhtDeqh5i2KV3Ajzt7WS9aYi2gDDtrqD+E4IkcPvZ9VkbdX+da7vSPUH+j+1wOe+5bS3VvIuxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgnKt28BqUm81gadgYRAYsY2qSpkkedYqSyXRbAW1fs=;
 b=s+60dUaS1H5CZvcQRbWYgRpxFLUsVkOf/0A2bit0WYpR/y33Q2RT525LFh61X8F0G9z60Fr9y3/eQAGno8p2UOxgKncYeFggnTVP6qa6x99BfdfVpF5ccbPDXOkrdUutEfOObFNmDlNTXHzeqY+jv1H8s2jZ/75Z4to1mz4HZNo9vtPQsKXvbexGrWp5zpsBrXLgUBjadYspGRX2K2uOL5YtoUkDVySHHPmXZLiFz9vUWl+4otA0zS/7BADyCceAPPybjqlu+g6G5wxCbHiwvD0FvhqQoR4InI5DTR0/vvDS//0vuP27CF3rfHq47qiOlLMnhvy5ND2dR4AjJl42zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgnKt28BqUm81gadgYRAYsY2qSpkkedYqSyXRbAW1fs=;
 b=SLTOPGtAJv5uZ53xE4jA9Uu1i9/sYCYkzv8ZTIFOIbDjknSallhxuf9Q4KGF1W7HwSZLV7JED8qNleGqeRJrC5jT1bwEqgvlJerd4mLRjwBmwSR4DDb/KsWl2RQY8JZ4bPCwBPX13GJDGhQUIWpKeSh+ksp1mbls7Ec7najIkrlQGNMSDJQl5fLtwq+PTIu0TK3sjxDH07MOCEfiueqTmS8YMAdnH4cyyicZbe9A0EThfu4Gk+nehO1gTX0xHm+sDDQXfRxHvUMl3QMUCXhAp3/MegvTJVRHi/HpnxCPcxL/qWRfAPHwVplTe2urSOvo2ziGRH1sOvTZ9nphUtR5oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9286.eurprd04.prod.outlook.com (2603:10a6:20b:4de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Mon, 4 Nov
 2024 08:24:40 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:24:40 +0000
Message-ID: <ab67af25-5a8f-42fd-8678-e4a1ede92f2c@oss.nxp.com>
Date: Mon, 4 Nov 2024 10:24:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 IMX Review List <imx@lists.linux.dev>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
 <ZyO1vju0l522+oSB@lizhi-Precision-Tower-5810>
 <3e1b4165-d622-43cd-80a0-24c76b7f71f4@oss.nxp.com>
 <ZyUWK81KUg9aNECJ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZyUWK81KUg9aNECJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0085.eurprd02.prod.outlook.com
 (2603:10a6:208:154::26) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dc1942-1d0f-4158-29bd-08dcfcaa206d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVBucmp2aTgyR2k0ekVWNVRrdEFWVXRDa2tqbXc4V0FJUGpnM2d6UjJNY0Z3?=
 =?utf-8?B?R3FGQm44VXh2ZkJuaC81QWkydXhSK1RaaENUTWRYc2xrVkNZRUFqTWF3ZkJP?=
 =?utf-8?B?OXFwVXByUVA0WlA1L2thNitPY3lQUGR5T3JubTBaMDRNZHkrQ2NsUTk1eTFJ?=
 =?utf-8?B?TTNtdEtTYytwa045eDIxWnBZUXNUcy9DWExkdFRqUkpBV2NHcVZuMzMwTG1h?=
 =?utf-8?B?TUpmc0ZzeVh2NGxyR3FYQUlFOS9PTzNodGhFK2UwemQ2L1ZDcEFva2FOcDVL?=
 =?utf-8?B?MEU0bUxiZDI4aEpiR2hWNTQxOXZCK1J2M1NzL2liN2M1ZHdkUml0RVVWTnhx?=
 =?utf-8?B?R1QwaVY2VEd5ZXczeW95L3BpcjdVQVdvOEdCc21KSkhORnRHUDF3R3JYZ2dT?=
 =?utf-8?B?UGpZR01UWk1OcXhZdU16eTlUdVU0UDRvbUVwNmJBMVRrUUsyWVdoeUw2U3JX?=
 =?utf-8?B?ZnZtdTJaWXZ1Yjh2UUFxaHpsMmY2MVVHd2Eza0lVcnl1MC9HamF3SnZ6dE5v?=
 =?utf-8?B?aFJkRjJpaXBpVFU0RzNUN0E3cExRSDRLVTFBVDZHejU2QXVIb3hzQUZ4eFZa?=
 =?utf-8?B?WUsrUWMwRkx3dFgrVGdRcE5rMDNMdThaQ1lHMWFVUTJuaTZNTTlsWUNURHdD?=
 =?utf-8?B?N3g4WHZCVStsR3piZ3NubzJqWUdoTWlDVFFVMlNFZ0FDL1d0djVRVTVGK3NT?=
 =?utf-8?B?MTlJOUV4MTIrV2RXUXg2YlVWRWk3WXBrd2d0cGlHNUJmUnJ0RzU1MkdLbXd6?=
 =?utf-8?B?R2tiYjNsLzlwdjFieElBVzcwUlpBM2tJMkpuVkdlQndUMHRHU3JhMXVSeUdl?=
 =?utf-8?B?ZnlWSWFzRnk3R3pvVGlIZEVWT3daQ1BTbEx5V0FYWUVXUHdIRFcrK2w3YVZk?=
 =?utf-8?B?VGNON2p4VVRqNXRXdmtoOXN0OS9pSmdwQ3BQdjFlL0dMYjQvZVN2QkFGL3lo?=
 =?utf-8?B?dWRhdmZWWnh5VnNRSE9heTdxN0kvYmJUZjhZTUptOS8wbjErQ20xR1IrajFk?=
 =?utf-8?B?YktUVmRSMnh4QmR3YlRCYm41SUd0SWdPZFNHeTFkWU03MTA0VTdiWElwNE0w?=
 =?utf-8?B?ZVpsdlY5YWo1c2VmbzFGWUwxTWxBRU10ei96cGdlRC8xV2tWZ1lCZjE0Qm00?=
 =?utf-8?B?aHA0YVVFSFV4MnVUaTBETmc5M3RQWjZaWERON1hpN21ETlJkTlRVWXoySzhC?=
 =?utf-8?B?ei81dzdoVDlTN3ZOT3RjR0RiUXR2aThkYXR4cDlySzdKVm1CZ0FvSk9VVk5a?=
 =?utf-8?B?TU1TZ1A2VFoyQWlZTmJyVzBlTHlEeksvVkQ5K0ZWdDhhZk5GU090d1hQdXVW?=
 =?utf-8?B?WWZ0Qzg2bnB2YnNlOFJHYzdZQk8wTnNoNmZnQUR4aUVISDMzTDVpMkdESXAx?=
 =?utf-8?B?SVlzVXNIY1FHcWJDcmN2L29BMGJnaGFia2x2QW95RnRvOHo0bHRwZ0h3YjRo?=
 =?utf-8?B?UzJEUHF1UGx4N2RFZTJQZmpPK0xFOHVzRzRxelREZkNJb1NTbXhHYVFtUm51?=
 =?utf-8?B?RnpFN0JucnJ2UEZzeVkwWlUzditTTTI4dVRrNDM3Ym56UThrc25KT1hsbmN0?=
 =?utf-8?B?MWNoanBJRGpZbVVCbU5nNFBPWmgrclU5L1dXWSs2Q0ZJV24weUZ0STZSZlp2?=
 =?utf-8?B?UE11dWFZcU55Nm5xbHZlZE0yeG1zSDRDSS9NRmh2dXVmekNQMnBrNlNkL0M4?=
 =?utf-8?B?ejRsbU9BNEEydHMyc29aeTlxUlhLVlhCQlgwZmJnaXNIV1NiOWhDaG1Lb1Qv?=
 =?utf-8?Q?M+H8FnSx6x+jX05SZl/Ft2a2OkY2ASqPi4/vA/J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXkrUHd2ZVl6eTNmbGtucVF3bTVrZWk0VXYvZ0xFenpjeURhTFlHdTdtRXAy?=
 =?utf-8?B?VHNtaWtYbldZM0sxN1VqT3JKYjFQZ2p3ZkIwRVJPVWlRbk15UmNBTXhrWE9Y?=
 =?utf-8?B?YzV3ck5VUWdSRitNSEMrT3pXeG92Q2t1SlVPc3QvelJJZEFxNWZ6bkV3dXoy?=
 =?utf-8?B?aEhoZ1ZhaW54TGxZVXpEUWY2VG5UWDNQSFBwdmVyOFlERVBEOTJnamhScm1i?=
 =?utf-8?B?MTE4SnFrZXppV0VEMWE2YVA3ZHMyTkw5dlozNUpIa0RyNTRYR0ZTY0JlMUtH?=
 =?utf-8?B?THlvR0syTkViK1ZRSk44WHM0dWhqRm01bll1WVBWbVZSZktaUWdxMW1ud2Qv?=
 =?utf-8?B?bmpFNXFRU0tJeTdxSExtcjhBM2xZMVRVS21JMHNQODlzN1QxZWNrYnR0MXpt?=
 =?utf-8?B?cjhoTG9SZ0FSazRoajduVzZlQ25hYUF3Z1hMME4vU3FYajQ1QnpoeG5hWVZN?=
 =?utf-8?B?S0NKbTNvQlhYNk0rSTFnUVFCWEdXVWVsTC80WitJV3hMRDZHbVVLcUtxQXZJ?=
 =?utf-8?B?TkExNnlmd1Nwb1NQNzB4cUhXNzRiWmM2QWpGcGo0UExKSGlFT3BsZEIxYzJJ?=
 =?utf-8?B?WFZCeitieHc2dnp0Q0d0Mi9PeHBUUmtqRGVzQkhPQzNxOVh3bjluMFhmY0w4?=
 =?utf-8?B?ZzgzTGVjbXBOaWxzZWd3YVR4RU9zaHJET3BOQUtmVGs0R3BKbkhGL1hMbTBn?=
 =?utf-8?B?SzJ2UGU5R1VBcXNlZGdyUnV1L2VZVml5ZFJTVS9EaDNJMEtiY01CWVZSdjV0?=
 =?utf-8?B?M2VwdHhzQXp3UncyNDh3ZHFZWFNhRlk0dklRK0l1MlBTQU9nc00vVEF0QUov?=
 =?utf-8?B?T3lJcTlNTGxoUW9sTnpqQU80QlJ5bDVUQVU4Q3FIU0xmMVRORmdDSzkrV3E4?=
 =?utf-8?B?aFJvWVh2L0RueThBb2hPdGNYZmMvUGh5OVQzOW1RWkdWTTk5MjVRdmt0YUhN?=
 =?utf-8?B?ZEs4ckxlbTFLZmtmRWwzczNMZjVwR2FoK3Q1Z3RNWHBUSVJJdGI1SHRTSnBD?=
 =?utf-8?B?R3Zzd1lzZXBjWnNRS1p6RlFadWo5a0JOSXV0d1V6aEJGS1I5czVBV2c3eU5F?=
 =?utf-8?B?MlFsZzlBVExzREp6anNwMnB2S3V1WGxLL1BxWTM1UXRzeVVpUmhNb1JzKzlE?=
 =?utf-8?B?bFJjRllicktKUTc2aGFSd0VrZGNyRitBSXUyeTQxc0psQ1dmcXp3N2h6Uzd5?=
 =?utf-8?B?ODE1cXFRZldpTjZjR2IrM3ZldXdTcnlJNk1vWEY4SFdnTGdJbFFPUW44T0Qy?=
 =?utf-8?B?cFlCT1REVjZZcUJKTHVhR0pudkFMejdmMXZVdCthTFFycUlOQXpyZzhLMjE3?=
 =?utf-8?B?YTRVTktBelBIMXU0ZHpPaTl5b3RERmFmcGk2Ykx2SXFxdE1DclBaVEl1WVly?=
 =?utf-8?B?UW1jUCtLaEtFVU1BR2JDK2tTNHV4WGsraVRxUkhtSmlTencwZldDQXVuVmpj?=
 =?utf-8?B?dUhEc1BtdDFEMWhFSGJYSWt2SjArUVVNZndFWi9ydUI0aXdyenEyNlRzTDVZ?=
 =?utf-8?B?WnlCNVNUZGZZZGdBU0VrNHUxT0I5U1JVMW9NVUw3TG1LTWEwMGViTzRCMzNt?=
 =?utf-8?B?dTFFOEJvaW1sRHJQbTBhK3RkZ0ZuYzdCVjJTdzRna0xPZGI5UGRLZnFlQzN5?=
 =?utf-8?B?dnE5SXdHMllSVVFBc3JSR1pObVpCSUc5VjNjSmdYaVJ4OUlZcFFrc1RvOE5m?=
 =?utf-8?B?QUZDUXlNVFFldE9nR3BtV1c3MXlPZnNRQTdVY1dwNFNaYWFzTFdrQXo5Zm40?=
 =?utf-8?B?SktUVUY0cWpNbnV2SFFEbFc4TVVhSzJLanc1TENkZEJwQm16RXNHVzlvNWMv?=
 =?utf-8?B?aG5rTCt2ZUFsaGFxNS8rTVN0eUtGSlBHY0c5NTBTQ012b2VPRmJMYXFGTzla?=
 =?utf-8?B?NU5aQWZxQ3Z0T1BtRmt1WUR5bkh5V3F0bElXZ1NicWxxZkRtN2xuR0pvTEhO?=
 =?utf-8?B?eksyNFYwa3JrQVgyalFzWEk0empOeDI2YURjZ05SNCtsQUVvdko3RmVXWEo2?=
 =?utf-8?B?b20yQ3A2WDU0dlJReTBzM294T0FITDRDWGdrSUpQU2o3V2I1VkIwSUVuRzNX?=
 =?utf-8?B?VTdhRUlYeGRrM1JicVEwR1ZNbUdjZ3JQS01ySDBCd2cyTE9OZFFtbEdwdkpz?=
 =?utf-8?B?V3BWWU9GQkcwSG4zNlora01DUElhdHBpL1JmNWhFckRKeEhxM2M5alN4OExh?=
 =?utf-8?Q?CW2fFZYcAOWFq8UbsABePkU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dc1942-1d0f-4158-29bd-08dcfcaa206d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 08:24:40.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oYRC+HDIByNAHbcm/n82pup2dzXOK16tOM85REzJDYqeZx3/LM9RA2sKK0P772fi6Arb/uapr0zKchpgVrBejM8udZ3CprhpNh5N6dtRiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9286

On 11/1/2024 7:55 PM, Frank Li wrote:
> On Fri, Nov 01, 2024 at 11:31:11AM +0200, Ciprian Marian Costea wrote:
>> On 10/31/2024 6:52 PM, Frank Li wrote:
>>> On Thu, Oct 31, 2024 at 10:35:55AM +0200, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
> ...
> 
>>>
>>> why rtc is the clock provider?
>>>
>>
>> RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
>> different clock sources (parents).
>> By using this CCF framework I am selecting a specific clock source (parent).
> 
> If clock-mux is outside RTC block, it should be seperated clk provider
> driver.
> 
> If clock-mux is inside RTC block, it there are some input clk1, clk2,..clk4
> It should be handled by driver,
> 
> you can provide one of clk1..clk4 in dts, the driver check which one is not
> NULL, the set related mux register.
> 
> DT tree should not descript inside of RTC, just interface with outside
> parts.
> 
> Frank
> 

Hello Frank,

Thanks for your proposal. The clock mux is indeed inside the RTC block, 
as I've mentioned in previous replies [1].
Your proposal is IMHO similar to the version of this driver proposed in 
V0 [2] considering that from the 4 available RTC clock mux sources only 
2 are actually selectable by default on S32G (one is reserved and one 
relies on an external clock source).

Now, while your proposal is less complex and makes sense please consider 
that I am switching between clock mux sources in Runtime and Suspend 
states using 'assigned-*' CCF framework. I've already explained this 
clock mux switch [3] but on short the more precise RTC clock mux source 
is not been kept alive by hardware during Suspend, hence the need for 
switch to a different RTC clock source (since RTC is used as a wakeup 
source on S32G SoCs).
Related to your proposal, in V0 of this patchset, more information was 
added in the bindings in order to implement this clock switch (e.g 
'nxp,clksel') which was not accepted.

I hope this adds more context to the implementation proposal.

[1] 
https://lore.kernel.org/all/2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com/
[2] 
https://lore.kernel.org/all/20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com/
[3] 
https://lore.kernel.org/all/2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com/

Ciprian

>>
>>>
>>>> +
>>>> +	if (priv->runtime_src_idx < 0) {
>>>> +		ret = priv->runtime_src_idx;
>>>> +		dev_err(dev, "RTC runtime clock source is not specified\n");
>>>> +		goto disable_ipg_clk;
>>>> +	}
>>>> +
>>>> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>>>> +		goto disable_ipg_clk;
>>>> +	}
>>>> +
>>>> +	platform_set_drvdata(pdev, priv);
>>>> +	priv->rdev->ops = &rtc_ops;
>>>> +
>>>> +	ret = devm_rtc_register_device(priv->rdev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to register RTC device\n");
>>>> +		goto disable_rtc;
>>>> +	}
>>>> +
>>>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>>>> +			       rtc_handler, 0, dev_name(dev), pdev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>>>> +			priv->dt_irq_id, ret);
>>>> +		goto disable_rtc;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +disable_ipg_clk:
>>>> +	clk_disable_unprepare(priv->ipg);
>>>> +disable_rtc:
>>>> +	s32g_rtc_disable(priv);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void rtc_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
>>>> +
>>>> +	s32g_rtc_disable(priv);
>>>> +}
>>>> +
>>>> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
>>>> +{
>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
>>>> +	u32 rtcc;
>>>> +
>>>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>>>> +	if (enabled)
>>>> +		rtcc |= api_irq;
>>>> +	else
>>>> +		rtcc &= ~api_irq;
>>>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>> +}
>>>> +
>>>> +static int __maybe_unused rtc_suspend(struct device *dev)
>>>> +{
>>>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>>>> +	struct rtc_priv priv;
>>>> +	long long base_sec;
>>>> +	int ret = 0;
>>>> +	u32 rtcval;
>>>> +	u32 sec;
>>>> +
>>>> +	if (!device_may_wakeup(dev))
>>>> +		return 0;
>>>> +
>>>> +	if (init_priv->suspend_src_idx < 0)
>>>> +		return 0;
>>>> +
>>>> +	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
>>>> +		return 0;
>>>> +
>>>> +	/* Save last known timestamp before we switch clocks and reinit RTC */
>>>> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/*
>>>> +	 * Use a local copy of the RTC control block to
>>>> +	 * avoid restoring it on resume path.
>>>> +	 */
>>>> +	memcpy(&priv, init_priv, sizeof(priv));
>>>> +
>>>> +	ret = get_time_left(dev, init_priv, &sec);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Adjust for the number of seconds we'll be asleep */
>>>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>>>> +	base_sec += sec;
>>>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>>>> +
>>>> +	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>>>> +	if (ret) {
>>>> +		dev_warn(dev, "Alarm is too far in the future\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	s32g_rtc_alarm_irq_enable(dev, 0);
>>>> +	enable_api_irq(dev, 1);
>>>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>>>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int __maybe_unused rtc_resume(struct device *dev)
>>>> +{
>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	if (!device_may_wakeup(dev))
>>>> +		return 0;
>>>> +
>>>> +	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
>>>> +		return 0;
>>>> +
>>>> +	/* Disable wake-up interrupts */
>>>> +	enable_api_irq(dev, 0);
>>>> +
>>>> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>>>> +	 * reapply the saved time settings
>>>> +	 */
>>>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>>>> +}
>>>> +
>>>> +static const struct of_device_id rtc_dt_ids[] = {
>>>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>>>> +	{ /* sentinel */ },
>>>> +};
>>>> +
>>>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>>>> +			 rtc_suspend, rtc_resume);
>>>> +
>>>> +static struct platform_driver rtc_driver = {
>>>> +	.driver		= {
>>>> +		.name			= "s32g-rtc",
>>>> +		.pm				= &rtc_pm_ops,
>>>> +		.of_match_table = rtc_dt_ids,
>>>> +	},
>>>> +	.probe		= rtc_probe,
>>>> +	.remove	= rtc_remove,
>>>> +};
>>>> +module_platform_driver(rtc_driver);
>>>> +
>>>> +MODULE_AUTHOR("NXP");
>>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> 2.45.2
>>>>
>>


