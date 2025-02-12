Return-Path: <linux-rtc+bounces-3177-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F08EA32C01
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 17:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41089188BEB1
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 16:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D34253F09;
	Wed, 12 Feb 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mAsrlNDK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013035.outbound.protection.outlook.com [52.101.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B67212FB3;
	Wed, 12 Feb 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378368; cv=fail; b=YZZoQZWg3SsiVty4uCnFOlM2xgccZiBeMONv7BgV8SPI7wuVThIma+vkjXZzHyYgeOmdSg8ag4wjr76UH+YL3Ji5IjORgRJS4L6dKBCKbXMEjj1s+DVgZqFLjPQ/vAOilyuXkgKhPMNNMrxZXTFjXMhS97Pty1YBQ+9jiucBjw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378368; c=relaxed/simple;
	bh=WdW8vRboj/5zWOarT6Gxv72kEnLEEXisL4uzpOm/0X0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sGz4L4bMJwWCfbxQPm6A1vYyLDAAP6IhBLi/GM5BS+OWV+pgyjTmH7EXeJxaBeG2px2WnhF1D5yKH8gGfkzMY8fUvxUyum1OaFY45GCHI6qTW4tbFkAyJ+gY2AQLn7wAg5Bqw6YfC58zLRSQruDQT2E4ExWjgzaXkGUD0X73LtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mAsrlNDK; arc=fail smtp.client-ip=52.101.67.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAvCXEAnxE762jujAO922oyO2annX38ZsfUr8cDm064fl7h4rmeKAv5/sOwXBup0AyPBozUNHgI84Raxmfoa3BViMORpkxpxIPPXQ2wDFXWI9Wyo8ed8qvPBHEgLUBoedfXv+/E5ixFjN+SoC1nEWIyL5IbyMU1XQMvbEpeZ2aRiNG05qoDdSEyKSjrggn+eXtRFkILrrvMU2y5aB6xinkbM+Vl/0URsKYenWT+YVFbe8R+IviWqY/L7FIdObGJtKnbJzKy+MGLKgP+PqqE9gvz2pOv9kHvvgK4JYk/iPm9SB6DhviCUlTO7txWWLMCh0OUBcotKW/91K1wmNM6kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdQXgHpX97AKjG/ZiksP8x9LnK9JxlevA/SjC2N9kbQ=;
 b=uzLnR2BKwiU+N1mojsKlu77+2CiowIsVPWH6i8HaMUa2pq3DEiEFbkylLsSD/XHWBWnOqtF5bD4/4HR+MNwOyrTmqMQH9PoeoOOJydUKYr+RmSACPXc9jlNkXKZ5KKMt19JU+AAAsdC0GDrmcQyn2YH97n9z31xR8ch6azTspTlDPgym6DEVhlQG7D7PFxbQzbJ9gGNf3diQWJ9+XdLwZksczeiaO3PEl7V/6qn3agd1SHlKyPESVFZ00kxcZo6ugW1Q8uA54OOA0XnPZFAhdfzF+f+b2YHjoZJXRc9YcZf7NjPq7A0b8UOCJQh4Y1NTTSzLAXG6G+CkvXM/bT7M2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdQXgHpX97AKjG/ZiksP8x9LnK9JxlevA/SjC2N9kbQ=;
 b=mAsrlNDK8UqLD3Nv/TKu51d7sPIa7xCYKn1+QshzVrKzXtVIYGRzaTJQg/etm6SXR8h+py4iekk9yJQZPFuDRMCG9ptNu32XPLNQVxE1J8sgymJBUmnO5oTo5e5tr5w/lGX17kUvfQLk3kmMgGAi+Gm9DT4xQBOpzW9/lR11kJhgqowt7yaMwtjYwBAJyiTNYFDXaCRJfoF0dWIr7tzOTokWO1uTS0vRtDI688WW+Gwhom4T05tkWnGm1kuFr+GPBd2JSHfbKQvonyex5MWSTQEPDmm92Ym+2kJkQDDXRCrKK56PPMarHFWIQPAXb8H7j5Fln4tZylqDzIVy9inHkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 by VI0PR04MB10543.eurprd04.prod.outlook.com (2603:10a6:800:25a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 16:39:21 +0000
Received: from AS1PR04MB9261.eurprd04.prod.outlook.com
 ([fe80::7b16:7596:6bb4:c5fb]) by AS1PR04MB9261.eurprd04.prod.outlook.com
 ([fe80::7b16:7596:6bb4:c5fb%5]) with mapi id 15.20.8422.012; Wed, 12 Feb 2025
 16:39:21 +0000
Message-ID: <78e5fbe5-9895-4467-af05-0aaf79820e06@oss.nxp.com>
Date: Wed, 12 Feb 2025 18:39:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
 <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
 <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
 <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
 <Z6uDuL97EB9KqD4b@lizhi-Precision-Tower-5810>
 <2e633e46-ac59-495d-9ecd-46c34d2d3242@oss.nxp.com>
 <Z6zDT/lbAeaJClV8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z6zDT/lbAeaJClV8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AS1PR04MB9261.eurprd04.prod.outlook.com
 (2603:10a6:20b:4c7::13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9261:EE_|VI0PR04MB10543:EE_
X-MS-Office365-Filtering-Correlation-Id: 409a6401-e54d-47a6-ef37-08dd4b83cce3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3RLSGlnVS9ydWNJbUV1QnZ1UGQ0RlE1b2pkL05IeVBySXBCZ21oWnR0Mys2?=
 =?utf-8?B?TVhtUldsbENvTlNNNzl4RENSQmZDWUppV2VwRG1UaTU4ci81Tjc3UXE0L2Jh?=
 =?utf-8?B?elJzM01URmlTNTdnajA1WmdDZjIrZWFhaFhYQ08remppNUkzRWl3OURNL25h?=
 =?utf-8?B?SWJubEVZYjlWQW5uUkV1Um5VRDdBWWFJME1ZR01DZllKbWdXcXpGbmw3ZmJt?=
 =?utf-8?B?SFJoTG1SZzFXMkF0dGU5aVp4cFkyR29nOVF1a2Zua0NpUmI0RUJhRFNlSkdp?=
 =?utf-8?B?bmcwRTAvNHdrcEhaMFlzaGZlY0J4VTZpUFo2bHlWM0lsQmxQanJObjBjNmZH?=
 =?utf-8?B?WGRpTVJKcWowdHhBVFRyT3BQa3VTQ3R1czFISGpYenVzeXA0Y1U0SFNFcHR4?=
 =?utf-8?B?YUkrWFAyTzdQNFFMVTg2WFJxd2FiMXV4NlRCdW54MXpiTVFPby9reHpnVDJK?=
 =?utf-8?B?bHViVzZkVjBmS1p1V1hQeVQ0L05kKzFPWkN1RWhWSndKL3g1SktTYmhkNDhO?=
 =?utf-8?B?Y3B3dmFoZHJJcldLS3kyalluT0hob2x4dXo3T1RrcVhLbjB3NDFHWmV2eUEy?=
 =?utf-8?B?clE5QkQxV2c1czhSKzNkN0RpVVZua0Nub3YvSTVONGZLMVNhVGdRbGI2RGpt?=
 =?utf-8?B?N3l5b1hGVzY5Z1lpbTY3VnFMcVUxTkcrNFpCM1gyYzNuMWxQdEtzOWRIcUZx?=
 =?utf-8?B?c2E2VkZ1Q2RFSDRkb3AydHBkaTBBS3BqWXF5UnlHeXpMb2xGT3hNKzBzcGFV?=
 =?utf-8?B?N1pVS01XUU9CWWJiU2R1cXpnUUxZUlVoQnIzbjk5RjhWazltMWZLdnFUQ0pS?=
 =?utf-8?B?VWpseExLSExXY09oWlVJVkQvamZtY2ZaUVYyNFIxaVl0UEd3Q3pHTDdBQnVR?=
 =?utf-8?B?RUFubjVFWTVYOGlMRHYzSnQxOFZmd2lNZnJOWGlBWU9QbDNRanN3UDl6OUwy?=
 =?utf-8?B?NU92a0NnbXdpSkYrNVhQekh4UG92d0Y2dUdtM2xwQjg2M1FCT25SVnNWZzVh?=
 =?utf-8?B?amZKQzZNSy9Db1JjUTk5YmtPRXBxdW42b0dvVGcvbGNKSUZBb055Y29WNEZD?=
 =?utf-8?B?cW5OMmJKS09tQkxNV1RRbWprOWpFeTNXZVBGRGJibGN5ZHVoRkkrSTZzU3Qz?=
 =?utf-8?B?SVFULzJneFV5VkdGZGxhRThLSlRkanBnbFB3bjFBSENDdGU2anlxdnB0OTUw?=
 =?utf-8?B?YmRHeXNSYkNKYVVkKysyRXAwRHM0SksrbXJQcW5nUlJhVjNQUzh0LzkrL0t0?=
 =?utf-8?B?cU5veDFvTXE0ODdRU0VFZERVRW8xaGJLU1FVWWUySFZEbzZCQ0tTS2phK3dj?=
 =?utf-8?B?OGxicDU3UW5pVFJ3RmkybVhRZEpiVVFyVHlSYUNOSTUvOWR3YnEzak9LNzNL?=
 =?utf-8?B?K2V4Q2pqTFhYQWxIRkp1ZFc4dzRyTHg0UldBcVZLMSt6RXhmNDVmY3hUdGFw?=
 =?utf-8?B?WlJVZEc4QlFjUTJKV0ZBRHZzTmtXSHZjR0pZcWZneUlQYzQ2SzVOK0licmVN?=
 =?utf-8?B?L1dKK2FqbEw3cU9VNThjRHRIQWFTYmEzcXpMVEJHQWVoRU15U0x4dlJDdUhW?=
 =?utf-8?B?eWxZRDE5YXNVQnl1V0hNR08yU1pwdnNRSDBVVDNMalAvTkl4d0dKTUt5K09l?=
 =?utf-8?B?aDRZemNCMERLRE5jN3F2M1BpYTdiWGRTL25oZUU1bDJ0TCtIZWFnODhSZ1E2?=
 =?utf-8?B?WmJrbEN3cHZLVktJZjR4c3UwZlFSekF4OVBZaWoyTEFsNkM5eGlVbVEyVFNF?=
 =?utf-8?B?STFwMGNsMWw0dWdSdnB6WE55VHNBeW5rN1ZGVUdxSlhsRldScVdNaUM2SG1W?=
 =?utf-8?B?UkxxSktraXR6MEZwRy9WeHc1YTVhY2ZKZkZTNy96UXRUSnl5ek9wTWwzSG1R?=
 =?utf-8?Q?oGkLfZUfyi/LQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9261.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmdNMk5iZXM2by85SU13MjIrdW1ncXVUbGRmNnZ3WkJPbHBsMkJNK1lwL0RM?=
 =?utf-8?B?Tk53dmcvQlYrazFjaWxVdXQ3K1poL0xWaXVlbnFmSlNiOGQ5bDVHTlBaSFRm?=
 =?utf-8?B?RStUSnFEMzJpdnF2NDhPeW5WWG4zZFJOM3NBbzhhQ0FRM1RBdkRmMitrSU5M?=
 =?utf-8?B?Q2lEbGloelZoaVJqMVFjUU5qYWU2dGUxc0JhYW1FWmF4bUFNSUxoMFhYY1pL?=
 =?utf-8?B?QW03VzIvd0M1Y3RGTWFOUFk0Z0ZLZE9pcG1EOGMxb290Nmk5Z0s0NVFZbHZt?=
 =?utf-8?B?VkRucUtjOHRYdG5zRTdXYzl4M1A2K2MrUEcyMjg4Nmd1emFRZlpOWXlJalFP?=
 =?utf-8?B?YmdRRmJQWVh0Q01BNHY2UHlxMzdESVFvbGlPczY2SURsZkVHTEJ6bGpVNlVp?=
 =?utf-8?B?cHgzRWRPemFiazE1WXJQN2hsVXgvaWZHalp5SkFMTGVydU82ck1wWnVQNUtG?=
 =?utf-8?B?RXlPOG5JTkp1aVkxeW1FcVNMU3BrRFF3Y1grZ2RIb1lnTGNPUXJFY2VOZjFh?=
 =?utf-8?B?SWM4Mi9JdHdlWkIxSVhabStwd1NaZ1FNWk0vVXFHWUpxWkpsK1Y0bnkxcUV3?=
 =?utf-8?B?RDIwVGlrTGtpMDNCcnJxV0h4SWRxRmJTTk1YcTh3TUJUUmdYdnNncFI5bTdG?=
 =?utf-8?B?YmZWTkdhaGNMMzkvdk15Vmc1NVROOWRQNHIwSmNJS2RkR2hxUi9lUGFVckdZ?=
 =?utf-8?B?UEN3OUhNaDlsdGF1SVFMakFYcDdndkJ5K0hhNVkybVh0VXJjVEdneEFPT2Uw?=
 =?utf-8?B?RjdpVk5MM2NYcU02L0FwRTJQLzdpM1M4bjdXblorSXNMbExaMGVQRlZoSlNC?=
 =?utf-8?B?OVBzUDJwMHRvLzZMQUpNZk0wWGpXK1ZuUnpjZ09acFViODJDaXBSbjVaRGNN?=
 =?utf-8?B?eFExNzM1YWRTNG1laW1YYmVYM2d0RS8rSlJ5Q3ZjVDBGeXc2QjRUZitpZGVt?=
 =?utf-8?B?VWJiTTQzakJnOUVDMEJYZDRKTnFYQXVvOUdFeGllUmF1enRCeEdEMndzOFlS?=
 =?utf-8?B?QUxhZ3hhOUY4RHdGWGZ4UkcxbjlHTmpPRlNiSzAzU0EyMUhzc2ZYUzNIeVdB?=
 =?utf-8?B?WkF0elhPaWdDcDEzdHZaT3ZwcWp4UVVVQW82dlBGbGx4cDNxK1lRc0FmN2Vr?=
 =?utf-8?B?SE52MmtZdGcyMUMvY1BMM2FGMzliQWtBNHNpREludG1DSGtaRWplT1FWL0VI?=
 =?utf-8?B?KzZvdDI4eURjZUsyS0FDQUJxaGNGMVEyZC9URGVETHB5dmV4dG8ra2t6UTBU?=
 =?utf-8?B?L09WRmlMOE16a0xEKzNld3ExWXF5TlRPSDlZUEQ5RXhGWU1sZjNaTVQ3R1FF?=
 =?utf-8?B?enNRSUI0QTFlSmVMU3BsUFlWQXlYQXozeFVjSkRoc3JqbE03UmNLMWkwby9m?=
 =?utf-8?B?UUkwYVdmYlB2QkNHckJidzdodEJxbHJia09YbGJiUWwzVGsxV3ZiMFlHTjVS?=
 =?utf-8?B?LzYzT3BVQmV2OXNIUy9Dd3ZrUzdjL25laUdZWmErOG9ZRXFkNlRwQ2dGY0hz?=
 =?utf-8?B?a0g0MWN6eE1WTjNlK2lRTld1ZHhpTnRmenpxUm94dGNsYkpUdkJpOVY0ME9W?=
 =?utf-8?B?T2tjMzI2eDlSOENkSmhzcmFCRmdYZmZRZHNkY2dNZlJndjM2V0thWFVtc0FW?=
 =?utf-8?B?OTJNanlVK2I5dVc1WS9vMWNhekljek41SW9CTlRTc21TbTNEZkdmSnZDNjBw?=
 =?utf-8?B?cmVvbzJxRmRYNXQyU1JaQzdGM011QWxYWWNPa3pIOGdBV0VNQ1R2dVB3N3NL?=
 =?utf-8?B?UUx3WTVIZkNIVlJzdzlRMjN4WlNRR2Q4Y1RvMzNsNGJYY3ZEeUlVbFNnNmpP?=
 =?utf-8?B?OG5SOHVPaS9EVXFvNExQYXdhTllYV200SlV0Z2ppay80L3VkTUMyUlBwTXN0?=
 =?utf-8?B?ZzllNmZ3Q0xFQU1Sa201dk1aNzhQTjNTcUZWSURvNjkvYVo3QWQzdXJKcllC?=
 =?utf-8?B?WXVMRjA5Z0ZsQ29wYlBGeFZGWU9ybnJnRXNhcERhWjRxN2o1ZVN1RHdQN3E5?=
 =?utf-8?B?dGppa21HUzRmTUFoa3NQZXFDMmxrZzZsWWdIT0d6T3hYNDRzZGV2YjNGbmRJ?=
 =?utf-8?B?ck11WGFHNXFvVysvSWJGdzNlS0hXTStxRjM4R0RNcXJUSXVELzlud0hRaGQy?=
 =?utf-8?B?MnhYQU1pdHMrQ2RGWjRGVXh2MGhXZ2FUZkR3S09Eck1YMUJnbndSN2JRVUN4?=
 =?utf-8?Q?HH4+zr3NptFKh8vI4I79Fmg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409a6401-e54d-47a6-ef37-08dd4b83cce3
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9261.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:39:20.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxuH2gCbIFnZgXJGcgZzbDMpxGu1NsZI8M9SPTh1XYpypi0yTwF0mim7K3pSblEnTOYVpVkUUwrTidu2BTSQSQxo8l9WygfNCQkr+9sl/8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10543

On 2/12/2025 5:50 PM, Frank Li wrote:
> On Wed, Feb 12, 2025 at 10:11:35AM +0200, Ciprian Marian Costea wrote:
>> On 2/11/2025 7:07 PM, Frank Li wrote:
>>> On Tue, Feb 11, 2025 at 01:25:38PM +0200, Ciprian Marian Costea wrote:
>>>> On 2/7/2025 10:16 PM, Frank Li wrote:
>>>>> On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
>>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>>
>>>>>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>>>>>
>>>>>> RTC tracks clock time during system suspend. It can be a wakeup source
>>>>>> for the S32G2/S32G3 SoC based boards.
>>>>>>
>>>>>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>>>>>> alive during system reset.
>>>>>>
>>>>>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>>>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>>>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>>>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>> ---
>>>>>>     drivers/rtc/Kconfig    |  11 ++
>>>>>>     drivers/rtc/Makefile   |   1 +
>>>>>>     drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
>>>>>>     3 files changed, 395 insertions(+)
>>>>>>     create mode 100644 drivers/rtc/rtc-s32g.c
>>>>>>
>>>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>>>> index 0bbbf778ecfa..510dc2db745d 100644
>>>>>> --- a/drivers/rtc/Kconfig
>>>>>> +++ b/drivers/rtc/Kconfig
>>>>>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>>>>>     	  This driver can also be built as a module. If so, the module
>>>>>>     	  will be called "rtc-amlogic-a4".
>>>>>>
>>>>>> +config RTC_DRV_S32G
>>>>>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>>>>>> +	depends on ARCH_S32 || COMPILE_TEST
>>>>>> +	depends on COMMON_CLK
>>>>>> +	help
>>>>>> +	  Say yes to enable RTC driver for platforms based on the
>>>>>> +	  S32G2/S32G3 SoC family.
>>>>>> +
>>>>>> +	  This RTC module can be used as a wakeup source.
>>>>>> +	  Please note that it is not battery-powered.
>>>>>> +
>>>>>>     endif # RTC_CLASS
>>>>>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>>>>>> index 489b4ab07068..e4b616ecd5ce 100644
>>>>>> --- a/drivers/rtc/Makefile
>>>>>> +++ b/drivers/rtc/Makefile
>>>>>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>>>>>     obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>>>>>     obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>>>>>>     obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
>>>>>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>>>>>     obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>>>>>     obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>>>>>     obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>>>>>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..3244b23c533e
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/rtc/rtc-s32g.c
>>>>>
>>>>> ...
>>>>>
>>>>>> +
>>>>>> +static int s32g_rtc_suspend(struct device *dev)
>>>>>> +{
>>>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>>> +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>>>>>> +
>>>>>> +	/* RTC registers are being reset in suspend.
>>>>>> +	 * Thus store standby time.
>>>>>> +	 */
>>>>>> +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
>>>>>> +			       &priv->sleep_sec)) {
>>>>>> +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
>>>>>> +		priv->sleep_sec = 0;
>>>>>> +	}
>>>>>
>>>>> Strange. If RTC register are reset in suspend. How do it wake up system?
>>>>>
>>>>> Frank
>>>>>
>>>>
>>>> Hello Frank,
>>>>
>>>> I believe the transition between resume to run is a reset event. This would
>>>> lead to the RTC registers being reset after resume from suspend (triggered
>>>> via Suspend to RAM).
>>>
>>> It is weird design. I suppose it should be design error. (any errata for
>>> it).
>>>
>>> Frank
>>>
>>
>> Unfortunately I could not find any such errata. But this behaviour (RTC
>> registers being reset) is what I see when resuming from Suspend to RAM
>> operations.
> 
> Okay, it worth add comment here to descript hardware behaviour, which is
> actually uncommon.
> 
> Frank
> 

Sure. I will add such description on the resume path in V8.

Regards,
Ciprian

>>
>> Regards,
>> Ciprian
>>
>>>>
>>>> On the other hand, the RTC is kept on during suspend for as long as its been
>>>> set up (for example via rtcwake -s), thus waking up the sistem via an API
>>>> interrupt.
>>>>
>>>> Regards,
>>>> Ciprian
>>>>
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int s32g_rtc_resume(struct device *dev)
>>>>>> +{
>>>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>>> +
>>>>>> +	return rtc_clk_src_setup(priv);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct of_device_id rtc_dt_ids[] = {
>>>>>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>>>>>> +	{ /* sentinel */ },
>>>>>> +};
>>>>>> +
>>>>>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>>>>>> +			 s32g_rtc_suspend, s32g_rtc_resume);
>>>>>> +
>>>>>> +static struct platform_driver s32g_rtc_driver = {
>>>>>> +	.driver		= {
>>>>>> +		.name			= "s32g-rtc",
>>>>>> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
>>>>>> +		.of_match_table = rtc_dt_ids,
>>>>>> +	},
>>>>>> +	.probe		= s32g_rtc_probe,
>>>>>> +};
>>>>>> +module_platform_driver(s32g_rtc_driver);
>>>>>> +
>>>>>> +MODULE_AUTHOR("NXP");
>>>>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> --
>>>>>> 2.45.2
>>>>>>
>>>>
>>


