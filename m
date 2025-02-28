Return-Path: <linux-rtc+bounces-3315-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C5A49338
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 09:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998C83B580B
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456C4244EA1;
	Fri, 28 Feb 2025 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ud7B2F1u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBE243958;
	Fri, 28 Feb 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730713; cv=fail; b=W406Phc0z5cxRDhILYEJT6Kjolx6+GGzTS+vNqdMxfx0olf5n/k8vKok3VavsBkGS0Ig54c9BNacR8izdtem2mTt1QTwq3b/PmzNHGVCbh8VIbgW/Yfera1OLEilOYojhyftj3MxvHd2qCtYOaZZiP+/SxQ4PDoXaEY9Qs8mzwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730713; c=relaxed/simple;
	bh=amfUCqpg57BOJVr+SdMTLE2E1b0oXsJjle2PGz4OQS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W9a4hovcgbxOJG1jxxQjTg2yj7zpczNCG6e7+uP/wyfVnLngVREBPWs5vkcK4Vxx3z1Yyal+t4YuXk3egndDCuFmTKeGcrgu9mI4CgTF2a8AQRwRXdQpqi12j+UBayqXww+32xyqyLf8jMp8uu/L9Or5meEufbo3XCqP2NoJBZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ud7B2F1u; arc=fail smtp.client-ip=40.107.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhUG9wwaaCQF2zaV9uumKq0DdEDL1DxZ2ZUuRNpauZv9lZ6zb7a1dmuIuk7hNLxJKDPUbKwK7tRxr1OoVdIcfos+CVA5LmcRb6hzKQiQ1QSFt7LCwlXVi9uyatYpX6e8BglnHnGaW5O/sYP8APkkiBSKdsHhrfoXhe5ezf0hVk3h13xGuj5Ts+LBkPBim6R4v3vFQjAYPpvZWEI6nTquD6bC81gDi5u3hfZ6Tz3YjI7vdnR9R3ENaTeb0NZHePSeFlaUS7GVK0PEBlUa1Dsqv7KRulEG6qxdgv7cLmDXZ8w4YAyMy1Y4T7LZRi74Ri78c67fbYFqe6OWRfBQFb8zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C/GgSaSd+uaLW9vO/Pps3MHb+u9D8mZakF8Rg7ADFY=;
 b=Ho9wfeRVBtTHzkAzlyPc5tEB3xLiDavQZ8CTsIW6paWhzgfrHNziIIV3AkH0dCPVQmV/rlLAdH9e9SKwyXU4BQSYT7ncrDm6+xUUJmQsp+xFmdlOVj2GFYiYxmI0BMrakzfdaHM4foJcvL69t7buZ6BzRJ9PtxX58BjM8s0DDeFezwVIs7K3K3fETv56kvsgG+2F8vUevKwIIpk5qyY9sjB3fGPAeH6y3VMzeso+vtXEAsdbzAxhOMbPfVKHXETDMx97S+WxZgdLUbuS4KN7wuitAdgGoZCa6skJvQ9L8Tfvv93W1xvbGKuvezBzYZ3/y2C0gqpIlkRPUMuDCl6p4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C/GgSaSd+uaLW9vO/Pps3MHb+u9D8mZakF8Rg7ADFY=;
 b=ud7B2F1ujQgdS2W6KpP+NWG4/JZYrBm6kD+c5A4JRUGsUUYz66C/rQ6mpj7EScXniNueADfLq1O+/69iD99IkZkN0E7a7LoZPnyCW86vdiBPL4ThvJfBiKMyZkEW4eMP3xUG1JD3ZHhL6dI32H2HADzHOSRhI5rEyVNdjxNz95vfaeJDKveXX2sNxMC+YPLZCH+Iu5MrENzOikCL+SVloHY954tI8Um/EvBiP1bPQ8HPUCOdtUSFxrlHx8Q14OBq3HJVJgm12mtHJPbszYIUKaDznHIsaIrdI2rDWxVrYkX3NvzDFCSbiJ55xUfbJwBv0iPWJvcRKW4nsLRaXrtA/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI0PR04MB10688.eurprd04.prod.outlook.com (2603:10a6:800:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 08:18:29 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:18:29 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Fri, 28 Feb 2025 10:18:10 +0200
Message-ID: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
References: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::7) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI0PR04MB10688:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1eff66-3c05-4832-da34-08dd57d07b0e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjdtaElVZlVvRmZGTDMvMzBXbnpZL00vQ0hubFVmRFZCU0lOVGNWaXl4RzZj?=
 =?utf-8?B?Ym0vcHo0MTBZK0FBY2RsRy9rZWRZZ1RhSTBkb09RS0plSmNqRWR5ZE9lUHBY?=
 =?utf-8?B?Y1dCMGpqOFM0VmJVSTNOZ2RIcVl3elVUU2FIKzlDa1JYc1YvVjNxcms1TkYx?=
 =?utf-8?B?WmVGNG9nZnFYbTJNVmp6Y0dvUk1LejRJclhlamdnQm84NEFvN1d0dGZCRHRM?=
 =?utf-8?B?TjU5ck1mcFBLZ2l6YjdKN1NsSVZhRmxiQUFpdlZtK0dPSm54eGg3aEtUN0Ru?=
 =?utf-8?B?Q1JjYTVia01POGZzUWtleU9vTWZBelRVWnZoNWFENUZocjBsMzZaSThsTDdD?=
 =?utf-8?B?WGFFYmFCeGNUd1E2eGl0T3dHZHRpSnhDbHRnQXZpd1I1ZWJ5Z1JDc3k3VlRL?=
 =?utf-8?B?VE1UZXROZDJPcnRCYVRVU200b09QaEhxUDhvblhxZkxRT1pPTzd4UDhQdXhr?=
 =?utf-8?B?ZERCQUk5S21LQ01URHFYQ0dkckMrU1g4SFY4elJSQkpHajFOb2V2N0w5ZFox?=
 =?utf-8?B?aXNVUktQYTQyYWZ4UTh0NUJsVVo4NnBaTHZiNTVmeHQ2N0lJRnYxYUozVlMz?=
 =?utf-8?B?MnkvT2kzMktvV2xFNUFwNmlFSkNnZlRBa0VZQU1uK0x3S01zRVRzckxIaStM?=
 =?utf-8?B?L2RIUWo1UGg4d1A4aHNXc3pzdE1WYTNIRmtSMHFzRUNDL3o0dDdSTG9mbDY4?=
 =?utf-8?B?MTFQQWZQYzJIWDZ0MVZQMnUrTkU3a0tsZ3B1SmpNekVqaVZMSFJzZ2YxeHJo?=
 =?utf-8?B?V2NKQTZ0aGk0ZDZEdlByS2hCcngveEtZZDNZZ0o1Q0VrSWdKV3BKS3diWkFW?=
 =?utf-8?B?T0xHMmkzb3NHaHc3L0JXLzgrYjBSd0ZSZDFneEZGMDIxNDdmL2t4bzRzOHFF?=
 =?utf-8?B?Qmx6ZC9rTVNUd25vRWFUd1VFWTgrZUwzK0VpZ2FpQW42ZnB6VUtWUksvSnVt?=
 =?utf-8?B?TEhpb2NGUzhkaW8xOVd1N2tEVWNGWFlOOHZndG1FZHdIN1ZCU1ZRNHowWWxr?=
 =?utf-8?B?dEFBTWRQK2lPODd5b3VoZm5LZkFqalhwR1owSG1jRHZ3YzJHalVJK00rY1lK?=
 =?utf-8?B?TkN6R2hEdkJieTBuNkZ1REhldVZ2djFLV3B3Y3JJaHc4WFUzbDZQdG0za1Nh?=
 =?utf-8?B?MnpTSUloQ0N4Z3RkSHlPNGFDRVlmYTFHTXVieUtRc3QwMm1JTWJETGV5VlVB?=
 =?utf-8?B?dFcyc1FZdndUWGdOVVpSNUVpclZKRTJDN2l5Vm44cFR4ckVJY0RaZDNKeStP?=
 =?utf-8?B?Z1RsS2lwSWtFcVgvZ1BuaVRXckhTczM5YXp1WXdpSXpDU2ZLYitkRmQ2TlZN?=
 =?utf-8?B?UE41YVZUUjVCREovMEp3RmFpam1URUxHNlhZYXhSOFAybXFjL1d5dEg1a0VL?=
 =?utf-8?B?aS9IMEZrMGRsaUx6cmRrQ0FqNUFLM3M5SEUzUmJackxGMVBPOFFoMzdSRlpV?=
 =?utf-8?B?M2Z4cXE2bHhtbzNQMGlRbnJkSFhicUpIVCs1R1lQQjZ6SHdoMEdGMEZhUXo2?=
 =?utf-8?B?WEp6MS9YNW8xRlJSZkJNZmpMNGFVSGU4Q3Z4MlI4RUI3UnBYdVZrTUF5SHZO?=
 =?utf-8?B?Q0VBTkwwQnA4K1I0N1dwelozZDNqcXMvaG51MUk1N1pZZjZtbHlWQ0ZZSzEy?=
 =?utf-8?B?a0R2dHNJVEttNTEzMGJJOG8xdkF4V3ZHd0R5U0tHZkZWTENUSHlnL1ArdXla?=
 =?utf-8?B?S1pwWVNmeUU1VmlDbW9GUHlvMjF0d1RGQ2RBdHZ4czN5M3ZQSWExdFJlMXY1?=
 =?utf-8?B?Vm5ZU1RKc0RvVHRZemxqMVVCOFMybU5INnN5ZGxzbXBwaVB0SEIvSEpKSlRr?=
 =?utf-8?B?QzRENFkxV29rZWdRaFAxOEZMWVlxMlpQNFNoNzNCcGMwVjF5dHRpcCtzQ1hT?=
 =?utf-8?Q?81wEaOETtIpJ8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERicVRJQ0hRMXR0RXV4SmhsdTBJOGxMeEh6c2tnSTlKbUM1bzJ3NVlrTmNz?=
 =?utf-8?B?d3A2cGsrcVpzZ01vNDFBRDRhS0YxRXVZb0pEOVZLTnpudnFLbjVRbi9jcWwv?=
 =?utf-8?B?TWloYWo5UUZHWW5FbERvcjhWcCsvRnZ5MHVYWCtkTUl3bHlEZHFWQXFISWp2?=
 =?utf-8?B?UndSWko1TFpSN3V0dTRMbnlwYVl3cG4rNHQ0ZG5Fd1YyVHNxcmltYWNLRGlm?=
 =?utf-8?B?ajVFVDkrdU10SmVEQmtZZHAyQnRlTHppMlBCTDNMMVRWeFJNWHVKZkJFRmNz?=
 =?utf-8?B?SG1oOU04TTNVTjllSVFNdlpiVTFQbmhDTE5nR3loYktOdkkzdHFZNEc5MkdB?=
 =?utf-8?B?RHdYd1ZaNVBISDZzNUlHYjRjczlFQlVVR1ZBNU81QVk2NW5obTB1dUhtdXFk?=
 =?utf-8?B?UG0yUm83dTh6ZGczazQ1cTVDNUR0V0tyaGgwSGc1em9MamlDMTZSWkpBMjdO?=
 =?utf-8?B?Y1d2cEw1SS9CSmZ0dGw5Mk1BSjNvMFZlWkx5cG85TFBka2tuNDlMQ3p0emhr?=
 =?utf-8?B?bkgydmx3U1dWUklKcjVzcFJJNGIyMlRJRlhVaXBsSElPZW1pVXp6N29sb25x?=
 =?utf-8?B?M3g4NlVEbnVtTHN4R0V3Z1ByQkhYSG5SNWhnVVQzaE43Z2xYZmVDQlNQODQx?=
 =?utf-8?B?dThFNThJV2dBOFk5S0p2dGJUMFlkMGtUelRDMzhMYmpRaW1PVXFraEpIUm1m?=
 =?utf-8?B?ZW9rWFpsNXVlNHhESW5ZdEpjMUVFTUU4cER0aDVvUVNBZC9LTTZNWHBqcEVq?=
 =?utf-8?B?NkRtRFRyanFtVVNBR3lDOUZ1Rjc1L1doaEZVMEtsWGJscFRDYjdQSFIraHli?=
 =?utf-8?B?MGM0bU9wR21FeUFsT0dpR2xZNTdkT2NaZHlGMlQxUHUvUnpOZHJBMjIyclZU?=
 =?utf-8?B?Rnc2eG9Sa3M5UmFCbGFRUHJWSXRVdlpnVzlxc2JnSG54d3k4Q01yUWp4WEdi?=
 =?utf-8?B?d2F4TEp6TGpOdFd4KzdybHNiS0Y5NW8xSTdUQUQ1L1JmQ3ArWkRSQjhHMnhY?=
 =?utf-8?B?OWFOaWRRd2UydFlqRkF4NzdZVVdEWVQvUXRXSnFZeDZTcTJBSHYvSmhpR1N6?=
 =?utf-8?B?TitmMllsN3crQXVpMTB4dlhray9lR2txZWM5ajFwS1BVZWFpeDdlWGJaMXEr?=
 =?utf-8?B?SmRKbWZWL1FxSFZSYlBLeXlMSk9XSWNtYmdpRjZQR2hjVUFvaUFZbUpZOUdU?=
 =?utf-8?B?ZTNiVVIzUmpGcFhDQXlTWE5FZFhUZ1Y3MjN3Qk9tSkZPMURtSXBTcldQcEFH?=
 =?utf-8?B?N0ozUStPZnpudlRFRmNSWDdBemNPL3hQZHhmVkdhZGhEZ3ZVQU90bnl2MzlO?=
 =?utf-8?B?SGZpV0FtL1dtT0tVaS9LM0YvUSt6ek1zNW8rZWYrenFia1F1a2xxS0gxT1Zt?=
 =?utf-8?B?NERCaUF6dXZweXBOVWpubVhVU0FqVDVDMmlFSno2MmZSWHpPcTZMM1dzTXVE?=
 =?utf-8?B?VG1tZm96UE05RExEU25ROXFvSTZWKy9IaEtsb0hqSkY2ekFpWGRyY3lGeEtY?=
 =?utf-8?B?Wmt2UWU3ZWNtMnArc1p2OVgrazI4aTVoK1Y0blNtL2FHQjFwR0pWYVlUU1dj?=
 =?utf-8?B?ei93b0RVVWFXRm1naWNwY3ppNlc5czM0bkZFRHZLazNyT3hINVNZYmpYc2Jn?=
 =?utf-8?B?WW45Q0ZGR2Fqb05WbXA5ZjU0YnpZYVZ3S0pjYncxSmM2VnBSNGIzK0RjSk0r?=
 =?utf-8?B?ZVhPYTlkTnBsSldDQ2VrMWNsNVJCbkUvdlVuZUJOVUdPREl4YW1rTjI2a3Bi?=
 =?utf-8?B?VVJSaEEvVmowVG1aWGxMOTM1QnFuOVpZeUdoWStPYThvNnU2SkdOTHBiOGpL?=
 =?utf-8?B?TVBDQVU0b0tCVm9LRFRhbWRGbmwyeTRtOXo1SDlvcnQ4Z0c3T013Q1REYW11?=
 =?utf-8?B?Y2RNTHVUbzhiUVIrTVNheDFoWVE3a1d5NVNnWEMzeURrdHVZUEdISlkyVkly?=
 =?utf-8?B?MVZrdHRjbElQRnhjSnBjV0w0MG9RMmwrUVNaVVZIclhYSXJxS0s0ZnU5aU9o?=
 =?utf-8?B?WVF2UkJBNnVIRGV1TG5wMm9DVUdudWpYZVV4UlVyVExFalZ5R1NNWXdPZnZp?=
 =?utf-8?B?SlRJUS9sNlAxcit6RXlYeEFEVlM3UE9Ha2dnYkRXMUR3TDFWdW5oOXU3dEov?=
 =?utf-8?B?ZnF6LzkzbHJNSTc1ODR0TSt0dnBteFhMR2tmQzUvdW1oRUF5bEJyZHZyS1Er?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1eff66-3c05-4832-da34-08dd57d07b0e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 08:18:28.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fr65BwhI48Si/3DhYheMWRWanIhMSI7c653j5mivRogfBjzh8BDNRThbfc8KyzXADTeqtIfDnS1pT/i8wDTNzkJlgE3lW0kqIjTZQeLmrE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10688

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It can be a wakeup source
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 386 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 398 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..510dc2db745d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
 	  This driver can also be built as a module. If so, the module
 	  will be called "rtc-amlogic-a4".
 
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
index 489b4ab07068..e4b616ecd5ce 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
 obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..251d86ab3046
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define APIVAL_OFFSET	0x10ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_INV_API	BIT(17)
+#define RTCS_APIF		BIT(13)
+
+#define APIVAL_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
+ * should not be used.
+ */
+#define RTC_CLK_SRC1_RESERVED		BIT(1)
+
+/*
+ * S32G RTC module has a 512 value and a 32 value hardware frequency
+ * divisors (DIV512 and DIV32) which could be used to achieve higher
+ * counter ranges by lowering the RTC frequency.
+ */
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *const rtc_clk_src[] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	u64 rtc_hz;
+	time64_t sleep_sec;
+	int irq;
+	u32 clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 reserved_clk_mask;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512_32,
+	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
+};
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = readl(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_APIF) {
+		writel(0x0, priv->rtc_base + APIVAL_OFFSET);
+		writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
+	}
+
+	rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * The function is not really getting time from the RTC since the S32G RTC
+ * has several limitations. Thus, to setup alarm use system time.
+ */
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	time64_t sec;
+
+	if (check_add_overflow(ktime_get_real_seconds(),
+			       priv->sleep_sec, &sec))
+		return -ERANGE;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtcs;
+
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcs = readl(priv->rtc_base + RTCS_OFFSET);
+
+	alrm->enabled = rtcc & RTCC_APIIE;
+	if (alrm->enabled)
+		alrm->pending = !(rtcs & RTCS_APIF);
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	/* RTC API functionality is used both for triggering interrupts
+	 * and as a wakeup event. Hence it should always be enabled.
+	 */
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	unsigned long long cycles;
+	long long t_offset;
+	time64_t alrm_time;
+	u32 rtcs;
+	int ret;
+
+	alrm_time = rtc_tm_to_time64(&alrm->time);
+	t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
+	if (t_offset < 0)
+		return -ERANGE;
+
+	cycles = t_offset * priv->rtc_hz;
+	if (cycles > APIVAL_MAX_VAL)
+		return -ERANGE;
+
+	/* APIVAL could have been reset from the IRQ handler.
+	 * Hence, we wait in case there is a synchronization process.
+	 */
+	ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	writel(cycles, priv->rtc_base + APIVAL_OFFSET);
+
+	return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc;
+
+	if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
+		return -EOPNOTSUPP;
+
+	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
+
+	switch (priv->rtc_data->clk_div) {
+	case DIV512_32:
+		rtcc |= RTCC_DIV512EN;
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		rtcc |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	u32 i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
+		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->clk_src)) {
+			priv->clk_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->clk_src))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
+				"Failed to get rtc module clock source\n");
+
+	return 0;
+}
+
+static int s32g_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	unsigned long rtc_hz;
+	int ret;
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
+		return PTR_ERR(priv->rtc_base);
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return PTR_ERR(priv->rdev);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		ret = priv->irq;
+		goto disable_rtc;
+	}
+
+	rtc_hz = clk_get_rate(priv->clk_src);
+	if (!rtc_hz) {
+		dev_err(dev, "Failed to get RTC frequency\n");
+		ret = -EINVAL;
+		goto disable_rtc;
+	}
+
+	priv->rtc_hz = rtc_hz / priv->rtc_data->clk_div;
+	if (rtc_hz % priv->rtc_data->clk_div)
+		priv->rtc_hz++;
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_request_irq(dev, priv->irq,
+			       s32g_rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->irq, ret);
+		goto disable_rtc;
+	}
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret)
+		goto disable_rtc;
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
+
+	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
+			       &priv->sleep_sec)) {
+		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
+		priv->sleep_sec = 0;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	/* The transition from resume to run is a reset event.
+	 * This leads to the RTC registers being reset after resume from
+	 * suspend. It is uncommon, but this behaviour has been observed
+	 * on S32G RTC after issueing a Suspend to RAM operation.
+	 * Thus, reconfigure RTC registers on the resume path.
+	 */
+	return rtc_clk_src_setup(priv);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
+			 s32g_rtc_suspend, s32g_rtc_resume);
+
+static struct platform_driver s32g_rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= s32g_rtc_probe,
+};
+module_platform_driver(s32g_rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


