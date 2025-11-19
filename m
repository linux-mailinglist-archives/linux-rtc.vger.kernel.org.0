Return-Path: <linux-rtc+bounces-5419-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26678C6E3D7
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 12:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F37FC3815C2
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2BE350A38;
	Wed, 19 Nov 2025 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FxDXFFaz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645F42F0C7D;
	Wed, 19 Nov 2025 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551498; cv=fail; b=hWaGF1Q8Yxc0BR/VpCaHGw1bzOD+KlNkfaGvYBzF6WhMaGVJegNcE5ng+aqjyG60SRJuVgMcICOnKlkl9t0lOZw0VL3+hkgtw84F/CQk6N6uucH3/9lSAXkgfgEjWj/mk68NWBb79iwNrRp9yF1GIgB7uhAiU1gRBJmkdjPVulo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551498; c=relaxed/simple;
	bh=Kb2MRxlgbvKMSJBY253Obyo6W0mYya2jwSJQjS0n5TM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fI1VM6isMhPlFE1n5WBMRhs7JcJfHVNq/AIdZEBjBpdnRTMGpoWg9K8UhZpU/CjaVicJ5jYbQMEs0ditgbMRmTud/DaHyejGsAZlV3VvxMUO/cIueGF7n5EgwJIDcGjb8CNvr0gHqYJImNA4AFcPv4UKMep+kCh/XSUOziNNjfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FxDXFFaz; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/wtb1MJRIlrKhAx8TLD/spInLWLmEHxCB5/COTSc6xhO1/wUpRKHHTSV8nnesFS34LHnwB09iKFn0RAuXPajDxHfoECKPchpGxN9n1wvdcAdoSxHBbwumkDd/RVG38HK6KD1HFKYtT2yOG/g0LHUGGuE/Rqbz5kfN3LhdxDBkPJTXpRrHyrSc7Av7AAK5/LbL1DYHWphKcqrCs/l8ejACdY6hvJSJfV8cg+gI9+RWhezOEH34MEolun/09a1HHRi0uI5mXp6R8Mogak14ImGzE/2bxltZU10CB7Sq7xtp82to1KZnt5I+3ByyHLoQvghaDP5MDKKyC/4NxLZhJXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb2MRxlgbvKMSJBY253Obyo6W0mYya2jwSJQjS0n5TM=;
 b=hUE+RWsn5YOMAv8/C4y4Pz+Nisg7bOBcKniVpelOw+Z3+y/vpmty9Xi13JMES6xmqaEoYF9cxxyzWqLywTW1CbWHnF5q5VdrJEeCVn511dYOro6zOldOPUnySc3voandmyTSPJtMJ2j7THa4qu/NbTh/iFF/TVWS5NINcyGturIft4xzudazsKnReVcX9CihTgUskJmV5b2BnjssAGynNz/zEvS3DRE3zffa0jXfLfNheOSiMOhgSXcjne9d3oKuR9zu8bd22o7eGSGrbFD/2arIrPAZIQnpQLGmRGI+akUr4frRA3s0NLjLqs8JxhdHbccePFZX9iYIDkAvQ5mPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb2MRxlgbvKMSJBY253Obyo6W0mYya2jwSJQjS0n5TM=;
 b=FxDXFFazRAEsabx6zKL6ECVQCSKurUDeODHPTFiunJaCJepfzALafWHm5MgFwDW1Fdc3q2hlQJyPntfoLZCEIKPrFl91P+h04Bmp8nkzdLmfGNvhoseAASSfP27YYE8i+m4uyGw02/pLTVnq63Ucyqk2M6s/4ci0AENY/7ftesmjKU1p1RaLF5+6LTkPqtALSjTWHv8X9Zq7LFPxUA6fLb99crfn/0xJ/K+l/XVqL8LsTvMYJoQZu1Y+YiDC1iHM35eB2Y+XIoz/UtoYCm2bWlL+m54fn0K0U4IvXy3sHeljoGcOq7Lg+hAhlKBqaecUEgzN7ytbjZnRGqH/UhEWZQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 11:24:52 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 11:24:52 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>
Subject: RE: [EXT] Re: [PATCH v3 1/5] dt-bindings: rtc: nxp,pcf85363: add
 timestamp mode config
Thread-Topic: [EXT] Re: [PATCH v3 1/5] dt-bindings: rtc: nxp,pcf85363: add
 timestamp mode config
Thread-Index: AQHcWS82a7WI7c6Br0eFb0gJuqWNQrT5yneAgAARN3A=
Date: Wed, 19 Nov 2025 11:24:52 +0000
Message-ID:
 <AS4PR04MB9362C413D827B0377A70A510FBD7A@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
 <0bc4d069-29bf-4d22-9a38-f9f6222fc07d@kernel.org>
In-Reply-To: <0bc4d069-29bf-4d22-9a38-f9f6222fc07d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GV1PR04MB10275:EE_
x-ms-office365-filtering-correlation-id: 640b5c42-697a-448e-8b35-08de275e4211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?V2ZGbWNobGxBUVM4VGVBZDZZU2I4ZTRDcnpac3pRTy94bUdNSGZWaHpzL3Vw?=
 =?utf-8?B?ZE1DSDlVMjU0ZkVMODlGREFDTWk1RXhVUlhTbTlZTHNjeFAzQVIrdWhJVUJD?=
 =?utf-8?B?NDZuZURiMUlJYjBGMDllKzEzZ3NkQ2VvYTFXaXZkajJ1R2hDbnZJTVQ5clAv?=
 =?utf-8?B?bkNOMUFoTUFreGs5SWJFTkJFRS9vYms1QjQ2N2YvcGNESHFwU2k3MkNXQi82?=
 =?utf-8?B?ckMwRklaN25wc25DalNKQTl2ZUZVRzRJVkFtaHhORVoxbFdXUndkRDY3QlM0?=
 =?utf-8?B?UFpFcGluZ2lhT3ZEQ3kzL2ZQRDI0dHZ6WUxFQUZJYzNaK3NybkRWR00zcHl5?=
 =?utf-8?B?VVAzNHJ0dnlURDM2T3E3elc0bEpqTGRELzRydXFNaWd6ekttSEN3ZjAxMlZ0?=
 =?utf-8?B?QlQ3YlQ4Nng2R1hyVU9FcWltL0l3ZGdKWmhwMXJUeTRMWUhtN3pIMVNOMUxI?=
 =?utf-8?B?YlNCb0xMQzV3bDFhQjBId2FNc3NDSlRFZVRzQzhST293WEFmYyt1Tk50Nnlq?=
 =?utf-8?B?bXRHSUxZbmJWVlJvU0kveEpaajUrWTg2a0VycEFqTVhVTFdVRjlVM2g1bGdh?=
 =?utf-8?B?WmRpcjIzTStFVlgwSTJ0QzV6eGU3dXBNQnR6TVNSb1p6d3FLMGpyOHpCdStT?=
 =?utf-8?B?QUhVcTRwZkp0WVp1dE9MVlBVTnFPMWtsWVdaZGRQR09TSHA0VldMQWhpSyt1?=
 =?utf-8?B?aXFybm5RYzN3UXBweEdLNTgxbjFkQ1p1cFVmY2hyZERKWXM1ZjIyUEhxTDRi?=
 =?utf-8?B?Um9sMVFSNUlHVDZLODdkcGgvNitJdVZ5aHc0WVlpcStwaFZkcVBCRjdkL094?=
 =?utf-8?B?WUQvM0VwZUlYT3h3QjVUbzNiYzFVMXhGbjBHKzRxSGtZQVpBVUlJbE43YzBN?=
 =?utf-8?B?dnp4cVh4dEZ4MDY1azdwSUpPV1VNRWdiZUVIdVFHVlBlTUdGdEdKZkhrZU1M?=
 =?utf-8?B?ZEhaaTMrSHNIYlRkNkFxUVJqZ1NnZ1VWeVh2bStpdDNtMkRkUEJMSlA3V3Nx?=
 =?utf-8?B?Y2NYRnAwUWRCTU80SE00ci9VeDFVZDZ5UVI5VHVvR0kwaFlFRnVrbExKSDFu?=
 =?utf-8?B?WkpLQlI2d1k0TUZRRitnbjJoaUJEbFpMUnpuS1dtc2g5UEVORG80QlcvbWZ2?=
 =?utf-8?B?d3krd1BxL2IvWVNnUUQ4eXlMVXBNT3NoU0V1Q012b1VFL0FVTHRaMWlEck9w?=
 =?utf-8?B?VUZtcVVxMHlVL1Jsa0NWcmhYbExzZTRPblpHeUc5MFlwdlBwbmtrb2poMVJ3?=
 =?utf-8?B?dGR5Z2Q5V0VtWEYxeEtkdnp2cmM3UENEYWJ4QVpHeXlzdjhmdG5Gcy85Vk9P?=
 =?utf-8?B?R2dEcStGTklhQXM0dlNVcVVoZEcrbnZudjRzejY3amoxdFJsMC9iUUh6SXFl?=
 =?utf-8?B?NUJKbStrWlJlU0hYRk9FZnNlYThsMEwrZy8wS1hsejdrTjJsSXB3bjYvWDdE?=
 =?utf-8?B?NkduQndHNGNSQjlrY0RDQ2dqTHBiVzVHNmNJdW9NYUhyRUZiNHp4NFVyOEIz?=
 =?utf-8?B?cy9sdzB2dWdUeDZKN21BejNSZGw1V24xemhKSnFwKzJRelNQMy9oWldMUENR?=
 =?utf-8?B?ZFBwZVpXTGhiZDBTSlF0NTRoZzB5R2VKT3ZweVZvTUZ5SWVrTzZ4TGdsMDVl?=
 =?utf-8?B?RUJJVnBTR3kwMW5GUG1NTkZFN09PYXFEUEdXek5tZlZPODJkdEdUZHZFMmhK?=
 =?utf-8?B?RzBGTERoZm9OS3ZNK25oRklkdnpwY3RjNzlTRUFidC8yTnZqUVZhcHY3cmJS?=
 =?utf-8?B?NGRDRWE2Tm8yenBndS93REo5ckgyVDNGOWhhbW9lVVh2Z3dWYlp6Sy9DaEJa?=
 =?utf-8?B?QlFMS0VrZmNvSDR2Vm00Q25DbWpNWDFXWGdTRWVWT3ZjTStFUlhsSWx4dXRH?=
 =?utf-8?B?SkU5elFwVk54NFAwSkpUZ2pVN29SN04wSlFMQ2dXdlVpYkdFYlhxTnB2N3Bp?=
 =?utf-8?B?RVpoc1lSbDRubXcyb0NqTDN0ajErbkNQckJjTEFEV0V0L2kzY2VSbzcvM2kr?=
 =?utf-8?B?SHIwOTZKZXk0aHlDQnVkUHR2QlM5ZFdVbFpleXZhVko3V2k5RHZEc1V3U1V0?=
 =?utf-8?B?ajZRejExVTNWd0lCb3o2Z2s2aEZQdlhVdk44Zz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekVQaUdSTGV2NDZWalJSWW5GaXA2b0UrdFN1ZUdkSUZtanpIQ3JUN3ZZMnpy?=
 =?utf-8?B?N3J2Y1FmWXY5bWZDWnBwV0ljNS80YXR5SnZ0Si9KYzFwZ0xkZWxaS1o2SCsw?=
 =?utf-8?B?bzdGaDdGVGdRRlVBN3VudGEvVkhjeDdDQlppK0puWHB4SmNoOHY1M1RsbkIy?=
 =?utf-8?B?V2RURnlGcmIzYnNmYzdJTWQvb1VrRlZUcG1Eb2xKWjJua0lXaCtxWi9YV3dZ?=
 =?utf-8?B?c1kwMVgxdFpVUFhkMVRCeGszRytYK3dGUWVLQUkvUEV1VkZHelkzYWp5ZTND?=
 =?utf-8?B?MjBHczVBdGlQM24xV0w2aG5heU8va25PeGxzZFlub2RJMFJiMUl4blVlUGlF?=
 =?utf-8?B?U0FnUVNiVk51dzZQMXJDS0VWTENWdGFIbWRFMk5hQnhZN3RhTHl3bjVTYTZU?=
 =?utf-8?B?WXB1bnVYYzFXV3JSbFVvMkNZKzVBS0dqS05YUjhVa3BDa3Z0WlRQcENYaTJi?=
 =?utf-8?B?UUdiWk5SWTExa2FneDVSTDVJYXBtNmdCTVl5NFhEVFhRaWpvUXFOa3ZYZGhB?=
 =?utf-8?B?VUFlcEZNY3pNK0JwUnZ2TVR1L2dOeWpRTjFLZDlWSFB5bnVvK0xpQmJFMWIx?=
 =?utf-8?B?U2NPdWNFQTlNd3JCWE85d3dNTFZOaXNMY1dwdk5rRk5ZK3R1N2pCcldrT2ps?=
 =?utf-8?B?N2pXTkpQUTFyYlh3MDNkRnpuNFdkclFFUW9LNjBJY21Dby9BeE15dUtTY2xF?=
 =?utf-8?B?TnZCMU9lSThTRzZkbGhyOTZ0SFJGY3dXKzlXMDEyYko1clVMcVhDM0tLRkto?=
 =?utf-8?B?TVIwd1ZXendZRVdRMFFTcFFCZ09tUTFlTTRVVkREaHhML0M0Qk1EeXBhYW9y?=
 =?utf-8?B?QlZlQXJlSEswZVFHQXhsSGUwN2NKeVRpdTczbzdwMndZNDFDSFJDdE1sUDc4?=
 =?utf-8?B?bzhlZXNOMmtBRWdpZ1pyYm1DMmtvVHd4VE5IdjliWlRyakhkellGZlF1NEZD?=
 =?utf-8?B?ZnVRZ2diTzBoMFRJN2oxQWVMb2UxRWMxd3dBQm4vK2R2anUxWUhNYWdQRjc0?=
 =?utf-8?B?N0tDUm1UZHpVZ0xoYUdLWFNLSXZKS2VQWGZmd3lBM2U4WURoaDByT09Jck9V?=
 =?utf-8?B?VGdKdzFCQjA2V24zNTY2S0hSbVdwTmthb2diZ1ltVzIxMzNzZmhZSm5MMkcr?=
 =?utf-8?B?UFhLT3NQZG5oakZEM2xyRkdCWmhDNk1JV2o0UHdFOGhYblBKOHhnMWt3ejV2?=
 =?utf-8?B?SXloUVZjMERRa0dvMXBCWEpuMm1rRmdWdzBiVDVDWTA0RVU0VDdwNkZWUVQ4?=
 =?utf-8?B?eXBlYmxpWitVLzRWTmMxTVJsM2ViNy9TbVBvQ1k1ZUpJT08xM0thQVNFcTcx?=
 =?utf-8?B?NVlOeVo0cE9IK29XQVN6T1ZUaGJ5Znl0WHp1a3lhL1JjV2lCOGZJMDMrMFQr?=
 =?utf-8?B?V0RadjM2bDVCMDRWeVdTQlZTZmtIV1NrRlk4cngvQnc0M1JKMkg1aURub0V0?=
 =?utf-8?B?RUhQTWF3TG1tWCtPb0ZaMGJQY0dHZHVTOFhCRUpwUXlveE9CMFEzR0JrbEtZ?=
 =?utf-8?B?MFlxVlZDT2dORlc3MmN6RXpVZHhRcCtyUkIwY0RkUFg0L0szMnFBVlYzaTNt?=
 =?utf-8?B?bzNidEJkdkU0dGRQUlFsMnlORnU5bkhaVFIycHMwampQRGxqWDNzb1o5MjYy?=
 =?utf-8?B?eGd3MEgwOFVHdWxHcWZCVUovbjhVNmZERTZDenNVS05TbDFneUNGSG4veG1X?=
 =?utf-8?B?TVN2TlFLT3g5T2tDZS9OeDNaYnF1czh0NGVNL2tLTXRuWDJqNitNUkhDRlBH?=
 =?utf-8?B?VlVrOGFkdnpmUXBnKytJNW8wVThWTmQxN1NybllIdkZaR1NrZXBsbWNzd0VX?=
 =?utf-8?B?SzJhbFhDVkErYTBUZUR2WFlhellaMXc1a2pKWm83VW45UUdEOXlVZU9rMGE2?=
 =?utf-8?B?aXNoTVpTcHBoZjFBN0VXK3NTNGxjbCtLY0x3d0tRUHg2a0JIb3NwdjFveDUv?=
 =?utf-8?B?V0lZcE5ndXFsbm1GaFdoczJwSmU1S0NRZmtuOUlMMVJmcVNYUVdwd1hZNmsz?=
 =?utf-8?B?WnBaWVpKcDlneFVDV2E3WHhvTjQ0S25XQjd5ZUsyMDBmRCtLcHVCZzlsQ3B3?=
 =?utf-8?B?dGo2TDEySGFkYW95NkZqODBlWVFDZ0VNbjBub0RBa2JNYXYyNFhtMUx1WjhN?=
 =?utf-8?Q?kL3QqBQAH3LXrAL4ynvrhY9rC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640b5c42-697a-448e-8b35-08de275e4211
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 11:24:52.1657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwYQsnYeTnI8qbefSBVeajVcxuff7EQEALpDxpLBoE5irdedIxUfTrVRIfEruTGPUYKzAj0/+qxqITqKaBJRoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDE5LCAy
MDI1IDM6NTMgUE0NCj4gVG86IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5j
b20+Ow0KPiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbTsgbGludXgtcnRjQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9y
Zzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsNCj4gbGludXhAcm9lY2st
dXMubmV0OyBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFZpa2FzaCBCYW5z
YWwgPHZpa2FzaC5iYW5zYWxAbnhwLmNvbT47IFByaXlhbmthIEphaW4NCj4gPHByaXlhbmthLmph
aW5AbnhwLmNvbT47IFNoYXNoYW5rIFJlYmJhcHJhZ2FkYQ0KPiA8c2hhc2hhbmsucmViYmFwcmFn
YWRhQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjMgMS81XSBkdC1iaW5k
aW5nczogcnRjOiBueHAscGNmODUzNjM6IGFkZA0KPiB0aW1lc3RhbXAgbW9kZSBjb25maWcNCj4g
DQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUg
d2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRv
dWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcg
YnV0dG9uDQo+IA0KPiANCj4gT24gMTkvMTEvMjAyNSAwOTozMywgTGFrc2hheSBQaXBsYW5pIHdy
b3RlOg0KPiA+IE5YUCBQQ0Y4NTI2My9QQ0Y4NTM2MyBwcm92aWRlcyB0aHJlZSB0aW1lc3RhbXAg
cmVnaXN0ZXJzIChUU1IxLVRTUjMpDQo+ID4gd2hpY2ggbGF0Y2ggdGhlIGN1cnJlbnQgdGltZSB3
aGVuIGEgc2VsZWN0ZWQgZXZlbnQgb2NjdXJzLiBBZGQgYQ0KPiA+IHZlbmRvciBzcGVjaWZpYyBw
cm9wZXJ0eSwgbnhwLHRpbWVzdGFtcC1tb2RlLCB0byBzZWxlY3QgdGhlIGV2ZW50DQo+ID4gc291
cmNlIGZvciBlYWNoIHJlZ2lzdGVyLg0KPiA+DQo+ID4gQWxzbyBpbnRyb2R1Y2UgYSBuZXcgaGVh
ZGVyICdwY2Y4NTM2My10c3IuaCcgdG8gZXhwb3NlIG1hY3JvcyBmb3INCj4gPiB0aW1lc3RhbXAg
bW9kZSBmaWVsZHMsIGltcHJvdmluZyByZWFkYWJpbGl0eSBvZiBkZXZpY2UgdHJlZSBmaWxlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGFrc2hheSBQaXBsYW5pIDxsYWtzaGF5LnBpcGxhbmlA
bnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBWMiAtPiBWMzoNCj4gPiAtIE5vIGNoYW5nZXMgaW4gdjMN
Cj4gPiAtIEFkZGVkIFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
PiANCj4gSSBkb24ndCBzZWUgaXQuIFBsZWFzZSBzdGFydCB1c2luZyBiNCwgc28gc3VjaCB0cml2
aWFsaXRpZXMgd29uJ3QgYWZmZWN0IHRoZSBwcm9jZXNzLg0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0KSGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQg
b3V0Lg0KDQpJIG1pc3Rha2VubHkgbWVudGlvbmVkIHRoZSBSZXZpZXdlZC1ieSB0YWcgaW4gdGhl
IGNoYW5nZWxvZyBidXQgZm9yZ290IHRvIGluY2x1ZGUgaXQgaW4gdGhlIGFjdHVhbCBjb21taXQu
IEnigJlsbCBtYWtlIHN1cmUgdG8gYWRkIGl0IGluIHRoZSB2NCBEVCBwYXRjaCBhbmQgc3RhcnQg
dXNpbmcgYjQgZm9yIHByZXBhcmluZyBmdXR1cmUgcmV2aXNpb25zIHRvIGF2b2lkIHN1Y2ggaXNz
dWVzLg0KDQpCZXN0IHJlZ2FyZHMsDQpMYWtzaGF5DQo=

