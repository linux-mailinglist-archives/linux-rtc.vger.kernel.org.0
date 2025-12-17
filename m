Return-Path: <linux-rtc+bounces-5585-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44112CC94B5
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 19:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB573016726
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 18:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60FB2D9EE7;
	Wed, 17 Dec 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="09J2sIIN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732121D3F0;
	Wed, 17 Dec 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765996215; cv=fail; b=Iy3/tJFP0FMD5zTq15I7UsXH2b7qT+wFSq/327oq/0GgbjTJph1kIBjnrucuaqXcoE0Gv6TLq0XAaukqpwv0cBPZBs8raOhfhWwd6/cLG1r7TUKoNLji56+j6xtoeTIXMZ/kjGnrYjPPM7mGkOMmv5w+iQep59Ybq/URPtxBE0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765996215; c=relaxed/simple;
	bh=yrZXlhH8rYUBhaiC4qhvxLMkBiB8AaypNdEiN/x8rrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lVV2BAYqaQDNTpAIgCvvPEumCnYuE8GCu9SFvEcYs8TSs8A/6UqqFCafjT3GZoEoi+YZyoP3j4ZUzUyg3aOnXskD/MPS3pI8zrhRaKARof2BWYZj5JcOWBpri5sbsJZd23jUCm4WgTa/GcW6zzhHKBr21J78+HagRgWEwsdIr3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=09J2sIIN; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIKjWH6Uym7Brm8nEsTYCI3cjfGosVaam96cH4yxjY/bQx95UZlWEOt/DAMp0PY+y8oYmH6oTKsi3obT/alrlw/AuGyI8EOlcPKeGvUiTU1Eve7Nu3ZUm8RJ+cppXJKoa7AjMdwsSOEZgmzsXrgAAXQ26UtuQJ3pr/UnCCy5yWmbE78u+WpUuvTsJ64J6ZrFnpc2JkaGZUuHC0izp+1sqbsxDgco8ypbd2kQKofCaJz+O31oJRYlTFMrK6ZVMgz7YFuegzCNM13ILZNmrTprZAEQMNMf/pxSvu85OfwkbUkoIBE8Cv9Z18wm8KarvRaRlY3HlUE71gyqS9YUx6FJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrZXlhH8rYUBhaiC4qhvxLMkBiB8AaypNdEiN/x8rrc=;
 b=cP2bmnY8vDcRLSNwy0JYdzuabOoq5IqsrYRQkj/KIvIAddtD+6QRb/nyLMAnV0jQKIAl0HFPa5c2uuT/sNjkdbf0Nh3IlxbRWNH2gH3naaIEN9V1rrYUV7jHNncPKFum6csJJwqk80d3mP3iWH8Y2DAedpcUAv6Krke/SCbMG6lHkeqFKztXpM1MqpS+YMO2PHvhkJxgC/IDCEDfMzdT6zv8Wd9VcDTqnKKiGBsm01wbg3L7jBXAyBGf5ErjVCUFMFJEHXQODzMyGuUQzPL/ngBGi8odTuUD4Wlg/opPYH62tcKVDFd75hapKljvHN5HZU/5w//MFX/qlUu4YwJg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrZXlhH8rYUBhaiC4qhvxLMkBiB8AaypNdEiN/x8rrc=;
 b=09J2sIINbN0l6rT/lNlmhjOgb+1U7RIc8AC+VZVeTWltoToQRRcanJkvUWXROHlfHU9prksAU5ekYq3FtyHsIvVyfTC7o/KESJgjx8YhUyOIRfJtjlMcBSfZCXOgqLVxkVBfwGxrrbDByIMn7KAn+Pt6ysckQvxpLELPoYbecYY=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:14:30 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 18:14:30 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] rtc: zynqmp: rework read_offset
Thread-Topic: [PATCH 2/4] rtc: zynqmp: rework read_offset
Thread-Index: AQHcYsGeU/4XimW1VUeZiZVleqbaRbUZmg4AgAE6vwCAC14T0A==
Date: Wed, 17 Dec 2025 18:14:30 +0000
Message-ID:
 <LV5PR12MB980448D3F4109DC0775A56AA92ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
 <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
 <353422a2-ba6e-4600-9326-e0cee2098062@vaisala.com>
In-Reply-To: <353422a2-ba6e-4600-9326-e0cee2098062@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-17T17:40:26.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|PH0PR12MB7469:EE_
x-ms-office365-filtering-correlation-id: 4aa41153-0795-4eb9-c14b-08de3d981f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWs4ZXhTSWg5Y05rUi9XSUxtWEl4YWM4Z1ZrbWloTkRabHFwWWNvYVZia1Vj?=
 =?utf-8?B?bTdreE1EdmhqbThFVWV6dHUrM2tNaFVkaTFjVWd6S2c5ZFZXTGRsWldOb0o2?=
 =?utf-8?B?T3I5OUNZQWhhaytLTjRWckhCcHRPQ0x6SGRqc2dGdmJJVzhJNFBwTWZUVEJ5?=
 =?utf-8?B?THd1RHJtUnJFenpmRmFvOFdNeUpmODB3a1pHRWxYUFcxaVpoc3ErRHpvS2li?=
 =?utf-8?B?ZUVJdXZPT09qQ2xLMWovTWI1bGlwK2RySkFjWVF3ZzVNd2dMQmVCUGoyRkNM?=
 =?utf-8?B?djlYdEtqN04rSkZIZ1FtSVFoNzRjczFSeWpSL0JUbHdvWS9sakRuME5OZkhv?=
 =?utf-8?B?WXRRWWQ4TmQ2d1pJZVFQZ25qUFhFUWxQSFB4KytGQkZ3SDQzWll3c1ZJOVRX?=
 =?utf-8?B?eVhtSUtSZ1g1RStYc1k5VnhpRmVmOWJHb3k3eHlmUGphTHNDbFpOUjNKdk1V?=
 =?utf-8?B?bWFMREZmUjZNaHhRVzRMNVQ4S1lIWmxNOXhhS1dtR29lczFwalUvZmZHTTli?=
 =?utf-8?B?aG5rakx6UlgxZ2dJUE5ZVXZDazZiZjVIcVpTNXBjQStndkk5czYxTGVFNCtN?=
 =?utf-8?B?MXlFSy8rUWsyNDMxMEYrZFVKNUs4OUptbzhkSDRiTWpmWHdpZnMwdldudTd2?=
 =?utf-8?B?ZElHQXdtcm5IakJzRDdpbVNzSzJoaG5SaWdKd3hZdGQxRjFWU0NibmM2c3pI?=
 =?utf-8?B?ZUxnVHF4WDVBcEMvd0M1OGI4TEkwOWlrSGMzVUdQVFZ0R1BYS3Q4WHhrSlM5?=
 =?utf-8?B?ajN6UW5JMWNNV3FUOXQwN0ErZ1hEZW5oVHk4dUdMMWlvb3Q0dHAyWkhHdkpO?=
 =?utf-8?B?ZUlCQWF0ZTBtM25wa28vWm43Z1ZEbk9lNXJWZ2ZTVS9vNXhuMEVKd0RnVjJG?=
 =?utf-8?B?L1dPVlV2WkMwUnFEZWdhbEg3Mkh1RWNLTEhNY3pUSEdsRFg2cHpIS2hxN0R3?=
 =?utf-8?B?cDhZbTVKaFFrZDRIR2xVNWlSemdnSkt1SGRyVkVsNWN0dmpqTklwcDR6cUpK?=
 =?utf-8?B?QXVkc1ZVam52ZGZFOUF4NmNFQjhhcVJHV25KYWZMM3dWVDdoc3hTV0NJQkU2?=
 =?utf-8?B?T29UNW5PV0RXZ0lWWGszWTVNbEJjL21MaTJiSm5VVUFZTFhNZzZrQ2xwZmNX?=
 =?utf-8?B?RW1VZDlHQlRxTUt5ZUNJYWtCckNVWVpFU3YxaDdyb0xHZUpDL3R5dHRtUTc0?=
 =?utf-8?B?M0RqYnZBWHY2SkZxQkVuT3duakRod0hrb1cvOVRpalRvRlBFdyt6K05BOUMz?=
 =?utf-8?B?RzBaZjlsRENkdnlGS3FvcmIzQ0tPRHlYNFZ4N1J5TWhQTlpxY1E0VVV5dTF0?=
 =?utf-8?B?M2FLUVdXSThlVFo3Smh2MFdEWktZYkRVZHRicC9Gak9RRjlFTC9uM3p5cmlY?=
 =?utf-8?B?NnErcmZxa3RiaGFXbm1xOGdXeXdCcU02QWdqMGNxd28zTEVvVkl1MWdDVVlW?=
 =?utf-8?B?TDVPd0xGRXdlSndKb0FnTFdLNC9nbjJaWFY1Y3o0L0RldjJzVE1CNENaejhj?=
 =?utf-8?B?dEFocjhhVE05c0pPNHlNclVjYld4cmwvT2ZzbXJVVVVxZWZ6U1dDWGRGQ2hi?=
 =?utf-8?B?cnVTZFJWQ0lUR0gxMTVtL1dRL216b2lVbVVvVWtjSnZzak40UzhORWtGdXll?=
 =?utf-8?B?S1BRQVdnUUpRVXJKblF0TWxoRE8wckFDQ0pHckR3TE1WbE5WQlBYYkZaamN5?=
 =?utf-8?B?OEJ4bXhWVlJzcnl2WjdsNG5id2F3V21Rc0liajdobmlsUndCTTJSMi9DZE9K?=
 =?utf-8?B?b1JLUkZwMUVwMm5Fbld1OXpuTGlKMy81dVd5Q21rUXJNeVdYaXZxdmVHTTNa?=
 =?utf-8?B?NnFKaDU1TWMyOUs0NTE4WWJ5UTN1Z2FhSUYxaU5sc3dCVHJnNThYR0wwVlFK?=
 =?utf-8?B?cE1HYm83alpVOERJYUZPQ2svSHNMc01tLzBacElSZUJKUnhsOFFyV3d2ajRp?=
 =?utf-8?B?S1NoQWxsUmNKUXlCcFo2VGZLVGl6SEdGSS9oVk5xUDVIV1o5ZkxCaktCWDZ2?=
 =?utf-8?B?Ulh5SnJKM0E0SGx0M1Iza3dlbGNJOTNwUFdPTlUzV2FBaDFUYjZXSGQ4V3pX?=
 =?utf-8?Q?KlyilC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWR2RWt6RkxOaWV4c2hjN2VGM0FoRDlXdHBmVDdDWlNNQVlWVTZtSzA0Z1JJ?=
 =?utf-8?B?M01UK1N1S3NpQTcrcmJDRk92aWtkM3IxUEZUanQrWi9HazUyQmtlK3hxUitK?=
 =?utf-8?B?VWN1Z1hCanJlZTMvcEFkT2lxNkJXd0N6VDUwWGswR1djQ0h3ZEErTDcreG54?=
 =?utf-8?B?alNVeTMwNmgrNWNTdy9jbXBEZjdWZFR2cFRORmQrckpxVEo4U1c1SnZhVXZP?=
 =?utf-8?B?N1N5TGIvOUlKNVlSVUFnR0R4ZFBQZFYvL0JSdExXTkU3b1cyQ1Q2SGJPNGEv?=
 =?utf-8?B?L3BkK2pYampoZS9ZY244c1BCclVINEp3R1FXWnNmekVuVXRoOGU1QVZkQVdZ?=
 =?utf-8?B?OENUd1BSQTMrR3BJaDVjVnBqNFVEREQrZ2RXR1E3T0d0ZlZ4eFAzUVJNVE1Q?=
 =?utf-8?B?UUNqcFBEdW40Uk1iakxkREdleFRVTE51d0gzckR0b0FRNVdBNmoydy9wRlZN?=
 =?utf-8?B?akZSWWlJYWd1ajRqMDJzS2RDOWs0TWpEeWdTWm90VTk5blZqTUtPRWtNc1Np?=
 =?utf-8?B?RURHdEw5czF0YzJjTkU0Q3E0WU02cURsYjF6MkRTbmJkR2ZTdmYrOU05T2tK?=
 =?utf-8?B?Nkx5V01VV01qbnJXcGFpOG1OVERNQlYzQUdoVWk2djFpbUpqOEVUTlZoWDhJ?=
 =?utf-8?B?aHpONi9wbWdiN3BQd1AveGMxOWNEamdXVXY1cGtJeXNkZDd0WkVpdnpXbTcv?=
 =?utf-8?B?eHNqRjVKUDJIeml2NGZ3WjFEOEpEQTdtWjVYRi93SDFTdVpVV1laU25VNC9t?=
 =?utf-8?B?a1lkL2d0VVVPMzRYUkVKaXJTanROTXhtK2FERCtvVjNUNlh3bmpGbSt4Y09k?=
 =?utf-8?B?dUdFUmNXZmU4bkdaaGpiMkxFZ081QVN0emcxU3FLd1NNL01vZnRUeks3Zksz?=
 =?utf-8?B?ZXV2bmdvbzlZNy9CN2grKzFyQjhaNVZjU2JjV2ZMcXNpQ01ocS9iV3NJZks1?=
 =?utf-8?B?NzdURnZxOG5TSi9wUHdLeFJiMzNuaDkvQm9WeThJOVJieUVpYWZDMk5FOHJs?=
 =?utf-8?B?TUVYZ3kvK3h2ZHZWbXRTeVk0aTlDdjBJTGNIRE1mWWt4cHkrYU9qNzVLSVNK?=
 =?utf-8?B?ZnpacUlHRUxLeFB4NWcrcDUxa2FzSjYwbTRxQzVzelRycGtDd1l4QnNmU1ZV?=
 =?utf-8?B?QUNXdmJGUWU1NkZobzMzcHJ4UDRFcXVWRTgvRFJqTzdvM0VjUWZ6a2lrcFNL?=
 =?utf-8?B?RHg4ZVNaUFB3dFJsamltS3p5TkZNbHdnbG1XbSs4V2Nnd0Q3dWNKek5RcDBa?=
 =?utf-8?B?bFFFYTlicWkvWWpNNEVWR2l6bTIzN0JOSnNsUmRLdHN0ckNhUkpJaGFudi96?=
 =?utf-8?B?SXRLb0wyZGxjTnNNNHg2MHVBdDVpb2o1RWpPWG5YejV1WUlqUGh2RmhCNDE3?=
 =?utf-8?B?Y0pFYVBQYmJKbGRvdG1XQmVnSnV4L2V3dFdpb0FUTmRTZjYwdk4rQ0JXR29F?=
 =?utf-8?B?bDQ1SUdUMExoQmY4SVRPSmxiRHhnRTFVOFlPK3ZrMmtpczJHMXpITGpBdkJO?=
 =?utf-8?B?bXpzcStqV2dyS2Q2NktzdTRCQ0dPbkhmSUZqMXFtNUJ6WHJGa0JKZTNKT3Jt?=
 =?utf-8?B?cDdwY2plWVFER1RwNmlQL0djN2tCSk1yQ0JCMm8wQXhvNjQ3QzNDcFdzWTdu?=
 =?utf-8?B?eUs4dmtRN3ZrMlVXVFlOcklxbHlacEUxQk5zOXN5OC9BOTRDWVVEWlh6ek1C?=
 =?utf-8?B?K21nWUJtVEVhdFIwQTVWVm1YMEpCV2RDTFlYTjg1eXdocVhPaXZHd0NEWFJa?=
 =?utf-8?B?bGdUbk9uSWlhN2JSdGlJc3NPSm5MMWw0NlpQenpreGorcjFxTm9SS3R1dzVC?=
 =?utf-8?B?b011TjhLL0pYK3BhaXd3ay8xT2JMOE85Qjl4dEYxWXBPRzRPMDNkR3lEcW9i?=
 =?utf-8?B?SzdUcythZWp6M0FuTFBScUR6cFR4eW0zS2dzaTVJa21QdVNjK0lTaXBCZkZ0?=
 =?utf-8?B?Zmw3RHNBcHcrYmxtSlRUb0hlWUx6NlVnTlgwaFBIZjFkWjQveEw0YUEweVps?=
 =?utf-8?B?cngrSlplUWxXZlRBd3BEQlpjbG4rS3I2dG1QdEJwRUdMSEp5QlZTdkZIWDd6?=
 =?utf-8?B?WG9ZeDd0SnhNM2JLc1F0anUxMGNSdHl3OEY4NnloNkcrcU5IOGJEZldWMGRp?=
 =?utf-8?Q?BJQE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa41153-0795-4eb9-c14b-08de3d981f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 18:14:30.6981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzdA8vyYX9qpatZaeNoELH14byrTbfB5ualbf+UCMv7wtP5HGb1rLOGM2vMrOElz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IERlY2VtYmVyIDEwLCAyMDI1IDU6MzUgUE0NCj4gVG86IFQsIEhhcmluaSA8SGFyaW5pLlRAYW1k
LmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNv
bT47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBDYzogbGludXgtcnRj
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
NF0gcnRjOiB6eW5xbXA6IHJld29yayByZWFkX29mZnNldA0KPg0KPiBDYXV0aW9uOiBUaGlzIG1l
c3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0
aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3Bv
bmRpbmcuDQo+DQo+DQo+IEhpLA0KPg0KPiBPbiAwOS8xMi8yMDI1IDE5OjI4LCBULCBIYXJpbmkg
d3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlz
YWxhLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAxLCAyMDI1IDY6MjAgUE0NCj4g
Pj4gVG86IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47
IFNpbWVrLCBNaWNoYWwNCj4gPj4gPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiA+PiBDYzogbGlu
dXgtcnRjQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiA+PiBsaW51eC0ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgVG9tYXMgTWVsaW4gPHRv
bWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggMi80XSBydGM6IHp5
bnFtcDogcmV3b3JrIHJlYWRfb2Zmc2V0DQo+ID4+DQo+ID4+IENhdXRpb246IFRoaXMgbWVzc2Fn
ZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+ID4+IGNh
dXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9u
ZGluZy4NCj4gPj4NCj4gPj4NCj4gPj4gcmVhZF9vZmZzZXQoKSB3YXMgdXNpbmcgc3RhdGljIGZy
ZXF1ZW5jeSBmb3IgZGV0ZXJtaW5pbmcgdGhlIHRpY2sNCj4gPj4gb2Zmc2V0LiBJdCB3YXMgYWxz
byB1c2luZyByZW1haW5kZXIgZnJvbSBkb19kaXYoKSBvcGVyYXRpb24gYXMNCj4gPj4gdGlja19t
dWx0IHZhbHVlIHdoaWNoIGNhdXNlZCB0aGUgb2Zmc2V0IHRvIGJlIGluY29ycmVjdC4NCj4gPj4N
Cj4gPj4gQXQgdGhlIHNhbWUgdGltZSwgcmV3b3JrIGZ1bmN0aW9uIHRvIGltcHJvdmUgcmVhZGFi
aWxpdHkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFRvbWFzIE1lbGluIDx0b21hcy5tZWxp
bkB2YWlzYWxhLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMg
fCAyNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBiL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiA+PiBp
bmRleA0KPiA+Pg0KPiA4NTZiYzE2NzhlN2QzMTE0NGYzMjBhZTlmNzVmYzU4Yzc0MmEyYTY0Li43
YWY1ZjZmOTk1MzhmOTYxYTUzZmY1Ng0KPiBiZmM2DQo+ID4+IDU2YzkwNzYxMWI5MDAgMTAwNjQ0
DQo+ID4+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiA+PiArKysgYi9kcml2ZXJz
L3J0Yy9ydGMtenlucW1wLmMNCj4gPj4gQEAgLTE3OCwyMSArMTc4LDI4IEBAIHN0YXRpYyB2b2lk
IHhsbnhfaW5pdF9ydGMoc3RydWN0IHhsbnhfcnRjX2Rldg0KPiA+PiAqeHJ0Y2RldikgIHN0YXRp
YyBpbnQgeGxueF9ydGNfcmVhZF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LCBsb25nICpvZmZz
ZXQpICB7DQo+ID4+ICAgICAgICAgc3RydWN0IHhsbnhfcnRjX2RldiAqeHJ0Y2RldiA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiA+PiAtICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBydGNfcHBi
ID0gUlRDX1BQQjsNCj4gPj4gLSAgICAgICB1bnNpZ25lZCBpbnQgdGlja19tdWx0ID0gZG9fZGl2
KHJ0Y19wcGIsIHhydGNkZXYtPmZyZXEpOw0KPiA+PiAtICAgICAgIHVuc2lnbmVkIGludCBjYWxp
YnZhbDsNCj4gPj4gKyAgICAgICB1bnNpZ25lZCBpbnQgY2FsaWJ2YWwsIGZyYWN0X2RhdGEsIGZy
YWN0X3BhcnQ7DQo+ID4gUHJlZmVyIG9uZSB2YXJpYWJsZSBhc3NpZ25tZW50IHBlciBsaW5lIGZv
ciByZWFkYWJpbGl0eS4NCj4gVGhpcyBpcyBhZnRlciBhbGwgcXVpdGUgY29tbW9uIHByYWN0aWNl
LCBhbmQgaW4gYSBmdW5jdGlvbiBsaWtlIHRoaXMgd2hlcmUgc2V2ZXJhbA0KPiB2YXJpYWJsZXMg
YXJlIG5lZWRlZCwgSSB3b3VsZCBhcmd1ZSB0aGF0IHRoaXMgaXMgbW9yZSByZWFkYWJsZSB0aGFu
IHRoZQ0KPiBhbHRlcm5hdGl2ZS4gSXMgdGhlcmUgc29tZSBjb252ZW50aW9uIEknbSBub3QgYXdh
cmUgb2Y/DQpUaGVyZSBpcyBubyBzdWNoIG1hbmRhdG9yeSBjb252ZW50aW9uLiBJdCdzIHVwIHRv
IHRoZSBSVEMgbWFpbnRhaW5lci4NCj4NCj4gPj4gKyAgICAgICBpbnQgbWF4X3RpY2ssIHRpY2tf
bXVsdDsNCj4gPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZXhwbGFpbiB3aHkgdGlja19tdWx0IGlz
IGNoYW5nZWQgdG8gaW50IGluIHRoZSBjb21taXQNCj4gbWVzc2FnZS4NCj4gVGhpcyBpcyBwYXJ0
IG9mIHRoZSByZWZhY3RvcmluZywgbWl4aW5nIHNpZ25lZCBhbmQgdW5zaWduZWQgdmFyaWFibGVz
IGluDQo+IG9wZXJhdGlvbnMgaXMgbW9yZSByaXNreSB0aGFuIGhhdmluZyBzYW1lIHR5cGUuDQpJ
IGFncmVlLiBCdXQgdGlja19tdWx0IGlzIGludCBpbiByZWFkX29mZnNldCBhbmQgdW5zaWduZWQg
aW4gc2V0X29mZnNldC4NCkl0IHdvdWxkIGJlIGJldHRlciBpZiBib3RoIHVzZXMgaW50IHRvIG1h
aW50YWluIGNvbnNpc3RlbmN5IGR1cmluZyB0aGUgbWF0aCBvcGVyYXRpb25zLg0KPg0KPiA+PiAr
ICAgICAgIGludCBmcmVxID0geHJ0Y2Rldi0+ZnJlcTsNCj4gPiBQbGVhc2UgZm9sbG93IHJldmVy
c2UgeG1hcyB0cmVlIHZhcmlhYmxlIG9yZGVyaW5nLg0KPiBPayBmaXhpbmcgdGhpcyBhbmQgb3Ro
ZXIgb2NjdXJhbmNlcy4NCj4NCj4gPj4gICAgICAgICBsb25nIG9mZnNldF92YWw7DQo+ID4+DQo+
ID4+ICsgICAgICAgLyogdGlja3MgdG8gcmVhY2ggUlRDX1BQQiAqLw0KPiA+IFRoZSBjb21tZW50
IGlzIG1pc2xlYWRpbmcuIEl0cyB0aWNrX211bHQgaXMgbmFub3NlY29uZHMgcGVyIHRpY2ssIG5v
dCBhIHRpY2sNCj4gY291bnQuDQo+IFBlcmhhcHMgdGhlIGNvbW1lbnQgd2FzIG5vdCB3ZWxsIGZv
cm11bGF0ZWQuIEkgc3VnZ2VzdCBjaGFuZ2luZyB0bw0KPiAvKiBUaWNrIHRvIG9mZnNldCBtdWx0
aXBsaWVyICovDQo+ICBhcyB0aGF0IGl0IHdoYXQgaXQgaXMgcHJpbWFyaWx5IHVzZWQgZm9yLiBX
b3VsZCB0aGF0IGJlIG9rYXkgZm9yIFlvdT8NClllYWgNCj4NCj4gVGhhbmtzLA0KPiBUb21hcw0K
Pg0KPiA+PiArICAgICAgIHRpY2tfbXVsdCA9IERJVl9ST1VORF9DTE9TRVNUKFJUQ19QUEIsIGZy
ZXEpOw0KPiA+PiArDQo+ID4+ICAgICAgICAgY2FsaWJ2YWwgPSByZWFkbCh4cnRjZGV2LT5yZWdf
YmFzZSArIFJUQ19DQUxJQl9SRCk7DQo+ID4+ICAgICAgICAgLyogT2Zmc2V0IHdpdGggc2Vjb25k
cyB0aWNrcyAqLw0KPiA+PiAtICAgICAgIG9mZnNldF92YWwgPSBjYWxpYnZhbCAmIFJUQ19USUNL
X01BU0s7DQo+ID4+IC0gICAgICAgb2Zmc2V0X3ZhbCA9IG9mZnNldF92YWwgLSBSVENfQ0FMSUJf
REVGOw0KPiA+PiAtICAgICAgIG9mZnNldF92YWwgPSBvZmZzZXRfdmFsICogdGlja19tdWx0Ow0K
PiA+PiArICAgICAgIG1heF90aWNrID0gY2FsaWJ2YWwgJiBSVENfVElDS19NQVNLOw0KPiA+PiAr
ICAgICAgIG9mZnNldF92YWwgPSBtYXhfdGljayAtIGZyZXE7DQo+ID4+ICsgICAgICAgLyogQ29u
dmVydCB0byBwcGIgKi8NCj4gPj4gKyAgICAgICBvZmZzZXRfdmFsICo9IHRpY2tfbXVsdDsNCj4g
Pj4NCj4gPj4gICAgICAgICAvKiBPZmZzZXQgd2l0aCBmcmFjdGlvbmFsIHRpY2tzICovDQo+ID4+
IC0gICAgICAgaWYgKGNhbGlidmFsICYgUlRDX0ZSX0VOKQ0KPiA+PiAtICAgICAgICAgICAgICAg
b2Zmc2V0X3ZhbCArPSAoKGNhbGlidmFsICYgUlRDX0ZSX01BU0spID4+IFJUQ19GUl9EQVRTSElG
VCkNCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgKiAodGlja19tdWx0IC8gUlRDX0ZSX01B
WF9USUNLUyk7DQo+ID4+ICsgICAgICAgaWYgKGNhbGlidmFsICYgUlRDX0ZSX0VOKSB7DQo+ID4+
ICsgICAgICAgICAgICAgICBmcmFjdF9kYXRhID0gKGNhbGlidmFsICYgUlRDX0ZSX01BU0spID4+
IFJUQ19GUl9EQVRTSElGVDsNCj4gPj4gKyAgICAgICAgICAgICAgIGZyYWN0X3BhcnQgPSBESVZf
Uk9VTkRfVVAodGlja19tdWx0LCBSVENfRlJfTUFYX1RJQ0tTKTsNCj4gPj4gKyAgICAgICAgICAg
ICAgIG9mZnNldF92YWwgKz0gKGZyYWN0X3BhcnQgKiBmcmFjdF9kYXRhKTsNCj4gPj4gKyAgICAg
ICB9DQo+ID4+ICsNCj4gPj4gICAgICAgICAqb2Zmc2V0ID0gb2Zmc2V0X3ZhbDsNCj4gPj4NCj4g
Pj4gICAgICAgICByZXR1cm4gMDsNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi40Ny4zDQo+ID4+DQo+
ID4gUmVnYXJkcywNCj4gPiBIYXJpbmkgVA0KPiA+DQo+DQoNClJlZ2FyZHMsDQpIYXJpbmkgVA0K

