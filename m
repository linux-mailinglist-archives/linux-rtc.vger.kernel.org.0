Return-Path: <linux-rtc+bounces-5521-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB35CB0B99
	for <lists+linux-rtc@lfdr.de>; Tue, 09 Dec 2025 18:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA3133015EFD
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Dec 2025 17:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB14132ED34;
	Tue,  9 Dec 2025 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vX612Pvl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52F1A58D;
	Tue,  9 Dec 2025 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765301332; cv=fail; b=IYsur0EqT9QnzqCggLdoNIZbUc5Y/cEJH8FXwy1dkBZ5hsjBUEwtxGTEtwsg6sncFRzy5yX9FYGZ7DUmp8aBgokerDWRnaPnqx6IJOBjMto4zGrlHqAJAIKquXYHPZJyvoxBk/2MNq0mpfXZi6xR6840kL+xaqJkNkQTIxXwbm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765301332; c=relaxed/simple;
	bh=5myFVN9RxRiBxnumW/Y8iTwEVWdl3sPSYi4x9UvAkkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oe/1AtE2DZTPT/UvPQUoAcMlTIhzdM6pwJnvfxkOHeoPDJffLdcGr5tyNo5TgYOllfIAT1MbmO9wCcsIwRZJQqakCRGBViRT0GBtM/JsKqcw0OFPS9QbDEaFbG4U7O+U2FnpvIrwuHab8bPIENw1J4BP2DE0oRHaV0dc5V5hNeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vX612Pvl; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njwZ/oZ3Axf2WzJxrNSB6fMJPJSa0iKLIANb0yl4eU1BE7ihbxHmAZ29eOevkmnxCJOv5Y7qqP60lWc/2pVqXKUvgCt2s4kK6LH3l2E3dPzAogSUvd1cqPyrAL0NTQPTYlZh83Yt5Fd9vizufrc2QExHEGHPJEP3krmVIeQqujvQ0aRnI7gk03MvjG80QPLExIz1FFqLXqrdaK0gOVCi7bFZ+CGToYuUglDiaDKxGNCwCZE/DOsdzVIoiN9AmLpZ66ure6FkkapxN3qTS22TdXNUNH0P+WYl3tlODfhd/UCkj9UdEs/Ms3+QyDwdkyxRGp8GbRtsPOzoc9NkrzwceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5myFVN9RxRiBxnumW/Y8iTwEVWdl3sPSYi4x9UvAkkU=;
 b=n2bFoInkt0e/P8LdbmZ3FXG+46s4dS05k5VaKbxGvXfIas+j4rac0/S8G+EmENfiiUCMaxGyna5PDDlYmCZHkZkVrN/lNZ0ZtlcehdZDLbq7VJ2P4SERUWuGcT61S8aCdOewiRDcL1Zk8beQhO4dOe57cFtrU+8yJI+hlDRQolU2aSVKPvS0jf3cWcQHBHvFUVEXR8oJXCiZNkmgqJ3FtRBkjf9Q/PxS4txnNgiRfloc9hTF28j4VPRloN6x9y/o19Jf9sA2L9spgEPLeQ42eoRhDbuqeWSEQEyphOA2MfizWKZh1Y5cxXFEI9V3zTgg4wf5HqXrg/3CWbSWxRYP9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5myFVN9RxRiBxnumW/Y8iTwEVWdl3sPSYi4x9UvAkkU=;
 b=vX612Pvlh+JZ9Ec2ES6sdtYY33l6GvZo3VOvmxLTmxLQFjZgBDIyUfFvp6fhWmAx7vqMdop1tf98qJf3v/a0DTnVERTRZL9oWleejWs1cgRLfwc3kN9nQx6lm8KS7VqUMexjZa9R9gv3FWbiBP0x99lWE3ex4aWW60FpmrDaoPs=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 17:28:47 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 17:28:47 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] rtc: zynqmp: rework read_offset
Thread-Topic: [PATCH 2/4] rtc: zynqmp: rework read_offset
Thread-Index: AQHcYsGeU/4XimW1VUeZiZVleqbaRbUZmg4A
Date: Tue, 9 Dec 2025 17:28:47 +0000
Message-ID:
 <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-09T17:18:22.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|BL3PR12MB6522:EE_
x-ms-office365-filtering-correlation-id: a874f038-6957-48fb-b5b0-08de3748690a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGR4UmZ1VndVYWx3SG92OWNGY1l2UENFZ0U1dmxicHRCM2pIQ0ZkdHJZc1Y5?=
 =?utf-8?B?QndaSFVFOWpsUUdwazJIRmszaG5Mc0VBcTBRYWo2NzFLOVpPakQ3QW1QMG5w?=
 =?utf-8?B?N1RTQ1dBRUJYdm1iTUhrZFErRy9KTWljWmhiREhRQ3BGcnNIVWUrOWhWVkx6?=
 =?utf-8?B?aDE0RW16ZCtha2VoeWpDLzczM21GWDZvRWFnU0NmcXgxTS9PVHhQUWxFUytH?=
 =?utf-8?B?N0ZiY3lISmt3VVVwWEc4d3pLYXgvcjZXRmROa0NjQzZPS01VNXBsUFpYUC8z?=
 =?utf-8?B?anI0QXRWcnl4SWswVDFhU1E3MXZiWlRCRHJhYm1NL2NRWEt4SjlXZVpjd09J?=
 =?utf-8?B?UzJGL3NqY00vSHd6OUE3SWhBNjhWb1VMWERXdHVuZ2xLZHg2WG9vVjBDTW04?=
 =?utf-8?B?cE5zSXZNSTZ1U0FRdForalVEcmd1ejRVdTNxdE55b0FJVnVmNzR2VkI1ZXVP?=
 =?utf-8?B?aXpCV2JveWRmYVZ2ajN5MHVMb3ZqdlJUVElnSmNEazBWMXFRVnFHMnpud0I3?=
 =?utf-8?B?ZFQ2bHlwbUxaTysxQ3VoZlRWU0dNdE0xdUxHU3FGRDVmdU5hMXNxTkpXT1Nh?=
 =?utf-8?B?NFk3WjltVUdIdTVGU1hFY2hEVGZjQVNDZmtEbFVRWjhaT21nZi9lYnhua2xY?=
 =?utf-8?B?QUppQ2QyWjZCT1ZUNW1TQVFGNDZ2ZTQzVjIrUnp5SmlLTjdXTmMxTFFsUzFl?=
 =?utf-8?B?UWhjSXNoOHNtTDVoWFVjNU9IdmRUV1JjK1p6NlVYNXJJNm5IT0tZaHoveGdt?=
 =?utf-8?B?NTFkMW1NdmlvZ0kxcVBKM0pRZmZXVWJ1enpEMm9rQjRNRk1JWG5kN3ArVGVO?=
 =?utf-8?B?OTBWbmpEeDV3a0dwd2tJaWNCWlBrdm9yVFM5eUJESkMwRFlJT0trYmVqenlO?=
 =?utf-8?B?MUNPenE0NmFYWExaNXhiTWFFSmowMzBPSFVTaFY1NDRxUndpSlBmTDJheFAy?=
 =?utf-8?B?RlEwKzJBMEVxbll2SEIrMTl6VHNVdkJPV2xtZjBZN0VVbldUZFpqWXpQQy9i?=
 =?utf-8?B?N2JZeUxGTmVkY0JMUFZlZWlBdDVqN3RJc3JJb3FEN05yZ0RTL3VwYnVweTJH?=
 =?utf-8?B?RFFsTXdXSkkwWXlTN2VVcURBdjNhQ0NZaGc3QTNVUDh0NStpTGtiZmJhQ2ZQ?=
 =?utf-8?B?WlcyWWE2TmZMSmhpaE5nVXdBOGYzVmpqc3RndVRxclgzWVNsNTB5TFNuWFJu?=
 =?utf-8?B?WjY1SEVLSHBWbVBVWlBHVzlhcXFteHIxNXpWbGNickxyOEFlWVF5Z2pGeWsz?=
 =?utf-8?B?UkR1SXdlUDZKcFRXdE5aTU5NdFB4N3ZOL0IyY1BQZHpLT01FeXRUYlJzSmRT?=
 =?utf-8?B?aGZmNXVqall3bDIwNU9Gei9Hc250RGFRWU5Uay9pN29EZVg0NE1DQmZXb2Rp?=
 =?utf-8?B?SGZDYlhSOE5ZRlVOelJFb1FWWGsyRUVoWmpkYXhLaHhIVTlJbERrSndvYVhw?=
 =?utf-8?B?ckFtVm5HVVhWZ00yUmJQZmhmNTE3cklyRWVPTHhPZGpLTngwendjSDd1aHhL?=
 =?utf-8?B?L3drdnNWYnlyMzBtcGx0U0xhZFdLN3lmejQveE14czR6YjRocGxOYkU3MFAx?=
 =?utf-8?B?ZWZqK1V3c1AyZGkrYnRkUnlTZmpqSTAvUHQ5MEZkWGlTdU5INjJnaXROb1J1?=
 =?utf-8?B?Z25nM3V1UmJrbTd0dktEVzROVjlpUkJOcXZSOWZmTmhKTDEydG9OaW1ieVhG?=
 =?utf-8?B?Zm9EQU5ZVGJOY1A2Wi8vOUdmRmRid0I2Y2UvWHlZdUNyY1ZOd25ZM2hNSW5m?=
 =?utf-8?B?MWtxMFllV3JtTTM0S21mTmlZc1l1VzlFcGtremdkTzdKdzlUSWVZbFhrWWpw?=
 =?utf-8?B?Qlp1UEczbWlZZVJKcjlmWGM0YXNJRksyUFg5M0IvVWhhV2NLbDk5WGN0S1ov?=
 =?utf-8?B?bSs4WUNDUjJydlZPbTVCV1hxam5PMXhBS0lzUEJYdDNTaU9TRTRLd2tqa042?=
 =?utf-8?B?Zy82cGhOdjZtbDhtRTNXMlkzbndnT3dVTTdzVFVrbnI5d0x4NmhUVnVobDNn?=
 =?utf-8?B?a3YzaldIV0VGZmNtem9OaWRUQ2lIa3dVTllaRU1qTldnRVVaY2dYWHJLQ0hP?=
 =?utf-8?Q?XmY9OZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTRjRlRES3hLZTh0YjJiK1J0b0pINjhlbTkxd05NTFNDZjRwWnYzenNZellT?=
 =?utf-8?B?TjU4eG40dHlNZXNBSHhVb3EzTFY0OFZxU29qamFKN0hwR1FEa08zaXllV2NT?=
 =?utf-8?B?ekQyTk41bll3M0pCWmFLNEtKNWZ3RzlmUUVRM1FOSThLWmFzallOb2hVWSs3?=
 =?utf-8?B?RUtKM1IrVzBmank1OHUyRjhNZCtNT3VBNjBxZmpJSmVONWFLN3ZRVU9MTVRW?=
 =?utf-8?B?MDRRZnVJKzVqZ1dORjVUdVB6M3d0cEtBZ3NTWEdFaVlCT2Z4b2doREU5QXB6?=
 =?utf-8?B?UDludkF2NWR6VHpCcHVIL0lobFVSOVNmZWExK1UvazErS1pqLzk0a2JzZGg5?=
 =?utf-8?B?cFVkR3VaNldlL1YrbGlmaUNEMVFyeTczWkZiZndEUWtkcmd6TXRtMUVBNE5V?=
 =?utf-8?B?RlVyTzl3SWJnMmphSGdpeGhkR1Q2U01TOTJiWUJVQW5LaWhGbHJhM3JETHdU?=
 =?utf-8?B?K2plcjdPdU11RFYvcWMvVk5WWStCcVBxTWFmMTVNRThOQUl5RmlhZWlER20w?=
 =?utf-8?B?MFNxWURxNlN3cmRQWTRhdE9tWkhqM1drcmdjdnlUeGlHMjh0VjhNY1g1Umlq?=
 =?utf-8?B?MXZtSjYwU3dNYXJlM3dLa1o4bzE1Nm5pUklyQ0NoNjZKRVlQU2piMlRvMEtY?=
 =?utf-8?B?Z2pta2VHZmJWY3NQL0drV1l6Mm9CZ2NLQVB0ZGk1RVdTRGtBRGpCTUtnRDNp?=
 =?utf-8?B?clVtSUdTSTQ3MWk5ZXRMeVNOelZWYjlHeU1Yelk4NXFlR1IvYmd4T2NhQzNU?=
 =?utf-8?B?ZFZPNFZJM1ZmdzdLc0hMSUFQQjNwVFYzT29KbTNKc2xQSU02NTJ6R2VwSDR6?=
 =?utf-8?B?ZVZZMnU3N05DanFCcDUxdU9WZWt1cFk3b2ZEdWFLclFiSFo4Y2p0cGs5aHNO?=
 =?utf-8?B?dlV1SlRTVjFLVk9pTGJJa3FTZXo1Z0phVVV0MWhvRjhDR2xMdXFOdmt5cml0?=
 =?utf-8?B?VDFqK0dMdXU4cHJCZE5oV2h4dTRHTHpVM0VqOWxBNFVLbzNYRm9ILzYrUzho?=
 =?utf-8?B?bXJHYThvV0N2U1lTOWhNbmVwTlBhNWxXUEFpMG0zVTBLdE1vWkYxRU12Njhp?=
 =?utf-8?B?dlVSY1dDeTJpNTRCaGtNU2I2NVpISWpzNnNHdWNGWXV6ZXlBVEtkZGN2MkU2?=
 =?utf-8?B?MTN6NG43b0M2QXhIWTBZcUhRaE8wQXJFRWV0UUM0VXdJTDYxU3pRY1MxYldi?=
 =?utf-8?B?S1FEbjlkbUs0bXlwektTNkJtRVhML3RyUlR6SmVhaWxQbUdNUVQ5V29lWHJT?=
 =?utf-8?B?ejQ0QWxmNlVScUpMTXZVdUYwczdOSEhlejVFay9LRkN5STVsQ004SUlYcExY?=
 =?utf-8?B?VkFXTWhIcXkwRXBaa3lhOXhsbDlPTE1JWjFDM1djdk9vQUh4eURnZU1CbmZV?=
 =?utf-8?B?cUZ0OHRjWlZ1K0QzSFZucUtva1ZrSDNLcDJibUlkRDMxYWI5T3VaNGxtUE1j?=
 =?utf-8?B?bmN5ZUFsUlc3QmxBbUg2cW1JK2lLNklDN040YmwvSVFvTksrc0FUOUpjWDQ0?=
 =?utf-8?B?anFPWDhDUzVJUTgrbEJ0Y2VPUTNNeU84VWFidU9VRHRXL01GRkxXemFHcGc3?=
 =?utf-8?B?cElaZks4bXdoQW9sU0lLVEJnU3pqMWUyZURlMWhkNlVUUm5vTnJHYWlRb2tX?=
 =?utf-8?B?bHF0bjU3bWEySExGMVZIN1B0VVpoUG5tdW5jeEw5MEtTQUlxb0dXcDJ6UVhr?=
 =?utf-8?B?UG9jVUJ1dlMyVGdUaiszYUs2OU1ZTzZRTmlQWDNKL282WUdsZFFtT2tTVXFi?=
 =?utf-8?B?dXJ4U09UWk81MURnSy9KZFU2dmNKV2NWTXJkMzNyOGZ3WkdRenhCNGtUd1dZ?=
 =?utf-8?B?MlRqMFk2WnE5WUtubDhhaUFUZmt1ZWFsbU5NQlVGOHl1MUNnK09hbGJUbWJu?=
 =?utf-8?B?WkhXdCs2VjRnOGZFajIrZUxuVFVIYnBTbE1UMHN5UDh2UDUySUJNUlNicFQr?=
 =?utf-8?B?ckI3cC9FM1RuV0tqWkFJWjRJL0lhUFJEeUhKOVI3UFhzdDlvV0ZhZTZIb0VP?=
 =?utf-8?B?ZXdZTGU4Z3pLQndLNCthRUZDc1NyM1NnVUxrRFdJWldMcXl4bzQ3YlNnWGoy?=
 =?utf-8?B?R3llS1Z1RDc0M3dPUFZlL3NwRHdwN3lHSVdjS0M2MGdhYjh4eFZ3UVpXWUhq?=
 =?utf-8?Q?WKkw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a874f038-6957-48fb-b5b0-08de3748690a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 17:28:47.0940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5Clq5U8seq7dNe8jWyV1ldu3XRPRkOTCRWbM4Kr4kvxKWmoYBUlqp7MOPeEpAIF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEsIDIwMjUgNjoyMCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBU
b21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAy
LzRdIHJ0YzogenlucW1wOiByZXdvcmsgcmVhZF9vZmZzZXQNCj4NCj4gQ2F1dGlvbjogVGhpcyBt
ZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4g
Y2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNw
b25kaW5nLg0KPg0KPg0KPiByZWFkX29mZnNldCgpIHdhcyB1c2luZyBzdGF0aWMgZnJlcXVlbmN5
IGZvciBkZXRlcm1pbmluZyB0aGUgdGljayBvZmZzZXQuIEl0IHdhcw0KPiBhbHNvIHVzaW5nIHJl
bWFpbmRlciBmcm9tIGRvX2RpdigpIG9wZXJhdGlvbiBhcyB0aWNrX211bHQgdmFsdWUgd2hpY2gN
Cj4gY2F1c2VkIHRoZSBvZmZzZXQgdG8gYmUgaW5jb3JyZWN0Lg0KPg0KPiBBdCB0aGUgc2FtZSB0
aW1lLCByZXdvcmsgZnVuY3Rpb24gdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyB8IDI1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGIvZHJpdmVycy9ydGMvcnRj
LXp5bnFtcC5jIGluZGV4DQo+IDg1NmJjMTY3OGU3ZDMxMTQ0ZjMyMGFlOWY3NWZjNThjNzQyYTJh
NjQuLjdhZjVmNmY5OTUzOGY5NjFhNTNmZjU2YmZjNg0KPiA1NmM5MDc2MTFiOTAwIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMNCj4gKysrIGIvZHJpdmVycy9ydGMvcnRj
LXp5bnFtcC5jDQo+IEBAIC0xNzgsMjEgKzE3OCwyOCBAQCBzdGF0aWMgdm9pZCB4bG54X2luaXRf
cnRjKHN0cnVjdCB4bG54X3J0Y19kZXYNCj4gKnhydGNkZXYpICBzdGF0aWMgaW50IHhsbnhfcnRj
X3JlYWRfb2Zmc2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgbG9uZyAqb2Zmc2V0KSAgew0KPiAgICAg
ICAgIHN0cnVjdCB4bG54X3J0Y19kZXYgKnhydGNkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgcnRjX3BwYiA9IFJUQ19QUEI7DQo+IC0gICAg
ICAgdW5zaWduZWQgaW50IHRpY2tfbXVsdCA9IGRvX2RpdihydGNfcHBiLCB4cnRjZGV2LT5mcmVx
KTsNCj4gLSAgICAgICB1bnNpZ25lZCBpbnQgY2FsaWJ2YWw7DQo+ICsgICAgICAgdW5zaWduZWQg
aW50IGNhbGlidmFsLCBmcmFjdF9kYXRhLCBmcmFjdF9wYXJ0Ow0KUHJlZmVyIG9uZSB2YXJpYWJs
ZSBhc3NpZ25tZW50IHBlciBsaW5lIGZvciByZWFkYWJpbGl0eS4NCj4gKyAgICAgICBpbnQgbWF4
X3RpY2ssIHRpY2tfbXVsdDsNCkl0IHdvdWxkIGJlIGJldHRlciB0byBleHBsYWluIHdoeSB0aWNr
X211bHQgaXMgY2hhbmdlZCB0byBpbnQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiArICAgICAg
IGludCBmcmVxID0geHJ0Y2Rldi0+ZnJlcTsNClBsZWFzZSBmb2xsb3cgcmV2ZXJzZSB4bWFzIHRy
ZWUgdmFyaWFibGUgb3JkZXJpbmcuDQo+ICAgICAgICAgbG9uZyBvZmZzZXRfdmFsOw0KPg0KPiAr
ICAgICAgIC8qIHRpY2tzIHRvIHJlYWNoIFJUQ19QUEIgKi8NClRoZSBjb21tZW50IGlzIG1pc2xl
YWRpbmcuIEl0cyB0aWNrX211bHQgaXMgbmFub3NlY29uZHMgcGVyIHRpY2ssIG5vdCBhIHRpY2sg
Y291bnQuDQo+ICsgICAgICAgdGlja19tdWx0ID0gRElWX1JPVU5EX0NMT1NFU1QoUlRDX1BQQiwg
ZnJlcSk7DQo+ICsNCj4gICAgICAgICBjYWxpYnZhbCA9IHJlYWRsKHhydGNkZXYtPnJlZ19iYXNl
ICsgUlRDX0NBTElCX1JEKTsNCj4gICAgICAgICAvKiBPZmZzZXQgd2l0aCBzZWNvbmRzIHRpY2tz
ICovDQo+IC0gICAgICAgb2Zmc2V0X3ZhbCA9IGNhbGlidmFsICYgUlRDX1RJQ0tfTUFTSzsNCj4g
LSAgICAgICBvZmZzZXRfdmFsID0gb2Zmc2V0X3ZhbCAtIFJUQ19DQUxJQl9ERUY7DQo+IC0gICAg
ICAgb2Zmc2V0X3ZhbCA9IG9mZnNldF92YWwgKiB0aWNrX211bHQ7DQo+ICsgICAgICAgbWF4X3Rp
Y2sgPSBjYWxpYnZhbCAmIFJUQ19USUNLX01BU0s7DQo+ICsgICAgICAgb2Zmc2V0X3ZhbCA9IG1h
eF90aWNrIC0gZnJlcTsNCj4gKyAgICAgICAvKiBDb252ZXJ0IHRvIHBwYiAqLw0KPiArICAgICAg
IG9mZnNldF92YWwgKj0gdGlja19tdWx0Ow0KPg0KPiAgICAgICAgIC8qIE9mZnNldCB3aXRoIGZy
YWN0aW9uYWwgdGlja3MgKi8NCj4gLSAgICAgICBpZiAoY2FsaWJ2YWwgJiBSVENfRlJfRU4pDQo+
IC0gICAgICAgICAgICAgICBvZmZzZXRfdmFsICs9ICgoY2FsaWJ2YWwgJiBSVENfRlJfTUFTSykg
Pj4gUlRDX0ZSX0RBVFNISUZUKQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICAqICh0aWNrX211
bHQgLyBSVENfRlJfTUFYX1RJQ0tTKTsNCj4gKyAgICAgICBpZiAoY2FsaWJ2YWwgJiBSVENfRlJf
RU4pIHsNCj4gKyAgICAgICAgICAgICAgIGZyYWN0X2RhdGEgPSAoY2FsaWJ2YWwgJiBSVENfRlJf
TUFTSykgPj4gUlRDX0ZSX0RBVFNISUZUOw0KPiArICAgICAgICAgICAgICAgZnJhY3RfcGFydCA9
IERJVl9ST1VORF9VUCh0aWNrX211bHQsIFJUQ19GUl9NQVhfVElDS1MpOw0KPiArICAgICAgICAg
ICAgICAgb2Zmc2V0X3ZhbCArPSAoZnJhY3RfcGFydCAqIGZyYWN0X2RhdGEpOw0KPiArICAgICAg
IH0NCj4gKw0KPiAgICAgICAgICpvZmZzZXQgPSBvZmZzZXRfdmFsOw0KPg0KPiAgICAgICAgIHJl
dHVybiAwOw0KPg0KPiAtLQ0KPiAyLjQ3LjMNCj4NClJlZ2FyZHMsDQpIYXJpbmkgVA0KDQo=

