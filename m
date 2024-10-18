Return-Path: <linux-rtc+bounces-2233-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75FC9A38FC
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 10:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459DA281AD8
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 08:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C7118EFFB;
	Fri, 18 Oct 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eLy2vP26"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97518892F;
	Fri, 18 Oct 2024 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241150; cv=fail; b=UbfvpIM4lZpsrEm9N+rYk5TdYXTIYdy8WJIvqmMiunLS7s6k/jvrYZ0t07pMl4woJIp0gq7LQ/tThbOaNVwJZdezkMFYURsczEFJ/AkJMN4J4znQFT6/R+DSnLNWxYp7sGPAaLuC7D1UVI44x97dPhYT33PlU+W2PqH2EKB0n4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241150; c=relaxed/simple;
	bh=Gnbrwd15eTSGmiXJtke6Gd9ACHnv9HvDW9RCjbc7k60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSGMQjDHe1i+GwIACnQHx8RjfZETUQV6/vlKkTnuhlAa5046tb8BWZAzeNp9rBorKgigP5nLWxyj935s+ClTdZcqSmKG/LkG/bwS5MfB0r8e/X/J+SsKLzaVoxXMQUSQJOf6FZQeFGGgXzvjCMrhONTSqY4m4n9QxvoHlYmA4u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eLy2vP26; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RddGMTiRsP7Y1kO9yP+6oY+GoBj47lErl+EYtfcAm0WiA3uB4w6yKZjfSAFQdbbOeBpq6XuDKtRVWTVYk1Icc9pNhzRpmJw3tXsJW5LrHRmZd6s8zp7j5X6fIf0LMQG2DmBeccB7VvDWgBWCqYgX8Wix2mHwTyP2UrTKRu0nrDIsxNUs4TFo+3PakShvtgv8xrIqbKb4uz6cQgOS3M1h4tO375XXAgF6EBWySdwfoip2qVECwqsZOKWj/X9z0PBRLAcrKTDDeNdmkh0+zyH0Dj3JTMU1o+Ucm7ligCToWLrDo8cYxdQO4W7JdO2cfEaUELhxPD2nHk1udoZblk/AOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Dxd4kWg8LJKaQU+GF6nU3380K+6zlKigO4mbVx6ooY=;
 b=R/74Iz4fJfKbrFvWFXzO+E30DbgFggVPaAcn4V2yxZWGRfvvswlJQ656V1AtZC9WpvaXehlGBLewrmruTbWwO7CaqmEJm/cuRB1RYkjIMD7R/LbqVkA5VgVD3xxq8/JKHFiSMzsvVRTgHuXF2LKFM3j7Fc1lMOxM6fHJJaU1sq+2LHOd0J9qVTN8gKlbxnA2JIb6okDq0lGS/9qUT/TQF1WPLKIeR3vt7eK8lKkuE2B8D+oB1PZrgL2LIGbSli3afVk8Mu30Mns54caWQuKC0zG6aVzfz5eglqQpbpcNrHZCUf1KP0Yrae4qdHFBDt1ZoPtPnoVog99P74JmTh7buA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Dxd4kWg8LJKaQU+GF6nU3380K+6zlKigO4mbVx6ooY=;
 b=eLy2vP26zv4KExwhO5TG0Rjx4kst52FMhNzeA6z3pgjo6FZ8Ufy8vIKYGkFhgCIXmP3OGJb/uhPBb0DGc0cr2Be7qUxIEf4VQeGOPdU4J0DlgNpsmFtPlZyLMFz59tIrnhnBXnx8kO3HuQiIgNz7wBxxOIsbMuWUa8y1/LZEqTnVBF2GTtCHZu1YmCI+U+mjrjsVpOKidilZUPfXjxC0RJxvXr3d4D05cJGmWNsn9pVNqbUD9dXoWM8nXQtq28BSCC9rsPmkenOQ6GnMYpbp4rWBnvXT/oUGh1dYxvtle4XPYaIMjXzx6nTpmFiISRzrCPO92on5DBsRD3cZh/bseg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB8PR04MB6826.eurprd04.prod.outlook.com (2603:10a6:10:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 08:45:45 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 08:45:45 +0000
Message-ID: <6ba15d8f-f7dc-49bb-883a-a478532d1df9@oss.nxp.com>
Date: Fri, 18 Oct 2024 11:45:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
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
 <CABMQnVJp_j4mMg-TXogM-cBSBMkpF=CUrGE=q+QCiz0arBJxyw@mail.gmail.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <CABMQnVJp_j4mMg-TXogM-cBSBMkpF=CUrGE=q+QCiz0arBJxyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB8PR04MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 10388abc-5b11-4c82-d4e5-08dcef5141d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnNiZjNKeEhXUWI1RHJ5UWQyU0pCMmgzOVRRR3ZKS0hwOFFwZ05GakVFS2NK?=
 =?utf-8?B?YlR3b3JMTE4xTCsxYTRGSFZ3a3hDQXNoMHpsL2ZJMTZ5ZnlTVlVBRjlTNjhh?=
 =?utf-8?B?cjdzTVBpaUIwQm9yMXhtNkZORXA5K1daayswaWRhT2NxT2srZlhVK25NTmRD?=
 =?utf-8?B?dy9XT0Z0MGE3dHRrWlR0akxldkpCc1dDQ1BkRVkvSC9FdGlTbXJ0V3BqY2hO?=
 =?utf-8?B?L3ZuVWZ2NXJ3N1BrSFZTS2djcXBvNmRBaElsakNJME4rampCTXp3VU9YbGpB?=
 =?utf-8?B?Z084REFGUVIveklteFlNNWx1RmJUK3JEbnJxbGJWMzJjVlZzZ0o5MEppUUc5?=
 =?utf-8?B?QXo0ZDZmTEpIUk9KVElVTmtXZWo2QXZlWm9NRXVES2xDNHFDRkt5Z1JLTUNL?=
 =?utf-8?B?ZnFEYzRZcDlrcW9zUC9vS0t1NDZaVy9QM3NXc2xOQkcvR1p3ZHZha2llTHYr?=
 =?utf-8?B?Y2ttTTdyS0ZwaC9zSEZHUEdNQzgwOHBvQkRraFlKY2FxT1JBV1hmdVZPUFZu?=
 =?utf-8?B?NWZPblJMVEJIaVdDdkh3OXdQM2FicnFrckdldjdWOU1FTHJ0UjBGQkFxUW01?=
 =?utf-8?B?MjIwSHdlYkczVnJFdkp4ZVVZYmxZVVJWdEw3bHhTVDRCcmtMeEp4cDdHbFNo?=
 =?utf-8?B?SHU0UXI0VjkwMGtQRGRrNGovdG1EUXN4YkFSdVM3VkszblZQbC8xcjRHaEFW?=
 =?utf-8?B?UXNqY0NlSzBlZDQvTmkwRUQ3MVNHVkppcDlzUk00Vkt4NTVtdG1lajYzakIv?=
 =?utf-8?B?V0t1Z3NxVmQ0OW5BYTlBWkdZTy91ZjVscGRrMllNQU9WUWlkS1pQZlBuUVR3?=
 =?utf-8?B?VGU2M0lwdzFoU2tJb1ZUMTlHM1liUUlPYmJXUHFORHBocjhyclI5T25udUZt?=
 =?utf-8?B?eFFDZU5RdjBmQURVWEptNndyanFxcXJLdmgxclZ2bnY0dTdGbmQxYThnLzU4?=
 =?utf-8?B?VjE2Z3VwTjJleHNjQWg1bmQ5SzUwbnFVczQ0ZW9kT0twQVB0eWhBOERXem1N?=
 =?utf-8?B?dDAyNEVYOHphNVJuTldCZGZHMnJON0w3THl1L0NGSEFYbG41ZG5SYzdkVW1k?=
 =?utf-8?B?L1ZGRUVKVzNZa0hwQjlJaDQ0eHZuRFloK3BtRkVwSW1sYUZvdlFNdW5HcmZ6?=
 =?utf-8?B?UGN0MTl5NVl3dzVkYzdnUDB4VnN4dDIwRTB6TjV6ajRML0xGejFVSUQwcTJM?=
 =?utf-8?B?UHRXckcweUdxczdoakVIbGVDeDV6SXF4TUZPN25GWFYrUXBMUlk5cmxqcy9x?=
 =?utf-8?B?ak1BZWtCRW1jYm5KM25ENUppbkMyY0Rzb2FWWjdORi9SbGlqeldqcVNFV3Nl?=
 =?utf-8?B?TTJvTktiOUJteHJOZmxXbkpZcE41QTVTT0VjWmVxYkt3WTIvNW5Rc20vT2pv?=
 =?utf-8?B?TW5vZVVTTWY3S2h6RUVpQVNtMkJ3Q0R2TTl1RXg1bjA0c0tHdkFOaEdNeDBR?=
 =?utf-8?B?TnlISHlzQ056alpsZS9TQ3RTZWE1dS9OWndQa05iejNBUWI1WTlBTm1xK1dL?=
 =?utf-8?B?alRsUTFjSEJxWCtYWitlVjc4d1l4cE1qbXV2RWpuMm1PUG9MM0xCa1NaZ0R6?=
 =?utf-8?B?Yjd0ME9yOXRHaGRIV0NNTmhRWmRVZG45QW9mOFZabmJOWGlxVlRpUGtCY25D?=
 =?utf-8?B?NS9vZ0lRbEY2ZE1OVmpteGgrSVhHMEVWUndXVys3U2FBNWUrUkFiRUhDZ29E?=
 =?utf-8?B?MzQzeWYwVm1qZ29UeCtZRWh4MzMrbGx2TTZ1Sm1Bd1ZzV1dlMmZWSm1OOW9r?=
 =?utf-8?Q?QlmuZbZTzPVesyfQYh0zE6iHm5Mg8//iq1UNPtK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWdvc29LcTU0eFJUSDZXUjlBZkhsTCtIYTdhUm92OUxCS0lpZEhGNjRPblNG?=
 =?utf-8?B?aE9zdnZUODN6ZnFiWDQ5Qk5pZ1Vzdk9PMjlyTWJYalNZd1hJOGdBOW1xYys3?=
 =?utf-8?B?cEp5a0s1am1ubDYxUjJVU0dmbTFRTml4SHBPZ25jTVlhaUpUSG1FOE5WcVF6?=
 =?utf-8?B?dU5jQ1hzL3p5OXczTWlmdm94N1Nqd0hhRXNIWDJzbmRobEVrVkRoU2t0WDFa?=
 =?utf-8?B?QmFRV3FtMGI4d3EyeWcvUGhZeWMxN3hXZkdvUkJZSG5YMVpWNGlEZ01PK0JN?=
 =?utf-8?B?VzZNeUNGRFF0RDBFU1RCYUY1VlEvdjBuSGk0NnZuZjRReHFhOU85WVNFVCty?=
 =?utf-8?B?b3IvTzBzeFhGcTVPL1orRyt0am8wNFN5N2lyUGpha3NWTk9UMW5BTE0vZHBW?=
 =?utf-8?B?K3RGYWVQTlBzZHRJQlVwVmwxdTZRZnVMOTVQcFRyckpDZ0krVVlJbWZENXZ3?=
 =?utf-8?B?SGN5SjlUdDRLRE5Cbmw0VGhTK284YlNsNm5peitWYTBjQzNpYktsTDA4bEJB?=
 =?utf-8?B?WE0zb0EzNHFUV09nL3VtN1VPaUxpS2NVS0hnd0g5cEdzL3JmVzIxTyszaklW?=
 =?utf-8?B?UEhaRFBPeGZjSk9LZ2NkYXAxa05hUkRFWEFPbXdSc3dBYlQyWTZLMVRUSXpW?=
 =?utf-8?B?aFZvenA0bFFpYjhDbXQ4dkNJSGlzUUZRTXd5bUswUVk3TVhhdi94ZVN1ZDkr?=
 =?utf-8?B?NGFwV3BteEkzTjdiRkRhZEJ5L0hmeW9lT0VmMVFiVWwxdGhKUWxmV0hIMHhE?=
 =?utf-8?B?a2xHMWsxYUR3a3dqTFQ0NG5ZSUNJcUlrTTRxZ242dlFqZmlvczlGbkR1SXFy?=
 =?utf-8?B?L0lkcDMxRkdqQjVSK1dqMVFWSC9RSVE5WFRzMDZCZWU5T1RNRGNZalZGY0c4?=
 =?utf-8?B?aVRuODhZMEd0dFhWODFJb3JXQ2FibFBXblVaTHNCODZzZGVEODJBUVpNcWNy?=
 =?utf-8?B?Z1c4cWNaV3lJcnd0SGxUSUJ6cGFkeUgvU0JZTHk2YUJ4YlZLaStvQXZxUXEy?=
 =?utf-8?B?WE1LdjdmUWZJbHVrNXh5elEvSDVhT1phS2Z4Ym9tNStnakxrbHFYVWtYUzdB?=
 =?utf-8?B?RnExcGJYS3BwUnBsenhWSlRIMmxjWEVsVjdGems5dFBkV1FTSUpoMGRnMTBR?=
 =?utf-8?B?Y0VQVHJLRWF5WDMxaFY5RDNjeWNMYUJUWDQzZWVDUlNXTVBXSnJqd3NHMmY1?=
 =?utf-8?B?N2ZCZTIvK0FWaWlscjRhcGExMVl3ZHJKVjhPdGh1U1V1MWQ4djl4STRJVWdo?=
 =?utf-8?B?eW50UzdxQWpYcVNnWUpIRk00SXpqNjB4NVlJbFRGdlJwSm52Q0FtbEZLbHJB?=
 =?utf-8?B?WC9OaE5hMkhFdE9tNTZOeWYxRmV2N0h6VzlkcEJWbnZWOWFtZmI5SWlLVTVC?=
 =?utf-8?B?cW1GWlQ3ZlJXMUI1RHUzMHJrcm9uTmFQMS8vSWJGZnZha3Z0RWtnTmdOTW5y?=
 =?utf-8?B?Y0U5b0hCQURDKzY5Q3JLV0dPT3A2VzJoWVlXMjFHRVluK0Q0ZHpKMFQ1TVdL?=
 =?utf-8?B?cGFpUFdWeHRiWjAwVjRQaEFOTXVoSk9jckw5NDdjdWVsaUg0RnYrTytFamF1?=
 =?utf-8?B?N3dyOWZOYlpjczlGQUJMdTBZMzNXY0liUkp1QUtYQTlId3YvSTBmM3gxSFpp?=
 =?utf-8?B?OHU0T04xRk9JUFVJNWlhVGxZSHltNVk0eEsySFUyMS9GRmdnODNSZUFTTVJO?=
 =?utf-8?B?T3lEeVdsanN5NUtUZ0R4MndyYVFMdmp0S2VvK25rQ3BvdjRmVVVqSkY2WkY1?=
 =?utf-8?B?N0dEM1FhRXdzanBvNmZoZk5sbE1ZeUJQc2Q1UE52Yk5oQzBBYlNqVm44aFRa?=
 =?utf-8?B?ZnEwWWNxZG1WVzgra2kzSkpuWEZRSDFjcFEycllGS0Z4YVpCYVVpRVg2Y3Vy?=
 =?utf-8?B?Qk9ENXRJY3Q5WThETnIrNjRQOUlyS051NG00V2poMW1rSkJGZGpqdERXVTlY?=
 =?utf-8?B?eThINFQzcG93NTR4Y1ZmK013d1Zyb3JmbXY5cUFqdzJCS09USFdOVmVRYk1q?=
 =?utf-8?B?SFN2VzZTbEovUFJOUGF5bldGcVA0eW5vdFVsWXN5VTMweWM2S2YwVy9ndEdm?=
 =?utf-8?B?TVVDcUxqVlBWNnUrZk02TXZGYlliT3VaakF4OUZMamRQT1VxSjRIU1dUeWhk?=
 =?utf-8?B?VmZQTEROWGhSd3k5anV3ZkN2UWZWVUM1UE1rSHU5WkFyT1puMnd6aUk3UlJY?=
 =?utf-8?Q?Mt8z3j2qrXJ/dtssHXkE004=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10388abc-5b11-4c82-d4e5-08dcef5141d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:45:45.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1Q/U8E1BKX4SPfydhx5smCD5/IVzLGanCTWVZMuEMrqg/eAwmnytPRoOinwAagbA4TWOoaGoXsI/mhJh3Zqzh1/X56/J3/hH4r7dbLAhP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6826

On 10/17/2024 11:34 AM, Nobuhiro Iwamatsu wrote:

Hello Nobuhiro,

Thanks for your review!

> Hello,
> 
> 2024年10月15日(火) 19:52 Ciprian Costea <ciprianmarian.costea@oss.nxp.com>:
>>
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> The RTC module is used to enable Suspend to RAM (STR) support
>> on NXP S32G2/S32G3 SoC based boards.
>> RTC tracks clock time during system suspend.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not
>> kept alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 778 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 790 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index e87c3d74565c..18fc3577f6cd 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>>            This driver can also be built as a module, if so, the module
>>            will be called "rtc-ssd20xd".
>>
>> +config RTC_DRV_S32G
>> +       tristate "RTC driver for S32G2/S32G3 SoCs"
>> +       depends on ARCH_S32 || COMPILE_TEST
>> +       depends on COMMON_CLK
>> +       help
>> +         Say yes to enable RTC driver for platforms based on the
>> +         S32G2/S32G3 SoC family.
>> +
>> +         This RTC module can be used as a wakeup source.
>> +         Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 8ee79cb18322..a63d010a753c 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)        += rtc-rx8025.o
>>   obj-$(CONFIG_RTC_DRV_RX8111)   += rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)   += rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)     += rtc-rzn1.o
>> +obj-$(CONFIG_RTC_DRV_S32G)     += rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)  += rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)      += rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)      += rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..d6502d8bf616
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
> 
> [...]
> 
>> +enum {
>> +       DIV1 = 1,
>> +       DIV32 = 32,
>> +       DIV512 = 512,
>> +       DIV512_32 = 16384
>> +};
>> +
>> +struct rtc_time_base {
>> +       s64 sec;
>> +       u64 cycles;
>> +       u64 rollovers;
>> +       struct rtc_time tm;
>> +};
>> +
>> +struct rtc_priv {
>> +       struct rtc_device *rdev;
>> +       struct device *dev;
> 
> You don't have to have 'struct device' here. You can refer to 'struct
> device' from
> member variable dev.parent of 'struct rtc_device'.
> 

Thanks for your suggestion. I will update accordingly in V3.

> Best regards,
>    Nobuhiro
> 

Best Regards,
Ciprian


