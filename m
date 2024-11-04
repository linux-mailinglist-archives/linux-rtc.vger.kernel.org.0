Return-Path: <linux-rtc+bounces-2442-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCBB9BADEF
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 09:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23460B21926
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 08:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AB81A7AF1;
	Mon,  4 Nov 2024 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DF/na4Xn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D9179956;
	Mon,  4 Nov 2024 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708539; cv=fail; b=R1anPRXh31wE7XGcf3PszfZueQymXiKw8M26MlTUn0sou85Ibl8MDvWrOAl2YwTOJEQcm7MW1amQ4hje3/eJ87geqdGobtEMi9cmFsUpgixtoJX0lnI6iPKmnJCa3CDEJOge/By5p1pzq50D1h+wevYAMGrQ0fiakzU2CjzNT3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708539; c=relaxed/simple;
	bh=KLa9TJ6/eQ0Z4wimt6I4+CZIUUBa41Z081DsJygW8Bw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jteDeT7FB2qwZxLOvzlmh4sQbWAPFAdL/n9YWnG304ZgA8ForLi58suR9Q0fFbFieUO50xfoNW4HMq9ScRARMBmp7oW4BYeizR3futO5DWw06JLgSxx2hkHx4Do966EqfZJQ64TmWzMA+F6/fBY5360zcPe3CFJ4FUy6vYAGpm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DF/na4Xn; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e027amxHJHXKm6WG3Ncd0NkeA3lcIkN7TXpGyFZ4flp2L6ogWVZyRUBi9gSjQdapncmdQrrYKZMSL3P20dx0OZcs0/74MhIdLPE8nH2ZBaSkwLeFgttWZ+1nErFOPdPKPVefHWv/sXL1fUddkHhsqM568aAF67lnkvpm/wWz2W/v135Fb/yT5raPC+jfGrOPCt2VYBJrsW3VBzcreZ6Gx7RftnTx9QEMNEXQTUSXcaJC6DK46E8O3zJ4sj/1hMwSBphBuqcCuLpfmJnPrwZjh/hICgazQo6HgW2+TfyEzjntCBjyc+KCrN2ZxMEvLl+E5RDsVjQguz3OklA4kzd1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZdCNBd+0Z1WAhEoqzPLBq1pHpizyJ4yWYnCNDGSkvc=;
 b=ttPQ4R6VLFDTRxw1iiWLIgUEHd+2v5NwlKFN0Z9KzL/hC/0+gn2agnPKrs2A0OpFTz7+VWR7n3z3hTpIpsO5U4yC27PhNnxYtoh35OgzrTSnWRxKMhv8rRKf+q7A9p739A6FGVRIwsTEgAK1bJnT0ouPAB4WRylht/bkVGt6gVrALJhijfS1R5zm0Tkb1ZIjr+kK3yQKqSaqVm69TaqYlmUjh8Y4wUn/5uH1LyTFDBmmumHwyNXh2EqCqf7OUmlKPBZLXKZ90tOL//4biHqtag2yKfpGUuSX7z2506JbdWacjTZpaU2EFDh2lJUqu70jWpJv9xgiutDHu5ErKWfiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZdCNBd+0Z1WAhEoqzPLBq1pHpizyJ4yWYnCNDGSkvc=;
 b=DF/na4XnRyaA0FCGfltVxD/1iyHApxh/MeFV4tt4Q/r/ckOj8oBAE2JQK4oK57y87Ri5oTvyqv1td9WHZYVpQ+hU5E0nQWxZRcSmaEMr/aCvC4PmeTbGOSvkK+ebGwkRR0QO4n8m4rnAZWEKYtrlcuORVYqtLsmVaJLztAwHIkiVnZZRsreku+NysxnKZYM4A8huelv6TuYzo7xh3loEkraJSTpbZclY0umLeu7PSLu2hRi++f+vWic29fTuKUIOIYGfgOQUS+YHvLNt6fsOuG9tD5+3YoVkCv/35FWSAxV4L1eTmE/bFCjOjmVWlkKWfo0YRIZ+fYucqRWA3irAOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 08:22:11 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:22:10 +0000
Message-ID: <0e3edc61-02c0-40cf-883f-9b8cd6019c49@oss.nxp.com>
Date: Mon, 4 Nov 2024 10:22:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 IMX Review List <imx@lists.linux.dev>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
 <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
 <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
 <ZyUWhLdODsNk7KTe@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZyUWhLdODsNk7KTe@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8cb3f0-b6a4-4b64-1668-08dcfca9c708
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amM5aTA1M1VTdjF1RnB5MHFWeWt4eDY4T0lUZDFHcDZ5QzlHMHdHU1hKVWR3?=
 =?utf-8?B?NmxuYUw3ZXhLWkFFNmFZRmlKSExMUW5lYm41Y2JRYnZjMHdQa2ExWU11bzVP?=
 =?utf-8?B?MTZyeDYwUUdTalJ1VGVuZFF2TGJuT0szR09kZXkrRDJraXcvTVR4bzh4dG8v?=
 =?utf-8?B?UzJjV3krUjhkT0ZCZXM0dXNGT1RtMU9IZWw4QXc3Q1B0WG93eTlFNnFsRjZC?=
 =?utf-8?B?WFo4dDNseERTQTd6NW12U3Z5amlLWk9ZdjVPS2doaFlvTjBvWjkxTmlvR3Vz?=
 =?utf-8?B?ejRKaTZsTUNabjZYZHVFdjhGWHc5ckxNQ2FiZ292STRvWlZjQmJhUHlscFEv?=
 =?utf-8?B?K0NqT0V5ekdDR0gyVHFIakZIYXpEcnRtMjRHNU55YzRYNDRMNGhaOHMvQ2hy?=
 =?utf-8?B?djIyR2RGeEtYQkU3cU9seUh6VUlrbGcyelpVUXFTTTZrS3Z5cm5VSGhXMzll?=
 =?utf-8?B?WEVlK0VUbXR2Q3R5dWs0cWxFQ1Q2SjlObVI1YVlJTmk4UXlZZTRyZC9qYzln?=
 =?utf-8?B?bzl1R2h0ZG1CcXdZWElYTTJSQUdUYzRBTE8vZklGZWY5N24rOEpweS9Pd2FL?=
 =?utf-8?B?M25vL0hhenYzcmhDQU55Z1lCbjZsNWd6Z3N4WnUyNWRJZGh3RW5sSllHdHZl?=
 =?utf-8?B?VitpdURoWHB6SVZlK2FEdzdHeHY0S3hlRlJDNzRZRVI5eG5uM2Y2Vy9ac2JG?=
 =?utf-8?B?OXJlcnpQT1hBOW1ua04yNjZIbkZ4NUgxK3lqSnZJV21GZHFEUWtCalptTzRu?=
 =?utf-8?B?STdPbnhrT1VXNU9MYnFXd2JnWGc4cUo0QlRlbWlSYUpxM0p3d3lnRkdNR25C?=
 =?utf-8?B?RnZqL3A1bnd3bjg5WEpUYjgycERyWEduWTZRK3h6Y0VXeDRnMFhqQncvZmdw?=
 =?utf-8?B?cWJ1TUd0czBMcDhRVGNNWk85bXplS3l4T21BNUZvTFZ1dlFoVGUxc0phblZ5?=
 =?utf-8?B?eGFBU1Bwd0JPM2VNZWljU2pOYVZFZ0hSRFFFdmlhWGlST1RUN0sxOG5yMGJr?=
 =?utf-8?B?NWFTblVmM1c3MFVBdXFoRXNCSjJ5K2szS0RnY05tdDQ3YVBSRUNtNFc3TklH?=
 =?utf-8?B?QnpWcmhmVTVnTmw3amdEL1ErU3lnTFNlbi9sYmloMXBwV05oRm5hUjZmcDFW?=
 =?utf-8?B?VWlyUE9GTGhoUktNS2hvQS9FMWEyUmpET1cvWUhvUWpQc3pGdGJWWEk4Z3dx?=
 =?utf-8?B?M2IzT1VKeVZpUXR0cHd0aDh0dGdSeUEzczhUbCtYYWhNaVVnZG5QQmVYTHhy?=
 =?utf-8?B?anBFOGQzam1BR3QwVllzNnFzU2lSTWwvSUllSzhMSVNTS240dE9qVlNGUHNi?=
 =?utf-8?B?cm42aGtIbkhtNk5PUnZwYlZzU29RVHZ5cm9Tb0dQL2pnL09Nc21ycjlUc1dL?=
 =?utf-8?B?K2twN0VTWGljamFEMDNxQWNHRlprS0tiajVCdi8rWGh6Umx5dGthSjRTcEhP?=
 =?utf-8?B?bmdpZVB5SHNEeWlId3hWeEp6Y0tWb3NWamcvbFhjRy8xbHcyenl1NU9tOWR1?=
 =?utf-8?B?aUM2QW5WM3VnTFNLaHZodWgyZkZ1UVA5NnU0QThjK0pEVWtwbDlPL0ZmcnYw?=
 =?utf-8?B?ZWlrTGNSN1kwU2trMDZLZXFxZjZHWkJQZy9TN3R5WTNINkxkM3FVRXVWU2lR?=
 =?utf-8?B?UzJPWnJlallCZ1Z1TzVFRk1taHU2TDJrbVlkTTltMWZqTDQzZkwxWVFJdDRr?=
 =?utf-8?B?dDRtM2g4MVZqTG5NT3g0TjRnMUt4Z1lPM2dNdDZHempoU0NKUU42YXZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHo1SHhUU0E4T0xSNzVrRm5weGVSMUhDOXJWVklWMzd2Q1A0bkpSV1drL2hZ?=
 =?utf-8?B?eXlkcy9sTmc5VnQrSks5UnFXaytXWnNBaUFQVnVVTHQxZ0k5djVzSXRYUGZB?=
 =?utf-8?B?em5uMnBWMHVjcHFHREYyUDlidk85bHhUU1JuZHZhWmdYTFFTVkh0N1JEY3N3?=
 =?utf-8?B?cXNOaWNsVFQwQzRlOFFzeWdXYkRkMWNIY0lUT01PT0FYM3pDNTNoRjJ2QlFP?=
 =?utf-8?B?aDFWaDJ1Nk1xQUtJcGZVdEkwYVBDODFqcnFqRUFPY090dVd4VFNwRHZaUU1W?=
 =?utf-8?B?aklGQmxQVko4UWttRHNMWlRmSDRnNzRONnhWN09FRk0yVFR6bVlkUHB4K0J2?=
 =?utf-8?B?amxobzVyaFkwYmdoTERjTGQ4eDl1a3JZdzR3eEFpUmp4bnZEcmxnTnQ3aWp2?=
 =?utf-8?B?cE0wZVZ5ZmhjTExsdEx2aU92dzUxK0tkWVY4VnE2QURGNlU1ejBHN0xibkxt?=
 =?utf-8?B?QW1UWUJJS3k2b3h4SDNQNkxBTEZwZlAzdUUrNC8wMktBblRlSkpHZlpzTkh3?=
 =?utf-8?B?VGg1NVF1amx4Y2l0K1NlUmNOWFllRnVzLzIxMFBXQWVsQjlNNjRtLzEvaTZl?=
 =?utf-8?B?Q3h6WnFPNjg3anA0VnZVZHlTZUJjZk50NzZzODluWVRuejdaRXhsbmVqVGNC?=
 =?utf-8?B?aTRzRFdOZzIwWkZ2cHdkRGNOVktxSHpaRmZjSGp3YXYwN01La09mbG5GVlBm?=
 =?utf-8?B?Z2JkSkliaFNPL2YzTVJrVFRMazBuTGZGUENyS2NMeks2L2Z6ZTBlb1pCREFE?=
 =?utf-8?B?WmdwUkYrQjV1Q3VaeGhWYTV3MytOMFZPRVYyenJtZ2o5dVdpZzNkM0ZURlhP?=
 =?utf-8?B?MjRTbVdqUW5pb0N2ZHZrVHRCckkvSDZibW92N09EcTVlOEhLcnBRdkFzV1dt?=
 =?utf-8?B?eFg3ZVJPSE9yM2xJRzlRNkM4ZUpWd1k4eUJ4WXNXODFMcFNIcEIvbFlrSWxW?=
 =?utf-8?B?b0IzeDVIRWtNcmI1bHBsUDgvQjdXSm92d3pRdXNiWHQ1cEdNRCtiNmEzUmto?=
 =?utf-8?B?WDhHcW55aWR4aWR6TENaMUdzOEUxeFNKV3g2OVNQMTlTU1NCRG9GYU1weEVy?=
 =?utf-8?B?Y1VxRUJHMTRCYS9qYmgza1lQMlJFZVN3cWhIbkVxcjFOTnpVZDVBdUdVejZZ?=
 =?utf-8?B?UjJSb3F2UVJ1ZU5uSU5EeUt6MmtzaDRZVVkrcHZtWFlzNW9PR0ZreHF3Wity?=
 =?utf-8?B?RTBVYmhDeG1OdCs3NkRZSCsxakIvbitRbW15ZS9WdUtobHlCWDRiZENNaFFu?=
 =?utf-8?B?RXBka1JGai9yc2FVckpKRnJZTmR3cnRUeGEwdU16ZVZweitOY04wYlJxYU1i?=
 =?utf-8?B?ZTV5SW5oSzdLbkY0U2p4ZkRtOSs5QWcrZUR0SGdVN3dZSjN4T2hubzJSdHRX?=
 =?utf-8?B?K1dOVStmcHBTTUhYQmpZRHl3QTVoWU1RekorcXZBdGNwTnZZK08xakEwd1JI?=
 =?utf-8?B?aTA2ZnVweUMxa3lIWEVUQmtXRTRYQ1BUbUJiQVNNRlluNW9WdXZXUUdCd1Fk?=
 =?utf-8?B?cjBicGhYSnNuek15MThpTzk0NVkwSTArTWFaQ2hpK2lscjNkb2hNWjFmNjV3?=
 =?utf-8?B?OXgyV0xFZWNuY2VEVFltZXdtN1VBSndJdm5CQy9MTndiQzhpTE5nNGlxSUNu?=
 =?utf-8?B?Q3loTjQ4c2JORVFSUnlSOExkKzJtM1gwaW1aMjVSU2hrSW04TW1MTGtLRU1j?=
 =?utf-8?B?Y09FNDZ5QjNCVGk0N2M2dnRwSDE3Y3p5UnNteEtkMUdWYXNWYUZSRXdHdk1O?=
 =?utf-8?B?d2xlRWNRQ0t0Zm0vZCtJTnUxUThqZGNiaWdsbnZzWko3Wkx4MmZWQXVBVHVK?=
 =?utf-8?B?aUpaazB6Q0FabnhkckFnOEhlZ1diWU5Sa0pGTHoySGNFeGx4SDkxeEFDMjkz?=
 =?utf-8?B?ZE1NUGJpcHZ0NHhWYzhveFRGOFF1UjRzSGRBNTAyVTVBRGs2THN0WVY4SlFm?=
 =?utf-8?B?RXZ1R2JIcitFc0psb1ZPYTlQNTNRUzJPTXNPenFiY3ZwbWZRZmx6RG5YdDlU?=
 =?utf-8?B?dFgwVFlIN3JPSHZ5WHBBd250eW9GT2RMa3NLaWhKYUJGSXVCSnFmSWcvWDY1?=
 =?utf-8?B?N2tpZ290K0EzMmEzYTZlT21EdGRZbEhpUFN2Y0ZjTzc4OWlZUEpQUFlwL1pv?=
 =?utf-8?B?NDZxeTRHUllsdllLSlZnY0tKNmp4YTVXdml5b2huKzB0bVgyZDZVb2RPY0hE?=
 =?utf-8?Q?43XB89O6tKh6c808d3nC4q8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8cb3f0-b6a4-4b64-1668-08dcfca9c708
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 08:22:10.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXeIs5WuzKPBmXJDk4EWQUDT7K23PXXZrcst8rUKq0goUV2+Lmz4dthR+4MB9zHu6IKxQBKHlFROpkHBJymWLzB/86RlyOuvnAGvQ/V2tKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

On 11/1/2024 7:57 PM, Frank Li wrote:
> On Fri, Nov 01, 2024 at 11:29:24AM +0200, Ciprian Marian Costea wrote:
>> On 10/31/2024 6:39 PM, Frank Li wrote:
>>
>> Hello Frank,
>>
>> Thank you for your review!
>>
>>> On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>>
>>>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> ---
>>>
>>> next time you can cc imx@lists.linux.dev
>>
>> Thanks for your suggestion, I will start adding this list.
>>
>>>
>>>>    .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
>>>>    1 file changed, 99 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> new file mode 100644
>>>> index 000000000000..3694af883dc7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> @@ -0,0 +1,99 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>>>> +
>>>> +maintainers:
>>>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - nxp,s32g2-rtc
>>>> +      - items:
>>>> +          - const: nxp,s32g3-rtc
>>>> +          - const: nxp,s32g2-rtc
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#clock-cells":
>>>> +    const: 1
>>>
>>> Does your RTC is clock provider? why need #clock-cells
>>>
>>
>> RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
>> different clock sources (parents).
>> Now, as suggested in previous reviews, I've switched to using the CCF in
>> order to implement this hardware particularity. In the end I've resorted to
>> implementing 'assigned-*' approach which while not mandatory as per proposed
>> bindings I find it quite scalable in selecting clock sources for the RTC
>> module compared to the first iteration (V1) of this patchset.
> 
> Any link of previous review?
> 
> Frank
>

Please consider the following related reviews:

[1] https://lore.kernel.org/all/202409121403232ab1295b@mail.local/
[2] 
https://lore.kernel.org/all/6659aa90-53c5-4a91-a9f9-01120c88f107@oss.nxp.com/
[3] https://lore.kernel.org/all/20241016160823c22ccb22@mail.local/

>>
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: ipg clock drives the access to the
>>>> +          RTC iomapped registers
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ipg
>>>> +
>>>> +  assigned-clocks:
>>>> +    minItems: 1
>>>> +    items:
>>>> +      - description: Runtime clock source. It must be a clock
>>>> +            source for the RTC module. It will be disabled by hardware
>>>> +            during Standby/Suspend.
>>>> +      - description: Standby/Suspend clock source. It is optional
>>>> +            and can be used in case the RTC will continue ticking during
>>>> +            platform/system suspend. RTC hardware module contains a
>>>> +            hardware mux for clock source selection.
>>>> +
>>>> +  assigned-clock-parents:
>>>> +    description: List of phandles to each parent clock.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    description: List of frequencies for RTC clock sources.
>>>> +            RTC module contains 2 hardware divisors which can be
>>>> +            enabled or not. Hence, available frequencies are the following
>>>> +            parent_freq, parent_freq / 512, parent_freq / 32 or
>>>> +            parent_freq / (512 * 32)
>>>
>>> Needn't assigned-*
>>>
>>
>> 'assigned-*' entries are not required, but based on my previous answer I
>> would prefer to document them in order to instruct further S32 SoC based
>> boards which may use this driver.
>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - "#clock-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    rtc0: rtc@40060000 {
>>>
>>> needn't label
>>
>> Thanks. I will remove the label in V4.
>>
>>>
>>>> +        compatible = "nxp,s32g3-rtc",
>>>> +                   "nxp,s32g2-rtc";
>>>> +        reg = <0x40060000 0x1000>;
>>>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        #clock-cells = <1>;
>>>> +        clocks = <&clks 54>;
>>>> +        clock-names = "ipg";
>>>> +        /*
>>>> +         * Configuration of default parent clocks.
>>>> +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
>>>> +         * 4-7 IDs are Suspend/Standby clock sources.
>>>> +         */
>>>> +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
>>>> +        assigned-clock-parents = <&clks 56>, <&clks 55>;
>>>> +        /*
>>>> +         * Clock frequency can be divided by value
>>>> +         * 512 or 32 (or both) via hardware divisors.
>>>> +         * Below configuration:
>>>> +         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
>>>> +         * Suspend/Standby clock source: SIRC (32 KHz)
>>>> +         */
>>>> +        assigned-clock-rates = <99609>, <32000>;
>>>> +    };
>>>> --
>>>> 2.45.2
>>>>
>>


