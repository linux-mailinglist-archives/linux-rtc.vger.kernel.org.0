Return-Path: <linux-rtc+bounces-6950-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DZTBFHbaTGrCqwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6950-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Jul 2026 12:52:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E071AA71
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Jul 2026 12:52:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HU9NAPPb;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6950-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6950-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44ED6304BB54
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jul 2026 10:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831A83EE1DC;
	Tue,  7 Jul 2026 10:50:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE33E0C5C;
	Tue,  7 Jul 2026 10:50:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421409; cv=fail; b=qkjwHkql56O9eSsYnAQ5kfIXwgCLa9v6yMAZEaZ0O8UZBdLtmZPdq02Cy8r76aRzpoQGmdaIcHaDI+ozQCG0N9vEhwjMbjnFhDJT7ZmfOf2+PojB4/iJbJ+hzPhEQbOeoa/K6YfBNSA/N9Nu67vc18/stpUSFOVU5mQxOKjqiOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421409; c=relaxed/simple;
	bh=GFjvtOYXk+d8zMso0vYA5a7SNV73MJFn+H20+xHPChg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YxM9b7WiC2Wtv/qC3b4kCjxDMGvuls5FcDKrigD1uYAuVCuuFAHukjKwF/qQ235YkRbDwq81C5+XmHVeXn5mocYd9MCK0PzRSBNl1MOgqdiII62XpAav51wvuHMYNf8Ctiq/HNg9VIy+dvPoM7S68jlu/Tdp0W3mM2gEew9iGEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HU9NAPPb; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwKmHvhXGNFoo6+x13/t6awz0Gr4Aal3K4Shy71nWx/wNPU9Zw03SIZbUWAXIekRVv3ptacZY8YNxYMyUPTxAstol4BLuYVqH1g5l07hdCZRQBeYWhHEgVclzvKz17eOhqaSKA5sw04yh3fzAToysGCWzOjoYkaxGux2SzmqVUai/SCLUCMSax0g4V5qLxRe8yt0pufsMkEIFLBCJFDdA9pCgWc0jRWGUuMf8kx9JJ5uFvTrgDh4tvCuRpVz+JBdiczUPGRpbCbRBy5l/RF5BfaxFPzY8Klv75PmJ05gJSiSXXwSROMzmxxGM118Ze3tPd/Os8brsNzU7Jld9OapTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CuhfYWL8DbWro2skZTkGY+RO2wOhnypQ7XV8S1JQy4=;
 b=IALqqctVo3MJnMLzvYCrItjTkJWBsIy76EtVlR0tq/9dOENGxZla8HjLhwlJExcWEWgisuQZWFcy9AI2A1TjAkczBFvTYG1vKqQIlQKm+GiJLOU+T1KOkzvBrmRZom8fCTvdNRPTNf2SW+tIFTF5gS9fmNFcMWRory3WEASP/gZV98X+Dx/sRxJk2WK2sZsMDl5iGhmhDRM+kTF3AGZG2KwdEovTzMkSoFyZOw51kkK1762M0GYqzrZ9uvMpB9CFe4LrvSsaDr23cleSTMm/Pbz7ry/zt+TUzhUQW+LH619glW0RGiU5aoKXSCAr0icDZS/g5gsq1CcZ6ah6e2cr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CuhfYWL8DbWro2skZTkGY+RO2wOhnypQ7XV8S1JQy4=;
 b=HU9NAPPbzmejRYD36S1ffmdJS2fc47anpNij13mw8gfdpLh2NRtcipmrzAIErK8PxFSKJtfs2wbBzGlN6gx3a3JUPp47btVb18v817g7/iYHvlGAXwI2d1MC4XrloEYft4onzAoyPWsO6jJ+BhENvean+RtIfXJ+STNvTN3DiShPV8v2+VuFzmARNYqIfDB0zp/Iwh5iAzLZ9dY5cWDWqjH4ssqMbX8iKkxg65r0PGZRT6nNaH+llCT3la1/s7Zhmr5pEOCsljkWdbgXotf39xDc02wuC0P15eL5RltavCCpUWsFPqpy5oItT4+4U3kLcbYsNwQWd6gNhxgdc6wAUA==
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by GV2PR04MB11739.eurprd04.prod.outlook.com (2603:10a6:150:2fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 10:50:03 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 10:50:03 +0000
Message-ID: <6cb13041-be94-44a8-b183-7512948cd4a2@oss.nxp.com>
Date: Tue, 7 Jul 2026 13:50:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: s32g: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Chester Lin
 <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::13) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|GV2PR04MB11739:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4f563e-a4ca-4710-0801-08dedc158002
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z2ZEaBrAHoo+BYkK8kgyIUHq9CcantEqxdyYl0WAXcj+tflOQEdphcKaf3f69wahzEXGVQlFewkMfBt8kZrmTRHCmHWXTt0cMDhYM3qZa5Y/lC6LpXILuwh4Uinj0dXZ9VCbrZDGpuV1nSmiTkwZtc09fCm4UqX6xc84So3wppIv/FlB73h8mViiviv1ySznXK07HNGLi7xGHzjyRVYjPV5hYVWgbyz+kBKtczZu0HcEgGKzsMWofG006bieqyd+kHPxJXDGkIYo+E9GJtvgmxzdREO/SDEywKJF+bAEcXLRZs7Vv12FKibv+C8NyL16LX5Qc2bCnFZwY3B515p5PebA1GZRb0elm3tkQRgFHrJ1m526bHrdrh21ZYaU8yYdptAuZLG7tgG1X+APxEuamjEiLS0SHph84x1KRs82pPXnlxGAylQXwGcdb5J+1xGKBqB1i+T3v0zM67ZCdNH2A/LtP0tB1MLsWVwBL2OcIKFqYBXxzdWq8rQTDPukb69kNJzRtSDN7rO4VxS416prflokee0m5KSy3ul/55pN9I3YW82kkAWdOJQNygRgUWeoE5+kMCnmvVKNSBFPHtndwCFo7n0+CD97xWhphuSSjD/5tmcIK0PqDGXP8GQ4gIEZnl/5IVBBuk42CEDAMFX6d/+FpltFWZTr1BcmWrGuD1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXVZRHFKYXpEWUdsUFZxNFVFcEVNU0x4NlduZjRrMjlkSVFYWm1IWE1rSWRn?=
 =?utf-8?B?MUV3Z3FlbDdLSG55bWFNUys4cVphZWF4Qm5hTkNqdFdiVGJEQmhXeVU0MnZE?=
 =?utf-8?B?cVFrOUZ4d0RaUmUza3lHc2pTdEdodWhjNHA1N0Y1RFk0c1VhempDS0xCd1BG?=
 =?utf-8?B?ajZTMzhPM2pQZ2ZEYTVCZkdTb3p4UzVVaENBZ2NmcXg5RWY3S0JxMWtOWkNK?=
 =?utf-8?B?NEpKUUhKbVhxL1JvMXNIaW9TaGQ3aUdtSUJqRXRSZytWUFpkZ3NKYUZoZnhE?=
 =?utf-8?B?aVgzVFd4QnRrUjlmQzZ2TjBRbWtMeU05UjRTcWJadHVwa0lmeFkraDRkRGx5?=
 =?utf-8?B?dGNmaEREUXBhek90MExEeUU2QzBXODhFMzFDV2ZDbThxQWI0ZVdFSUZxRE8x?=
 =?utf-8?B?Q3g5OVBQdDBwZFdUdjV3VGpZN3BpVUZ0UmdZTjlXenFyTTZhZlJOR3FUZVZO?=
 =?utf-8?B?bm5zTEl4eXZ2SmJuOTlTMzFQV3RIZjNDUk0zaWp5V29JSytRTzZlTzhuc2N5?=
 =?utf-8?B?dG1xckp1UlFjcnRYZDJ5VnkxR1lHVHQvNEJKM1d5M2I4RlBXc1dnZm5SVkFG?=
 =?utf-8?B?d29OV1RWNWtoQ21Xc2ZLOHl1a2JlaTRMc3N1UE1HQWlaeEFuWm1Ya3JEdE56?=
 =?utf-8?B?ZnBjVGRKQzc0RHNvR0tXUWF2bEQzMlE4K3hCWDY4SUZKVjBsRTBGbzdtSVJs?=
 =?utf-8?B?V2J3dmVNaHZEbC9HMk9FL0hhbHdJL0NnbU0zeUdVWWhja0RtU0hraEpRRUtZ?=
 =?utf-8?B?VEVwYm9hQXkyaGRIaUNtYU1EOUV0WEdWVmRVeFlkaU1IQ1hVbG1ZbEJnTVg2?=
 =?utf-8?B?YUhTK2hRVlowdGNiMGZESW4wUHFQS2gvU1hKTVMwb2R1ZUQ0aERXUVBiNUI5?=
 =?utf-8?B?VE4wRGhibWtTWnhjcTMxd2htV0l4bzdwUnk5ejdvQ1hiMlFYUU5JUjh4aG1z?=
 =?utf-8?B?QXRoQUJTNXdMY2FHbWw2ZjVudG9pZDY1YkJYMVVpMWkwMlIzRS81NUlpVElt?=
 =?utf-8?B?UytWUHNUc1pPYmZtSzltVmRGWVJteUhSRzhYK1J0cUQ1OW5NbXFtd1hOd0Js?=
 =?utf-8?B?SmhMUzd2OWI3Rk1JZ0RXOEFIMCt4N251UGU1OVh3YTMyc2p4cjdUekVqN0tR?=
 =?utf-8?B?TU1JOXVpUGRWRjZpOURrSXJZSXFMN1NEY25RV0RueW4yalVUT0JIRHZBazVz?=
 =?utf-8?B?aVJQWVFmdzUwSFZSK0FrTEhxdEx5L1hab0Nkd2R6REZiRUpqYm12Z0pEWXdu?=
 =?utf-8?B?Ty9CVFUyUWFSemg1TmlCa084bjlLODBRVk1zNjRDWnJrWGQzM09WK3FTcjFT?=
 =?utf-8?B?SUpCaWlqMUd3cFgvZ0Q4TXJTVlptSnlIblJNamhGZ1E1RnNZaUFVbGZZcnpO?=
 =?utf-8?B?a3JxYWx1NEUvbjNuSkZxRmxOTDZ0Q3d1K0dIUDBKMHpjSFhaczNTRWJlNVpu?=
 =?utf-8?B?V0hOZW1uZEVpVVBkUmxWQXo0YzVMZFgwd1JabUlpdjc5Q0lPeGoyRHA4WXFJ?=
 =?utf-8?B?eTFZZURkTDhnWGxCNWpLUTQyVXZRbU9HR2QrYklOZTMrSGszYVVpcXJUcmFJ?=
 =?utf-8?B?eEZjT1FNMFIrc1hRRDB0a05DckFLblYwcUtYZXlGOWRDTlZFV1IyOXNuTTEx?=
 =?utf-8?B?cjdkanZwMGx6cVNFMXlFODJRMXpEQkkzN0VIcUVGemEyMnlSSGlJTmhJWDBw?=
 =?utf-8?B?b2JhWXFWU3ZJbnVydmo4VDJPYksrY2taWkFRV2tXVVc1MXhPSmpXNW1PSXBK?=
 =?utf-8?B?R2pvS2ZqVWxwVmt0SWRTZmQrRXBuQUJIYzhVZXV0WWpVUGxiSGpScUQ3V21z?=
 =?utf-8?B?WkZnd1ZxeUdvL010RGxnNkdFOHIvandMbzFYYnJJZGozdWdwTkxGUDBybEt6?=
 =?utf-8?B?ellZZVErbGFtVU5jeEsvMjYyU3VHcm9RK21lMmJLVm85WE5KVGQ5QWt4RUhR?=
 =?utf-8?B?OW1jRXAyTTdkck9Od2E3VDhodjdxUVZXVU5VSDc3THZ3SFJhRjViNjVsb3Zm?=
 =?utf-8?B?OWNTZHR3Zjlxd3dlYlJJeXVHMzdLbnd3KzNicEJFVkRCWTNSa1J5U2hMYTkr?=
 =?utf-8?B?Vkd4UXBGTk4yZkdCNXdXdWRxRGZjQW11aHZSNndXVUFLNlZnT3licHlSL29H?=
 =?utf-8?B?U0ErVDBOTW1kYy9pQWVmWkhOaFlGNVk2SzVtOE9iTU1ZMXdWVE1GQjI3bHhu?=
 =?utf-8?B?QnAzT2kyZ2h5anlITiswMGt5b2NocXhYSmVGTzR6NGI0SVBMV2FrTU5wOXlV?=
 =?utf-8?B?SkJDdGZRUzZVS1k3UUU3UDJmZjVrRVdjZ0hUTUd1QWhQeG9EUUsvZHd4Wmp4?=
 =?utf-8?B?TWQ0Sy9hL2FTKzl0QTlPQ2M2YjcwZFM5Ukt4UGloWFhqa1Vna1ZPUHBUQU4v?=
 =?utf-8?Q?AVDu2HAOUPfwGxDU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4f563e-a4ca-4710-0801-08dedc158002
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 10:50:03.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ojrlx4Yg3wdLpp4oynUqYjTdBp74pl8WiMVHYV2wzKoMMonQTRE0AZERmdPNSZqGkg+CC3YJNd4pxbY4+kzyj7AvIQC6udDbJ2AP3tlQKYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11739
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:alexandre.belloni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6950-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ciprianmarian.costea@oss.nxp.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,suse.com,oss.nxp.com,nxp.com,bootlin.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ciprianmarian.costea@oss.nxp.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD3E071AA71

On 7/4/2026 3:20 PM, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

> ---
>   drivers/rtc/rtc-s32g.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> index 3a0818e972eb..86716192d10f 100644
> --- a/drivers/rtc/rtc-s32g.c
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -366,6 +366,7 @@ static const struct of_device_id rtc_dt_ids[] = {
>   	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>   	{ /* sentinel */ },
>   };
> +MODULE_DEVICE_TABLE(of, rtc_dt_ids);
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>   			 s32g_rtc_suspend, s32g_rtc_resume);


