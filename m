Return-Path: <linux-rtc+bounces-1700-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2695C890
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7E91C2123E
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B58514F9D0;
	Fri, 23 Aug 2024 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VOJJL+R/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797B142E9D;
	Fri, 23 Aug 2024 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403421; cv=fail; b=AReysXnSewGY6HTAF0vrP7zDd00GDuZgl5qRbi+wye5PoE9zlI2VmHwp4GTTsDNi4X8urRaru4npPhIa4xVa7A76nhscRxVdaa+5cvdmIagddkt1xukVlp7WoBfhDgaVJaCCzWJBYNE70s0wEpKkBvjY/H4l/r0VCguYrZpL/1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403421; c=relaxed/simple;
	bh=PrXuLIvp7rHtCjfR6rRXiZGY3IUbYgeIe0OMWEGe+qA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qdK3IhTJhL3o33mMCza76LLLaCUEtqIYOKwkNC5YXl7W9p9yWLctqBD6brtsfppCDYdBgIiK3fFUqoUEhYZQ2gkFei8A3q7Pi3PsV+nhBeV2MWSURosNCqr8Mhx2t3rcoDhfdaap2ONVjq0iMopaZT4W5TGkzKObVHf4Sg8Sv/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VOJJL+R/; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wbzp9TTCh9xWnntKVjVyapHA7hUuU2AN5SDtY7Px/RBVo/BPgfrNCiqZtnEJzG7U2Sfv+6cek7sw5IoSiAFK3L4ttRrhMWXv/m+s1T6tnnrxw9/OiVLIzKfIQTZZgU1X9mxxrBKY3OH4gGmr0YVv1Gv+daYWVgp3kvoEq8OTndMqD5BBOENkJz8sTsKLuIG3ylbDcxkAJOFAvDBx0xsEQJDOGw6sVhsMV60BLQaXwf6wQrQm3mJjOEPGbr38LpF1kHGnoskvuKhz3WE2mrnlnOBGuZQQPZiXWJaYwjBDN4S35EdcPEdJBDbKsmLBvUmE+ZB3+UvayzOzGap96oFM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93Iby0bRJgZa3j0s4ibGUUk5t3AtRn05uBADIkTFaqs=;
 b=l6QV0yFN2LXTNueL+tC6KnDoX4j5dHs4hmn0vRhxqEBnsAvocmetqDoieJjfN1di8wFt4QS8bCWgDlq5xQRpOSam/A9768kDtQTSHDp4rnLTP4hQQUsorw8wEtw9iNtPgxBeWhHLDa8oPmulANFfQfzud2XB8C0yjHvG6e1y7Q7LXY0OabQW1HgmMEB4n7tvoT34FxOPKtdA0s9JmNDHe9rW8u/OFCk9PY9283QIacMTI3uyRi8b7UCxrcAFUS5KL8o7ijic4hZAwDQvNzLvw5FmAbM2oHR+edkErETP4eyLSgiqEd8zPhJm2EJuDvjEDKONqcw5r6SnQpEtOgWcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93Iby0bRJgZa3j0s4ibGUUk5t3AtRn05uBADIkTFaqs=;
 b=VOJJL+R/kdJR2HWMX9NHlnnzIujaa5TqSzbfWg65UF0W/hehksIybopig5oPeR9wn57dpSuFBCy53l0knfD695W4Tw/++kVrNWX7kMu+1FMRXwUP3MXTN8I6UNuD5MRqbIW8c9d6N8vAlnBHIhjeabD1aCGqhXPbMgQOKRuBfK867oMZadYQ9YtezhcJT3s1xx59dW5lk7PzDWrp01SwbmiRmyZvHI5yT8fcB4+EG2Slu4qCi7ca+x7u1OtES2faNtlyABwTJnFHhMuf6voZ1WZos09F/UL2OwWiLd+IDP1w43/q3rJXuCq1e+Uu8fKOS0fvzADXnDFJ3rl/rxPk7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:56:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:56:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:18 +0800
Subject: [PATCH v8 2/7] firmware: arm_scmi: add initial support for i.MX
 BBM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-2-e600ed9e9271@nxp.com>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=14046;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=v2Js2Zvagh5LoyvFSfyUnRSKey1cPVTbHPUtPegBylM=;
 b=GDtKbupGOhA/l8V8VJE/scsLcpMYSBr1ttxHADCupPRjxeKX/vhkhZzV1Cs0PKUZkp6StAMhZ
 qvDiWmUmUZQDo/vSSgQIwSBTxMeT8EzXmZKVJTnXvqYToYhG2xv6UVz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: b68227a4-b177-436b-3079-08dcc3518a11
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE9YVE91RGpZWEtKQUJEbEF0Sk9qRnkxbERpWnJwMzQrRlg2dktaaW01L3lh?=
 =?utf-8?B?RkhZL1FjaFp6eGJRalVXSllBbEtsalkzS05nK29HY2ZsV01BdUpIWmpjN2Vs?=
 =?utf-8?B?OGdVMlhoWlFpYWNqT2RNVGR2aUVVRk9qY2Q2eERONmhDeUpPdDRsN3BCZGl0?=
 =?utf-8?B?L0VwOGYydWtnQVF0NmMyQk10cmJtZGhDbmx4UXUrVFBtcXlCN0d4TFhtRFZZ?=
 =?utf-8?B?VDg3YU1iWEh5WkxtUDNlUmFiWEJyZUxnVFg3d2dPWGlSejZnbXFpSm9mTGlq?=
 =?utf-8?B?US9pYjlON3JaZ1BoSTlHdVlnNnJxbGh4NCtVUm5OMGVFU2dmdUxuWVpMeXRM?=
 =?utf-8?B?ZkdMblJlK2NwL0R2Skd0TCthVHhaY2RqTmk1emdndXY0Z0xiOXRDTEtHd2hy?=
 =?utf-8?B?dFNpNVRiZlIydVRFV01udk9zWTNTa2VwNEJJdUNyQjdnK1JsRU5Cd3FCYVVY?=
 =?utf-8?B?WmQrem5BaU03UHRCTXlnNENuQk1RYjZjU0xNdkdtRlY1N2JETW1ZSC9lN3hz?=
 =?utf-8?B?QzY2clVNeWRCOU01U1BvbFQxNmFVekxORkxkd0lpSFcvSXl3S29CeGkxcG94?=
 =?utf-8?B?c3NLRnBmekxUSGtjbGNlNzkyVS9nVXZkTkVRUWVnYUZBajRDTDNUU0FSMVQx?=
 =?utf-8?B?b3d3aDBXbHpuREhSZm0vM2g1c3FTeGNJUjBvUVVhVTlOTkUweE9tVFVEQ3Jq?=
 =?utf-8?B?bnVWeFJkREFGM09RakU0ODFFYWJuMnpMRngraGZMdWpUZ1ZqK1BtR2o4aU51?=
 =?utf-8?B?N2V4cmExMU44QTIwOTdQOXh2VzF0K25rc1FQUnU0dXFZczVOaStqOXplSzlz?=
 =?utf-8?B?d0VjaEI2c3pjekp3NkFYQ1gwWWNja1hDOU1tdGljQnpscDhMSmRnVzNRcFdS?=
 =?utf-8?B?bHNnNklhc3VpNjlHY3Nxa2o5UCt1ZUNhV1hRSlRBZU44Q1kzQ20vNXY2Y3dJ?=
 =?utf-8?B?OGJzSFJvcERmMCttbHVsRG1Pb1k4ZkFKQjN5RzloTlhoejdqRWRmdHcxM3Fj?=
 =?utf-8?B?UFk4NnVSV3l6SzFHODludEJCOHFDL0RZdGdjdWFOYktrbzFRMk4zS2dhT29m?=
 =?utf-8?B?K1Z6ZitHTkpaRGRaVWt3SDJjVlN1OTBwQWFMc2NiSW1CRmk0TGp2WjEyRHB2?=
 =?utf-8?B?MW9sU1BiVUVmOGhEcmE1S0ZmQnZIam5jV2tQb0hLMkZtY2p5TzdNdFNOL0pV?=
 =?utf-8?B?OFNjVEI4TTBvR1lFQlZQdk5IRk9HRE1sbFlRR0ZQczM3c0s0L3pHTWo2TkFy?=
 =?utf-8?B?cVlkSHg1dWhHUTBCNXd1cytZYzdHVTQ2dlZyK1hjOG1oalI5anF6K3dYTThn?=
 =?utf-8?B?UGllRHRYc2doNXRCcVhqTXJXd0hSU0c4MGcrbDBabTNVTm11b3dkZjFHM1pU?=
 =?utf-8?B?UnhrM01FdkNTRUppdDZQOUVmK0trQXE4S2YvQk0zSkVIWC9HbnNtL0d0bGhw?=
 =?utf-8?B?c05lTnpibXJYR3dhYzlESk9Sb3VkbVdMd2dpVTJxYWtRdUJpVWYwbXBleFZh?=
 =?utf-8?B?dWtibzdEVHZIY3JtT3J1SWFoU2RNS3ZoTkRJQU54NmlhRDlibTR5WDRnZ0k1?=
 =?utf-8?B?VnZhS1FRdXg4aUVJMC94dytYMnRoTE9EZGo0R1J1QlZkM0ttNUpQUytmZDgy?=
 =?utf-8?B?SWVjTGxGQVBmeVdlN2ZkREFNVUdNYVBuMjZuR3JPZCtPYmlqbVBXb0luWE15?=
 =?utf-8?B?V2dGQWFQeXdFYVd1ZitTUVYxdHM0RVFVZnFsdjFucHB1cVFvTGVudjBFRXpW?=
 =?utf-8?B?dGVzd1JObi9mVlMzNG10MFBYdkF2aWJ2Nk9mcFZzc1R3YlgxRXR1cTEwK3h2?=
 =?utf-8?B?OTdKWUg3UGU0RDd5RVVHY0VBVEFmb010QmptMmlBa3R1QmU2MlhHTTRDejIv?=
 =?utf-8?B?cS9BZXN6RkdHN2FpeEZSMW83aEV5K0xPUkFmRUpIM3FuSENiRVBtUHVva3FB?=
 =?utf-8?Q?ofJ2nfsP7pM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pHT0txZ1RBRVVseCtWRGdOWFR5MGxJYVZOMVZPQThuOTVkbHpsbDRSTG54?=
 =?utf-8?B?eGxENTV1akhrRkRMb3pJMXEzU3V2TXc2QTlkL0JvQmJ0cGNrS2lLTWJVU093?=
 =?utf-8?B?OUxMNitJRERJUzZ1S0h2dVBhZFhnQSt3MmhrUlIzL3RscnNoRmpTbGFSWS96?=
 =?utf-8?B?ZVY1ZVlLNzVlYUt2QS8xQzJiMmNNbTYyMEkveGZNaEt0MzNjYmIrdXQrQzly?=
 =?utf-8?B?T3dMQk1NdndMeHNBVkhjeEhUWk5YSGpBYk9BMEpPUSt2V2cvZHlFTDlhWmxS?=
 =?utf-8?B?aHdYbDN1amNTLzNTN3I0OFNPYjlxN29oYXJFM29sOVZrcENLNlF6Q1BuYzZO?=
 =?utf-8?B?MDRQT1ozODhEeDNHWU1FYlRxazFDT1F4OGpnbldUcWQ0a1JkaGsxdndTKzBU?=
 =?utf-8?B?UFRrS3pSSi8wMlVDTXQ2UnRPcXpIK0lQV0ZQN1pNU3BRWEJ6d212K2I1aGQ2?=
 =?utf-8?B?OUZlMmFCWFZtOXoxTjBHc0EvT1BESWJFV1VkaU1hYUhnSmovNGRsS25pTkhr?=
 =?utf-8?B?ZThnVVpDZW13M2ZNYUVSYU9FTXdGOW1LdTZCdEw0ck9VM09rSE5RWFR3amgz?=
 =?utf-8?B?MlN3TGNkcndzemtOOGF1SmNzLzlzZjZmajdZOE1IczNub1BsNXhZWDRjcFlP?=
 =?utf-8?B?U0JqaUxWRkgxSnRNZGJ2b2owZnZybVZDaWpRL2Q1aVVIVDNxTjVkbnR5ZVNa?=
 =?utf-8?B?eFJXZldjS25nOUZSQkhEQUd3UUlvaDhidGFpeVA2dTh6YjVURDJHQXJYRW90?=
 =?utf-8?B?TWpFeTQ0WUhucFdhU2Q3bnNsRVNVSlZCdzk1M0ZvSUFhVnBNRDN0cXhNK201?=
 =?utf-8?B?ZG81RFpVY2g5dFh2VXZmRUNXYmhLa0NSbGo5Tm40L2lHK1g4am9jNjFhUFdo?=
 =?utf-8?B?RVRHUUlVQTVvRzQrN0JRY082K3hhWENINmhXZWJ0WXFBZkNSdDd1NGxiejg4?=
 =?utf-8?B?d002RFVsM2s2MnFpQ2JhWWR2N1pUdUYySVlzNC9PRFBFWHd1bEVlZU8vVmNj?=
 =?utf-8?B?Y1kwUVJTQVFMSkZJTWVvWGVBbnFDNkhocStqM1J1Qm5iSk1wNHgxc0lQeWRU?=
 =?utf-8?B?clJEN3ljU0VTaE5xQWlzRHZab3ZMZTZUbnNFdENDWldENDFVQVV5ZmF1eGpL?=
 =?utf-8?B?WnRUTjc0TnFHc0ZvMHNndXRqY1JZWEJaN3JqOWI4WCtoT2dBT3Fyeno2U1lY?=
 =?utf-8?B?N1R4K2lqNlE4MGRNOEg3eFV5RXdIcEdjSEp2M3Y2b2FaZ2t1QnlEVUVib1Vi?=
 =?utf-8?B?NzRWRy81TGlpbHdmckFsdEwyVm1GL0dNMlJDMU96a1hyanZNWjRpSzdFOEdG?=
 =?utf-8?B?SGNQcVh5aDJOZmNWL25SdVRaL2xKUVQ3QWQ0TXJzQ083TzRrek1obmcxbENz?=
 =?utf-8?B?Y2RMTUlUckpBZkpTa0dUcmNEbWtIN29IMGlBQWM0QXFBOVZ5TGN1WGpVVVZq?=
 =?utf-8?B?dUI5eEpVWDZ1cW56YzdQY3J6S1NZYXg4M1lrLy9hOGNBVUJDUWJFSU4rR1FZ?=
 =?utf-8?B?akE1MUV5a2E3ZnNWZzB5N0dNVW55MGdZdmcwNUhSRERqWC94UkpZNU5IRnNl?=
 =?utf-8?B?cldTS0gwRDhiQ25kK3laM3JLcUFiSStRUzN2eHg5TUhsLzdFWk5aT01CVnUv?=
 =?utf-8?B?QWEzZE5NSStzcFZyNEpqSFpaYUlpL3dlcVQ2Z1NjOXdxRk9lK1ZkdEc4Vjlw?=
 =?utf-8?B?MW8vK2NsV29tT25OT0lpbDRkRFEvNUFSZ1JhaXlGcFF1YVBIOWIydmliSFVm?=
 =?utf-8?B?Y0p4RHBZbnk1N1ZhQ0dGYmIyY084S2FpNkpmRStvY1R6QzJkdzR0WnFJZUp0?=
 =?utf-8?B?Z0RWcThKTnR0NUF5cS9FMDVNcWEzS3JOTlErOXBnbHJUQ0VTd2ZCNTAzc3NB?=
 =?utf-8?B?YVlkZ0doUHBGRUdrMzdDaHkxMDlMNG9LVnRTNnJYbjI3RHB5OHpRaU51ZGZp?=
 =?utf-8?B?QmRoOWNia0hJR2NVRjlaMjB4bFNKbXhDNU9SR3pjYkdLQTlNa2Y2K2E5Nzcy?=
 =?utf-8?B?blhUWkJSS2paNmtCc21wV29UcFR3SXc3b3d0aWF5QWkzZXRmMnZpRVU1NUZa?=
 =?utf-8?B?bXVKUWMyUUM4TzNTeWE1ZlRvVUQrd20za1RqamVpVWhnUmZ3enRGWHFEL3FU?=
 =?utf-8?Q?RzVjM4TZy/OBxdSKNjhpM1/j3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68227a4-b177-436b-3079-08dcc3518a11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:56:55.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YraZ4w4yIlRjN2NpRxDWrP1NJazEOLJjN52OMD9FuVz0flIYYAoHAciejfist5WgsZormxG9/kFldSjxuSSUxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

From: Peng Fan <peng.fan@nxp.com>

i.MX95 has a battery-backed module(BBM), which has persistent storage
(GPR), an RTC, and the ON/OFF button. The System Manager(SM) firmware
use SCMI vendor protocol(SCMI BBM) to let agent be able to use GPR, RTC
and ON/OFF button.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/Kconfig                  |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  13 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 379 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  42 +++
 6 files changed, 438 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 67053c1862d1..dabd874641d0 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -70,6 +70,7 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  SCMI monitoring.
 
 source "drivers/firmware/arm_scmi/transports/Kconfig"
+source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 9659b7d1b963..9ac81adff567 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -11,6 +11,7 @@ scmi-protocols-y += pinctrl.o
 scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
new file mode 100644
index 000000000000..51ccbd038627
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI NXP i.MX Vendor Protocols"
+
+config IMX_SCMI_BBM_EXT
+	tristate "i.MX SCMI BBM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System BBM control logic which supports RTC
+	  and BUTTON.
+
+	  This driver can also be built as a module.
+endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
new file mode 100644
index 000000000000..a7dbdd20dbb9
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
new file mode 100644
index 000000000000..0df7ca135c34
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) NXP BBM Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications BBM - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../../protocols.h"
+#include "../../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_bbm_protocol_cmd {
+	IMX_BBM_GPR_SET = 0x3,
+	IMX_BBM_GPR_GET = 0x4,
+	IMX_BBM_RTC_ATTRIBUTES = 0x5,
+	IMX_BBM_RTC_TIME_SET = 0x6,
+	IMX_BBM_RTC_TIME_GET = 0x7,
+	IMX_BBM_RTC_ALARM_SET = 0x8,
+	IMX_BBM_BUTTON_GET = 0x9,
+	IMX_BBM_RTC_NOTIFY = 0xA,
+	IMX_BBM_BUTTON_NOTIFY = 0xB,
+};
+
+#define GET_RTCS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_GPRS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_UPDATED		BIT(2)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER	BIT(1)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ALARM		BIT(0)
+
+#define SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG	BIT(0)
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_FLAG	\
+	(SCMI_IMX_BBM_NOTIFY_RTC_UPDATED | SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER | \
+	 SCMI_IMX_BBM_NOTIFY_RTC_ALARM)
+
+#define SCMI_IMX_BBM_EVENT_RTC_MASK		GENMASK(31, 24)
+
+struct scmi_imx_bbm_info {
+	u32 version;
+	int nr_rtc;
+	int nr_gpr;
+};
+
+struct scmi_msg_imx_bbm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_imx_bbm_set_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_imx_bbm_get_time {
+	__le32 id;
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_alarm_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_msg_imx_bbm_rtc_notify {
+	__le32 rtc_id;
+	__le32 flags;
+};
+
+struct scmi_msg_imx_bbm_button_notify {
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_notify_payld {
+	__le32 flags;
+};
+
+static int scmi_imx_bbm_attributes_get(const struct scmi_protocol_handle *ph,
+				       struct scmi_imx_bbm_info *pi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_bbm_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		pi->nr_rtc = GET_RTCS_NR(attr->attributes);
+		pi->nr_gpr = GET_GPRS_NR(attr->attributes);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_notify(const struct scmi_protocol_handle *ph,
+			       u32 src_id, int message_id, bool enable)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	if (message_id == IMX_BBM_RTC_NOTIFY) {
+		struct scmi_msg_imx_bbm_rtc_notify *rtc_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*rtc_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		rtc_notify = t->tx.buf;
+		rtc_notify->rtc_id = cpu_to_le32(0);
+		rtc_notify->flags =
+			cpu_to_le32(enable ? SCMI_IMX_BBM_NOTIFY_RTC_FLAG : 0);
+	} else if (message_id == IMX_BBM_BUTTON_NOTIFY) {
+		struct scmi_msg_imx_bbm_button_notify *button_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*button_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		button_notify = t->tx.buf;
+		button_notify->flags = cpu_to_le32(enable ? 1 : 0);
+	} else {
+		return -EINVAL;
+	}
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static enum scmi_imx_bbm_protocol_cmd evt_2_cmd[] = {
+	IMX_BBM_RTC_NOTIFY,
+	IMX_BBM_BUTTON_NOTIFY
+};
+
+static int scmi_imx_bbm_set_notify_enabled(const struct scmi_protocol_handle *ph,
+					   u8 evt_id, u32 src_id, bool enable)
+{
+	int ret, cmd_id;
+
+	if (evt_id >= ARRAY_SIZE(evt_2_cmd))
+		return -EINVAL;
+
+	cmd_id = evt_2_cmd[evt_id];
+	ret = scmi_imx_bbm_notify(ph, src_id, cmd_id, enable);
+	if (ret)
+		pr_debug("FAIL_ENABLED - evt[%X] dom[%d] - ret:%d\n",
+			 evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *scmi_imx_bbm_fill_custom_report(const struct scmi_protocol_handle *ph,
+					     u8 evt_id, ktime_t timestamp,
+					     const void *payld, size_t payld_sz,
+					     void *report, u32 *src_id)
+{
+	const struct scmi_imx_bbm_notify_payld *p = payld;
+	struct scmi_imx_bbm_notif_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	if (evt_id == SCMI_EVENT_IMX_BBM_RTC) {
+		r->is_rtc = true;
+		r->is_button = false;
+		r->timestamp = timestamp;
+		r->rtc_id = le32_get_bits(p->flags, SCMI_IMX_BBM_EVENT_RTC_MASK);
+		r->rtc_evt = le32_get_bits(p->flags, SCMI_IMX_BBM_NOTIFY_RTC_FLAG);
+		dev_dbg(ph->dev, "RTC: %d evt: %x\n", r->rtc_id, r->rtc_evt);
+		*src_id = r->rtc_evt;
+	} else if (evt_id == SCMI_EVENT_IMX_BBM_BUTTON) {
+		r->is_rtc = false;
+		r->is_button = true;
+		r->timestamp = timestamp;
+		dev_dbg(ph->dev, "BBM Button\n");
+		*src_id = 0;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	return r;
+}
+
+static const struct scmi_event scmi_imx_bbm_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_BBM_RTC,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+	{
+		.id = SCMI_EVENT_IMX_BBM_BUTTON,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+};
+
+static const struct scmi_event_ops scmi_imx_bbm_event_ops = {
+	.set_notify_enabled = scmi_imx_bbm_set_notify_enabled,
+	.fill_custom_report = scmi_imx_bbm_fill_custom_report,
+};
+
+static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_bbm_event_ops,
+	.evts = scmi_imx_bbm_events,
+	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
+	.num_sources = 1,
+};
+
+static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_set_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_time_get(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 *value)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_get_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_GET, sizeof(*cfg),
+				      sizeof(u64), &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*value = get_unaligned_le64(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_alarm_set(const struct scmi_protocol_handle *ph,
+				      u32 rtc_id, bool enable, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_alarm_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_ALARM_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = enable ? SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG : 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_button_get(const struct scmi_protocol_handle *ph, u32 *state)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_BUTTON_GET, 0, sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*state = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
+	.rtc_time_get = scmi_imx_bbm_rtc_time_get,
+	.rtc_time_set = scmi_imx_bbm_rtc_time_set,
+	.rtc_alarm_set = scmi_imx_bbm_rtc_alarm_set,
+	.button_get = scmi_imx_bbm_button_get,
+};
+
+static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	u32 version;
+	int ret;
+	struct scmi_imx_bbm_info *binfo;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM BBM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	binfo = devm_kzalloc(ph->dev, sizeof(*binfo), GFP_KERNEL);
+	if (!binfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_bbm_attributes_get(ph, binfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, binfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_bbm = {
+	.id = SCMI_PROTOCOL_IMX_BBM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_bbm_protocol_init,
+	.ops = &scmi_imx_bbm_proto_ops,
+	.events = &scmi_imx_bbm_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_bbm);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
new file mode 100644
index 000000000000..2df2ea0f1809
--- /dev/null
+++ b/include/linux/scmi_imx_protocol.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver NXP extension header
+ *
+ * Copyright 2024 NXP.
+ */
+
+#ifndef _LINUX_SCMI_NXP_PROTOCOL_H
+#define _LINUX_SCMI_NXP_PROTOCOL_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+enum scmi_nxp_protocol {
+	SCMI_PROTOCOL_IMX_BBM = 0x81,
+};
+
+struct scmi_imx_bbm_proto_ops {
+	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
+			    uint64_t sec);
+	int (*rtc_time_get)(const struct scmi_protocol_handle *ph, u32 id,
+			    u64 *val);
+	int (*rtc_alarm_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     bool enable, u64 sec);
+	int (*button_get)(const struct scmi_protocol_handle *ph, u32 *state);
+};
+
+enum scmi_nxp_notification_events {
+	SCMI_EVENT_IMX_BBM_RTC = 0x0,
+	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+};
+
+struct scmi_imx_bbm_notif_report {
+	bool			is_rtc;
+	bool			is_button;
+	ktime_t			timestamp;
+	unsigned int		rtc_id;
+	unsigned int		rtc_evt;
+};
+#endif

-- 
2.37.1


