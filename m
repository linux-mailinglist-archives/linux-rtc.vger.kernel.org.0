Return-Path: <linux-rtc+bounces-4712-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C1B2BBF2
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 10:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C863AD443
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864333112D8;
	Tue, 19 Aug 2025 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gDj90ZU0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="F9X0YNhF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8221E0AF;
	Tue, 19 Aug 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592369; cv=fail; b=EyszbDJE9rddOQZGVeN3Ty5c+NBPOu2gc0YQ+q1Pho8IqyirKvtE920wdOwtjYHAt65nFNIINCCGPP8xW5ORd1ocNmpKPVMqEZS/wAp00ylR+hsv+bqDp76vjwZ7V7e1bMS/6MWrTRh9vCWS6kC584pTsC68ZD1DHA5XqOluu2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592369; c=relaxed/simple;
	bh=B9730rlHoHtVtrA2KgmeB2f87GU9Jhpmt7QI3JwGUM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eMfjKpIrjqfld7h/6wh5FJElZtv5Mb8cbJ1PXzCbxMaWHb+Eb5MMSUZLBz5LYrcrTw/lcHhaJzNcImCnPe4KE+21unkkagXc4r0y13HBzUlDDhYksvl2JYNOfDmxAiqa/GY7L0dZ01EUUKy21loIG5ZMBE3v9M/Kb5mbj1MYMSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gDj90ZU0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=F9X0YNhF; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 12e2adbc7cd711f08729452bf625a8b4-20250819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=B9730rlHoHtVtrA2KgmeB2f87GU9Jhpmt7QI3JwGUM4=;
	b=gDj90ZU0iZifqPsoKlvvtBTPpsaitZBfOx5CU5Shh1Z6pZ5VnEgCdvRD2ghhzHkcEe4Wj7vAGJsNU8aRwdMVU4n57KPEVxk/aK9yS3DLfAMeL7cbyOXPcw1lXIFnxssEE4ocpsxxrwDViVTIooVS1/vPV4n8UGdM2Cm+WKTU+ls=;
X-CID-CACHE: Type:Local,Time:202508191555+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:08b1f830-db67-4ad3-9e7a-746a9f79c1ce,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:013c497a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12e2adbc7cd711f08729452bf625a8b4-20250819
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 374524980; Tue, 19 Aug 2025 16:32:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 16:32:40 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 16:32:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgcaXHFuMrgTS6ytBwFebyv6WV/cZfD1/Nf79+lpVu+Q5Yvi11CcgnlD43YYuCbzViW+lsB7mzeGkJw75kT4imf27M2xk+9SAZaWD8ZKiSF+0WI8ROJsP3ggo8+QZ8s1eOeQ80qp0mT9rXxBZvu7/Fy4qH80zkE3EHNClmPAYJoX++ZStqBeKGnMONp7F+y422oWWkqpXGCrED6FZeH+Mc339JQSTi0N67hy0ZxPhJvIaASxbRRlqu5ZzGhyzc59DVXgQnfhYeGFXAY6tqwD9M/3ZrSycgNswvN1NDojiuNHOS4x9ueo651z7U0Tyw3U4QHTPt7em5fYWrUsg81V/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9730rlHoHtVtrA2KgmeB2f87GU9Jhpmt7QI3JwGUM4=;
 b=X1q8lY9WzsZF1e3FKXCvTfgnfBu26RXk3YaWF9NOSd09oJHt61tDamsR0aY/QAoDXZ/8+wNXCe4EJnTKcJGUqQD6WUzoGbZQz6Fsh61KeolJp3ZzxAUcjIjZuuGpOABm5U/A942l1xH+BpW853yevOTI9m6OBMkYdQJj2DELGW5S30+22OiZNYKd9ZJeVcz6RuUIY8yO/uis/svV7EH3visc7hCyGZwpDlcmY6bqYpB7aIkpDvb1n7Ksis7X6D8Hkk0u9nj+D0TmJCS+5raydl4yVl6t5AEHj2ykGCU1BZcCkVQ9gd5lol/Y1PLVaUdKgRpk4EOwlKFG4oRbIp3LpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9730rlHoHtVtrA2KgmeB2f87GU9Jhpmt7QI3JwGUM4=;
 b=F9X0YNhFGmLFav26WtYcj5LIw0TySMJj0pmwmD61DKaZzXGOrkZHnHgiAezG4gfy1/I8B0T31cxPr+T71sMgYCQglXXw/SCiQs+d6hUS00kzyqJKqJRJlh3jT+E9YaOiX++dVFe9W4/VFsDzxpd4k3Rlg1rCZFsVaHACUof2D+4=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by TYSPR03MB8028.apcprd03.prod.outlook.com (2603:1096:400:472::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 08:32:39 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 08:32:38 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: Sean Wang <Sean.Wang@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "lee@kernel.org" <lee@kernel.org>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>
Subject: Re: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Topic: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Index: AQHcCpgvW6hQmxxYeUeBT2HNIAh14LRdScKAgAxeHwCAAAXzAIAABJ6A
Date: Tue, 19 Aug 2025 08:32:38 +0000
Message-ID: <8a5d6f3fc2befe5f7c999c98bf1aa401aa1280e1.camel@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
	 <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com>
	 <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
	 <40342432bf4638b54615b70320f72095f18c0490.camel@mediatek.com>
	 <97cb6271-9881-40e0-83a6-e41f14c85865@kernel.org>
In-Reply-To: <97cb6271-9881-40e0-83a6-e41f14c85865@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|TYSPR03MB8028:EE_
x-ms-office365-filtering-correlation-id: 15478111-be30-4f49-106c-08dddefaf4ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Wnd2OUZQQjdDQnZrRk9LdTMvWmJPMTFiOFJ0NjlpZDcwTVV5cy9ncmU2TVBO?=
 =?utf-8?B?b3JHUDVDK0ZMaWZ0dERzZlp5VVRrVkJDZWYrSTN2ODJMekRzZmtMRS85V0px?=
 =?utf-8?B?eGcxVnJCTHE5UmtKc3NtZ2lzZmJmMVVtd2VWR0doM0RMZUsxd3J4WjkyT210?=
 =?utf-8?B?N0x1RWZCSytKVFR6MEhmcDFQZ2IxVURWd0VBN1MvamN1Y3BiVkZLVFRSaDBS?=
 =?utf-8?B?ZU1FWTR3amh5bWpOSk9sT0xZRU9lVEpLQWxtUE5mdDZ4OGVydHlsbGtWL3B1?=
 =?utf-8?B?SXg0MEcyalpFbjYzUGh0eGRHS1dIVXZ3ZHhKUkc2NlFSc3BPV1pJdU5oVjNT?=
 =?utf-8?B?TnlNbklCVGRVUHE2cW9qTGhkdW10bmNjUVZBWFAvUTJHRDVlUlovTzFvTVhQ?=
 =?utf-8?B?VlNvSGFnZ01oelZyMzdlTllkeUpueFI3TWRmMi9tY2RqZys3Vy9PSDJCMk5t?=
 =?utf-8?B?TVd4eWdEUUt3L1cxZHhzZ1d6ek1JWCs0SkRQZUYzL2Z2dzV5N3dQSzYycndO?=
 =?utf-8?B?Z0cwNFlHNEUwREVMMzBXZ1ErWXlBa2Nya3B2WmU3dk9iOXorbmdFcWhvUGtx?=
 =?utf-8?B?ZndJaVJQY25kdG1tRnBoeTJGWHZXSUhCOVBkb0hQSGt2ZHZGUXdVdUs3Y1Nn?=
 =?utf-8?B?UXBUSHVGSkhVL0ZUN0c4VklVR2g1YmhXNFE3ckJGMkxWMFQzZm9vWmhjMkFS?=
 =?utf-8?B?ZE82a2EwRFVyckdsU0ZOaVVXVzVST0FETGRtdlJTTUNScTRrbzVmNVRsWnpT?=
 =?utf-8?B?Nm53SUlrVWliY290UDErOXpXNmQ3cnhOT3JNMjJuYnFWMnRoSHR5S3NjVG5v?=
 =?utf-8?B?ME1JS3JCZEpjZDFmZFd0eGZaWHIwZU5UZStFd25aOGpZYXpiNDZQL29jNFA4?=
 =?utf-8?B?YTNibDZRSEhCUDZGYytoOVpnMmMrd08wamltbkRxaDFpb2pTME9IWk1XUVlI?=
 =?utf-8?B?M2NPeTRBZG53RkNDRmo1YXREV3NqbmsybFoxSTk1RCtncDc3blBzV0JEb2Ur?=
 =?utf-8?B?RUJBZlNTY1REcytXVDRBKzBIRHJ1dnlwRkF0eFVMOGdzYmhiREpDczU2QVlk?=
 =?utf-8?B?K2JxTkNaWitVcjZVTllXRkpEby9UVHczWG45d05yU1g0NFBhYU9weGlldnlx?=
 =?utf-8?B?MzBDNG5WaXNHNkZhaHVFT0U2dDRDWjZwVkNmaHdYVlVtV1JtVXY5OU1jdlY2?=
 =?utf-8?B?azUydTh1NnFqTEptaHB0WStQVHZqVkVNY1VJSFA3eDRWdm16Z2hVbFpLNDBJ?=
 =?utf-8?B?TDY0UjE0NE4wLys5TnQ2QzhGRHhHS2FkM25TWGdzV1gwVW16ME5VN2w3MWto?=
 =?utf-8?B?TGFUa0hhVnhCbzRTMGk4VkF4OGV5a3QrNlJuRTMwMzkrYTR5bWR3ODU2S0Ex?=
 =?utf-8?B?b3VwVlF6N1RFaDZMalpmbTR0Z3JweU5QdjZaNER5NTB1L3pXRmR6QUxjYzQ2?=
 =?utf-8?B?Q3lxSUhIMnRkQlE4YzI2WXFzNWxTUGo3cDlQUVo5eFBYL3VSM1h0K1haQXZV?=
 =?utf-8?B?U1dOTGNvQzI1L0diMUUrbTg1RFVzeUlSYWhaaU9wdTVteW8xKzZCZ2s5ekFp?=
 =?utf-8?B?Unh5eTdvNWcwU2hIQXV6aWE2SjFtNlpsNEN5TStLeW5QV1BDS0oxcktQYWFN?=
 =?utf-8?B?dk45Y2ZucTRsb3ppVnltUXQrTzlGWmhYdE5YYjFEZVBhaitGSEppVHVMM1lS?=
 =?utf-8?B?RDlZUUNGNlhQOCtzUDljbXdEVEhmOVd5WHhiNTBCbTZMbCsyYnR2cS9hZ01P?=
 =?utf-8?B?VjdNbEpkTDQ3TnNmRGsyMXh3eHkwVUNiU0ZEWjhaa1BKUVA1bytTUzdVbzlq?=
 =?utf-8?B?N2szOFlxM2VzWUZoMVFUY1FYUTE2RVFGeFhtVWs0eFlWODhZV3lVN0FoMTZH?=
 =?utf-8?B?Nmw5a3VOWjJmZEo0bFlWVkVsUDZxTjlyUStuL1J5WS9naSswT1kzQlBucGR1?=
 =?utf-8?B?TG53UGZGck5BWnJmK3JucnlDSjhRYmVpVVlFQjVEZmtwMU9ENS9uOGl3Y3Vt?=
 =?utf-8?Q?q2TWiZLY4+NnkGgEWTuSMotuvFwDhU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c29HWU1OelN3K0M2alordTlUblFOdGZ1RFJvUTFuM2JrMUxkR2FiRUNWVmZE?=
 =?utf-8?B?VWxmQTBpSkZaKy9mMkZXdVcxN0RPUHJUZ1QxSzR0OW5Hd29CTkVUQ1BZcC9s?=
 =?utf-8?B?Q3lBZVVnU0NIOWlrQWJkR3c4NjhsU2Fwc3VRMkNXUU1BVEpUM01SWHA0SnF4?=
 =?utf-8?B?a2tXVm90YjBiMGN5TEF3bEV0YytoelFPWDdaTEd1cCtZS2Z4anRCR0NHSVky?=
 =?utf-8?B?bHRKWXZ3OWRBenkxQUZyWXBTQWpqMW5Mck5CNGFneGd1TW1WeDd0NUxwMDh4?=
 =?utf-8?B?VFRjOWtIWUc1UGltN3daV3F4am14OFhJdEx6aU4xK2hnbmVlZExuOTRLditD?=
 =?utf-8?B?TDNiM0dadG0wK3I1bmpKQVJrTnU5VFFzMWFzdXB5dGRwcEo1T2l6eXFlSk8z?=
 =?utf-8?B?eWZFYjk3TlRMSSszVi9EMi9HQldGdnAvOXQ5dWxNeW9vdUVNVFhWRVUwRW9m?=
 =?utf-8?B?OVRoZGxuUVJEUkhhR2dQdU5Wc1FaUHU0OTVPNmxMd1c4c0hjQXJPckRxdmdX?=
 =?utf-8?B?K3F5eGJZdnpONlhPZXNNSVZIMy8vY3VKSG1mTFBMSTR4ZS80Q3QvQzhOMVph?=
 =?utf-8?B?Z0gwMDZZWUpnc2dmZTRPUzRMV2hCQVJIck9PSGlhUlZKUTZPREtyMHJSOXBp?=
 =?utf-8?B?dzVOT1pBaU95ZjAzMzFJb1JCNjBvWDhENVhCeFlNNi9IYWM4dDRpVjg1Zlov?=
 =?utf-8?B?cDRNUnBNNWVsK3VrdllJa1lZeDJzOGI5VWFjSm51WlVycm9wcEx1UGhPTFlV?=
 =?utf-8?B?MlR6VzhaZXBoUjNCZHpBWUtQNEtILzhoMEliRWdqSVNZR294ZVl3YkRBUDY0?=
 =?utf-8?B?YTd4RHptVkJVaFJ5UytkUHB3bi9Gd3FmM1FnelFsUkYzVzR3alNRSEwxYU96?=
 =?utf-8?B?Mk9adzBDUUdxUEhxRFFzYnlEOHBzcGkvY0g4dWRwbXFsRThYVnYyNmJ5WHor?=
 =?utf-8?B?RHR5eEtDeEd4RGozSXBLZVUzODBzZlBpb0prSFM0R3NMaFZ1N1ZPSDNReG1Z?=
 =?utf-8?B?WnJpTWVreFo4TFlhaXEwSlhiZ0VuRWs3NkRIY3dLbFlBcnJOS25USi9OTUhk?=
 =?utf-8?B?U1FkWE9CcGdrWFh4YW5uODNGRkNuTjlZUXNDcjkxY0szZld3Qkc5V2NaUFNy?=
 =?utf-8?B?YmNDTHd3TmF3K2dTa3lhS0pRRzhQenZLdzNXUGw4cFF1bTB1U1VWZHFyZDVp?=
 =?utf-8?B?dlFXN3JWRWZKcTQrOWJqZlN1MDVVUUxHaUllSXozYjhGWmxkRy9TeGVUVHhu?=
 =?utf-8?B?Z0QraFhlQy90MjczZXlsdExPaU94SXdaNDZKRlZvMk5IZXBVWVZCdEU4b3E1?=
 =?utf-8?B?a3U4dUtUL1c1WjlIOW5Zbmd4RFlRdTJXN1FXbEZmMVhOOFVYUWx0am9MVFdL?=
 =?utf-8?B?bjVpb3JQaGloQ2VRK1ZieWxPcWZpYVVYVURGVUJTTGhWaUUwN0xHbjFsN3Q2?=
 =?utf-8?B?RTE2bkdlbWhrNlo2aXpRbWVjWTJBcGpaOVM4aG1xdmgwRWsyQ0JxeHVLVk1x?=
 =?utf-8?B?UjBsSGMvMnBwVGh4eVYxRjV0Z2FTMmQwa0ZwcUpPQmM4aFU1eWNUMUNBSDFi?=
 =?utf-8?B?djY2cEV6b21Ickw3UFlHVmNCOU8vUForb2hBMWEya0dtbDVna2RuOXRrL0pQ?=
 =?utf-8?B?c0E5U293TTlPUDlUeXpYZnJUcTdRT1Y0ZEJVMG1kNEVPOVUrR0VnWHJOVEc4?=
 =?utf-8?B?SkgwN2xkSk5aVDRQY0lEU29EU0Fqc25NUWdvNE1zTWo4blNYeU91QVcyS3hy?=
 =?utf-8?B?OGM3R2V6RWpIa3hnZWMrWEszSVpzaGp2a1dFWWEzWkljTkpJc00zdjdUdXpa?=
 =?utf-8?B?S3dXR0ZYR2hBVWowUnd2ZU1RQmQxczNjUnZaaUFSaUV2ekdBUjZ0T0V0bm1P?=
 =?utf-8?B?WDhOSklhMGhsemhkbGJ1aTM3OHowMXk3UzJNK0pPTXgwSFkzTkx2TXR0dXhK?=
 =?utf-8?B?eHJBTUI2cXFENHY3Vk5NYmNDV243SWxETDI2QytJQldkMmlQUjVhVFBUNUkx?=
 =?utf-8?B?dXZ6R0tTSDRadWdwc2h4MFJWQmordkN1MGI0UjVTay8yczliWHRyK0cxMEZl?=
 =?utf-8?B?ckZsWnVwbGFaWEtIQ0h2U00rODVRSkQvUGoyZEhDWmdrdXJQS203Wmk4cExp?=
 =?utf-8?B?ZE1MNlRlVGpwczNMSXd1ZXpYS0IzS2hDWlF3OHdYNmltT0F4Z3dJaWgyalVJ?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22289496E425BD489014B459869C5357@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15478111-be30-4f49-106c-08dddefaf4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 08:32:38.8690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8sN/QtNRXSeMmMZ6EB1mtXH+2NBCzuy6GKYHU8R3vMzkGho3YDFHXO4W9OEq8rmEI/Kjn/sTSfT5KW8yx1FpjA1MCLcjOUsxXTOxBrM6Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8028

T24gVHVlLCAyMDI1LTA4LTE5IGF0IDEwOjE2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE5LzA4LzIwMjUgMDk6NTQsIFNodW54aSBaaGFuZyAo
56ug6aG65ZacKSB3cm90ZToNCj4gPiA+ID4gICNkZWZpbmUgUlRDX0JCUFUgICAgICAgICAgICAg
ICAweDAwMDANCj4gPiA+ID4gKyNkZWZpbmUgUlRDX0JCUFVfUFdSRU4gICAgICAgICBCSVQoMCkN
Cj4gPiA+ID4gKyNkZWZpbmUgUlRDX0JCUFVfQ0xSICAgICAgICAgICBCSVQoMSkNCj4gPiA+ID4g
KyNkZWZpbmUgUlRDX0JCUFVfUkVTRVRfQUwgICAgICBCSVQoMykNCj4gPiA+ID4gICNkZWZpbmUg
UlRDX0JCUFVfQ0JVU1kgICAgICAgICBCSVQoNikNCj4gPiA+ID4gLSNkZWZpbmUgUlRDX0JCUFVf
S0VZICAgICAgICAgICAgKDB4NDMgPDwgOCkNCj4gPiA+ID4gKyNkZWZpbmUgUlRDX0JCUFVfS0VZ
ICAgICAgICAgICAoMHg0MyA8PCA4KQ0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFdoeT8NCj4gPiA+
IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEJlc3QgcmVnYXJkcywNCj4gPiA+IEtyenlzenRvZg0K
PiA+IA0KPiA+IERlYXIgc2lyLA0KPiA+IFRoZSBNVDYzOTcgaXMgYW4gaW50ZWdyYXRpb24gb2Yg
c2V2ZXJhbCBJQ3MgYW5kIGRvZXMgbm90IGhhdmUgYQ0KPiA+IHNlcGFyYXRlIElDIHNwZWNpZmlj
YXRpb24uIEkgd2lsbCBjaGVjayB0aGUgcmVsZXZhbnQgSUMgZGF0YXNoZWV0cw0KPiA+IGFnYWlu
LiBJIHdpbGwgcmVtb3ZlIHRoZSB1c2VsZXNzIGRlZmluZSBpbiBuZXh0IHZlcnNpb24uDQo+IA0K
PiANCj4gSSB1bmRlcnN0YW5kIG5vdGhpbmcgZnJvbSB0aGlzIHJlcGx5LiBJIGRvIG5vdCBzZWUg
aXQgcmVsYXRlZCB0byBteQ0KPiBxdWVzdGlvbnMgYXQgYWxsLiBEbyB5b3Ugd2FudCB0byBzYXkg
dGhhdCB5b3UgY2hhbmdlIGluZGVudGF0aW9uLA0KPiBiZWNhdXNlIE1UNjM5NyBpcyBpbnRlZ3Jh
dGlvbj8gVGhhdCBtYWtlcyBhYnNvbHV0ZWx5IE5PIFNFTlNFIQ0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg0KRGVhciBzaXIsDQogICBJIHdpbGwgc3VibWl0IGEgc2VwYXJhdGUg
cGF0Y2ggZm9yIHRoZSBmb3JtYXQgbW9kaWZpY2F0aW9uLiBUaGUNCnJlcGx5IHRvIHRoZSBwcmV2
aW91cyBlbWFpbCB3YXMgbm90IGFib3V0IHRoaXMgZm9ybWF0IGlzc3VlLiBJIGFtIHZlcnkNCnNv
cnJ5IGZvciBjYXVzaW5nIHlvdXIgbWlzdW5kZXJzdGFuZGluZy4NCg0KQmVzdCBSZWdhcmRzDQpT
aHVueGkgWmhhbmcNCg==

