Return-Path: <linux-rtc+bounces-2391-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDB9B7697
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16CA91F23250
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8BE18EFF8;
	Thu, 31 Oct 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nG2lFSIs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2272189B8E;
	Thu, 31 Oct 2024 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363779; cv=fail; b=HqeGj3a0AOnZJzfkDR2ciuTvDU9/npz4A5uws4TzFsshmuuLcYJS4DN4t/ztY7sOtFEQQ3fjLXsI28IdNQ2XRqfPR8XKzWBD/Erx6WztuBJArVo+1gRKpZSwybdfd686dghIzjZ/soEcySNnppmRb8z8qpSd0HBlSvdLflIVEEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363779; c=relaxed/simple;
	bh=bL3NkImcly2cuAHYW4cMEdSXW4vh9dDqAo2Dbi22W/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=otX//sOuMh12Z7+B/iCZ7ZoWvPgPu9bot+kpTj+wl2y/10bpJ05xtI7R3WKs2gn4WqGzjcggDNOsPFGoKmxXeXBhDwTi4z5OKoCWx3stHqQEC8T46985n0+nx4iZTidY8IanGrgC9uJ35yktIImPzEV/5xLwdWW16UUbSMM4mEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nG2lFSIs; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4Az4qsONsBPtWAJUagUs8MV/vrkX8Afg8ablfiDapdsLvOPJeumvoMhCTZKV5H1h0ZpnScBDzQndrW9zalvUGl/sjff5Z/LKxBhTubb7tuZwObp/NfqbwTkZVyt9jPYnvNdcw1j4Je6+z1NnbjTYKxFoU+xn3dzD2CsqSBdwlJ7OpxjS9yIdTTDrXTJcq4HNg2a/3v0z45mSAwPLr8nqiMWUfkZbBhK6mvAsulQxrkAKp2a5bOefi2xtS1rF0YmgR9JvTTz4Kr7tXEPTTZfjIP9qyWHucA9kI9SW7TibRw9gkYeXzT1/B80i9GUSHLq1StvITmmGM3yvoJhBWIPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiuOkCfpsNxZrkFZMYxjLbzR4TnUVZDDLO1KoGr8M6Y=;
 b=K0ACngsGzsb4q/EDOEdS+TkHpcwSIKpd9HycBDwAOe6+87Yv2F3686FJCcsFg6WAiub3svMapDOQAA6ooLKUAquv0nnrvsF1s1beaNa+8x4eSAv1zU3eFd1bF0YmqgRsgzy5RMEpDK5l2xd2G1/EG+6kyoK6TQAsOPpSnvDziasitIPik9JvjC7cZgrZudDFxaPkQPm4SZwNxTNcL5tCX+h4ona7w/zbAE/HRGKf2qkZqTc39ktLQgd8Sw9opMosfed14RNgGucWZcI1Yj3BGaVQ3c6yNVKnj60jr3k7fsha63iJvb1JOweTSBKYDW27XcJqxVnAlzmj4LYy37oahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiuOkCfpsNxZrkFZMYxjLbzR4TnUVZDDLO1KoGr8M6Y=;
 b=nG2lFSIstQB9zNFUL6amZp52/3ySTcnES31Zw69OEhaT9n9xRb/T0lYWtgVZh7xgXpUZgvM8Eyg0IxA4NA71cTLbR8iIEX4N5rKUXIxBM8creCDq2DboDd6RwexsOwql06WSdvZAz9gHeTLFSO5RaSYpd4yyyltfihNdtDOQgAWqxeA5h/xavuq7GBr0BTOYmPQV9GxGd1e54VKg5ZV2nkAWevDbRTMrZeSTtD2eYT/cN74EcNAaOatNzO4iJ9DfJtNyi8AB4qevb9joWVezBKg9nTg5HrGUxDyEhA+8z3Z5krIs8rQiQ0ZIFEf9sLbP1KLUy2cd6rLX+mKvuFn2IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:36:06 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 08:36:06 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 3/4] arm64: defconfig: add S32G RTC module support
Date: Thu, 31 Oct 2024 10:35:56 +0200
Message-ID: <20241031083557.2156751-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0144.eurprd04.prod.outlook.com
 (2603:10a6:208:55::49) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI1PR04MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdda8a9-7cd1-4f58-5766-08dcf9871007
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkVNTlpka20rVFBhaW9aNkNicEJIVS9QVVRXYmtBeUJRd09PVHo0QXVWRk1H?=
 =?utf-8?B?dWdOTkJQeS9mNXMwcTdTdXhrcEJVeUZZY0xYbFVxM20rank4c1RDRXBZUUdQ?=
 =?utf-8?B?eExNQVd1SjZwWks0Tnp6bzBqZE01b3VyekYvZVp2dEFPa2ptMnFObHJOYTdS?=
 =?utf-8?B?VzJ6Yk8ybGJVVFM5WkFkWUlyU2h4R2tMYUJWSnpmWm1XbTNuUExlc2ZaZCt1?=
 =?utf-8?B?emhUb1BvSkZna0lTVUxVdDNkV1ZaWjhaVTZwNmpOVjYyUEhYZ3dmUTNmczgz?=
 =?utf-8?B?M2dmZFFsWlNoVG1WR0dYelgzYUtSUGNxQU9PNk5TT1FGcVlKWWJ2eUdKTk1t?=
 =?utf-8?B?L2o1YmViRmJ3LzBYei85ZkZDNUZKUmQ4Rkd6SGlIbUhWSmRuM1MyNW5LczhO?=
 =?utf-8?B?Sk5mSVNHVnlncDd2UDUwUTZKUGZLM0h1dWI0MzBZWGpnR3VEK1NHL0hlQ0tP?=
 =?utf-8?B?Q0VhSk54ZXJEdjQ3MTRzRUNQRG9iRDd6Wkc4RktvK2xiU1U1aVM3TGsreHps?=
 =?utf-8?B?alMyRk5WNmRYZnF4UEpVWHBBYzhLVDluNFlFc0xiYzcyNWt3djdoaTVnN0Z3?=
 =?utf-8?B?TG1JU1NNOFlrOHNMdXhiRGRjRUVkdlRkOVlSYnAveFJRRXlMb3FpUkdCSVVX?=
 =?utf-8?B?TzRkYW11NFAzSkFXbW9vUnppczBzS3Rqc1hvSnpqN25ZNW5GTGRNcEE3UVNu?=
 =?utf-8?B?VTlVeXg4TS93YmVDR0RYR1pESlJvbUZTOGtPdG9zbkhlQTZ0eXlNUnowc050?=
 =?utf-8?B?cVUwVEVXSk96aEM4Q1d3ZFZCeGpCcWZFRGI0Vm01cEt2dlMzcmliUlhtUmtX?=
 =?utf-8?B?S1Z0bHJKNkp1U1NHRGRCOXZ6dkFUYXJlR0p5Q0F2TEVpbVRuSExrRkxNeXll?=
 =?utf-8?B?YUVhdHY3bFBEOUNnQnRvR29SWjNETTlsdFFJRy9IOHN4VVM5NjNxMWNHUkRv?=
 =?utf-8?B?VDRVR3lUNnN5bGo5cEh3UkYxWkFjQkptcURmclF3VFNYdG1icEh2WEs1dW8w?=
 =?utf-8?B?QzRvZ2pTNENyVkhVVTVFbjZWTU90R21SckwvZzJ5WTN2MlBwV2E4cnZRMmRI?=
 =?utf-8?B?ZGlUc0RyQjl6VVJjcUxIb3R6YlpFQ0JEMjR1ZG1wQWFpYWRibXVvRjBQZmZM?=
 =?utf-8?B?VHZSUkNCMy9NcVB2dURLQllUK28rdzVGdTVhMkJsV09LZ2toNmlnQitIRm5Y?=
 =?utf-8?B?RUt5SWV4Y1VkYmd2cnVJaXhyNDlYOGd6bzFrMkZzWVR0NnFCOXR4UEc4OGJ1?=
 =?utf-8?B?U1psV0xtWFdvS3dKSVFWR2RaMHJMYjRaMDBaUjdTaVpBNmM2RHl6RForeTh1?=
 =?utf-8?B?VlhoMjYxaVBOb2xZVVpJWmpmNUkxc0lDSmJHbXI3akI3RGx4VStpeFF4ZERB?=
 =?utf-8?B?R0xpckxBSmZyb1h2SElzdkFNK3hSRC9MUURrdXRPalZtUnJJUWovZm9NT2RR?=
 =?utf-8?B?ckpmSmNWWExleWFsNzZkWUp4ZVpEcWlTZXRLUjJQKy9lQXBtMkhIWFV2WTMz?=
 =?utf-8?B?YjVlMjcwZHdSN1BOS0tYVWo1L2NYZEtxbnRQakN1clZTc1FBSStKRlU3SUVt?=
 =?utf-8?B?cDBtNy9RY1JDZ3FPR3pQV01BNnI4eVg3ZktiNG5VZXRLQmhKd3lZU2w5VENU?=
 =?utf-8?B?c1RGaDdaK29wT1J2MnFiZkVNbittOXA2UFlmWkgzalhWdmwwdWJrZ29WRDRZ?=
 =?utf-8?B?V0hZNysrNTN5Wmt1a3dSVXg3YkwxbmVSMklOSDNpanVKWjR6S0ovUFV0dUZW?=
 =?utf-8?Q?rpP/nn/C+yQuD3ncKfka+ljVxGQuA2vV6K9q5WT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djNZYXpmNVVMOFkzWjY0Q1pKVFlhay9hOW04bUtPUW1TcmEwQllCbzgrZE5O?=
 =?utf-8?B?UjZHYzRWMUhLTTVsQWNPUThNKzlvZCtkb0MwYjBMYnIxZkQza0EvdEdjaXJ1?=
 =?utf-8?B?a0kvTm4yWlpmbFB1Q1hxTHdsd3YyZVY1RHZaRmJwV0ZEaDdvR1d1cG8zSi9U?=
 =?utf-8?B?U0hNLzhLTnBFZGxhRVNnMkRadSsxb2lXQlVIbzBiMTF4VFNVZ1RHQ3ZxcWs5?=
 =?utf-8?B?aXpGeDlkRzdZbUZxQ0oweXJ2NGRBK3cxYmFwREV4VCs0MG1ZYUhqYnFncmdz?=
 =?utf-8?B?MmJ2SnFPZW1wZEQ3bmFNMm9pSE9DR0p3VXBwVzExODB3TkVTUTkrRnNxWjlC?=
 =?utf-8?B?blFqMUpjVjhtbGE0U2RUeURGemxKVDByQjVWUDJrdzVJN2h6S1VjcUNFL0hu?=
 =?utf-8?B?cWNPOU9xM29sNzUrMFcvMzgrZnVjYVI1c2plWjJ5WHpndDdsMlZNc1JLcm9w?=
 =?utf-8?B?ajJkSTg1WTFiVVZ1bmwyVWl6emNCZ2RqaUQ3bERaZVBTZm9pVnp6M0NRdHVD?=
 =?utf-8?B?RWdhRDZ5SlVpQzl0RE15SEZUQmlUWHhxUXJTR0NUbFBqS3d2R21xT1JrRkls?=
 =?utf-8?B?d1l3amM0aDUzbG5sWEpFRkRyQWplQmVzZlNzZmt2U0ZMblo0K1dJaU1NYUcy?=
 =?utf-8?B?bGMzTThvSGdzbmNWZUFLUSs2cjNmWmozd0lBcXBUYVV6WEdlbGswUjhHWTRT?=
 =?utf-8?B?M0FKRWo2RFNjYzE0NUJMY3lLekthTVk5bllxaU03MWlBc3VJeEl6TjE2S0FB?=
 =?utf-8?B?QzBqNlR4d3A1ajA2T2RrWURvL2sxQkh6UThsdmJjWGhNT2d5dnI0YXdTbU1Z?=
 =?utf-8?B?emlPT3lNV1B2YUdKbzR0TmQ2YU1HTEYrbmh3U1VXUlZhNGlCUXhNcUoycnRr?=
 =?utf-8?B?Ymlic0c1bTdEdFI1TDBQREx3Y2Nwcmw4TEU0eHE1MHRHeHNrTHVadU8vNmRr?=
 =?utf-8?B?Q2N6YmFtSFlKKzVBbXdJMTZzQ2M5S1dud3IrZmkyM1JxbmtGQ0F0TjRya05y?=
 =?utf-8?B?SlBTa3VkS2pwNEZwdXRjcTNOWUlEbkVHdzF2RUF0RGk3MEh5aHlNaEpBRSsr?=
 =?utf-8?B?RGMxSDBkcUp5cHBybDhRMnpKT2VDT0o1TmFIeCswYjRnZ3V0RmVCU1FIZW1n?=
 =?utf-8?B?dUY5VGE4QldwRUE3dzlKVDFnQ3cwMHVneTRNTWh1OWtmRUVheUtqa3djVWZ4?=
 =?utf-8?B?TC84TUlaZEllRHEvME1Zbnc3T1J0eFExVGIwR0RQaFRjNGhPd1Y5OUxwZkcy?=
 =?utf-8?B?c1FmQVBMZFlFV1NhOWQ5b0JPZlZ0S0RWaUM3dS9DQm1MNnRZZy84K24zdFJt?=
 =?utf-8?B?RVFranBoMFMyb3NCWGFpMlJ4RWttRy80dWZMbTNVM1cwMVRPTEh3Z1YyY3Nv?=
 =?utf-8?B?NjhxRGF5M0VaT0hhZGdIMzJzSHU1RklIanY4bldXbGN2Qks1N1l4anFXOUMz?=
 =?utf-8?B?bDExdk4wR1NsRExTYWFwSVlJbVMzV0pOVTMyY2RKRzlJck8zS2MvMGZNcllz?=
 =?utf-8?B?d1BoRldyM3l5YmN5clZ5R0dpS290RzVnSDlLSlRsVkl1ZnkxcG81V25hWVcr?=
 =?utf-8?B?dUVBTEJ2TG1tenZ1VTdDSndIc0g0NmlpUGhTMS8rSzBnWmFMOGhWWXFFQStS?=
 =?utf-8?B?aHlUaVB4UHlZekluVVVhQkxrbkEzbUtGN2cweFhja3BLeElFN0VWQlJZcUIy?=
 =?utf-8?B?ZEFoWDZWK0J6M1Y0UXhsejAvcTFhcWxzZ01xQmhrbytrNExCQ1J1cWkzNy9p?=
 =?utf-8?B?OWt5elc2ejc2WXRhLzdBWGhQSHN5Ukt1bkRqY2pMQ294QTdJL2RXQkhNRUVF?=
 =?utf-8?B?dno3RmkrV3hzUWlIZnk2Y2tDNmpLYWh4OXZsZTY0dDkzNWhBamZKMU1hUlRG?=
 =?utf-8?B?NEZKVm04bmZtRGRwVE93cDRLRWRBVnJBdHlZZHRqTVVNbEVvcm1lSERWY2pn?=
 =?utf-8?B?QmxBcFpWeC8yL0dwTE1iR1Z4cmRGb2ZqSW4ra0xORmZTeWR4Nmw3algvTzRJ?=
 =?utf-8?B?cVlYZHZDenpxKzRJQ0hQUjc1THV2anlOMzJSS05XY3cyTUdncjE1elJicDJ0?=
 =?utf-8?B?RHUyZUJPVDlTYlJ4Q1pLc3orOFd2dzRxalU1Q3FzTzNFOGFzeXRjTFNiZG16?=
 =?utf-8?B?YkRhNC9kMDB0THh5aDdzdEU2NXhrbDJIRWtncmw0ZXpEV0tnanFwWG9BaEVP?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdda8a9-7cd1-4f58-5766-08dcf9871007
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:36:06.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgT0EeCrkP6DtDxYo1F3Zu6A0efHI2ASqvfqWslSj19Mvnr27eZ3O+J4Sq/9k70fKGrcldXf97yBAJeapq3ARsAbQahZhce5JeJuXAgQXfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module enables Suspend to RAM (STR) support
on NXP S32G2/S32G3 SoC based boards.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..584cef78c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1209,6 +1209,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


