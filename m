Return-Path: <linux-rtc+bounces-2530-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54A9C5021
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 09:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1F01F22F34
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B0320B211;
	Tue, 12 Nov 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pnW8G92N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93A20ADD7;
	Tue, 12 Nov 2024 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398402; cv=fail; b=J09+wuEKiWFyp7l0vfFgDv1bwlxaWXtKR/ukcIqavs+HnSr5riydDYWrHu4G/EP4lYi9lvFQ+nkxRUbWZdjtzvLgWXGfz+CgPhwKQ86ZiDHHHmX0IacJP8ye0D4pWIRbXncPvDIBf50QXR0D9uS2O2V8KuiMOEfJbBV6A6I+GXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398402; c=relaxed/simple;
	bh=pAGtSjqCuT+59/OAliOTYkgr0+BbcnfOFd0crE/OJNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j4ykBv0tRWGyDjVJgPyOSoQLvNCclPJJ3Ke/5sNrwfdJEVMjcRYt19dgtHRqrzO6Gr/N4Sv9Qt8koqvGkTr4g+w9IKhdpDm6G7fzbmQqa4ph5l8syITl4QEmKHMtLI8we+dNjb0KzlM6Ldm39me8gkHkaS2VhE2XQEGs1T4PH1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pnW8G92N; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kh4jcO+lekHWeuyLLyjZ8vvzlgJ05HIwWyI3/oYMM4ocIxcxrJXciRyS4qEwrXm+vBAbQNIrYxEf7UsRqciYygfCZj79ckgp/DZmsg4KKMX3wF7qZVkllnZqF/uYB3CHbfcon/6e8Nn/hbDro96sDLENCa9c4J7V7bjufMwjvaIpew/J3kfopEJ6kpuERJsiKsPQBHa6jHLTY8PFLpNN5hZxSDbho4/dmUvIEsB6YmgJ8r84JuTNdscu1+PArr8RT7vPlaT/yDM52INFG590OgrT67K9vzIj+ttfW7jS4BJdFyC+Q2bPJxRiZz9cGAhQB5NIbKZulM1Mp2Dm9FEYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1HMcCZV7PUkXmydHjpg7F4obkuxtDWsrqNPv5oMSic=;
 b=JRxz2AAhJh0XInNclNryiA75B+mnCoAFazyov/IjiA2xFHchUBoU8jDEG3QcGcwUe2awUTrTsdt6WT2zl9qypwYYfW6L0GD+2doM/fkJcjd1z5WGTu24ckalDnuzwn24oSqcNbDSZSS52s7rMmhJZ3rnvaKV9TlTwWFUDnyrSV7R3Cm+ckQCCfmhWeoGJNPrhhkdnWawD0gooXdF+tMxhowGRYWYnSsvVGXcChMs/VlOZu6GakRlddOC42wHJSK5kZEMNKR1UHU+r7Zk9SH5fLI4ZN1skzI6WXiylOoyYBR4xwdAKThl4HZYhHkowyAU0mraakrEok2r+HdTQKZsXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1HMcCZV7PUkXmydHjpg7F4obkuxtDWsrqNPv5oMSic=;
 b=pnW8G92NJY07eglKIymld1TtXLK+PhA9iOgVwtbCKAMVxObe+aUwB4MoNiqxA/ZF/Onz+gdGI7zOJfIXTHzLWeDDIhhHLfJKvjTItiWNQBcykSt086LY/aV1mKPdZhBXKNP5/q1Gyuyuehk+b0YrSSdKewyV8YBXaTJhZ9mjAEZ0PfdxYIQkjdOYwGZpyXDQ1Ql76sYC2+nBbEdMhyE+0UQPNJ82Hes0peGTDdxoGIq4Xcz4UAjg2VVwnVxKl4lF5tzRY8YPFoPjnqoQ1LQhd6GifJTZ/I2fP1EjmoMPGTtSTIdZt3DJcCNPPCqvfZcDPjKWx4Pk22+2naox/XJjUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 07:59:56 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Tue, 12 Nov 2024
 07:59:56 +0000
Message-ID: <7f7e1a41-df51-4f32-aafc-360a487b3449@oss.nxp.com>
Date: Tue, 12 Nov 2024 09:59:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
 <20241111-guidance-theft-9d49ded4d9a0@spud>
 <20241111-manatee-decipher-fb3d20982109@spud>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241111-manatee-decipher-fb3d20982109@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::24) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c484ec-c191-4756-a53a-08dd02efff57
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG9VdE9EaitlMHJCNkZsNTJ5Y0pJMmRubFMzRi80dHpsdG1KeDBobTBoYTVO?=
 =?utf-8?B?MVRvbUN2NUdyaklqOUVMNEpOeDE2bWRibXcyd0pzR3N1TXlNVDc4ai9aeDhk?=
 =?utf-8?B?ZDdrb3o5eGhtZHh1bkJ1bDE4Y0VzelQ0YlkrWTR0VDBYOVNRc08rSUFBNFN5?=
 =?utf-8?B?WE5xd2Z0MkprWXQvNVJYYnExdDhGckR2L0YyVkk4Q2hlVEZieWVrVlYza2FI?=
 =?utf-8?B?MFFwbXJBb3JDVTkyWEQrdVdvWGppdkNpd243TGl6eDdZNE9MU0pFMjRGVkZN?=
 =?utf-8?B?R01RMHFtVVpMdVF3Sk5pR1FjM0JEdld5ZHZ0WFdxODBwMjE1ZGhYNFBwUVdo?=
 =?utf-8?B?NUltM1hwbmVNZDBXY2paYnJneURSZWpqemtoM3hPZm9CVVU1L2dYUXdKak4x?=
 =?utf-8?B?TndKSG9CeFZ6cXdtZEUvTEc2UXFCU0NuQXcrWHlwempXZ2Y4d2dkcW5UcEt4?=
 =?utf-8?B?TTV4b0M3cUxpZ2taVVJjRDJpTEFZbHJnb1NGZUZZcXNaTjE0NWxhZlY4S1V4?=
 =?utf-8?B?b2xtK2ZyT0hubnRUenphMHpVeW1mdUxWVSt2dzJEelM1NkxnU0huOVFRKzM1?=
 =?utf-8?B?MjJQcjY2bitGL0NGRmZ4T0d6T1NSeDQ0bFRPdzdCSWExYlBuS1Vwc3Z6V0N3?=
 =?utf-8?B?K1l5SU1BRTFqUy9EblFqY0ttMEtxbmM1TE1yZXJ2NE42RGVKdVpYVDd2MXUw?=
 =?utf-8?B?MWhwSDlKNUJDTFB6ZFMrV2lsMjN4OVJTRXp2VjNmM3NXVHhqM2wvNWxOZ3Jl?=
 =?utf-8?B?Qm84WVpPVW5mNnZKZW4yZTA2RTAzY0pmV1RQanoyQWtEWjAzOVMxZXdjRVpK?=
 =?utf-8?B?aStIT21uWVNCQ1lZZU5kRGI4dHdsV3N1UmZnMG5GaGdQaUVXaTVOVDA0cU90?=
 =?utf-8?B?b3VQS250Y3Nla0owbHNobi9Qa29Ka0VhalhhaGErL0NiUTlFZSsyRlRvbmIw?=
 =?utf-8?B?VXhFZEgxQ1hJT0c5Ri95VXFYVjlUVEF4MVQxNDV5K0I0d0hHOGhjYXBlYzJi?=
 =?utf-8?B?M2Fkblg1c3UySlAxZU5BbFNOd3F2aW50dXBGVGl6bTZNbWE1Z1hVU0JRVlRw?=
 =?utf-8?B?UDhoSjVEdURqdFVEelhQL0tSNEQ2YzYyZm1qMG85RVBlc0pNYTdkd2JWTFRI?=
 =?utf-8?B?cTl2TFlxYllRd1d2b1pSQ2s0ZzhQNklFamlUc2RSTnREVzFqa3FCVG1pcEVQ?=
 =?utf-8?B?NzkwZ3ZiNmxWcWdIYTlmVUNqVFNVSmVMZFpZbDBtR1ZWRVp4cDlMdjZJZnNq?=
 =?utf-8?B?Nmd5TFRiVXNiUm54aVdyZEhYbmFRbWIvN0dlTTRpRW5Ec1RSUEUwSXZ4d3NL?=
 =?utf-8?B?Ti9vakd0Mms1a0VzQkFMV0ZKbXk3SlIzSm5nMzlxTDI5Y2dabjUrSjRkaUdB?=
 =?utf-8?B?WEViTmV0ZzBtV3lGSnJSbG1QaW1uK0RxUmdGTTF3VitNVVNTOHltaHkreVU0?=
 =?utf-8?B?enhwVGgyN01SNVBNQlBHVzdZTktpZ0hnWVZzYWFvd2pJZnNlcEhJY0xMd0dn?=
 =?utf-8?B?S0ErQnhIeFl0ZXRab2swUS9ON2UrUVpRTGJ5dXd3QjdObU0yU0JGWXBQYnJX?=
 =?utf-8?B?U1RoY2xrT2kwcjdFbEc1OGhXL1hwWThJZk1LV0lVRk9LUmVDUUZGT1ZFMUNo?=
 =?utf-8?B?S1hiZ0NVdTVvRysrL2h6bmhKUjd3Z1FWWkFLUktYZU9LakxFRG91R2draFFn?=
 =?utf-8?B?OGNSVTV3QWRHdFdraGV1UFBkdnV0RnZDcnJlMHg0aXByNlA3cnBKaWlydjFK?=
 =?utf-8?Q?N74ls6DYUxP5+rVYAOBrRoeZ2t/OFXh0qPylgHI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBJbENWWXdxY0UycEZ5aHpJN0JDcytCcmJHTlh0TEJFcWN6bmJodGNCakVB?=
 =?utf-8?B?UVhDM3E3VU1xTEt4N3dsOU8xVkZmOXppVW13S3l2L2s1WHBKbTdiYVZpL0oz?=
 =?utf-8?B?dkdRZkZqM3hvVUt1emZRQjV3VXNhdmZKUnRxRmM0ZU9QL0taa1Y0MWlybUFZ?=
 =?utf-8?B?T0hNRExjZlB0V1NCQ1VNWHNMNWJFSXF4VHo2Ym90NnJaVVhPTGdUVzBHWEQy?=
 =?utf-8?B?UzlZeXozbEJmdURuVkpLN0ZvZW01TGVoRTEram1KZHBHNS9DVG9jNWo1NzlE?=
 =?utf-8?B?dE5vdzRBOUhoaVBDdWRXb3VIMEZ0SG82V0VFdnNBUmI5VnJrcmVuRXRQN1hG?=
 =?utf-8?B?ckJkNTc2ZDBWejF1cUc1M2FRMFdyaVRqcjlPdmRCQTJ0ZTZNRXNpeUdWV3kv?=
 =?utf-8?B?dy9kdVdXajZDRWdDQkJUMVZ6UFh3czJSQ1BPZnNHTEtwRS9JMmtQSFU0NDN0?=
 =?utf-8?B?T3JicWdPN0VMK284OThCS3p3TjQ4S3UvWGdOMlByS3JTUzRaMHdxdVU4OGVN?=
 =?utf-8?B?WVc4TXNxalJLa2NEK3dOeHZ6TnhMbDNPMjd3UnNvZWtncUNzSG5ZWTFlUFBQ?=
 =?utf-8?B?ZG45VVpLVzZVZzZGcHJPWW5aWU5ZYStjMjd4NXFhT3d4dnRncTVOb3hwN0x5?=
 =?utf-8?B?eEs3cW5ocHZBNlRJYUNQUktoRk5UQ2xpVEdORnF0K21LdU8vdVVCZmgycS9N?=
 =?utf-8?B?R0l0RVBxVVlKMVNGRUJFeGVZYVNqNkthbWhhTFUyQVNWQmY0N3YrTnhSNldM?=
 =?utf-8?B?WlBEZ1gzaHVQa0duRk1jcGVtdFVNT3FzZVc1NFR5aGRHK3pwWCtwZkZ5Szg1?=
 =?utf-8?B?RWRwVkJzVkVjTWRkNEtYM2pFV2gyek5COEJvTW5Xc2dTSlZmeHhhdUx2T2lq?=
 =?utf-8?B?WFQxS25mWUFSVXBjbW54RGZVaHpGcE9QWHgzN1hySWdiTTRXQ2lDa3lkZy9H?=
 =?utf-8?B?TWdnaGkvWld3QTdlemEzY1l6QzVVU215bFYxR0xIdnZKT0JkaVFLUGZDdWtE?=
 =?utf-8?B?L2tkZHcydElUdGkxYmxaTlFUWi9tUmJ3T2dmaW82enU4blZHNFdoSVFPU0hH?=
 =?utf-8?B?YmZWZk9lV3BwZ01nd2QzMWxnR2JmQnE1dDhZck5KbGVFNG9tdytmREJMaTlD?=
 =?utf-8?B?ZjVTM1R1eFhpdDVwOHhDTFlqbGQrTUhUWUcrZWd4WVlpRXFrOThuaWVxRHRr?=
 =?utf-8?B?NUF5TWRiVGRwOTI2THZZcDRoWUpHSnlud3pxT3RFUE9TTUkxWWNRNlJlNnd0?=
 =?utf-8?B?SnEwZEwyRXNzbVJpd0syVmZqcVRJdkxEYzFjTFFPTHN0UktSaDVPcERWMU55?=
 =?utf-8?B?b096cW94SDZFY2ZDMk83OXdzS1JHakNkM0tseUs4TzhyMUFwYkRFa2tmYi94?=
 =?utf-8?B?K1dpRU9ZeUlka2pCMEpNSmZqQmFGMXNPOXRDY1dSendFNk5XZGhrMGN2NG5z?=
 =?utf-8?B?VFlDbDNjcmJ4MlQ3N0dLTHUvenZUQk9KMUI1cVFuZVVyMzdHSmRDbkR0UGx6?=
 =?utf-8?B?NWVLVXJjbUNGdlZmSC90bStJUUxIeFVhK2s2QkRsOWphdzBJYjR4OTBmVGlB?=
 =?utf-8?B?dmk0QmYyR1BzdmlZS3RpRnhhNEd3WmY4K0s1bWd4SWVpd0djRFpvcllGUCt4?=
 =?utf-8?B?RE01RDVFa2I0VEdrbnlZL3pTbFdWaTVFZWN0a2N3aHhKSm03bGxMMldxWS9K?=
 =?utf-8?B?UzN1SEliaDFMVWNZcmpFcUE4aXdIY3hseDB5bEFFYldXQUlzZVQzSWd4K3l5?=
 =?utf-8?B?eDdaVzJFSG0vNXVvb2VoUW1LUy80dXhac0xEZ09iWXZrQ3VRUElzQ3JHZ0RH?=
 =?utf-8?B?UVJRd0xaWGxmSnZ2S2tEeXBqWndNenVDS056Qmp1dUgwcSs3RmpqQ2M5Vm9H?=
 =?utf-8?B?WnNPREwvUnppOGNxY21Uc3I2aEQ5OXZCbXNrK0czMmY1R1F4QW9WNTdZZVNC?=
 =?utf-8?B?cDk3eitpR1pPQ0pCSHc5WVdXemUwUXRYTmorT3Y1Z0ZGTUJSQXhsOHhjcnBJ?=
 =?utf-8?B?R3pIWmswMk82NGRVVXR1RzFBL2xoTlVEa1JSR09HbDNqWm9LR0VKRER0WVBp?=
 =?utf-8?B?U0hJdGp6enR4anRvemlVblB2SjM5a2g4eUd1L1g3d1FyUWl5Y0NoVTMwMjBn?=
 =?utf-8?B?N2QrZURRVjdKSWtvMXB6ZVhadEhMdmxNOUdoa1UzZ2JKSGxrM0JKNWwwTmJP?=
 =?utf-8?Q?ni+S9TvupohD58pbcSmcCyw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c484ec-c191-4756-a53a-08dd02efff57
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 07:59:56.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDBsxT7YsuL9hLddoQXGnWA1fjCevIE3CgYQ3LhOaacMvakIIHOC5d4jxixt/ZtgW5v2zHuIJVdJpyRsU5IX0lsaYRNrhgt57xgV4AnPekM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471

On 11/11/2024 10:06 PM, Conor Dooley wrote:
> On Mon, Nov 11, 2024 at 08:05:50PM +0000, Conor Dooley wrote:
>> On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
>>> +  clock-names:
>>> +    minItems: 2
>>> +    maxItems: 3
>>
>> You actually have to provide the clock-names, otherwise you can't rely
>> on them
> 
> Oh, and drop the "rtc_" prefix while you're at it.

Hi Conor,

Thanks for taking time and reviewing this patchset.
I will list the actual clock-names and remove the 'rtc_' prefix in V5.

Best Regards,
Ciprian

