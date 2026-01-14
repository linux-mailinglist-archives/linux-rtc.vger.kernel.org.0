Return-Path: <linux-rtc+bounces-5752-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A158D1FE25
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DA503061DE4
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA8939E175;
	Wed, 14 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pM3ymALs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A2539525F;
	Wed, 14 Jan 2026 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404982; cv=fail; b=gLyyftf7cMLxrYPfiLvKjKfxwm5W87eWJjAt9T8wwFUl5FXSwv+kd14k+aONS2BnWJ8fyP8ss5jGGIFC+xeVMGPfnRKJSyAgGh17ZXvyVKW4yA4m6s+wxXb9irb4pPGDy3ris33KOFI8cgxvtHUxjv6x1P3FiWeR6sw6gyFiRho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404982; c=relaxed/simple;
	bh=tV1KFUcD56cgJ5nvghCJox1kioDLs5Pkl5VNkNzkG3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HV1QyV9O2fjQ9j7i4v8SPd3E95bKkNH6Hi6cJM8KwOlo9dIQuZnUEG7zhbH+M6NtRBjn6yK8WG4q0cmhDyWQTbyg7KeR18Lb9zmSLfMrvzs0gr0zwStelHo4A5zs5CwY2sDuzwcxf04qWMBcxd41TRQcbp0qCk7zI5NzdJ26uac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pM3ymALs; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn6kwH1HCcpJQkSh13DN8VfRJv1CxiRQWZ2dr/BrtIx4H+j8pjtACWdYgaQWZ/oIZFjXwyxMqGfEfUz7Anlc/bLefsx0CMwh+S/KjQC3ufZC++owPt8vvy9ylSoJo6lnq0UCJV6EuCMJkTKGJIAqE8ZgGosNQgxLuogP5WJvT4FnURmJWYDDvzrvhJLsTxMnVP87+xIlKOgz1K+seOtbn7vxSb1ybfLfmrYiH2jt4ULcnBT2MNG33KK7nOIKwQ5EH9O0qd68/+YaDcrfIabjb533zXbacaIIBsmWEmzhQIx9UHcwCQlDGqkAHY/eqWTigG19qxxQzLS4xAT+03aOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV1KFUcD56cgJ5nvghCJox1kioDLs5Pkl5VNkNzkG3U=;
 b=gCjrG9ta2EfSGn/rCnn+tptPiTqeE+ZVQJkcnQhrnQhDnc3uYFo0w6Qr2rxav91b3xe7LZhXOdL9nEqxMBHN0rJa4NqrQ+VA7btKRCytNehyxQ3yXAl+9BXQAfpkJ8Hx6VUL7754KrIcbuhr51jTLWgsPrN099+QSR9aY7IjGJBKO12bn2q5O25WsgPijS1udc/35L9DxL6PT+K7Grp/tJDEdm1wbyJAJt+vdq/z4LbrGXmeAuw4QYldijas3Q++QgncXE+Ax52KvWRlJMFFa6z56Wx9g2UGHhDCa01E8uKeG48sZtwFXQ+bD3RZA9KpdqVdCnLCUHWC838w9S4Zrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV1KFUcD56cgJ5nvghCJox1kioDLs5Pkl5VNkNzkG3U=;
 b=pM3ymALsGQA9ugn2uMQj/PCjSzc5ROF8jOw0EHBptaXgMZbfAWLrYjMkm4XZFbmLmMLZKQ15pyEoN9a/Mta2B/50hLVMGpoZMP9/KZZIGrJq/kZ+iDbdIR3qzGHuRiUAOxLnw1kckMh5VOpERXactQNR0ivpCTp98VBCXeIx+zA=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:36:17 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:36:17 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
Thread-Topic: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
Thread-Index: AQHcgKf2bbSZiGVyoEqkfF3gG87DNLVR1acg
Date: Wed, 14 Jan 2026 15:36:16 +0000
Message-ID:
 <LV5PR12MB9804B90FBA302E9E2965D225928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:36:11.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DM4PR12MB6181:EE_
x-ms-office365-filtering-correlation-id: 4d1cc2d9-8edc-4149-1125-08de5382a878
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SFk1aVp4UkthdHFQUzFzd1JVRzRkZS9IZHBUQU5neDVCcUJ5cHFseHRMY2tX?=
 =?utf-8?B?NjR5ZXgzNlVlZTNJK25xb1BGbTdMalAyZ0krVUliYkZaVDhsdVVPUnIzSkta?=
 =?utf-8?B?TmN1WGUvVmk1NG00YWtnOWVHSU1XRGJoWnZjclhkYWlxMXZXdmsxQ2MvSWpo?=
 =?utf-8?B?bjNmTlViYnRvbFBwbmwzYW1FcSttemZEaENPMHBiU0VXdEYzK1kxcHFvWFRT?=
 =?utf-8?B?c2dvV3k3bUlmdTVkQi9rVWZnT0xMSWlaTlIrK3orTDl3Y0dEVXplZ0FMUDhL?=
 =?utf-8?B?N2VpMHRSYVBoaDU1WGhIeEp2bUw5SDJrWWp6a0dHSlVHT1cvQ2tMcTF3SnU2?=
 =?utf-8?B?NEx4RytncWRVUndXZTNzazdvODE2dkluclNPalM2OUlpcmFPWnUyVnRNTUlW?=
 =?utf-8?B?R3ZGNzdwSXNkREgzRzRSbWg3NHFyandlSlA0dWk3V09vSjZwRWE2Rk04VFNa?=
 =?utf-8?B?VUpsVjJLMVZtMnRtVEM2NDk5SzN0NDExb1g2UnNMNFhOVE1mRjZPL2wvZmMz?=
 =?utf-8?B?WHF5V0pEV3EySHcwMnpRYU1CbFg0Q1RaZnBiWTNBMmVYd2s0YVM3WXlURDUw?=
 =?utf-8?B?V1VFSGZ3dkk5Q3E0Q1E5Rkl5ZjMrMWVEYlVHckNJZ0o2T0RieG1JdVZIaUkr?=
 =?utf-8?B?aTV6QUUrd0JDUStaM0VWYmZHKzFyaXh4eDZxTGo0MERLdm9xYnh5R2hnR1k3?=
 =?utf-8?B?QkMwaytlWk1PTjF0dWNvUkdwdEpkN0djaTZoMjVPMzFWNExvVEcxUXlMSHZk?=
 =?utf-8?B?dHYxQXBaSjRRcXZlZktEdjFZblN4RE9pYjQ4NmNJMCtNWUgrcVpFaWttNC9J?=
 =?utf-8?B?UzhBSFRUMGhteWxLcEgydmpsYjBHYVgvYjI1N0NpNG5WbGhrb2RoQUtVaG9P?=
 =?utf-8?B?Wm4xSThsSUpPdyszM3BPNERpTGJmVktuYnFWT2NYdEFQVmdidUJIa1VkWGpQ?=
 =?utf-8?B?QWRWQ2hOa3BwTmNiRlVCZUl2R2lkajIyMjlJejUrT3NSc1FBQXR6K2N0SjNN?=
 =?utf-8?B?bC9XdDdpV3M0cVg0MUFOQ1AzM3lxZnpSSWRkTHZzbWVFTFduSFVKVXdKYmxu?=
 =?utf-8?B?S0c1Z3BwRGFvMVd2MUFkM3hPRXJ3QWZ3TVVLUUkreTRZaldGb2s4ZzlRdmZ6?=
 =?utf-8?B?T3ZtYlNHZEpVckc3N2w5QzVnOG83aGNCcnNtWUZMSlVva3lkVE9FMzc2ejYy?=
 =?utf-8?B?cVQvOVcraXM0ei9nQnZpTmFrMThheWtMMDNiVkVGb1l2OG15dk00dmg2bnBz?=
 =?utf-8?B?Q0hhNllIQmVpaWRPZFB1K2ExQ2hSWXlRNkU1QnZDU01vaDlZMThmbExIWVVG?=
 =?utf-8?B?YnlRSzFqOUpmRXFkWVlqWlRMdGlpZ3pNQS9XRy9CWnR0T1BjZVJPVE05bEk4?=
 =?utf-8?B?RDEzRldWM2NZbU9maWMva0FqaGlVVWRNTG50d29qeG1UYktxbzFEdWJvZWtm?=
 =?utf-8?B?RHl3RE5pL0ZWcXdJV2ZzYlJvQ3FFZVR2bkY5eHMrM05SRkFLMHJ5OTZ3K3B6?=
 =?utf-8?B?d1k5UDhmMUhuSWNqRGtKbTF5YVdoczlWaXl5SkN6KzV5U1grRUJHTUxwb0Fo?=
 =?utf-8?B?MXc3Vno3bXNWRDBiM0lFTmoyMTI2dEpsK0ErREV3cndyMml2bWN4NGVJK3lH?=
 =?utf-8?B?VzAvYkhtTElHeVF5NHRVN2Mrb2dwK0dZUkFJV3U3eWVHSTdlRis2b0lXTVl2?=
 =?utf-8?B?UEFMVFg0Wm5kYW10TFNobDUySEpRbU1veEs5MVNYMS9ZM0tsbXFPUVVlcWMy?=
 =?utf-8?B?OWxlWVNGOHI2dGpWU2dyUEpTSk9mQ3FkYlMrTnlYaW95bGFwMTdOa0YzYnNK?=
 =?utf-8?B?WFBZK3pvbWZYdUhhSThsRlNGVzdoOVpmdkdWRFIrWTloM2h5REdmbXp4QmVO?=
 =?utf-8?B?M2VMRHlQZDFDVHY4cWVnaWpRR1NkYXhnVmpJWk9OS0hYR2tPZ1hXa1hlcFV3?=
 =?utf-8?B?bkFUZEZGZ1NGOXNWSUl3c3RzZWN5OU1Kd1hacDMxT2c3ZnZvMEpRZUh5aGtD?=
 =?utf-8?B?Q0V5VHlTb0dLL3A5c2FVNk5hMFcrK0RvbzBJUXQ2QVM1WFF3UWlHT2pVUkg0?=
 =?utf-8?B?b255WHhpZXNvVDY2RVZhY0RjSGNIVHZ1dkt0RDNtUjlVeTRsbkkrQ29vbE45?=
 =?utf-8?B?K3ZoVHhRRHc2bzFLUVo4MXN6QzExUFd0SStPbmhrU2dFTmp2UGF5S2FWdlll?=
 =?utf-8?Q?KtRVMM8Ts/1jMujIKFd9zpk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEs1WWJucS9kM1RYTWpIdFk5K3FaalNtZm1sbTdyMWZBTDYrYzdEbnZyT3Uw?=
 =?utf-8?B?a3VFRWdUbk1DUHlqS29rNUNJTWcxZFRhZHByOE53NWl1Q21OaWtFRXZrY2s5?=
 =?utf-8?B?WWQ0bEZBQ2dzWDJteTJLdTBVUldwY2ZJcklHMy9XMk1mWDFET0U1eGpNS2Y0?=
 =?utf-8?B?Q3c0T1ZkKzgySXNNZzVScTVwNnEvdzg0VHRPeXFGZEtjdGxaYWh4VElyOWh3?=
 =?utf-8?B?a0FFa3NrSFhLS2RQcjZEN1N0S29rVFlEWkV4d2F2VWFwOFVUMUpsYWRiUmJj?=
 =?utf-8?B?c3ZxV1lMa1AzRXFteWRES24yaGdOcCtlbmJySXpDVnJZQThTMDBWWTFMWW8v?=
 =?utf-8?B?S2FZNU4vZEJ1MWMvTjh4ZlI1akhmbGdSWEViUmMrSzM3djZwaUZMcmJwTlhB?=
 =?utf-8?B?ajVmK29Cd2JUZnlvcU01cFZmcXlLQmtEVWRzeFBieXRaK29pOS8rN1RIUEM0?=
 =?utf-8?B?ZE9BRGZtelVYSFJIRVl1UVFvRFZhMWlZOC9WcUlUc3h2VmZQYlJxYm1HTXdl?=
 =?utf-8?B?Sm5QNCswOHptK0h5ZkxPMjIvNjVkOWZJaWxKZ1hIejlYcWlBM3pnditTRS9i?=
 =?utf-8?B?MVRNbXdKV3B6QUlsdDMvc3l3S0pZRm9UcXZLYnNWWVVjTjZON25JNmxYeVls?=
 =?utf-8?B?QWZEUzhPODYxMytENk9mMzAvTHhLY1lCMzkyY2N4QUhnSDYyMklvV2hkZVlV?=
 =?utf-8?B?Z1NKMkhwaHFJSkNxclV4U1dCaVQwSXpMa1EwdEYvTDdVVG9ZVlRZNUFsUCtZ?=
 =?utf-8?B?TS82R2FpdE9qdTIzb1dvWkJ1bHAyNTJmbEhqNTlIRWgvcFhpV2Jma3RBeUtW?=
 =?utf-8?B?a2FtTUhhbGl4TS9nV2lxRkxJTWZVaXRTZ2Fxai9OVmxGZHM0YjRQL0FhUW5I?=
 =?utf-8?B?M0FNOGU4Z0lUVlA0QmlUeW9OajBzRVpaUGJYSEdWNGhRbE4yejlnQ3QvMDJk?=
 =?utf-8?B?bVhYT1FSYU1hTkhyd25RN1p5dHB6YkVndWJyOXd3dmFNckYwVmFrQW5xQWRu?=
 =?utf-8?B?MkJTaXpEZ2pORmRJRmI1QlJpZXdoZUF2TTVUOWQ3L2d6YWUrVlAvQWh2RmtC?=
 =?utf-8?B?enNkUVZzOWtLZHcrcDJGMUFTMnNaTHAvU0tKd3BCWmxIWFkvYWNJRTA3VnNm?=
 =?utf-8?B?QmNyNGc3YjA0SXVNNmJqOWQ0S3JEYVk4bFRUa2lDZE9IR2o1MGVBN0FyeENt?=
 =?utf-8?B?cVV0dXNHUXpCYXZSSk1Ha2tydE5wRVZQckduclI3THc5M3ZvY0U2U3k5UmlJ?=
 =?utf-8?B?UThxWHJYZU80N1BHaVVqSzR0ckJpWHYzWmt2aGdpa1d1Q3hUR0VDT2lVLzhk?=
 =?utf-8?B?cXhqRlYrbVd4U0t0WDF1TFo0b1k4S0pJbkE2d2Z0NHBvRlBSWEJWRXZPRWE4?=
 =?utf-8?B?Mkh2L29sL0Z0MTl0SFNUa1hrQnFoTDdhUUV5NWlzYWxEemE3cW9Ma3JMdWs5?=
 =?utf-8?B?T0xFTElMaXVqK3ZNQmgwOHVSNFZpOEVOYnk5MGl2a2J1TFlZUWpQMEROY09H?=
 =?utf-8?B?Q3ppcjZuUkZtTk92aGFKemxqRDNKYmwxKzg5L2Evd3QxVzJXU29la2JrSEpv?=
 =?utf-8?B?M0lLSzgrSVlrMVFCVkRFK1J5bVVMMlJ3MHh1V1FsSlVJVnZHWElra1dRcXBx?=
 =?utf-8?B?OGVzdHhMUWtVVjRIT3lGdVI0UEsyZWV0c1FBMC9tYzB3UlBqZVBHejdOcTJz?=
 =?utf-8?B?YjRKb3RSMEp2bERoTVJobjRyTzM0Rk5nbENkUE01WlVveHNEZU4vUjJWMHMz?=
 =?utf-8?B?bXV0ZkpKRG9xRkMvNjBWU3pDU0NOMjlZaVBUNDZ6MWlNNER4dFU2SnpTR1pH?=
 =?utf-8?B?YmQ0eW41U0wyN2pVVmM5SDBCVjVSRUQzcXRNUHlkLzRmTmNMaGlLKzZBWHow?=
 =?utf-8?B?VXlESEtKTHlWL3RSTDlsdmVTVm5iTkE0Wmd3cnpCSUFRdXhYZ3IwVzFvNTd0?=
 =?utf-8?B?ZzNaQ2JXMFg3TXRjYmVHeEw2azREc2JIVXlXam1FN3ZNemhjdzBLRy8vT2FS?=
 =?utf-8?B?dFBQRVQvOHlyT2NteUlWbDl5QnNrY1BFZTZ3RlpjTjA2MThDelFDaDJFeXl6?=
 =?utf-8?B?KzNVcmhNMVV0SFdvdVVVOTZ1amhrT2lZeURwYmpMVXFGSWllakdRdU8yN0ZO?=
 =?utf-8?B?VEg3WlFiYnFYZVFIQWtVSnYvRDc5WU1OanlRRGZkYkd2MDVpRDdERUlTSE43?=
 =?utf-8?B?bGZBM2R4bkg4V2hxQWR5QkdObWwvOHNOQmY1TzQ4aGE0NFVHcm1lVDgxT1l6?=
 =?utf-8?B?Q2d5ajJ3VzZVQkZLc3AvN2hhaC9zN2l5WFBTVTNuOG5paXlFcWE5OE5sNWpG?=
 =?utf-8?Q?qi5KynmwgVj2c7eWFa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1cc2d9-8edc-4149-1125-08de5382a878
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:36:16.9891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJmZRGs/e/3sFm0YtCymiUJ00B4BZjxMfABK0LfJLufTuM/UtWTkRYP1CJqVYjau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181

W1B1YmxpY10NCg0KUmV2aWV3ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQuY29tPg0KDQpU
aGFua3MsDQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgOCwgMjAyNiA2OjIxIFBNDQo+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT4NCj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IHYyIDMvNV0gcnRjOiB6eW5xbXA6IHJld29yayByZWFkX29mZnNldA0KPg0KPiBDYXV0aW9uOiBU
aGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Bl
cg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9y
IHJlc3BvbmRpbmcuDQo+DQo+DQo+IHJlYWRfb2Zmc2V0KCkgd2FzIHVzaW5nIHN0YXRpYyBmcmVx
dWVuY3kgZm9yIGRldGVybWluaW5nIHRoZSB0aWNrIG9mZnNldC4gSXQgd2FzDQo+IGFsc28gdXNp
bmcgcmVtYWluZGVyIGZyb20gZG9fZGl2KCkgb3BlcmF0aW9uIGFzIHRpY2tfbXVsdCB2YWx1ZSB3
aGljaA0KPiBjYXVzZWQgdGhlIG9mZnNldCB0byBiZSBpbmNvcnJlY3QuDQo+DQo+IEF0IHRoZSBz
YW1lIHRpbWUsIHJld29yayBmdW5jdGlvbiB0byBpbXByb3ZlIHJlYWRhYmlsaXR5Lg0KPiBJdCBp
cyB3b3J0aCBub3RpbmcsIHRoYXQgZHVlIHRvIHJvdW5kaW5nIGVycm9ycywgdGhlIG9mZnNldCBy
ZWFkYmFjayB3aWxsIGRpZmZlcg0KPiBzbGlnaHRseSBmb3IgcG9zaXRpdmUgYW5kIG5lZ2F0aXZl
IGNhbGlicmF0aW9uIHZhbHVlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgTWVsaW4gPHRv
bWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcnRjL3J0Yy16eW5xbXAu
YyB8IDI1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9y
dGMvcnRjLXp5bnFtcC5jIGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGluZGV4DQo+IGNhYWNj
ZTM3MjVlMmVmMzgwM2VhNDJkNDBlNzdjZWFlYjdkN2I5MTQuLjY3NDBjM2FlZDE4OTdkNGI1MGEw
MmM0DQo+IDgyM2E3NDZkOWMyYWUyNjU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMt
enlucW1wLmMNCj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+IEBAIC0xNzgsMjEg
KzE3OCwyOCBAQCBzdGF0aWMgdm9pZCB4bG54X2luaXRfcnRjKHN0cnVjdCB4bG54X3J0Y19kZXYN
Cj4gKnhydGNkZXYpICBzdGF0aWMgaW50IHhsbnhfcnRjX3JlYWRfb2Zmc2V0KHN0cnVjdCBkZXZp
Y2UgKmRldiwgbG9uZyAqb2Zmc2V0KSAgew0KPiAgICAgICAgIHN0cnVjdCB4bG54X3J0Y19kZXYg
KnhydGNkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAgICAgICB1bnNpZ25lZCBsb25n
IGxvbmcgcnRjX3BwYiA9IFJUQ19QUEI7DQo+IC0gICAgICAgdW5zaWduZWQgaW50IHRpY2tfbXVs
dCA9IGRvX2RpdihydGNfcHBiLCB4cnRjZGV2LT5mcmVxKTsNCj4gLSAgICAgICB1bnNpZ25lZCBp
bnQgY2FsaWJ2YWw7DQo+ICsgICAgICAgdW5zaWduZWQgaW50IGNhbGlidmFsLCBmcmFjdF9kYXRh
LCBmcmFjdF9wYXJ0Ow0KPiArICAgICAgIGludCBmcmVxID0geHJ0Y2Rldi0+ZnJlcTsNCj4gKyAg
ICAgICBpbnQgbWF4X3RpY2ssIHRpY2tfbXVsdDsNCj4gICAgICAgICBsb25nIG9mZnNldF92YWw7
DQo+DQo+ICsgICAgICAgLyogVGljayB0byBvZmZzZXQgbXVsdGlwbGllciAqLw0KPiArICAgICAg
IHRpY2tfbXVsdCA9IERJVl9ST1VORF9DTE9TRVNUKFJUQ19QUEIsIGZyZXEpOw0KPiArDQo+ICAg
ICAgICAgY2FsaWJ2YWwgPSByZWFkbCh4cnRjZGV2LT5yZWdfYmFzZSArIFJUQ19DQUxJQl9SRCk7
DQo+ICAgICAgICAgLyogT2Zmc2V0IHdpdGggc2Vjb25kcyB0aWNrcyAqLw0KPiAtICAgICAgIG9m
ZnNldF92YWwgPSBjYWxpYnZhbCAmIFJUQ19USUNLX01BU0s7DQo+IC0gICAgICAgb2Zmc2V0X3Zh
bCA9IG9mZnNldF92YWwgLSBSVENfQ0FMSUJfREVGOw0KPiAtICAgICAgIG9mZnNldF92YWwgPSBv
ZmZzZXRfdmFsICogdGlja19tdWx0Ow0KPiArICAgICAgIG1heF90aWNrID0gY2FsaWJ2YWwgJiBS
VENfVElDS19NQVNLOw0KPiArICAgICAgIG9mZnNldF92YWwgPSBtYXhfdGljayAtIGZyZXE7DQo+
ICsgICAgICAgLyogQ29udmVydCB0byBwcGIgKi8NCj4gKyAgICAgICBvZmZzZXRfdmFsICo9IHRp
Y2tfbXVsdDsNCj4NCj4gICAgICAgICAvKiBPZmZzZXQgd2l0aCBmcmFjdGlvbmFsIHRpY2tzICov
DQo+IC0gICAgICAgaWYgKGNhbGlidmFsICYgUlRDX0ZSX0VOKQ0KPiAtICAgICAgICAgICAgICAg
b2Zmc2V0X3ZhbCArPSAoKGNhbGlidmFsICYgUlRDX0ZSX01BU0spID4+IFJUQ19GUl9EQVRTSElG
VCkNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgKiAodGlja19tdWx0IC8gUlRDX0ZSX01BWF9U
SUNLUyk7DQo+ICsgICAgICAgaWYgKGNhbGlidmFsICYgUlRDX0ZSX0VOKSB7DQo+ICsgICAgICAg
ICAgICAgICBmcmFjdF9kYXRhID0gKGNhbGlidmFsICYgUlRDX0ZSX01BU0spID4+IFJUQ19GUl9E
QVRTSElGVDsNCj4gKyAgICAgICAgICAgICAgIGZyYWN0X3BhcnQgPSBESVZfUk9VTkRfVVAodGlj
a19tdWx0LCBSVENfRlJfTUFYX1RJQ0tTKTsNCj4gKyAgICAgICAgICAgICAgIG9mZnNldF92YWwg
Kz0gKGZyYWN0X3BhcnQgKiBmcmFjdF9kYXRhKTsNCj4gKyAgICAgICB9DQo+ICsNCj4gICAgICAg
ICAqb2Zmc2V0ID0gb2Zmc2V0X3ZhbDsNCj4NCj4gICAgICAgICByZXR1cm4gMDsNCj4NCj4gLS0N
Cj4gMi40Ny4zDQo+DQoNCg==

