Return-Path: <linux-rtc+bounces-2234-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC39A3907
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 10:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1CF31C247D0
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129E318FC67;
	Fri, 18 Oct 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UWg2l760"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD018F2F1;
	Fri, 18 Oct 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241229; cv=fail; b=TNBiSP193bfpE9vqP4kIvNUAhMDSzdt7nzsVhKP1OiC3gzm4ESv8AH2WrruiTtXw9y6F8bStkdr4FRFNqz5q488nd8+mEDXbcfXEkhqSSZeahSOyFY5/LfqhdkGy3zxYxawneDh88G+iJTXUJjGmHGtCYY5P2R2q5e/987ctl/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241229; c=relaxed/simple;
	bh=G+ba+QPSYfLMiniiRcyOGPF0g7Gc7eqheJ+YUfwwTXU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RLaYtNVi9T1+D0CDmiKZIjB2HbMRCFBEMhzW73ja9f0GB/KhYBzgYE6JFlahvDY+yZiHNdUPioXgd9oCEPqcTZ8JA/6+exSm0dkDdQC6mw4oYeblfrpsQqC5bUHfLsat5j01yd4Vm+kbT7d99EpnCBMg/IPWlwWt3yYL0iBYfPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UWg2l760; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6rJa9PbZaKgj1ZLbDyn4EbyYmaaOmizC1uuG1g7oZGbTn5GOhGstscSCT0UT6xVcWC25TJYhpUG5ECWIf0q9DdjciS8SRpr9JwTr9fflF0S/fFxz6IvFYwPLYizmDeJktaZq/Wk0ifb59v091JkCTYbA+1PhogZDQK3cfOm/si7Hvh/6JnPXBdpxYt8Pl3kqlpepfLVa8a1Yx33KNZhbrqwDgxmc/MqKkIKm0oH9fHbnbqeBgnKIfsIdTDgvqA6vFJ0nNgBIO1FjTVCeLCH0DL0S71eHESZLbAElQvmLQS+BKAVnKoIScABcvCeOdv0Y9cvp+isRtJdCOhUbUH88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GndECLuCpUxB9KZfw+oIElyzGQQW9P1ue9GIu+dx5Mc=;
 b=Z8MkQPmVkhNFIk2lcPiRrvaJht4lpFFxGMNttV3RXQSHL+D+t3ZHQRpzJTYRjilVVxrEbBq088ZMIl+JH3fZZqFCWy9CtdHAl9iwPGu9sSvN3dLUog5/xqA+gbdvPsQ95dICKjf4L8mQaD6Yh5EoKrlSFvbKZifnPW2Qb5pZ3DuxtsLCS36QMtA+so4IPIp4iZRBdE94IeM/mcJDoWgZCUna1PSvfJO9RucKzuT78jdo/Am+wnrvIZwTpj1nqSSkF/cU8LiMjSl+dItVpnuv6+k9MzDyIaF/06o8zjh7u2HCLz+HqqTruZr97oBF26YgZg9YlPZ/UJoFKhHB1/scnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GndECLuCpUxB9KZfw+oIElyzGQQW9P1ue9GIu+dx5Mc=;
 b=UWg2l760yFOYQOEzSFsQsF1CAJtclT/fup/b9bOwLE++TPNg1ZvHdZ7yaVg2WkMcaTVSwAluF5IWDjYQ3FEEDlK0AdGPYmKRhWdN/Nq04N9PB+wgBY0mjU5whCeayEmTCXZAqemPfWA0ieVZxB2b1I9+O+mPZJxOsQVS8dDzbN+uVUNZXFHqUC9klm0bIqyXvT6afjKFYuwQzekg3O1jm/4Z6eGfc1E2ONQV1dchLpTx9WyujGO4Ca5x578TzJco/agEKmIXGlSi2Tr3pyNT1ix3x4r0l9YDTGxUR/IIcpxvwYlV+aJwclAw2zVzBWQtxdON3D/31lVdpqZCnYaOWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 08:47:03 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 08:47:03 +0000
Message-ID: <c85933b7-e382-45c1-9491-1a791e8b7b91@oss.nxp.com>
Date: Fri, 18 Oct 2024 11:46:59 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
 <turfqcpjz2dxrng73v5iphpsh3pvhhv73guo4m2vvzplqycsa3@iyrzsimppo57>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <turfqcpjz2dxrng73v5iphpsh3pvhhv73guo4m2vvzplqycsa3@iyrzsimppo57>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::36) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: a1438ad1-9c9b-486c-9265-08dcef517022
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1drcmhxK1VwMm5ObGxLNWpuT2hjZHF1NFV0ejFHdU5zR1lxRzRyQ2F6TDhj?=
 =?utf-8?B?SHA4UkxONlN4UUUySk5wNjk5eWdyVmFZcEozUFZObDB0YmNJLzI1T1VZcDhZ?=
 =?utf-8?B?NTlWV1ZkOG4yY1ZXT0J3TklXOW9zVmozaERJWU9MdGIzVDllNWo1bitPc3lw?=
 =?utf-8?B?WnJYaFlLTXpSeDlmNC9UZWtUejNsbW4yTjR4cEVyOTlyQXdUL1RCcmJVdFAy?=
 =?utf-8?B?MkIwZjVjbnViTEtrNUFFZlNtNUQzaWhXYTRiNDVJM1hlbVNvMnp2OGkwNWRB?=
 =?utf-8?B?VTM4ejZYVjFiUXFqdmY5YlR1aVNqU3JHZjU4Vjd0NFVTaVljN09tcHZmU0Vw?=
 =?utf-8?B?WlNhUG9DT3F1Vm00QXdxVnp4UFBqWm14M3YveU11RFlQRFlUZnQ3Z2wyVVFs?=
 =?utf-8?B?L1NuNjFhbTdmN1FYYklqbldFM0VZZVdXSnc5ckZ4MG15R29DbjVyNFVlVmwy?=
 =?utf-8?B?ZklvOUhnMUpHUFAzMFpxV21CSmlhQXJYLzNMRS8yd08wcnZRTm1sZWVwaWxs?=
 =?utf-8?B?cmtMUzh5MXdYY0JDQjA2bC8xOFBLWW8zWlFweXhwMzJoc0dQV3F5TDNOQzlr?=
 =?utf-8?B?UCtiMWV1NDVieEttU2U1MnRhNXBGbWx0TDZyREdNQXBkbEloT0cyVVRhN2Ra?=
 =?utf-8?B?czJWS0tkcVk0QXFiMDFucklmanVDKzRUOXdxTkhZRU5FUE50cnZPdjRaQ2pM?=
 =?utf-8?B?MWtPWWU2ckhXa0ptU3pKaDgreXVDSVBqWU5OUlJzSHovd3VlWHNJbGFFNnp4?=
 =?utf-8?B?TG5jWXliNGlHSndKM1MzenRiVm1iVHZ5SWpwMTVrQXgzUGJWY0Z6cUtXOXpt?=
 =?utf-8?B?TjZaeDBKY1VxUUIyZjQwdmJVU1VmcGd4U3ZGZVBUTy9QbjlsZGNMcjB6OUIw?=
 =?utf-8?B?MFQ5S0pKYXJ3YVQ3RzhFaW8zL014Ui96TmIwRENpT0h3MjdSVUtYNGp6aXNG?=
 =?utf-8?B?SzJxcDVXcGJ1RXJJZndObjFkWkZCZVkvSW1reHgwdURDV2lpYjdvVVVCb0Q3?=
 =?utf-8?B?ZnZHRWdKT0cvUGRsS1NIMDlKblgxL0NtNkdJWEhtR0VVQmI5TW1JamdOdEhZ?=
 =?utf-8?B?djAyYmQvZGxUS3Q3VWU0bGw3dTFIdGVhUWF6MW5hMlRqWmtINEJsSnV1WVlx?=
 =?utf-8?B?K2RPbWVYWUNzZlNGeWw2dnZKbldpeTRicnYybE1xUFpaVzQ4NUlWWVBTeXF6?=
 =?utf-8?B?azgzMURwbWhhMUNOaWFkRjVPZjloeGlJYWxLRXV6WW1nTkxZaUxlQlBHTFRX?=
 =?utf-8?B?RkQ4Q0xkNWtPR3ZLdUVWYVBPMlgrajJBMjRNbVlRNTNMVk01ZmFreG1xdFRK?=
 =?utf-8?B?Y0dDK0ZCeEpDNk1PMDByaThNTHFoNmFNNStNemo3TlBxUDFtNWIxZTl2VFRD?=
 =?utf-8?B?MHdyUUxkVTFjYjRYYXIreUhrS3l4YnhKL2JJbjVHdnh5cmU3OFBsVjBybm5F?=
 =?utf-8?B?M2FyNGFid2tQQ2dPTTBnZVc5aWtlenl4SW1iU1l3WVVucHVhN3A2ditHeExn?=
 =?utf-8?B?M3JBdnZkWXFRNXlMdUFZYXBrVm5kQVRtRHo4VlpCbDdoWTBIU2liUHdidnBu?=
 =?utf-8?B?R29vNXM0aUVaTWdIdEFSb0tYOGdlODNNa0UvRVZFWXNWQVAxeDN2QnJHVlJW?=
 =?utf-8?B?Z2ZjdFhsR2M2c084RlJUNDhMNDN5NHBZdDNDYmhGeUs5R2VjU1dnNVJYZHl6?=
 =?utf-8?B?em1lcTFQNCtjUm5qcm5RMk5zM05TZkg4VTFTVlg0MzlJQWRQdGFpK1hzSU43?=
 =?utf-8?Q?x/9s4gG1u0J/EeeBXGWFGLZxqAIwhpyuVY+ZOvX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0l2NFdMSVk1TmlXOHFXOEFzNmhZNlpObDlteHpkSFB5Vy9GYTl4SEk1bXZJ?=
 =?utf-8?B?MjZpT0ErRTVaRkpNWUkxZXBJZUR0RWxEcUE2UjBQQ2EyUjUydDhWTkw0enZ5?=
 =?utf-8?B?bWtUVXpMTm8yTUtiRVI4RHdseXlLcmRFK1VrTENIV2lDUUJEZ2owZ1AxMnF5?=
 =?utf-8?B?Y2tPVTNraStGd293UHdKbGgvZ1RpbHRGYjZrTEgwdDNyNE1oUGs0OVB1aXdJ?=
 =?utf-8?B?T2ZldG1oK21jbjlnbk5kZHBVTE5IUkZTQlk0UEhMQkcwTzkvT1ozdHpFTVRO?=
 =?utf-8?B?U3BVdnZsN2d6UU5qaUt2MloyWDhOM0pRVEZac1ZzMmlFR0FyWEZJUGkzTmxQ?=
 =?utf-8?B?SzRoVEtQTVZXU3E5bU5sRVBOWUJ1dzhRa0xERlJmbmkvenFqanpJWkU1d2xU?=
 =?utf-8?B?TS9vK3hNUGdXZjBVdkZSbitiSEhnRDd6OHdNVzdUdWUzSUZHdE1ERTJHdG1h?=
 =?utf-8?B?WnZhNHlPVldIbHRpRmcrbFk2elJWd1pXUWZGY0ZhL1JYUFhGaFB5M2FUT0cr?=
 =?utf-8?B?ZTNQSFBDQUJWdzE0RkVSK0lIRjh3aU9jTVhZcUYvMFMzWXEva0pZQmN4bk1X?=
 =?utf-8?B?SVA3ZlJDRmdrUFZZRElLaU9vZUNSVjZhUW5wTFovVC9jbjlhcmEzMDNjdlBO?=
 =?utf-8?B?alg0RUpnRFk3a3VvUWFRZ0QrMmQ1WTVWUWtkQmw3VmdVNGFWOGpGNlRFamht?=
 =?utf-8?B?bDdUcTd1TnFtRmt1ZEREY25ZMVNzdkxBS2c4UWZmUEJuaTlyVzE2c0ZZanFl?=
 =?utf-8?B?MVBkYzM0YmRuZkhnN1pGeitPc3VBbHZlU2JWbGxtSHRmTlpvSkM4bDJZMDVW?=
 =?utf-8?B?eGM5cVAxelV1YjJjaVM2OVJDUWEvSTdVdGI2bEFuekpsc0RUN0JrN3h1YnRG?=
 =?utf-8?B?dmlvNWpwS2k2M05mRDljNEVWK3NEL2FmMEkxbGJKc1ZSYUowcW5QSmlZWHdn?=
 =?utf-8?B?c0VjamVwVkpXWUZHU0RPUVZDcE1lZEU4bThHT3psK2dxZVNzbVFSYUx1NnR5?=
 =?utf-8?B?eHFsSTVvQXJKWUJaa0NvTEFJVmcyd3ZHOHB5SzI0L29UZ3ZhOFRQOWY0dUt3?=
 =?utf-8?B?SnhCL0JFYktZZ2szMDlmVTdDSkxOdndBamh3cFVFbzZGUWphdllTaWlxOGc5?=
 =?utf-8?B?d3ZKSnhEUGROaEpNS2MzbDdTMW9vZTU3c3lqODNraUtzWU9zNmZLUitmeEIz?=
 =?utf-8?B?NFRBU3BweDlHeWpuNnZKL0VMQW5qREpSTVJieTJDaFlCR0V4SFV2OE1POHRH?=
 =?utf-8?B?c1plL1dWTVQyNmU5bmw3QU0xbkwzQTBzcVQyeTNnY2ZlMlNLeThGcXdOc25I?=
 =?utf-8?B?ZFJZVzBQcGJITHdCV0F1KzU3UWN5RXN2eVBBUmUxMUtrOEk0R2FVUXdyc2Rm?=
 =?utf-8?B?Z0k5VVQ3dmx6V2IyR2lMVkVmTU1oQzdBYTlyNkV4NzV1R0J1UGpFRnhuakU1?=
 =?utf-8?B?UmxUVm90OVcvTmlGWGlNTTJwN0MrYnJBQWNaanE4eGk1c0wwUWJqak1kN3c5?=
 =?utf-8?B?a01rRkFwNE5hQmx1b0xxaGZZVHJDYWJDYmpNWDFHYVJ6K2ltZDcwTWlTVjJQ?=
 =?utf-8?B?cGc5MUl0K2dsTjIwekhYQWxPc1BZTGtjRUtMS0Rob0VaZ2xIV1NWOGxZdE1C?=
 =?utf-8?B?aDBxQi9uSDFlcEdiOVFxbU54UGNmNnpuZlc1SC9lc2I3NmJuRmJCTEFwcnFy?=
 =?utf-8?B?UXhRbTNYWjZ3SCt2TWdqV2UwQ2xZSjI2Mzd0YVYvYnY5SzZBVld0Zm9BR2p2?=
 =?utf-8?B?U2k0cXZ4dTJydXNudjk5VzI0TEJHd3JTL2Z0TFp3dG1jTFdOOWFYVTZmaTN1?=
 =?utf-8?B?MGwzWXdld2VvLzVRcStqWlJ4aDU1UnliYUlRZ205MkIrSzgxNlI4QzFZc2NT?=
 =?utf-8?B?dXR4bEpRZTErUVd6UEpyU0U5VUk1cHgrS1pLc0VqdmRMVDRCZnIzeVlMeERt?=
 =?utf-8?B?elpUUVFhcHE3RW15Tlk5U0p1ei9pbk9rVTJIUEptVlJUKzB0RUVkRGo0VjVQ?=
 =?utf-8?B?ZHYzQmVKWHlzbmdoSWNpMmtDK1VrZUJNRXBSeENQU1FtRmY0ZzhUbXljQ2Rv?=
 =?utf-8?B?WFB5WnpMcGlldHZGaWlyUnhyKzMyVEZBR21jLzBxVi9JaWxMWXAvZEwraVh5?=
 =?utf-8?B?NkhBeGMwWXNxeDFtS0xJY1NocU5VWjlucURpN3R5V3ljRGtzYXdLbGpzUFY0?=
 =?utf-8?Q?hwmhm8Q3a3EYxmQn+TnbfrE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1438ad1-9c9b-486c-9265-08dcef517022
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:47:03.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWzeTSIM0MymYz8Lodr7WoNOg89da4wlMFa1s/miC6K5d6tgVdTyfX/7rV64YS3cUTg8HdINK8wP6Hk9CB56Z7c3ULqi64Ta7usf1jXVzkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493

On 10/16/2024 12:42 PM, Uwe Kleine-König wrote:

Hello Uwe,

Thanks for your review!

> Hello,
> 
> On Tue, Oct 15, 2024 at 01:51:31PM +0300, Ciprian Costea wrote:
>> +static void rtc_disable(struct rtc_priv *priv)
> 
> A very generic name for a driver specific function. I'm a big fan of
> driver specific prefixes and I wonder why this isn't called
> s34g_rtc_disable().
> 
> Also a comment about what is actually disabled here would be nice (or
> maybe a better name). I hope this doesn't stop the RTC ticking??
> 

Indeed, 's32g_rtc_disable' would be a better name. I will update in V3 
and add a comment before the function definition.

It does stop the RTC running counter because as per RTC module 
documentation from S32G2/S32G3 SoC Reference Manual, the clock source 
and divisors selection should be performed with RTC counter disabled in 
order to not cause any synchronization issues.

So following this limitation, when the clock source is switched (as it 
is the case for S32G2 and S32G3 and Suspend to RAM) the RTC counter 
should be disabled.

>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove_new	= rtc_remove,
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 

Thanks for pointing this out. I was not aware of this change. I will 
update in V3.

> Best regards
> Uwe

Best Regards,
Ciprian

