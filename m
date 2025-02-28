Return-Path: <linux-rtc+bounces-3317-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A4A4933E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 09:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42F8E1707D7
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 08:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F1A24888D;
	Fri, 28 Feb 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fVdgdK95"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A24248890;
	Fri, 28 Feb 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730723; cv=fail; b=sy5gSUeqoqsPAwDqaKige6HPZA2fto7i7axJYfhNshgVCjCGmeq48fHSrHzp8ObmzET1C3DIN6ODmIApAv2eLAg/Ig/m2OQxOVzXqyui1U/enXz0WONcuMaccvxzdxJ3g9WZkH+WED8grKQrNduAy+vPHu9DSwl4ycYsv/ZbNHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730723; c=relaxed/simple;
	bh=MiLy6fWAXFgmN7SIgI5DtjximCyaaR4gvfG8iOL7Brg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYc6NEqDC6lONgxPoYc9lHZpMkEc6qFxJGClGdtviBAGHCVxBi4pNfjZcKajVKNnu++E0q8HyoOL6K8kyS4ObPKbi2xYH/vDaY+h1LGU/+V+IyAQIrW+m7+SDTZ6HKgEGK7OGZggttWC9SFzQAkh6MsU9xAAU9KG4s9FyTF90pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fVdgdK95; arc=fail smtp.client-ip=40.107.104.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdDgaF/lLYGPHo35CaNZMzNFMarMnVq7qvfmTWK6nvUJLHP8HV2dUfOuj+TokSOJWNo/pIAJOGj6g9LLwM+3JRUKN2aZaG50K5RJB+ZL582a/TM4ajczwXMxf7ozLG5kJu7XI5iI/G2Cnq3g1lvoEqTDNavPKXDDUTpNncjuEUYsDn8eXuUr4fwRQ10RXSDkWD4e5NBZ4+O8SUZ3zyb2ALtViUq8Uk/U4kJGDt+uxnUhdngwwgAyCG0CVgW5DYD6mbn3pCht5WdADzjC0Up755I73Hq7gJUPIpEK2dlsYEf7G0OjTCVwJERyQ0jlVL+33zBHqWIE+GyYwYCi84H55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=lTjM3IHeVzkVM0DovkGukRzTBrp054El0Eo7htMZubIyn8dolUi+sK3cRqqxU2uTdwGPGtlP3FbmeaPFMaE0IZlXPHfoEG7F3v6aekUA5yWAuSskF7X72E20y3nRJB5NuuKTF179Lxh1vfAC2FC3jVqoeuqZGkuJ8VdwzQpj+PBJnTgPIe9Dc256PNxpnbT9MSSzhzylP8em1yMVITSwNXdolODdxU6qD1zpPLl1QMdnL8HMWnkyyAnHWDe7w29G3eXrZkk1gzpkZvbdKbwo/Z2QFIppCN6tVmeYR3GAK+szDrHeq3J5+g4OD8FhK8PkT7ckAzS0+J74CBB8rQXYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=fVdgdK95gMXw/iOTOweCEzsmR3JL/QlVOanU+o7wKRJRlmOgK725GhtHZGYZaLWt6+rZIzKe3CW0vxvCoKVlECzEkq+nEWjZS7zDLAaoZlOFc2RasYW+iDBURhcqTj+h10eGXrrgjYoPwNIw9BXkQGy8xWY7FqaT9/lOVvxgSc05wpHPG+Y5UXipDQRjyFQgM7i1/8RhaXny7e0E7Z3SUjv/Zj48w67uAEh9Z8D7tj//VZLi8p+A1Fd0jHFhNeYjP5pn+lG/vq92aYGLNWJISynL2oMZoeejVadYZN+2Iguv3O4ZnjFnPJu5GxwMFhnrFE3zn7hYl/H5ctu8BF5bRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7305.eurprd04.prod.outlook.com (2603:10a6:102:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 28 Feb
 2025 08:18:38 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:18:37 +0000
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
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v8 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Fri, 28 Feb 2025 10:18:12 +0200
Message-ID: <20250228081812.3115478-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
References: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b403c9-6847-4b33-3527-08dd57d08090
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTNQUXRTS2p2N3htWXkzcWs4Mm5VcHZvejA4NlZnSlkzQXE1V2ZGZ1F1K0lJ?=
 =?utf-8?B?cXpPU3JVMTRKcmp5MzUybERlMys2ZGVmclpHdE9GcVlpVGFSZVhyeDNlVXBQ?=
 =?utf-8?B?ZC9jQXlGTVhwakpzdzQ0UE1samNWQ2tIckNuWWVzaVZpWFBjODIxTmJXRmw5?=
 =?utf-8?B?Yy9TWDZFMFowYkpWbHZuWmFoWEd3aHZUSzEvMWhPZkNJVVcrRFkxU1JnbE9k?=
 =?utf-8?B?SHBrZ2FXT0RjMzh0YkNJUG1JS1I0a0ZDbGdSdSttYkp4V2NXTTJjaC95VytE?=
 =?utf-8?B?OWxoeldqTExIUVBva3g4VG1pdW1Va0ZIUGJsWkxFbU5VVStKeDhuUDloS0g1?=
 =?utf-8?B?dDBDbUg3d2JoZFZ3V3pUTDZqOEJvWlFnMWExU0NOREs3cnJQQS9yak5udW11?=
 =?utf-8?B?cmt1Z0N5bFY2bVFKQ09qZVVZYmFIUGU0Q0F2bDJkM1R0NTVZKzU0cUZQaGpv?=
 =?utf-8?B?U3c0MCtKUGdyZFF3SlNKOHJFUUhob3hKdWJzMXFIU2cwdmFxcHJ6ZVROWmY3?=
 =?utf-8?B?ZEpYS3RFQ0V3V3pUdmp3cUxzbWo1bzJwWFRoMUhEa1lsOWRKR3B2SVB6bXQy?=
 =?utf-8?B?N1F4TVFwRmV5SldlTHo2d1FPcWtldkliSjBLQzhJVk9WaXBsZFp1MGN3UVFu?=
 =?utf-8?B?NlNCMFlqbXFUQi9NZ3MvUU5EbFFRWlB6eDhTTGpvellJVUxTb3dyRjM3cnZK?=
 =?utf-8?B?cXpFS2ljVFJvZ2tOV0tzazZ6RzllT2ZkNElUMFJDS0FuYVZKdE9uOFFvc040?=
 =?utf-8?B?MjFYTWdiU3RoRm1XVnVoK2xmWDd5dFc4bG5YZk5sci9tclV0OG1aZ2FEMzRx?=
 =?utf-8?B?eVlMVGpaS21CQVQvQmhqY0dUQm5JTTRJNUVOemd3TXFGOWhMRDlaNUlpNFly?=
 =?utf-8?B?RG5JSUJiMmFldDlKNGdPVmM0UElDMWpWQXNZdzFLdXJCaVA3bVNXM0ZaQUlp?=
 =?utf-8?B?Q0Fxb3dYQ3BpekFGU2pFNHdYZ2ZGODRuRWVtQm5SK1RUTis0SmpNVWI1bzNP?=
 =?utf-8?B?WVhxYzVHZzU4T3BrS2Z0QjVNeDg4cmxvckt0VWtDZllZZzJ6MGlNQ1U5Tmo5?=
 =?utf-8?B?aUdvdWFBblJhdE5qVUpkYTF0aXg5ekQ5cG9vR1dEWVlvNUZzUUh1bm5RMzJH?=
 =?utf-8?B?anpYRHAvZW1VRGhaaVNJbHMxa09Ld1RQUXhJVGVEZnFoN1pVNkR6TStwRHRL?=
 =?utf-8?B?WHhKaGVwQUQ1aVNqVDI2aHVuRXZGdHpzNzY2MVBCRkcxZWVJQ2RibC9kV3pp?=
 =?utf-8?B?ZG9rVTJYa0xETzZkMjZBMkdlZkE5Nk1MRzA3SHNhVUo5aFg2VHFQc0FiL0Uv?=
 =?utf-8?B?NEpmOEh2cXgxa1pQaVVEZ0NCSDVmNGZjd1N0KzVQbEczdFVSY1RaK1pjbGpE?=
 =?utf-8?B?dlRMQlZjeGRVR1JIanI2elhBdXpnZW1uMFJzNHg4aW84OUQvWElKcVlOWkJQ?=
 =?utf-8?B?TDVOb2E5MHlmaXIxZE5nNHJsdWc0R0tuS0c4Zmdpeno2aFh0WWo5eE1scGZ3?=
 =?utf-8?B?Z2l4dGFTUVN0WDJIcUxRdzlnZHZVR25hUmhYb3pxWmNtZGJsRFZHdWx2VGZk?=
 =?utf-8?B?TGNxZ1BRcUcxdVNabWNXcDQvd3BjRi9nZks4ZUsvTkM0SWpmRGhDVHBWQTgy?=
 =?utf-8?B?THlwempFcCthbXBzODJzQlpMczZnd2F5YjFZTHJjZ2FMQUJValdvZzZZbm1M?=
 =?utf-8?B?ejlKNHFiMnY1OGJnRGVlSk9nenA2Wks2R0JkZGp2cWpQMDZrNGlmRGZ6VlZM?=
 =?utf-8?B?VUZGM045Q3gyOGs2dUdxeVJVcElpZkY2TTJLZHllOWdPOXgwSGJ0STBLOFFN?=
 =?utf-8?B?Y3IxRmpHdnI2WDVWRXQvTkswckhYR1pDNmx0bmlEVFhZRWVmL3FYM2l0SVJF?=
 =?utf-8?Q?aqPB12NnFOk+u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZneFlFWFhKdiszUVB5RVdEZkM1dG9qUGJEb0hZVDZUWFZ0NlI1c2hIV1dr?=
 =?utf-8?B?ZnRnK2hGd2hmVUxiTHVxV3QzWHAwYnB0eFJsQzNJSDZTUTZReXpnU1B2clRQ?=
 =?utf-8?B?eGFFQ0MzMk9JcXBYSzIvNmtSS2xmL1JrZmQ4TGFwUzJrTmxoV3JrYlJ5bkdV?=
 =?utf-8?B?NEZTU2NNN21sbjFpMG1uU3EyL3JIQXJqbk1sMkpSWHo1SVZNR1BPT3Jvcm1C?=
 =?utf-8?B?M1pVdXFGTk1teHh1SnZaQVFQeFpienVQdWtYV1VxZlRRN05tcnlyNWNJaU4y?=
 =?utf-8?B?RXVVdEJOTGhJTXVaYUpJcVkzUzVVVXNwRlBpQ2dVUFUrdGo0a3dZNHpGbG12?=
 =?utf-8?B?RHRFV01kQ2xiK0grK2FZVzFXTjZNMkpIN1BIMW11WWJwWFhmOWJpbXJrRnE2?=
 =?utf-8?B?ZmJ1U0hyYzBIclBlUzRnb3BOR2VJcVNFTmVDNC9oaHRXTEdlMXdMWEtwbDhv?=
 =?utf-8?B?bHdtd0liaGpFM2Z4emJieGh1cjJvQVZqRWg3QUhmR3hqVE5TdU5oTVphQ2VF?=
 =?utf-8?B?a29tT1ZxWnhSc0gvWnE3SXVxUGdyc2RJMGhVeTZrWFFCZFAzYlF5WWZ4djBE?=
 =?utf-8?B?OGE3SHRUcExacUpGYnpyZk5HSW5VbkdQQ2NKdHlYdmlhanBtTCtTNlJzdUdQ?=
 =?utf-8?B?MWN4QWpqNjYwbUc4ckxIalFReGZLcml2WHRqNU45SXNCWURuY1VhUm5kVmJP?=
 =?utf-8?B?S01PS3VpcGlEMDBQdGtPOG9Zb2dKUmhkZklGZ0ozeVgxWlhBZWNqaGZWMjlL?=
 =?utf-8?B?RlFvcHpqbVExMFljQ3djbW9oYzNjTENWWUJnY01xM2VrbVJBK2toS1VtMVJw?=
 =?utf-8?B?OXFpcUlPZ2RZcUxDRStDT2QzSGNlRmoyZmtRQVRXVmc1cDBYVFQxeEY1bTVS?=
 =?utf-8?B?ekFwb1luRzVWR3c1SzVQbHRNMSs2bS9Qd0pHVmQ2OTFVdmIyNElIYklyR1hW?=
 =?utf-8?B?V01xdzRQeXlUSTR2RzkvT1ZRK3NETWdJVEVHZVhKbzdScXRzZFpvb1dab3M0?=
 =?utf-8?B?OExheEZET2NPMmNWcitsa2NwYnpSWlpaVS9vTEJIeEM0enJySmc4VFlZeWxo?=
 =?utf-8?B?eGN0czVOTHRvN2xuTlNjZVVBM2dBRWtxNm5qVTl3T09jNXFDTm9LY3hiMGNP?=
 =?utf-8?B?MVh1MFY3NGI2bUNWMXdnYldlYURlNGpXZFVGOUZTeU1JZE1ab3ZNampPUXFj?=
 =?utf-8?B?ak8rSm03SkhNVktkK0ZiV1dJRUN2d29maWZnZU9DT2lVamp5V3YvU0Q4a05q?=
 =?utf-8?B?a0grd0lZZnlHWDdjaThyUUxzcm02Q3NTeEZZbWV3K0FvdzVVbWw1TVpyVWJk?=
 =?utf-8?B?d2E0TUN1WWdNcmgwQUpwVkFtNitxQ0c1eGFOTmRxb0JwVmRraTVpVmVwYVVk?=
 =?utf-8?B?YlI3NExtS1VPZmhnRG1iNnB4QkpOMXQzcE1iWVhPYjg0T0FqaSt4QlphNk9Z?=
 =?utf-8?B?YmJTQUtTTUUwZVVVdGZEWjQxYi9neUNiKzhRRmVPeXA2M0FJSTVqb1BxYnlk?=
 =?utf-8?B?NXh3d2pPSnYxVXNZb1NZOTg3R1dpVm5sUVpRMHE3dUhyQVE2bFBtemk1WWNl?=
 =?utf-8?B?ZHY5ZFRTMEZ6Z3AxU09TKzIrNm5HV01YNFlQeEw4Z0R5VWdndXlrZktsZUdO?=
 =?utf-8?B?OEJNYjkvVzZORFdYUjVuTkh6MXVuWUJCLzFmbUtJcFRLU1lZbTJsMS91cktv?=
 =?utf-8?B?UFdiVmhYQWpBMGQ3dmlhWURVVEJ0c2hiT1N2Y1V6T1NBTktKdWNGalM2Slh1?=
 =?utf-8?B?aVI0V3BraXhjL095Z0M0Nm5vV2ljU3o4TmlUTU9UVkN2T1JyNHJpT0YwSEEx?=
 =?utf-8?B?cWJ6K1NWUzZNM283TkNSVUIyK3BpWkloM2g2Q3ZBQW43M2t3MEdVVG4zSFZy?=
 =?utf-8?B?YWZ2VUo4TnEzMDNLT1lUVmZTd3BFaWlSY0FkVnk5T1o5OU0wMkNjOVdGM0th?=
 =?utf-8?B?Vi9BNnB3czczYWF2aElpd21VR284ak9OQ2pQOFNhMUlhc01aNUJyU2NFL3oz?=
 =?utf-8?B?YXFMOSs0dVFXQ2RMd3g4SHIwQjd0cWxFQldYMGJ1ZkUyTWhTdWFuUzBNUDdk?=
 =?utf-8?B?QjhheDJGNSsrbnJDRTE4blJEVHNnS2p1bHJ5cFZ6aGFyM3lPamo1TjhFeGNh?=
 =?utf-8?B?N2R1UkFtUFo0TFBJbDZYQVhsbWFObGk1NWFVNXU4NFA4NVJoN3JhWHZNc2FV?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b403c9-6847-4b33-3527-08dd57d08090
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 08:18:37.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+AGNGvHz46LXI0R3D7HfOUQ21k6ijENpcNA3nixrlPduF+SojN62vxZD+23nQQcNicFKxrht8aCTJN/D819PaniorZyKNRGM/NZcQ+02lU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7305

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 873aa2cce4d7..515ed8115922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,8 +2873,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2


