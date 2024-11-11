Return-Path: <linux-rtc+bounces-2496-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A79C4016
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51C5282D4D
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 14:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613DB1A073F;
	Mon, 11 Nov 2024 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CFAEbbpL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF071A01B8;
	Mon, 11 Nov 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333598; cv=fail; b=EltRsICCwzQjCNGSPoEuGmyLqVxnYu8VN6CbqAmu9t5y5hwVI/La/Bdq7ygHY0if44/q2XeioEoK8rDKzkAoNz41uX1uX2fHuRpeAbUcnju4AvEue6YHAH/9RHUAeGkD1vNxQOVRHO2HicEg1rXaGt+NUj/2Kbjedd/2+0jYQt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333598; c=relaxed/simple;
	bh=29cp7YMCqHQRGq0isxS4uMh3P4LeDbfkrIl+b4C/9ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YXjxm/+HSMNMPzsEOUpy4Sh+nwJpHLA8hTtG5OlvI+P58OHZOgm84D8ZXvorYrrfiagtvpJRq7Ga6/k3N5G6PNC1c0WEAavMa/4Yy/pvy8zunA1bLTyWVIe2UqBgbUoEBj1qreWKodiEx4qU+KMlfutuKvL+p1ZzRsG2zxzVlFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CFAEbbpL; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR83ddbS7iJZIk2gCQ24rnqHZ/jtnG4j0V8hwaeqm2cYgxo+4VYmIIFN2oG5SGd7MSr0JL4FcrhpQR8cTC1bY7bqlAhOf6IU88eI83NBMk4aCM9BZA6TZHxwEyjgLt6AGYXG4cslb2Swa/DstHJzKVChOPmdbBcfvkEFFndAvQumZwH/DaJeyxYNpGpW6T1V33Py5Jv5syAtyck+ndckkENRncFupwT9rgjoFiFMc4FgXxWmWM/BtkvjzMRHSA4RFDl2m+LczXKA22VxtmO6VwtrAq8U07Zs7/MxBekgXPr7YRICBV8XiOiJOHcBNKJvEkZcielZxTqH2y/gKObldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=cENzZQZ3t3O6B00/e3wN/3BkHE+s7HOxtwT75VQaV/3tmlbLfbMtPyYmBTnjUaMsfXCwTEt1QanU4m+eJJtqh7aTAEvNjag/4dcioATHjgqsQK/QNRSPVQFGc0iFDLFGck2abVBDgHYdlt68aWGwu+7+H4kbzJFs/zhV8zJBF9753zBwWeKEXdLdWJF9A+8J67kYCF1DwgH+J3KGoXft34LxcsefbLxDigo8mVrjaJQz/yeIJiaT+hF/GsWhnvyCN4L+ooHLxvCBdjbQ1P0Jcj8xfzfcwSeyXB9aU1UutmBW1JpILmhzApRMnSQ7zBzz2nQpEyQSGx93fMp66dv1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=CFAEbbpLoWcv9La6dN/lMEsq0Fz+kVRO/0w3FMOite3Mad0rPLhzJUKksqrMy4ml8w0gtwXKSbO17hFcgoRxrrW7k/zX4QbHrv3pBEv9Ejr2W43O5MOpbYmzRV9JYY9KhsSRFUrfuI7Wo9rAMDdPLj+tHSGYR2UYfhMytnQGG3rDYKXX4UA5W1DNoDiO+IWNX04Two/bW53qAc48aS6/0dwIL57WT69u/VnZutxH4JArGQ0GhXu3ThPuR2pQtlQrh22OHAtsdjfPT/NDc67JpG9e1yxQI7QQCXY/Pwt3FbLgBqeoSZuw7S19VDMr/MCCbZoK4s2WEc/5uTOuFQw9Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:51 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:51 +0000
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
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Mon, 11 Nov 2024 15:59:40 +0200
Message-ID: <20241111135940.2534034-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 500e05f0-34dc-431c-8b4d-08dd02591c9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1YyUGZPNnhoMllTelNLUzBSVC93eU9qZEpmRlZYMk02NlZxdmJFc05yeEtP?=
 =?utf-8?B?YnNSVjQ0SlhiK0lRSmNBc04xbFVZSEMwNUo5LzIrc0ZUaVRyQVBmUHhaNkRv?=
 =?utf-8?B?Sno5TnJxZU1PU1hQTEtVWnpndTNSdFFPOWdCUHFDL0tXKzBEbncyemd0K1V5?=
 =?utf-8?B?VDhuY2NqUXNEaFNMYUJxTmJTckxLOEk4T0RwYUFvS0owY002Ymw5RDJTYWkx?=
 =?utf-8?B?YWRhd04rZVV6VnFoSmppNzQwWUtiT0hnL25YMWd5bGZyOEdJd3pCUTNTUXFY?=
 =?utf-8?B?R2kvbnFCSEIvcW1JTnIzZlVVdG1ZMy9BRmdhQzJiT3NQb2tPUUx6TklJWjVk?=
 =?utf-8?B?Tk1PV1huZWJwVWVGY3NlSlJqVFhHNElsMDR0NG9maDk3ZGVCUFp4alBnU0xN?=
 =?utf-8?B?RTF2S2NDcWlKdXljWCsrR28vTzByS0lEdE5kTUVrNkh3TlJBQVV2VkpKdng4?=
 =?utf-8?B?THpMYXlXbEtXWWwyVDF2VzNSclVXUStZS2x2UFNsM0Q0NEFWNmEyc1JqZ3p5?=
 =?utf-8?B?cTB0aEQzSEZHbVA0OGgzS1p4RjdKTWJSNW1lam1LQ3BFSzRCdGFCVFpVOGdh?=
 =?utf-8?B?SzF0dEQwOVp4ci90TmFmR3kya1R1bTBBcHdnN1UyNS9tMjBXSC81SGVkWmF2?=
 =?utf-8?B?Uk5sb25ONXN1STBjcVUwNk13U2I3aVZYQ3ladCticzhCZE5CeU5qdXZ6M1hF?=
 =?utf-8?B?YkthM21CTk1QcTNpaEVHWnFCT2ZxOWpNYnkvRVZhcjI0V0V5ejVtd1Ixd0Jw?=
 =?utf-8?B?SUxPTitoL3prUXFJL3VUQUpHcTY3TEw3RW8vb25wQ2tDWFhjdUwxVmVrQ3Fi?=
 =?utf-8?B?czdvRENlR21CWHNKcFEwTmM0U0dKYkZWRytoUUxQUEdvUk1hUTRad0NqdUJX?=
 =?utf-8?B?eFQxekVxYVJPcDhySGJPTUx1UnpwbjVrMTRhT241T3ZVTU52YXRTM3JPeDFF?=
 =?utf-8?B?aFNKMkdwbnppTkZPckh1SnlycEttY2QwK2lneGZDbmxxV0JLbmZUODUyMWxW?=
 =?utf-8?B?clVKMG05QWFVS0IrbWtzbEh4ejY5QUZKanp5ODIvbm9sUitWOTVFVFIyVlZl?=
 =?utf-8?B?RjFnQ0JqRG5mTGV5ZnQ2eW5SWGpmOXk5OUEvUUxsUDJyM3Bxcm9qZUtwSlhF?=
 =?utf-8?B?TjB3Zkt2eVRLc0dMWHhUVTNNR253TUZxNU5LbjRJV1o2eU9PUGRJWkljZ01C?=
 =?utf-8?B?bllHV29obW91djhDVHFuZjIrdzhYa256eWo3N3lVTHB5RG95T2E5bVpyMjI5?=
 =?utf-8?B?b0laeklrK3hDa3I5dGNNeHdZQjlXOUlEaFFFY1luYVZhY01adStyMVNjekpW?=
 =?utf-8?B?cFF6NVEwVkhuakhqcnQvMVNsN2JXYnh6ekp4QkEwUmYyakdtVG4zUHBnL1dS?=
 =?utf-8?B?TnM4akxQSFdBWDRjdjVpaHNkbk1kVTNlaFZTWEFnTUtrdDREdCtpTmRYNjFK?=
 =?utf-8?B?WWNoN2xqa292eStTWXRreVdnaGp0OHI3S2ttR0hJMFVyd1M4YVFYOTIyd0FJ?=
 =?utf-8?B?T1JQdGoySFRhOUREVjZSMk0yUDBhdENHZ0dUOVg5UGNTV2YzMEtwa25ZVm40?=
 =?utf-8?B?SHNMUGxrK1FZREFUUzc1cFVCQjFreU1XRVBWUWYxUHNKUFhZNEN2REFGYm4z?=
 =?utf-8?B?R2NNamlMYjBHMkJpbmhLUU9ncExjTWhYN3JidWluSldVdDN5cCtoejBNZ09z?=
 =?utf-8?B?bSt4b1B2UnhpUkhPVEhwSDBTOU16WlB4VVN2Tm9uRlRSOW90WVNVcUwzaTZh?=
 =?utf-8?Q?kPsxYug0tEbRRgHoCKmgdNnZTIOpvHiwTxqcnjS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFjdGF5TEsrbHJob0xCdTdJSUw3VVZld1Ztang4NFoxR3AvTEQ2alZROHAv?=
 =?utf-8?B?TTJJR1hBaG11cC9nOHBzTG9ydjNob0tZTkVkbkwwMVp3SlZwN2tzdmREQmJS?=
 =?utf-8?B?blJkWG11c1hCbGpRMWZReVNhQmtxaTVvYXJUZTFFM01tSDhXbk9PeGVuaXln?=
 =?utf-8?B?ekdZK1pOY0tDN20yOGk5YjJWckZIOWZlbjArTXFSN2ljL0JNTXpRbDFxQ1Zr?=
 =?utf-8?B?QTYrUFRsU3B5ZlVOUVpnQ0xBY05ZamE5YUVFN1FFSXJQbE9JbEQ4a3V3VXpm?=
 =?utf-8?B?aXBybHE2Zy9IS2Q0ZjUrM0xZblY3ZG1waTBiZm54RWRiejBkWHdETTZjTVJB?=
 =?utf-8?B?Y2RyZUtkaXpxNXFGYlFmcmIzdzdPLzloQytPVXJlYkFENkV4UUNlL1B0Unk3?=
 =?utf-8?B?VGdMczZNN2h0SmZjNFd4cFdpRWloMU9vdkRLWTRhSHo4ejNNZWlyUVdPc0ov?=
 =?utf-8?B?SlpsVXRMN0dXZklJYmxzcURhYitqZmJhY2NmSzZqQllYbzRvQzVKUUtFNnBr?=
 =?utf-8?B?Nmltd0RwN2dUMGxkeHNwcnNxb2Y2bWUrQWdndzJNOFFkVTk3VGMreVBLYm1t?=
 =?utf-8?B?aC9MdCszWGNsaCtuWmNMQmdUV1ZhRktET2RmSXhOd1ZTLzVyc2kzQlhDYXRq?=
 =?utf-8?B?akRKTzUyYS9VRXpPUE5RRGpCQk5pZ0xEWmwzRDYxcGpvS0JJQzhENmRheXdJ?=
 =?utf-8?B?WURSQTJQdGNjdWM2RTBhNzMwemwyZmxrY3dKcXlYR0dySUFTbE1jVzRhYlhz?=
 =?utf-8?B?QWNyd1ZONXVtaXNCM3lwdzN3VDk1QVhUTzk0ZmxoZVdXNTNFNm9zanZnczdV?=
 =?utf-8?B?djUvSzhjWHAwSG0vak4vUXl2M3BYWmYrbkpmWk5Qb05VYklmRDhoc0N2ajAz?=
 =?utf-8?B?MmtLRnE4OC9lOENqbFhaUk9pcVBELzlxSFpFM1RqMjhnUThsbmIzWGFabnRx?=
 =?utf-8?B?eHkwQnAxQWwxM2VoTFV3eEpUUnJaaG5CRnAwa21xblJla2Ftb2FWa0gxcjEw?=
 =?utf-8?B?QXBheEgrakpoYk5oZm5aN05nb0hScFFabHI1MVZLYlIrZ1RFa2dOVm81WTBi?=
 =?utf-8?B?c1BpUnI5emRyUko3UEdqSnZzZmt5ZTZrR1JCc1p0NWxSejZPOVBLNWVJYSsx?=
 =?utf-8?B?NU1NMW93Tjg3bTRDMEswamRNd2hFM1RHM0lxRWtSUm95N09HOG9hSlVFSXVU?=
 =?utf-8?B?Q0drZ09rUFFSSDQvd2w4UU0yc05xTUNKN3dyY2JVSjVzTEZUQ2ZjbCtHT3JK?=
 =?utf-8?B?WjYxdDVqbGJNK0M0Tlk5VFVtZDlsdmsybEpoSUpzVE1zczhNQWR5a0FCM0sr?=
 =?utf-8?B?YjZYbkE0RmYyd3gzZ3dGWWFCdmJJelYxMm56cjlKN0dncU4rd2V1c3I4dmVy?=
 =?utf-8?B?bU05d0Vncy90VndpcjNaU1ZEYzhHUHRVQXhERElQeS9pWHhiamFmWmowbjJj?=
 =?utf-8?B?ZTFzd3djL3NkeVJCeFpzd0RqV09OREdrMVpVL3p0alA4bUIrcnZMVjgxVDFw?=
 =?utf-8?B?YlhXWEZOQWtuckFkTUNORDlUTEdiQTRrcTI2VEloNUg3ME8yY2xwZFlxbEd1?=
 =?utf-8?B?UlFzM1VWVG9JR0tyUEwrNVdIaHJFeXNJaXZzaVlyM3JTOUtpZkdVWnpUajRI?=
 =?utf-8?B?VEhJQjdQd0ZUKzlNMDV1Sm9vVkNuMzBUSHVpWjR0R1RCTDAraVVITTExNUtx?=
 =?utf-8?B?ZHBkYjQ5ak05NmlFQ2FJOUV6MUpMTCtBa0FyQU40dFVFdVJacEx3UmUwazBy?=
 =?utf-8?B?aUdVYSs5a2ExTDFMd1J6NHZOMDhiY3dVMG8vWUcrSUF3TkJta1B2cUtkdlJT?=
 =?utf-8?B?algreGR1MXMyQ2V4d2szbjZxaUE5bUpjNDl2N3o2c3RLamhwTEdyamE0VGl1?=
 =?utf-8?B?Q3hueHNtMFdmSHVHMzdoMHp2dk5Od3NkRThRajNCck94cVNaT2x6bnNsQ3VN?=
 =?utf-8?B?UlQ4eWtXdDVrTXgyUE5nTDZOV3pIcTRSb1dCTC9HRVdCRnFxNlh4dEticXE5?=
 =?utf-8?B?WDluZEQwVHNOWCtGcDBnZzB0dTdxRENlTDhRY3FFZE1qRE92L1FrMjhrVFBJ?=
 =?utf-8?B?Y1pVL1R2WTB6dXc4U1p3dy91Lzk2Tnd4M2ZFYjVkTEx2b2J0M0lWVDg0Z3Rt?=
 =?utf-8?B?aWE1U0phRHFlMzhwb1ZHMmlvaitDVnpaNWVmZkVaRTJKREkwKytqb2dPYjNE?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500e05f0-34dc-431c-8b4d-08dd02591c9a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:51.3780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7Z1hNvxBeggobIl3/nnQZpfRynJ8fKFJiqMEcWE9zIE1O29wfOkrEjzyBOH4p0/IUtisqUzd7yAydkwrlwLdvVXTCjTIhfaWdQmJrd3ogI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfef98226d9..991a9df6819d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,8 +2763,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
-- 
2.45.2


