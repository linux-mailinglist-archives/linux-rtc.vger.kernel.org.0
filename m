Return-Path: <linux-rtc+bounces-4708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BDB2BB0A
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 09:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3749E170DE4
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 07:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D3227B334;
	Tue, 19 Aug 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UyySkTqN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ElI8ma/0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E828E5;
	Tue, 19 Aug 2025 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589730; cv=fail; b=hb2I6kyM8hwOkYjEjSvD8VLzaB/BNTMTtmbFGt0UbdX7QcSDmzcOUa87ui2ocMyV3JXiaVr4YMtMl9F4GGLHqavbYqhAudokTHLFZcf8a9hFQpRsj+Jh0Q8vR9LdhlNU+AWfK9CLo2pK+lh1UZnx8R7Hv2iLaONglyra8mgqSGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589730; c=relaxed/simple;
	bh=Js0kdeCE0e2bXkTctiqLY0yocOrZdpmp9ctCHjjcV5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KAqZ9qu04tB/xGeG5o+6uwlYT5q80kJtHfnvzecVt6hU9ATrZhStVeCcWgE1pJTK3eFIYYZYi/xFSOcIOC82LoowaLVRKDYVQ9R9z0dtMGWa7LXyCAfw9CusQgXdXNj/rxnG8NWq94D/7CTaA4WJKVxpWdeR1GOTBToTL/kfSuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UyySkTqN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ElI8ma/0; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ed4136c47cd011f08729452bf625a8b4-20250819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Js0kdeCE0e2bXkTctiqLY0yocOrZdpmp9ctCHjjcV5Y=;
	b=UyySkTqND8imEkdcxp72UyrjJPIrsDQN2uPeNYMo4SKP1dx1SikVy595bal2WPhjZZl4JFdN1cGDBZvem6Rk6hrBIL4UWVc7V5gxiOjoVE2o+0fjjPagm0QSvV/IZHqqiwc8IBmygU7j8Cyk2fDvadXudnHq7dubKPPUb6Yu+9I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:23073f8f-1b4e-4c27-9f7e-3bd3a906a67a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:8328497a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed4136c47cd011f08729452bf625a8b4-20250819
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1384760288; Tue, 19 Aug 2025 15:48:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 15:48:41 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 15:48:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnwhYhVYSjt3fHlSbsLOvW7gPF6Cw+GLHHmTrOECjEhwngW+hB8jjOx8SnYMV33Qbdon2w6OJicdb8amAymZFK5LGWTDbPQWp7LEO2pfIw1GpXm930rw6Gd9GzIHc9x1e9alnjEfr/FXDDHw0lwiuAWry7aPIXGtuiWsAgrx+SdP4cjG67fOK4EMv2+I/ciYFpedl6Fy701mXuwDYH12CSjzR/V51ShaWNmWbYNKfbKhoYxsTB8mYm+OJiF8//4J6Y8cS3/KiEe2LR+JWv3JWPS2GIRRCy478uFS0aV0qE+MfUVl8/HjuCd9klcadTgsStP9gN1y1de51rGcTpgC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js0kdeCE0e2bXkTctiqLY0yocOrZdpmp9ctCHjjcV5Y=;
 b=RTBpPvyQOObzOBWg8C/wSu3j6vMjQi+bBF2s9sKJqRVsbd3nJOF5YWq4zc2E/dl4k+ojW8hWIYQOjlQeMb4135ge0zpoE5/xUmMt9krXWQvLbuqVyjUKUEkMC68eVd+hJX4Lnx3lOmYbpy5FL9U0IrSVl61p9YPGO30tBy0od4+RF1NUAAGBGP3uAdCOm2pyvm+C5m5vQmb9qMGCwuqSW6pIwyaFyrSeYp561fBWW6UItyzwD0J3I1xJPAt3mkOG/pyTjoavKqmkYpJnGz92XxPAUAyNQ8CNZnkuTYH5zrXMGwCc5OMs2Vzdblw9mQGoOHWWdV+2wN7h/LCn5aYItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js0kdeCE0e2bXkTctiqLY0yocOrZdpmp9ctCHjjcV5Y=;
 b=ElI8ma/0bD9lTvyPqPcXkNxbhm8+f46rs0/uXB4LUHNJUHZVAk4+ROZ5wCCvLgd4+/t9/pp0u2+N72bNISmfFte6uw/htv+JeZ9pgOToIAb/kxVYLyHUisaJptg6036oJYn9Vnynsp+dnZ8blwumZSM9SoEHka5PV1XufgRBFzU=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by SEZPR03MB8184.apcprd03.prod.outlook.com (2603:1096:101:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 07:48:38 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 07:48:38 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>, Sean Wang
	<Sean.Wang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>
Subject: Re: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Thread-Topic: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Thread-Index: AQHcCpgxDXz156RJv0W4iNIXM31/xrRdbQyAgAw5G4A=
Date: Tue, 19 Aug 2025 07:48:38 +0000
Message-ID: <81e8bd4a89545de7f05d19c2a7aafbaf11a5b203.camel@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
	 <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
	 <2025081113090716407d59@mail.local>
In-Reply-To: <2025081113090716407d59@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|SEZPR03MB8184:EE_
x-ms-office365-filtering-correlation-id: 1b1e8e69-ddf3-4546-79bc-08dddef4cf05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTkrQllDRzRCQ3NMWXd2Z2hmNkc5eGdoTGkwd2pyTHNTUEkyYzQwVWZ1QzlG?=
 =?utf-8?B?SkZvMWczNG1vR0JUTUFldzM3YTZXckZlTXY2TDk4RHk2bmIxd0ZEb25TL1BB?=
 =?utf-8?B?cXhyWi9xOGt0ejdQWlJuTmZoZjA0eHhZOVREbFFRaGU4NWsyWWlKR0pTTll1?=
 =?utf-8?B?TEt5OWVFQ0lwOWhwVlI0cHVvZ2FibHNoTEoweGU2c3BTSE5iTFBnWlpVL3RT?=
 =?utf-8?B?bGdNNFl5NFRWTnFKRjBNRTVyOGVNMXo2RklidndJY0duWUdVL3c0TTRLQlpD?=
 =?utf-8?B?MFcvajQ5Rnk5M2dBci96U2pOOVhMN0pkaHdBc2ZINGVCM05jZ3dlTzFHZW0x?=
 =?utf-8?B?YWtibjhuRzN5WG44YmdFaW40NldZTlpVOFh2WjNITXBQdkJGL0EvQ1d3S0FO?=
 =?utf-8?B?WHg3cDJkZUE5RW81dUl5UVhTRm4xYXVUZUNqMjRub1gzdS9teEU3MUcwVTFz?=
 =?utf-8?B?Qkd1U2Y3d3AzOFRIZjR6bnhJcmhwci8rMW9jVVByeUxQLytKcjIvQWZBUzdF?=
 =?utf-8?B?UndxSGVsYklzdittcHpNNjZ3c1d6UnE5TFpwT3pRNEVhWFJDclBZNWZ6VktN?=
 =?utf-8?B?OUNkcWhKS0o4OGRJbWRjQkdvSFhxb2VhdmducUloY25obFIzZFRwMCs3WDhR?=
 =?utf-8?B?VkovV0NlWDdGUTViQzl2M1dpWFYrNzkybEI0aDUvSTdIRFRyOWhsK1Y5Snlp?=
 =?utf-8?B?Y29XdXJpaUdBd2Uyc1pFQmtUYmgyU0RnbVF1ZnlKdlpWaWJqUlJ6alJyUGZy?=
 =?utf-8?B?UXBBQXBVb1Z1VlEybjBtYklyZDc5V0tNWVlvWForVEdrWVN5aEFnYzc4N3Ry?=
 =?utf-8?B?cVo1QXdaWEhydnMyZ3liaS9uMW5GYkJUUDNQYTFNbG5ZTGxpSkcrcHVLbDBP?=
 =?utf-8?B?U0phWWdydWJKbU5NVjhPRnkwa3RyV1poSlRHZFMvdTNZeG5XZWYwdnhCMGxW?=
 =?utf-8?B?Qkk5VjdyLzZ5SGVHSjNqa3R2L0FtQ2VJd2xVUWJZU2R6RnIvUER3dUE5bUpz?=
 =?utf-8?B?Ky9WQytiVVNCaG1HNHkwV2tRTWlwUlBVR3MvN285QkovK21JWjJTM0lqNG43?=
 =?utf-8?B?U2ZwcGlja2krckY0SXZRdGZtU0dHd3hNZW5XR3grQTlyNEQzUWJXL1RWVmhQ?=
 =?utf-8?B?S2p5L3puUldsZTljREUxUFo1SkZzWnVZdm5KOUFpTTB2Z1VGaGN6eC9BdDVJ?=
 =?utf-8?B?MTBxWEFETXNId1k3YUVxQ1djTTJhSmdxU1ZBaVo0eFlXYk50dVNZQ1Ntaitj?=
 =?utf-8?B?UUlBZlJDMFczYzJYNGluYnVJbUZ4SjVzTktUK2Z0WVd6MFhWU2ZRNDNpYm91?=
 =?utf-8?B?ZndQYm5FTC93MlpDdGpwTm8vazhvUnpybHRwVm1jWjRUTkF2TEU2TzdkZG5R?=
 =?utf-8?B?WGdwais2T0Z6c1c2OFBvS0xSa2JONERrcWpuK0grRGZKN3NOQnMvRE1aZVFu?=
 =?utf-8?B?WVhQc0FvK21MazFDQ3ZxY1Y5OTJKckhZZkV4S2RxUWcySU11NHE2TzFrWjMz?=
 =?utf-8?B?UGIrMUNJazlBcXZmbzhvQXRNNkpuaDRlQU03VlEvN0pkdDhWemxlU0o1cVY5?=
 =?utf-8?B?UmdBd25UMmhtMVdJZEdQc0U5TzFrZkswajlOaUZqVjM4YVg0QkUxRGswcjJ2?=
 =?utf-8?B?UG13cGdNNUxJb2lqUFZpTVlLVGJZVFNJTTc0YmRqek5WVDVxR3hEeVhNMFJZ?=
 =?utf-8?B?R0o4NUppR0pRSzZhdjJKREhtNW1DcE1IZU5PUk1XMEYzVTVwS1JtallGYTkx?=
 =?utf-8?B?Tzk3d1FCbHZFZ2ttL1V6Qm5vSzJTejVPUlVQeklxUGF4c0U0ZFp2YmZWTUw3?=
 =?utf-8?B?OGhteStPYkJ0cHhVazNTNURxcFJrK2NQY2JJVEY0d1VzSkd0dDY3akFucmxJ?=
 =?utf-8?B?MC9QSU91OVpBcldjWUpWUU8wOTljZjZqbm1Hd0J0UWFROStTL0pDSC90aVkr?=
 =?utf-8?Q?KmyxfWz8qOk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2h5YThxMHlHK284VFdTT05hYTBZRjZKQW4yWmNnQytrblpJZ0kxeEg0Vmo3?=
 =?utf-8?B?RFBiVVNSdGhwRy8yQi8xWERmUFJTZ3NBa3Q3MDRra3g4MzZWUkVESHNWdXdx?=
 =?utf-8?B?TTdPREZNODNWbHJYUmFCNTRQWDZEbjN2UXJNdWtyMzh0RUZvdndpeFo5WE5H?=
 =?utf-8?B?N0NNekZSRE5hU1J4V2t6aUI4ZEEwTjhnRFdXVHE5TlNveldydUZhSFB0UEpP?=
 =?utf-8?B?dUJGNTFTVGc4MEtCQ1Q4UlltckF0Unc1dStqR0tYdE90QTBKSWdnYm9TZUt6?=
 =?utf-8?B?QlpIeDRPak9TS2NjNFp5K1JzdW1XYzUvSkx2Y1V0dW1IM1JSTDRrN1RWdE5K?=
 =?utf-8?B?VU5NcWx0TkhmSUhDODdzMVd4OHN0TGJRdmpQMXVmV2RYRi8ydXh2MjhXYWlK?=
 =?utf-8?B?UjhIQ1FZOEo2dm83dUtRc3NEeTVLUDVZTXMycTVLL2hIQ1ZSUkdSNzY5eCtV?=
 =?utf-8?B?VFNCcWdyZzB6Tjk0RDVSS0VQdWlCUXZ4YlJYSDJ2M2NPaGVGV3NxSjRDY3hv?=
 =?utf-8?B?WkZhZU1sNFl2VDhsOFgrazBuQUFobjFCd0VBa0tMdmtxbkVJTlVZVGVSRGpN?=
 =?utf-8?B?MXlSdUtPUEV4RTFBcHQ0SzlQeU5uYnlQd2hQTDAvb25qaWUxZ2lybXN1Rlgz?=
 =?utf-8?B?cW1MSnJIcGNhZSsraS9VU1d0VWZwR1FYdTQveWE1L3JSaFhWSXdYMjNSY25j?=
 =?utf-8?B?MGhnaHREN1kwcFFlQ0FpUzluTUVvcS9uaXdqWnoyZnR4NW43NUFDNWJXSURT?=
 =?utf-8?B?cDZiYjhvcGQybnI1Mm1uczRRbmVsOHI0SXhOZnRYcDhXQm9Nd2FBOTg5Qm5y?=
 =?utf-8?B?NUt3ZHUwMWVqMXRPZmlnZ3ExblIrS1k4MHMzYVVBa3JrL0psSkcrOGFqV3NG?=
 =?utf-8?B?YlNydnprVjBGUkFnMkNJU2JVZk56UFZZd2huMWlXNlFzUFBqaUZqaVYxNVcv?=
 =?utf-8?B?MnZGUlVXU0VPNmpPU25NVG1GR0hPWHZZNHRyenVJOEgrUXUwQWZjSHFyWjZz?=
 =?utf-8?B?TXI5QjlSSEJ0bVI2RmZtQWFOZ1c2SlRobUEzamVKQ2N2Yi80QWxYellnNm5L?=
 =?utf-8?B?L0c0ZzlVN3FDc1JIYUx3eWp4aTFPc2pTL2gxVjVZb0NWNmxpVFdzaE0ybGlp?=
 =?utf-8?B?TG9HM3RHcFdLTUNSN2FlN1ZXNlVZOFllRWhZRWRibFgxSXp1WGV0QVFwWWo4?=
 =?utf-8?B?OTNSQ3c3b3ljbnRndkhMTE0yaHZ4TFlFSUoydzVXd0RHcGtyVFV5cHB6c3B0?=
 =?utf-8?B?TTE0Z3I3OEN1M3ArV1N5NUlkaG1vZ1VXbXFabUtVUUQ2S09CZmNlTktYTEs0?=
 =?utf-8?B?Qm9xZjRtR2tYVlZjcjhmc1ZRRDZVYlRCVGZVUllBMmhkYTZFM3pjbk43QUQ4?=
 =?utf-8?B?bTZ2aUpJZkNoTVpSM1hNMG1iUWpEcW01RjAvbm5kK0Z4UmFWbGlPWkhaSkhR?=
 =?utf-8?B?OGlaRWtPcXg3QURqcUtkQnJxYUNWSlVGL0JGYy8vQU1kellvSmtkcjIzUzZH?=
 =?utf-8?B?YlM1REJZdTJxVmc3Y1gzdlFDOHBHcnc3RlRYQWNBYkl3cEtFdXNHd2RaNC84?=
 =?utf-8?B?b2xQeWhDM1k0MUtFUTg5clNGWkhUUmRYQTFNaWV1eGd5WDliWWpLNGJlcW1O?=
 =?utf-8?B?eExldVVqMVZxWGU0NDNrYzk4R20ySXZ0Z3BZeFUxVUFIM2gwc1oxRXZDaWRN?=
 =?utf-8?B?LzJXWDFwL2xIT3dlU0FaNktUSVpiekRmd3pVWHZOOXcxbzZGNzRPQ3ZVL0FL?=
 =?utf-8?B?a203Y29vQnR0WjFzMW9NZFlGVVJOYVNGd1dsTFd6NUZLV2M0QjhIRWIveGQ3?=
 =?utf-8?B?U09CWlRJMGpEUjJDSTNxTk1saGFGRHlBYlBPeWRmSERnMXJuRk5RbHBFelE3?=
 =?utf-8?B?S2JobW1KYi9VN0cwKzcwdVc0d25hQmt5Qm5scXZ4VUhlTko0MFNkbGtoQ1RU?=
 =?utf-8?B?SGN1Sm9rSmw3cm5HOHZlM0k3UVFjOHA0OEpHVkVpTEtnaXJObFowRFBMcFQw?=
 =?utf-8?B?SWlZQU1FaVoxY0JyVTRvSHAxRXNYV2lLQVRGcUdRR0xGalI3RlU0YnNhV0pW?=
 =?utf-8?B?bXBnbG1IcU5oR0FCd1VpVmpoT2phY1dpY1RmTDd0dndWQ1pseTBLdTVSTEoz?=
 =?utf-8?B?ekJ0NkV3TFZjNEVuZ29nUTlPRkh6ZEFXeldoRU53MUZWUjZISnphZU4vTk9F?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5B506A6EC52941857CBB9144FC5312@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e8e69-ddf3-4546-79bc-08dddef4cf05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 07:48:38.2565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wg0SB/WxoUVRKYtG/THaQIebTXtLq+Veusd1dCLB2kK716uW+jWT9/U8EDSGHA3M9tFNB8pEJS9aEcGuARTD5oPFPLoZWdw9AZmyDsWxPxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8184

T24gTW9uLCAyMDI1LTA4LTExIGF0IDE1OjA5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiAxMS8wOC8yMDI1IDE2OjE1OjM0KzA4MDAsIG90X3NodW54
aS56aGFuZ0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2h1bnhpIFpoYW5nIDxvdF9z
aHVueGkuemhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBhIG5ldyBmdW5jdGlvbiwNCj4gPiBtdGtfcnRjX3Jlc2V0X2JicHVfYWxhcm1fc3RhdHVzLA0K
PiA+IHRvIHJlc2V0IHRoZSBCQlBVIGFsYXJtIHN0YXR1cyBpbiB0aGUgTVQ2Mzk3IFJUQyBkcml2
ZXIuIFRoaXMNCj4gPiBmdW5jdGlvbg0KPiA+IHdyaXRlcyB0aGUgbmVjZXNzYXJ5IGJpdHMgdG8g
dGhlIFJUQ19CQlBVIHJlZ2lzdGVyIHRvIGNsZWFyIHRoZQ0KPiA+IGFsYXJtDQo+ID4gc3RhdHVz
IGFuZCBlbnN1cmUgcHJvcGVyIG9wZXJhdGlvbi4NCj4gPiANCj4gPiBBZGRpdGlvbmFsbHksIHRo
ZSBtdGtfcnRjX3NodXRkb3duIGZ1bmN0aW9uIGlzIGFkZGVkIHRvIGhhbmRsZSBSVEMNCj4gPiBz
aHV0ZG93biBldmVudHMuIEl0IHJlc2V0cyB0aGUgQkJQVSBhbGFybSBzdGF0dXMgYW5kIHVwZGF0
ZXMgdGhlDQo+ID4gUlRDX0lSUV9FTiByZWdpc3RlciB0byBkaXNhYmxlIHRoZSBvbmUtc2hvdCBh
bGFybSBpbnRlcnJ1cHQsDQo+ID4gZW5zdXJpbmcgYSBjbGVhbiBzaHV0ZG93biBwcm9jZXNzLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodW54aSBaaGFuZyA8b3Rfc2h1bnhpLnpoYW5nQG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jIHwgMzYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KPiA+
IGluZGV4IDY5MmMwMGZmNTQ0Yi4uMDYzYmQzOTlkZThjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvcnRjL3J0Yy1tdDYzOTcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0K
PiA+IEBAIC0zNyw2ICszNywyMSBAQCBzdGF0aWMgaW50IG10a19ydGNfd3JpdGVfdHJpZ2dlcihz
dHJ1Y3QNCj4gPiBtdDYzOTdfcnRjICpydGMpDQo+ID4gICAgICAgcmV0dXJuIHJldDsNCj4gPiAg
fQ0KPiA+IA0KPiA+ICtzdGF0aWMgdm9pZCBtdGtfcnRjX3Jlc2V0X2JicHVfYWxhcm1fc3RhdHVz
KHN0cnVjdCBtdDYzOTdfcnRjDQo+ID4gKnJ0YykNCj4gPiArew0KPiA+ICsgICAgIHUzMiBiYnB1
ID0gUlRDX0JCUFVfS0VZIHwgUlRDX0JCUFVfUFdSRU4gfCBSVENfQkJQVV9SRVNFVF9BTDsNCj4g
PiArICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICByZXQgPSByZWdtYXBfd3JpdGUocnRj
LT5yZWdtYXAsIHJ0Yy0+YWRkcl9iYXNlICsgUlRDX0JCUFUsDQo+ID4gYmJwdSk7DQo+ID4gKyAg
ICAgaWYgKHJldCA8IDApIHsNCj4gPiArICAgICAgICAgICAgIGRldl9lcnIocnRjLT5ydGNfZGV2
LT5kZXYucGFyZW50LCAiJXM6IHdyaXRlIHJ0YyBiYnB1DQo+ID4gZXJyb3JcbiIsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIF9fZnVuY19fKTsNCj4gPiArICAgICAgICAgICAgIHJldHVybjsN
Cj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIG10a19ydGNfd3JpdGVfdHJpZ2dlcihydGMp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX3J0Y19pcnFfaGFu
ZGxlcl90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gPiAgew0KPiA+ICAgICAgIHN0cnVj
dCBtdDYzOTdfcnRjICpydGMgPSBkYXRhOw0KPiA+IEBAIC01MSw2ICs2Niw4IEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCBtdGtfcnRjX2lycV9oYW5kbGVyX3RocmVhZChpbnQNCj4gPiBpcnEsIHZvaWQg
KmRhdGEpDQo+ID4gICAgICAgICAgICAgICBpZiAocmVnbWFwX3dyaXRlKHJ0Yy0+cmVnbWFwLCBy
dGMtPmFkZHJfYmFzZSArDQo+ID4gUlRDX0lSUV9FTiwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaXJxZW4pID09IDApDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIG10a19y
dGNfd3JpdGVfdHJpZ2dlcihydGMpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIG10a19ydGNf
cmVzZXRfYmJwdV9hbGFybV9zdGF0dXMocnRjKTsNCj4gPiAgICAgICAgICAgICAgIG11dGV4X3Vu
bG9jaygmcnRjLT5sb2NrKTsNCj4gPiANCj4gPiAgICAgICAgICAgICAgIHJldHVybiBJUlFfSEFO
RExFRDsNCj4gPiBAQCAtMjk3LDYgKzMxNCwyMiBAQCBzdGF0aWMgaW50IG10a19ydGNfcHJvYmUo
c3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIHJldHVybiBkZXZt
X3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjLT5ydGNfZGV2KTsNCj4gPiAgfQ0KPiA+IA0KPiA+ICtz
dGF0aWMgdm9pZCBtdGtfcnRjX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgbXQ2Mzk3X3J0YyAqcnRjID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7DQo+ID4gKyAgICAgaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsgICAg
IG10a19ydGNfcmVzZXRfYmJwdV9hbGFybV9zdGF0dXMocnRjKTsNCj4gPiArDQo+ID4gKyAgICAg
cmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHJ0Yy0+cmVnbWFwLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBydGMtPmFkZHJfYmFzZSArIFJUQ19JUlFfRU4sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFJUQ19JUlFfRU5fT05FU0hPVF9BTCwgMCk7DQo+ID4g
KyAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+
ICsgICAgIG10a19ydGNfd3JpdGVfdHJpZ2dlcihydGMpOw0KPiANCj4gVGhlIHdob2xlIGdvYWwg
b2YgdGhlIFJUQyBpcyB0byB3YWtldXAgdGhlIHN5c3RlbSwgd2h5IHdvdWxkIHlvdQ0KPiBkaXNh
YmxlDQo+IHRoZSBhbGFybSBvbiBzaHV0ZG93bj8NCg0KRGVhciBzaXIsDQogIEkgd2lsbCByZW1v
dmUgdGhlIGZsb3cgb2YgImRpc2FibGUgYWxhcm0gc2h1dGRvd24iDQppbiBuZXh0IHZlcnNpb24u
IHRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gIA0KDQpCZXN0IHJlZ2FyZHMNCnNodW54aSB6aGFu
Zw0KDQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+ID4g
IHN0YXRpYyBpbnQgbXQ2Mzk3X3J0Y19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAg
ew0KPiA+IEBAIC0zNDUsNyArMzc4LDggQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
bXRrX3J0Y19kcml2ZXIgPQ0KPiA+IHsNCj4gPiAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJs
ZSA9IG10NjM5N19ydGNfb2ZfbWF0Y2gsDQo+ID4gICAgICAgICAgICAgICAucG0gPSAmbXQ2Mzk3
X3BtX29wcywNCj4gPiAgICAgICB9LA0KPiA+IC0gICAgIC5wcm9iZSAgPSBtdGtfcnRjX3Byb2Jl
LA0KPiA+ICsgICAgIC5wcm9iZSA9IG10a19ydGNfcHJvYmUsDQo+ID4gKyAgICAgLnNodXRkb3du
ID0gbXRrX3J0Y19zaHV0ZG93biwNCj4gPiAgfTsNCj4gPiANCj4gPiAgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihtdGtfcnRjX2RyaXZlcik7DQo+ID4gLS0NCj4gPiAyLjQ2LjANCj4gPiANCj4gDQo+
IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluDQo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gDQpodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9ib290bGluLmNvbV9fOyEhQ1RSTktBOXdNZzBBUmJ3IWhHTWl0
RUVVVS1zYkgtcmNNQ01RNFZsc243TlFlSGRVcmc5bkVLWVB5RE1FNWZrYmdzVmNpWmQ4U1VSeGt2
V0E5WjFxWDNveU5WWkVXdlZhdFlFeFo4RDdjRnZkaXlTXzNRXzYkDQo=

