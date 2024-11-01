Return-Path: <linux-rtc+bounces-2422-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2CD9B8DE1
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A9CA1C20FDB
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5924015A85A;
	Fri,  1 Nov 2024 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CjuW0mxw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC815697A;
	Fri,  1 Nov 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453488; cv=fail; b=pEEsTa8ZmV9SV3Lu78pd3HjluW5cOVuk7P1PlpMvaG+dNkY3KOfZ8Uxrtg2w+EAF2CQvyVPTQzIs62K5jw2ugJmqlmlV7ab3wxvzHG0v4keioaMWusFmKws1fsFrgUfZBtKu5M3xCb1xfbF38AKe+XE6Zhs4yflj7J0NfinujlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453488; c=relaxed/simple;
	bh=ih6PoczSw8Mc3yxOw1zidtvFIRwEBUA0qXgz/DnBFB8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DLdPjp/D1InpCdC+tEMDpO1xipEkJxs0qzoNmyYPjp/GWRt+q8KKD/s0/MyN1PyBG2cHUDxK+H5hpqU9afGGAlCSEvRvxzy/K4sokHPbuQmG86uu2I4kgYniwtqlEbsRbbZQWKQNat9XAzdUeiW+GSoC7akFkK4/twWs9+H/RXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CjuW0mxw; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2cVHGVQfJmIZ/iT3gj3sXykY0kWHISltVUdgYViEUstmVutpoY0U9QkZEppBpZ2VpH1dZHfGBlqvnsDXshzIuNBR54A/SJMfuJv8SdbzNE5MzGSX3Cj9FiH6k84iu6H1keS+Ous1URXuP+/uHBj+maBDmm0/mJNltz+vdxN3TG3T8AnCx3WeJcNGcz9uD9gPrK8yECHgLudcQkZkMxMu9MG01KCMNkEyOSDFgtXkLlD8EPNhDN0r0Oi7ZA0a1SJDLLF4+ScVywkepBQz1h1Hnic1pEL6XZ3EeNgH2ecAi4QaZuQevieibbcgs7U6CmrHffI0j4yhtT+G7Cj2vQdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHsP0bLJYgDQJzFB4t6nnf9NOkH3WrSXy0gq+z3q6uk=;
 b=F8cHs012zOXT6A/i9sYBO/qrRBIoYL9O8l4hIjwSWPpNYi2EUx1VfSTylYJrTQt4CWO6Puy4bFNEWh/4dbfJHCNGEKnVbCCPZqW3O4dY3yWQYT11UQrDgp3+HPlo83s/KoM2GrQVLfH+svpp9STkw/8I8S20SKbkryU+DL7Nc07OEwued73IVDPrUjNJZIcGffBqlltMDKVOsntU1sMqU+toLf/5s1865pVVHQYrL7X4K8GgbuVMOIpUKnlU15Cc/Y2OKs+NfWBIH1CK79wAuXcqA9KriiGE1eFYmdK7PUa1lszai6WHFtL9Dn9HwbhYyGp7L3OgLIjWh2MWZ6Q4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHsP0bLJYgDQJzFB4t6nnf9NOkH3WrSXy0gq+z3q6uk=;
 b=CjuW0mxwLnuLSeto0fqcOSJRbVfMbOwgAyTW3NH9UcBmhutK4xi7gnlFG3NWwr7PcY5ENfJCEyiF6WDN57HbIRo39J2qv/7nyrX81StfJnUpJfI5UrEAVsRNIcGlkfmdAUCjzph1MJu6IroR9BKDdKMvevg4ag9hVW7Ge9Oyeg779VjMlIBbjmvJBEtLCIkzcHN8nEV5hazXMo/asgmsWVMope1oePD53vaV1Mxd67AUedbUINyynzNuycEQWgVETVhRuylEE+/EcSXPqMFK34qyxFbqnWfunZWDBWiuUHMAeE+8my1mXqiI2H1W/njuMwrbAfDSQR9Z2qhQL2tGUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 09:31:15 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Fri, 1 Nov 2024
 09:31:15 +0000
Message-ID: <3e1b4165-d622-43cd-80a0-24c76b7f71f4@oss.nxp.com>
Date: Fri, 1 Nov 2024 11:31:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 IMX Review List <imx@lists.linux.dev>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
 <ZyO1vju0l522+oSB@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZyO1vju0l522+oSB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: 3106a54e-302f-43c9-887f-08dcfa57ee97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzJPLzd3OSs0MjZUc09MUFpXSzJNT1NkbkQ0eGNVeGVzMVdKNldxME1wWVFT?=
 =?utf-8?B?UWhkL3hqdkF6eC82RVdGaHpTTnRMaERzbTdwb3ZLTS9QZWdldjdFVk52bW53?=
 =?utf-8?B?WE5TNXBpNlJDeGsvWGE3REtTUFlrSWcyTG9JT2djK1daTG5TaXR0NVp6bU15?=
 =?utf-8?B?U3NUYlRhdjZmcEZwNkM1ZDc1bUEvMDlHdTJCTkdYNExqVnVObzIvTHFaNVA0?=
 =?utf-8?B?cWg4RWRCZ2JYdkdna1VMcWZ3N1htbFhuS2RlWjFEbGp4NEROYTBhL2xXU3F5?=
 =?utf-8?B?S0dSTTV2dUVFY2ExNmJ5OHNQWFc4dTNsTHZDeUpnYkJqZTN1a1FVemdOcG15?=
 =?utf-8?B?T2VsV0I2Y29xOC94bEdla2k5TkkrdjJyM3luTzFaK2Y3S0VBK3ROa0tDc3la?=
 =?utf-8?B?NkpKU1NsZ1ZkUDVqSVIzYVB4V2gzVXFFNEVBbEhKTklIcUphdnZoUG5XUmJ1?=
 =?utf-8?B?SFlTZHV6MkpSNThSTFRJKy9tVlZJUWVDa3FpTVMyZGlTc0FJV2EvSFpSSTUx?=
 =?utf-8?B?cDRBanFKT3pDdm8rcS9OMnhvVUZ4N1BncmZ0blB0TEUrN3NoWFd3Wm5Kdmxy?=
 =?utf-8?B?ZlJnNEZmMkFwOHY2SEJGWjRDNHYwUlVlL0Q5d2w4U3ZsQUNVUGZGVnpJakpo?=
 =?utf-8?B?Um4vYzdSNm8xWE9Ga0ZvakZqaWZIdDJmcjZMMXBJajdvdng2MytyYmNwMTEw?=
 =?utf-8?B?ODVRY1pPR081NEIrb2JHYUs0d1YzY0IyTW5pZklDMGNQVVpBVm92dkc5RTNt?=
 =?utf-8?B?M0NxVUlsSzV1VVBiOWVxTXNpZXZ4VXJNVmlOMTRjZ3ROWS8weVlNZU1Pd2Y1?=
 =?utf-8?B?ZjduR0xUempIWHVWRStiaDFneCsxVy91VnBpSnNBTU9DS1R1QXoxVFhFNWdk?=
 =?utf-8?B?dnFtb1NDc3BkNkxIOHJrRUZwN1R4bFNObHJZZ0JYUzhmQmpGUkh4aHYzZFI5?=
 =?utf-8?B?dGpEcUFpblZ6QXpiRUFjaU9XMVpRWnl6SWNHYTVxT2FuelczY29oVWFZTzUz?=
 =?utf-8?B?Tnd1MVJmZDQvYW8rRlROWG00QTUwNzlmbzVTTDhRSzMzMWx2eVo2bzhSVE9j?=
 =?utf-8?B?aDM0S0phaEJtckVpdHlQbU9tbnZMMWU1b3E4UWNSbVlJN3Nrdy9lUkkwdGNC?=
 =?utf-8?B?YkEra3laQXVXRHJ4RVczY0JLYlVFemliL1NSRDdsL3VVOFlmN2x0WE5jcmxw?=
 =?utf-8?B?ZFVtVnNqMStxZ0NFN0svVXZ6VHhabFAvN0Y3QVBwZHlCamoxQkgxeXZLeHRM?=
 =?utf-8?B?ajZEc2x1Y2NjcEZqU2pLWExFalhoNGFlS1pRcnlia2dLR3REeFVvZVJoU29a?=
 =?utf-8?B?Uzl6SUV0ZVgvTmpNVFV6Y3lVY3JOUEtmRzl3NDIwcmU3ZWJmTjl1QVQ1VTBT?=
 =?utf-8?B?eUQ2ZW1Qd3FMWHF2VEtuL055bk9tY3M1MHpwNnJyTEVSV2xmZnpnZ1NQNVBX?=
 =?utf-8?B?SVpCQjBlRG9SM1NJdWlqYjJpdVQ0b2dwYWtLa1lEdFI5K3JrT3dEV2lNOGhC?=
 =?utf-8?B?ZlBGNnQxSFgvOU9DNThIYkxYTXo3U1JkYlN0NVpwcS82Z2cwcU1MR0tUMnZ6?=
 =?utf-8?B?OXFweERkckV5dkQ5SVZ5RzJFVFhJN1JaNUZkN01kOFJDVTAyL2FNRnB1dllK?=
 =?utf-8?B?RjV3N203UE5GOGVZVEtUMTFyOStzbks0cUlzek0rWm82Zi9kd2dyQ2hQRmNE?=
 =?utf-8?B?QkhVdisyelIxL1c0U2dHTFg0MlhaMURmUysrdUhLWEROZzB2M3BUalI2Y09T?=
 =?utf-8?Q?i8FuWKOc1j+HY9bTjICGLUJzuOD7EP2GkBWHQAZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVxZkJyVGsyZkdBTm5UREpCUkFlU1I5dC8rcnJsVkdSdGdoZC96VXpHSHM2?=
 =?utf-8?B?UGlsNlhNVUp0dUdCSU5DTXp4cGpCYXMzcVp6UWRBWGwxOUZCNldhTzJhdDNh?=
 =?utf-8?B?bXJ5WWZqc3ZGM2NKMlZhRmM2U0NpY045anh6VDYvTVY5UkgzTlNMMEZnblEr?=
 =?utf-8?B?NGlBTjZqUTVRU1EwejUwMWJrYU1IdUMxeTVyMXRHVWtmdThZK2FodmlIQlBV?=
 =?utf-8?B?MVRXcCtZb25DSmdhaktpVE10cGg2NHJjb0dzekJzY3ZpUU1PRXlyRmN4ejla?=
 =?utf-8?B?VmJDVHRhL3ZWQlUwWDFmRVA1WHFIdmdibU5qeXdLazhOL2habDUxUFNpRG4r?=
 =?utf-8?B?VWJLSzZ0NFB6QktSbjNmU042TVh4cmNwTXZ1aGN5YW9KTmNzT2xSbkF4aVA2?=
 =?utf-8?B?TzNkeFBnb2JyWTdyUE5XdjBVZXNOT0NMdW1oaS81MVVsTzdTSWZaRjhkdHBP?=
 =?utf-8?B?MTgzNlFwNENTZEcrUk9ER1NPcDZCZmZWZVpPK0dNclRUbENiNXQ2MzNIMWly?=
 =?utf-8?B?bWxkR0xNMERTaTZxeFErZHNRSjhRTjVZWjdUcE5HUnJSTk1xS21vTGMzWEQ2?=
 =?utf-8?B?b2JYUjlkbEl4YUw1RnFwZ3hncG5rRlZWb09jeFgxOENYdGNSSmxCclppaG1P?=
 =?utf-8?B?RDdweHVDSjZFRDlIOXUrSjhBVTZmOElsWmthYVlhb0N6NFRnYnA2czlDc2tP?=
 =?utf-8?B?ZUZMUm5xTVRYTjR0Rnk0cm9GZmQrTVRnOWpkbjNpOGp4SFI0MXFoTmJWUU9i?=
 =?utf-8?B?WDhIQkN1VGthbWdCK0V4OVJQTFluSmY3ZlU1UGNVeUFTc3NEOWhlTkNSMitR?=
 =?utf-8?B?b0pCa05DNG5NZGNMQUFnOTZwZkthdHBJN2IxRU05Rm1Ud0tXTEUzS2paaFRT?=
 =?utf-8?B?QjladzFkaDgwNHdHMWdPNzNVa1o4Qzk5TkM2Ykg5YW5VMlRXNEJYbisrN3pv?=
 =?utf-8?B?YWxxS0ZyRks0VzIzT3ZKamU2TGR2TEVLYm1vM0dWQ2RJMmNYTklsUTZYMGRO?=
 =?utf-8?B?YUxVUk9hbE9YR1ZBcFVKdUFYbXVoZnl4aWNzTVdvdEtJSXYwY2JKUHF5cHA4?=
 =?utf-8?B?RDlRWVcyNVNmSklSb3ZOVGlNUEY5QVBFQUhpMEtqY1RPNnZBa1EzRWlZVWMw?=
 =?utf-8?B?Vys0TjlLVHhncS9LTStyZGJlVzVlRnhsQ0twN3BERjJzOEtKWTRLZzllbHpX?=
 =?utf-8?B?a2RIN1k2SEh5UG1XOWFXcGVDeGhDTWJGMDc4Q2UrZDEyaE50Z2czZldtcDhP?=
 =?utf-8?B?WlJJZklldTRPQ3prQUlGL0tUTGR5cytsQmxid3RKSWFSeVFIdzNMYk1FQ3BY?=
 =?utf-8?B?UVhzTE5XSUg2YzFDc2tFRnJnS3pzSVJqVkNOWWV4SS9lMTM1T0Jrd2daSmtW?=
 =?utf-8?B?WG9Oa1JJRkxmNWFyVUpQMWpkcEhvemVJS25BZFJsTm9ZeWh4d2FGTFVvZ3ZI?=
 =?utf-8?B?eXdMY1dMK0laUTFOdkw4TnlzZVUzRTVRSGlSaUhYTENmN2YxeS9mdXgrb2N0?=
 =?utf-8?B?SEwzanZIV1VQL1pqdENkbGtJT3BQaXVpM0lJRlQ1Sk80aURFOW1uanBYakZP?=
 =?utf-8?B?S3liR2xzV3pLNGR4MXI5aWw1dDU5NGttamxJYXJ3UmxNRG1oejZuSmZsdlk1?=
 =?utf-8?B?M1NQZ0tDWU92T3JyckorL29kNlhZTS9vcHNwb2NPQ2dUWXNBRExFYi9zNWh6?=
 =?utf-8?B?MVN6UWVwTzA1SU1pWkwrQkFXSkRBM1dWc28xd0E5eDErZkVLWndqbklLd3ZB?=
 =?utf-8?B?MTRybWFMQ0Q3bk5hVzhyMlIwT2JjZC8rOFVWekVnc3M0a0k3MllVSXFKcmQ5?=
 =?utf-8?B?K1oxTDM5RHZpVzAyWENjOFBvLzBEWlVUQUVKVTlGT0s0VnBQWmhHVXp6MitO?=
 =?utf-8?B?eTNQd3RydFdpdjJ4UWZSNUJjWnp2QTZWQnpEZ0RrM3oyRkNkTnVOaFN5bDdF?=
 =?utf-8?B?NUN5dmZIMGptM0FSdnUxdUEyZHlwaEx0QTlMVWNXVlFIYnhpWWF1aDA3NWxr?=
 =?utf-8?B?NDc2TFFvS1ZUSkNVTkRwTWhXYlV0bmRZY1daeURHZUhEWnUrZVQ3UmRvVTVW?=
 =?utf-8?B?bUR1RXI2KzIzazZJNmVhVlZBZmxTaEtpZllwam5NQzhqK1Fnb1lqZHQzRnBE?=
 =?utf-8?B?c0dBdzdIeXBZeE9sYnZ1enhyeFV3Z1BYaTBidjRzZytJSEpYNlZuVnY1aUxP?=
 =?utf-8?Q?H5NBx1Ysj1IdJ5U+6SyxmK0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3106a54e-302f-43c9-887f-08dcfa57ee97
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 09:31:15.3791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brsr1uT2jUlmpuQSalC+YosdT1kCeYOmIEuxePu8n9GVwJpEnGpJOw8TNgASeOWluaKj/J7Wwsjc2rvEiqmXgrBThNKA9yQzMmoo7ho5s/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557

On 10/31/2024 6:52 PM, Frank Li wrote:
> On Thu, Oct 31, 2024 at 10:35:55AM +0200, Ciprian Costea wrote:
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
> 
> wrap at 75 chars.

I will update in V4.

> 
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 803 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 815 insertions(+)
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
>> index 000000000000..a05e23ece72a
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
>> @@ -0,0 +1,803 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/math64.h>
> 
> order by alphabetical

I will update in V4.

> 
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
>> +#define RTCC_ROVREN				BIT(28)
>> +#define RTCC_APIEN				BIT(15)
>> +#define RTCC_APIIE				BIT(14)
>> +#define RTCC_CLKSEL_OFFSET		12
>> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
>> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
>> +#define RTCC_DIV512EN			BIT(11)
>> +#define RTCC_DIV32EN			BIT(10)
>> +
>> +/* RTCS fields */
>> +#define RTCS_RTCF		BIT(29)
>> +#define RTCS_INV_RTC		BIT(18)
>> +#define RTCS_APIF		BIT(13)
>> +#define RTCS_ROVRF		BIT(10)
>> +
>> +#define ROLLOVER_VAL		GENMASK(31, 0)
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
>> +#define to_rtcpriv(_hw)	container_of(_hw, struct rtc_priv, clk)
>> +
>> +enum {
>> +	RTC_CLK_SRC0 = 0,
> 
> needn't set to 0 here.

Correct. I will update in V4.

> 
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
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	u64 rollovers;
>> +	struct rtc_time tm;
>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	u8 __iomem *rtc_base;
> 
> generally it void, not u8

Thanks. I will update accordingly in V4.

> 
>> +	struct clk_hw clk;
>> +	struct clk *ipg;
>> +	const struct rtc_soc_data *rtc_data;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	u64 rollovers;
>> +	int dt_irq_id;
>> +	int runtime_src_idx;
>> +	int suspend_src_idx;
>> +	u32 runtime_div;
>> +	u32 suspend_div;
>> +};
>> +
>> +struct rtc_soc_data {
>> +	int default_runtime_src_idx;
>> +	int default_suspend_src_idx;
>> +	u32 default_runtime_div;
>> +	u32 default_suspend_div;
>> +	u32 quirks;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +	.default_runtime_src_idx = RTC_CLK_SRC2,
>> +	.default_suspend_src_idx = RTC_CLK_MUX_SIZE + RTC_CLK_SRC0,
>> +	.default_runtime_div = DIV512,
>> +	.default_suspend_div = DIV512,
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
>> +/*
>> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
>> + * current configuration.
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
>> + *          twice the rollover interval
>> + */
> 
> If you want to use kernel doc, comment is /** at first line.

Thanks. I will update the comment in V4.

> 
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 rtccnt, delta_cnt;
>> +	u32 target_cnt = 0;
>> +
>> +	/* For now, support at most one rollover of the counter */
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * RTCCNT is read-only; we must return a value relative to the
>> +	 * current value of the counter (and hope we don't linger around
>> +	 * too much before we get to enable the interrupt)
>> +	 */
>> +	delta_cnt = seconds * priv->rtc_hz;
>> +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +
>> +	if (~rtccnt < delta_cnt)
>> +		target_cnt = (delta_cnt - ~rtccnt);
>> +	else
>> +		target_cnt = rtccnt + delta_cnt;
>> +
>> +	/*
>> +	 * According to RTCVAL register description,
>> +	 * its minimum value should be 4.
>> +	 */
>> +	if (unlikely(target_cnt < 4))
>> +		target_cnt = 4;
>> +
>> +	*rtcval = target_cnt;
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t rtc_handler(int irq, void *dev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(dev);
>> +	u32 status;
>> +
>> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
>> +	if (status & RTCS_ROVRF) {
>> +		if (priv->rollovers == ULONG_MAX)
>> +			priv->rollovers = 0;
>> +		else
>> +			priv->rollovers++;
>> +	}
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
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int get_time_left(struct device *dev, struct rtc_priv *priv,
>> +			 u32 *sec)
>> +{
>> +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	if (rtcval < rtccnt) {
>> +		dev_err(dev, "RTC timer expired before entering suspend\n");
>> +		return -EIO;
>> +	}
>> +
>> +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
>> +
>> +	return 0;
>> +}
>> +
>> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +				     u32 offset)
>> +{
>> +	u64 cycles, base_cycles;
>> +	u32 counter;
>> +	s64 sec;
>> +
>> +	counter = ioread32(priv->rtc_base + offset);
>> +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
>> +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
>> +
>> +	if (cycles < base_cycles)
>> +		return -EINVAL;
>> +
>> +	cycles -= base_cycles;
>> +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
>> +
>> +	return sec;
>> +}
>> +
>> +static int s32g_rtc_read_time(struct device *dev,
>> +			      struct rtc_time *tm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	s64 sec;
>> +
>> +	if (!tm)
>> +		return -EINVAL;
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
>> +	u32 rtcc, sec_left;
>> +	s64 sec;
>> +
>> +	if (!alrm)
>> +		return -EINVAL;
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
>> +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
>> +		alrm->pending = !!sec_left;
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
>> +	/*
>> +	 * RTCIE cannot be deasserted because it will also disable the
>> +	 * rollover interrupt.
>> +	 */
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
>> +	if (t_alrm <= t_crt) {
>> +		dev_warn(dev, "Alarm is set in the past\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		/*
>> +		 * Rollover support enables RTC alarm
>> +		 * for a maximum timespan of ~3 months.
>> +		 */
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret) {
>> +		dev_err(dev, "Synchronization failed\n");
>> +		return ret;
>> +	}
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
>> +	if (!time)
>> +		return -EINVAL;
>> +
>> +	priv->base.rollovers = priv->rollovers;
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
>> +static int get_div_config(unsigned long req_rate,
>> +			  unsigned long prate)
>> +{
>> +	if (req_rate == prate)
>> +		return DIV1;
>> +	else if (req_rate == prate / (DIV512 * DIV32))
>> +		return DIV512_32;
>> +	else if (req_rate == prate / DIV512)
>> +		return DIV512;
>> +	else if (req_rate == prate / DIV32)
>> +		return DIV32;
>> +
>> +	return 0;
>> +}
>> +
>> +static void adjust_dividers(struct rtc_priv *priv,
>> +			    u32 div_val, u32 *reg)
>> +{
>> +	switch (div_val) {
>> +	case DIV512_32:
>> +		*reg |= RTCC_DIV512EN;
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV512:
>> +		*reg |= RTCC_DIV512EN;
>> +		break;
>> +	case DIV32:
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	priv->rtc_hz /= div_val;
>> +}
>> +
>> +static unsigned long get_prate_by_index(struct clk_hw *hw,
>> +					u8 index)
>> +{
>> +	struct clk_hw *parent;
>> +
>> +	parent = clk_hw_get_parent_by_index(hw, index);
>> +	if (!parent)
>> +		return -EINVAL;
>> +
>> +	return clk_hw_get_rate(parent);
>> +}
>> +
>> +static int rtc_clk_determine_rate(struct clk_hw *hw,
>> +				  struct clk_rate_request *req)
>> +{
>> +	struct rtc_priv *priv = to_rtcpriv(hw);
>> +	struct device *dev = priv->rdev->dev.parent;
>> +	int i, num_parents = clk_hw_get_num_parents(hw);
>> +	u32 config;
>> +
>> +	for (i = 0; i < num_parents; i++) {
>> +		config = get_div_config(req->rate, get_prate_by_index(hw, i));
>> +		if (config) {
>> +			if (i < RTC_CLK_MUX_SIZE)
>> +				/* Runtime clk source divisors */
>> +				priv->runtime_div = config;
>> +			else
>> +				/* Suspend clk source divisors */
>> +				priv->suspend_div = config;
>> +
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	dev_err(dev, "Failed to determine RTC clock rate\n");
>> +	return -EINVAL;
>> +}
>> +
>> +static u8 rtc_clk_get_parent(struct clk_hw *hw)
>> +{
>> +	struct rtc_priv *priv = to_rtcpriv(hw);
>> +
>> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
>> +		RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
>> +}
>> +
>> +static int rtc_clk_src_switch(struct clk_hw *hw, u8 src)
>> +{
>> +	struct rtc_priv *priv = to_rtcpriv(hw);
>> +	struct device *dev = priv->rdev->dev.parent;
>> +	u32 rtcc = 0;
>> +
>> +	switch (src % RTC_CLK_MUX_SIZE) {
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
>> +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv->rtc_hz = get_prate_by_index(hw, src);
>> +	if (!priv->rtc_hz) {
>> +		dev_err(dev, "Failed to get RTC frequency\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (src < RTC_CLK_MUX_SIZE)
>> +		adjust_dividers(priv, priv->runtime_div, &rtcc);
>> +	else
>> +		adjust_dividers(priv, priv->suspend_div, &rtcc);
>> +
>> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
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
>> +static int rtc_clk_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +	struct rtc_priv *priv = to_rtcpriv(hw);
>> +
>> +	/*
>> +	 * 0-3 IDs are Runtime clk sources
>> +	 * 4-7 IDs are Suspend clk sources
>> +	 */
>> +	if (index < RTC_CLK_MUX_SIZE) {
>> +		/* Runtime clk source */
>> +		priv->runtime_src_idx = index;
>> +		return 0;
>> +	} else if (index < RTC_CLK_MUX_SIZE * 2) {
>> +		/* Suspend clk source */
>> +		priv->suspend_src_idx = index;
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
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
>> +static const struct clk_ops rtc_clk_ops = {
>> +	.determine_rate = rtc_clk_determine_rate,
>> +	.get_parent = rtc_clk_get_parent,
>> +	.set_parent = rtc_clk_set_parent,
>> +};
>> +
>> +static int priv_dts_init(struct rtc_priv *priv, struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +
>> +	priv->ipg = devm_clk_get(dev, "ipg");
>> +	if (IS_ERR(priv->ipg)) {
>> +		dev_err(dev, "Failed to get 'ipg' clock\n");
>> +		return PTR_ERR(priv->ipg);
>> +	}
>> +
>> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
>> +	if (priv->dt_irq_id < 0) {
>> +		dev_err(dev, "Error reading interrupt # from dts\n");
>> +		return priv->dt_irq_id;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_priv *priv;
>> +	static const char *parents[RTC_CLK_MUX_SIZE * 2] = {
>> +		"rtc_runtime_s0",
>> +		"rtc_runtime_s1",
>> +		"rtc_runtime_s2",
>> +		"rtc_runtime_s3",
>> +		"rtc_standby_s0",
>> +		"rtc_standby_s1",
>> +		"rtc_standby_s2",
>> +		"rtc_standby_s3"
>> +	};
>> +	struct clk_init_data clk_init = {
>> +		.name = "rtc_clk",
>> +		.ops = &rtc_clk_ops,
>> +		.flags = 0,
>> +		.parent_names = parents,
>> +		.num_parents = ARRAY_SIZE(parents),
>> +	};
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
>> +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
>> +				"Failed to map registers\n");
>> +
>> +	device_init_wakeup(dev, true);
>> +
>> +	ret = priv_dts_init(priv, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(priv->ipg);
> 
> use devm_clk_* function

Thanks for this suggestion. I will make this change in V4.

> 
>> +	if (ret) {
>> +		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
>> +		return ret;
> 
> return dev_err_probe()

Ok. I will update in V4.

> 
>> +	}
>> +
>> +	priv->rdev = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(priv->rdev)) {
>> +		dev_err(dev, "Failed to allocate RTC device\n");
>> +		ret = PTR_ERR(priv->rdev);
>> +		goto disable_rtc;
> 
> after use devm_clk*
> 
> return dev_err_probe()
> 
> Frank
> 

Thanks for this suggestion. I will update accordingly in V4.

>> +	}
>> +
>> +	if (!of_property_present(dev->of_node,
>> +				 "assigned-clock-parents")) {
>> +		/*
>> +		 * If parent clocks are not specified via DT
>> +		 * use SoC specific defaults for clock source mux
>> +		 * and divisors.
>> +		 */
>> +		priv->runtime_src_idx = priv->rtc_data->default_runtime_src_idx;
>> +		priv->suspend_src_idx = priv->rtc_data->default_suspend_src_idx;
>> +		priv->runtime_div = priv->rtc_data->default_runtime_div;
>> +		priv->suspend_div = priv->rtc_data->default_suspend_div;
>> +	} else {
>> +		priv->runtime_src_idx = -EINVAL;
>> +		priv->suspend_src_idx = -EINVAL;
>> +	}
>> +
>> +	priv->clk.init = &clk_init;
>> +	ret = devm_clk_hw_register(dev, &priv->clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register rtc_clk clk\n");
>> +		goto disable_ipg_clk;
>> +	}
>> +
>> +	ret = of_clk_add_hw_provider(dev->of_node,
>> +				     of_clk_hw_simple_get, priv->clk.clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to add rtc_clk clk provider\n");
>> +		goto disable_ipg_clk;
>> +	}
> 
> why rtc is the clock provider?
> 

RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 
4 different clock sources (parents).
By using this CCF framework I am selecting a specific clock source (parent).

> 
>> +
>> +	if (priv->runtime_src_idx < 0) {
>> +		ret = priv->runtime_src_idx;
>> +		dev_err(dev, "RTC runtime clock source is not specified\n");
>> +		goto disable_ipg_clk;
>> +	}
>> +
>> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		goto disable_ipg_clk;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->rdev->ops = &rtc_ops;
>> +
>> +	ret = devm_rtc_register_device(priv->rdev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register RTC device\n");
>> +		goto disable_rtc;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>> +			       rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->dt_irq_id, ret);
>> +		goto disable_rtc;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_ipg_clk:
>> +	clk_disable_unprepare(priv->ipg);
>> +disable_rtc:
>> +	s32g_rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void rtc_remove(struct platform_device *pdev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
>> +
>> +	s32g_rtc_disable(priv);
>> +}
>> +
>> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
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
>> +static int __maybe_unused rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	int ret = 0;
>> +	u32 rtcval;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (init_priv->suspend_src_idx < 0)
>> +		return 0;
>> +
>> +	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
>> +		return 0;
>> +
>> +	/* Save last known timestamp before we switch clocks and reinit RTC */
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
>> +	ret = get_time_left(dev, init_priv, &sec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	s32g_rtc_alarm_irq_enable(dev, 0);
>> +	enable_api_irq(dev, 1);
>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	enable_api_irq(dev, 0);
>> +
>> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>> +			 rtc_suspend, rtc_resume);
>> +
>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove	= rtc_remove,
>> +};
>> +module_platform_driver(rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.45.2
>>


