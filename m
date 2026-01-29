Return-Path: <linux-rtc+bounces-5911-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD75LAsqe2kKCAIAu9opvQ
	(envelope-from <linux-rtc+bounces-5911-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 10:36:11 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F279AE30A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 10:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27A7530038E2
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F56374192;
	Thu, 29 Jan 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uTS099ij"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB72C08C8;
	Thu, 29 Jan 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679368; cv=fail; b=qtZpYocv+v1sGeIyDvqCJ9dznCXoOTE9Etz/PlJxP3DSHHQEY5FVUlmxlOKOEQNhFdbS8c1qoctLhZYhfKtG+IHQ8xrtGzb+1IRtR+tBsjsvI0o7KjLtR6uAZ8Nrvcf7H332RtYvvwzSyoM6r27BeV7+dJlSDF50s0lKEvF42e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679368; c=relaxed/simple;
	bh=+A6HkfqIAygZ7GkZXMhyzq2hAOHi/Z3pqBhUACuP5qg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Popu/1UGZ0Y3+C6gp8GX/a1sACHABhXIXiECzIJcPMXIjugMuXvhHrEyoCBAmd+sLpn6cbvLmCkVlqxkti1r3jPC5l7dBG2bcKKg8Gpr0hH6VDiS/NI/qJcJG34JpMlZgpURTBqb4P9MS+Rb4mi+o9xc5ciWa9LM1up2+bKJ/n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uTS099ij; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1vdcYihlhDBjSyAj3UONWWDqUrAZIMTjt8RT24Ubyt323iTaOtjW17AvmJ0Ub4O7MSPcsPPT4jFak/PH1Icr8awfYxxvN9MovSmI1CQ2tXWRhIB/NqXfLj+hY9eKSjEAedb3NMCE3VWQBhfmKnsDCMgyX7RpyDTqwEFVm5ht1sr68bXT5sn5tWkezxGrggkQPYX1Vk/i6pLg2CpdJnZNFToicr7jv1pQ/Hn2c9Lu5evI7HJzT0LK25/pEBIdC9BTV21o78IJdpF8QlU0L5y9QktN6oHHOznykbRbN7gu3xga+oED1WLLIW6IAtXhBbjMPH8QNdoyF+jC0FnaKfQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A6HkfqIAygZ7GkZXMhyzq2hAOHi/Z3pqBhUACuP5qg=;
 b=DpO1mrvPNaEFxg7rbz5Yrkhzj2G++vnWSEsyVGNmEWMb+i70MNxk2mOrMeVCJhsoqZYxedq+b7J2ETGob9joVjxy/YusERF6XKVdeCXTMc8F+2vYC8rwl6dGBmKHYoYA7UHMmRMEhYhiAiwSj58qldS3neWyTMxAIQessElhtZYJz4daMSVhWtibPfn2QI8CmlKOSXixi2AJMUV9Rspdj9I+4z5jjWyzjBjZRsJlaXDD6T2gX6ewqit/IsnE2yiReawWmJaAoPzgw7OPLsP9KgvkKzQfY0vj1Cks6Te2+lxLZx2aUFzxznb+6KAoxcAV5mU4L+Rp4QS1Oc3Me1G/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A6HkfqIAygZ7GkZXMhyzq2hAOHi/Z3pqBhUACuP5qg=;
 b=uTS099ijWQktr2p0EkWJQ7XmN1PiNvqwGFfEWetTvCml7cHDPyvfxmwN69b+A6FkcQvbQb0gHxkp4DmIMC+g2j7JXHDl5pAoDHlhLFx+zr8nRvvKcR/7RLlCWCUxJfz3aNvm+ujA+zGW89ZIA1PvcWFwVwkvREgKBJkrZ/4HTzo=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 09:36:03 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 09:36:03 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/5] rtc: zynqmp: fixes for read and set offset
Thread-Topic: [PATCH v4 0/5] rtc: zynqmp: fixes for read and set offset
Thread-Index: AQHci6aQlOBMgcPgeUWnD20mAe695bVo7YQg
Date: Thu, 29 Jan 2026 09:36:03 +0000
Message-ID:
 <LV5PR12MB9804E7CDD35DB603D674B7B7929EA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-29T09:34:29.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|CH2PR12MB4072:EE_
x-ms-office365-filtering-correlation-id: 52958448-ce28-415b-96cc-08de5f19d1f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MXBuNmpvUHFZM2NOeGFHZ3NtaXpUa3hERFQ0S21weDBUQ3VPdkJ5cnlURk9H?=
 =?utf-8?B?dVlXaG5OMmVST0dsWGtKeWxaQjE4T0tXM0JhZFI1NWt0cDc0bEp6ZVZDSmFW?=
 =?utf-8?B?Ym5CSmlITWNrZzBjNUpUNE84SXdtWHkyNndhTWRDZ3h0Z2sxVGpBaXNZNi9j?=
 =?utf-8?B?UlFkeHA0ZEhzcThkOUNlS25yNld4M1FpWGdyYTdHc2grWVN1Z0ZDNmljSE5J?=
 =?utf-8?B?WVpDT2pBeUNzTTA0RjBUek9Va2NFWHBrZEtnekM5UVd1ZkZKOWZ2UjllUmdl?=
 =?utf-8?B?TzZLVm1ZbGFLZ243SnNIcDUxNDg1YWJMWHNrL2taU1pqS0RocHpZOXhoUzhD?=
 =?utf-8?B?Q0taSmV0RTlWdUNJMDJXdXQwaGFIUUlLYzZFbjdjeHJCU3V0T0QyMTIxT3E4?=
 =?utf-8?B?a2NGSmlXdEpxdURZR2RGV3FaNlN5VUV2WXdVd2l1K3lDUldDdVlRR1dTYTVa?=
 =?utf-8?B?V3dESlpia3dpMUE3a1VRTW8zaFdtbWNTdmFqcGQvWVVsQlkrWG5ZcHRERzNC?=
 =?utf-8?B?TDV3NUZGTVNreExxMDdyb0t3Ry9WS05zaGxhS1Z1dFg0WHFWcUFPWVZiNEpC?=
 =?utf-8?B?MkliYU5ZdnJmMStuZEJocWJ3aXhid1NoT3owUUM0Q1ZhVTJKMm5FWkcrTjlr?=
 =?utf-8?B?dWs0RGxBR2tDTVpWVFcxd1JMMEc1cDVwY1RPemV1ZGM0d1VqbVZ2cGRrNVpv?=
 =?utf-8?B?U1piaXl1RmhjZmZ2MHRBYkFqeE03SXFqLzNxNDkxeFh1TU9KWGJyZXdkaStp?=
 =?utf-8?B?TjgzVkJPQjRuQUwyUzdoUkVMUzhVNUNiTG5iZ0ZCT1RKdEpyTHNnbVBvVHQ0?=
 =?utf-8?B?Y29STXlza2NCeGpSeGVqeVZjVGJyRHRBdU96UTY2MytqT2NzWHBXOEh3ZG9J?=
 =?utf-8?B?a1hHOU9rcnJUZVpJcHR3bjkxcS94aEF1TmNKK2JVY0luaFJoZGltQTY5cE1m?=
 =?utf-8?B?bGFMV1NzNW9qU2hPL2NUOXZ2MkJ5bGcxZkgvNHMxbTBVUGQ1TnRDZ2czN2lC?=
 =?utf-8?B?SlFVTGtBSWFhb3RIL1dTc1N1aEVURzVGbDYvMm5rK2lWNGFkTmVSVlJpOStp?=
 =?utf-8?B?VjlsaDNGYjhqNldUYWNhYTdodFN2dGhyU1FEOU1UUjRxNjFpZldSUHVSSE9n?=
 =?utf-8?B?K0Fxdnh6b2NLSWc4c1ZKQkcwbjdPRUY1NXUzclZzd29yeTY4cUJ1TjJ1Wkhq?=
 =?utf-8?B?RzhKUTJYT1ppUklsS0JQREJTMG9XZ293MkNKV0RHZGJwNnp5bXJ0dkVYVHdx?=
 =?utf-8?B?UHV4Q3dTV3V0SS95MVk1RWZLQ01sa1ZvbHk3OC9TWXpMYVlXSEgrb2RKbUd5?=
 =?utf-8?B?OVQxS205ZWJuTXgrYlBRcTAzYUdGbVUrZ2tob2xtM3RTZUp6YUpXM2ltN0ZX?=
 =?utf-8?B?K0xqelBuVncvN2ZaMUV2VWdZdVFRWnYxWG5Rd3hnR0FGc3pBSko5TURjency?=
 =?utf-8?B?S0NTbWs2UGJJcVNRa0dRMUZWOWlOVXNuZXdHcWFsSklqZU50NE0vSnRHRkEv?=
 =?utf-8?B?bUxLVWdYbjQwanZSOVBWUWhYSjBlbjFRMUlzMXU2Q3E0TWtnN3dJU1pBOGt6?=
 =?utf-8?B?YlJ6K1d6cEdkMk5qWnF3U1g5TnJ1L1MyS25wZUlQY0VJak5CR2RTSllKaHV6?=
 =?utf-8?B?aXR2RUJCejkvQzVwZU9QeGRJakszY0NVM3FBWlo4cS9xQ0QrV0k2OGEyVHRo?=
 =?utf-8?B?aVB3alNuRSs5TWtCZVVzU2RqZi9lZFJhb21aMS84ZnRBWEFIN1lrVjZsS3ps?=
 =?utf-8?B?bmhDMWF4R0YwUTY1anFLaW1rRjVSam9KeHRzc2VYeEJWMkxnT28yY016Vk1l?=
 =?utf-8?B?ZG9xZHE0NllhVW1RaWthYlZBQW1Uc2MybjE0STFPRVFXWHh0ZjFFMTJmRjEy?=
 =?utf-8?B?SUJlRVhaWU1CUDNGWVlIM2IyQlNmeHVSRUZkeU5zU0F2MTlJb1FFT2kyeHlP?=
 =?utf-8?B?TzVkWTNFb3I0d1FDN1RvSWFFdlBUWS9CYmt2TW82cWRFZ3ZBRUJLeHpZR3A4?=
 =?utf-8?B?OWdEY1g3THZtcnJlS3drMzNlOVRMMjdMRDI5QitLa0ZDL3MzYmVpeGJMclFm?=
 =?utf-8?B?akVVZ0NkcE8rcmF2NERuZ2tIRGdobmlIeWFFdEFyZmlLWU1CNG9tVlQ5MzNi?=
 =?utf-8?B?TDRLTlFrSEkrWk1rSCtTVEVYQWVNVm5sTHNDYzVDNlV1NEZoY3JNbjBpdzZz?=
 =?utf-8?Q?UOinZIMjAUos8AllvdPJbwoIcua9JE8d9RXdNglxnX0z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0lYekEyemlRZWZoK3lNV2VUODkvbEY2a0ZQRjFBajl0RzBLZldFODFGaE9W?=
 =?utf-8?B?RkliWHprblF2WjVFSzdOTWxOWlVaQ3lzeU1nUWlsQlk5K2xKVWxTQUxTYnZr?=
 =?utf-8?B?NG9uT3V6aEc1SHYwVVMyT2o2cXZUNlVCcjNaTzJlY2Y5bUFHNFhlOEV2bENv?=
 =?utf-8?B?VnFOc294cStrbWpVVEc0dyswYUF2VlZ5bERjd1l6a3VvSGJwOUdneDg0QVVO?=
 =?utf-8?B?U2grYll5YTNxeU50V2wvS29Yd3lLQS8yZGJjSFdMcHowMVZpbzJrTDZ5Zk04?=
 =?utf-8?B?WFNhekJ1U2Q4RndwaisrY01NUW1LM3YyODJqVG1KTWo4WExxL3luYTVhL1Vi?=
 =?utf-8?B?Lyt0a0g5UTVLcmhaVU9sa3hpQ2wveEhTYzhIQUYremw4eVVOUG5ZcnBOYjdz?=
 =?utf-8?B?VXVGS0hFa1pnTUJydU1rY1dLbGtpcS90alkyQWJhRmt6dzd4RXR1cWJ6bkJ6?=
 =?utf-8?B?cnZHTHhqVUpsMHRlak1RNEtoWHhLNW0rV0V5L21kdHh5U3ZNd21ESENLakJH?=
 =?utf-8?B?ZnkwVlh2ZENZdkdackhtbWlyUmVXMkNFemJYNWhWOWIrVnlyMFFkUGdjQXVW?=
 =?utf-8?B?Vi9mc3hId1ZoUkhQVUlxNHEzRHFJWXptQ3VJb2MyS3RYVUdIUG83ZGpCd3k3?=
 =?utf-8?B?MmtuOFN1YlZPSjVoaHhudzhsZmk2aEUzVEN5S3I5N0w3ZmtGVnQyak5MNktD?=
 =?utf-8?B?WDdncmJRYnVZejZ3MHdwMjVicWFhTzBQd0ZNcmhGRERUeStqbTA2MFFMRk1L?=
 =?utf-8?B?dVZWeElqaEFRaG1OVStiMWQ4UUdROWpKcDdaMTMrSlhUdnRSZ0lpejQ1Y2k2?=
 =?utf-8?B?M09wMFBjN2N3L0E0M0xrTERJWUlXZ0d0NGp0RFNMMWxrK1FxeVo3TitnUG5l?=
 =?utf-8?B?ZkJOYmxnYm82cHFuaDZ1bmhadmVHVGgwNXV3NXc2QzZZK2RVTHlDQlBXT0FM?=
 =?utf-8?B?cERYc29ZS2VhNjJNcjd3Y0lKbzBmSzl6eXJ0a2dxQXc5UXhteFh5b2docXZq?=
 =?utf-8?B?UTRsLzE0b1pPOGxGSlBsMmFXWXY4NUxpNEpXOHlNVktCSWZKemw0MUxuOHpj?=
 =?utf-8?B?MnNJWDZDNDUrZmhwZ1dqWkl3TnMyWnFYQmVRWkNUU2xNdmhEZnJ3Sk5pSWRw?=
 =?utf-8?B?a1EyNmVuUWZvc3BTTjVvNzlXVkJxTjJjejVvNzVQcW1qeHJUOTZmdDdRV2Va?=
 =?utf-8?B?MmQ3d0VXOHdjRC9CNzRxT2xVYXgyaklHT1VORFE3OHRhQ1lxODJDK1FvVDN0?=
 =?utf-8?B?aWN0OUlEbmRERDI1YUh4WkpKQmZNNXRDekcwcTUwWm9rZ2VZREI3Skl4bk1k?=
 =?utf-8?B?ZEI4ajJtNW9TT3lsaTFsWHlkWWZFbm9ONEFudWFSenF6Q0FVZUV2Z0NoUW5Q?=
 =?utf-8?B?RW9QenlqQVgwMFlxdVJBbUpubG45STgvdERSYkxVSExMZlNMeGFWaS8yNlV3?=
 =?utf-8?B?NDhZR002d2M0THZxVW9uTTZhMDJRblV2SWZUaE1saDdINFNjdVRIdFZJbWFW?=
 =?utf-8?B?Y00wZ25IQ2czUU9IWXlMZUpRYjk4TGFrQ0NZQS91bUlRdEhWOW05ZVQ1dmpa?=
 =?utf-8?B?bWJiWjR1TEpRZjZoU2plUmR5R2xPVHF3WENpbVQwa0FxSkZ5R2hsYnlidXZB?=
 =?utf-8?B?emlyaFVhMWY1eThUMDV2WlBMTk15OUs0WGNZS010Tkc3ZVJoZ09EakhoWXQ3?=
 =?utf-8?B?K2pPcXpQUXVuM0IwLy9qcDRMZWFLeER2RWhNRTNSdzJaU3N2WTIxQ3pkWkI5?=
 =?utf-8?B?WDlxRS9jd3hBckhGYjBmNVFuMFpjN1lwRm4zZURHdnJWbUwwRjNGM2NyZEtX?=
 =?utf-8?B?Skd1ZHFSMUhkZHBTM21SUUFhbm5CL2tJK3ZVKzBkWkowUDdkY3hYcnpDa2ZC?=
 =?utf-8?B?L0NwZzhKMUdzaFNWSy83eWsvK2QrTnZCS1FHeHBKd1lKNWRrT1VoWFVvb3dR?=
 =?utf-8?B?RGdYZ0N5T0ptMlp3cnZmY1JrR0hET056MnVPWDNTeDNrS2d4eTJUakJBVEtM?=
 =?utf-8?B?UTlKeVYzOGUzUkR0dHNoYkNINDduUHhKR3M3ZVZQeUNCTklHYkRSc3I5Umda?=
 =?utf-8?B?Tk5hUlhDTzJ5M0hPSEkzNHUyZHJweWlIbVFMb1ZwTXBkOGtXTmwxd2puU2ZP?=
 =?utf-8?B?QzAzZUpjVnRGNE9vc2duNlhwRUQ0THVSRWdBM1dSK09CTUR0L0lXRXRhbm1F?=
 =?utf-8?B?amNVdHJOQkt3OWl3Q054dGpqN3puY2o2elE4ajc4cTUzak9TYldGdGo2bnZI?=
 =?utf-8?B?TEpOUTdLOFg1SVBwbFN4eEtFR1gwVy9KWlQ5TEp6WjlLZzVKeWUxKzA0MHlT?=
 =?utf-8?Q?Tc4oHKipyiNkPU/idN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52958448-ce28-415b-96cc-08de5f19d1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 09:36:03.4390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6v72WC1qpTlBxVv6xwZvXUX/wUUH8eMSSRtiz/fY2SHwZtaq6WB2+p9apIdqCWAG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5911-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Harini.T@amd.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[LV5PR12MB9804.namprd12.prod.outlook.com:mid,amd.com:email,amd.com:url,amd.com:dkim,infradead.org:email,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F279AE30A
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KVGhlIHBhdGNoIHNlcmllcyBsb29rcyBmaW5lIHRvIG1lLg0KDQpUaGFua3Ms
DQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRvbWFz
IE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEphbnVh
cnkgMjIsIDIwMjYgNzoyNCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFtZC5j
b20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBUb21h
cyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+OyBULCBIYXJpbmkNCj4gPEhhcmluaS5U
QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCAwLzVdIHJ0YzogenlucW1wOiBmaXhlcyBm
b3IgcmVhZCBhbmQgc2V0IG9mZnNldA0KPg0KPiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2lu
YXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Blcg0KPiBjYXV0aW9uIHdoZW4g
b3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+
DQo+IEFkZCBpbXByb3ZlbWVudHMgZm9yIHJlYWQgYW5kIHNldCBvZmZzZXQgZnVuY3Rpb25zLg0K
PiBUaGUgYmFzaWMgZnVuY3Rpb25hbGl0eSBpcyBzdGlsbCB0aGUgc2FtZSwgYnV0IG9mZnNldCBj
b3JyZWN0aW9uIHZhbHVlcyBhcmUgbm93DQo+IHVwZGF0ZWQgdG8gbWF0Y2ggd2l0aCBleHBlY3Rl
ZC4NCj4NCj4gVGhlIFJUQyBjYWxpYnJhdGlvbiB2YWx1ZSBvcGVyYXRlcyB3aXRoIGZ1bGwgdGlj
a3MsIGFuZCBmcmFjdGlvbmFsIHRpY2tzIHdoaWNoDQo+IGFyZSBhIDEvMTYgb2YgYSBmdWxsIHRp
Y2suDQo+IFRoZSAxNiBsb3dlc3QgYml0cyBpbiB0aGUgY2FsaWJyYXRpb24gcmVnaXN0ZXJzIGFy
ZSBmb3IgdGhlIGZ1bGwgdGlja3MgYW5kIHZhbHVlDQo+IG1hdGNoZXMgdGhlIGV4dGVybmFsIG9z
Y2lsbGF0b3IgaW4gSHouIFRocm91Z2ggdGhhdCwgdGhlIG1heGltdW0gYW5kDQo+IG1pbmltdW0g
b2Zmc2V0IHZhbHVlcyBjYW4gYmUgY2FsY3VsYXRlZCBkeW5hbWljYWxseSwgYXMgdGhleSBkZXBl
bmQgb24gdGhlDQo+IGlucHV0IGZyZXF1ZW5jeSB1c2VkLg0KPg0KPiBGb3IgZG9jcyBvbiB0aGUg
Y2FsaWJyYXRpb24gcmVnaXN0ZXIsIHNlZSBodHRwczovL2RvY3MuYW1kLmNvbS9yL2VuLQ0KPiBV
Uy91ZzEwODctenlucS11bHRyYXNjYWxlLXJlZ2lzdGVycy9DQUxJQl9SRUFELVJUQy1SZWdpc3Rl
cg0KPg0KPiBEdWUgdG8gcm91bmRpbmcgZXJyb3JzIChkaWZmZXJlbnQgbnVtYmVyIG9mIGZyYWN0
IHRpY2tzKSwgb2Zmc2V0IHJlYWRiYWNrIHdpbGwNCj4gZGlmZmVyIHNsaWdodGx5IGRlcGVuZGlu
ZyBvbiBpZiB0aGUgb2Zmc2V0IGlzIG5lZ2F0aXZlIG9yIHBvc2l0aXZlLiBUaGlzIGlzDQo+IGhv
d2V2ZXIgd2VsbCBiZWxvdyB0aGUgZ3JhbnVsYXJpdHkgcHJvdmlkZWQgYnkgdGhlIGhhcmR3YXJl
Lg0KPg0KPiBGb3IgZXhhbXBsZQ0KPiAkIGVjaG8gMzQzMzUgPiBvZmZzZXQNCj4gJCBjYXQgb2Zm
c2V0DQo+IDM0MzM1DQo+ICQgZWNobyAtMzQzMzUgPiBvZmZzZXQNCj4gJCBjYXQgb2Zmc2V0DQo+
IC0zNDMyNg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFp
c2FsYS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIERvIG5vdCBsaW1pdCBidWls
ZGluZyB0byB6eW5xbXAgYXJjaCBhcyBidWlsZGluZyBvbiBvdGhlciBwbGF0Zm9ybXMNCj4gICBt
aWdodCBiZSBuZWVkZWQuIEltcGxpZXMgZHJvcHBpbmcgY29tbWl0Lg0KPiAtIE5vIG5lZWQgZm9y
IFJUQ19QUEIgdG8gYmUgNjQgYml0IHZhbHVlLCB1c2UgMzIgYml0IGluc3RlYWQNCj4gLSBMaW5r
IHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTE5LXp5bnFtcC1ydGMtdXBk
YXRlcy12My0wLQ0KPiBhY2Q5MDJmZGVhYjFAdmFpc2FsYS5jb20NCj4NCj4gQ2hhbmdlcyBpbiB2
MzoNCj4gLSBBZGQgY29tbWl0IGZvciBsaW1pdGluZyBidWlsZGluZyBvZiBkcml2ZXIgdG8genlu
cW1wIGFyY2guDQo+IC0gUmVvcmRlciB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgaW4gc2V0X29mZnNl
dA0KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMDgtenlu
cW1wLXJ0Yy11cGRhdGVzLXYyLTAtDQo+IDg2NGMxNjFmYTgzZEB2YWlzYWxhLmNvbQ0KPg0KPiBD
aGFuZ2VzIGluIHYyOg0KPiAtIEFkZCBjb21taXQgaW50cm9kdWNpbmcgY2hlY2sgZm9yIGNhbGli
cmF0aW9uIHZhbHVlIG92ZXJmbG93DQo+IC0gVXBkYXRlIGNvbW1lbnRzDQo+IC0gQWxpZ24gZGF0
YSB0eXBlcyBhY3Jvc3Mgc2V0IGFuZCByZWFkDQo+IC0gUmVuYW1lIGZyYWN0X3RpY2sgYXMgZnJh
Y3RfZGF0YSBjb25mb3JtaW5nIHRvIGRhdGEgc2hlZXQNCj4gLSBGdXJ0aGVyIGltcHJvdmUgb24g
c2V0IG9mZnNldCBjYWxjdWxhdGlvbiBsb2dpYw0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTEyMDEtenlucW1wLXJ0Yy11cGRhdGVzLXYxLTAtDQo+IDMzODc1
YzFlMzg1YkB2YWlzYWxhLmNvbQ0KPg0KPiAtLS0NCj4gVG9tYXMgTWVsaW4gKDUpOg0KPiAgICAg
ICBydGM6IHp5bnFtcDogY29ycmVjdCBmcmVxdWVuY3kgdmFsdWUNCj4gICAgICAgcnRjOiB6eW5x
bXA6IGNoZWNrIGNhbGlicmF0aW9uIG1heCB2YWx1ZQ0KPiAgICAgICBydGM6IHp5bnFtcDogcmV3
b3JrIHJlYWRfb2Zmc2V0DQo+ICAgICAgIHJ0YzogenlucW1wOiByZXdvcmsgc2V0X29mZnNldA0K
PiAgICAgICBydGM6IHp5bnFtcDogdXNlIGR5bmFtaWMgbWF4IGFuZCBtaW4gb2Zmc2V0IHJhbmdl
cw0KPg0KPiAgZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIHwgNzUgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQx
IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGNk
NjM1ZTMzYjAxMTMyODdjOTQwMjFiZTUzZDJhN2M2MWExNjE0ZTkNCj4gY2hhbmdlLWlkOiAyMDI1
MTIwMS16eW5xbXAtcnRjLXVwZGF0ZXMtZDI2MDM2NGNjMDFiDQo+DQo+IEJlc3QgcmVnYXJkcywN
Cj4gLS0NCj4gVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KDQo=

