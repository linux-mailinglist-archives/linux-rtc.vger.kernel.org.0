Return-Path: <linux-rtc+bounces-3106-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335FA2A5E7
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Feb 2025 11:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B311889CA7
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Feb 2025 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD52B22758F;
	Thu,  6 Feb 2025 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="obfia5WO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41922688E;
	Thu,  6 Feb 2025 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838176; cv=fail; b=mbdYwhwJVMCwZ1ISdBM7fIcJIgJLAP+cSWJxAfjsT7OejLjUbGgA3vCe91K9SiROV75kG6AZVuB+cSM0lPk/0q1C3XgLh6wuSCj6Onnhc2L7DXAXstejPazDGA4ArZw9d5p1y6gZBUdYrpGT2NKeoF0/vo0g5YQutxscT8jv0UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838176; c=relaxed/simple;
	bh=TXFjZSKB8BKtpjFHEQMKcVDqvlGa6pENfYcK/1AzZgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ld5KtC4fKUPfnzp39vsFLKsE3Ljm9Cvk3Teg5nOuLBI8OwhbETv3I6t4UYK62An1V8uN9ulf3X+kjEVDYmEj8Vp+PSslEe65d9oWhhGBv7CGSdjdwA2jO9OVMCPfeTey2eb5p/RhnWVWnamMfA1f0+3QyOmL/EVODdGe2OzBlZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=obfia5WO; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stGGpOnXp2Oq0Eo7R51Ohgw8DdrGlfZjBrGliYFpXJgu6pMJxMBaaHKDsGt0NIt7B8iomif8b9QlUmPyQwSseYIkKe5hp76tXi2oUyXm6RwGz4B0PoaYXte5sETH7Nla/JThbQHvQV631hX2ZENiX4bNWyOJOvWhxpY+o3VzY5cIStlwDE9SPpxvChJ0MUot3lAaYE6l3E8ladsmKoCwyzLHiT8nNlYGmpT4zFqIVvAmQRTLr9NVrelg6hOwP0YBzVvbqE6e1pFALNq9IjR1Vnf1ClBo46IFdhESH1TC4BKSYNCI6AxzxL54md9WgdD2C22YBW75zEfudh7B1fYq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EytYVUrxUTHgAYt1V3/yyyYvCM+k6oOZz8yGnp+1FkU=;
 b=q9BPKP99e0joFucy4v5AEpWlGFzg8r11U5eBJFfcP9o/dQGQTfVqhFj+B7wUFCTE5JmrkQ1xePZPdSDZnM+yP5QR9htys11f7U5K509Odw06kVV875/IB7CKoh7R87EuEMMYeJI/Ibbco/ileT7aECNzA5IBrql2eqiclBGUi68/Va44TUhsFkRI/yKyr69LL8LHeYeSdoAY+ZTq4PwCfc4rsfIatMJ5T27FuEWvadmIkyLw8gMMCtiZbfbSIHpFgyJN6fJD701Sf9abp/p4EQztIhkMSuKdgzrbVbgYTlDati8FknuXA4mmfc47xklEbajkM2uBM3sjP07VtncyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EytYVUrxUTHgAYt1V3/yyyYvCM+k6oOZz8yGnp+1FkU=;
 b=obfia5WOcQLfJpfBAaRyTMltnVBa1/f+Fgdb91CXDEp+pNrw4orH2Bkk0LNcmNMpZo7e3s1Hp77rDCsDkqCZIwnCQANoykC7dBxlXOS20/ag9doC8L3qwHE8xRbQePndHUgzXQdk2cfFZMHFSwmH7sxa8+YhLKbb5han7GI/WrKmrGkiGYR+LYC2YdUVUBZqMJNjnsUlMwdjL6+LH/8uC3Qy+BDsFvIeBPAzPfPWOcIgEnW0dT/3RWE3CdGJNo90Q1g6EWzhmisSRbXSdaNKmwISa1FODQqJTMrvNNrp0QsGcrz80PStJsu99uu/anX7o9aU86yONes96nYTkNt+UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10872.eurprd04.prod.outlook.com (2603:10a6:150:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 10:36:09 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 10:36:09 +0000
Message-ID: <9f4fc9d8-ec7f-43b4-8bdd-01a4ba4855c5@oss.nxp.com>
Date: Thu, 6 Feb 2025 12:36:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <20241210232557fee4e108@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241210232557fee4e108@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc3e886-dd0e-4394-9418-08dd469a1096
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUVaVGJLQXNRUEhnMXhPWjg0Qld4alMvUWYwMFAyck5xa0M1WjduL1lidWFC?=
 =?utf-8?B?VVFWUU03ZG9CM3Q3MlZkYWxwSWRjVnB1bThPM0pqQjhpQzkzYjRmeVpTOUhX?=
 =?utf-8?B?bFVKZzhiN0JLRzFnbEM4eWdZaUZLRHJybHFrVG5VRFRmV3VKZlFLd0FtNi9l?=
 =?utf-8?B?aWVkZVpzUXJiR3lWMUU5S0N3YW12Q0I0d2NwWDFCWGJUSndkNURUczZOQzBT?=
 =?utf-8?B?L0FGdGU4U21XY1doVlNSZjN2WHdDb0RCV21lYUN3U3dKRFhYZDdDRDNOMTNW?=
 =?utf-8?B?M1llY3JNa2dCNzR3N084Z01VemhRVDdya3FERkxXT2JiTnlUMy94SzhSQ3F0?=
 =?utf-8?B?SXRneVhYSnhrZ1lDNXVMQ0dKZTdISTV5YndqczZ5WEw4WEZ6U3dvWUV2VVFi?=
 =?utf-8?B?WWxZNnVNcTJMczZXZEFOTkh3ZjdpWlk5ZExKY0lrZVlmZFcyMU14VUo3SVJ4?=
 =?utf-8?B?dUVtL3VocWM1M21JOXBWbzhXNHlYaks4RnZkVEJwQlBWTWorYmJhT0NuM1Fn?=
 =?utf-8?B?aWNsOHA0NUl5UXRyMHVrV3VZRmNWMExFME53VGl0T2NybUFrUCt4cDF4bW5D?=
 =?utf-8?B?Z3dJbTJyS01OZ1N2SUFzajljTUlDUkpBRnNkZmFXNDNmUGlpam8wSGZ1MkJB?=
 =?utf-8?B?WEZKTjV4TXdLNEtXMi9nNzZaODlKdFRnemcyUWtQVVhGeTZCNE5wNHp2emtD?=
 =?utf-8?B?aVFIYko3bXdhdVUwcGNUNFdVNUFJWlg2ZWU2OTlhSnVBK3JIYkxBLzBpR1Fx?=
 =?utf-8?B?Q2tkdnJkVm1WWklvQ2FTak9oV0Q0SGpKL2xwUXRXR2NIUWlSSlZ0cUZIbGR6?=
 =?utf-8?B?WFZhZWxEazVhTVNsSVk4TDZxTVZYeFFOYkJLUUJLY081djVabVczem96NTNI?=
 =?utf-8?B?UkRhT2cvNjBLOFFVdnAwK20yRm9VQVdYRjlNc2cxZEp1OWs0NVJ5aktJVE9Z?=
 =?utf-8?B?QXUwanZDak05Z1ZDTm1nNEJ0MWZtb0cxdTJoVkZYNE0xMC9wS1J3WlFhSzM2?=
 =?utf-8?B?S09EYWNjdSttdGo5NWE0Y011dUdLTXJpTU1uZ1RvWVFJd08zWWIwaXhFR01F?=
 =?utf-8?B?RW55TnFWMHMwcFFuSEFNSGxVNmh0Um5OY2wwR2RhTzJoNVljOWZ0ZXZXaW5s?=
 =?utf-8?B?VmxkVXdXK3FWRlVSN1dxWW1rQklVcGh1dHhrNG93Nml1a0llUDhpTzBuamhu?=
 =?utf-8?B?T0RnUy95ZEFBa0VrRFhUcVJJb21HSFdsUlRIdG1MOTIvNG5TbmR0LzNqbEF3?=
 =?utf-8?B?dUU4NE0yRnVrbk9CRnhNaTNVK2o4ZVF3NXdJVUpQa1NDRHFUcTJzMjdjay9t?=
 =?utf-8?B?UWh5WThRYTRJV1F4emhId01nZjlGUmVIRU40QjRsYUdvTUpSTnVXMyt1VWZi?=
 =?utf-8?B?NnZBN3lwelkyUUEvNkZreVg4WE85M0hiU3o2cFlxZlk5WmlYcU1ZNG9yS2lh?=
 =?utf-8?B?SitpaytjMWphTzUvQ3JaS1N5NFRwN3k5dThSUHN3enZDYk90Rkd3T3JzQ3Fr?=
 =?utf-8?B?NzFRK1BPaUxUcFNIMVFQbW5BWkdIbUtCTHM5Vll1ZS96cCtVWW5FQkpRYUdu?=
 =?utf-8?B?VGRnUGVDbW82bmxtK2J0K3krVGJpTVFSeDJCSE9iYVpPdHpaWlBpVTNxTjZx?=
 =?utf-8?B?a29meUxUNHovRlhSOTg2WGF1WmorMFI0Y3VLWHpaMDhvMjVtU1hVZDF0MDYw?=
 =?utf-8?B?ZHc3R2IzWHFQMEozYXM5dndscm4wVU8rUDlybHFjYis5MDcyY1h0cktmVHV5?=
 =?utf-8?B?MDIybHBHZEFsK0RtazNLSVlveUlvSjBLRmtuTzlZVFl0TXE5UmNQUmEzUGF3?=
 =?utf-8?B?UFR4b25PQnBNVnRoeFJaVlVpSGpUNHlsSit6Yk5OVXFMUnRWZ2U0dmlGN0Vy?=
 =?utf-8?Q?EKolmMrq6FUyC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkt5TnpZeVl2QUpqVStTZzBlT2lPTmJGQkxJSUdkKzkycndHaExWS1FDRHZM?=
 =?utf-8?B?SGN2QS83b2g0dkNRa2lQYjZDNG9XTFY0dHE3THVpRW5rVFVaVmdYTFg3ZE1D?=
 =?utf-8?B?OHd5MUo4d1Y0bkxNT1R3eE95MERpNVViejBYQUo0ZHpyMVROcktFZnpoVmtX?=
 =?utf-8?B?emQ0S0swNmxMVERmWmw5b0VCN2Q5REtqb0FqTTdiRTREZjlxR0VETHhWd1p6?=
 =?utf-8?B?Ylh3SFNEdlhCa1NRWUNzVThLNVh2N3hpdWtkR0VEbThKRStET0U3Y2ZCUldi?=
 =?utf-8?B?Sm41SFlwQzhJcGRzQW5ZQ2xQcUVxTlp0d2tidHp3Yk9ZZW9uYVBKVjVEOW1O?=
 =?utf-8?B?ajdSWjJpZVJWUWZnYmtkd1lqMWJpdzV1eHB6L2QyQU0yT3Y4NGxESUFCMVFj?=
 =?utf-8?B?VDFiM28vUmdJaE5uU2tuV252TndISXVKWDY3R2R4MnpiczdxMU5ENjF3ZWw4?=
 =?utf-8?B?ZEdEOHF1NTJuZWVpaDV6WHo3eU5oREVkcnB5dE5QQmdUUm9KY3crQUlCYnY2?=
 =?utf-8?B?dWVGY2U1ckJKcFliTVE4UjJlcWhmckk5SE1FN2RaZzRGK2QxUkx1QW1IQ0x0?=
 =?utf-8?B?K0dlNW9kN3hHU205N0tuWStPMHlROWdCajFHYjUrZWd5ci9ZRDZyTUw5cmtJ?=
 =?utf-8?B?WUZRZ29lckV2VmYvV2Y3UDhNL05YNGxOOTcvSXBtWmVzekJ2S3hZVG4rWXJa?=
 =?utf-8?B?ZDlFR0pzMGFJQ25jelNnbmdvdmZ5cDJucDlPZlRlRi9KTzF3Qk5FTndqVGtm?=
 =?utf-8?B?K25xc3B4U1JOZ0hjM20zcG1aakxKMHhtZVB4TFRkSHJRWmVhc0R6dnBLNU9K?=
 =?utf-8?B?U0EzdkNkQThVaTdFb1p3OVYwQWRjclQ3SGtSQVZHdFFRLzZrUHNFTWJqRFh6?=
 =?utf-8?B?OGFhemlpUDlJL3VqaEt3RHE1WjZhU3Q2ZEtYZFZvWDRtL3Z0ck1tazVTS2pF?=
 =?utf-8?B?SmZNMEEreG9mRGZveFFQd0dkdjRic2xLcUQ3OHcxditMUVNZNndQbm1qYVBk?=
 =?utf-8?B?T1hIbDdwdmVXVFhEUTRPK25EaHdSTVdab3FtNlYzNmtSaHBlVmg1eHNUTm5m?=
 =?utf-8?B?Q0daeDk4WER3b1BDRE81bTVyVFNrbkk0QW9vbmxFVWpxNS9SSGx4Wm1Obnh2?=
 =?utf-8?B?UkdDbG9PdVY1RXdHQWF5aUVqR0Eycjk4YVArS3FCYWZtSTJLY0FrNDd5M1l5?=
 =?utf-8?B?OUZEeHBWU1pFNEFEUVE1ck94YlRwTkEwSHpGK1AzTEtpYnc1M2xEZS8zT29O?=
 =?utf-8?B?ekJENjJ3c0twbWtMZHJLa2l4WDZDbzc4aWZjdnZrZmpSOHh4OHUxNVhjUnRu?=
 =?utf-8?B?NmQ1bHQwbk5TajZvL0dzVW8raTd0NXhTdjR1YTJpaTRYYXNSZjF1V3NEaTYw?=
 =?utf-8?B?Umw1UnlKOWRmemhoQXh3NSt3bTNBQUgyaHBndXowM0ZrcFZjUEFNRERYeU9v?=
 =?utf-8?B?RklQaUg3bURQS0QzTXpOeCtzdG9ycXVNVDBudnllNDlOT2NzR1h4WFNZZWRY?=
 =?utf-8?B?RkwzbUV3UEI0SDczZFhiQ3JwQjlJcWREdHhUZTJ5SGJtaXJZUmU0ZFZHcWFa?=
 =?utf-8?B?YStQVkV2QkFhN0Fkbnl6WTh5MkVUeHFadENrUmgvL2VObUNTS2dxTW1Pa3dG?=
 =?utf-8?B?MWNRamNhV0hWVmdzWittbmY0di94K3NuejI1emgzeCtDS1VvL1hNbDJBVlpD?=
 =?utf-8?B?WmNTRHdqdGJRaEc0TjAxU3pEMHNsei9RcmpJYkh2Um1JRGVacXA2YnNqeTJP?=
 =?utf-8?B?MkxMT2w1V25XbmdXMUdpd2xkd1dXVDFLRVdCUDJsblFXbisrYUpFck4zYzFt?=
 =?utf-8?B?UmtsSC9lQVpaWUdKSHJjOE14Q2ZHZHpyenlnYmFPTkFpU0UzM01XbGJ3Z01D?=
 =?utf-8?B?WkEyVTdOa0J4RERlYzVqOGhnOUFtb0QwRU1lY3dDeTR5dmJOYld2V1Y3elNk?=
 =?utf-8?B?WHBGWmdOY1c4T3JCWmt4dHNFRnQ0VjZQTi92Z2hRT3RObGloL3hxM3Fqakoz?=
 =?utf-8?B?Z3d5NGU1NlBIemFnOUMwZ0V4QnFlbnpBWWlZQTNRZTVzTjN1YUhuQ3JYK0ds?=
 =?utf-8?B?MDlQbVdWWWh3MFc0R282U0FXRC81MUtoTi9BODRzdkZ0WVNiTUE0ZUdSU28x?=
 =?utf-8?B?K3dVU0w4V1Q3OXhiWUY1TkdkbWw4dENvSVFCNDdSVnlhbUxQNDVsdzFmb2Fv?=
 =?utf-8?Q?kzNu2PUas8mfKcFD5FINaqQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc3e886-dd0e-4394-9418-08dd469a1096
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:36:08.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWK5WXfGCdsivKSJTnJxq0Z57Uj1fcXauJdx2l3M530kYZHiJeZrUnR5m0Y9e9VhMp1eq/UJMz5hI1nDazaKniJjPS22uLpMut2FnlrdvfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10872

On 12/11/2024 1:25 AM, Alexandre Belloni wrote:

Hello Alexandre,

Thank you for your detailed review on this driver.
Sorry for responding to this review so late, I've just now found some 
time to continue work on this RTC driver.

> On 06/12/2024 09:09:53+0200, Ciprian Costea wrote:
>> +/*
>> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
>> + * should not be used.
>> + */
>> +#define RTC_CLK_SRC1_RESERVED		BIT(1)
>> +
>> +enum {
>> +	DIV1 = 1,
>> +	DIV32 = 32,
>> +	DIV512 = 512,
>> +	DIV512_32 = 16384
>> +};
>> +
>> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
>> +	"source0",
>> +	"source1",
>> +	"source2",
>> +	"source3"
>> +};
>> +
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	struct rtc_time tm;
>  > I don't think storing an rtc_time is necessary. I don't even think
> cycles is necessary.
> 

Indeed, switching to usage of just APIVAL (as you've suggested) instead 
of relying also on RTCVAL would make 'rtc_time' redundant. Will remove.

>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	void __iomem *rtc_base;
>> +	struct clk *ipg;
>> +	struct clk *clk_src;
>> +	const struct rtc_soc_data *rtc_data;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	int irq;
>> +	int clk_src_idx;
>> +};
>> +
>> +struct rtc_soc_data {
>> +	u32 clk_div;
>> +	u32 reserved_clk_mask;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +	.clk_div = DIV512,
> 
> If you input clock rate is higher that 16kHz, why don't you divide by
> 16384?
> 

Yes, the default input clock rate is ~32KHz. I will enable both divisors 
to increase the RTC counter resolution.

>> +	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
>> +};
>> +
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +	return div_u64(cycles, hz);
>> +}
>> +
>> +/**
>> + * sec_to_rtcval - Convert a number of seconds to a value suitable for
>> + * RTCVAL in our clock's
>> + * current configuration.
>> + * @priv: Pointer to the 'rtc_priv' structure
>> + * @seconds: Number of seconds to convert
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + *
>> + * Return: 0 for success, -EINVAL if @seconds push the counter past the
>> + *          32bit register range
>> + */
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 delta_cnt;
>> +
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * RTCCNT is read-only; we must return a value relative to the
>> +	 * current value of the counter (and hope we don't linger around
>> +	 * too much before we get to enable the interrupt)
>> +	 */
>> +	delta_cnt = seconds * priv->rtc_hz;
>> +	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(dev);
>> +	u32 status;
>> +
>> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
>> +
>> +	if (status & RTCS_RTCF) {
>> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +		iowrite32(status | RTCS_RTCF, priv->rtc_base + RTCS_OFFSET);
>> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
>> +	}
>> +
>> +	if (status & RTCS_APIF) {
>> +		iowrite32(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
>> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
> 
> I don't think you use APIF as a periodic interrupt so it doesn't really
> make sense to use RTC_PF instead of RTC_AF.
> 

Correct. I will change to `rtc_update_irq(priv->rdev, 1, RTC_IRQF | 
RTC_AF);`

>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +				     u32 offset)
>> +{
>> +	u32 counter;
>> +
>> +	counter = ioread32(priv->rtc_base + offset);
>> +
>> +	if (counter < priv->base.cycles)
>> +		return -EINVAL;
>> +
>> +	counter -= priv->base.cycles;
>> +
>> +	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
>> +}
>> +
>> +static int s32g_rtc_read_time(struct device *dev,
>> +			      struct rtc_time *tm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	s64 sec;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, tm);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc, rtccnt, rtcval;
>> +	s64 sec;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, &alrm->time);
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
>> +
>> +	alrm->pending = 0;
>> +	if (alrm->enabled) {
>> +		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +		if (rtccnt < rtcval)
>> +			alrm->pending = 1;
> 
> This limits the range of your alarm, why don't you simply check whether
> RTCF is set?
> 

Nice idea. I will refactor in V7.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc;
>> +
>> +	if (!priv->irq)
>> +		return -EIO;
> 
> 
> This will never happen as you are not letting probe finish when you
> can't request the irq.
> >

Correct. I will remove this redundant check.

>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= RTCC_RTCIE;
>> +
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
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
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return -ERANGE;
>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret)
>> +		return ret;
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
>> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	priv->base.sec = rtc_tm_to_time64(time);
>> +
> 
> To simplify all the calculations you are doing, I suggest you reset
> RTCCNT here and store the epoch of the rtc as a number of seconds.
> 
> This wll allow you to avoid having to read the counter in set_alarm
> also, you then get a direct conversion for RTCVAL as this will simply be
> rtc_tm_to_time64(&alrm->time) - epoch that you have to convert in cycles
> 
> You will also then know right away whether this is too large to fit in a
> 32bit register.
> 
> 

Unfortunatelly, the RTCCNT register is not writable. Hence it cannot be 
reset. The only way to reset it would be to disable & enable the RTC 
module via 'RTCC_CNTEN' which would not be acceptable in this callback 
and in the end it is something to be avoided.

Nevertheless, I believe by using just APIVAL (as you've suggested) 
instead of relying also on RTCVAL would greatly reduce the complexity of 
this driver. I will refactor in V7.

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
>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = 0;
>> +
>> +	if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
>> +		return -EOPNOTSUPP;
>> +
>> +	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
>> +
>> +	switch (priv->rtc_data->clk_div) {
>> +	case DIV512_32:
>> +		rtcc |= RTCC_DIV512EN;
>> +		rtcc |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV512:
>> +		rtcc |= RTCC_DIV512EN;
>> +		break;
>> +	case DIV32:
>> +		rtcc |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV1:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	rtcc |= RTCC_RTCIE;
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
>> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
>> +	if (IS_ERR(priv->ipg))
>> +		return dev_err_probe(dev, PTR_ERR(priv->ipg),
>> +				"Failed to get 'ipg' clock\n");
>> +
>> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
>> +		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->clk_src)) {
>> +			priv->clk_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (IS_ERR(priv->clk_src))
>> +		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
>> +				"Failed to get rtc module clock source\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_probe(struct platform_device *pdev)
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
>> +		return PTR_ERR(priv->rtc_base);
>> +
>> +	device_init_wakeup(dev, true);
>> +
>> +	ret = rtc_clk_dts_setup(priv, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rdev = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(priv->rdev))
>> +		return PTR_ERR(priv->rdev);
>> +
>> +	ret = rtc_clk_src_setup(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rtc_hz = clk_get_rate(priv->clk_src);
>> +	if (!priv->rtc_hz) {
>> +		dev_err(dev, "Failed to get RTC frequency\n");
>> +		ret = -EINVAL;
>> +		goto disable_rtc;
>> +	}
>> +
>> +	priv->rtc_hz /= priv->rtc_data->clk_div;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->rdev->ops = &rtc_ops;
>> +
>> +	priv->irq = platform_get_irq(pdev, 0);
>> +	if (priv->irq < 0) {
>> +		ret = priv->irq;
>> +		goto disable_rtc;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, priv->irq,
>> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->irq, ret);
>> +		goto disable_rtc;
>> +	}
>> +
>> +	ret = devm_rtc_register_device(priv->rdev);
>> +	if (ret)
>> +		goto disable_rtc;
>> +
>> +	return 0;
>> +
>> +disable_rtc:
>> +	s32g_rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void s32g_enable_api_irq(struct device *dev, unsigned int enabled)
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
>> +static int s32g_rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	u32 rtcval, rtccnt, offset;
>> +	int ret = 0;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Save last known timestamp */
>> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
>> +	if (ret)
>> +		return ret;
> 
> I don't think that whole calculation is necessary as you are never
> actually resetting RTCCNT in suspend
> 

The RTC module needs to be reinitialized during resume, because the RTC 
registers are being reset during Standby/Suspend to RAM operations.

Nevertheless, I will greatly reduce the complexity of these calculations 
in V7.

>> +
>> +	/*
>> +	 * Use a local copy of the RTC control block to
>> +	 * avoid restoring it on resume path.
>> +	 */
>> +	memcpy(&priv, init_priv, sizeof(priv));
>> +
>> +	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
>> +	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
>> +	offset = rtcval - rtccnt;
>> +	sec = cycles_to_sec(init_priv->rtc_hz, offset);
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return -ERANGE;
>> +	}
>> +
>> +	s32g_enable_api_irq(dev, 1);
>> +	iowrite32(offset, priv.rtc_base + APIVAL_OFFSET);
> 
> What about always using APIVAL instead of RTCVAL so you don't have
> anything to do in s32g_rtc_suspend.
> 

This is a great idea. I will update in V7.

> 
>> +
>> +	return ret;
>> +}
>> +
>> +static int s32g_rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	s32g_enable_api_irq(dev, 0);
>> +
>> +	ret = rtc_clk_src_setup(priv);
>> +	if (ret)
>> +		return ret;
> 
> I don't think this is necessary.

It is, because RTC registers are being reset during Standby/Suspend to 
RAM operations.

>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings.
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> 
> And so this is useless too so yo udon't actually have anything to do in
> s32g_rtc_resume.
> 

I will refactor (simplify) the entire store of time logic from suspend & 
resume in V7.

Regards,
Ciprian

>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>> +			 s32g_rtc_suspend, s32g_rtc_resume);
>> +
>> +static struct platform_driver s32g_rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= s32g_rtc_probe,
>> +};
>> +module_platform_driver(s32g_rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.45.2
>>
> 


