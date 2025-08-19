Return-Path: <linux-rtc+bounces-4709-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37BB2BB22
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 09:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC159188589E
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341182F9C3E;
	Tue, 19 Aug 2025 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JfT6e/3T";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UKhhfWfw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81C3451DB;
	Tue, 19 Aug 2025 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590026; cv=fail; b=deiFOjEa2iHMGQXzsev287kF5y23IjddbybXHVrKi5VhISnzjL3rKJdkm6n2V9wJtvJSkbt2WFue4yN/QKNwzKFHYQfOGWnA9o5cAgIRdSUeZ/zNUj+468bQMagYdrSgWSwY9I/QryMTN1fWCSK8mOqucRNGVxBNo5QHFz5RrKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590026; c=relaxed/simple;
	bh=uPyxvW0XadFzYq5jHAfCGjztFQqGxGIp+0v2b+6l35M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=chZSLI5t20xkmEt/dH24Rdrq3kdrRikCLbG/fRB9+Of3wVXAKEfvDs/KUVSZpsryoGqTWK1oq2t+J/Y9+aGax5aMkRpquo58p/SlN+RSP9epH17XUVwJLSt3RpeghlPKwPliP6VBfr4S8n0Tvp/sQz8OfjJkztMk1Ff+GvtfPU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JfT6e/3T; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UKhhfWfw; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9da569727cd111f0b33aeb1e7f16c2b6-20250819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=uPyxvW0XadFzYq5jHAfCGjztFQqGxGIp+0v2b+6l35M=;
	b=JfT6e/3Tgnc19gn7AOe+34eUI4UC69XHcLJ1ImKNWdn/vyjpJDQLMkcVG7n3i5lYRmM7SvchbGiLUGNl/TlxFhVYJK0O9cjCxxwM5wuU16GbEswHqB95BC/eLKzyu4VbjqAVG65wdBLzQTTWuxD3gKS3RK6T4qinxezJCpMod4Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:3e09be90-d3bd-4ad5-bc76-e5c01265b4ab,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:dee914f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9da569727cd111f0b33aeb1e7f16c2b6-20250819
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 505294663; Tue, 19 Aug 2025 15:53:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 15:53:37 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 15:53:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjT/t9DbqFGqdLPm17KL1zP0Orn33wR1c5Of3P806QBl11S1KiSF9gHcoE6ShJTAfr6Oow++9+YST3hFrOOOvwjg0IwjyfBV4nvL0NIjZnZKG3Kq+JTU6nlBM2OknwCsyAAJQ+UqST6D9rLkt4oa1/qRdmk6tMCjNuT/PhMjmpbiVtOMIXfBFasPFSMp9MlRPpC9HAyBmNBGk/kMHBFioN6hClLc7psQSv1yIzWzH+BlarS7A9DF55iafQhqq/h91evazD9bW5lxeT+FHEXkWh2RNgPe7t/UUVQwWtdc+cOcNF6oTDq3Bev6H3+DQAGDrPSB7cscyRtm7F08fLR32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPyxvW0XadFzYq5jHAfCGjztFQqGxGIp+0v2b+6l35M=;
 b=mGmhhzoDK+k5N3Y7uyS2KpmNPtZHejPHQZMwREecypTDvZhlR0B/aysjduEnErg3H1g3uBsQNZljaNX/9o9X69H3fGFsIZrYvd3zzdAZJKWl6nPAm9P+6Dsqf/QGaZWQcvPdxl0saO5Bos4F4dhCZm4TdXaDMQGXxiixIAOvmSJCQxKsPlREWYinXog5hGMQ89khk/+2s4czKqGxm6ZpAVUByKjF9xtB93IDvUYt+Jy4EFHZwHGbckY0d/ASOGXNJcJZK8G9QXpCsBxFSuId6knnYXg9bnK6wZPorITrMjq43xNCwcIgueew4oy0R6kElPxbODraExmZRh9gYytzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPyxvW0XadFzYq5jHAfCGjztFQqGxGIp+0v2b+6l35M=;
 b=UKhhfWfwBKm3PIDo/lNcn19XEjfsqXeRXdB7YaBRy0I1VuHmvW2QYuIRMQ+x1W3HTq+Gb+Le4BgWfOdLyIY+XN95N+en0RuKwNorL6VNhj2j1zClQ32qvBY/GigxiHgO65hn12R51nncVRihyfoPt+th4tC9uGY5ShThZ+RhBqw=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by JH0PR03MB8603.apcprd03.prod.outlook.com (2603:1096:990:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 07:53:34 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 07:53:34 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: "giorgitchankvetadze1997@gmail.com" <giorgitchankvetadze1997@gmail.com>,
	"krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>
Subject: Re: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Topic: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Index: AQHcCpgvW6hQmxxYeUeBT2HNIAh14LRdScKAgAAFM4CADFiTgA==
Date: Tue, 19 Aug 2025 07:53:34 +0000
Message-ID: <272b601e803474ad1048f1957142a234f03892af.camel@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
	 <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com>
	 <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
	 <CAE7dp2rxfgj6FKoM-kesX8632t3AA7Lk5rC-uasyQUS2hQuUfQ@mail.gmail.com>
In-Reply-To: <CAE7dp2rxfgj6FKoM-kesX8632t3AA7Lk5rC-uasyQUS2hQuUfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|JH0PR03MB8603:EE_
x-ms-office365-filtering-correlation-id: 836ce0e3-8588-4efe-08cb-08dddef57f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWkrWW1kS0pvdEU4VjE4cmMwL2kyc09JczNKU2dUc2xRS0UyMVoreFJId1BP?=
 =?utf-8?B?SjF0SlNMOENyVkpxMUtvWElIRXljZ0lqc1R6cDNTQjdBTWJGR0RONCtSSWwy?=
 =?utf-8?B?dnNpdnA4M050MGdkZG1WMjNiZUMwTm9TdGdDeHhSdmhvSDVyR1B1RWs1dmNs?=
 =?utf-8?B?azFZeXNQakVDNkxBWFpWenllVmRKVmZnMmtBVE9tWlRLeS9GbWt2WGR1K3Jw?=
 =?utf-8?B?N2VzUWpreDZqVGhJZm5SVFFHbndreVAvMCt3VVJjUVQzcnVDcHU0WWtBaFVG?=
 =?utf-8?B?dzd1d3BOOEZPL3BxVXdzbUhYVXhRQm9tRWJSMlJUdTRySkNLK3lrUlp6MW04?=
 =?utf-8?B?WFkzM1YxdGFSci94Q28zZE84QUY5aFZzRzVlQUQ1UjRmQ2NiL2c3aTVEelpQ?=
 =?utf-8?B?SUcvSFc1N0h0c3hLZWVhUXBTSUw2T2N5dEF6SjB1Rm9ZV2dsVThKcTBGbkcv?=
 =?utf-8?B?WEZBY1gwYmxrRjJrdEJlOGxMWkVKMllocHJOMjAydDlGQWNCa3ZmbUhmWXY5?=
 =?utf-8?B?Zjk3WXFXMGF1WlhDOUwzcEhLQ3VRK0tNU04zSXBXZzlMQlBrRjdvMHZ5eFJP?=
 =?utf-8?B?KzlteDFPZUhSR1J0RzBzOWVZWXI1SHJRRHlERVhheU01N2lTeEFxTS81YVE1?=
 =?utf-8?B?YTFMV21wa3ZlTW5wZlhCcmtKYzJSY1Z0SFhrWENKS0ZVeDdOREFac3NKUy9k?=
 =?utf-8?B?UC95WVRKdkRnR3NhMkVUN05rTnZKWnZjMElRWmZIc29TYnZSdGl5T01kK3Ar?=
 =?utf-8?B?WDBUVExNZDVWczV1bGFNMUJXSDdScW5KQXZ4Kzd2NmFOMWRhU2JZK0dOZ09r?=
 =?utf-8?B?OEdDd2lVTzYzeDVIUURSWnMzbGxxS1p2ZnIreTdUZ3o1bU9MN3JrdExrRitz?=
 =?utf-8?B?d0w5dmpLcWNjWmtxMENDWnU2aU9XdmUrOHA3S29sSXg2aHExclh6ckdOakhU?=
 =?utf-8?B?TW10Z3JPTldsaGtSRGJ1U1FVSm9oWjhMZ283Rmpicm5IRXh6TmhqUE1Qbllv?=
 =?utf-8?B?N1Q4TzMrelZ2SFFId1EyM3dZb1czLzY1c3NRZ0swZFUraDB5dDFGNWZ3U3JX?=
 =?utf-8?B?VDNpVlZ1elc1a1QxN0R6MEduclFsZndYcERVV25KdXIyL214ZG5CVWVhR2lE?=
 =?utf-8?B?Z1BwN1dacWNydU91N2pxU3A3RFhOVWFKOTVWL2NjUFk2MlpRa214Vk4vMDJz?=
 =?utf-8?B?Szk2anIxcTFDOEtEc1FLTE9rZDBhYkhQNDRCb1ZpUG0wMkZ2Nk4xaFplWkFQ?=
 =?utf-8?B?aFhIV1orZ0lXYW4xeWFMWGJpTHhMNHJXN2NmMEJXbEhxWnIwTStoNndlenNZ?=
 =?utf-8?B?TjNvZnd2cXJpK1MrUURvQ1Y5bFptak9DY2xGWUVkbWMxb1dVRE9xREtIL01G?=
 =?utf-8?B?b0d4S1hYY2ZZQU0rNHFsaU90Z3dWWUU1RTZXUmtUTHZQUW14ckRRTnV5NUhU?=
 =?utf-8?B?NEtmZkVnKy9pYVhBOUJMZ04zWnBFYlJwZ3RKNWRXcXRBcERHb0ZQbWVzS3Fz?=
 =?utf-8?B?UTdXZkRKNlNwTFltZlI3d1IzV0lIVFVKcGdTcE5ySVB0bG5rTmJCMmhHYlpB?=
 =?utf-8?B?YW1RVVZNdm1Cb2dwMmpMNllXcnIrYk80dHJQSlZvNWltS0J6WGV6ajlJcXZY?=
 =?utf-8?B?ZmkyTmhRRm9lamlZeGtnMGJTMHVjNXJrNHZLbEtkaUVaZzdYeERnRVUxaGNt?=
 =?utf-8?B?R2IrWWZwdlo4SEtPVXBPanhvNE53Rm9yM0c2TWRlekVlcUxUOHk1amxkMSs0?=
 =?utf-8?B?dlMzYXlhVTFuVWNwOXdZTXU0Yk5kb3B4ZG5ZWDdFTnRCVmx2VHlMaXRPdDgz?=
 =?utf-8?B?WTdKK1h3V3ExclNUeVIyeXFubDQ1bzZhQW1WRXF4bWorUWpmL1dVNlRrVkFj?=
 =?utf-8?B?T3F4eHdZUjlISjdVcklRZHduU0N4bmxkakJEc1JEUGF4VFVUK0FIQXhSYkVE?=
 =?utf-8?B?ckczR0IrQ0VxUjFockRrLzdwTkdpK3pnUFJpdzJjT29WWkZyaW9RVUxVNzBG?=
 =?utf-8?Q?7odDQVE9766+13YD4BPW8imEtT1/bI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amR5Snlkajhqc2EyY2JKNCsvRGdJU3o3VThRSHJzQjV6aUQrUlJKYVl4Nm1T?=
 =?utf-8?B?VXB0MXh4VDNBVnpoZ3BrYkFaZUhXV2p4T0xoMTdrdzkya29jMWEzTFFaL0JS?=
 =?utf-8?B?enhybGdrck1abkJESk44UFRSZTFWSGMyNHhwU1Z5RXc0YU4yaXZObFBrNXVw?=
 =?utf-8?B?Yi9sdXNqWHpuVlp4ZUE3eDJWTU55eDZiSGtqTXBHdnBXeHFHSjZlWjlGNk9q?=
 =?utf-8?B?UXluNUxiamMwbDZ1RUVGTVNSNm5RZUdrUTJxTEh1OWpzSFRZRjY4bDVoREdG?=
 =?utf-8?B?Njh0R3N3a1V1QlEvVDNWZ2FyZ2R2eU1QalJNTnVFNTNzVFZoMFpqNHA4cmN3?=
 =?utf-8?B?VVpjUnVCVkRVR1RPYXNRM1NQUjBNTlhtb01HSW8yVDlzd0tUTVdTY2lPWmNQ?=
 =?utf-8?B?NTc5dTVvUkk5MS90bmlENS9lR3BBZzUwanlLelFWMXJsTXBJeit6bEV3QkhZ?=
 =?utf-8?B?NkxnZUtnT0VZalU4d0I4Q3RqUmwxajN1LzdHa3NjeG5NOWV3Vmc2R1R4YW14?=
 =?utf-8?B?cHphUksyeVZFSk91ekhBMHRCaEUrQ3Z6OGhvMmoxQnhScjUwMHJybkxHUHR1?=
 =?utf-8?B?eVNSbExMWm9GY3ZteXVGWWdEaytjYlpyd0JNMUI2Q0pIMlRremprZ09sN3J5?=
 =?utf-8?B?SkVVQWRYcEJHUXZBOHZSMzlFUVkwMUxpQ25FMXp4ZDl0WWR1TENwUWovU0Fn?=
 =?utf-8?B?OUY3NUpKMGR1Zm5XUWlhalNSODllb2pRVkJpR0hVRVhCNlZiS1hDOGMycno1?=
 =?utf-8?B?RVM3ZWlCcklrV3BENFNnMDBIcmFORitLckVIQnQ5YjJaanFBNXYyRnJRK1Vm?=
 =?utf-8?B?eUo0REdxQ0ZyWUhuVkZ6aE1WVm1WL3lwa3JJWlArSmR1YWhsbjR5UEc2NlM0?=
 =?utf-8?B?T1JRZEdndGl0YkVHVTdKQk1zdHh4d0FDU2E3LzBnVGlDSzVYc0p5ZlptM3FN?=
 =?utf-8?B?UnR3Q3dEUXNOS3UzWWNUb1FhUnBKcGw1K3hZejhZWW1LZUI5NDRWaWU4TDlW?=
 =?utf-8?B?anl5MVd0SzhBeDd6Y09KcHE3VTBWZWIzMldzaEVzYUlFc1doejVzVytVY2E3?=
 =?utf-8?B?cUN4bkpkWDFRWDRMOEpuNTl4aGtIWG1uN0E2RnFSWjIzQXB4bjM4VnJSY0ox?=
 =?utf-8?B?Kzd1aVdwVThWeG5ISTJoSmx2SHBQSnlkekxDUlQ4WmFBb3Z0bW81ZVpBMDEx?=
 =?utf-8?B?aGpxTjZXT3BqOHdDcFBJYnR6d1VFVFZJRnRXd1kzM0dsZGVYQmVaVjBLVFNM?=
 =?utf-8?B?b0lWMUpRL3dYbFl5SFJjY0VualdPWFFRZTlrL3NsdTJVUkI2SnNFaGdWSHVl?=
 =?utf-8?B?b0JvV3dZVDJFRkR1VElUWWFVSkpXY2ZFcVl2ZnJ3UW14azJ1NFdNL1h5WERm?=
 =?utf-8?B?VmJGczBkZGcyZlNUMDdZeVVNMEt4L2FNL2xHWnB5b1pMVjU3Z2J1bHBCcVNJ?=
 =?utf-8?B?dDQ0Zjh4VU1WbzkxRFJZbDV0ZnR2ZFBzTzNmVndjQUpNT1NRZ2orNjFJcFhP?=
 =?utf-8?B?U0ZielVCMWY1SEhtUERjRi9GTjBSRXhKaHNjQXczMEZXeGJTemIwNURYR1NH?=
 =?utf-8?B?a0VwVDJua3A3VkN0ZUVZMjJFQkZJOVdWTjlpQjhtN1BMWEV5K0NmYkdKQVNK?=
 =?utf-8?B?cjUzOVd5bm9NTjV5ZlhqVmh0NHllV1ZhNFlvSUwwVUFVKzBiVTZHaDRlUU1H?=
 =?utf-8?B?YnBudEkwaWx2YUJFZUluRi9SMDBST0x4c21QQUJCMU1mRG0vMHd6alVrM0dl?=
 =?utf-8?B?VUxmOG1sVzhGS1RvR245WDFXdkc3U1g0NTVVTVNqZUhISHR5NTZtZjFMMytZ?=
 =?utf-8?B?d3haV1BjM2NUTHVCK1NuSjBzU09oRnFybWJjWStZR0xJcXpBL0ZTbnJrbWFx?=
 =?utf-8?B?STlFa3ZtRzBiM0kwRHJEYTlGVDdWT3dzYTR0YjZiT0ZZbC9yMkJNWTlnN0hW?=
 =?utf-8?B?cXNGMlcvd2djMmVjK2tPZS9VajdGSkxMVU10MjlFN3hGYllmWmMrblRLSHc0?=
 =?utf-8?B?WGtCNDdQYXFPUHg3dHYvZkxKRTNSVDRPR1Nyd21iK3p3Z0NYTnJDbFdFc21u?=
 =?utf-8?B?czR4dXYyMUtVUVZYcFV0cWJadWJna1U3cmwvdEt5NTZpY2xJRGJya3l4enh4?=
 =?utf-8?B?VGVSdi9lRnJpY1BVQmtQdHBsOCtBRmlkRlBQUDQvb3BBUm5McWl3QjhCRkxa?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <163C51F0A08EA44CB03445259BB0D26E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836ce0e3-8588-4efe-08cb-08dddef57f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 07:53:34.4680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJadvJQ8ufqVlJIUlpfvzXjHQEgUEqRtTuYu3TDt5+EAZTajuIeI9t90LFC3qvLRNiChfBvP3FBhcB4Ek+qQaayyglzI7OPZpLDAAsSgV0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8603

T24gTW9uLCAyMDI1LTA4LTExIGF0IDE1OjIxICswNDAwLCBHaW9yZ2kgVGNoYW5rdmV0YWR6ZSB3
cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPiwNCj4gICAgIGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcsDQo+ICAg
ICBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnLA0KPiAgICAgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiANCj4gU2h1bnhpLA0KPiANCj4gQ2FuIHlvdSBjb25maXJtIHdoZXRoZXIgYFJU
Q19CQlBVX1BXUkVOYCAoYml0IDApLA0KPiBgUlRDX0JCUFVfQ0xSYCAoYml0IDEpIGFuZCBgUlRD
X0JCUFVfUkVTRVRfQUxgIChiaXQgMykgYXJlIGRvY3VtZW50ZWQNCj4gaW4gdGhlIE1UNjM5NyBk
YXRhc2hlZXQgKHBsZWFzZSBjaXRlIHNlY3Rpb24vcGFnZSk/IFRoZXkgbG9vayBsaWtlDQo+IHN0
YW5kYXJkIFJUQyBjb250cm9scyAocG93ZXIgZW5hYmxlLCBjbGVhci9yZXNldCwgYWxhcm0gcmVz
ZXQpIGFuZA0KPiBtaWdodCBiZSB1c2VmdWwgdG8gaW5jbHVkZSwgYnV0IEkgYWdyZWUgd2l0aCBL
cnp5c3p0b2YgdGhhdCBhZGRpbmcNCj4gZGVmaW5pdGlvbnMgd2l0aCBubyB1c2VycyBjYW4gYWNj
dW11bGF0ZSB0ZWNobmljYWwgZGVidC4NCj4gDQo+IFN1Z2dlc3Rpb246IGVpdGhlcg0KPiAtIGFk
ZCB0aGUgZGVmaW5pdGlvbnMgd2hlbiBhIGRyaXZlciBhY3R1YWxseSBuZWVkcyB0aGVtLCBvcg0K
PiAtIGtlZXAgdGhlbSBub3cgYnV0IGFkZCBhIHNob3J0IHJhdGlvbmFsZSBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UNCj4gICAoZGF0YXNoZWV0IHJlZmVyZW5jZSArIGludGVuZGVkIHVzZSkgc28gZnV0
dXJlIHJldmlld2VycyB1bmRlcnN0YW5kDQo+ICAgd2h5IHRoZXkgZXhpc3QuDQo+IA0KPiBBbHNv
OiBwbGVhc2Ugc3BsaXQgY29zbWV0aWMgd2hpdGVzcGFjZSBmaXhlcyAoUlRDX0JCUFVfS0VZKSBp
bnRvIGENCj4gc2VwYXJhdGUgcGF0Y2ggdG8gbWFrZSByZXZpZXcvbWVyZ2UgZWFzaWVyLg0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2g7IEnigJltIGZvbGxvd2luZyB0aGUgdGhyZWFkLg0KPiAN
Cj4g4oCUIEdpb3JnaQ0KDQpEZWFyIHNpciwNClRoZSBNVDYzOTcgaXMgYW4gaW50ZWdyYXRpb24g
b2Ygc2V2ZXJhbCBJQ3MgYW5kIGRvZXMgbm90IGhhdmUgYQ0Kc2VwYXJhdGUgSUMgc3BlY2lmaWNh
dGlvbi4gSSB3aWxsIGNoZWNrIHRoZSByZWxldmFudCBJQyBkYXRhc2hlZXRzDQphZ2Fpbi4gSSB3
aWxsIHJlbW92ZSB0aGUgdXNlbGVzcyBkZWZpbmUgaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3Mg
Zm9yIHlvdXIgY29tbW5ldHMuDQoNCkJlc3QgcmVnYXJkcw0KU2h1bnhpIFpoYW5ndXMNCj4gDQo+
IA0KPiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAzOjAz4oCvUE0gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiAxMS8wOC8yMDI1IDEw
OjE1LCBvdF9zaHVueGkuemhhbmdAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiA+ID4gRnJvbTogU2h1
bnhpIFpoYW5nIDxvdF9zaHVueGkuemhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gDQo+ID4gPiBU
aGlzIHBhdGNoIGFkZHMgbmV3IGJpdCBkZWZpbml0aW9ucyBmb3IgdGhlIFJUQ19CQlBVIHJlZ2lz
dGVyIGluDQo+ID4gPiB0aGUNCj4gPiANCj4gPiBXaHk/IFRoZXJlIGlzIG5vIHVzZXIgb2YgdGhl
c2UuIERvbid0IGFkZCB1c2VsZXNzIGRlZmluZXMuDQo+ID4gDQo+ID4gPiBtdDYzOTcgUlRDIGhl
YWRlciBmaWxlLiBUaGUgZm9sbG93aW5nIGJpdCBkZWZpbml0aW9ucyBhcmUNCj4gPiA+IGludHJv
ZHVjZWQ6DQo+ID4gDQo+ID4gSG0/DQo+ID4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFNodW54aSBaaGFuZyA8b3Rfc2h1bnhpLnpoYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0K
PiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCB8IDUgKysrKy0NCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4g
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgNCj4gPiA+IGIv
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+ID4gPiBpbmRleCAyNzg4M2FmNDRmODcu
LjAwMWNlZjZiNzMwMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5
Ny9ydGMuaA0KPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+ID4g
PiBAQCAtMTUsOCArMTUsMTEgQEANCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcnRjLmg+DQo+ID4g
PiANCj4gPiA+ICAjZGVmaW5lIFJUQ19CQlBVICAgICAgICAgICAgICAgMHgwMDAwDQo+ID4gPiAr
I2RlZmluZSBSVENfQkJQVV9QV1JFTiAgICAgICAgIEJJVCgwKQ0KPiA+ID4gKyNkZWZpbmUgUlRD
X0JCUFVfQ0xSICAgICAgICAgICBCSVQoMSkNCj4gPiA+ICsjZGVmaW5lIFJUQ19CQlBVX1JFU0VU
X0FMICAgICAgQklUKDMpDQo+ID4gPiAgI2RlZmluZSBSVENfQkJQVV9DQlVTWSAgICAgICAgIEJJ
VCg2KQ0KPiA+ID4gLSNkZWZpbmUgUlRDX0JCUFVfS0VZICAgICAgICAgICAgKDB4NDMgPDwgOCkN
Cj4gPiA+ICsjZGVmaW5lIFJUQ19CQlBVX0tFWSAgICAgICAgICAgKDB4NDMgPDwgOCkNCj4gPiAN
Cj4gPiANCj4gPiBXaHk/DQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+
IEtyenlzenRvZg0KPiA+IA0K

