Return-Path: <linux-rtc+bounces-2005-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404397ABF1
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 09:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E5328242D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 07:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E0C84E1C;
	Tue, 17 Sep 2024 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GsrQDqT9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013034.outbound.protection.outlook.com [52.101.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEEA82D98;
	Tue, 17 Sep 2024 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726557704; cv=fail; b=sjpOkPeiJeEcisy/8dbZuTGRKIR/rY4q8Tu0P7fThbtYE93EBZksCEttZmH6xhCPFD1cxcNM3oZqYLKElFzrQ/ZYjUF5TUsdpOtq1f/0DkBJCb6pbATnf5YvUqmofld8H5vx3b6HCJI/t4c34v6bEwxvFNEKhIgG1dATIjkuNn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726557704; c=relaxed/simple;
	bh=1pec38CPNheqzwgP2GSQTn8uoTZv0V2PIUd3d0r1a78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iNlGVwTEg6gQjkDrm6tb3OEIFoU8RzEiHBAryExrihLwSuu4NJ/p2ZBm2fPVXJmww6mhsOIcdsUs/qeP/vlDEVCLvfkSz//epMmxv1Dy7BIbK+8eiRrUIAOdu6h5ix2jqV1vpIAaZnNkOWqr6fh6I5mtXkjkfPZK/r7HU6X8ELs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GsrQDqT9; arc=fail smtp.client-ip=52.101.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPwspjt+j1r4SamNOW2Y7oOqVw61gFahTDI9qAFpMjuAKVTwuwF5gzlyppOjryTT/5yyKO0xJbyW53bqvNCjvFOwNoUuzGp2bB/ijttwUOE0U6vNS449cyDj/gc0QxAJfEBKhYRw1z2hnHmkplu8WjC+yjdhUB73sfAkatPbmt0LKNogynfcLsVYcCuwU1vOtJCa2Cx3a/c0eem6aR0YHGlmodwRIWpukPTbxDjCTRgP16vp1JbdHcpVOdzLpl77mEFqS5UQYn4s3KbF/CnQhjjEvZqUYtiICo3AuR9hSAWdDTQYKmAky3fLvsSvn/XTPAhFCzAyeB1BTAr3AQKxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcTR1/xikxyP4pv5ANTYM8RDeCyFx4n+Zfo2/DQBctU=;
 b=Eems5BFdxqBFezBW9eFgLlaNaO4asjPujdRakyytbl4lX3sPcfFBLlQFWFHLs08wCNQa47gJxTgd3XVs30iRPvHMQzhK+QC+VQN+MLHwHueVLahe6ZCuMLgouhx8OA4ekU1AqXiTbH1IcU5A4XYYA9oA2a+BN4MB+GLCDsZnA84+HgCDVXR32TTB7WbI8mgOEeSWoAMmq0eyypQjJNNW1+L5bJyAJxdbjNOcueLR7kMSNpWgH+4JAxtpas72mzW7K0x5qRb/TPPK1g/QeQynZG5faIaD4xHAG05WWV0m0Hn1DRYCEEiy2Pz3eu31lxPhNBjhSqT6OkynjD6vYpj9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcTR1/xikxyP4pv5ANTYM8RDeCyFx4n+Zfo2/DQBctU=;
 b=GsrQDqT92zgr4Y1ZPGU8VEey9fCP66ldjeEYGqn9hun751q7ki5fqQFyKM2wG94Lt/GjNmvKKZinEf/ElYXWc+VdFfDRPmmH5m7zLuu0B3AXmGffvJEO4SFBSqTag52AHOd+JZQRTzegjDxHCElXIq/uaTVRqLs33cS9I48KqkoN6RuS5eczPWmu7rvAK44PrrlNGCm1vUCBXydl/sn2csT+wZVKDRcKH86E8VlJyIwBAFoDk27nTuipqrq0O6j7cYAuVUeN+3PzpfLgwiCx6DSyw6ft20VQa0366YMb1ryYBHkFS/5e/BaLflJV1DIc+CtG7s6tW8VxljlAHeudcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10560.eurprd04.prod.outlook.com (2603:10a6:150:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 07:21:36 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 07:21:35 +0000
Message-ID: <c51a8065-2052-4a4e-b871-c0bd8d834548@oss.nxp.com>
Date: Tue, 17 Sep 2024 10:21:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <2024091212260302903af7@mail.local>
 <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
 <202409121403232ab1295b@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <202409121403232ab1295b@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:208:1::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10560:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b9c809-8efa-4cee-ef3f-08dcd6e95d09
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1dkRTFzTWdoWVhLWU5UNldPTGh2UmkyTUdJcWNGWUlYOEtVUDBsV3R1UFFw?=
 =?utf-8?B?UUlMTlZrK3dpY2NIb2JOUlY2UWVKektjb0JCbktwSExxYytyY3dnRisyMFJC?=
 =?utf-8?B?ZC80V041NHFMZmZUeTl6SUdPS3hlOXpCUjFwa2kzRU81U1Q1eW9kYzR0dVJ4?=
 =?utf-8?B?YXZWZDNjajduZWtUalRZTm4veDhpeWFxdEJldkxKYnkrTytLaC9rU0JyNW5z?=
 =?utf-8?B?TmNYYmRXSnBITXJ0TGZlV3B6NGVnOG9XMndCWGxncnNobzBtZjZiUTJkYkJi?=
 =?utf-8?B?TlcvMDZXVTVXeUxTN05tQWdmUVlwdnUzQXlTZGdZZ2p6cDlwYTdVc00vbUw4?=
 =?utf-8?B?NEtTSExGNFkxaFlNNW5BK0pLc2NnVEJtRDJ3TURVM3NxaFpiZkJsT1ZtMnBV?=
 =?utf-8?B?RU1yaWx6b0tONzViY3RaRWNpQTVwU0JWLzlUcEcrVXBUdmROdm10cWpJMEJt?=
 =?utf-8?B?enZZSXkxZ1F5SFd0Q2piTDBIdVg0OUNqMHpNSS9FdnQ4Zk1xS3NaNHZjenp4?=
 =?utf-8?B?NG82azNxelhYMlJQWGdlVkVROHZvL0ZOZWJCeWFaQUNMendZeFkzWTlDZG9G?=
 =?utf-8?B?NDcxMVp6SHB0azhVYi9sS2s4blROTDhlKzJ3VnNlY09xZ1J0cEt5SUE1VW1x?=
 =?utf-8?B?M09BMUNoUnNJNzNSRDJEb284bDhPUlBJZFNKM1dkMFZhVEU3ZHRQNUw1N1J3?=
 =?utf-8?B?MEtnUWJaWXJINC9UZGNQdmRwRFNKRjZNcEpJdVh1V0RSaXhRRkN2VC9MUEN5?=
 =?utf-8?B?MVBVR1Zrb3VQdHE0TCszVDBXSEYya2pSQzNvRGR4alNKYmxaZFZoVjZaWWt6?=
 =?utf-8?B?UERFK21KV3ExWW5BalhTd2xpTWhoM0NyNitWTGgvVHdWNDNSd0RYakNJbkMx?=
 =?utf-8?B?NEdyNHRkVkg5UERCY3dNVVRTTmJDMU15aS9IV05kK0NGQUJiVFFOd0xNT1FP?=
 =?utf-8?B?ckpJZU9DeU1Ub2dhVE9CandwSS9LcWEvbXNnUHBqTXlFZEU3a3V1N2NhbnM5?=
 =?utf-8?B?QjRIVEZBWTZSSkhqVlBDVkpIejhiQyt3N3BjaDhHTWlNa2lscWpudzgyVGp1?=
 =?utf-8?B?Uy9hR3Bkd2NUU1F4djJFZmN3aTZTVU9OUEJWQytMQjRNb0NoQ0U0aHQ1QzlN?=
 =?utf-8?B?a3RIajNKdGZHWGJqc3kyLzlYNjVNUzVKK0MrME8yRGQwdC83NDhLSHFYOENR?=
 =?utf-8?B?Q3ZiZXZzMy9VQk5Gc1dqUEJiWU5mUUt0YWhXTHJMWDNHVWYvVjM3VDJaNHNl?=
 =?utf-8?B?RW5uV0VlaEdaWlZlMkJ5VFFqTlo4c1g1ME9UUnlyNzQxOHFxdFdjMXBFOThR?=
 =?utf-8?B?UU41VTU5eVdody9BQkcxUmJMQ3htYWRqSS9JM2Qzc0M3U3FxU3BnK3dYbEdP?=
 =?utf-8?B?RVFwZS9LOHh3ZkI2aVdPQ0dsbThWM0NFUWZiTWxJMWFYZVhvQ2oyNDJCYjM1?=
 =?utf-8?B?YXppcm5VZVBiQ1lsU0VXSnJmUFJoc1dOdkk5bENyQkIyYjhGWlRMOGJOeTBE?=
 =?utf-8?B?YS9LOGwrNzlzdFBiYlZrRko5UjliTUdlcVRaZXhqakdHcjV6cFZpMkp6STJX?=
 =?utf-8?B?WDIwa29nMkJKYjRacnhMenRGV0RhMlpUMER2dFlmTFIvTUgySnVpc3pQTzZu?=
 =?utf-8?B?L2JsbUxyeGpvL1hlNnFiU1ZFbytkRldJbGc2R3BQSnVNWjNMbkJxSW5WSkhj?=
 =?utf-8?B?bUtVNzhvYnhxdFpYemZqejh0SHJXcEdwS2poZFNsY1M2cHFPSnlDR3hMa1c4?=
 =?utf-8?B?c1pQbU1RU0F1ZzJ1Ti95VGhoRzhLUUZnT2tsdkRMTVIwR1VhdjNQbUxTdllm?=
 =?utf-8?B?WHMyZm9Bblo0NFN3am9EZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHd0aTFwSHVSUk93QnVURmpxR1M5N1NuNy84RTZyc3RyazJNMzdYWU5ib1NY?=
 =?utf-8?B?Mm5DckpTNE5qdEkvcUl2OFlYZnpUTmtoeHAxQjc4V3YrVU1lb0NzSU01Wkxs?=
 =?utf-8?B?MHF5OGdFVTlhWXNyb093LzRJcDRsanEzL0JacVhBcE1uaW1EbUJ4L3FBU0hJ?=
 =?utf-8?B?c3kyN3MwQWx1S1NVSnU3YmtyNm5oSUt3Qk4vMkt3WW1xMHlOM2VXeEJWUW5u?=
 =?utf-8?B?RkZkWTEwUDVpNnA0V09rSGd3RXA1alFUcWtnRU44dlp3bDZlRElHZnhHeDNz?=
 =?utf-8?B?OFcrYzF5WWp3cUpnWnFCYjBQTGp2V280bHgrWTkrQlJzcGRtaFRPZHM3SmNa?=
 =?utf-8?B?czVad2x6aTZJMnZRVE1Ya01BRW1KZmFuaGpVTURibm5wZUNPM1VreC8xQUN2?=
 =?utf-8?B?WmNob3dDanJLdElaQWpTYVBsRWtMMFZtZmNMaEVYTjlrYVpPSXZlOFIyVDdY?=
 =?utf-8?B?SnNzaWlsaGNGWFAxM2twYThqcWozcVpWWUZieGt4UXhrNllNOUNOZ0pKZDk3?=
 =?utf-8?B?SGtKZmg2SnV2eG9hazIxL0RwSnU5NHlkdFpVYlZsQmNwbVFZVHVFY1FROWZD?=
 =?utf-8?B?N1ppQUJtUUVRVlFmVkoxSktHcmlFT25FOHdyYVF4Tk82TzNuZ2VWdG9senl4?=
 =?utf-8?B?c21NYzFsRy9jby9uN2wzMVlZcStWaktpY3JES0ZzMkxPQy9wYnlGTytJNFoz?=
 =?utf-8?B?MWo4UVR0RE96Rnlab1VDSEFNeXZKdDRQSFVwWGpEempiUVgzR2hnT0JUdDJ1?=
 =?utf-8?B?VVB4N1hHcmwyRGR3TkY5N2E1THREMmlGZEFIL28wMWw4N3lWUjA2eGQvTFRQ?=
 =?utf-8?B?NjJvOEY5VkNQMFpITVpud3F5bjBsS2pOWTlZdlFGeGQweUJpTFNhdmIxT2xa?=
 =?utf-8?B?anQzSnQ0dmcwaWhiR3JNQkcraEtMSHVEZlkwQWVUZDhtSytyVEVDZUJaY2t4?=
 =?utf-8?B?Q0pJWDIxdmRBcHdwazJHS2gya3ZpRG93OVNseU5qeVNpSTlkMTdhcTQ3RXZp?=
 =?utf-8?B?bFFJVDFnNmtnMmhCTlc0SHloc3JERVhnL1B2VWJpbGNudVducVhEZm5aR3FI?=
 =?utf-8?B?QStIaXF5bng2cVVhMVhBU0o3VWZVSTVMbE84bTdIK2NHcXdpYlhuV0wycloz?=
 =?utf-8?B?dEhwRUdhV0tFR3pUZ01aTDd0QjVPNHQ5VWJsTzEwOHlRQlBneEFyQ3lpeEp2?=
 =?utf-8?B?ekovbHJ1Sjc2NDg1YzM1VVM5aEJqYkdzem5Kd0ZUWUdQTm5YT0NQSm1xYjVx?=
 =?utf-8?B?RWNEL1A4eHpJRjdtTFdzcWo0eVMrdXd5OThWbmw4b0lnZVJGTE9nOHA1cUJy?=
 =?utf-8?B?c0JpWUVXZ2VNdEc4TlFGektoNWd1a2FNbitZNkFEOHNONDVucFljZ2VpazR4?=
 =?utf-8?B?V2NHMjBzOG9qUGszdU1JS0FWbG1rSE5tbGZDRDNTaFlRVkR2OEFJOVo3bCs5?=
 =?utf-8?B?MlhIZ29lZ0RYbmNTWHdoa3pNU3lNRTlpcTRPSUdQT1ZWanhDdTZaVTZQbUJk?=
 =?utf-8?B?OFRvUzJpUDhWaHRTME9NK3IyOWNYN2JFQWovYU0va2VSaXE4TnlLOC9xWG1G?=
 =?utf-8?B?c0gxc0JtSXlqblVJNDVZTmNKeEk1bDdlUXNFWldRNVl6QlRKWDAwMlJSVVBJ?=
 =?utf-8?B?ZERBcm9qYlV1RVFmM3ppS0NBNWF1OEZLa3Y1ZS92QXBSWlB1dWtUSm1pWnlR?=
 =?utf-8?B?V3ZtWHZsaExsSnJHZ0RmdHVDK0JmRWdpVi9uT1hqWEtaTFI4NVgyeHB1bW1R?=
 =?utf-8?B?WUZKVG12c2xTWVdEMzVZZnlzU3FSdXlLOHRyZDhaVjZrY252Y1FINzBVR1VI?=
 =?utf-8?B?QjVFd0ZYcFgxcG12MzBJNzFRK2VCeGFEY2lDUW1ocnRDWmI0eUhsRFZxSzU2?=
 =?utf-8?B?UEw5WDEyWVZhdHpNcWVwMmd6aWZ5cUFEY1lYQTFXVDEzekttQ1RPMzk3VVpR?=
 =?utf-8?B?QTVuWnc0SmFPckpSR3ZlZDRSZkxOcWdIeHVicE54eU1jMmJkVDRQTzk3N1hK?=
 =?utf-8?B?WERlR1hwOVhqTlV2ZUl4b2ZvV1hKNzI0RmV3cC9WdGlRWkpZWVNHcFRzd01T?=
 =?utf-8?B?M0tNWWoxQ1p4blZDZTR6UzUrUjNPL3BTQjlJbXFxV1g4WWxZM1BjQW4wSXJO?=
 =?utf-8?B?UEI2T2NDcUh0TWdwOFdyMVY3TSsvUDhPalBNdnQ4QnhpTU9ucGx4MU1kMlBC?=
 =?utf-8?Q?M6LqDG4A/K1AOTJ5jllVuQA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b9c809-8efa-4cee-ef3f-08dcd6e95d09
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 07:21:35.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWyyogEnezv0uy5k+8vcuaccw0MtVgQXqwp3k/5k+Z0FLQzAxzw5doLZSAcFOOHvUjlLxGUr+GUQUrKEmHNoWAvzJJoexv+hg/awwF6b3zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10560

On 9/12/2024 5:03 PM, Alexandre Belloni wrote:
> On 12/09/2024 15:36:46+0300, Ciprian Marian Costea wrote:
>>> Then should this mux be registered in the CCF so you can use the usual
>>> clock node properties?
>>
>> Hello Alexandre,
>>
>> In hardware, these clock muxes and divisors are part of the RTC module
>> itself and not external. Therefore, I would say no.
> 
> This is irrelevant, if this is a clock mux, it must be in the CCF, just
> as when the RTC has a clock output.
> 
> 

I understand your point, but taking into account the fact that FIRC 
clock should be used in most scenarios, would it be acceptable to not 
export this 'clksel' property in the devicetree bindings and simply use 
the FIRC clock by default in the RTC driver ?

At least for this patchset, in order to ease the review process. If 
configurable clock source support would want to be enabled and exported 
via bindings for this S32G2/S32G3 RTC driver, then CCF registration for 
this clk mux could be added in future patches.

