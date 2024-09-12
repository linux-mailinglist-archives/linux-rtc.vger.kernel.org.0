Return-Path: <linux-rtc+bounces-1957-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F069797670E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01E31C233E9
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 10:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F65E19F418;
	Thu, 12 Sep 2024 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tuHOWN99"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023A18BC07;
	Thu, 12 Sep 2024 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138567; cv=fail; b=Fwn7eWrhPcrM8Uthn2lElUFspVhTzQ0ol5P4fJ50ZuuBNcddAfoRkwpu1FmeBjHjsbCaWQZ6VRRzYFXILQlGhN6VJEOrfSqPYrL9zZb000qRzrxTfbdtpHIgUidsdhIVo4zmkh1hYxFSznXnGPmhlVOBuUiC55iVEjdThOfQwow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138567; c=relaxed/simple;
	bh=9EpPgRLrrBfORdnicmt8O0rJH8NPH9jPDYHCMEbrf58=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nzwlchTF5wLYEF7bDPa2uU7M0B6OYmN0gjPnk25OcBoxifRZ9G6w8GHOaJmHmoCa2sAxLRtXkImyItchMVsNqZuhXwpF45ync1V7h4fN50RCl5lzsH+sLwN5jjDpbOVoC1nu9E0AzqHEadVCJLOgRwvSc3C4Z3L/k5J31fnoZoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tuHOWN99; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YO19PiOREFHkTCv2NIkV3Y17b2JBjGkpQad4HksQ6U5Mo30Rdg+LxzeHlYqAvLWYAUU/YXtKxgumWeGod3tLKpFOiFyOVoste4ugnR5e+HiXrHaWLLa9Cd0QNaYedXn3LEr4+O8yICiho9fBF9tcQ11qx8z/n5eXTJTK9bJkid7zdm5K3aZze6J+vhsTAAPapg1iq0smWKwTYZmcHPCW6yoWTJRT+rEzN8JxkrY8lTjRUGUKdZ/4DLogz1njoPZYIwODf9uRSgXeMOq4FXEM6LcRB2ESIM4ga1PCo95NFc3hN0yviVtrySdOXHk4HJC2RJM2Q5Jm9C3YUBnWMRnTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPztL3PakQmqH0l/Om6NCZahG/JGMGobvFrLGVi9abY=;
 b=FlzQ29HnFAPXnxFwhO2H1FI3b63TDBd/B/kM9OclifEqo5Wh78S/8qpW1YVlCA4Zu+rCn72pjzSMoV3Pg+K9+RFsNTioMgSB2aE4+WjtL0s0+X+pDkBzgwpTuwy755FMJ86W3oPWbLL1Gqdgt0/WkmO5rdNUoHhwUskkbDCrjfDM2eaUyN9l3yDRBC8SsKhqMly7nBuTERrlBkUsamOtTDt4oA7GVqzylrIgAZ14YZw1MRZTpTXWCYX6UfY1rtVw/6MpiXcvV1v/nZ5l7/AglZuBUUo1BnE8n58HoRjE46zz9smkOhM0YWV2XQRlokROgmbe0CK+g8kd62oKuR1Vfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPztL3PakQmqH0l/Om6NCZahG/JGMGobvFrLGVi9abY=;
 b=tuHOWN99VvtjDNeSSLKhlUpwuBgdbN0MnnVxAzPMCoSYfni64AVwDu6ZdvNCXq7O7pJGktUxyQtqkYP4uSbxbeGMlx+CNbMK96XZXap7Sxv1YBlDehHw6kcsu6iWGt8ykZO2k6iB55R00bf9TRzhbbl3DMOf2ibA6OOx8/3uOz/RCG5tCUxbuWCs5iN6/QDcD/+sRmBWCqQtUhmQ8xncj3TpwW0np2ce1hdoMO7XQcVBbtKVlpx7Q9W8IjAGkQS/tZzD7oX/VmZngAKmd3YCtup60tDn5AfKWaH6ZBfy0lKLKC8l3mLlJVnTg0Y3kaIZ9lIMCNkgff8FT76xImtQ6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 10:56:00 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 10:56:00 +0000
Message-ID: <2aa1d3ff-bc9b-4c1f-a6d7-5673981d0ed6@oss.nxp.com>
Date: Thu, 12 Sep 2024 13:55:34 +0300
User-Agent: Mozilla Thunderbird
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-caretaker-dropper-424e102f8634@spud>
Content-Language: en-US
In-Reply-To: <20240911-caretaker-dropper-424e102f8634@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::8) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: a81b13a7-3e42-4c40-f8c5-08dcd3197cb6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFZCZjU0Y3NSeEZ6Nlpsa2ptZGYzdlVwU1pyWXAwTGlHWWt5N2JheGMxSHhk?=
 =?utf-8?B?RFRpYXBBQ1d5aHhjSmp6b21kNFJSd0ZUVXNEVUpDQ0N1K2lYVmc0VzV2S29E?=
 =?utf-8?B?eEpJTkxkSWlzY0RDYzZQT2VzaEkrSnlmby9oVHR4OUZ4SXF5ZjkwcDVMTE11?=
 =?utf-8?B?K3VCYkxQVHZvMUxCOER1NVNqY0tua2JMZXNkeWs2aHNJVTV2RmRIVURpWkli?=
 =?utf-8?B?QWprK01kbHJmMWVEQ2VnQU9sUHlaME1QZnMyMXFrN0pDbnY1TEMya1ZqTWhV?=
 =?utf-8?B?UmpHcy9DYXpqV2YrendCT3NhTU1iRFBBY1hkZUl0eGw5eTBybDFHR2QxQXd2?=
 =?utf-8?B?UnBNaGp5NkFkRy9ucXdnbTFBV1FxbU5XQTlIOVZqcGpWNmROTWZta3NRY3gv?=
 =?utf-8?B?dk16TGswd3k5blNrSjRmZ1NtUVF4RlJwTDRXVk9CNHh5dmQ3eGtBVXVlc05R?=
 =?utf-8?B?OUZPYXc2OEdSQ1ZQSFJFaS9sbUZLaVQ3M0dHQ0FHYkNENExRalI1V3hNWTQ3?=
 =?utf-8?B?QXl3SXkwTXhOTk9EeUlZRmlTYnpxb3NIYzRtYWRNenBYR1dLK3V3WVdiQnJE?=
 =?utf-8?B?SGNMSnNMTXRYUDZNQ1QvOUVLNU1Eek5RMENDWmxIdi80TmxXRmVFN1NmYklK?=
 =?utf-8?B?VzhnbGVmejluUlV1a1VZTWFaeEtKRFNmT2FpT3VYTFplbzF5a2tOUjh5MER2?=
 =?utf-8?B?L2lwQk92d21vc2JaamhlYllNbEN6cUFyVGVFcW1OeWVhd1ZwTDR2aGFaS3Ux?=
 =?utf-8?B?T2gxOXR3MFVSMjJCODFTYjBGNVRJSTFWbVoyTXF1ZGhmS1NZU01zRi9sK3Mz?=
 =?utf-8?B?Wm1TdG5XTGxvTThPZUw5dVZ2b3RnckVQL1QrNEQzQTg4UmhYVDJMU2RHcEVN?=
 =?utf-8?B?bGNTMmUrOEUwUE5NUTJ0dm54b2l1bEltRUJKTnpSNDNPdHA3NFlTdjhWQUNP?=
 =?utf-8?B?SHZTbThZY1lwNUFUcU9BOUhBNXhzbEwyL0xJc2JrR0RaRGx0SDU0WWp4OTdZ?=
 =?utf-8?B?NVlEczIyVWY2cW8vZU83b3lmU3ZLNzcwOG92Zis1NzRiOVEwbWFRLyt1UVVr?=
 =?utf-8?B?NnkwZGtUVk1IWGRFazRZOFEzRUVDKzl3QnpuZnJOTGhCZnB4Ui9FTTBRZkhR?=
 =?utf-8?B?ZUJRL085cERXSTFvS1NsMy9MVkF4V1Q2YWN3UnY5NlF5STNRYjVqVVE2MUNn?=
 =?utf-8?B?N2NKRkV5VW01M1IvWWthais2K0UwUUZFcGxWTWwySHJEYzVRbm1XQm9jRDhp?=
 =?utf-8?B?a21iWW5kRzdjWS9aWmwwaVhwWEZZL1haTXB0Rm1rT3dkWitiUXBleDVOWFg3?=
 =?utf-8?B?N1NhVEl1Q1NvRGh0V01SVnZiVEx6MUxSRjFucUdYaXcxNWFSbXJ3cnNpNWIv?=
 =?utf-8?B?Tlh3bFllUU1ZM05TbWxMUzdjcGtqcEQ2SFR6eDZGMEt2d3YwRlVjS2s2WHVy?=
 =?utf-8?B?aTA2dTZvVk5BZktrUURRS0EzZ2FUeml6UjJEaXNJeGpaSHhxb1h2MzNEaHFQ?=
 =?utf-8?B?clloRG1HL3F0Y241VGFrM2FYNkI5L1Q0eGw0Nk8yNkJ2U2l1WmRsa3NtSzha?=
 =?utf-8?B?WENWQUIwN2s1dGFsY2JpN2xKWlJ0eis4ZlFaMElaRHliMm9jSVNFbVhJenUw?=
 =?utf-8?B?SVhSeEh5TzNodERSOEN0d1ltOEhnYzE2US9qWVdaT0pFUGhreENwOE5IYVVs?=
 =?utf-8?B?bEgyYUVyM2MrZm9xMy9sdWNrYVVGdXRKTTAxdnBwMHgwNC9FNHlqVXJHdlRs?=
 =?utf-8?B?U2hwSEwwNlJ5WTcwZ2NmVmJVMm1pQUUrTUVDV2FOV1krcDg5VVo2RzRHOHdl?=
 =?utf-8?Q?LyHtvoFYSakwNguxfLv9eLLSPTD4tPNoIGZro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFh2cXVsazFrcmJDbDJzSTFodk5uSHRzYUJsQ05hNFIrZlZhTU1RUmFubjFC?=
 =?utf-8?B?aUM3RFdhRDVHR05PbHQ4ZThZREczQiswc0pNbWE2T0hTNC9RK3NNSkF3RENS?=
 =?utf-8?B?VzhXcVBaM1lBaUN1MHNlVnRlbnc0WWk4MTJ4Wm1aWlc5MnBrQ0xwNTNTL1Zw?=
 =?utf-8?B?dU1UcVJLVG5DM002QmFUSXlsK2hHcCt1b2IxZGtrc2prWnFlWFJGUFBCdjRl?=
 =?utf-8?B?VDNEeDFsRHQyOStjY2E3bmoxRXVZbUFFSFNOSEk0cU5xczAzTnR3dnhYMmJR?=
 =?utf-8?B?b3VXSHRuWWUyZUtpSnA1TnBYd094akNldzZKeitLZk1qVXlIUnpHMHdZdFow?=
 =?utf-8?B?VFFJRytXYlplY25ITFhFbFBPb2Q4WTlzbjNmYmV1ZFpPMlZKSmRudE1OeTlM?=
 =?utf-8?B?Q1NOL0VyNTlOSXo2WVVNblYvNlp2TmZvZzhQdU9oQnhpMk5RN3FKdkhHWjVF?=
 =?utf-8?B?T2ttb2p4Tk8xamltZHl4Q3I3MGU0WXVlNTNGY3YwTzJvWlBYSGR2cGszd2hP?=
 =?utf-8?B?b1pqSFVmMmwxeExhRVIwMHFvTVhaNFlTMkF1UE5CQlpKQ2VzZkFBQmRDOEdM?=
 =?utf-8?B?aGxhSDkrUE8xeTF5eFJXSThkQmNFZ01lcVlMeTMwRDl1YUlmWkc1ZkIwaGNx?=
 =?utf-8?B?RnYrek9tZzh2cUNXeldBTVlMRkEwaGMzOTUzaGdLQXA2RFR2OFRnd3FqRlFU?=
 =?utf-8?B?NlpEYXlKeTFSRXF4d29GUndoYnRjMFl3WVFhMG5ibHo4VjdyNzQ5TzZ0RG5i?=
 =?utf-8?B?RTdsV0NsTWxGQU1CdVJWQWNhUGxQVFNsOXYybHBCeXNyYUNsZzRpc2hmVUFS?=
 =?utf-8?B?YllLcW5XNlp6ZnJOY2dnQmxEN2VyZWNlL2t1cFlZMEE0S3JIUVhUaDI0VFV1?=
 =?utf-8?B?K1FIR25OZWd0VDZ4Qldxc3FvWlJuUy9YcVhXbzZvZWtnOWFUSHRUcndPeEZT?=
 =?utf-8?B?dDFZS2hoQldFdnJhS3BlcVM2WVVpYnRqNVRLRWY0aFpJUjZETDAydlR4ZWhX?=
 =?utf-8?B?aDg2OC9qZUFDR1NzSkdHeEJYV2ZJZ21ldEZoZk9JbzAveHVuRU9yKzkrU1Ru?=
 =?utf-8?B?cWw0eFdRcTlUN3Y1aGRyZUFBNGtoU25sb0prNnkvNzYzY1prNGVibldBQ0FK?=
 =?utf-8?B?SUhDQjdkQTU1OWlmRWlsY21WbTdERlI5RitwTFc2eHowS0p6clcxR1lvbVFS?=
 =?utf-8?B?R0RQbzlNK1ZUT1MzTGJIcUY0SG9MaE5Dc0l0Y0tFZFhRRlZINGdGU244VUtl?=
 =?utf-8?B?bVVNY0M4UGt6c1hsQUZWTmV2U3VpajVWeThYZ0tyMk15TUFScnFCaUppOFYv?=
 =?utf-8?B?REVuQktFb0ppVE5zWEdoOFVDOHlmb1RDRXFRYXYwWjhuMjBkT1ErWDVFK2tQ?=
 =?utf-8?B?Wk0wa1VPdkN1M2dndGNEVTFYZjViTlp5eU9tWG1oMGxBYzlyUThLMmNQekR4?=
 =?utf-8?B?NXIrRmN5SkR4M3NEc2FRK3lPdU5BR0h0eHd6QWpnNzhGYzlCRDMySTA1UGFo?=
 =?utf-8?B?U2tmeFFJVlZadnZzZ2RNL1c4RXQ5R2s5SGFEMWF2TGVxbldzL216SXA2NmpL?=
 =?utf-8?B?aDFzcXMyeDl0Um9EOUFKRHBNaEh1djM2TWVTY2tSbTV2WEdYZ1Y2bXRFUU5t?=
 =?utf-8?B?aHJLY3ROYUNsbVVGSDduVWc5SmJlVldERmw3eG5heHJUSzIwWUJObU85R0Jz?=
 =?utf-8?B?bTF1OS9xcENubWNjd2F1cVVLUDlaQ1o3aVBHUWFCaEVQbTA5NDJaWkFqcm00?=
 =?utf-8?B?UEkvaEQrMlllYmdjdFBJYmo3aGNGQXo0SjJIQWc1aE5Ga0lUcngzSmk1aU9m?=
 =?utf-8?B?QjhUc1ppYnhYSTNVbUFIN0FEVUZUd2Fwd3ltblczU1crTDhCV0ozN0dpWnBu?=
 =?utf-8?B?cWZVbWlZWjJ2cytqNUYxbDFoME40YTVEVEZwdUF0eXIvc3BGUlBRbjJjekxL?=
 =?utf-8?B?TXdHdlQxWTcrWm5WV3k2S0c1VldKRlJ0VXp5dFBhMnBTeklrbmR2Nko0TVQ5?=
 =?utf-8?B?YU41ZEJPZTZmNENIOGdUdWdBL0g2dnhjOXdIZzhXclpCemR0VjNHVUVtcVY2?=
 =?utf-8?B?dVNBMkpvN0dDZ1Uxdzg2Z0xFYTd4YVIzSHMwZEFVb1I2SFU0TlRyeW11SlFu?=
 =?utf-8?B?REFEWE1ORmdhRHFlK1ppdUROUFF5RkVkREhjb0J1SnMwbEFGM0FzYmkzMjg2?=
 =?utf-8?Q?RCcJ5oYy10bkFy0dd7cMXzk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81b13a7-3e42-4c40-f8c5-08dcd3197cb6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 10:56:00.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zm6m3g8JY6sF0XzuPDrln0u+wj1pbBF88eS/oLe7qTBiiWim8BLWmWmfc0y2ncToy19CGSO2Na/WOiBWqrxpNc9YIRvb7L8eTtztrtgD+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

On 9/11/2024 9:22 PM, Conor Dooley wrote:
> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> 
>> +properties:
>> +  compatible:
>> +    const: nxp,s32g-rtc
> 
> Also, how come there are not specific compatibles for the two SoCs
> supported here?

Hello Conor,

The RTC module is the same for S32G2 and S32G3 SoCs.
Therefore, I did not wanted to add two compatible strings 
('nxp,s32g2-rtc' and 'nxp,s32g3-rtc') when there is no actual difference 
which they could target.

Furthermore, in the future I plan to refactor the common part from [1] 
and [2] files into 's32g.dtsi'. Maybe then such common compatible 
strings would make more sense.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/s32g2.dtsi

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/s32g3.dtsi

Regards,
Ciprian

