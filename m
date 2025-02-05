Return-Path: <linux-rtc+bounces-3095-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE84A2807E
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CAC47A0755
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 00:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5032288D9;
	Wed,  5 Feb 2025 00:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jpP49Yi1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D632288CA;
	Wed,  5 Feb 2025 00:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717165; cv=fail; b=KcYqAiyFL6hKMQCr8XqfXnIBfxwi2aFJn6l09HHI0GOJv0gqbPx5jhIV9sxrDNNt3U99OpvRdtWjHsAJW8mq/ZJSE2fyhQxXD6a4HLdefCkZowPBqciLySUCes945dDkG55dtplzoS2ZlJgct1uHuGBta5ywwKW4RAsQFSw2rS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717165; c=relaxed/simple;
	bh=BO8Hwal6yUEtmatjGxTeE8CGMKa+r4910TYtu1OW9Cw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bRrshoiE8X/bLmrWwshDyEE/Aciaf9k8dpf5N4QaQoZiuNqgxGd+078DTqcL1BvWO+HLd7wKZm21Wl+WR9Cb2oRtmZaTSpWz7MUHyloXIpFb0HSVK3GxOmDbnC+zG+wtFYuVGZtgflUr01hmxPqatg3XWSC6AXD7qXrtDehL4bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jpP49Yi1; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hF8jQHR1bHpGG7DBMWG4w3dibEjlI6xmYMtp9LizNLzqVEpVShVxsK/P7yi+jAMA+G1oEtckq4bUg6jsXubb7aB2UqT8LP6ghhRb9avIcyRrXuwa+myDF9Gj8PyD2LFPOFhT7ecdWodliU7C0BuKg0+r8duJEWKgtoHff+uz+HPtCwogkdY6QV5fHNKF+F9xRBN2am13k33Q1AIQKm7eT57pyigS0k8JSuZZnDcbwd98ehoQ4hnegB64IElKvtZFEJ66ezvJ2xC21au8t+1vFgfM9biMT6imqJTVXIHYEucRHzLQgbqtCre+whbfTDzfIPFkWu2EVDM7DPc11qVFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQmjc+FMqh0dI0wNgt8HMjgVvX1TWtUXJ1FCgaXAoBk=;
 b=WMdWd50jrOVMQcKddw2nlMF8w4S+GQBYMZ/TvtYCfmtBvRiwYhoCPChfxOWmOe1+V0gM/K6nJUxy0CM1+MYRq1VsWeM2Ya6E51qZC3a83MjrzdIYAIGeiYIfujs+eozcvAQ8nqLNNVEJZ1dElO2Ocei/aHl697psv6Chi38iRy9tBcySN0VIUI3i+hm4yQWUXKPzf9GNcpWrTNwgUGi0Q8wqznJsytrcNWmEB/jptOLeUePEoDZY64PMvUk12xCum6UIGVA1fZDBqGedr4p/ZkBgGwUqZLklfnzK7gary5BQ4CMp8yqKZbYbni1cBPC0Uk17ihWwDI9TjFmEAIkRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQmjc+FMqh0dI0wNgt8HMjgVvX1TWtUXJ1FCgaXAoBk=;
 b=jpP49Yi1f/uJKBF/HuCKyH1176JGLscSmnjV4HizVqOpDN3EYSVXdKRFhiOd347ukXPhRqPzRo4N48Udj3QDyXX2IfxTcpHcmBwU+qKfbeeD0OD4JQR1tUKUhTlMq/4JV1bp6foAm/TN1rQUpRZxznZvaEcN4/vpNY/uy0kSv1mtfQHV5m3c/X4J9Bv8G+iP7U0P1Gz8f6+xPLxrWTstKD7/UBTGpt1zV7U75HvO/FvplFj8mWIxsPOLnkF/ZFJjMK2uzbUOWwo6q4pB9Vmn7rIVI2TncRF2xfk5L9flIpL41JzP5zpGcNj/lYBlogLk9nG5ysSRzQT/FnCK+NFmjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:21 +0800
Subject: [PATCH 3/7] rtc: ds1343: Use devm_pm_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-3-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1119;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=yYeVC601Fmqm3h8IRsE1e0gqqkwuyZ6uKwkA4brZ+6s=;
 b=+jZfInCaWBrh1hOlNrO+2f2hgBbfBUBVT/+siBpwsFBqPZBBARXE+oQbSs2ZdbRSDvheP5xec
 3EQXrX8A67WANLhoZl/HhnkDbpTNAaVHp4vwnuMDgWKmNZ+/5J+sQJ0
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fcd344-6bdf-4d9d-9292-08dd4580537a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVZJaFBCSnRlM3BMMGhLL1JEajJKMEcwUFVpWUU1eFVGVVBHTGpONVhGaTht?=
 =?utf-8?B?OEJJK2lrMGlsOVh3YlVOQUxxTzQxSy9TZUFnV1dnQldIR3RLNjhnd09aL1o2?=
 =?utf-8?B?b1dYQWE2TjRobkpOZ3R4Qy9MUzJ3ZE01QUthemFjMGExb2pZdHAxamhxa1Ur?=
 =?utf-8?B?cVNDbTUyV1dReDVHNFJlRnZ2NjNFVU9qU0t0M3VSZklQVEFTV3Z3Ymt5bG5W?=
 =?utf-8?B?bmdRYUFUVFYzbDh2aFZTQzlwYjZyYXdPZUh5VE9NbXVUdUFZbXJLdXoybmJT?=
 =?utf-8?B?ODR4K0EwVU9Sb2pMcE5DckUxemlwRGZ5ZzJsS29JWTVjTEdwOE5mdmNGd3RZ?=
 =?utf-8?B?YS9CT25NaDdVVzBVQlZncVc4Z1RMd1dwKzkvWC9rai9pVFlOMVpwY051VjJ6?=
 =?utf-8?B?bUZZb0xIK1QzNnNOKzl6VWVOZ3dHakNVZDVUSG1tbHJGSktzaW14N0R0MmR4?=
 =?utf-8?B?aGlpdlJNYi9WNWMrSXNheTRyTEs5SlFOZTlzblFSdm45SnVUWVlvdXBTL0po?=
 =?utf-8?B?WW40MHBvUmQxbDlRMHNZeHJsaUZnT25OQUQ3OWljSm5HQjFkd2Q3d1Z4OTdU?=
 =?utf-8?B?emkyZC9sS2kyaEJEU1kzcTJZMFZJbG55LzhHWURxdHhOT2VDZm9iL3BVcm50?=
 =?utf-8?B?cEdOYkFjNGpSN1JTWmhGTFQyNGpJaUp6RDFBU0o5WEZjZW9HNXhPNkhKaXF2?=
 =?utf-8?B?cFhwSnQrcnoralErSGRZMXhsbjFKZDNDVEdnM1IzYm5MNHY2QTg3S0U5cjNT?=
 =?utf-8?B?OW5CM3BtWjVVU3pBakNHSXJwUHBiWjcva1FRQmpuQ3ZsMHlzMlQ5b0w4OUh5?=
 =?utf-8?B?ZE9aQ1BqbnVnY2tRbnhUK2FEUldSSjVUeG9mZjhWQ21WMllCdkYwaG5vdEg4?=
 =?utf-8?B?cmRkUU52VHhUSTErZy9iUW5BejZWekd6aHhWcnhUbXNvMjRwVSt2TW51L1h0?=
 =?utf-8?B?VHJSeFJGMUp0QlBVaE55MUh1dEFJbnB6UjUrMFlkdDF1WkE1cEM2bm96SFVa?=
 =?utf-8?B?YzUvaHhUc2xqdHZzZEdZM0ExaXFkUm90RHhxbGx5ME9Nc2tUOVNhUWRFL2hm?=
 =?utf-8?B?M2lXb3pzNUMxb1hkVy9Ebi9Cem9UTHlBTHZxNlltMkM3VVlibXVPblQxYmtF?=
 =?utf-8?B?eGc5dUVsZDBZV2JnNWgvc1FGOEZjSUlxcXAvNVFLWnQvVE1lL2RWem9GQkQ1?=
 =?utf-8?B?Zm9GTERoM28rN0YvU21WemdSRDFXYkJQZ2dkZGhNeDY5dzVqMWJJVWNUYWVE?=
 =?utf-8?B?SVRhYm9Md1l4NEV4VWxYT3NtQnpySzB6UFdRTDV1Z2hzM0o3cnB3YlVuKzhv?=
 =?utf-8?B?dnR3Y1BteGM5eEZkNTczdlM5VUllTHFJMmVxcHpMY210NGdTZDRIMWkvaXJx?=
 =?utf-8?B?RlUzdlUxdlRaakxRcVFDS3BIbGs2ajRSdGNlNnVMZ05uOUV4N3ExRDZTTXFY?=
 =?utf-8?B?THdNSEh5MlJ2QmxMZ25ESU5oazJDTDlyMEJiek1VbGd5Rm9ZeFJRekg0UlNG?=
 =?utf-8?B?UlExQ2xwaXdsTDRPVWVlVXdHd042ZEpuRjlXODFVUnkrZ0xnVms4ZVJ3eUJk?=
 =?utf-8?B?dms0cHBZVGFjU29CVDd2dXh6eElCLzh4ZTMyOWJOL1JZT1pkejY5dDNYN1lJ?=
 =?utf-8?B?SVpRbC9aOGpEOEt0LzFVTWMrTnZoM1NISlVNbEU0SWdjd09ScW1ObFp6ZVg3?=
 =?utf-8?B?WHNaVzcrOEsvNFoxMTZWekxOb0xKZ2VRc3BkM3dvcThVaGgvcnRlYTh5STZ2?=
 =?utf-8?B?aU5ZUHdIb3NJREoyUVZvVUR2LzFMM1F2eGdQa0dNamZmbXE4UHJIQWZEYWJx?=
 =?utf-8?B?NmUwd3dTOEhQWGUyeHRXMVRKd2h6c3hqNUx6RFZLc2hXWks2N2gxZ2taT0xs?=
 =?utf-8?B?K1JQcXFoWnVBWVpBbUJCOXZhdTlwUERPZkZKL240WmZyRmZxejM5L3oyS0px?=
 =?utf-8?Q?y/d5JVJWCMKJC9THhHtEPn3vzLQBF/FE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXF4RmlkTkpnRGpnL244akpmeCtXNi84N3ZpWEVLU24rNGdibmtBa2RTTE8r?=
 =?utf-8?B?emcrb3hVU1JGendWcEY1SG9OYU9ncFVYYTVhMFN3Q2F5bDUrUndOTzRhTHg3?=
 =?utf-8?B?cGdHNmdUL2NMRHFPYzRpdjArKzRyTElMd2VZdklrbzYrOHEzcDJxVXZyY2p1?=
 =?utf-8?B?L0tzRjh1VjRBY0ZQVWRZSXBNYm9qMG1zQ1NYRnpVNklVM1AzNTBVZm9JVXhD?=
 =?utf-8?B?SHNhOHpQYkJieHR2ZU1kQ24waTBJNThUUm1iRHN4dk9TbFRWWlJJTllpRS9F?=
 =?utf-8?B?em5keGdqWG9XNGd6eE45VUV0MjQ0eUpnMzhLQThjZnVrZ3NwbXArZVlVQ1NP?=
 =?utf-8?B?UUlncHZKeG1qL01tUFNOZzRpcXZqa3FCRGp5dHNOWkw4YSs5eTBHeHozanN2?=
 =?utf-8?B?Ull3V1ZoMkRZQVF2Um9nb2NjOUlDUmw1aUxlendGNUQxMUwxdG1JK212ZVZm?=
 =?utf-8?B?cGlvY3oydGNXWkZ6MlFsN3JiQ2dGUGhXUVZJNGdyTmdSLzk2TW5WT3hhdkp0?=
 =?utf-8?B?L0Ruc1pBaVZicVRDNm1id21uUnZqby9GRDV2OGJtc2VJN2I5UEY2YWNCaTM0?=
 =?utf-8?B?SkxxK1VWWWllbHBydU5nS0RTUXl3NnFZdXNOdmRvTURlZEhtQVJyOXRXcldp?=
 =?utf-8?B?MUxqTk1hVHE4dGtkWm1OSmdtRVlnakFwZ1JPODhTM3JXNEhGNlpmbDdId0sy?=
 =?utf-8?B?L1RtRlhXQUhFamo3Wlh4RXA1OHR2NWlDRE1IMjM2eVdZRld1RXdoS1RxRHlH?=
 =?utf-8?B?a1NCNGJYQmsrMGV4SzlialJpbzR4d0ZFNFptZHFPWXh0MkRaRVFncWdxaFFN?=
 =?utf-8?B?N2J1WXlNKzJsV0JWaUprSWFpSW9lbEFqU3c2TVVpMXl4WHN2YlNwWnhMTjl1?=
 =?utf-8?B?dTBQWmxhWndiN05idS8zV0xRQjBCOWNQUnRkWGRLa0dVVnBOa0hJckNrSmEy?=
 =?utf-8?B?RG51dnc3Si9JRWRRbGRTckRHUUt0MjlFU3BxRnMxZFdDZmFDZTZQdHVPV2dr?=
 =?utf-8?B?SXJRZ0J0Q0hnS1NJMWZkYTdhNTU0djk5eFFkS2lxQjdNbkt3MXhpTXVWTWtU?=
 =?utf-8?B?V09aTk1NSkNSWUUzWDJzV0VCQkZ6TktlMTZaeXRQb3BOak9QbHdkbjhOWTNF?=
 =?utf-8?B?bm5NMC9BUXVDcDVWUlRmdk9XZ0M2UmRqOE93bHovN3pYSi9IZDRGQit3cDJR?=
 =?utf-8?B?YVRDMEYvMGZjZXhuYVpLSTRlM2M5dkR5ZFVNQUdWQ2RpM1BnMHJDcm5ES05L?=
 =?utf-8?B?QVRJUVpqNnpGQk90dEZ5czh4eEcxc2IwVDFESTJlVDRoVmZqMGk4R1lIKyt3?=
 =?utf-8?B?MnZwbHJsN1VtRGRJelZIVDNLU2R6NXFtT0EvRkFUcnFWckdRNE5TaFdNZlVJ?=
 =?utf-8?B?MmdzcThaTy9yMkVOYlM3Q29MRUgrS2xRYjBvM1NwOUdZdG5wazQzcDVPaXZD?=
 =?utf-8?B?c0ZwU3ZqSUNua3FUVjhBcFJaRy9ES1VzOEZsMXZDVlBZN1FPTVZnem1WcktZ?=
 =?utf-8?B?bW1UbTdYVlZiK0hGdHJpYVhVU2FWam5iUmY4T3BqQUk1OHhuMmREb200Q3RH?=
 =?utf-8?B?ZHRXSWhmTHlZVWVNSE52YTBHb09YdkdXMXpPcE9KY3UxenBNdm00bkk0L1Ra?=
 =?utf-8?B?RnZlaXVGbHdsTWFLelQ5Z2JYdktIUFp1RkNmT2JZTkRwbWdqTm5EOTQxbDMw?=
 =?utf-8?B?dDRSZXlEV2U2Zk1ISUJ1TUlDYnowdUk1L2Y4T250dVVDdGt3V3U2cmNMOUhq?=
 =?utf-8?B?VVQ5L3UvcDdud1RBUFFNZkxPSHRYdE5Ecm13elFUSUg5Y0FGMFhrTnhzSzFQ?=
 =?utf-8?B?NG83S0RXYWpsWDAzQm9pRmJrQ0VJeXMzNlN1R3g1MEhKK1NobXlBa0FwSHoy?=
 =?utf-8?B?T0tSQ3ZFbW1IZXNjNHVISTBrNUFPR2hiU05sTm1ISnBlRU9RZENHN1NZbU9Q?=
 =?utf-8?B?QkdTUTJHUGQ1TTlmVUd1RkpSeXNOKzFYV0lheEFFWjBzV1liM000QkJYMVdr?=
 =?utf-8?B?bVNFdGNiTktFWGNPTWdmY0E3bnV0RjRGQ1JBWk0zK3l3dTdCbE9Uc3NFcndr?=
 =?utf-8?B?TVZaYkRsTUkrK28yc25lNkxMUFdEaFBkdTFYY3ZPQmNtWlFoVEZEeXExaUQr?=
 =?utf-8?Q?mtnIHzzSumwxQ01Fjf8o8xctj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fcd344-6bdf-4d9d-9292-08dd4580537a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:21.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPliWJlOGwUsNudt58OJ3wpS0t9EwlWYAW3C9ombczuPWBe+NO0MXOqpoeeWMO6eSjaJO0D/+jY1Ac3M27AgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-ds1343.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ed5a6ba89a3eeb2a0b9d6dea3c8b3d40aa2cf317..aa9500791b7e0300b150bd654b69c74f3e5e6e6b 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -427,18 +427,13 @@ static int ds1343_probe(struct spi_device *spi)
 				"unable to request irq for rtc ds1343\n");
 		} else {
 			device_init_wakeup(&spi->dev, true);
-			dev_pm_set_wake_irq(&spi->dev, spi->irq);
+			devm_pm_set_wake_irq(&spi->dev, spi->irq);
 		}
 	}
 
 	return 0;
 }
 
-static void ds1343_remove(struct spi_device *spi)
-{
-	dev_pm_clear_wake_irq(&spi->dev);
-}
-
 #ifdef CONFIG_PM_SLEEP
 
 static int ds1343_suspend(struct device *dev)
@@ -471,7 +466,6 @@ static struct spi_driver ds1343_driver = {
 		.pm = &ds1343_pm,
 	},
 	.probe = ds1343_probe,
-	.remove = ds1343_remove,
 	.id_table = ds1343_id,
 };
 

-- 
2.37.1


