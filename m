Return-Path: <linux-rtc+bounces-5587-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648BCC9AAE
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 23:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4D33303693A
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 22:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9AA30F947;
	Wed, 17 Dec 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BoqG7LPK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F462FB0B9;
	Wed, 17 Dec 2025 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766009312; cv=fail; b=fvkoZI/mz/1xSn/1CUesXX43lbxoe2OA1DwopzpYZtSE+ERcA0AIDMa6opPA5nnhC/1TC69bdD9IBr7eQb6Z5KymUo4WG7Ow12wUXGToYTy11adEf3zbyIfv49YQ5mUo7XLy/s+7CUeMswQN9rtAhIx0fSx2vTfSaiMSQhfPA2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766009312; c=relaxed/simple;
	bh=aVhiBX4SqVXklMYkr9jUraB1wwNhXGcGdHdEN24TiT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oNXuGeBak/5TwKpzSC0msLcNbl7YBfdNzKOBOLJnugnvXPIs2Ui+Y3BOdqPf4zS74oJlkDijaQRuS8D5zPct5DbIJmvOMLaSN7LY22BVqq8ilJisyBUThYxRpf8Welyapz1utlqTEhpNGYUsHRCVDdQOkKMCeUn2TKHq+MSrKoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BoqG7LPK; arc=fail smtp.client-ip=52.101.61.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVKfRtHGnKgYh8huo2umNZPAazdrKgd1DcFaIfTGw13tudlbWabpS8+A4RX0TGeIghh+vOSFtUN+gPf9QTUE0a+6eAb2fKS03Wp5hW1a79f5TgJcjFC1szTVDZi6UqV0msf0FR5tfU9VIVarnVdmLv2OlO3pMcBEfFuVP+ChpGplwTYjQm/v2OR1xfQd/5ICblXrVi/um3ueo6cE2UiU56UFCjr4SFzNpYoMt0TyAbMYrkVL9SULmpEtkoS9kMZ756Z1WArPzoiRdbypf7/edJVQqO1/+JPHCdhnDU6UoW5MEP5QXgMfDcwD+g1cheDKLkjlGGozdPPC6vvJUG7nXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVhiBX4SqVXklMYkr9jUraB1wwNhXGcGdHdEN24TiT8=;
 b=gSxfjZEhEFVpO3GCLGOBMYWMfEmr32qK99v3xurxCiZn6FffYQ6rMbAhZsnIOmU6NN2MfDvf6rK25M91J2th8DwfpFvpiznl1BriVT0f3rOAh1ArV+zCj6GKL4w/4Lefw4PvOsPZdjv+O8bbkItb3bH8XdlITTYpP1BLhxQ6XHGCT6nJeDM6YxdZXDWLc4VaRcmdsJO92/ZnkcYY+uyRV69gCnXSqxXDNngXsHP8mswLiH98GqQOLSUSyC9oKwAdoNtuBcDDY59X+kPaI7j3AVjQDFTp4QyteH0qHk7h7L0jm9Ewd5PoH1mJm8XAUDs3Ft4lOIgZOj3oj9V035od4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVhiBX4SqVXklMYkr9jUraB1wwNhXGcGdHdEN24TiT8=;
 b=BoqG7LPKb0F900BU9aQDpRn0b2RGVzGKxmtMWWfCmED49+SLakP0TZKV0APTsSRnFNkfpsyh5FsgDAy+KgoOYYbkzQKNcS68YNGuPlg/DMRAgeJW8XO9quMWKnu4Rf89tbNFF4t3jz1CMtvPnwpBDwTz7pMjAUaXibNnykGK60A=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:33:03 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 18:33:00 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/4] rtc: zynqmp: rework set_offset
Thread-Topic: [PATCH 3/4] rtc: zynqmp: rework set_offset
Thread-Index: AQHcYsIwYXkjrWA8MUCqh6MsIZhrlLUZsD6QgAEoTYCAC2YDwA==
Date: Wed, 17 Dec 2025 18:33:00 +0000
Message-ID:
 <LV5PR12MB98041CC1F14EC5C526C4C16092ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-3-33875c1e385b@vaisala.com>
 <LV5PR12MB98045BF8A85640F924BCFD4492A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
 <d02fda5e-47d4-4613-9a21-ed81bc957146@vaisala.com>
In-Reply-To: <d02fda5e-47d4-4613-9a21-ed81bc957146@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-17T18:22:47.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|CY8PR12MB8339:EE_
x-ms-office365-filtering-correlation-id: 419e5520-194b-4598-803e-08de3d9ab4f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGo4RjVKUDYwRG1wZ2wxRExJYnJhaDVaOFg4cGNQVDFxckhsMEV2MERKK0FL?=
 =?utf-8?B?QkJDUTdlYm5XVDVVTG9BUll5RHlINGxPdy9MRGpLblJ5aUVsWVJqRmxPOVlx?=
 =?utf-8?B?WngvRDRUaGhpRjlHN3hmbDIxZ1V5ZjRLMG9lcGVCZEFta1gvOTN3YTJtazFx?=
 =?utf-8?B?TDhYR1VEVWZLZTNBVXJrTW5wZS93ZHBiSUJGRGtEK2phMjZkK28vUmlpVHJW?=
 =?utf-8?B?alc0aytRUXArRjI1cWQ3QlZENTdLdndobHIrVUU1bzZwcHl5NlU2cUpyZEFl?=
 =?utf-8?B?MUI5QnM3L0JTUUpTYmgzaXp2YkFTNENvd0dyODNMV210SFI2RU13NmIwNlVR?=
 =?utf-8?B?L0t3d3pVRlZXY2NtUC93OW14Mks1b2FRQlRhcHBlTC9MOUF5eSt6QkljT0dG?=
 =?utf-8?B?QU00UTNvenRwQWcwV3IvYlE0WHlMOVg2TTAyMG5uY2d6YXFwNzFtam51ZVNv?=
 =?utf-8?B?VklwMU9tNnJVZ0VydnlQamh5b1lLY09yQ09rRXRlTkk2UmhTS05kckdiU3N3?=
 =?utf-8?B?NEU5TEl3blM3ak9acU9nNnM1eHhoajlkTXNvaG9Mc21HWnpvbGQ2eDc3VGJS?=
 =?utf-8?B?NEY4T1BBSUpuN1A1dlBrME1Da3RvMjJsek1pRVVPUmdkUEc2L0xGd3hQdFBB?=
 =?utf-8?B?aFBkVGMvOW9Rcyt5SkVuSWx4Ym41MG1iZExVNExzZUpLQU50Y1REZkZrSGlu?=
 =?utf-8?B?YlhZWjV0akZzQnNkVy8wVE1tTm93dHhtMlJDNG1OYjVLS3VwajZLbXFvc3FB?=
 =?utf-8?B?RGQ4dU8xTGFkeUtDVFkwWW51RUYxNnJGd2I5L0lUNVB0UDZMMjhJUmZaV2tn?=
 =?utf-8?B?VkVhVHJzS0pTc0NRYy9uV1JqK2ladjVWQkE4cy9TbW1YMGxjQ0d4dnc5VktL?=
 =?utf-8?B?NjdxaUEwWXpRT2FvMjQ1OHNRajhyR0o1akpkRkZnall0OVJPS0xVK3pkVkQv?=
 =?utf-8?B?VGNYU0tYSWIwSUZKNHdKSHVVQTYzcitGczdrRkxMSW5XSWkycWZhWXRJbmJS?=
 =?utf-8?B?VWptVUtxeHNJL1pyeWU0OS9vUmFEcUgzYWZ6amtKTWlqbEtJVHBsZ1VxRnp5?=
 =?utf-8?B?dm5iL2pWTDdRZzYzOHNYbmlETFIydUpTVksxeE0vcTRMbURSOUdVMXM5Zld3?=
 =?utf-8?B?aHZjNEsrb2FvaG1kS0xNbHJMNVhsREZnVEt6VjFnQjdrY1B3SldVYzl6Qzgz?=
 =?utf-8?B?OG1uNHAyLzcvT1FqNm05czZqdjVtdlRsSUFraVBPZC9iUzc1bnpKNmphbGoz?=
 =?utf-8?B?MThzSTljRXE3ZDJ5THkyMGVtZy9lT1FsRGxUR3ZDUGVqT2dUWEx2OTlvWFFi?=
 =?utf-8?B?RXVWVWNDVVZhWm5hTC9NcXgrQ21UeW1YVG1ucWt0MkhEeDRPbmx3cThmb2lO?=
 =?utf-8?B?Z0UvQmhtQWNuK3R3YzNwVWwxVUhxWWRMQTdUVnQxZGFsc0pMT0FtVXNWUmRo?=
 =?utf-8?B?aWQxL016YzdGRTRrR0RQeXNsb1NLNzI4OUI4a0xwWlBBdmlwTUNkczRDdnVm?=
 =?utf-8?B?WVh2a1ppWUV3WFRxVkJMcVpRQ3hkS2djRk8zazR3aXNWTDFZdW4xSFA0aE01?=
 =?utf-8?B?UmdBcDZVRGdDNHBwb1EwOE40cUVoZWdxVEp3dXVBc0xhVXlLb1VLdXdiK2R4?=
 =?utf-8?B?aklhU2o4amljRzhZdUJhZ3pjTkhRTlV5K3djZlpNeHRxSEJFYVpHN2ZOeW44?=
 =?utf-8?B?aXQ5WkFOekMzV3RlMWEyalhFclIwUFV0dTBjK0RTUVQrSTlQamJYN0hDR040?=
 =?utf-8?B?VGFQbnJaYnJiTUdNMHljempXZ3pVdTRRd3MrUXMvL2ZUMjVSa1lmeHJISW0y?=
 =?utf-8?B?NEtwNk1OM0c3Y3BhWWxXc21rdGwyb2dHMXk5YlFlK0FBbE1WZ2xjRE14YWJh?=
 =?utf-8?B?UUI4ejFaNnJTZ1g5N054MWtiT0xnOVZSbVNiTk15R01qemxZTnZkOE5IaDZC?=
 =?utf-8?B?ajVpNE5ZSVpiT05NNUhNdkdhQU1udFBObTZMd1VtSkFyVGVZaXBWMGEzL3Vh?=
 =?utf-8?B?UHBaZlh0NHNHSlFQTHFYU2kzUWFlbURSbVNsQ3RMdnJCR2Y4R0h6TXprS2NI?=
 =?utf-8?Q?HC/HGN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTdxQ25UU1F0OElvQzBnMGNMSGZCeWFVejBXVkhtNTdpREh1eEhRNVdQOXlT?=
 =?utf-8?B?TmI4T3p1L3dpOGcxVnorSEl5cldxRmV5eGQ4L2M0Vi9yZXpKUDNyQ3grZHZq?=
 =?utf-8?B?M3diTHgvT3dJdGRXNEFTaW9uRVIyZmdCSE9wSitYTHVkM2N4b2xmZzdmd3h6?=
 =?utf-8?B?SW1WZHEzZERRK00ralNFdlRubnhVczNoTUFCS05HUzIxRzNqdzlTY3BZaHJW?=
 =?utf-8?B?NGFIRU9RZVNWWnVPRjVDYUd3WlUwZ2xKdWF5dTZ6ZWFOOE1FaGc4OFk2Z2to?=
 =?utf-8?B?ME40N2hEK3o0QlB4cmlob0RXYlFSMzhYUm9ob09NWFFJRnZlWTQ2SEYyMStM?=
 =?utf-8?B?Mlp3SDNpM1hkSVhXU1hwZ0hhYVlPSWZBTHB1dXRiSTRsVjRYSS9sSlRsaFoz?=
 =?utf-8?B?MXNEQUVYS0RHOUgvOFNRejF2M05MY1I4eTl0b2Y3Y2huQ2ExajdGekFKVlVr?=
 =?utf-8?B?Z2NjOE83T1BxdzRETnplUXIzQmQ3aGF2MXB1bk9JNEZaZStBUktuWDNQaSt0?=
 =?utf-8?B?TzQxcGpHUXFCa2plZXB2di9zajQybTVWSlZYQkJrSWtEc2R2RUQ3S1YxOXBk?=
 =?utf-8?B?Vm00eFMzbU9mOGIzdXJ3RkZKKytvbXpnNzJaaGVTRVUxNU1BVFZUSDk2KzdD?=
 =?utf-8?B?amxxWDJsYTJzZzhDZWhIQXJ2QUNkTDZkOU1GdUsxRVRkdkVNQVVHUkkvK2xt?=
 =?utf-8?B?ajhicXQwemRlbFJxcGpOdGxPdVhtR1VJQjRpVVdNZVZLZm9tZDlCRVVNWVB0?=
 =?utf-8?B?UjFQUGhNUkpLM1VPTDNxQXVQSVVBSytSYU1qM3daS0RNRElSeUZtdDl5ZVdU?=
 =?utf-8?B?TnFUMnFEVUpEU0Fna0k0SlJaSnI4Tm5Hd3B5M2h2aFJ6WUFYOHE4RmxqOGxu?=
 =?utf-8?B?WUVJc3FXeG9McFNOOXBWR3NkOFF5b1BaVVByb1lycXZleUhMSm1EVHEzL1Yy?=
 =?utf-8?B?cno5OGNaKy9tb29FdDFQZzh1OTRXZloyUzRtaUhKSDl4Z2VxV3IyaTFlR2Vh?=
 =?utf-8?B?WW9ZZ3VsSnBPZnBYYXF3bjZiS2RuTk1ldzRpYnI2azNUKzArUFRRM0IzeGNh?=
 =?utf-8?B?NndvU1ZydkVIbGZuUnZNWk1SeSs1bmRQQjdBZzBLTFhnTE4rQnJ1K0R5K0pB?=
 =?utf-8?B?Mmo2Z0NiUzgvaW9OT090UmVGcHZSQkp6cVNqWElGWWNVeXBQbEU5S0hjVVVy?=
 =?utf-8?B?QmFVY1V0aEdkeUwyYzQvOFhSa1RJOWZKaVJkZ2VSeGhrK2hDa25Vcmh1blhK?=
 =?utf-8?B?dVlsalpuL01TRUY3UmpuY0lJNWtNM0VpT2k2MXJCYUNZZFZOcE42ZFVMcUxx?=
 =?utf-8?B?dnRtL1h0VVBEam0zVEw3OGw3QVk5UDhHMERwVmRtWDREblhxc2RLdjN6bjFm?=
 =?utf-8?B?VDBoUU43ZVJSOHpNaW8rUk16WDhZZ3BZeWpoUHdWaHdoM1krSzZNa3lld0pI?=
 =?utf-8?B?Z1FlUGp3bHJmY1B0L1A1bFY4WUVEa2lrSlhPcTNjTC9DTnV4ZjVTdEtaR3Zl?=
 =?utf-8?B?Y080UkRCTWtMMm1wR2R1cktBVkdQZ2lPT05UQmp1SFVkalJyS0dRcWVyNzRT?=
 =?utf-8?B?Rml3Z3ZDc3RodWEzYlRXWVk4QjhROEZjb1BzazhHRVJ3TmNMT0lkTytXUnIy?=
 =?utf-8?B?ald2VmlEc3EyeG9ncmpjTjhINVdzbTRndVdXTkkvSk5TTnFxbUt1M3V6b0xF?=
 =?utf-8?B?TFZBVlZhazJvNXhQNFcwQ3BiNTRjVUpPK25oK3Znc1VNSmlZdU9OMHpTQUNl?=
 =?utf-8?B?MEhmdGUyR3lPVVlQN2pwZ2htellFS3RTcExTUGRzcTBpemdOQzB2OTR2ZE5o?=
 =?utf-8?B?OXBpNDVybWp0RFhGcFZ6SDg1UEJKdytmL3UyNk5ndmdKTWlGdEIxajBwWHVW?=
 =?utf-8?B?a2lwQnNYNWFHaktqVXRFanZKQ3JFR2RVTTY5Q0c0aWlpd2thQlBQYmZQUVN6?=
 =?utf-8?B?b1U1V3JiV29VbERXN2dWb0NnM25nQ3FpSEt5bDlPS0ZLK05uTDVkYWd1RGdS?=
 =?utf-8?B?NHJveVpXRjFWM01LRmNYNXA4S2lmWlZqdVR3UVVpSk9lWU9nVG9uNG5taE50?=
 =?utf-8?B?YVNVb1VOZFp0eXJQb0VJME1vV1VLSnVSNFhpY3p5czRrZEdUc3dTM25Iei9v?=
 =?utf-8?Q?UPOE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 419e5520-194b-4598-803e-08de3d9ab4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 18:33:00.3088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHF/eY0gNrc4ZRxBFsUNJqqA4vaoQiUgcH6WgKyI9NXVXw0cv4J0BPAVhNMJ7W4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IERlY2VtYmVyIDEwLCAyMDI1IDU6NDggUE0NCj4gVG86IFQsIEhhcmluaSA8SGFyaW5pLlRAYW1k
LmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNv
bT47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBDYzogbGludXgtcnRj
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMv
NF0gcnRjOiB6eW5xbXA6IHJld29yayBzZXRfb2Zmc2V0DQo+DQo+IENhdXRpb246IFRoaXMgbWVz
c2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRp
b24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9u
ZGluZy4NCj4NCj4NCj4gSGksDQo+DQo+IE9uIDA5LzEyLzIwMjUgMjE6MDMsIFQsIEhhcmluaSB3
cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNh
bGEuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEsIDIwMjUgNjoyMCBQTQ0KPiA+
PiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsg
U2ltZWssIE1pY2hhbA0KPiA+PiA8bWljaGFsLnNpbWVrQGFtZC5jb20+DQo+ID4+IENjOiBsaW51
eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7DQo+ID4+IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBUb21hcyBNZWxpbiA8dG9t
YXMubWVsaW5AdmFpc2FsYS5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCAzLzRdIHJ0Yzogenlu
cW1wOiByZXdvcmsgc2V0X29mZnNldA0KPiA+Pg0KPiA+PiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ug
b3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Blcg0KPiA+PiBjYXV0
aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRp
bmcuDQo+ID4+DQo+ID4+DQo+ID4+IHNldF9vZmZzZXQgd2FzIHVzaW5nIHJlbWFpbmRlciBvZiBk
b19kaXYgYXMgdGlja19tdWx0IHdoaWNoIHJlc3VsdGVkDQo+ID4+IGluIHdyb25nIG9mZnNldC4g
Q2FsaWJyYXRpb24gdmFsdWUgYWxzbyBhc3N1bWVkIGJ1aWx0aW4gY2FsaWJyYXRpb24gZGVmYXVs
dC4NCj4gPj4gVXBkYXRlIGZyYWN0X29mZnNldCB0byBjb3JyZWN0bHkgY2FsY3VsYXRlIHRoZSB2
YWx1ZSBmb3IgbmVnYXRpdmUNCj4gPj4gb2Zmc2V0IGFuZCByZXBsYWNlIHRoZSBmb3IgbG9vcCB3
aXRoIGRpdmlzaW9uLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9t
YXMubWVsaW5AdmFpc2FsYS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9ydGMvcnRjLXp5
bnFtcC5jIHwgMjkgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBiL2RyaXZlcnMvcnRjL3J0Yy16eW5x
bXAuYw0KPiA+PiBpbmRleA0KPiA+Pg0KPiA3YWY1ZjZmOTk1MzhmOTYxYTUzZmY1NmJmYzY1NmM5
MDc2MTFiOTAwLi4zYmM4ODMxYmEyYzRjNGM3MDFhNDk1DQo+IDA2YjYNCj4gPj4gN2FlNjE3NGYz
YWRlM2QgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiA+PiAr
KysgYi9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMNCj4gPj4gQEAgLTIwOCwxMyArMjA4LDEzIEBA
IHN0YXRpYyBpbnQgeGxueF9ydGNfcmVhZF9vZmZzZXQoc3RydWN0IGRldmljZQ0KPiA+PiAqZGV2
LCBsb25nICpvZmZzZXQpICBzdGF0aWMgaW50IHhsbnhfcnRjX3NldF9vZmZzZXQoc3RydWN0IGRl
dmljZSAqZGV2LCBsb25nDQo+IG9mZnNldCkgIHsNCj4gPj4gICAgICAgICBzdHJ1Y3QgeGxueF9y
dGNfZGV2ICp4cnRjZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4+IC0gICAgICAgdW5z
aWduZWQgbG9uZyBsb25nIHJ0Y19wcGIgPSBSVENfUFBCOw0KPiA+PiAtICAgICAgIHVuc2lnbmVk
IGludCB0aWNrX211bHQgPSBkb19kaXYocnRjX3BwYiwgeHJ0Y2Rldi0+ZnJlcSk7DQo+ID4+ICsg
ICAgICAgdW5zaWduZWQgaW50IGNhbGlidmFsLCB0aWNrX211bHQsIGZyYWN0X3BhcnQ7DQo+ID4g
dGlja19tdWx0IGlzIG1lbnRpb25lZCBhcyBpbnQgaW4gcHJldmlvdXMgcGF0Y2ggYW5kIHVuc2ln
bmVkIGhlcmUuIEp1c3RpZnkNCj4gdGhlIHR5cGUgaW4gY29tbWl0IGRlc2NyaXB0aW9uLg0KPiA+
PiAgICAgICAgIHVuc2lnbmVkIGNoYXIgZnJhY3RfdGljayA9IDA7DQo+ID4+IC0gICAgICAgdW5z
aWduZWQgaW50IGNhbGlidmFsOw0KPiA+PiAtICAgICAgIHNob3J0IGludCAgbWF4X3RpY2s7DQo+
ID4+IC0gICAgICAgaW50IGZyYWN0X29mZnNldDsNCj4gPj4gKyAgICAgICBpbnQgZnJlcSA9IHhy
dGNkZXYtPmZyZXE7DQo+ID4+ICsgICAgICAgaW50IG1heF90aWNrLCBmcmFjdF9vZmZzZXQ7DQo+
ID4gUGxlYXNlIGZvbGxvdyByZXZlcnNlIHhtYXMgdHJlZSB2YXJpYWJsZSBvcmRlcmluZy4NCj4g
PiBBbHNvIGtlZXAgdGhlIGZyYWNfKiB2YXJpYWJsZXMgdW5pZm9ybSBpbiBib3RoIHNldCBhbmQg
cmVhZCBvZmZzZXQgZnVuY3Rpb25zLg0KPiBBZ3JlZWQsIEkgd2lsbCB1c2Ugc2FtZSBuYW1lIG9m
IHZhcmlhYmxlcyBhbmQgdHlwZXMgaW4gbmV4dCB2ZXJzaW9uLg0KPg0KPiA+Pg0KPiA+PiArICAg
ICAgIC8qIHRpY2tzIHRvIHJlYWNoIFJUQ19QUEIgKi8NCj4gPiBUaGUgY29tbWVudCBpcyBtaXNs
ZWFkaW5nLiBJdHMgdGlja19tdWx0IGlzIG5hbm9zZWNvbmRzIHBlciB0aWNrLCBub3QgYSB0aWNr
DQo+IGNvdW50Lg0KPiBBbnN3ZXJlZCBpbiBwYXRjaCAyLzQuDQo+ID4+ICsgICAgICAgdGlja19t
dWx0ID0gRElWX1JPVU5EX0NMT1NFU1QoUlRDX1BQQiwgeHJ0Y2Rldi0+ZnJlcSk7DQo+ID4gV2Ug
Y2FuIGZpcnN0IHZhbGlkYXRlIG9mZnNldCBhbmQgdGhlbiBjYWxjdWxhdGUgdGlja19tdWx0IHRv
IHJlZHVjZQ0KPiA+IENQVSBpbnN0cnVjdGlvbnMgaW5jYXNlIG9mIGludmFsaWQgaW5wdXRzDQo+
IEluIHRoaXMgcGF0Y2ggaXQgd291bGQgaW4gdGhlb3J5IGFwcGx5LCBidXQgd2hlbiBsb29raW5n
IGF0IHBhdGNoIDQvNCBZb3Ugd2lsbA0KPiBub3RpY2UgdGhhdCB3ZSBuZWVkIHRvIGZpcnN0IGNh
bGN1bGF0ZSB0aGUgaGVscGVycyBzbyBvZmZzZXQgaXMgdGhlbiBwZXJmb3JtZWQgYXMNCj4gc29v
biBhcyBwb3NzaWJsZS4NCj4NCj4gPj4gICAgICAgICBpZiAob2Zmc2V0IDwgUlRDX01JTl9PRkZT
RVQgfHwgb2Zmc2V0ID4gUlRDX01BWF9PRkZTRVQpDQo+ID4+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVSQU5HRTsNCj4gPj4NCj4gPj4gQEAgLTIyMywyOSArMjIzLDIyIEBAIHN0YXRpYyBpbnQg
eGxueF9ydGNfc2V0X29mZnNldChzdHJ1Y3QgZGV2aWNlDQo+ID4+ICpkZXYsIGxvbmcgb2Zmc2V0
KQ0KPiA+Pg0KPiA+PiAgICAgICAgIC8qIE51bWJlciBmcmFjdGlvbmFsIHRpY2tzIGZvciBnaXZl
biBvZmZzZXQgKi8NCj4gPj4gICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0KSB7DQo+ID4+ICsgICAg
ICAgICAgICAgICAvKiByb3VuZCB1cCBoZXJlIHNvIHdlIHN0YXkgYmVsb3cgYSBmdWxsIHRpY2sg
Ki8NCj4gPj4gKyAgICAgICAgICAgICAgIGZyYWN0X3BhcnQgPSBESVZfUk9VTkRfVVAodGlja19t
dWx0LA0KPiA+PiArIFJUQ19GUl9NQVhfVElDS1MpOw0KPiA+PiAgICAgICAgICAgICAgICAgaWYg
KGZyYWN0X29mZnNldCA8IDApIHsNCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgZnJhY3Rf
b2Zmc2V0ID0gZnJhY3Rfb2Zmc2V0ICsgdGlja19tdWx0Ow0KPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBmcmFjdF9vZmZzZXQgKz0gKGZyYWN0X3BhcnQgKg0KPiA+PiArIFJUQ19GUl9NQVhf
VElDS1MpOw0KPiA+IEl0IHdvdWxkIGJlIGJldHRlciB0byBhZGQgY29tbWVudCB0byBleHBsYWlu
IG9uIHRoZSBuZWdhdGl2ZSBvZmZzZXQNCj4gPiBib3Jyb3dpbmcgbG9naWMNCj4gSSB3aWxsIGFk
ZCBjb21tZW50IGFib3V0IHRoaXMuDQo+DQo+DQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
IG1heF90aWNrLS07DQo+ID4+ICAgICAgICAgICAgICAgICB9DQo+ID4+IC0gICAgICAgICAgICAg
ICBpZiAoZnJhY3Rfb2Zmc2V0ID4gKHRpY2tfbXVsdCAvIFJUQ19GUl9NQVhfVElDS1MpKSB7DQo+
ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIGZvciAoZnJhY3RfdGljayA9IDE7IGZyYWN0X3Rp
Y2sgPCAxNjsgZnJhY3RfdGljaysrKSB7DQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGZyYWN0X29mZnNldCA8PQ0KPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoZnJhY3RfdGljayAqDQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAodGlja19tdWx0IC8gUlRDX0ZSX01BWF9USUNLUykpKQ0KPiA+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIH0NCj4gPj4gLSAgICAgICAgICAgICAgIH0NCj4gPj4gKyAgICAgICAgICAg
ICAgIGZyYWN0X3RpY2sgPSBmcmFjdF9vZmZzZXQgLyBmcmFjdF9wYXJ0Ow0KPiA+IEl0cyBiZXR0
ZXIgdG8gdXNlIERJVl9ST1VORF9VUCgpDQo+IFBsZWFzZSBleHBsYWluIHdoeSwgdGhhdCB3b3Vs
ZCBjaGFuZ2UgdGhlIGVuZCByZXN1bHQgZnJvbSB3aGF0IGlzIGlzIG5vdy4NClRoZSB0cnVuY2F0
aW5nIGRpdmlzaW9uIGlzIGFjY2VwdGFibGUgYXMtaXMuIEdpdmVuIHRoZSBoYXJkd2FyZSdzIGRp
c2NyZXRlDQo0LWJpdCBmcmFjdGlvbmFsIGZpZWxkICgxNiBsZXZlbHMpLCB0aGUgcXVhbnRpemF0
aW9uIGVycm9yIGZyb20gdHJ1bmNhdGlvbg0KaXMgbmVnbGlnaWJsZSBjb21wYXJlZCB0byB0aGUg
ZnVuZGFtZW50YWwgaGFyZHdhcmUgcHJlY2lzaW9uIGxpbWl0LiBJZiB5b3UNCndhbnQgdG8gb3B0
aW1pemUsIERJVl9ST1VORF9DTE9TRVNUKCkgd291bGQgbWluaW1pemUgYXZlcmFnZSBlcnJvciwg
YnV0IGl0J3MNCm5vdCByZXF1aXJlZCBmb3IgY29ycmVjdG5lc3MuDQo+DQo+IFRoYW5rcywNCj4g
VG9tYXMNCj4NCj4gPj4gICAgICAgICB9DQo+ID4+DQo+ID4+ICAgICAgICAgLyogWnlucW1wIFJU
QyB1c2VzIHNlY29uZCBhbmQgZnJhY3Rpb25hbCB0aWNrDQo+ID4+ICAgICAgICAgICogY291bnRl
cnMgZm9yIGNvbXBlbnNhdGlvbg0KPiA+PiAgICAgICAgICAqLw0KPiA+PiAtICAgICAgIGNhbGli
dmFsID0gbWF4X3RpY2sgKyBSVENfQ0FMSUJfREVGOw0KPiA+PiArICAgICAgIGNhbGlidmFsID0g
bWF4X3RpY2sgKyBmcmVxOw0KPiA+Pg0KPiA+PiAgICAgICAgIGlmIChmcmFjdF90aWNrKQ0KPiA+
PiAtICAgICAgICAgICAgICAgY2FsaWJ2YWwgfD0gUlRDX0ZSX0VOOw0KPiA+PiAtDQo+ID4+IC0g
ICAgICAgY2FsaWJ2YWwgfD0gKGZyYWN0X3RpY2sgPDwgUlRDX0ZSX0RBVFNISUZUKTsNCj4gPj4g
KyAgICAgICAgICAgICAgIGNhbGlidmFsIHw9IChSVENfRlJfRU4gfCAoZnJhY3RfdGljayA8PA0K
PiA+PiArIFJUQ19GUl9EQVRTSElGVCkpOw0KPiA+Pg0KPiA+PiAgICAgICAgIHdyaXRlbChjYWxp
YnZhbCwgKHhydGNkZXYtPnJlZ19iYXNlICsgUlRDX0NBTElCX1dSKSk7DQo+ID4+DQo+ID4+DQo+
ID4+IC0tDQo+ID4+IDIuNDcuMw0KPiA+Pg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBIYXJpbmkg
VA0KDQpSZWdhcmRzLA0KSGFyaW5pIFQNCg==

