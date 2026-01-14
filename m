Return-Path: <linux-rtc+bounces-5753-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A48D1FE5E
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 205CC3083C4D
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A9E39E6CF;
	Wed, 14 Jan 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b93UfxGw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011071.outbound.protection.outlook.com [40.93.194.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E0831960D;
	Wed, 14 Jan 2026 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405032; cv=fail; b=B2eSE6youaEOTJDqnZ663wyBOE2dHBz/Uqg0eLibNArROclMFKHyisKt1UGHFwK+8IVrPLBdQjBTHzyLKVRgzkZKLjGRTPfbTL4xoHzYVETBwnihw4Qphh+IiJu2mZpZ5800QjrAVVQh7qaiBigLGsyeV++NUVbGWaKSYyxhsIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405032; c=relaxed/simple;
	bh=0QfAWWC7YQqark3mWqxFwSuZAWIUHumECWkuwsO3eqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tt3X8K9ZWfdXDgV4QmfToubvjZRAPVVt9k0sUjvvNTLp30R4mqK1ZlNOZw3O/9GHzM3MKgGhpglXEQxVVT58B8J5VI8D1NPYN2mBDkQSTdIAfXICob5QDimbPY5t0Ctjoh7CZFx6Yd4/UYLhnqSwM1Sg+rJnrmjrso1bz3NHMlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b93UfxGw; arc=fail smtp.client-ip=40.93.194.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoZFkVLsGX5ipfe/Ka4XCDWgayQgr1eqffZ2UXK0bdOWl9uoT9ifZ8NJEDR2uPl9kp9O5zpSjhUBeKBuB6i6CW2RSgBP67zgrfT6zl9ALvmfiLWTmuzdECIDZFFPfjc2wUGUwHXQTgOozjDUUG0YyTNNeaAsge8gvKdSlEcL8Jsv3HXqevid8lQcNDfvo84V3cvOh53hrdKSnPptt/++Auee0GJjZF97Lh5P0xsPXUM9LnJg0tzNG+f09wibF7f0plYo5uJTTsEql0CCWEt98BDoLMM/FMcGa5i/P0f6E+2CcWtPgkm/1oUhj6B2A9NmnHcqzZTKsP0NNzqdpa6NFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QfAWWC7YQqark3mWqxFwSuZAWIUHumECWkuwsO3eqo=;
 b=asVD5aAzTsVsfs6i5TLn6CnUcWxk9MCdw398YYMYUAirNbuDeGrKo1bVhB8mzdr8qCOzAXEsU+eNupqtpl3OxzbwLEMOtI8CPqQtGiFl2iqECKDhn8oCntqNqMkxGsDbufJfJG8xVzQs3aq+e7SXvCo4tsBzDNxvHRLpSlWnsOODHHrofU+9IYupaUXd8c+QJClHAHqy9q+7g0QxeoUtI1ATcnSt/9IL4SCqFKzBBQjdEc9Mt8vZYiU7bqUN9sJqurGzN/yLHBk2bsXwrqV0ztwqBtJ3UFJDNeFUTGC+bSLZ6rtuEUcVwNPGYByIjiMD39zsnTN2J7pRlEp4ZSGwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QfAWWC7YQqark3mWqxFwSuZAWIUHumECWkuwsO3eqo=;
 b=b93UfxGwobNARF+mVzbwZebwaR7iOrV7CYcfoyOk2JrJrd/KZQ8KyBqEaJs6iwMDiqsJV48JwdQATffSnzRBt5ZJdvc5vwNyJNRbKHNICOVx1z8FN5eVDN9SM2PS6q1OqgTOhmx0xxfOxMhF9vjZ79XXH3XzeYU1PBjP9PVBRRA=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:37:06 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:37:04 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] rtc: zynqmp: rework set_offset
Thread-Topic: [PATCH v2 4/5] rtc: zynqmp: rework set_offset
Thread-Index: AQHcgKUNil/NFDSwykKUsTwo7GwhnrVR1cZw
Date: Wed, 14 Jan 2026 15:37:04 +0000
Message-ID:
 <LV5PR12MB980481A1DC737957538A9924928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-4-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-4-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:37:00.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DM4PR12MB6181:EE_
x-ms-office365-filtering-correlation-id: d11583a7-7d27-4c04-8fea-08de5382c4bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SC9BNk9jdzJuYnJLWVdCYS9oNDNJdGx0LzBaYVJIcDNsZWVmeHJwYW9xQ0M5?=
 =?utf-8?B?TDZtcGZCdXpmd1RHV1FzbGgyaTRVazh1Vjl3S3ZwMExDSzNCcHpTMjV1Yys0?=
 =?utf-8?B?ODRyZUsxZVlobmlLTjhXcVJjams2THV2NlNEcHYvdkdKMW1FcTNUMGphdzQ2?=
 =?utf-8?B?V1JkRER1R284MnkvQ3cyTlBkQTZhdDh1QTJ3cWdqQnVmd3lON1ZnUmY5QVZL?=
 =?utf-8?B?azcreEZ1eFBlRWRucTVmMzA2UVVTMWRCUWZzOTY4a0h3NFNoOUV6b2VhZ3Nr?=
 =?utf-8?B?UHg5UXdSSjlFVnZXaTN1a1JvYndiR0hIQk5EeDkveVVzYUlLUVBJRkxNOUlj?=
 =?utf-8?B?ZHJYWTlBRkJZTyt0YTBEUStRZFlPb2duMTRjWldYZ1B4Q1RMSGtJU3NRU2pi?=
 =?utf-8?B?aXcra1hvSGVhNU94dGZBeElNSWMwWHpDWVBHNTdPdXZnbmQ0UnhkbUFuUU41?=
 =?utf-8?B?MEV3MDFvZm9WeCtXMVE3aGI2OEFUcTYvOTVEcFBBVk81SkZvaGdyVjhJdW9L?=
 =?utf-8?B?Nk5XRXBtc21tZUhHZjVYOUFFb0M1dFN5alNDTGoxQnVLcFNzNm1FOHVXNGNR?=
 =?utf-8?B?REluRWppaDRBTUUzK2FhUVFJWUhOV1ZGTzRKY2lndXNmYUtldmhvYkgxTkUz?=
 =?utf-8?B?MTlvNktlNG9wbFN6dGhvRWhyaExmc0xRRnlXc21BNTViMHo1bjI2TmZjaXcw?=
 =?utf-8?B?RTNwcXZaWjhvWWYwQmcrZ1hLRVovdUl3OEJJT2RocmVlWHJqTDZQOUlkOTBr?=
 =?utf-8?B?M2tUUjEvYmJnRCtCOWhvNHdDT2hCaGdXaG8zSXVoOFJLb08vbVltWXFlRHBr?=
 =?utf-8?B?VzFKUksreVZtMWJHOHB6RVE4WUZKeXM1dXloTHlvTmlkdTZkV2lzMG5jeTlV?=
 =?utf-8?B?N2o1NXM0UzBzYlF2bUZIWU1NY1A3eCtQNktEUDQzeGgrbWdPY2tROFdQSHZk?=
 =?utf-8?B?SG9wV1FUZE82QnpzUVpKNmpESHIwRFVCTzBWUE5vZ1FCb2lEUWo2Q3NqTURN?=
 =?utf-8?B?ZFhXNis4eXRSckx1VUxuQzhXRmV0cFdES2VkZFRJdU5vTHpTNUdhWncxTkU1?=
 =?utf-8?B?VllIanJqL1hlTXV6c1hKbWxjVlRSWUw1cHdBZ1VZb3RMQ1pLYWxLNTQ2VTBN?=
 =?utf-8?B?QmdUZjRQTHlnTmEvTlkvZVJDV2xCRjRNbUFJVmRnaG16MHJJZkt2QXJEcjYz?=
 =?utf-8?B?ZTdIZUczUzhuTG5XOXZwVC9rbkxvRncxQTlVNnFWcVVOV1BNV1R2TkZhNzBt?=
 =?utf-8?B?WmUyV1BMTmNLNE5vR1VXM0k4SXlwRDNOdzhwam9lK1F4WkdobGdzOGIrOVFr?=
 =?utf-8?B?eFZ4QkVHZDNKY2h3VVMrdm1NQ3RlYmlBN2FjZzhFQTZ2T2VTZjV2T0NwN1pS?=
 =?utf-8?B?L28yd0VWMmFFQmUwOXhXNlczWFZFd2VDNVB0eFhzZk5WRFZKaCtBaUhRV3NU?=
 =?utf-8?B?SlZhYmJHaXhnWjBianROL0NZMEg3aWdxKzVtMzZadDdLbGljblJsMmI1N21x?=
 =?utf-8?B?Q3o5bjBzZktJSHQxeXFFdXBBcHhlZG4xV081a1J6dVFVNEZWSis3TzhFOVBR?=
 =?utf-8?B?YmRSMDBGQ2N5c2RJYVFrdVBKbjVsamg4TFVyM3AyUWIrWUhpNlJDOE9JQkJF?=
 =?utf-8?B?SVFPK1NJbkU0QnFqRHMzTG1TcUt3dWZrcGQrVDlHRkFVc0wvZkw2anI0Qnky?=
 =?utf-8?B?TUFURDFtaWNkSFd2OTRjSmljbFgwNDhaYUY4enhTQVp2bitWWnR6UzBiZjc4?=
 =?utf-8?B?QytYeHkvYXFXN3dsdVAyaEVxUnlSR1dHdU5YTExwUnpJMEhDVHRuY0pDNExi?=
 =?utf-8?B?b1NVYzE2cjFTeDdwQ095TEM1Y0JEQk1vK1J6aXRPNzY4dVdjbG1pazF1QzJP?=
 =?utf-8?B?Ty9kOTdubGtHTER4N0lHaFZkUXQ0cktKSHR4RytId0NxQmVBcEhBWnU0VzBF?=
 =?utf-8?B?dEFGam5WNjNuTkZaYkdxK0lmcmkzU214U09seEZSVVVEejlqc2NkN2NqSVdG?=
 =?utf-8?B?M2poL0RIcnQ2N0lpbmo4dXNIaXpENEh6ZDE1Y3BNTGV1NENROS9HU1VLZkI2?=
 =?utf-8?B?bmNiemdXUGJoNUc0YlA1UnAzdDhFVFdzelJ1bVpPUlZwbE5BSGpTWWd1SnI4?=
 =?utf-8?B?aDJCcDJYVEFYTCt5VjUxVDZTV0xndjR3Znh3cVJGRTFieU0yRy8zYWJYbWIw?=
 =?utf-8?Q?Pem864fMYlgq1UihHgS/ods=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlFjVlEzdW5mck04eFp0RlpYemxxODRMcGxVMFJuSE1qMUpmUXhqZWMrNVNh?=
 =?utf-8?B?VGZkaTFJOW1TTDRqUkhrQkhvbzJPdVB5T2d2U3ZoaHI3ZkJ6a1ptVk9QQStu?=
 =?utf-8?B?eFozMWxtS1BtbmJuNGNwdmlhS1lKN1V6NEk3ZXl3NERYWGE4ZzlCLzhONDQv?=
 =?utf-8?B?YzJFWWVTN1VPdnU0R05MOEZnOUpaV29QVXY1V3hSa0dkTjVjdHBEWXF3azE1?=
 =?utf-8?B?K2FYOVhsSzdZWkcvUDNjT3g5OGtFZG42UHY1dHMxYWUydjRzWFV1UnpwV1F2?=
 =?utf-8?B?NW4yVjMyYkhmWTcyTHN5VmdqWmp1elliRlB1N3FWM21PR0hRY284NUZrK0xL?=
 =?utf-8?B?bVZTR0tSM05aK0FHUXJaMlhPVnM2aFBtQko1dkhPZ0VpU3NyWE9SdDhCUVR0?=
 =?utf-8?B?aUNveXZ2aWJ1dEdVb21wVVFsaVRXUzJQYUtVRThQVzM1MVQrZHh0SS9yQ1A1?=
 =?utf-8?B?NXAvMC9udHVMdjkrWlJtYTRRWVFBZnBjTGpodW9jdDB4Z3dUN0QrS2d2RkhR?=
 =?utf-8?B?SmlRbm1lMzJrc1ZtZTJhK3FHUWU1cWtNYUtlL0kybkdKUmJGRVJiZWFFRDky?=
 =?utf-8?B?RllNV2lyby8zaS9SVEtYYlZScVEweWlwcFlrMmZCTmxxbGUxcEhtdThsNTV4?=
 =?utf-8?B?RUx3bnBtNmFrVmp5V2pBeFE1bkJ2d2M1bEZaV3NnRlVsbFlXL1ljbmMzcVV6?=
 =?utf-8?B?YThhT3h2YVA1UGNnODkvQ3FVR1dZbWFVbXFpNGROL3kwVjRwRjk3VmNZaUpk?=
 =?utf-8?B?bnc1aDBhMGl4ZHc4VldiTUk4ekh4R2dXcyswY25CbjNLNTBsTXFPcWRndVNQ?=
 =?utf-8?B?cGhFcFdFU0w5U1VpSC9DaTJvVFFHdDEyb2tqOTIyV1VIanQrTVRJRkJTTTZv?=
 =?utf-8?B?aG9qMWw3VkJqQ0lySmlyaGJ4ZmRTWkZpMEgxbnFtaE8rTjhRY0NzM3VyRkVy?=
 =?utf-8?B?bUNkZS9YMlpydGdDUmJ4VWdDbjM3SDI0TUVDWnRZZitiWWV5NXlHWGhSYm1u?=
 =?utf-8?B?R2hPTVNDdnhPL1ppU2dSWmdzQlVZbWFZckR2UGYzMGhaZ1JxNnUwN0lzVko2?=
 =?utf-8?B?WW5ueHpZVE5BUDVOVGc5VVFJVFNUR2xGck9xVERNek5RUW1sNVlRbU16YUJh?=
 =?utf-8?B?TVZ6LzhoVVJQUjI0VzB0MkZCNlJYa21NN0YwbHlYSmtOSmh4UzhDT0tJZk1h?=
 =?utf-8?B?QzNGNC9DQnk1RFhoNE1mVzNFbStxYzlIc2tUeDNFc2ZlLzZEVk9GZ2ROcDY4?=
 =?utf-8?B?eERlZGVtTnFWc21PM1QwV0tGRWRGV0VuV3RKVXhOa3o1bk0wbmtFbThreTNx?=
 =?utf-8?B?blRMQnZBOWJmd2xJYThsZWU0TCtqbUc0dTlvei9xenV5aVk0YVVVb3VWdXE2?=
 =?utf-8?B?U0NvMk5sZlRtK3pxVGt2YTRYSjZMQW1KTGszcTFJRFVqYlZNNnE4RURlVWpQ?=
 =?utf-8?B?bVdGQy9wR0dlU09WRWxNTUMzNU9iaTNncTBZeHNXbVZuSlYxZ0swbDVWdHAz?=
 =?utf-8?B?UGhIUXZCcXZXckpia2VhNDBRbTJrUlRCRzgzZzg4ckVpVFZkUHRNaGgzOS9n?=
 =?utf-8?B?bkNFRDdYUjU5K2FqUFdxLzhIdUdUc1N6T2RIRnd2bEhqczdIekdUcDM5TWtp?=
 =?utf-8?B?SmVET1BpMXBhd1Z6TXdES1NNaEg2eEFuaENlRzlHeHJUdnhiT0tvejViRVRt?=
 =?utf-8?B?elQ5dm9INzFQM2UxRWFhcjdETTVHbHZLSDZRWmJlS2dxWlg3WE9salNhRUVD?=
 =?utf-8?B?MDJ0SVg0MDRxTHh6ZXBpMEhnRFQvRWQ3cnI0T2pZV0QvTGFULzlDTkFYZkRU?=
 =?utf-8?B?b093UEpQK0w3QXdXTjcvSS96dWxQWXlMNjdPYkFLelVWbnFvR09YZUxoMHl5?=
 =?utf-8?B?T2tNRE5xSm96NTM5aUdUblpNZTM5UXJJYXlmZG5Qdnd3M0JBUnRVQ09ITzhN?=
 =?utf-8?B?Tk10aEx0NmcvMGJOZE0vT3hmZ3h6WnZwMzNwaEZ6cE1wdDd5Smd6QzNsaWhO?=
 =?utf-8?B?cnB1a3BMV3NDV1RCNE8rUmt4MHhlTVU1SmEwc2ZRTFdEQjBZUElNS3hMY0dG?=
 =?utf-8?B?L2MwczNxd1hOMlVGUEVYbHhoeDRDemp0Q2ZWMlNqNlA2SnRhUC9GM0lXVGNW?=
 =?utf-8?B?Yk9WYjRRSDMyNk9MNlpjMkl6N29UYVJ1Nk11R09VaFlXbUR3UkNoekhYd2Jj?=
 =?utf-8?B?WDJoTWlPVVRZcnRUdkRKdkhpcnVWNm9rNitEQlR6UFhob0hKT3l3OVFad2JW?=
 =?utf-8?B?cXhubnpiYml6VjZBUGlvVjA1SUtxZ3AvK05hZk5uK3lJNDJxQUxxNlR1aEdj?=
 =?utf-8?Q?uLV8/8mE5pGINeOLwp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d11583a7-7d27-4c04-8fea-08de5382c4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:37:04.4459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fo+jJa5rfkQvBpybjoEqNRuHpHRHYEEG0t1eeFB1cI+zlTWr3xwzMJk6yKGmwKTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
SmFudWFyeSA4LCAyMDI2IDY6MjEgUE0NCj4gVG86IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT47IFNpbWVrLCBNaWNoYWwNCj4gPG1pY2hhbC5zaW1la0Bh
bWQuY29tPg0KPiBDYzogbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
djIgNC81XSBydGM6IHp5bnFtcDogcmV3b3JrIHNldF9vZmZzZXQNCj4NCj4gQ2F1dGlvbjogVGhp
cyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIN
Cj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciBy
ZXNwb25kaW5nLg0KPg0KPg0KPiBzZXRfb2Zmc2V0IHdhcyB1c2luZyByZW1haW5kZXIgb2YgZG9f
ZGl2IGFzIHRpY2tfbXVsdCB3aGljaCByZXN1bHRlZCBpbg0KPiB3cm9uZyBvZmZzZXQuIENhbGli
cmF0aW9uIHZhbHVlIGFsc28gYXNzdW1lZCBidWlsdGluIGNhbGlicmF0aW9uIGRlZmF1bHQuDQo+
IFVwZGF0ZSBmcmFjdF9vZmZzZXQgdG8gY29ycmVjdGx5IGNhbGN1bGF0ZSB0aGUgdmFsdWUgZm9y
IG5lZ2F0aXZlIG9mZnNldCBhbmQNCj4gcmVwbGFjZSB0aGUgZm9yIGxvb3Agd2l0aCBkaXZpc2lv
bi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyB8IDMzICsrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDIwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXp5
bnFtcC5jIGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGluZGV4DQo+IDY3NDBjM2FlZDE4OTdk
NGI1MGEwMmM0ODIzYTc0NmQ5YzJhZTI2NTUuLmQxNWMyNTZlN2FlNTYwNThkZGMzODg0DQo+IDlh
ZjY0MjRjZDI5Yjg5NjVlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMN
Cj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+IEBAIC0yMDgsMTMgKzIwOCwxMyBA
QCBzdGF0aWMgaW50IHhsbnhfcnRjX3JlYWRfb2Zmc2V0KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4g
bG9uZyAqb2Zmc2V0KSAgc3RhdGljIGludCB4bG54X3J0Y19zZXRfb2Zmc2V0KHN0cnVjdCBkZXZp
Y2UgKmRldiwgbG9uZyBvZmZzZXQpICB7DQo+ICAgICAgICAgc3RydWN0IHhsbnhfcnRjX2RldiAq
eHJ0Y2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAtICAgICAgIHVuc2lnbmVkIGxvbmcg
bG9uZyBydGNfcHBiID0gUlRDX1BQQjsNCj4gLSAgICAgICB1bnNpZ25lZCBpbnQgdGlja19tdWx0
ID0gZG9fZGl2KHJ0Y19wcGIsIHhydGNkZXYtPmZyZXEpOw0KPiAtICAgICAgIHVuc2lnbmVkIGNo
YXIgZnJhY3RfdGljayA9IDA7DQo+ICsgICAgICAgaW50IG1heF90aWNrLCB0aWNrX211bHQsIGZy
YWN0X29mZnNldCwgZnJhY3RfcGFydDsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgY2FsaWJ2YWw7
DQo+IC0gICAgICAgc2hvcnQgaW50ICBtYXhfdGljazsNCj4gLSAgICAgICBpbnQgZnJhY3Rfb2Zm
c2V0Ow0KPiArICAgICAgIGludCBmcmFjdF9kYXRhID0gMDsNCj4gKyAgICAgICBpbnQgZnJlcSA9
IHhydGNkZXYtPmZyZXE7DQpQbGVhc2UgZm9sbG93IHJldmVyc2UgWE1BUyB0cmVlIHN0eWxlLg0K
Pg0KPiArICAgICAgIC8qIFRpY2sgdG8gb2Zmc2V0IG11bHRpcGxpZXIgKi8NCj4gKyAgICAgICB0
aWNrX211bHQgPSBESVZfUk9VTkRfQ0xPU0VTVChSVENfUFBCLCB4cnRjZGV2LT5mcmVxKTsNCj4g
ICAgICAgICBpZiAob2Zmc2V0IDwgUlRDX01JTl9PRkZTRVQgfHwgb2Zmc2V0ID4gUlRDX01BWF9P
RkZTRVQpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsNCj4NCj4gQEAgLTIyMywy
OSArMjIzLDIyIEBAIHN0YXRpYyBpbnQgeGxueF9ydGNfc2V0X29mZnNldChzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+IGxvbmcgb2Zmc2V0KQ0KPg0KPiAgICAgICAgIC8qIE51bWJlciBmcmFjdGlvbmFs
IHRpY2tzIGZvciBnaXZlbiBvZmZzZXQgKi8NCj4gICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0KSB7
DQo+IC0gICAgICAgICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0IDwgMCkgew0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICBmcmFjdF9vZmZzZXQgPSBmcmFjdF9vZmZzZXQgKyB0aWNrX211bHQ7DQo+
ICsgICAgICAgICAgICAgICBmcmFjdF9wYXJ0ID0gRElWX1JPVU5EX1VQKHRpY2tfbXVsdCwgUlRD
X0ZSX01BWF9USUNLUyk7DQo+ICsgICAgICAgICAgICAgICBmcmFjdF9kYXRhID0gZnJhY3Rfb2Zm
c2V0IC8gZnJhY3RfcGFydDsNCj4gKyAgICAgICAgICAgICAgIC8qIFN1YnRyYWN0IG9uZSBmcm9t
IG1heF90aWNrIHdoaWxlIGFkZGluZyBmcmFjdF9vZmZzZXQgKi8NCj4gKyAgICAgICAgICAgICAg
IGlmIChmcmFjdF9vZmZzZXQgPCAwICYmIGZyYWN0X2RhdGEpIHsNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgbWF4X3RpY2stLTsNCj4gLSAgICAgICAgICAgICAgIH0NCj4gLSAgICAgICAgICAg
ICAgIGlmIChmcmFjdF9vZmZzZXQgPiAodGlja19tdWx0IC8gUlRDX0ZSX01BWF9USUNLUykpIHsN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZm9yIChmcmFjdF90aWNrID0gMTsgZnJhY3RfdGlj
ayA8IDE2OyBmcmFjdF90aWNrKyspIHsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoZnJhY3Rfb2Zmc2V0IDw9DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIChmcmFjdF90aWNrICoNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICh0aWNrX211bHQgLyBSVENfRlJfTUFYX1RJQ0tTKSkpDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQ0K
PiArICAgICAgICAgICAgICAgICAgICAgICBmcmFjdF9kYXRhICs9IFJUQ19GUl9NQVhfVElDS1M7
DQo+ICAgICAgICAgICAgICAgICB9DQo+ICAgICAgICAgfQ0KPg0KPiAgICAgICAgIC8qIFp5bnFt
cCBSVEMgdXNlcyBzZWNvbmQgYW5kIGZyYWN0aW9uYWwgdGljaw0KPiAgICAgICAgICAqIGNvdW50
ZXJzIGZvciBjb21wZW5zYXRpb24NCj4gICAgICAgICAgKi8NCj4gLSAgICAgICBjYWxpYnZhbCA9
IG1heF90aWNrICsgUlRDX0NBTElCX0RFRjsNCj4gLQ0KPiAtICAgICAgIGlmIChmcmFjdF90aWNr
KQ0KPiAtICAgICAgICAgICAgICAgY2FsaWJ2YWwgfD0gUlRDX0ZSX0VOOw0KPiArICAgICAgIGNh
bGlidmFsID0gbWF4X3RpY2sgKyBmcmVxOw0KPg0KPiAtICAgICAgIGNhbGlidmFsIHw9IChmcmFj
dF90aWNrIDw8IFJUQ19GUl9EQVRTSElGVCk7DQo+ICsgICAgICAgaWYgKGZyYWN0X2RhdGEpDQo+
ICsgICAgICAgICAgICAgICBjYWxpYnZhbCB8PSAoUlRDX0ZSX0VOIHwgKGZyYWN0X2RhdGEgPDwN
Cj4gKyBSVENfRlJfREFUU0hJRlQpKTsNCj4NCj4gICAgICAgICB3cml0ZWwoY2FsaWJ2YWwsICh4
cnRjZGV2LT5yZWdfYmFzZSArIFJUQ19DQUxJQl9XUikpOw0KPg0KPg0KPiAtLQ0KPiAyLjQ3LjMN
Cj4NCg0KVGhhbmtzLA0KSGFyaW5pIFQNCg==

