Return-Path: <linux-rtc+bounces-2639-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685A9DAA6B
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 16:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F724B208C6
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 15:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816B41FF7AD;
	Wed, 27 Nov 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UtbEA+gs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4E71F9EC7;
	Wed, 27 Nov 2024 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732720103; cv=fail; b=FcNZnWIXtK1D+I6OOhvx77pReNqi9cwDTVf0LLnXsfQ1p+DWg/x5g3VtEA59fmo2eey2MEl2kdBnTfCDOeR2K1MzRK0c4tjmoDBDLoXW4v0m7NE6zsklaKito1rZEv/y2uDKJ4kik3u0d+XuPx5oZDr9uVMblBMHfB1s5otBszQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732720103; c=relaxed/simple;
	bh=vn2SdujNhsCvljde+IbtaDHstT8hdaK+YNoX8a6FOfI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jJ26453vIrkVwzDqwXutSlmYXa79kX2Im4haFOCqPHmEmDntWpvAqLqEoNdAxvUJRyJiJD0+6JJL+17rjegTpR3QYN8Pn9jlrACt7UQUzRpGgrQtc2JIhwWyjkoI4lH8EyQQNxSSoDrLnquVKjmL5rMhc/MY5JPNSB7c1aDIPHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UtbEA+gs; arc=fail smtp.client-ip=40.107.105.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQP2clKOTUk9AptSrBId2At27HWMQNrk6VKB9vRcBYaFpugjk+3N3p8pepivzweYgoeyNT6VyfQWxGwF7erbjnrfnOufNkwfX22IkgF9wFHp1ofGTAkSPz/x4RTo371/v/Ww6Dy4NUvuSs2yio2HZSDtxjzt/ZiHr8uyJW6K9iSSYrfxi55X/DhAHdnu1cF11TqnlhJAN/K4ZJwXSSloUSenwYgJu/S4fBUZ8EKdONTNTjqlCJBdE54qRGsKOoG/nyZt1immUYz1VmfRywN5j1knOVx0VblvtYUeFBVkxPu8P+/Siy1FRiBBwpGkycFGQRBslbo7WEwUf1nuEXQblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJSg1/K9WKZWvDrOQllPPbkrw+bouZ4DkHIVNAZ50sA=;
 b=HKA8Td1pcGfTE6IYrIB8x1yxd77R1lGYGzx15H74VBA5kLGR4VrZxmLl7UVeB6UBwUcVLAZFXc2rbyhAFxyawhNsXw3A5c2CHNMHadJI7HMvp1UYPrZPCxgOKngxGO7RpbiBAdCPK4Qx3owICx2T//KVBWH0rJfwM1b2To69bX1LUkCqpR8G6Esh4RvMG/YSxe/ngPkRGdCgUHUJu31NdPFoKRPIKkcr2NN9Sfiz/qt4Le/F4TJWsu2fKRdHFC+vRe6uiqB2QzTemBFD0rzfGm98gj7zSXWhhSC2Fk/nzQdNFm+WjgPcWI1R1DQUgbmMXqUDsgvc0g1YveLSiTSwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJSg1/K9WKZWvDrOQllPPbkrw+bouZ4DkHIVNAZ50sA=;
 b=UtbEA+gsFuCkAAmrXjzQWTAcXtv2+S3rjJdgI9QgtnsCazZ+CresX81mhNhI01hVwzQ5oGCri9Pnrld+Mb2oqECM2kxMDMfOCIth3IUreoLCDYN3MUi7cEAkOovUvA5draE96lYYvtrxmYNZwZJPPmF/6zI95VNH9tCoIGatAjgtJWANC4tT6NYFKbTmdVF4gAK5DHpAiCzrLiGEk0IRym42F6D8hzsQfQxOt7ZY7GjNDNssTVWczBUKiRn5diez4mug/KDxV1pdjBk/LN2HMb1Hs++qoXcCbyFqFrIDbWljNMO2dopUb77vAKxQVFhk4hjoBVsG28vFyAUIXX50ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 15:08:14 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 15:08:14 +0000
Message-ID: <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
Date: Wed, 27 Nov 2024 17:07:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
 <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d323381-0430-4a72-cbdb-08dd0ef55090
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDhXNnRFSlozUUliQmpjbkpZU2lCY2FwVVl5NEl4ck4xem4zd0U5SVh0bDlJ?=
 =?utf-8?B?dzhKM053cVVhWmxWdE5NV1kwbmlwcmRxK005ai9mSG41LytNazdGZk9nVmxt?=
 =?utf-8?B?WTdoSnZHdTQ4bUNJMktmZTFiQmk4YUlWUHphRlBjdEc5czdabUdZa3diUi8x?=
 =?utf-8?B?dEdDRmpOVWRhbWswTkx0dzJ5VGl1OEUwMjVkU0lleWNyalllNmlmTGZSRXBx?=
 =?utf-8?B?RXdtamJIbyt3M00zN1Z6ak5rYnl5L1A4Q3hBT1JVTHhhZ3FYb2lxZU5VMmZs?=
 =?utf-8?B?VzhNaFBPcUF0d2QzTzFpS3J2TmtuczMwUGRqYVg2Si9XUWU1NHdLeHZIblZM?=
 =?utf-8?B?ZVJyZ2YzeFJCRlY4QTN6aU53YkhqN2U3N2d5ems1LzR4cXZKZFRuL0FYdkJz?=
 =?utf-8?B?RWhXVmcxVndMUUpSS0djejN5QUFxMGlIcXdEdFhza2RvK2tUUlQ1YW1NSjdY?=
 =?utf-8?B?eHk0NERJeWo4NzBrejQxYm5CbmVOWVpaY0YrR09Cc3BybnFQWnUzcmtZUTNj?=
 =?utf-8?B?Y29jNFlFZjVEei9SQUtFaGVDczcxN1hCRjBjL0RHdXpQQ0wyeFk1NjBiem1j?=
 =?utf-8?B?SVAwQTgzL1l5M0VQREUzWkZMTHpHYmVYUS9sWEVRWGtkUkpQemJjcWVzemJo?=
 =?utf-8?B?S1JwRzF2bjB2R3FOQ1ZuaFFvZ0RNQm16MnM0T1UxNnUwbFBPSGptK0M5MVdr?=
 =?utf-8?B?WU5taktFYXcxSHNRZXV4SE5TSysxeWx3MUgwbW03bi9EK2ovVk92cENmK2xl?=
 =?utf-8?B?YnBGNXJad2xlMm1qeUlBSWxBT0l4QnNnajhsL2MvZ1h0YTJqeXJvRnluNFly?=
 =?utf-8?B?ZjdGckZYcmZMYjRqM1Z2VWhhN2NGdlZqcmdHU0pNVDg3cnJtYTJyNktmc2Zn?=
 =?utf-8?B?Wno3UHMvZytTMFhaOXVST3pZbmN5REtNTnlNQVNyb3pJM3pVWVVyOFBoMFBS?=
 =?utf-8?B?M1FLRCs2aGJJenJzZndWaW1tY3A0b2ZJUGZSVUcwUG9JVFdQOG9RVTM3U0Jm?=
 =?utf-8?B?bjNXSnV6dXRBanM1SS92a1lqQUhoOHZQTlVRcnI2VVp0aG12OGh2WC9xeVpZ?=
 =?utf-8?B?WmI1WjVoSGhsZGNOMFh1MnlTbkpkOU1BQW5FbmpXQVhaUG8xbTFCMFpDZk93?=
 =?utf-8?B?amg1dFUwRStTaXU1UnV1WG80UGd5dFVoVEFublVtL3pNdWNnOHJsWXJLQi85?=
 =?utf-8?B?a3RjK1dOMHowMUV5ZzNJbVNnbHQvYUdIOHpxZXRKY2lPL3J0c3hqYkhvRjU1?=
 =?utf-8?B?KzVtdE9kbjBHVEg0dFlueWZITW5qUm5BdVJxZmlYdFdNaVc4LzF1ejMvQmth?=
 =?utf-8?B?dXNsWXdRelQ4RDVEdThadGhOY3paRDZQaFVCQnpvdUVpMVZQeTV0QzBhQk5Z?=
 =?utf-8?B?NURRbnRKMDlUaGREUEVvSzNQOWRNR2lWVEVyUmtJQjFYd0V4bVlMT0p2VU9F?=
 =?utf-8?B?QnhlN21kOUlVVURWdVl2MGtsZ3pSR2VoRW0zYjhYT2Z3MDdTT0lJRnZtVmQv?=
 =?utf-8?B?d096ZTFmMFlVMFVRdmlXVTRHb3R0S3FtSUNVb2dFMUs0NGt3bTRraVJMR2lE?=
 =?utf-8?B?VXpEWURkOFRvNVlXVWJrTmdlZ0lyL01kVUpwMVVBV1RsY3NKZ09qQmtwQmc2?=
 =?utf-8?B?Y0xuL29EeHRLL1lqemczWFVDZ3lMd3c2b1NxVCtVTkFaZzJXU1JpMUlEMjR0?=
 =?utf-8?B?TEZkMWRScTk3dkxWdEhpMHNxWXVBRHMwZlZ6Tjk0UzMwNTZ3MGxRL09XazFl?=
 =?utf-8?B?RG9IZjBQczBNdWJpSTE5WGk3TTZNWW9ZNkw2eG5iaEVOckZXQ2RSbHJHWDVY?=
 =?utf-8?B?M1NITmtJdlZOYkdOZ3ZqQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGJ1OXBjbU9tMkdab1ZON2lvRURJbzR0VWthd2RmbUtHdDdlZlk3c0lVcnQy?=
 =?utf-8?B?bG1yV2l1WlA0K0pHZkdhUkJpUlJBcGlIVDhaUWJyS2Z0MXRNcWRLc0UxZDRS?=
 =?utf-8?B?SG5hMUp1L0pVaStSVmpXRzVNV0FtanBaWThwbHgwbXhFRnZ1UWVBTzJPMUg0?=
 =?utf-8?B?c2xYM3p4RDF6U3JISk5HR2ZJRVBUYTExLy90b3NqSzVLbXU1NEtMZ2o0V0VW?=
 =?utf-8?B?U3AvWXFhanU3TjhCSEhGSFhaSjlwTm9KQ1RwMSt0TEh3OEgyRlhMREk2dXkx?=
 =?utf-8?B?UHl2QkRIMTN4ZVpBWWpWbVNxTzJtRlZ2MFlQREhNVUtzR3JSaGZzT3BKb3cr?=
 =?utf-8?B?Sm5kRlgzT1drZjdPSXZyY3prSnpyZTVQa0thZUsreFhXSTlid3FRTkR2Tk5u?=
 =?utf-8?B?WFFuSm8zczJ3Zm95NFhhWGdLU3FRck13WnVXeEMrOThna1NMTTVJcE5pQStp?=
 =?utf-8?B?aXZVbzJTVUMyOXI1STZlb2s3cWRyRmhhZmJmczAxQ25qZnZVRFRidXJyZ0Zy?=
 =?utf-8?B?NlpCQjVGWitnM0JiNUVtdjczQWt0NTNqZFYzbzJyRzVyZHNsUElGUHU4OUJz?=
 =?utf-8?B?NkpLdjJtVEdySzZzZmtRQjBQMis1U0FZRk9XU0NaTCtPQ0VEK1RVNzJXVXJD?=
 =?utf-8?B?K2xYZzdoLzBsczFHNjdzK216L29WUmpCWC83WlNPaHpacXppZmhwbGdHWStt?=
 =?utf-8?B?LzcrRkFZTDJXVkVzOVR5SFNPcTZPeGxnMmt5UlpLdGtzVllJRzNSRUFtcGxQ?=
 =?utf-8?B?Y3RxNDhZNmRWU2hGSXlyMmc4ZHFZRTlKVjhNYXAvMDJ1Q1kyM1I4YTAwRml2?=
 =?utf-8?B?cWY3a1NoYnNnTy8zWE80cUVwYVlCZUZjL3BIL09WOXBzN2VHK01HU2tWaXdN?=
 =?utf-8?B?VHExQUl4RkE0THNwcU4rK0FZTXNJTE95TW1ROHh1UWtRN3lyaVloajdOUE9T?=
 =?utf-8?B?Q1hhYThKdUpuQmJKY050VmtoWCs4ZVZPaHZrRkxNMERtTHdZbHVSNndQTXZI?=
 =?utf-8?B?dlphejNOVkZ2QlhnNEtRNVA4U29JSDNmbmNHaUk1QSswc21jcnZmRXBZbjVC?=
 =?utf-8?B?TFc0STNsQ2R0QnlBM2lKN08xbGo4bklMWWJJUUFDbm5JSDBxY0hVeHp6VnVn?=
 =?utf-8?B?TVpkVEtXSmcxNjgwQ3BoaFpDZVkvL055S1ZRZEdudTFTWEdwbmZZZFdQQ21W?=
 =?utf-8?B?QmZjV1lSWk1kQkNHRjc3WlJ5ck5oTjNrOWhQR1JtQjFHVUJZbnBuRzJ6aC9K?=
 =?utf-8?B?R21RTW5vTGxVSEtCYkp5eUdGM3hSOHZFZDVnbmhHblBYMGZpRzU5RFJhQ0hL?=
 =?utf-8?B?OGEyWk1QcEt6S0VERnJBaTNIb0Y2RmxSOEovbEwzNzB5WlJkQzRtdDhDcmZ6?=
 =?utf-8?B?OFBUK1p4U005Z1BWQVdmcnUybWdPc3N3dXBuNzVadnhkNTNKU2RUVHVlZXRV?=
 =?utf-8?B?RUFtMHNxa1p2bWlTSjlLNmJxK01EV1RkTWQ1dStPSVpUSEhLRDdVUFFSSWlJ?=
 =?utf-8?B?WGdyNWdMUW5RWGhFbEVMaGNTdnBDUmsxZk14ZE9pRnNsRkRULzV1UmE4NytM?=
 =?utf-8?B?SEwwZkNhYklYRUpSSW5Ca1BGYnhBamhOaUxsRGh1c3J5dWtOQnE1UEtlejVB?=
 =?utf-8?B?c21uazRPWEI2OW9DNkk4UUNMeHc4aG9hUmlSVHk0ck54TmlRaWxoK2dDSHNB?=
 =?utf-8?B?eUdTclVMYzFFV3pxL0lIRGduaEx0YVRwMDhXMjlseU1zR0xwaVY4NkVUenNQ?=
 =?utf-8?B?eUhWMjIwa3pMcEcrNStobXdkTW1QWlRWbU1ORlYxWG5Jb1NNa3pBUUFjOGNr?=
 =?utf-8?B?WGYvc1dVdGNMU25XNFNtc3lEeldvbDFjcEMreFc2T0x6dHdjWnd5REMvbGN6?=
 =?utf-8?B?Q0RhVThKL3M1bHBuSHoxVXNqeUNYc2ovVnZpczZvQ3lrdmxlM3ZWMXpyb3BQ?=
 =?utf-8?B?RW9XbGx3NGp0Z2tnTzEyM212K1FrR3p4VERJVWZ2UU1QZFJ5Y1NFdXdFdnFz?=
 =?utf-8?B?NUxEWUxudFFMMzBsYUdCOUxQbm9BTFpWODU5OXV2djVjZDZHZ0FmRkhBaFFS?=
 =?utf-8?B?VjdmS1RXRkY1Q0V1N2xOcVFub1UwWjZMZmpJbm5OMGxoSWZtVTdSSCttUk42?=
 =?utf-8?B?UDIxNGpXQUxTMDNHRCs2Z2pkL2pOODRya2FNNzZ0ODBSblkxcmlDRFM1QWxh?=
 =?utf-8?Q?TAvZMM1ZJglrp+wQWQAiWiU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d323381-0430-4a72-cbdb-08dd0ef55090
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 15:08:14.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eBSflzcetoeQ0vS3pKKt/Zu5sVmt3YjIOdn/dVqeN7CY3paLdGbuWZqdIz7DohqyffOUYW1aa1b3EjAGXgMZCunK7f3Pohsr1Vb8B2qUx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776

On 11/26/2024 8:05 PM, Frank Li wrote:
> On Tue, Nov 26, 2024 at 01:49:38PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> RTC tracks clock time during system suspend. It can be a wakeup source
>> for the S32G2/S32G3 SoC based boards.
>>
>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>> alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 554 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 566 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index e87c3d74565c..18fc3577f6cd 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>>   	  This driver can also be built as a module, if so, the module
>>   	  will be called "rtc-ssd20xd".
>>
>> +config RTC_DRV_S32G
>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>> +	depends on ARCH_S32 || COMPILE_TEST
>> +	depends on COMMON_CLK
>> +	help
>> +	  Say yes to enable RTC driver for platforms based on the
>> +	  S32G2/S32G3 SoC family.
>> +
>> +	  This RTC module can be used as a wakeup source.
>> +	  Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 8ee79cb18322..a63d010a753c 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>>   obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..ad78423783da
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
>> @@ -0,0 +1,554 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/math64.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +
>> +#define RTCC_OFFSET	0x4ul
>> +#define RTCS_OFFSET	0x8ul
>> +#define RTCCNT_OFFSET	0xCul
>> +#define APIVAL_OFFSET	0x10ul
>> +#define RTCVAL_OFFSET	0x14ul
>> +
>> +/* RTCC fields */
>> +#define RTCC_CNTEN				BIT(31)
>> +#define RTCC_RTCIE_SHIFT		30
>> +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
> 
> Only use RTCC_RTCIE_SHIFT here,  just put 30 and remove
> RTCC_RTCIE_SHIFT.
> 

Hello Frank,

Thanks for your review.

I will remove 'RTCC_RTCIE_SHIFT' in V6.

>> +#define RTCC_APIEN				BIT(15)
>> +#define RTCC_APIIE				BIT(14)
>> +#define RTCC_CLKSEL_OFFSET		12
> 
> No used
> 

Thanks. I will remove it in V6.

>> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
>> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
> 
> use FIELD_GET
> 

Actually, I use 'RTCC_CLKSEL' in order to set the 'CLKSEL' value in the 
'RTCC' register.
Therefore, I believe I can use 'FIELD_PREP' instead.
I will consider it for V6.

>> +#define RTCC_DIV512EN			BIT(11)
>> +#define RTCC_DIV32EN			BIT(10)
>> +
>> +/* RTCS fields */
>> +#define RTCS_RTCF		BIT(29)
>> +#define RTCS_INV_RTC		BIT(18)
>> +#define RTCS_APIF		BIT(13)
>> +
>> +#define RTCCNT_MAX_VAL		GENMASK(31, 0)
>> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
>> +
>> +#define RTC_CLK_MUX_SIZE	4
>> +
>> +/*
>> + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
>> + * should not be used.
>> + */
>> +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
>> +
>> +enum {
>> +	RTC_CLK_SRC0,
>> +	RTC_CLK_SRC1,
>> +	RTC_CLK_SRC2,
>> +	RTC_CLK_SRC3
>> +};
>> +
>> +enum {
>> +	DIV1 = 1,
>> +	DIV32 = 32,
>> +	DIV512 = 512,
>> +	DIV512_32 = 16384
>> +};
>> +
>> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
>> +	"source0",
>> +	"source1",
>> +	"source2",
>> +	"source3"
>> +};
>> +
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	struct rtc_time tm;
>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	void __iomem *rtc_base;
>> +	struct clk *ipg;
>> +	struct clk *clk_src;
>> +	const struct rtc_soc_data *rtc_data;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	int dt_irq_id;
>> +	int clk_src_idx;
>> +};
>> +
>> +struct rtc_soc_data {
>> +	u32 clk_div;
>> +	u32 quirks;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +	.clk_div = DIV512,
>> +	.quirks = RTC_QUIRK_SRC1_RESERVED,
>> +};
>> +
>> +static int is_src1_reserved(struct rtc_priv *priv)
>> +{
>> +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
>> +}
>> +
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +	return div_u64(cycles, hz);
>> +}
>> +
>> +/**
>> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
>> + * current configuration.
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + * Returns: 0 for success, -EINVAL if @seconds push the counter past the
>> + *          32bit register range
>> + */
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 delta_cnt;
>> +
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * RTCCNT is read-only; we must return a value relative to the
>> +	 * current value of the counter (and hope we don't linger around
>> +	 * too much before we get to enable the interrupt)
>> +	 */
>> +	delta_cnt = seconds * priv->rtc_hz;
>> +	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(dev);
>> +	u32 status;
>> +
>> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
>> +
>> +	if (status & RTCS_RTCF) {
>> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
>> +	}
>> +
>> +	if (status & RTCS_APIF)
>> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
>> +
>> +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
> 
> Generally, iowrite32(status, priv->rtc_base + RTCS_OFFSET); should
> follow status = ioread32(priv->rtc_base + RTCS_OFFSET); Any specfic reason
> put it after rtc_update_irq()?
> 

Thanks for pointing this out. Indeed I will clear the interrupt flags 
before 'rtc_update_irq' call in V6.

>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +				     u32 offset)
>> +{
>> +	u32 counter;
>> +
>> +	counter = ioread32(priv->rtc_base + offset);
>> +
>> +	if (counter < priv->base.cycles)
>> +		return -EINVAL;
>> +
>> +	counter -= priv->base.cycles;
>> +
>> +	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
>> +}
>> +
>> +static int s32g_rtc_read_time(struct device *dev,
>> +			      struct rtc_time *tm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	s64 sec;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, tm);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc, rtccnt, rtcval;
>> +	s64 sec;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, &alrm->time);
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
>> +
>> +	alrm->pending = 0;
>> +	if (alrm->enabled) {
>> +		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +		if (rtccnt < rtcval)
>> +			alrm->pending = 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc;
>> +
>> +	if (!priv->dt_irq_id)
>> +		return -EIO;
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= RTCC_RTCIE;
>> +
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	struct rtc_time time_crt;
>> +	long long t_crt, t_alrm;
>> +	u32 rtcval, rtcs;
>> +	int ret = 0;
>> +
>> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	t_alrm = rtc_tm_to_time64(&alrm->time);
>> +
>> +	/*
>> +	 * Assuming the alarm is being set relative to the same time
>> +	 * returned by our s32g_rtc_read_time callback
>> +	 */
>> +	ret = s32g_rtc_read_time(dev, &time_crt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	t_crt = rtc_tm_to_time64(&time_crt);
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return -ERANGE;
>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_time(struct device *dev,
>> +			     struct rtc_time *time)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	priv->base.sec = rtc_tm_to_time64(time);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Disable the 32-bit free running counter.
>> + * This allows Clock Source and Divisors selection
>> + * to be performed without causing synchronization issues.
>> + */
>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc &= ~RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc |= RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = 0;
>> +
>> +	switch (priv->clk_src_idx) {
>> +	case RTC_CLK_SRC0:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
>> +		break;
>> +	case RTC_CLK_SRC1:
>> +		if (is_src1_reserved(priv))
>> +			return -EOPNOTSUPP;
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
>> +		break;
>> +	case RTC_CLK_SRC2:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
>> +		break;
>> +	case RTC_CLK_SRC3:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
> 
> Suggest a reserve_mask at platform data
> 
> if (priv->reserve_mask & (1 << priv->clk_src_idx));
> 	return -EOPNOTSUPP;
> 
> rtcc = RTCC_CLKSEL(priv->clk_src_idx);
> 

Looks better. I will refactor accordingly in V6.

> 
> 
>> +
>> +	switch (priv->rtc_data->clk_div) {
>> +	case DIV512_32:
>> +		rtcc |= RTCC_DIV512EN;
>> +		rtcc |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV512:
>> +		rtcc |= RTCC_DIV512EN;
>> +		break;
>> +	case DIV32:
>> +		rtcc |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV1:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	rtcc |= RTCC_RTCIE;
>> +	/*
>> +	 * Make sure the CNTEN is 0 before we configure
>> +	 * the clock source and dividers.
>> +	 */
>> +	s32g_rtc_disable(priv);
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +	s32g_rtc_enable(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rtc_ops = {
>> +	.read_time = s32g_rtc_read_time,
>> +	.set_time = s32g_rtc_set_time,
>> +	.read_alarm = s32g_rtc_read_alarm,
>> +	.set_alarm = s32g_rtc_set_alarm,
>> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>> +};
>> +
>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>> +			     struct device *dev)
>> +{
>> +	int i;
>> +
>> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
>> +	if (IS_ERR(priv->ipg))
>> +		return dev_err_probe(dev, PTR_ERR(priv->ipg),
>> +				"Failed to get 'ipg' clock\n");
>> +
>> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
>> +		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->clk_src)) {
>> +			priv->clk_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (IS_ERR(priv->clk_src))
>> +		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
>> +				"Failed to get rtc module clock source\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_priv *priv;
>> +	int ret = 0;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->rtc_data = of_device_get_match_data(dev);
>> +	if (!priv->rtc_data)
>> +		return -ENODEV;
>> +
>> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->rtc_base))
>> +		return PTR_ERR(priv->rtc_base);
>> +
>> +	device_init_wakeup(dev, true);
>> +
>> +	ret = rtc_clk_dts_setup(priv, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rdev = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(priv->rdev))
>> +		return PTR_ERR(priv->rdev);
>> +
>> +	ret = rtc_clk_src_setup(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rtc_hz = clk_get_rate(priv->clk_src);
>> +	if (!priv->rtc_hz)
>> +		return dev_err_probe(dev, -EINVAL, "Failed to get RTC frequency\n");
>> +
>> +	priv->rtc_hz /= priv->rtc_data->clk_div;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->rdev->ops = &rtc_ops;
>> +
>> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> 
> 'dt_irq_id' is too long. 'irq' should be enough.
> 

Agree. I will rename in V6.

>> +	if (priv->dt_irq_id < 0)
>> +		return priv->dt_irq_id;
>> +
>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->dt_irq_id, ret);
>> +		goto disable_rtc;
> 
> 
> Already enable rtc at rtc_clk_src_setup(), you direct return fail after
> check clk_get_rate();
> 
> if you want to disable_rtc, you use devm_add_action_or_reset() to add
> a disable action callback and return dev_err_probe() here directly.
> 
> Frank
> 

Thanks for pointing this out. I will use 'devm_add_action_or_reset' in V6.

>> +	}
>> +
>> +	ret = devm_rtc_register_device(priv->rdev);
>> +	if (ret)
>> +		goto disable_rtc;
>> +
>> +	return 0;
>> +
>> +disable_rtc:
>> +	s32g_rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void enable_api_irq(struct device *dev, unsigned int enabled)
> 
> s32_enable_api_irq()?
> 

I will rename this function in V6.

>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
>> +	u32 rtcc;
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= api_irq;
>> +	else
>> +		rtcc &= ~api_irq;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int s32g_rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	u32 rtcval, rtccnt;
>> +	int ret = 0;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Save last known timestamp */
>> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Use a local copy of the RTC control block to
>> +	 * avoid restoring it on resume path.
>> +	 */
>> +	memcpy(&priv, init_priv, sizeof(priv));
>> +
>> +	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
>> +	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
>> +	sec = cycles_to_sec(init_priv->rtc_hz, rtcval - rtccnt);
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	/* Reset RTC to prevent overflow.
>> +	 * RTCCNT (RTC Counter) cannot be individually reset
>> +	 * since it is RO (read-only).
>> +	 */
> 
> what's happen if overflow happen? I suppose it should go back to 0 and
> continue increase?
> 

Indeed if overflow happens the 'RTCCNT' counter goes back to 0 and 
continues to increase. The reason for resetting it here in 'suspend' 
routine comes after dropping the rollover support (as agreed on V4 of 
this patchset) to prevent an overflow during the standby state.

Best Regards,
Ciprian

>> +	s32g_rtc_disable(&priv);
>> +	s32g_rtc_enable(&priv);
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return -ERANGE;
>> +	}
>> +
>> +	enable_api_irq(dev, 1);
>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>> +
>> +	return ret;
>> +}
>> +
>> +static int s32g_rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	enable_api_irq(dev, 0);
>> +
>> +	ret = rtc_clk_src_setup(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings.
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>> +			 s32g_rtc_suspend, s32g_rtc_resume);
>> +
>> +static struct platform_driver s32g_rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= s32g_rtc_probe,
>> +};
>> +module_platform_driver(s32g_rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.45.2
>>


