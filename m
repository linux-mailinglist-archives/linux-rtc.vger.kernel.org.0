Return-Path: <linux-rtc+bounces-5523-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10177CB0EF9
	for <lists+linux-rtc@lfdr.de>; Tue, 09 Dec 2025 20:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF2AD30C0C89
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Dec 2025 19:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DD7305E3E;
	Tue,  9 Dec 2025 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SQNnnJE/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696E2285C96;
	Tue,  9 Dec 2025 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765308531; cv=fail; b=lb6XLXNBsoiG15tz7GBxIRqUSj0i1vgDm4aw4m3WkW+ihedn1sCh27lfzGziNLMnekw2tjfNwYpikxb97+isreaReff2D3TPExgDzX4NVmIS1JD3doj2dRaDJNFa4JBamNrBDcEEFsJeKWx7rc6sqxUcm0siZf9BrGYl6pRosjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765308531; c=relaxed/simple;
	bh=/u5ybF9P7d4nLKrEYEsjsBKgjIXhuTUm95dXGcGsubk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XYVMR3tC8smkSBUy4tqxl2UluqwLsOx1XRAIv8/2eNwHwwhTKb8//aJvvAAZlXGBOUhx6sLPtw2QIkWiuUrD+apyzrJO2nBbBTIlMkWS9YKnxnahXzvVvh0imz7NOgxJT1s9HasQHL61P0tFoPiGZzuP9eI8nfH70rfYIw+iejs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SQNnnJE/; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMaGCmscooQYtovFedDgJ0jFz/cRHVvgz+usRSB+fZxx23hMDGWyZA8CQG9sI3h7Hmv/nOnK84g0CuEvpHZLtIZLVPSRwJsx2/i6UZeH9rcvOkS8BArJRZz5U9+muTchcUPo3jv2TF7yRwDPMMZZKXttnn8JQhElWOBED7WzaXgDlMjBok0hAF9qb3B4/ONzdin9MDVVUqnzynKXlqpA+C6bwEtSejJA0uPdjm/F4nW8jprpRPRh0EDUHLKPSWsb/k0DWCoXqfSNzTmXF8bVymoY4S7Ily2IP+l0XgBPLDilN787rhPiuAN+qjSTmvZztrZrfvgGF6TgzTlOysN/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/u5ybF9P7d4nLKrEYEsjsBKgjIXhuTUm95dXGcGsubk=;
 b=M/TUmTxuV9VZzwUJEASoZBSTscMhYMoverwFByB06Cxudu2SPWlSS1OfOxVjPmW/tvJ+HuEJaYfU6DnIbX41o6ENspcb7xc0OO8aN6cbKfoMyllzQr2onI7/vpX6H2N/R0cpMqOjxt/mV8h4+eHziUZFabWk8YH+PNeaCpQtNSmNjUWYMvyPJOoeOq5TEINZtQSjcqmU6Fitvv2FFYMefig3msBidwpJchjyrzBBGMQkL5dWDuhD8XtUpzxrMKqv758RCTjNwBonCrWtl1a60KHxGfLd4xlG1Q4t6Ezaxen7M+SJD3JRY9k8ARxYYJx05ip/yyxaNWDkKT5BH3pTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u5ybF9P7d4nLKrEYEsjsBKgjIXhuTUm95dXGcGsubk=;
 b=SQNnnJE/PyBtmBj/RDRT5ME4Hvw8urTmuLXwD74N3MQg6M0aKinwRirvuFjz5iyRdNZ6dmHaLZVOU4b6GXl7+OFgK9nGnnv+kjojRHr79VKqanfxZXelsuIm1ae6x3T3nu8vyp+MAlP2c3IoslQTssdzhPz7r1+/VtNUKtN8o0s=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 19:28:44 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 19:28:44 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
Thread-Topic: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
Thread-Index: AQHcYsGwjR9EqaGou0mm1zqAQ8hFQ7UZu2wA
Date: Tue, 9 Dec 2025 19:28:44 +0000
Message-ID:
 <LV5PR12MB98046A63E80D7A7FA299366E92A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-4-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-4-33875c1e385b@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-09T19:17:53.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|MW4PR12MB7142:EE_
x-ms-office365-filtering-correlation-id: 7b9c44b6-ce9b-4a93-323e-08de37592ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3NzbllsamhHeXd1OGtiZWZ6Z25PeUFwWm5nTm5MeWNIaWVoa1daSGhKcDdr?=
 =?utf-8?B?b09GRy9WTGtJdmRSSng3Qi8zNW9RN1dGc3N6ZmtzbEVzR0RObXZJMmYySFVX?=
 =?utf-8?B?ZDBNeFFIOFcrT3lLWFpaUDR6b2NSNGNadjRySUJhbE9qeDlVYlgvaTlSSVEv?=
 =?utf-8?B?a2NGZlVnZUhjS3lMWk50d2Z6SlAzTFg0REVXTGN6dGwrdEdXWFZqaDE5OXFx?=
 =?utf-8?B?eVBJWFRsdkxRb3QrcEZtMy9UUkptVkdEQkZENTJlQkYzc1hsVVZENmc3eDM3?=
 =?utf-8?B?SXJBN1kvb2lickpISVM0aGN3ejBTSTRERUNSNXFXSmM4VGNtamgwL09DUXl5?=
 =?utf-8?B?dzBBMEp2R3ZXVEhqZVpRaU9FTnBpbkZGbVhBVi81OFJNcHlOdlZzVTVzeTUx?=
 =?utf-8?B?dmxSWHUvWHZnOHJMNTFGR2VITUc5ODExVG81Wi9WaDM4VHA1czloMVBHTmZ1?=
 =?utf-8?B?U0RLSFkyQ3k1Rk82THJXaExRb2lTUnJ6QXNaZWlFZVMrS3RWT2R6SnU5djdQ?=
 =?utf-8?B?RGJnTDVwVG9TL2tEYjdFc1hZcWNNSlFwcmRVR3owc3VwazBkOWY5TmRQR0xk?=
 =?utf-8?B?aG4xNkg5cE50Y3kvaDZCVEFzVWtyUXNaaHJ3NU5DUXZmd09XNzBOVUN3aHdB?=
 =?utf-8?B?TGZIVGhaYS9adVNwanpjc1VqWnRwdzl3NENhc080dkFVZWtrL1RzempjRElv?=
 =?utf-8?B?S2xKZEd0NGZYQlBTRzFYTHdTNVJlUjNrSzhDdjBEMEdaVzVrY2xhMFRGRTZC?=
 =?utf-8?B?WDFYclhGZWhlbHkvdkN4VXREMGRBZ2RnaVgvZWNQTlRWcTB6bmVWZmhZTVpW?=
 =?utf-8?B?YnRIQzBGSy9Tcm5HNkR3OHk4bkIxSDlqK1dDL3QyRDBuNys2TWJnTUpiNjFY?=
 =?utf-8?B?K3huL1M0QzlnOHFmR05jTjFRL3BVb09XM1pCSXFBR1ZUdzdvMWJxUjZ6d1RQ?=
 =?utf-8?B?d2F6d3Y1ZWJ3VnEwbkhVZ2g4Qy9WVGxSOEZkZHNRSW14c1VNSzBzWVA1MEUz?=
 =?utf-8?B?ZEU2UENQZGdwK0pSL2c2YS9vUVJYbzFZcm52OERsMTZXNkEwUU9BbjNVcXVT?=
 =?utf-8?B?U3JxcS9PK1JFS1ExYlZCajczR0tWZW9yZFcxSkhwQ2cyQ0g1KzV4WWVEYWhM?=
 =?utf-8?B?ek1PYmFpOHdTQmc5L0RLMkxFc0NwMGNHY1VHTHllVWczUkJpOGNrekxCK1ZF?=
 =?utf-8?B?ZnF3ckFlNkVhbjhrVm1OdEM4VklqMFBuK2hva2J6ZG1DL2FjeldHaFhkQ3Yz?=
 =?utf-8?B?NitoTmIwYTgzenFuaThTRkpaYUNScGtIem5vQmV1R1JSSDFkUUFrVkRLSVYx?=
 =?utf-8?B?U1VNSlR3R0JwNU1oOGt3b2FnUmh6VWNZMnlYN2FjYW5RMjE0azdOWW5ONWpk?=
 =?utf-8?B?cDY3Q24xb2Nndm94VWJNbXlsbkxuSzJrSStzRUp3SG5IdWc2UmpWaFhVOU1y?=
 =?utf-8?B?WktFMTY2akRYMzI0UnJRV2M0NTZUUFh6eHhXYURuSGFtMnplZ3VIYnMreUlJ?=
 =?utf-8?B?dWh3NXJreXgyME9yZjN4WExHY1ZIN2hWMGhBWlgzM3F3OEpOeUtLaFZ1QWQx?=
 =?utf-8?B?T1VjSFdWN3lvYTBFTmpPL0QxdTNqS0Z1UGNhQUd6MWQ4UlFDV2NuZ2htY0Y1?=
 =?utf-8?B?NXRMWmgrclJtRHRSK3N2QWNDK0puVytpN3JnU2RDckQ1TWx4Tk5JMWV1d0Rw?=
 =?utf-8?B?b3RPTXJyWnNSTUZEYkl1VEltZm9iQ2xUc0RSamY3RlU5Y0ZaOVJMWGdMb3BU?=
 =?utf-8?B?K1NiUFFsaWlWSlVyN2dGeklBckdCREZNVFV6LzFxdFZpY2dmVUJBc2hVMTd1?=
 =?utf-8?B?cjE0aVpoczRxVUJ2b3hPeW9UQ0VQMTduUmpQZVpZdm5IaDZoRmcyWkFKdFNz?=
 =?utf-8?B?azZOM01pWk85VjMvZ09qSUZXUDM1VGNqTXhlV0ZDZ3A4cGUrYnplV3dEdDJN?=
 =?utf-8?B?dkZhcnpNOTNuUG9nRDJwY3NJQVFKOGxVVG9RLy9HZVRmMXpFMmRhUnNTckpr?=
 =?utf-8?B?WFVyaEhYY0NiTm5TVEMrSEdFSjRRN3QvUk1nM2ViS1pkWG44d3IwMEd5UzJ6?=
 =?utf-8?Q?ybIvD/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2dwNldMQml6V21VNzZxSmhxdGFqb3cxY25JVlk3RmZRTHdZSmVFZzkwOHY4?=
 =?utf-8?B?bDh5eGZLdlNtalFYemNidFBuNlg5cmpnbmhSWUhTVnpmMGVBWHVIbFhKZWZq?=
 =?utf-8?B?dW5MS29RSGZoMzd0ZXNDQXFDTHVjQXAvcVcrak1pa3Avbkdjek1VS1lGYytO?=
 =?utf-8?B?emVuMXV2VFMwMGY2a1FzNGRJS3diMmh1YzdBcVhsc0FOZFIvMHI3bEVJSmZN?=
 =?utf-8?B?M0Mrc3lkSmdhdUxWdkdWc0xpVFdhVnorb3RzQ0M0QU9idjJuSTArcXVOQ1Rp?=
 =?utf-8?B?UU1ObnZIdE5uK21VMW1TdzZUUWF4WmorL0JvamxyTklsNXc2bHgza2JkRVlz?=
 =?utf-8?B?bU5STkJvMG5oR2dPLzBUY1JWblhtM2hyNEx2Z2diQVZTVjF2UFlpa2JVYy9F?=
 =?utf-8?B?dXh1bXdTOG9qT08vMmZKbzBKdWNFZHQrMTYyaVc5THk0ZkRWcnprVDRIRVI4?=
 =?utf-8?B?Nm0wQzNXaEtEMGhPd1Y5UVV3QXpPOFZHVFZoRlpJR0VGMXNBTjBhL2NnSDNi?=
 =?utf-8?B?QUhKNWVhMjNYUGowQjBDOWJKS3Azb3d0RjdNbUFOU2QyMEJoU3FqZkc1Wklr?=
 =?utf-8?B?SjBZZUd6TEppRllCeUMyL2Q5UXEzMmV0U0JRWkxUQUVvU3d5OEFmcnlBYVVW?=
 =?utf-8?B?TDhPdEtTd0FvTURXbHBiT2pQUDZxcWs0SDI4SlhaNFlwYnB1NFIvc01GRHoy?=
 =?utf-8?B?TkZFd0lLT0dVT2NDbEZkN2Zjd05HMkdsQ2E3eFJDK2s1dE5ZUkRDY2w4cmNH?=
 =?utf-8?B?ZWdCeFlFdTBCaE1JVW1zaytqT0RBSnE5THpnQklxcmRHY0xIRm5SMzc4Vzhq?=
 =?utf-8?B?bkFKQ20zVHVJdDJqeFlKd0FBOGc1OGx1V0VSQ3R0V0hGMWVOeW1VUWIyVGJO?=
 =?utf-8?B?RHZDMWFFb1NwZDFlVVoxbzhMb2RnbEc3bnNHRW5salZwTXVuU1FzUDg1WXdV?=
 =?utf-8?B?VFBUak0rUmxPbkI3YTN5Zlk1cWNqUFJodXlBVUtodkZGOGhRQmNYdjdNalR6?=
 =?utf-8?B?T080Rk8zcVl2MVhqcFdaVW5ZWjJPUzZ6bHBsdUo0VzIzN1ZxMFVCSnJDM20w?=
 =?utf-8?B?bVFFZEo1VGhNdEdOQ3VoOVBWeldDR3ZWUTNoTHozRzRkMUpSc3dpLzRVbXBM?=
 =?utf-8?B?NzBOZk16M01RQ3RWSDQ0MzJQYWhWZktuVXBGUWZ4RXI2TVpyeEdqaFl2OC80?=
 =?utf-8?B?dkpxY2QvS29XdmZ6VDFLamsvK3dRL1dJOC9aejloMG9rMEVRUjVzNU15VmtU?=
 =?utf-8?B?Ny9nNXVQeWwxdHJTUDROOE9qWmxyZmttMjdQeDNvMkY4eWtKbk1tMXl2by9U?=
 =?utf-8?B?eFkxSnVyRndiU0ZENDE3Ly9vS3d6ekJ4bDhTdFQ2UlAxa1ZRbVVHR3lFMGFs?=
 =?utf-8?B?dHFodE9pVlRDSHJMbDIrNDgyV3hFTnpNYm4va2N5cmhSKzFDS216cTREU013?=
 =?utf-8?B?MFJiMmVGb0tvUFdKeW5oUHZHUVB5Zi9SdmJjeWxja29KVHJDNGdmdnJaZzhE?=
 =?utf-8?B?blZWYTdSQnhrUUVJalpRUWhRL3p3Wndvc0tqNlFRakRMSnB1TmY1UDFyVXJT?=
 =?utf-8?B?SU1CZWx0d1VRRTJSL01EWEhoMk80ZThXcXRzZ25Tc3dFS3p6MEZOaHVLOWh4?=
 =?utf-8?B?eEhtSkI2MHczTXY3K0UvaHUxRk9lYzV6NWlOZWRTTUZwb3FUdkNMUk5uYVJS?=
 =?utf-8?B?ZDhGejBDUzhHN0Z4L1JjeE9jb0s5NnNQSzU3dGxzRjl0d2JvbkZmWWoyNGVN?=
 =?utf-8?B?Q3ZJdldhMEVCeXIwcjYrK3c0ZVBlOVR1dGZnY012S2g3RGR5ZkpSMXpiZUJD?=
 =?utf-8?B?M2k4d1d4SmhPN3c2M25LWHJ5aUU0eSsvRDZwT3FQa1JVRVRJOVJnTytTaGlk?=
 =?utf-8?B?R29uSmkwQlFReEtDL1R4TFJ1dkgxNFYzYUxtOTloZTFkZEdFa3dtejF2SERl?=
 =?utf-8?B?S1YxRk8wWXl1QzJ2ZVdKUm02ZzU4ckkwRmpzT3RUSDJTZUdpblhJamtjVXBB?=
 =?utf-8?B?ZVAvWUpYWjhqbkFmN3UycTVObFhJRExzRlU1am9ucWJTZ1dHWDdLQ21DeVFk?=
 =?utf-8?B?disyMXY5OTM4SUlOSWZoTUZqWTh0R2xEaTVYWVNaQ1JXdmp2RDJacExzWWow?=
 =?utf-8?Q?62Fo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9c44b6-ce9b-4a93-323e-08de37592ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 19:28:44.3939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfmwmGDgLPLY1hwP8GwMIV1kgTuXqODCOFY1lho9vtPs3Xcwr7LC9Eb7T8dSqvDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEsIDIwMjUgNjoyMCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBU
b21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCA0
LzRdIHJ0YzogenlucW1wOiB1c2UgZHluYW1pYyBtYXggYW5kIG1pbiBvZmZzZXQgcmFuZ2VzDQo+
DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291
cmNlLiBVc2UgcHJvcGVyDQo+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlj
a2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gTWF4aW11bSBhbmQgbWluaW11bSBv
ZmZzZXRzIGluIHBwYiB0aGF0IGNhbiBiZSBoYW5kbGVkIGFyZSBkZXBlbmRlbnQNCj4gb24gdGhl
IHJ0YyBjbG9jayBmcmVxdWVuY3kgYW5kIHdoYXQgY2FuIGZpdCBpbiB0aGUgMTYtYml0IHJlZ2lz
dGVyIGZpZWxkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9tYXMubWVsaW5A
dmFpc2FsYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIHwgOCArKyst
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBiL2RyaXZlcnMvcnRj
L3J0Yy16eW5xbXAuYyBpbmRleA0KPiAzYmM4ODMxYmEyYzRjNGM3MDFhNDk1MDZiNjdhZTYxNzRm
M2FkZTNkLi4wY2ViYzk5YjE1YTZkZTI0NDBhNjBhZmMNCj4gMmJkMTc2OWVjY2ZhODRiMyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+ICsrKyBiL2RyaXZlcnMvcnRj
L3J0Yy16eW5xbXAuYw0KPiBAQCAtNDQsOCArNDQsNiBAQA0KPiAgI2RlZmluZSBSVENfRlJfTUFT
SyAgICAgICAgICAgIDB4RjAwMDANCj4gICNkZWZpbmUgUlRDX0ZSX01BWF9USUNLUyAgICAgICAx
Ng0KPiAgI2RlZmluZSBSVENfUFBCICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwMDAwMExM
DQo+IC0jZGVmaW5lIFJUQ19NSU5fT0ZGU0VUICAgICAgICAgLTMyNzY4MDAwDQo+IC0jZGVmaW5l
IFJUQ19NQVhfT0ZGU0VUICAgICAgICAgMzI3NjcwMDANCj4NCj4gIHN0cnVjdCB4bG54X3J0Y19k
ZXYgew0KPiAgICAgICAgIHN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGM7DQo+IEBAIC0yMTUs
MTIgKzIxMywxMiBAQCBzdGF0aWMgaW50IHhsbnhfcnRjX3NldF9vZmZzZXQoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPiBsb25nIG9mZnNldCkNCj4NCj4gICAgICAgICAvKiB0aWNrcyB0byByZWFjaCBS
VENfUFBCICovDQo+ICAgICAgICAgdGlja19tdWx0ID0gRElWX1JPVU5EX0NMT1NFU1QoUlRDX1BQ
QiwgeHJ0Y2Rldi0+ZnJlcSk7DQo+IC0gICAgICAgaWYgKG9mZnNldCA8IFJUQ19NSU5fT0ZGU0VU
IHx8IG9mZnNldCA+IFJUQ19NQVhfT0ZGU0VUKQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1F
UkFOR0U7DQo+IC0NCj4gICAgICAgICAvKiBOdW1iZXIgdGlja3MgZm9yIGdpdmVuIG9mZnNldCAq
Lw0KPiAgICAgICAgIG1heF90aWNrID0gZGl2X3M2NF9yZW0ob2Zmc2V0LCB0aWNrX211bHQsICZm
cmFjdF9vZmZzZXQpOw0KPg0KPiArICAgICAgIGlmIChmcmVxICsgbWF4X3RpY2sgPiBSVENfVElD
S19NQVNLIHx8IChmcmVxICsgbWF4X3RpY2sgPCAxKSkNClRoZSBjaGVjayAnZnJlcSArIG1heF90
aWNrIDwgMScgc2hvdWxkIGJlICc8MicgdG8gcHJldmVudCB3cml0aW5nIDAgdG8gdGhlIGNhbGli
cmF0aW9uIHJlZ2lzdGVyIHdoZW4gZnJhY3Rfb2Zmc2V0IDwgMCBjYXVzZXMgbWF4X3RpY2stLS4N
CkV4YW1wbGU6IGZyZXE9MzI3NjcsIG1heF90aWNrPS0zMjc2NiBwYXNzZXMgKHN1bT0xKSwgYnV0
IGFmdGVyIGRlY3JlbWVudCBiZWNvbWVzIGNhbGlidmFsPTAuDQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVSQU5HRTsNCj4gKw0KPiAgICAgICAgIC8qIE51bWJlciBmcmFjdGlvbmFsIHRpY2tz
IGZvciBnaXZlbiBvZmZzZXQgKi8NCj4gICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0KSB7DQo+ICAg
ICAgICAgICAgICAgICAvKiByb3VuZCB1cCBoZXJlIHNvIHdlIHN0YXkgYmVsb3cgYSBmdWxsIHRp
Y2sgKi8NCj4NCj4gLS0NCj4gMi40Ny4zDQo+DQoNClRoYW5rcywNCkhhcmluaSBUDQoNCg==

