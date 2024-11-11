Return-Path: <linux-rtc+bounces-2497-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 042629C4017
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279DA1C21A23
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 14:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A2C1A08C2;
	Mon, 11 Nov 2024 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YlvVBQT3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707971A01C3;
	Mon, 11 Nov 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333598; cv=fail; b=PebXjMFXzUYEKWKM8BnESDnhr4ERpPP/8hf9Gy9VHpbcs+EYmBpQleohE3cDiEDl5IyakkyS7w3XE7LIXLGEjvwM1Sm05WQTVV4k2HxBibLT5T8doBs/VxuHDCEoc0Ir79O8S4SGxonQwOfunGTHObjWgLY//AmP9lBahk3XPOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333598; c=relaxed/simple;
	bh=O9KNTGU/zHImnx872xQC0z02ysc9zBABSmujoXQUVeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pkYKyW/NB5Jxbe/rB8AMRlVOkpUFDpcfWHEB2jBsgYL0t7OL1VfxCmPVNoHUJ3/WI7A71szovMt+NjHh3hlfAldd7QoggKn+sk6cstcFqhCAV+aW6PQ//5guab824fTRB5OTYK3rEM7l7/BVRlP8eBwV4wbUjCl8jW50B7ybExQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YlvVBQT3; arc=fail smtp.client-ip=40.107.104.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/JYrdKnKV8zxtINZ9pQnVuhN814UAQxwj042P/eoUNCEInnIBfVv/oH2ipF/se3x8QNvaZTdBb02aSL0XhP4njQn3XG/udv4zMtTRNHbIBBGIeh0qmY4ySy9TeqvSsf8k2X7/V5NmhbdUmBOTo2hHeSbvce2G2c/GtXS01ajxK0tUzK2HcXL+N/m9FpYIRNq6aCJBn7iQR26zVIuD3yiZ21XEO2Z6qnOH4iDtyNYHrk+/5Zr3hFDZ/OOOA9+R+zfvNtzJW+/fOaIOhdXm76uS2KmXQcXqgfrr1GKoJYJtcJdwvj28PrpSByOxRHFRq/QcmxFGCmqgyQaZFLCVZ40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAhMbH+VrEx3GlwJDLTenCTsQMMhwd5ABC5LYlKprXU=;
 b=XzJv0o6y4Wobn0zHRPnzpd4PZwKaXEj0Lt5IRukU/uhmqR8CCogbSDiEumz2k4wu0WIsoLGfBsBEb97Z3dZFgWar/HUtMaPmg1DWhTbYu7Je5RN/qBQKb43tN4+9ljKno1wA1QUY1o2IrEoktMoXZTrhf0g2hjGjKkVad2DbanLvVCqBCJH06SzIKFDnmbU82908YH3dnQ8QT+SIOb0mxmIOApp2y5UbCmtgP/fkWKpVkFRTCosueXsExpc/3cQZbJhG5GO3dZhi72Bv3iFrCfS6ak6ipEw8vYX92LYJ3HqmjXC2ZNUes/Um+cE0GtNcpaly46rvLnwWnCCdpKgJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAhMbH+VrEx3GlwJDLTenCTsQMMhwd5ABC5LYlKprXU=;
 b=YlvVBQT3NDqRpRPjOwQgxAJY/eDWgqL/30+o1wfCdKHFLKHqOJHQOoh5xspBDDXJdSLioJq0KFBWL/Ofb1w1SmzQRlNK/2UAN7PVvWJxcFmHkzCscrmPSPm69A5CdfJ+sZDldZNg4VGjYboCTZfqa1Or4AcAC8Eb9Dn45LWFYYr89xlDbl4Q78D2I5rp+GDwJYz5E8zcD2vsuuiusLewCr4/ob6oLUEQwh1eQSG+q5LUeliS9ze+klEU0Sk0BzE+mROKOTH6vrZTgX9e4MkBQrsmkBvnJPhs/LO/nwh9tR6oFh9F7phHzyaihF9bDN4x/8cvALDM3jEEnq87tpFvTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:48 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:48 +0000
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
Subject: [PATCH v4 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Mon, 11 Nov 2024 15:59:38 +0200
Message-ID: <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e93601a-7e4f-4ba0-05e6-08dd02591a9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG1qcUFaQ2hMTEhMNlVSdHl2bEpDUGNBaVZTemJQMmozNFlQWXJKSUlGRDBP?=
 =?utf-8?B?YmR0UVpQVkZRaEh6dXppSU9CR3drdlBLUGtZeVVWTlBzL1NzTS8xaDN2VFJs?=
 =?utf-8?B?NklXZktqT3RwZS9hczhSMUtHQ1hrZncwWjlQczJObmNXQkwvN0tmdm1jbGVK?=
 =?utf-8?B?VE9LcDFkSWJSQmw5OU81dnlIRVRYclV0SU40SzNmOFRkb1cwa0RPcWU0Q045?=
 =?utf-8?B?WHpQNEhVeWJWWmV4VVFBcU4xSkk2aTBOMjU5aXlVRVdEWElOSklzQkhwOXpC?=
 =?utf-8?B?YWJkS21DWXB6b1lSMG8wdU96SEV1OGYrK2w5b0pCZlBZdVpNU1lMR3VrUXdG?=
 =?utf-8?B?VFM1dyt1OUtZemZZOHRaNG0wN2UxQ3oxa2NzRGNTMkJPdnQvdDN1RURKYklr?=
 =?utf-8?B?cjB4RzVsK2prYjBiTkxPRWRxd0RkbnlTSGNIUTJhbzRUb3N1OXE3QjBRUGdj?=
 =?utf-8?B?ZnlGeng1RFhjemJRZTl1QzYxSjdKMU16YUlDdkNCazRLcHpjbUxlc0dhOUpa?=
 =?utf-8?B?VkFLanFVN3NMT3pWUzRHRFRIK1ZsVGg4K3R1dDc0blZxd0ljZ1hoOXdMUjBU?=
 =?utf-8?B?KytMZGx2bGJLMVJ3Si9FV0N5OVRCZFJya0pKUXhzbVo1Yno3VXRKQWlWV2lp?=
 =?utf-8?B?dERsaGFFaHpqdHk3TVdmTllTSVJrd2p4bVc5RGpqZlE5TE1LcHYzakJxZ1Q3?=
 =?utf-8?B?M2dlZURibDBGOUdkRzJDZXl6Sk1rVUtOeXl2Z3dDUzlVN01VaHhhQWpUbjF4?=
 =?utf-8?B?UEtaTWh2QlJHT0IwY0cyMUhEWmZkUHdhNURZdE5hVysyZXc1TW9BWVR1Mnlv?=
 =?utf-8?B?TEw4bnpkYTRlcUxKMTJKYUM2ZVBkcWVCbEJyRVBlQVcrUHpuVytDbXlLcWpN?=
 =?utf-8?B?RTdKUWxvUk9VZUhHdk1IQU1uYStzK0d2N0lqeGJvSWllaFN0N3dyZExYN0Iy?=
 =?utf-8?B?RnNWQTFHampvT3JPaVUwVEMyWHQ3THFVQUcyaGZKV05tUDcrNzBFM0xlZENB?=
 =?utf-8?B?di9ZS0xSRFpZalRmRFFoaTZZSVFtbk5hMnUvLzdIZHd0dG8wYUdMOXdMWEtQ?=
 =?utf-8?B?QS9tZGcxazZFWUMwYjdaM2dkSHc3aHd6a2RQOUJkVmdjMnh2TEs0UmdRMkUr?=
 =?utf-8?B?dTdvaDBub0JIeHNteUdOalJtYUZET0t3UXFucDNwSFVOaVV3Rml1ZUNTY3Za?=
 =?utf-8?B?b0JwKzJOanVnaDJqaGZnMVF0YjNWMXFxSUxJWVJzd3loQUtOY25wSlhvam9k?=
 =?utf-8?B?T3kxRkZGazg2UXFNNFhsbHdQOHg5d2VDVnYyd3JXR3RoaGxlS2FyVWZvZXNx?=
 =?utf-8?B?Y0NxMU5TVkJ4WGJqbktJdnJuOC9HWHgzTkluaWZqWjQ5WjBaZnBPUTZaSXdC?=
 =?utf-8?B?WEhLR2FwRE5EekZtWHNwTi9RcmRkWW9YY3l5TlVRTnRIUjcxcjNRL05XQmNQ?=
 =?utf-8?B?Zld4cGlweDJnSkxKZVZDMzlOaU1hNzdGQzNqdFdsdmc2Z2FXN3lTVTd0MUwy?=
 =?utf-8?B?ZnRISWFUUkhPOUYzdExWQlRtN1BjMG1FSTRPOHRKcmNGVWpEVkJqclBERDBY?=
 =?utf-8?B?bElOTE00Y0RXRnQ5TUhxbS83Tk15VDQ1aHVjQ1o2bEszWWR3S2YycC9ESTRw?=
 =?utf-8?B?OHN0VG1IclZYdGQrdy96S2ZxMWRZdHdNblROdnVIMkJCU2V6dW1PbVpkdTho?=
 =?utf-8?B?VnNJRzdTeStSSG1iNUc2KzdXOXNwUThPS3MrcHloR3B6dVpnTktzcHpIS0V4?=
 =?utf-8?Q?3iVlYdTilwUYaNGrGQb/ycNVfHt27JqZKmhbyim?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVtVnZwN1h3S2ZpM1Fma0Q5dnM3VlMwelMyQ0tIdWlLRXFIb0NiSmh5cDJD?=
 =?utf-8?B?YTVxOXM0SkFzVlJVQlFjWVFJVTVhUWhWOUVxamxzUWpHYk9lLzdoYWFDVjVr?=
 =?utf-8?B?N2crWXVyeHVtbjZORkRIbVlBcmt1Q1psME9XMmVDeXp5RGM4UG8zWVptbnhz?=
 =?utf-8?B?WVl0OU0yVEF4K3BhOHhnM1hiZmpBanZnL2dibmMzOFVXclRIaks0MFA2ZThU?=
 =?utf-8?B?QmV5MWlqR2VPNjF1VjdtVzhua0VlT29yL1FvU0pFZld6OVdzeHZISjU5V1E3?=
 =?utf-8?B?bDhmYlNvR3pvblRHZSs4enpTWUNvR3BFOXNoVThTai9tWFBDdmJzSkxEKzlv?=
 =?utf-8?B?RHNoQzFwTVQ2QVEzM1l0cDZzQ25vRDR1a2JYSUlLckxkb1FaRGJKMG4vQTBu?=
 =?utf-8?B?Y251YnIrRC9uaUJ5TVN1ek5oODhDNUkrNEt2UGIweVQ0VklmaWtLdW51U09P?=
 =?utf-8?B?cjJWNjlvTFlBR2Y0azJXdWdVcWdBalZ5OTJNVVVNNW43RGVsVitzQ3ZFK2xI?=
 =?utf-8?B?WkcvYlZsRlBBTU9oTlIxb1NLajFkVHBTM0JCWXVSb1l1ZUU4OCtYdk5aM3Fy?=
 =?utf-8?B?d1dlRWhUdVRoNlhJWm5xelpNK1JZUGNBSnJtNjZjZUpYb3o2dVNPK1U0VXYy?=
 =?utf-8?B?NFU4NGt0cEh4c2NzQ3NpSlhMS0dROHNSMzg1R29ISVpKdndQZ2R4czlYNFVz?=
 =?utf-8?B?dmdWZkVzbzRWREJqNUo5bFBYWnJiVHdJbk5BSk52eUw3dWtDTklwanBmRmkv?=
 =?utf-8?B?bE1lZThyZ0wrTG1HeWtxakptdUNobng1Tnd5SDJCb3hMY0VQRThVUFI0d1Rn?=
 =?utf-8?B?SXI0N1ZuU043ZTF4UnZxR1kvOFJGcnpmYnA1dUZFMlRSdDA3c1dMZWMzWEVK?=
 =?utf-8?B?Z0ZxVkRzU0ZpSnJvUjZiOVZ0dzVVNVRoOHMrdVpYaGJOMXV3ZVg1T0M1KzY2?=
 =?utf-8?B?eUNTU0RGb1NoZjZqdmVPWkgzdm1DSEFtUlNxNzRlV1BBYjZoYTI1SStWMk1P?=
 =?utf-8?B?TmhVV3dBd1hMc0Jobm8rck5wdG8vOW9WSFhPTXJYNkVnWjVsRnpielFzU2g0?=
 =?utf-8?B?OGVtQVh2Qkk0emNOODZhZkNWbkpEdkErTWd5Njc5M3lPdjdCd1F0N2ErS2JP?=
 =?utf-8?B?TjBxbjc0UGZTNnlZZFBEUytGNERPdkxWOG8xdlkzNHM4ekxrZ3FtMDBDUnVv?=
 =?utf-8?B?Y3dQazBWanJxYnJMK1JxSVM2SG1qVWVQK0h6bnpIY3cwbVFxZ09ZeFJQdzdt?=
 =?utf-8?B?aHp0N3JmZmtrSGR5NHd3ZFRrSGF4TzYvRjhSWE1DeWJHUHEyQW56SHpZTDFh?=
 =?utf-8?B?bWc1U040NTlpVVc5OGY5dVhFRnlOZnZweUJrVHhmY1VQNVdQRjFQTElxTWFJ?=
 =?utf-8?B?dXZjZDZCMjR6d0drZ0pFQmN4cTNybXJuVFROaHIvajhTSDUweFJGZG11dDhO?=
 =?utf-8?B?dkZ2UExCSTd3RjNhOGgvUGcyOFBaMFFyWHQ0ZUVNTC9HTkVpQ0VmNEhWRWZ1?=
 =?utf-8?B?L0VlaHJpN1NFUEVxY2lLZHozQ0swR2wxb1JNVm9tOHM5Y0tVSlA1aXV2WlJR?=
 =?utf-8?B?ckhVeCtuQ3JXbXlDeUtNVlNLZWdqWWQ4cFFYV3dUVW9QVmRpK0piOWVnR1dj?=
 =?utf-8?B?aUFKcnJZUGRZeFNUYlBXc0lyNDhvaHZRKzZuM2RocWlwTlU0M09MSmhKYllK?=
 =?utf-8?B?Wm5hZHRzS1BiL28waFBiZlJWWGMrOTNVTFNFNjlYczNEek15Mk41VWlFelFR?=
 =?utf-8?B?OVYrUTRFM29aUmh6QzNCZWxOaUE3WlpzWmt0cXJyTFlwdks1cWNoVXdLeGt2?=
 =?utf-8?B?WDNDSVYwemtoRzlrV3dEWklscC9VcDU4SmZWekczOVdQRU5HSStQRE82cllU?=
 =?utf-8?B?UUpHK0d5Rm11akYvaGJMazBJa3FlMXFlWkhpWFg5aVRuVis0QmszaGJJWHll?=
 =?utf-8?B?ZHk1L0l5UXZPbWswMkFlQml3OXI4NTdXOUY2N0ZTajM5c0N5VUNXR2lJNzYw?=
 =?utf-8?B?TVl2OHpYOGdXVmFBVEhzQXBCb0lqOXJSTkxFVGJRcEV5RHJrTWRoTW9vUndI?=
 =?utf-8?B?QXlHbFdoQU1kM1ZUdXgvajQzeUFYMEI3b0N2T3kxQjRQQTlxQWQ1RjNKdG5J?=
 =?utf-8?B?MmFXdnZBVXVhT0txZTRDbW1KaUlLbDZPQmdsdDdPWHdqR1dvRk5xK1F3VGpX?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e93601a-7e4f-4ba0-05e6-08dd02591a9a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:47.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4Lpsv8xWKb5s4VjDVuk52u/k1CIw+7VljTUzA0HFnv2udW7fJW7RkQGI9NNk8F4Rl7hzHNirIuz4Z51wWGnVnnIb6xhbXKOB8XY43niHBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support on NXP
S32G2/S32G3 SoC based boards.

RTC tracks clock time during system suspend.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 704 insertions(+)
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
index 000000000000..c3792b674a18
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,692 @@
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
+#define RTCC_ROVREN				BIT(28)
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
+#define RTCS_ROVRF		BIT(10)
+
+#define ROLLOVER_VAL		GENMASK(31, 0)
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
+static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
+	"rtc_runtime_s0",
+	"rtc_runtime_s1",
+	"rtc_runtime_s2",
+	"rtc_runtime_s3",
+	"rtc_standby_s0",
+	"rtc_standby_s1",
+	"rtc_standby_s2",
+	"rtc_standby_s3"
+};
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	u64 rollovers;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *runtime_clk;
+	struct clk *suspend_clk;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	u64 rollovers;
+	int dt_irq_id;
+	int runtime_src_idx;
+	int suspend_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 runtime_div;
+	u32 suspend_div;
+	u32 quirks;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.runtime_div = DIV512,
+	.suspend_div = DIV512,
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
+ * Returns: 0 for success, -EINVAL if @seconds push the counter at least
+ *          twice the rollover interval
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 rtccnt, delta_cnt;
+	u32 target_cnt = 0;
+
+	/* For now, support at most one rollover of the counter */
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	if (~rtccnt < delta_cnt)
+		target_cnt = (delta_cnt - ~rtccnt);
+	else
+		target_cnt = rtccnt + delta_cnt;
+
+	/*
+	 * According to RTCVAL register description,
+	 * its minimum value should be 4.
+	 */
+	if (unlikely(target_cnt < 4))
+		target_cnt = 4;
+
+	*rtcval = target_cnt;
+
+	return 0;
+}
+
+static irqreturn_t rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+	if (status & RTCS_ROVRF) {
+		if (priv->rollovers == ULONG_MAX)
+			priv->rollovers = 0;
+		else
+			priv->rollovers++;
+	}
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
+static int get_time_left(struct device *dev, struct rtc_priv *priv,
+			 u32 *sec)
+{
+	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+	if (rtcval < rtccnt) {
+		dev_err(dev, "RTC timer expired before entering suspend\n");
+		return -EIO;
+	}
+
+	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
+
+	return 0;
+}
+
+static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u64 cycles, base_cycles;
+	u32 counter;
+	s64 sec;
+
+	counter = ioread32(priv->rtc_base + offset);
+	cycles = priv->rollovers * ROLLOVER_VAL + counter;
+	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
+
+	if (cycles < base_cycles)
+		return -EINVAL;
+
+	cycles -= base_cycles;
+	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
+
+	return sec;
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	s64 sec;
+
+	if (!tm)
+		return -EINVAL;
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
+	u32 rtcc, sec_left;
+	s64 sec;
+
+	if (!alrm)
+		return -EINVAL;
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
+	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
+		alrm->pending = !!sec_left;
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
+	/*
+	 * RTCIE cannot be deasserted because it will also disable the
+	 * rollover interrupt.
+	 */
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
+	if (t_alrm <= t_crt) {
+		dev_warn(dev, "Alarm is set in the past\n");
+		return -EINVAL;
+	}
+
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		/*
+		 * Rollover support enables RTC alarm
+		 * for a maximum timespan of ~3 months.
+		 */
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return ret;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret) {
+		dev_err(dev, "Synchronization failed\n");
+		return ret;
+	}
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
+	if (!time)
+		return -EINVAL;
+
+	priv->base.rollovers = priv->rollovers;
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
+static void adjust_dividers(struct rtc_priv *priv,
+			    u32 div_val, u32 *reg)
+{
+	switch (div_val) {
+	case DIV512_32:
+		*reg |= RTCC_DIV512EN;
+		*reg |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		*reg |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		*reg |= RTCC_DIV32EN;
+		break;
+	default:
+		return;
+	}
+
+	priv->rtc_hz /= div_val;
+}
+
+static int rtc_get_clk_src(struct rtc_priv *priv)
+{
+	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
+			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
+}
+
+static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
+{
+	struct device *dev = priv->rdev->dev.parent;
+	u32 rtcc = 0;
+
+	switch (src % RTC_CLK_MUX_SIZE) {
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
+		dev_err(dev, "Invalid clock mux parent: %d\n", src);
+		return -EINVAL;
+	}
+
+	if (src < RTC_CLK_MUX_SIZE) {
+		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
+		if (!priv->rtc_hz) {
+			dev_err(dev, "Failed to get RTC frequency\n");
+			return -EINVAL;
+		}
+		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
+	} else {
+		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
+		if (!priv->rtc_hz) {
+			dev_err(dev, "Failed to get RTC frequency\n");
+			return -EINVAL;
+		}
+		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
+	}
+
+	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
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
+	priv->runtime_src_idx = -EINVAL;
+	priv->suspend_src_idx = -EINVAL;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg)) {
+		dev_err(dev, "Failed to get 'ipg' clock\n");
+		return PTR_ERR(priv->ipg);
+	}
+
+	/* Get RTC runtime clock source */
+	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
+		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->runtime_clk)) {
+			priv->runtime_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->runtime_clk)) {
+		dev_err(dev, "Failed to get runtime rtc clock\n");
+		return PTR_ERR(priv->runtime_clk);
+	}
+
+	/* If present, get RTC suspend clock source */
+	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
+		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->suspend_clk)) {
+			priv->suspend_src_idx = i;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int rtc_probe(struct platform_device *pdev)
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
+		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
+				"Failed to map registers\n");
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return dev_err_probe(dev, PTR_ERR(priv->rdev),
+				"Failed to allocate RTC device\n");
+
+	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				"Failed clk source switch, err: %d\n", ret);
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret) {
+		dev_err(dev, "Failed to register RTC device\n");
+		goto disable_rtc;
+	}
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0)
+		return dev_err_probe(dev, priv->dt_irq_id,
+				"Error reading interrupt # from dts\n");
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static void rtc_remove(struct platform_device *pdev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(pdev);
+
+	s32g_rtc_disable(priv);
+}
+
+static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
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
+static int __maybe_unused rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	int ret = 0;
+	u32 rtcval;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (init_priv->suspend_src_idx < 0)
+		return 0;
+
+	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
+			init_priv->suspend_src_idx)
+		return 0;
+
+	/* Save last known timestamp before we switch clocks and reinit RTC */
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
+	ret = get_time_left(dev, init_priv, &sec);
+	if (ret)
+		return ret;
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return ret;
+	}
+
+	s32g_rtc_alarm_irq_enable(dev, 0);
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	return ret;
+}
+
+static int __maybe_unused rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
+			 rtc_suspend, rtc_resume);
+
+static struct platform_driver rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= &rtc_pm_ops,
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= rtc_probe,
+	.remove	= rtc_remove,
+};
+module_platform_driver(rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


