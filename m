Return-Path: <linux-rtc+bounces-2494-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA69C400F
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359621C20E81
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ACA19F429;
	Mon, 11 Nov 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Udjt1Qo7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1219E97A;
	Mon, 11 Nov 2024 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333593; cv=fail; b=XyWTqdJCmdqASgIDKzNJJJSFwcz3cn9VKnbR7Np+/7s0jY9Ml5Kkbp5PEU4TS30ZvNGgNeZHBax1Blq4QuKCINfOt9sR5UpmcIGDfXqpUNyQ9vZ/uk2GlfOCJjr0Ll65nj9Jdk6YVa8yKj0WTHh9CjVSLjWDRw/FodC6QfA6JK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333593; c=relaxed/simple;
	bh=S1n4Im2tKny1jc3z1DgaPcgNi8gz7t8gvzexrh/HPjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WzFm6zKtjRrKRwGUnlDnqxMpiEQwakgZ3Cc9FWR2jXAdZZ92Ef18PBx6GUlPBxdZZcBgqImEZzc9iQwkbYEOt49zyfXUb/r2FScVm8dFiBAf7xFlZXX0DXPupfiPWYetq8BFISOU1ys7Vb95G8gynl2CTUu9ILv3VW3ZVsFzlqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Udjt1Qo7; arc=fail smtp.client-ip=40.107.104.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNheTlcLVkq6fX8rBMYqi0o/1NxpWD9gIthtP7574uAyvpb6+PdXHi6Mbt0Mel3fYNIMK9+qopTXZmXrxUGVmR5GkxzFXmh1BScutVZuK/NQvIMeb1VT4NwncstYSZKiXuTtn+okTnZwf2Vk7VtWo/9s55pMDSxmYmAgVQ2j7jOsA2DtRB9IL9BK8Svj56bOCngfpoi9rQSvlEccV17h2iFGmar3IoH10WlwpwgIdcHZgGavtNJdWgdQmFkFX5ehShhJUct8IX4JQabBjKpahz5POq40xMi/W4rv3JWwhr3k8TMYWLUQWCz7ize4v6lhnJciCqNuGo4GN3vQQqPsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02ey7NkJcvEsc6BZIQJbGQahJL+2StBIKYXsaxNiRb8=;
 b=dHj/y8AE79gitrKDLt0mEaGy/0zryPRPZGIAG3/dtj38yHhaxPuJJxc5v5MKBy3QcVYDy+48sQFZk0lnQV8DZgUdGhEWFFcKBijQGzqGjB5ayjXWrgpzlOSWZdMqGIh68qQPULlu7wI399RWOtzVVnUHN+GVP+EBbwNKVyrubOk88/4zeiuVBcgElw3jZoNF0oT9fHrYUbD5FRQchf6/uFguDhQy/QW7EEx8fZnXUocvYAAjJtZZtjbJ0EzHi1FvG1hnzHnnYU/H2W4MldCGqRAHZqie6MkRFG8R6/13Wt4Wt7pK/UWAvqqyfJRA8NPyq08WuvbzAvu+foi6pozbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02ey7NkJcvEsc6BZIQJbGQahJL+2StBIKYXsaxNiRb8=;
 b=Udjt1Qo7GgOs7Y5pqJZW5oGnVxagLtBfZ4uBlnHQqQjbYmvUPqjILz2shc19ZCAb8FzWeCimAc90Zk6rOF1Hf/f0J8SCRbewdVFE2RuvVj8+47drTl/WfHJJLace211l1bVVFErJPbSOnE1E7MpPyjexRNNCdkb7E0yA1eFJgg94261R2uFOb6J04Rrfd5usPQygvI6J6rz7PamcytYdwh1UEC8u3E9VGxNWdEvkmQBhBigJihzrMlHIJB6wuojj3J7wtxVYgpdvn0TF+DuLlAQnkWauEPDCE60YX6NNVKfp25u7RBT4KCt4dRNoLapH7tAJGCqOIPYZbF0HPvTHDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:46 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:46 +0000
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
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Mon, 11 Nov 2024 15:59:37 +0200
Message-ID: <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 370f6f5a-be6c-4448-16ff-08dd0259198f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bE04QXlKTkFnVXRhdHdkU2ZRcjhsVDF5a3I1VkN4M2U0czdPcW1BZTBvQjhT?=
 =?utf-8?B?R3JUaEk1NjBlajF3VEdpT2hWREJCelk4bGVsZVdyM0FyditnSzdydUF6alJv?=
 =?utf-8?B?WHJoR2E2cGhYdFVSaW1JdmZMTUJvTzJRL2lSOWUxNjZxTGFSN3RkN1lHT1g5?=
 =?utf-8?B?c3NJYWhSYlorYXJwaHBVdEZMS0wyRUZvWnZVckhRS3YxM2RVOE0rVjE3Rmww?=
 =?utf-8?B?SnBjSlc4RkhEcHc2L3U5Z0RFTEg5RG5IVm54Zkl1dXNtNGVmeTF5ZUhCR2lZ?=
 =?utf-8?B?ZmZOVzZQNzcweGtXcE1FRTJoSXozd3FyMGVWZkJmQVQ3QWs2OWR4TjN2dktr?=
 =?utf-8?B?bVNwL2ZiMG52U0RnUEZqcVNZazlCRHFES0tFYmczVytIU1M5NCtFb2tUUzRl?=
 =?utf-8?B?VjFzdHhJYjc3SWRqR3pZUWlQMWhzWGNjb0o0Q0VaZHlSVjJBem1YQ290MzFr?=
 =?utf-8?B?R3ZpeEM4MGwveHV0ekcvczdaQkUzcFY0NUZwbmZvMzlUNzBhVzFTSFVzUXh2?=
 =?utf-8?B?eDllUWI5ZEVGa1A2K1UvUy9ubHJxVDZPaVlJaS9Ka2ZpQS9KVVQrenMvZmV6?=
 =?utf-8?B?M1BNS0R5YUV4Nk9yZ0FoMVVoZFo1MWNvY2tGQVgyWmpRQVBUeURLeVhFNlJ3?=
 =?utf-8?B?d2pGbmxTTlBMUzNyTENwYnlPNERSeXlaTm9tWmtnc2xVNEtKU2lMd2NWNjMx?=
 =?utf-8?B?Z2d1NnZpMnMrMlFpMisvTWVYU1RYdDdBdGlCSjU4MWxsSkJaSUhHYXpYUkEy?=
 =?utf-8?B?elVNNDkyOVZhR0xEcFp3ZVpJZGFLdERIN2ZTWDBvT3NWMFN0WG1pQndmZmFw?=
 =?utf-8?B?RkZ0eVM5SzNQR3U3MkRLNmdVSGRwMXVRdjcxYkt3a2I3QmZkU0dpRmRiRUlR?=
 =?utf-8?B?RkQ0UUM3bXhSeTMrSk44Ni9FSzYyS0xCYTdNUGlwS01kUWRrUjlWSmtnN2lL?=
 =?utf-8?B?L0ZKSlpCNTd1RDNlWkxkYkZ3bWkxTUhrZ1l0UE1ZdmhQUlJaWE5zaVRUOXhZ?=
 =?utf-8?B?bGhaeWRCNGdZNkxmeHo5SWZLK0VYcHJrd3A1ZWNFb0pPV1FNNkYrN1hNK1RS?=
 =?utf-8?B?cFE3d0huY2xDZWJDZHdzMEN4NS9TYnZSUXgwSForcFpYVk91OU9Cb2pIc3hR?=
 =?utf-8?B?MGIzZ0VxWDh2WmxZa1FheHV0OWhYdDZyb1dwYjFVM29ZRWFMbm00aGY3MURQ?=
 =?utf-8?B?Q3dHNEk4S0NZK0htK0dqcHJNNUowWkRNNS9ISWNCdWNHR3Y2ZHNWQ3JKRVdj?=
 =?utf-8?B?dzVVcE9FcGlwaDZ2bVh6TzFMWTFNNGVIQk1zVGFwc2tjekJvZ1lGUVNpcmI3?=
 =?utf-8?B?a1ZFZVJBUDYwY1hxcE5YV3d0R240TlIxczlxZmpxakJwVzRraG5lN1hoRnBS?=
 =?utf-8?B?U3BOMEVmQjNLQ0Nia2wxMWhiQk1QOWw4TmhuTE0waGhkNUdsYlpraGZrcG9l?=
 =?utf-8?B?eVZSTFAvUlIyTG5xZ3B0N1dsNGFWZHVTNmJFbWpGcnJ6Qy90ckw0OFYxY09h?=
 =?utf-8?B?M1ROK0NjSlh2bm9oS2lHT0Evb3BmTjMvM2swN2FFQVdrQ1VTWmRIZUNHdVNH?=
 =?utf-8?B?OHFDSEF3MjNNL1NwMEU3WEtGK1FUeUJ4eE5ZVkpSTDI3bHh4eEphVFBCUzB2?=
 =?utf-8?B?QytJUlpaOXRoSTNxUSs2ZFNBdXhKb3R3ZjlDSTVEL1RYNytSMlM0SFRxbnM4?=
 =?utf-8?B?WlZxRFR5RkZRaEw1djRvT0ZKQVRFeGlWOHpibHk1Q1Y5aGtqSDZpVk9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29DRzlEQlZzbzlBSEMxSW13UW8ycStzWlFiTU51bnhMWThyZlNyQndRdE1m?=
 =?utf-8?B?SWNacmxWNzBnU2YyMXdNQWV6N0k2ZnJjZkRkZ2N0Z1FkeTJyNitnRmwyNm5S?=
 =?utf-8?B?amtIOVZBbG9yWDVoaWUwOGJpekE0RGdFTXNiSTgzeTd3WWFVZTljcDR0cE5l?=
 =?utf-8?B?TEljZ1pxWTh1YmNQdEc5b0Z4MngyUnhzcVhLMllMaXMxeXlyMnVobU9YbDlv?=
 =?utf-8?B?RmtyM0NMQ0JYQlB4Sysxbm51MXpXaENpQjJFOWhtT2cvL1FWMVVkcDNQcHF2?=
 =?utf-8?B?d293Y0tqYmhBR0liWWRZOVpiSkxVbzhkUk1kdGRRWVI5dFYzZCs1bnJCcFJT?=
 =?utf-8?B?VElibXNSWWFCT0xZTk00MnR1WjVhUzBXcjBLcldWdUFFS0I5NlBvcUVpQVBB?=
 =?utf-8?B?ZmgzMjlqN29HdUtFeG9MWjRmME9aM2lBWmg5Mi8xdUErM0VIWXRmZkplZXJB?=
 =?utf-8?B?Ni9VTFlWWVJTUm5rWEQzMzBJRm1oUlppSlpvak9VZ1Vac2JxUTVPUWUxM3J5?=
 =?utf-8?B?c3RVd002NU0zYnFKd085WmFTVlNkbGF4QnpUcW40bHplRXp3blNFdDllTEZa?=
 =?utf-8?B?Q1JHRjQ1QldSZ1VmelBHeFhIeVVPUWZuY2pseHI2Uy8rVEc3NmRqRFV2Zngv?=
 =?utf-8?B?RjQ0aGdrbDgrUnZ6RFcrOVZHblRpcEhod3IybG1XVWtxRzA0Vk9vRm5VS3FL?=
 =?utf-8?B?Y0RyYXdkeHZjc3RtVVZ0NGZJODhlVFB0Ym9rd0VVd2tTRG45bjVlSThrREdG?=
 =?utf-8?B?b1ZjbElKN04xTmhSQXZoN1NVQkJoMjdZN0lTL0hxNjdHWkJ3K2hWRk5NV1dz?=
 =?utf-8?B?dFFrek5vbVNrc3JTeDF3dFIyWGp1Z2dCcUF5eDBFb290eXNCQ2x1SWdYWEJ0?=
 =?utf-8?B?TVBGSXMwcFhpR2pBWUdhZ3djd1RBZ0xkK3RCL3kxcWhaZHluWVJENGNEMkw0?=
 =?utf-8?B?elprcnhvbWdpYk1xUVY5amRiWHZMaFlGU1ZsWklNWHo2WmMyVFdQNGo5VlI3?=
 =?utf-8?B?RFJHblc2N01JQ3RRQlliQW85NFVZQzVYQ2JPRVdLY09qS1hyMEJwcEpiSGl3?=
 =?utf-8?B?aTVPOXAzb3ljbGRhK3h5NEwzak5mam9lZDVlZnl6MG8vd0xhbjU5TmdkVG9B?=
 =?utf-8?B?TFJxVmY2dGppUGREUmJzcGJiUzl2YWMwL0FZRk12VzNsMmw5ZVJ4cmllNCtj?=
 =?utf-8?B?MFdsVFNLYWVzVUt1L043WEtzWmZrWTU4aVAyOTNwMnJBN2FDL1lUa095UWdl?=
 =?utf-8?B?eWJ6NVIxZDNkSi9FYk9wcFhFWERxdmJaNXhxTzBQYkg4UlJ2bmdUa3ZNR0dm?=
 =?utf-8?B?YzhnRDdMNndiRTkyNmdYT29uc3BtV0hGaTB1VDdIZHFjcGIrRUlWTjJMVmhY?=
 =?utf-8?B?L0xRTFlzSWpQN2hRbGp3YzNxeHJINTNRQ0JFMjJQQjh2aWt2Sm96d3g3dy9S?=
 =?utf-8?B?S1FpMTBkNEtQZWR6aWszYm1tRGhuQjNrQmI3RytvMlpaNjhsbjF3UkVKaXpa?=
 =?utf-8?B?ZkJzWnE4RlZGV1ZaOUR6a05KK1ZBOERQWWgxZ1Joais5c1c3a2NnS0VtSlEz?=
 =?utf-8?B?MEI3SjlHb1ZEMW1BcHJHMm4xM3NROElqenBLWnFVNTZCenU5YkRKdk1PM25y?=
 =?utf-8?B?U0djcVAxNkNKSStIaEVBdmZGM2U5YVZMZEhpWG4rTzNGV0NTeEI4VmRwSlo5?=
 =?utf-8?B?cjU1cldJK2FBL3VRMll6cjRqRzBDQlNENmZCcUo3SVNJM0ZBK0JZeW5hVmZ2?=
 =?utf-8?B?S0xoTS9BV3lUYmFRWmRJSzM1dWRyVktBSlZ1NEhVR3NCcjNocEtKdWZ6M0N2?=
 =?utf-8?B?ZnVpazJnMG01Wmx1Ty9HV2lEZWNmTjVSRGZZMm5rVGhic2xuNkNNN3p5RzNk?=
 =?utf-8?B?NldtdnpFVTVXYzR5Wm0zUWdaeXdHR2NvWUd0SzdJc3ZPUmpweEhCSS92Z2dU?=
 =?utf-8?B?aHpWL3EzbHZFVTVMQXlhek9nRU9wb2xNcUhwMGVIZHllS2ovNDFieFdRYkds?=
 =?utf-8?B?Q2ZWV3FzVlI4QmMzajVBUjRTWmdrYTQyLzdLczMyZzV5MWU3M1oxdU5ydkRq?=
 =?utf-8?B?cUQvQTVVdGJMZ2M3cXdXTWlxN0VUMnJvTEdJbnJCa1VqL0YvamZGdGVQSmpR?=
 =?utf-8?B?OGJyRmRVTjVaOW96bWNsTDBKY1NnUmU4MUlBNGh6UVBBSkZYRlVldStrWUI1?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370f6f5a-be6c-4448-16ff-08dd0259198f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:46.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uazb7th6jP9nX2zlDjBV/fQLbB3bj6c9PHgSszoMdprcaHvifYcyp26l0dstpZa3fMZmHGgkMQfspyZypztnjXaYO21wBRhTvfvEJZCUDI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

RTC tracks clock time during system suspend and it is used as a wakeup
source on S32G2/S32G3 architecture.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..231811579e1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+description:
+  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup
+  source. It is not kept alive during system reset and it is not
+  battery-powered.
+
+  RTC hardware module contains a hardware mux with 4 entries/inputs
+  for clock source selection. On S32G2/S32G3 SoCs, this mux is used
+  to select between a clock source for runtime which brings more
+  precision but is not available during system standby, and a clock
+  source for suspend state.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: ipg clock drives the access to the
+          RTC iomapped registers
+      - description: Runtime clock source. It must be a clock
+          source for the RTC module. It will be disabled by hardware
+          during Standby/Suspend.
+      - description: Standby/Suspend clock source. It is optional
+          and can be used in case the RTC will continue ticking during
+          platform/system suspend.
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                   "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>, <&clks 56>, <&clks 55>;
+        clock-names = "ipg",
+            "rtc_runtime_s2",
+            "rtc_standby_s0";
+    };
-- 
2.45.2


