Return-Path: <linux-rtc+bounces-5754-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7AD1FE64
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86453076777
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5FD39E6C1;
	Wed, 14 Jan 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LnC+rlB6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135F2F4A1B;
	Wed, 14 Jan 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405047; cv=fail; b=CKok9no89B7lNmXEyVXcmbUkdft9dMERt1TTTRhD2kSsbpObj765dnKIDMB1QhohsJGyCuqSp/WxOUXuh5IdDhCkxelLofVanyEQwHEsjI0f3FZbarZGEtXYBPG6/HP6cCcPVhnY2WASVkLsw9TpHHaVq1/b3cdmrYWEXH/yb5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405047; c=relaxed/simple;
	bh=7es+zh2yh9Ldukqx4kHYjIzFmV38k231rFs/QFn4Q48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzHwp8H0WNG0FKhH0fA4o+/Am6/VB4dyEjZk/tFs2Y1mNTZcRSY/k8/eri+wftvIETD7KDFrhdqtbSktJAfNIPB3w5cr9bwymgOdJOE4jy9P8XzFptHhTtoCsejdUN5P9JZbMFmaLNszSMuIcbS3vP4jYKwJkbBjMHu+aloTQQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LnC+rlB6; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7e8xglcBkGVJ9emfDbNthY4O+deXbNnkTgFMFDmr7rZS/aJizpsuMrsIWyo5aRiwYoG6dtnsae89CMi0z0hk8UvKIq9oFE/Fqpi5VW8zhaKCuysst4PMkDd9S6npaj7GV8DiV2ocM658Vi2NBSqoGLW92HUhc99idaFNcsziGEdDVm/fHVt7ia5qXGL6tb5j6NjgTp27LWF64IB8FhDgEIYNoqG6W9+ZeHPOde5rQlHV/F5PRE+AYXuDncWNvSx8XjXCzlfz+8HrLctFH0worIihBm+mqn+myTkcibphzcuEo+G4HVFnwOibF+dmaTsw5pLeYiV84zhIE9UpfiqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7es+zh2yh9Ldukqx4kHYjIzFmV38k231rFs/QFn4Q48=;
 b=yZwSThNkK6fnYuoqSkv7sqQ6maQ69uRlnxDqBte8KGXZAYO8Cb+NV2MzrxbkuZvMum/4X6RY+NrBNdzr2JgLdXmyEyJjpS0OlfsLU80x/WGbYbpcEYvgRcjVIlNTXShiGkuLaCQUBBQbD0BqWsI/XAOktsKF6sDtqYhPHFIMhiLtPV++0iOgx3xrE/hsqjjmj0PzHXXBaU3/khZ0CPv1wtztAtDSzBOw8uAGnb62fhDSlTjR/DXcqoeeyH7anSxxWEHjxJ6HLW+KtGVBSUo1OoDKv7nyYyw1OV2bITx87soqNwsBAYuFhzEIHHOQVSuMb8kINkEm6iKgOYiSB/nReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7es+zh2yh9Ldukqx4kHYjIzFmV38k231rFs/QFn4Q48=;
 b=LnC+rlB6UItc8O2RX2V5hYKbUx20B4usexmja+Iyh9t1yI2YAUp+cyxAhJYTVcsjaC+O1DwRpLtMUnyDN9erfl/30QQbWxGPq/CnpuDWuPxnXmvWwXICy3qdn0ofH54HVkrqYZMrzk3Xw8bij0r6wKOAFDHR8OKpC12dq+afa9E=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:37:23 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:37:22 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] rtc: zynqmp: use dynamic max and min offset ranges
Thread-Topic: [PATCH v2 5/5] rtc: zynqmp: use dynamic max and min offset
 ranges
Thread-Index: AQHcgK3pIEn63Dudo0OR777mQd2fJrVR1e+A
Date: Wed, 14 Jan 2026 15:37:22 +0000
Message-ID:
 <LV5PR12MB9804CB6FD6D675255B326EFF928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-5-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-5-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:37:19.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DM4PR12MB6181:EE_
x-ms-office365-filtering-correlation-id: 6cfc1fed-d063-4016-46ac-08de5382cfbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1h2Tk56cTdxN2h5bjhGWndZMFYvTC95QS82M3NSNFEwV0kyc3pCdmcxNmNR?=
 =?utf-8?B?RS9TUU9GclpDUFY1Q0t0MEJUTFIxajROY3l5Qkw0dmMvV1ZNRDhlVEE0Qnk3?=
 =?utf-8?B?Q1MxOS9LM0FjSkI1NXkwVjQ5TGNqc1NuOFBPUTBEQWlRc01kOGsxSElZZWZx?=
 =?utf-8?B?d1FuQXI2Q28wYVBKbHJGckZ3QVZiajhyeHJhbysyQ3hOcG51R0Y0NVBJY3BF?=
 =?utf-8?B?cFgyVk5LWk90bUpHcXFHa1lOKyszS1NvSjI3M3RERnpqcWJLUE5uMk1hRkM2?=
 =?utf-8?B?ZjVBVXlMQWI1RFRHOU9ybHJIY1hhREh2VU5lcmZkd1BmazlzanNJNU5ITGNo?=
 =?utf-8?B?NXprS2V1MHBSZU5SUUdQeStSQzZtbDcvR3AxNjAvZjR6Um5JSkc3MTRBT0Jh?=
 =?utf-8?B?SUFDTWxzNm90c2t4TjJ3T1YrY3Vmb0d5NXZxQVVMcmxGU0ZXN0txekxWbnBL?=
 =?utf-8?B?YnZ5aEtKZzVWQnhydGxDUm9LeXlabEFsVldqWjVOYjRscVFhTEtzT3dTZ3cr?=
 =?utf-8?B?bTVqTDJNUUlWbVRGSGJGV054eU1NTTVKSkhxT216WUVrZkNIdFRjNS9FR3p4?=
 =?utf-8?B?NTdQK2pJa09zUy9yZXdwbHJRVDZDdUN1b3JLV1pvVmJscGJlWjVJek8vQWZ0?=
 =?utf-8?B?bCtiSjB1MWcvUi83VHovRHJaeU5FbEYzUURJMUF0STMzOWZsMmtMWm50M3lR?=
 =?utf-8?B?ZDg0UE03Z0hXWG5QSjJOMnJ5QkJUT2lMcUwxOEdQeTdxVjVPaVBveVVTVFJ5?=
 =?utf-8?B?dzlLUTBKRlpFTmQwems3dmFrNnZBWkIvZEhOeE9wUVZFVXduUFRxczI1RFBP?=
 =?utf-8?B?VU1Rd0FGVVBHR3FGWWxYdEp3V21EbWs0K24rZVFrMHZHUUpaSUZaUEdnbWhC?=
 =?utf-8?B?RlEvaDlSNDdscXZZbDJzR3VQTnJwRVJnN2cybVFFOEdTWkZaU3NmNnlpY21R?=
 =?utf-8?B?bW96NkdLVXh3SG9VSGErSnF2WjlSYzVtb256cFV0TGNReHpMQmVDN244bkVN?=
 =?utf-8?B?N2t5N2V4ODhuMVAzNnoweDlvV2h2bm9xTVlXY0IydFg1WWIvUExtcUdGc1Uz?=
 =?utf-8?B?c0RaOVhwdDNxdFo2NVliVmd2Vm9sTmNWWjAxM0pDRmNaZUk1MG1ZOVIwMnV0?=
 =?utf-8?B?dUlJTkx3RFRlc2V2Qlp4b0VKejArUXV6VE9WMjVwTU4xN0g5eUVBNWtQdVBj?=
 =?utf-8?B?ZFdHREQ0UFRVZjNsL29PQ1l6alE5K0sxVjN1WlVsbnBCUDN4VHdnUFpCMXJD?=
 =?utf-8?B?V1U4ZjN0MHRLRHIxZVlXMGZOd3RwM0FJclBUTkhWd1dKY3hiWlNnZU4yajE2?=
 =?utf-8?B?MXBGQzN3amNqTTBqb0hudXRtNjJaN0VPNFhzQ1ZSVGhiQzNZZyt6bXYxNDEr?=
 =?utf-8?B?dW42a1hyVm1HUlZab3FxUnlqRjBEd0FBM3IrTzBVV3M4dEVDdWdkZTNxOFR2?=
 =?utf-8?B?WmxPdDh0eWdzL2pwVCtNaUx4bDNiRUlPMDJzSGFkRmlNNkFURXkxSyt1VDJv?=
 =?utf-8?B?bDQrRHdpeExEQ3lQK25OK0RzemxuS2Y2Tko3ZXFFWXNRUXNEcGhKR1ZxTjB3?=
 =?utf-8?B?VEVwSzkycm81c3RpTFIzVjdIMEZSZkp0ZVQ2dG1ZaVJKdk9VdW50Wi8xQzB3?=
 =?utf-8?B?cElrcXdGakJWVUFhWUdPL1ZxaGZnU3IzelZvcmdCRG9xVG1VSWpKSUdWcWFW?=
 =?utf-8?B?M2QwSjArYXBEUzl3amxVMmJPWTR6d0F1dldwd3JVQm9jeEFXWEFoNnJQbkNE?=
 =?utf-8?B?N1FmcHYweFlzV1JiSXl4KzB1Nm9FZzkyN2ZIa3BRSDdGMXU1QUVUcmRCRHBw?=
 =?utf-8?B?WEdtZmdDT0JmUVEzMGpySjhyV0pXNDFWVmFlNDQxUDZuZkRnOG9nNlBMY1NX?=
 =?utf-8?B?SGVyZXRDaWQxMzcwRFRFWitzOGFZNGgrdTkzVHgwSmdEU0pJOEx5bWxlaEVM?=
 =?utf-8?B?N1BOMmVKMS9vTWZDRHVsSUk3QUEwNHVGWTd4R3RyZjdiY0Foa2lIclpzNFhQ?=
 =?utf-8?B?VDdXK3VmS21wT3RHa3ZZdWZwdkV2QmZJL1JpMDZQVy9Rd0ZUbHdwb2pWbXYv?=
 =?utf-8?B?UW5tVXRpbHM1Qy9adm5aV01lWkdzSitJNkVxNGN0NkVwbFF6UTkva3lLcVoz?=
 =?utf-8?B?WWtWTVJvY0x6MndOOTZET2UwNW5NeHdmaTF0MTZqV3NGSzVDTWFMQk5UUDJU?=
 =?utf-8?Q?g3DZ3EQun482Wdat/LPu53s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmZ6Y1pvSkw0anlrTE1WWHVYZURGY2g4UFVqRVRtRmNVSVdEMWNKYmcraUt0?=
 =?utf-8?B?ZHYyRitNK1ZKaGZkOHdjRG1iZTRtOVJVTi9YbWlJaWwwSkN3WW9YTmU0Ty92?=
 =?utf-8?B?OFBSMjRFemhiZWtuVzhZc2h2QmoyZllxcXk1YW1VYkdqQnNpbDJjTG5kS2pI?=
 =?utf-8?B?MU1DYW84T3dnWUJsWUxmUjFRL3hBemdWL1BpYWg5RmVhMVN2QlMvU0MxSDFY?=
 =?utf-8?B?N2RsYStsT3lYVFRSbEdJbTRRRnhFcU54Ym9weTRwUUVZbmNNTnFjK2VFVkpn?=
 =?utf-8?B?K05KVTk4MWdPUUh5UVU0UnhvVURHY21nRGd0cnkwdHR2WWNyZXpaUnFIUEFT?=
 =?utf-8?B?d1E2QmFXNUJFN2xKeUNkb25udFRnK1lheHNnWFhsVUVyVVU3enlxS3dmS2RW?=
 =?utf-8?B?TXVCbEYzNGRUeTlDb1o5bmppczFrUFFOb3NNUVFPWTg3Ym9FOWFvc3E0UGRQ?=
 =?utf-8?B?TkRCZEFaeXI4aHhkSzRIZFdLQUFNOGJxM1ZKZHJselQ1ZExPZzNqZ1FDSGtH?=
 =?utf-8?B?ZGFqcTRXRTZGc1B6aHhGaGNpcmluMW5TUGMwOUtKUTdsV2hPY2h3QlMzL2Vt?=
 =?utf-8?B?OWNLUEZxSUpjNnNUZjhRMTJrVXYzTkNQbkZmZDlNQ01oc3RPVDBOSklHOTlL?=
 =?utf-8?B?YmZseUxZcVJWdnpNc05MVnIzblVTM2tTM0g3NUpncEVEdGx5ZFQrZ1Y5ZTIz?=
 =?utf-8?B?WmRtUkpwMzNsTGJNS1hLT2tiUUxLV1Z4aTVGRDRQeGZSME1RNGcrcXJhQ2Na?=
 =?utf-8?B?R2UzSjNvWFEvOGFoeWRKc3hGMGM5WjM5NlJaUFliRGdIV1FlWGRQTEs4RlYy?=
 =?utf-8?B?ZkFTTk9xaFp6RlY0aHhLcmhQR1FVZzJSRitKV25LUURNV3RCS1plUWNxc3U2?=
 =?utf-8?B?S2dDV05LT2NnSTFlREZ4eDVGdWFIUXBmcDcrZVBtZGxXMXJuQ1NscGtkRmNu?=
 =?utf-8?B?VVFrcHh0WGx0bkJzL0hkZ1pzTDk4aVVkY2JCZndnMjlWaTd4YVpJdWM0SkpB?=
 =?utf-8?B?VHpkR3dsSUpFRUdDbXJOU1RZdGREL3FQbmU5alY5K0lFTDVvUUkxbHBzK2s1?=
 =?utf-8?B?dkx3VCtuUHJzd1UrWE9sZVl3MGxyZmFXdFowUEU3VGxoaU9kMHpKc2JncHF1?=
 =?utf-8?B?d0pvNmU0Tm9ubzJJa2duNFRrWEtTVDFHcWExSXFWYjZ1bVlwSjVycThWT3pV?=
 =?utf-8?B?ZExpSHFWalRObXIyQTlxMmcyTUVqZzhtVDg4aDVwYUhqNXJqRXNrZVh5cnc5?=
 =?utf-8?B?MVRvSjRUcWVETWozdWxKSVlSMHZBK292cWJZajJCOFI4cHFnUm5mbnVVT3RY?=
 =?utf-8?B?ZXVGUXk1cVRKQ09TY2R5NjdydHhSRHIwR2o3NzFXUWZBQkJmdE1NaHhzSGZy?=
 =?utf-8?B?WXgzMXRxdFI3WXBhL1ZqSzhPVkZiazZOOExOV3NQNTdwWE9OeUZZQ2RLNnZZ?=
 =?utf-8?B?WC9NYWx3RVdOaEhTNHhORm1jSXluWEZnN1ByUS9mZE5WOVFnNk9yL3VYWkFG?=
 =?utf-8?B?NVFOQXRZYWxNTmtacDRsbFdnUWt1Q0hueDBqWk1LM0hxZjdoN2M0dkljZUh4?=
 =?utf-8?B?NDYxNE10NEovRkNybFRyUlJ5S3VQOEZNT1VtZ1VxdkdoUXJWU1pVRXh5UTkv?=
 =?utf-8?B?bStYcVJ3dXRTS3MyMWtSVGp5ekFSTTlYbEpmODlmWjVaOG94YWFzcUtXcllU?=
 =?utf-8?B?KzE3T1BHQ0pOOXh0Ym56QTVTblU5emUxd2JYOHlUMjB3QkpxMzFnZmVGWVk2?=
 =?utf-8?B?SHR4WWxacHJNNEI1UVNMdi9qRFVLODlnTjZ6RHBCV3dwSVgxVXJaYklwTWFM?=
 =?utf-8?B?RkJZY01qeGFuUGZyeHJSUk1lOWFBSnFmOTdQV25OYTBYNE85Tmx3TWZwS1Jj?=
 =?utf-8?B?bnFaWm9nTVkrM1duZmtTbWRibDNlWDM1MFJ5cWcxb0FmMFZYRkNoQSswUDhI?=
 =?utf-8?B?RWJReUN1YlhMUUtyK09yRHFEZmw2NlRpUFIxRU8wZ1F4OGVrMVV0UzM2KzhP?=
 =?utf-8?B?M1FRbERoYURPdTB1SDVlcENSQjQ4WW5KQm44aGIycFhNeFRpK0kxUHJ0MEcz?=
 =?utf-8?B?dzVuU0xvRVBNVm1rcVMrMEU5SHpLSG5DZzZZeXNMOHlwTS9MbkxpTnIyVjBs?=
 =?utf-8?B?RFJyWVdObE1TelYrMlNQN1gyUFBWYmVRQ2REU0JvUXlxUDB4TW03VW1HcjFV?=
 =?utf-8?B?UTVXSlA5ODE3U2phVm5zZGdmWm90M3g4b1dNTEt5Z3dRK2NjVlJGdmhIa0M5?=
 =?utf-8?B?UVB1LzhqdzBiRzdBY0xxeUk0UHZGSGswQWQvd1BWZnk4b3lucGN2Z1p4Sm1E?=
 =?utf-8?Q?1ynPDtLE4EIvC4SrHj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfc1fed-d063-4016-46ac-08de5382cfbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:37:22.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xj21tMBNZk9F2g2vLt6wgnvKcMeHbMepnoiikYvlexNjXGj2+MyIJaeCIbJhzFE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181

W1B1YmxpY10NCg0KUmV2aWV3ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQuY29tPg0KDQpU
aGFua3MsDQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgOCwgMjAyNiA2OjIxIFBNDQo+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT4NCj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IHYyIDUvNV0gcnRjOiB6eW5xbXA6IHVzZSBkeW5hbWljIG1heCBhbmQgbWluIG9mZnNldCByYW5n
ZXMNCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5h
bCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMs
IGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBNYXhpbXVtIGFuZCBtaW5p
bXVtIG9mZnNldHMgaW4gcHBiIHRoYXQgY2FuIGJlIGhhbmRsZWQgYXJlIGRlcGVuZGVudA0KPiBv
biB0aGUgcnRjIGNsb2NrIGZyZXF1ZW5jeSBhbmQgd2hhdCBjYW4gZml0IGluIHRoZSAxNi1iaXQg
cmVnaXN0ZXIgZmllbGQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRvbWFzIE1lbGluIDx0b21hcy5t
ZWxpbkB2YWlzYWxhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMgfCA4
ICsrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGIvZHJpdmVy
cy9ydGMvcnRjLXp5bnFtcC5jIGluZGV4DQo+IGQxNWMyNTZlN2FlNTYwNThkZGMzODg0OWFmNjQy
NGNkMjliODk2NWUuLmY1MDhjNjFmNDA0NmU5MDZkOTU2OWNjNw0KPiA3OWExMzYwNDc0YTg1ZmQy
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMNCj4gKysrIGIvZHJpdmVy
cy9ydGMvcnRjLXp5bnFtcC5jDQo+IEBAIC00NCw4ICs0NCw2IEBADQo+ICAjZGVmaW5lIFJUQ19G
Ul9NQVNLICAgICAgICAgICAgMHhGMDAwMA0KPiAgI2RlZmluZSBSVENfRlJfTUFYX1RJQ0tTICAg
ICAgIDE2DQo+ICAjZGVmaW5lIFJUQ19QUEIgICAgICAgICAgICAgICAgICAgICAgICAxMDAwMDAw
MDAwTEwNCj4gLSNkZWZpbmUgUlRDX01JTl9PRkZTRVQgICAgICAgICAtMzI3NjgwMDANCj4gLSNk
ZWZpbmUgUlRDX01BWF9PRkZTRVQgICAgICAgICAzMjc2NzAwMA0KPg0KPiAgc3RydWN0IHhsbnhf
cnRjX2RldiB7DQo+ICAgICAgICAgc3RydWN0IHJ0Y19kZXZpY2UgICAgICAgKnJ0YzsNCj4gQEAg
LTIxNSwxMiArMjEzLDEyIEBAIHN0YXRpYyBpbnQgeGxueF9ydGNfc2V0X29mZnNldChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+IGxvbmcgb2Zmc2V0KQ0KPg0KPiAgICAgICAgIC8qIFRpY2sgdG8gb2Zm
c2V0IG11bHRpcGxpZXIgKi8NCj4gICAgICAgICB0aWNrX211bHQgPSBESVZfUk9VTkRfQ0xPU0VT
VChSVENfUFBCLCB4cnRjZGV2LT5mcmVxKTsNCj4gLSAgICAgICBpZiAob2Zmc2V0IDwgUlRDX01J
Tl9PRkZTRVQgfHwgb2Zmc2V0ID4gUlRDX01BWF9PRkZTRVQpDQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gLUVSQU5HRTsNCj4gLQ0KPiAgICAgICAgIC8qIE51bWJlciB0aWNrcyBmb3IgZ2l2ZW4g
b2Zmc2V0ICovDQo+ICAgICAgICAgbWF4X3RpY2sgPSBkaXZfczY0X3JlbShvZmZzZXQsIHRpY2tf
bXVsdCwgJmZyYWN0X29mZnNldCk7DQo+DQo+ICsgICAgICAgaWYgKGZyZXEgKyBtYXhfdGljayA+
IFJUQ19USUNLX01BU0sgfHwgKGZyZXEgKyBtYXhfdGljayA8IDEpKQ0KPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FUkFOR0U7DQo+ICsNCj4gICAgICAgICAvKiBOdW1iZXIgZnJhY3Rpb25hbCB0
aWNrcyBmb3IgZ2l2ZW4gb2Zmc2V0ICovDQo+ICAgICAgICAgaWYgKGZyYWN0X29mZnNldCkgew0K
PiAgICAgICAgICAgICAgICAgZnJhY3RfcGFydCA9IERJVl9ST1VORF9VUCh0aWNrX211bHQsIFJU
Q19GUl9NQVhfVElDS1MpOw0KPg0KPiAtLQ0KPiAyLjQ3LjMNCj4NCg0K

