Return-Path: <linux-rtc+bounces-5522-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25404CB0E65
	for <lists+linux-rtc@lfdr.de>; Tue, 09 Dec 2025 20:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9CBF30865EE
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Dec 2025 19:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686B3302756;
	Tue,  9 Dec 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CERjjIwM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4327C162;
	Tue,  9 Dec 2025 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765307003; cv=fail; b=omW4A+K/g0ByyDeHM9uE+G7Whyv/CJuyDfTFvO3XlFJkwseEv6v0ZeJfu4KjOHbYvBikpZ22KWAukqBYC9exfqHImU8KD2t5nE3StgnB6kA68wMwP68Upijx/5OeVZAFFWXYoqEeUlMH/nmf9KofmkO9a7LXVEFySCI/40XEIMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765307003; c=relaxed/simple;
	bh=cez2t4SpU2hF1tyHJzEb2h800PGHtd30HqkvBXrs0ms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DyYlvi/1L29ULj/6LZ6UHJuN4lhN0haQVoz9ocNtQDcICG1Jekly7pc6uQSRHwMBI5EwWMIdOjmoC4MfpUqaX8vy5Et185fDVtng45lPkoRvJ5y7crdeFLFQZSgWQ56IY5iNhQdavPHRdv8QNvQCIKl1jL4c9YU2Scsuxm7kG+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CERjjIwM; arc=fail smtp.client-ip=40.93.194.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7f//GUciGEwMULfJdkQFRAPP4svH0nZqNp+AnP7VpG1jZwGKTb8MQFiIAZ/FRQZPIwR6z3dKgll4WdX1lk0kbtfRXShm2BuUOImJGPcjJQZ369DigJZa4QF+vWyP0NPaXh7g36t/CDbws2lzb2cLFEaMLuovtTBhKewbwv2HHkbqyC25/4nkagiQ9ZH90kdrNPhsgvM72bbCoi4DFtShZIWN/wc1At4Hp15T6hS96mxTwgDAQ5kJbtBOJ7cjG10WjpAGTYEj2nGlh88kdYrC7yOTrebmw537BfJn9N1B3gTo4TgpodafjRv3wMYhxAZ9bH1dcPIGK8CXr9GYjMhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cez2t4SpU2hF1tyHJzEb2h800PGHtd30HqkvBXrs0ms=;
 b=jQrFmOIbrgQDAg/n24zpz1ufeARECQOE7xqoh25FS+V+sgE3IlXjRlN4jGNyfXHBfDrSEgw6XDrxzi/vmqG9qT/7Dc/GeW2Ec0njRWmWv6EJG62/ffKiYE5VNMSjmJM3aqMe0uskXlczyxNgoCNk03t0VrrogUw1HnRFG+Gv9iIvR3t+/InOX05sZJFwyGmsjPhHAT4Mxhum5v9gzAqLEgTsx876Ib25FSS1CEdccveYpjSgCkqfpG+B0FLyk7+hrG5rYjsoxBHv3lUy2tfhB0Cxr+E24FQrNyJWtFpME7FbaGU5TEfI6IzIN03OyzUxanAubhYLIz3wgtvb5yE0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cez2t4SpU2hF1tyHJzEb2h800PGHtd30HqkvBXrs0ms=;
 b=CERjjIwMWBPCTpBbUPwXNBvzucwbNUSZHBwSqMvzWLRPoVpqRxQYR9d018ECrV8kGBsb89BbWGEUqBSPiANAzS41L32YTxG7acgMqcwByo03TCayFqthqmXz+kTXnapmSg9mTC5ZY+AO+KR1SBrhs5hcL+sgx4uYcjz/O5IqKdg=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by CH1PPFDAD84AB72.namprd12.prod.outlook.com (2603:10b6:61f:fc00::627) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Tue, 9 Dec
 2025 19:03:02 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 19:03:02 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/4] rtc: zynqmp: rework set_offset
Thread-Topic: [PATCH 3/4] rtc: zynqmp: rework set_offset
Thread-Index: AQHcYsIwYXkjrWA8MUCqh6MsIZhrlLUZsD6Q
Date: Tue, 9 Dec 2025 19:03:02 +0000
Message-ID:
 <LV5PR12MB98045BF8A85640F924BCFD4492A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-3-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-3-33875c1e385b@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-09T18:38:06.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|CH1PPFDAD84AB72:EE_
x-ms-office365-filtering-correlation-id: da3f1447-c788-4da7-45f9-08de37559398
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0lyR2JYSUJNbkR2MWlQSXlWVVF0NmE1Vlo3UW1BSXBscDlSVDdJamx4cnNp?=
 =?utf-8?B?MUhXNWU5YzZrL0p2ekc5SG1SSkd0Wnc0TDN0Mjl5bFlvQXlaT0N3cU1oSVRI?=
 =?utf-8?B?QjV2eGZqRUM5M1FLR1dLeEJvQ1dZTHBaVHZqbXRPK2tvWkd2RFkyQWoyT0li?=
 =?utf-8?B?SktWTEhuWFNzZEdlb0NrRjYrcFpOaUs2ODZOM0ZTU2V0NVhVdkdrTVMzQTdZ?=
 =?utf-8?B?VEJ0d3dTbDN6Ni84NTZEblVEb3VnYjVuZzU0QXArWjhZaFIxckdMWlVtYStL?=
 =?utf-8?B?c2U4UE40VFdDWkNEcSt6L29TWWlGdWh0TEIxYWJQQk5MK25NTHJXb0NTbnNt?=
 =?utf-8?B?bkxLTDlKbEtCNk1sVTM5R2RuT1lpU1QxWGx4aTB3NWpLdjF1bnVkUVlxSExG?=
 =?utf-8?B?VGxpUkFZbzdvOE93U1A1bWRnYytiTG55U21IWWtVc2MwTzNCK1ZSWFdiNVN5?=
 =?utf-8?B?WUVUOEttU0VRVi9pcjVvZDkvV2k0aHZqTEE3NE94VDltOWlIRWdNRGU1R04y?=
 =?utf-8?B?c21nN0VhYU1zOVBVVy9URWp6bUJJN2JmUzYxRFd6N1ZrWHV1NlpNNkJRaHds?=
 =?utf-8?B?RGhMYUFJR0tNZmovUzA0TElsNitXVlFUWVUrQjU0WFZuYkVxQjBPQlRxbURQ?=
 =?utf-8?B?dnBOR0VMZmRrYWdCRmlETG9GMXAyckgyUC9vT0Jzcy9FdFg3bjN3a0o2RXFa?=
 =?utf-8?B?SHBtUEZuYUcrVENueVVMa3lKVlVIQ0FhQ29nL2V5VGtSUnlxU055QXVWMzJn?=
 =?utf-8?B?MzZZMzBMZ1l4dlpWQjNIS1NiN1BOQWhqd0E2STNESnJlTndNanlJdzhOb2Ru?=
 =?utf-8?B?QlZZVFZoYWZzZWJROFNoV1hkYmlGelU3REFxOEJQenFmUU5ITVc0S3ZUVE1G?=
 =?utf-8?B?ZlFNdngvY2ZqTlVnZDI1eXM5cWswWDZkbndLRUQ0cTk0aEZOclBlenlTY0lm?=
 =?utf-8?B?NjVsaEt5VVRINytwbDAvNEQwbU5xTGRSaFhUbHc5MVVvdlA2dk13cyt2WCtj?=
 =?utf-8?B?Q0dUZ0RKTEJ6dUNjUE5mN09ubDJHUVV3aElMWmtuclAxcFlGUVEyY1hPcHRP?=
 =?utf-8?B?Qk1uckYraFpiRVcvYUN5VkYvQjJyd21yTEVuTkhlcktqR2lpMGs2OWwxYjhu?=
 =?utf-8?B?aWRYS3R5emY0Z0JOa0M0T3RzcFpSSGZUM2hwN1ZZejI5MlE4V2FuN0NTY2tG?=
 =?utf-8?B?dVpXdUgrR0JwdVFpY08wWUJWbEFjblFyQWxVRGZlNW1vNml0L2dlY084T0Nx?=
 =?utf-8?B?cG8yck9wRjNqVVFFSWFOY2hBUHIwR05WRS93Ny9uZHZCWkYrbnprN1BKNXRG?=
 =?utf-8?B?RThJMW5YZkprMWRjZjY4cW1BMWgxbVpzSHowME52MFptVVdaUmxBaHhxNzdr?=
 =?utf-8?B?OFptY3BreTAxc0o4QUVwZmEwajRscTJDM2FIV1UxQ0x4OTZ1WEdKT1ZHRUdq?=
 =?utf-8?B?ZjlhcHFYM1NwSmVjQkhQUWpLRU5vaEFWOXlSSC9XeXRVcnpEbm91VVZjTlVD?=
 =?utf-8?B?M2VYZjZTbFNncGxBUTU0YzdTaUVyMyt1U25TaUNPUEdxQXFoWTNMVWJRd2kz?=
 =?utf-8?B?YVdHSXpEQkY4QkZ4VW40b1ZYY1R4eXVGVU41RTlnSHVaamYvTnBlc1prTjZL?=
 =?utf-8?B?a0phZHZnQUFSejBETzEyV0R3WUNLK2xuMDkwcnJDcWZZekk4U09ZRDdYeGwx?=
 =?utf-8?B?T0ZTZGM5cUNQcWw1ZE9FZERqdk5qNG1qUllTejBKb1d5dzdXUVVRL0xwMWJD?=
 =?utf-8?B?am5MRWhjOWJ4WE8vS2l1aTZjOUhHU3hoRkRoaVRKVWdvQ2p1T1h0MUI0ZFBX?=
 =?utf-8?B?bFlXWURjcjJpZGtRaEN6dHdGVGNxQkJBWHBnRlA3UmpUTlV6S3hzRnZ1MndU?=
 =?utf-8?B?UWx1RHdwTFN0OE1oQkNtMDNneFdhQTVzVVpDOTc2V3krVksrdHZtVEJHYUJy?=
 =?utf-8?B?TFlOVm95ZFErSnhEZGJTTjNZZW0rWHB5WUhNT1hWR0hIVytjUzlNc1hSWklv?=
 =?utf-8?B?WnRMR09lNG5ySC83ejZYZ2J1WmwwUFdoVGUzWUUycjRIV2t3eUhLWUZuUkt6?=
 =?utf-8?Q?/jRDS0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmcwSGYzR3VGTmhkTEtYK3RBTDRiSWVFYmYxeXNoR085Q1hYakxZRkQvNUha?=
 =?utf-8?B?YlJ3cHQ1Ulh3VWNkbCtXclBmQnk1TXFmUGNXRTdhUVJrNjlEWkVhNUpmVGk4?=
 =?utf-8?B?Qk1jUHlFZ2Q5RmNiQ0xFbmNBQ05Xcm1uOHdobVh2RHFMZUFCM3JRN0p6aVdl?=
 =?utf-8?B?TVZ0NGh4U0pHTGRxQ0pGbXdFSHpNYkZCNjNHTzhFWG9WVzRscU42QnlxZWJl?=
 =?utf-8?B?MXBrL0xUOXNFUWplL1pnUWIxbFU0MFlHZ0VXcEp4cm9TU0NrYXp0bUQ3M0d2?=
 =?utf-8?B?MllXRGlYcVYveWlCUW04QWlERCtEWU91d0RKSTVRejRKcTFjdFlKcjZXWmJO?=
 =?utf-8?B?aHFYZldYZXZmOVZqYkcza0xMeTBEY296NDkrcS9aMnc5cm9MRGIzTEVpaVdY?=
 =?utf-8?B?enE0Slh6VVdJM3N3eVFVRVpjNGg4QTd5dVBPSjY0L3JJNlpoS3JITVlQdUFs?=
 =?utf-8?B?bzMxcS9hSkI2OFlOOXU1dTdLUGZiOGw3Vy9lRW14SE1TL1hyZ3hPekJXeWFh?=
 =?utf-8?B?M0g0bU9JeHZsR0FGdlZEY1Z0WnZXWEt5MXFiWDdsUVQxOHJKejZUQmUrM3ZU?=
 =?utf-8?B?TUVjN2RxcWZJUlhMek9DTTdhMzMvUEJJU3p6TzZJb05QNmh3VGxibThTdWhu?=
 =?utf-8?B?dStqd29uT3BJN1BSVURZd1hWbUNDRDdNN09LZW5peFVlSFAvT2JYeVdabm82?=
 =?utf-8?B?UThWbzRvdzF2NGxaRFR5L1hGQXdmZVh4M3FiZTRLdHJrbkRSWDBEZVdzTTg1?=
 =?utf-8?B?eENzczl5eWxKekVvaTVydGpLZzBGSHhLcEFIYkJrc05qWUlSSG96cm9hWjYr?=
 =?utf-8?B?MzVWL3RZa2JhMHFuVkx6VWowRm53VkpBOHIvaTRDS1ZTTHo2NXhPcFFRNkQ3?=
 =?utf-8?B?aWNyTmtCVFllTC8xWEEwY1NUNlJHVFVpOWZEWUE5VUpnQ0Z5YTQ3ZGZ0NXBB?=
 =?utf-8?B?a1k0OEVRVzVoL3lDeGt0MTdZa2RtWGQ0LzBTMlppbSthdGs2b0JBdXEzMWw0?=
 =?utf-8?B?Z0VheVlpbDlnM2RkNUlCSytoN3RvUWR2NGU4TG1HNm5ibG0zVVNId3RvaCsx?=
 =?utf-8?B?MURxRHJKRDdVWmhla2hiUjRVT3Y2VHhRTkRmMFRTd0ZJN1hBMFpSN2NFNzVj?=
 =?utf-8?B?U1dnTkwvc2s4VmpEVUhVMkpRcEwzRjJYbXF5K2FyY0JmRWVacml6WjN6VlNG?=
 =?utf-8?B?eEVWSVZRN2tYUkNvUExidjZnL0Y0L0RDNzh1K3ZXQmhTSjhmYldVZ0YwR1ZH?=
 =?utf-8?B?ZHhRYnVqUUVyNDFRb2daUnkrSU9Wb2ZPRzhCRzZpY2ZWWDhoZ09OditXQTFy?=
 =?utf-8?B?WU9ZRmo3bmxTbWFieFJvNjBPbzFmV0swVU9KRGV5UUQ3dkQxTERXazBDbVo3?=
 =?utf-8?B?SFA0YnlWd25CcmZPN1RaOW9JOXp3NzBMa2x2bEY1TzJnU1lPMjYwOU5kem4v?=
 =?utf-8?B?dU5CZWcrN2lGVnZCTzE3V2hKZ1dCMTBiMFJ4dWFjQ2dJVTJqVE5wZ0FHU2Ur?=
 =?utf-8?B?eU8rQlJSTFl6ajQ0QS9XUkJoU1VBVlU0R2pTUGZtN1l4Mld2a2VLN0lMMi9R?=
 =?utf-8?B?TEZMVWFzaTdPSk9FdGUzU0VzL3V4ZW5ER05WZWRLL3huSy9LNGN5dU8xZUZn?=
 =?utf-8?B?cUtNYm9Pd2FLcTNIb1BnRWJuRWhYRHRJNzB2MXk2YXZNUVNNa2l5RFd2dHlq?=
 =?utf-8?B?TmtQNzdudmlyWCtmRHk5cmxGZ0VOSHF4NXVhUU5YeVRlZGpTTWhRaXNubHVL?=
 =?utf-8?B?cHhCMXloRlNtYUxHTjJMWDlPMHhRM2RXbmVDL0t3c3hsb2pHY0FiRnNXMjdG?=
 =?utf-8?B?V2VpNm9WcVA4bUhRU09Ib2h1L1Y0bjIxLzJ4RndNVVNCbGN3RERqL2wyRVBP?=
 =?utf-8?B?bisvZmo5ank2eXNiOE1CN01jVWQ5YzhVYXFhMlI0QTNuVmViNjdFVWtmMEZj?=
 =?utf-8?B?c0pPVzUxT0VwUmREb3k3dDd1dFBES2ZobUkzM1dVaVpQZ1htRmN6UTJBQU5D?=
 =?utf-8?B?d1B6c2ZNcVlqazhOY00xODhNazJmK3ZsYWw3dlpxS0pCTytHbytTbWs0ZWlr?=
 =?utf-8?B?RXEvdkFDSXdjTVRMOVJBVmpucTVqSU9HWS9PL0ttbDVXWW1obWsxay83ZXZi?=
 =?utf-8?Q?vwOE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da3f1447-c788-4da7-45f9-08de37559398
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 19:03:02.0671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYM48uuVHskzYzIFG7L+SDQ5UXwqpBuNVJyVvMCHs3UIfn+rq/0Z/zkbJQbaCmZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDAD84AB72

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEsIDIwMjUgNjoyMCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBU
b21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAz
LzRdIHJ0YzogenlucW1wOiByZXdvcmsgc2V0X29mZnNldA0KPg0KPiBDYXV0aW9uOiBUaGlzIG1l
c3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Blcg0KPiBj
YXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3Bv
bmRpbmcuDQo+DQo+DQo+IHNldF9vZmZzZXQgd2FzIHVzaW5nIHJlbWFpbmRlciBvZiBkb19kaXYg
YXMgdGlja19tdWx0IHdoaWNoIHJlc3VsdGVkIGluDQo+IHdyb25nIG9mZnNldC4gQ2FsaWJyYXRp
b24gdmFsdWUgYWxzbyBhc3N1bWVkIGJ1aWx0aW4gY2FsaWJyYXRpb24gZGVmYXVsdC4NCj4gVXBk
YXRlIGZyYWN0X29mZnNldCB0byBjb3JyZWN0bHkgY2FsY3VsYXRlIHRoZSB2YWx1ZSBmb3IgbmVn
YXRpdmUgb2Zmc2V0IGFuZA0KPiByZXBsYWNlIHRoZSBmb3IgbG9vcCB3aXRoIGRpdmlzaW9uLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIHwgMjkgKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxOCBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBi
L2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBpbmRleA0KPiA3YWY1ZjZmOTk1MzhmOTYxYTUzZmY1
NmJmYzY1NmM5MDc2MTFiOTAwLi4zYmM4ODMxYmEyYzRjNGM3MDFhNDk1MDZiNg0KPiA3YWU2MTc0
ZjNhZGUzZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+ICsrKyBi
L2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiBAQCAtMjA4LDEzICsyMDgsMTMgQEAgc3RhdGlj
IGludCB4bG54X3J0Y19yZWFkX29mZnNldChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IGxvbmcgKm9m
ZnNldCkgIHN0YXRpYyBpbnQgeGxueF9ydGNfc2V0X29mZnNldChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGxvbmcgb2Zmc2V0KSAgew0KPiAgICAgICAgIHN0cnVjdCB4bG54X3J0Y19kZXYgKnhydGNkZXYg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgcnRj
X3BwYiA9IFJUQ19QUEI7DQo+IC0gICAgICAgdW5zaWduZWQgaW50IHRpY2tfbXVsdCA9IGRvX2Rp
dihydGNfcHBiLCB4cnRjZGV2LT5mcmVxKTsNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgY2FsaWJ2
YWwsIHRpY2tfbXVsdCwgZnJhY3RfcGFydDsNCnRpY2tfbXVsdCBpcyBtZW50aW9uZWQgYXMgaW50
IGluIHByZXZpb3VzIHBhdGNoIGFuZCB1bnNpZ25lZCBoZXJlLiBKdXN0aWZ5IHRoZSB0eXBlIGlu
IGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gICAgICAgICB1bnNpZ25lZCBjaGFyIGZyYWN0X3RpY2sg
PSAwOw0KPiAtICAgICAgIHVuc2lnbmVkIGludCBjYWxpYnZhbDsNCj4gLSAgICAgICBzaG9ydCBp
bnQgIG1heF90aWNrOw0KPiAtICAgICAgIGludCBmcmFjdF9vZmZzZXQ7DQo+ICsgICAgICAgaW50
IGZyZXEgPSB4cnRjZGV2LT5mcmVxOw0KPiArICAgICAgIGludCBtYXhfdGljaywgZnJhY3Rfb2Zm
c2V0Ow0KUGxlYXNlIGZvbGxvdyByZXZlcnNlIHhtYXMgdHJlZSB2YXJpYWJsZSBvcmRlcmluZy4N
CkFsc28ga2VlcCB0aGUgZnJhY18qIHZhcmlhYmxlcyB1bmlmb3JtIGluIGJvdGggc2V0IGFuZCBy
ZWFkIG9mZnNldCBmdW5jdGlvbnMuDQo+DQo+ICsgICAgICAgLyogdGlja3MgdG8gcmVhY2ggUlRD
X1BQQiAqLw0KVGhlIGNvbW1lbnQgaXMgbWlzbGVhZGluZy4gSXRzIHRpY2tfbXVsdCBpcyBuYW5v
c2Vjb25kcyBwZXIgdGljaywgbm90IGEgdGljayBjb3VudC4NCj4gKyAgICAgICB0aWNrX211bHQg
PSBESVZfUk9VTkRfQ0xPU0VTVChSVENfUFBCLCB4cnRjZGV2LT5mcmVxKTsNCldlIGNhbiBmaXJz
dCB2YWxpZGF0ZSBvZmZzZXQgYW5kIHRoZW4gY2FsY3VsYXRlIHRpY2tfbXVsdCB0byByZWR1Y2Ug
Q1BVIGluc3RydWN0aW9ucyBpbmNhc2Ugb2YgaW52YWxpZCBpbnB1dHMNCj4gICAgICAgICBpZiAo
b2Zmc2V0IDwgUlRDX01JTl9PRkZTRVQgfHwgb2Zmc2V0ID4gUlRDX01BWF9PRkZTRVQpDQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsNCj4NCj4gQEAgLTIyMywyOSArMjIzLDIyIEBA
IHN0YXRpYyBpbnQgeGxueF9ydGNfc2V0X29mZnNldChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IGxv
bmcgb2Zmc2V0KQ0KPg0KPiAgICAgICAgIC8qIE51bWJlciBmcmFjdGlvbmFsIHRpY2tzIGZvciBn
aXZlbiBvZmZzZXQgKi8NCj4gICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0KSB7DQo+ICsgICAgICAg
ICAgICAgICAvKiByb3VuZCB1cCBoZXJlIHNvIHdlIHN0YXkgYmVsb3cgYSBmdWxsIHRpY2sgKi8N
Cj4gKyAgICAgICAgICAgICAgIGZyYWN0X3BhcnQgPSBESVZfUk9VTkRfVVAodGlja19tdWx0LCBS
VENfRlJfTUFYX1RJQ0tTKTsNCj4gICAgICAgICAgICAgICAgIGlmIChmcmFjdF9vZmZzZXQgPCAw
KSB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGZyYWN0X29mZnNldCA9IGZyYWN0X29mZnNl
dCArIHRpY2tfbXVsdDsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnJhY3Rfb2Zmc2V0ICs9
IChmcmFjdF9wYXJ0ICogUlRDX0ZSX01BWF9USUNLUyk7DQpJdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
YWRkIGNvbW1lbnQgdG8gZXhwbGFpbiBvbiB0aGUgbmVnYXRpdmUgb2Zmc2V0IGJvcnJvd2luZyBs
b2dpYw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBtYXhfdGljay0tOw0KPiAgICAgICAgICAg
ICAgICAgfQ0KPiAtICAgICAgICAgICAgICAgaWYgKGZyYWN0X29mZnNldCA+ICh0aWNrX211bHQg
LyBSVENfRlJfTUFYX1RJQ0tTKSkgew0KPiAtICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGZy
YWN0X3RpY2sgPSAxOyBmcmFjdF90aWNrIDwgMTY7IGZyYWN0X3RpY2srKykgew0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmcmFjdF9vZmZzZXQgPD0NCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGZyYWN0X3RpY2sgKg0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHRpY2tfbXVsdCAvIFJUQ19GUl9NQVhfVElDS1MpKSkN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICB9DQo+IC0gICAgICAgICAgICAgICB9DQo+ICsgICAgICAgICAg
ICAgICBmcmFjdF90aWNrID0gZnJhY3Rfb2Zmc2V0IC8gZnJhY3RfcGFydDsNCkl0cyBiZXR0ZXIg
dG8gdXNlIERJVl9ST1VORF9VUCgpDQo+ICAgICAgICAgfQ0KPg0KPiAgICAgICAgIC8qIFp5bnFt
cCBSVEMgdXNlcyBzZWNvbmQgYW5kIGZyYWN0aW9uYWwgdGljaw0KPiAgICAgICAgICAqIGNvdW50
ZXJzIGZvciBjb21wZW5zYXRpb24NCj4gICAgICAgICAgKi8NCj4gLSAgICAgICBjYWxpYnZhbCA9
IG1heF90aWNrICsgUlRDX0NBTElCX0RFRjsNCj4gKyAgICAgICBjYWxpYnZhbCA9IG1heF90aWNr
ICsgZnJlcTsNCj4NCj4gICAgICAgICBpZiAoZnJhY3RfdGljaykNCj4gLSAgICAgICAgICAgICAg
IGNhbGlidmFsIHw9IFJUQ19GUl9FTjsNCj4gLQ0KPiAtICAgICAgIGNhbGlidmFsIHw9IChmcmFj
dF90aWNrIDw8IFJUQ19GUl9EQVRTSElGVCk7DQo+ICsgICAgICAgICAgICAgICBjYWxpYnZhbCB8
PSAoUlRDX0ZSX0VOIHwgKGZyYWN0X3RpY2sgPDwNCj4gKyBSVENfRlJfREFUU0hJRlQpKTsNCj4N
Cj4gICAgICAgICB3cml0ZWwoY2FsaWJ2YWwsICh4cnRjZGV2LT5yZWdfYmFzZSArIFJUQ19DQUxJ
Ql9XUikpOw0KPg0KPg0KPiAtLQ0KPiAyLjQ3LjMNCj4NCg0KUmVnYXJkcywNCkhhcmluaSBUDQo=

