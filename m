Return-Path: <linux-rtc+bounces-5090-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD0BDC459
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Oct 2025 05:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA10F19A1880
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Oct 2025 03:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA9826FA53;
	Wed, 15 Oct 2025 03:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lineo.co.jp header.i=@lineo.co.jp header.b="o20hohZd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020101.outbound.protection.outlook.com [52.101.228.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0F1519A6;
	Wed, 15 Oct 2025 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760497635; cv=fail; b=k9CTGGb+aKTNLLDFc8JkhVHEHFS3EM8A/D7RpzWQpcxfTemn7UOPfS7gQuk4tQ0bMMfTUrfXQxAhrgFAY+bbHcRqhFLyaMlrHgarsh2wWeUDbyzUvOX1F9UxEZQobqi8O60mTTSDPpnMG9yecj3dKlrk/GHWYLf+TaEFvcyJxts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760497635; c=relaxed/simple;
	bh=ci0IrJh/hKflSJPVNHMzwzKn+paY1adcLiruvjr56Ug=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=RSYNMqDRVKU6RLcpowzfgYgSQqK39kxXVSFC+5jsLZE7X8KPgttTAmicaVfjhUr+2TCmmhaVlkF8zFFc+SK+QsigLYXT5iAtN+Fv3hi7nRsHCH3Yf9qcuvUVsSDVPPqekc6o02/BygZUGAq4l5bDwa3nCetkuCsbAumQkUuF5Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineo.co.jp; spf=pass smtp.mailfrom=lineo.co.jp; dkim=pass (2048-bit key) header.d=lineo.co.jp header.i=@lineo.co.jp header.b=o20hohZd; arc=fail smtp.client-ip=52.101.228.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineo.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lineo.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcSlYq02IRYFjfefeGwMeEliZBJWmY9QMLSWrk8sltpB0UxRh5YN+U48AJAFiqXPZxk2NHkDQeKUMfGZC7EfORmD3aQ+MsYn//o/Ud29tALewSBg7Tp38RNbYQ9i+BGTsJpayJKnlJjpPR6vHYwnpIHUWTdeghqsKqMEKuFp7bAFvm5mbtWeGevVOZ0XzCkJa13IizhJ4GOk47U8NZynPrmfzblqpMkPoJXFUTlxGL0frAf9Huqg4tDvX0vqlwcioE16bZRhm5QRn1Eht5l8mEaWJH2EWTXjIOcQ2L7oW51hwoBUuerJKj+2Ec2XEo8PoBcYDstdGjEUwmSPF1CQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVfUNxnV4En/m439Uh8EF7gVIx/lFuzWLzCeMxUA2BQ=;
 b=eePEkFhXyzZKwuLNKFfRGXuNdMcd/BHytp5B6HFBjlca6H2WG5K8Dt9xn3KLXeGsc3RAKJI0Iw8w1ahRc/pRO/2jMn9ntjAMsQ59gNPtVZhsDSFd7tJDoP1O3RArF0J/QfRyQfsJS5OfnyiySq5UUpp3WIEgaZRUfnSkm+MnxiAG/TnpP53RaMvQKGEaGzG18FZRo0m9fflB7DBRKe1JAz280stgvOPpvVqy6ka7czT/ULzTvnGfyiy3TdUfTGImTkcwCFhu0z1duZMkXHRuauATaGKznPqigg1VDqbB5pb9LezLKevGVrANUcYvkUbzr13TuJP0P6T5Qwgzom4Rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVfUNxnV4En/m439Uh8EF7gVIx/lFuzWLzCeMxUA2BQ=;
 b=o20hohZd77+cm+c6EMHZpkQdwqgkg/ZK6mKNDKkVraSlGX9u40dCr2XMw8Pw6EkASWUZO4lypjIP8UeiUtwY/FlRGRVEHVAzVYcOTIp8ZtvI2ZNGoOCH+eAbUaBtOMcolyFxMMFYxgAmajBw3a1dd1D7SetQUc0R5PHIJpWxRA8yGCn3ct2NFcvjGr3pvevMtjLZdVqfP6VFSksegbXNmTFzHOzOJgJC3fgBBnpFMksqIPfdQIiVS3HctRdw8FQONi/A0vjEMXmZqDfv92VofJCxlmppv9f3XXJrh49XgIRPbUOhW1595saxDyKpe5DYiHc1blrKNh4RRC+H6TuFqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OSRPR01MB11490.jpnprd01.prod.outlook.com
 (2603:1096:604:22d::14) by TYCPR01MB12057.jpnprd01.prod.outlook.com
 (2603:1096:400:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 03:07:07 +0000
Received: from OSRPR01MB11490.jpnprd01.prod.outlook.com
 ([fe80::524c:52ad:4acd:1dc1]) by OSRPR01MB11490.jpnprd01.prod.outlook.com
 ([fe80::524c:52ad:4acd:1dc1%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 03:07:07 +0000
Message-ID: <eae5f479-5d28-4a37-859d-d54794e7628c@lineo.co.jp>
Date: Wed, 15 Oct 2025 12:07:05 +0900
User-Agent: Mozilla Thunderbird
From: Yuta Hayama <hayama@lineo.co.jp>
Content-Language: en-US
Subject: [PATCH] rtc: rx8025: fix incorrect register reference
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yuta Hayama <hayama@lineo.co.jp>, Takao Miyasaka <miyasaka@lineo.co.jp>,
 Naokado OGISO <ogiso@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To OSRPR01MB11490.jpnprd01.prod.outlook.com
 (2603:1096:604:22d::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11490:EE_|TYCPR01MB12057:EE_
X-MS-Office365-Filtering-Correlation-Id: b408ebb6-3cee-42d8-5697-08de0b97ec76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXRDUDhEd1VRUjVVQUhmUHVldURtYzBSQ2tUV2Jlc21JRjBFR2o1UVBHd0Vj?=
 =?utf-8?B?dkpkTkt1am1BTUY4c1lWQ1VaNW9JZ0J0dW5YSE1aV1h4cDBtbXJGY2JnTm52?=
 =?utf-8?B?MStDL3A4UXVnSm9uSktkemdSMkF5NzhndDJ4SmtZSVRZRkZlUzFmMlhUOXh2?=
 =?utf-8?B?U21qeUFoNXJmSnBvMFl0WjZSV29Uc2ZHdEo2UVUzQ0NvSms4d0lHdmRJZGha?=
 =?utf-8?B?ZTIveVd4clNrT1h0RXllMlVreEZSekU3NjdtcktscFRVNVpXN1drS05iS2py?=
 =?utf-8?B?Z21sRnNIVXErVnV3TlI5empvU0NjNnJLUGtNUkVlOS9aZTZtbUdhbDBycVBM?=
 =?utf-8?B?bUkvUXFJbExZaE55dXQ2elljcUxNMHNCZFJxVXRqYjVMQzBhVmFzSTNvR0JJ?=
 =?utf-8?B?VG9IY3hsaExjU1J2UnloYnVjS2lWUEd5K0JpRll0YlZXd3Z6V1llMHVzcGRr?=
 =?utf-8?B?dzVIYUZ4bGdqUEp5QlVKT09pU3RyZWNaVTMvR0ZpMVdyOHRvOWlsbFk3MlRm?=
 =?utf-8?B?b0ptSDE5c3FDeWFTV05wQTc2NU5kT3YzTWFYbTRTK3VQRDZMUVh0OXBaWFA0?=
 =?utf-8?B?QWdHRHhJRXlKMExPYW4vY1UwSVpaVFhPeVUwNGRwdUtPZWF2alBpUVJGbjJp?=
 =?utf-8?B?OFExYS9MSjZjQlZJaTBvbWRpWDVGOXNFTWdZTWZlQkJqbUtsRTVHdjhHVE0x?=
 =?utf-8?B?WWdHL0k0dVRWTXFNNlRkV2xSdnBJYkdPbXVoQXFhSHBCb0xVR1FhZ1QwOXpl?=
 =?utf-8?B?NnlFZE9qK2FkaVVLS0pNWWZsdlMrOEdSTHFoZllUak84RC9GRjdobzduM2hY?=
 =?utf-8?B?aEtkR3NBS0hpUVdIU0R2a3B6SFZ3VzFMeEZkVWxob1ExenVTSTdObVg2QXA1?=
 =?utf-8?B?eUpORDVnc0d5bGlXM3NMVWZ6MHdzVTZBSE5FMTFlSlUvMytKZnlhdS9WSkxr?=
 =?utf-8?B?OVNtd2tLU2JTMk5aSFdFT2pWVDdCZTBQUElSdkowejRyVGllaU9EcVdQTUFF?=
 =?utf-8?B?M04zQkJObzdQd3lWdlUxeVR0ZnMwZ25RNE9JdUwvbW5xL3drZXF0WGt1QXRp?=
 =?utf-8?B?US84ZGVoVEJ3Z0kxNTVoY2tZSmVhT1hQSGw2S0c2TEJFSlVwR01qNEhidFhH?=
 =?utf-8?B?Nk9uNldsSzg4OEwrN3ArQmxUUnhiWElVSW1mOXpVb3g2Q1F4dUFnR2RQYnI4?=
 =?utf-8?B?NythWGFmWjJUWnM4amt3cEt5SE5JSmZGRnBsSytyc2RPZWd3VFVRSGR1MjNq?=
 =?utf-8?B?eGxSenQ0SER5RzhaeThmc1pOd3lIOHJYWit1RmNHMllwK0VaNVNPcjdBZ1JP?=
 =?utf-8?B?ZHJNWFl5RjlPN0RKcDZHRGpRbXhWUEVVbXJnQmg2dXc2Z0VCdVZzUzNYZ0Fm?=
 =?utf-8?B?cFE0RFI0NDVucDVrUzQzazBLRFF5cmhoR3NSOGIwbjBhL09mUjNnd3NOd3R4?=
 =?utf-8?B?ZFViQ2gvMTZ6VzRqVUcxVW9POTl2LzBZQ2ladmtWemovMHJuZ0lVZGxWUUdt?=
 =?utf-8?B?LzNuaEl5VlZ3SHVDSE5PSmU0dkZQY0dRZG41OEFVdTVEUVJzdW1RK3dERjlz?=
 =?utf-8?B?ZThNVjBlNVRYQzluUnFNamQxMDJoVng0OGlGSGZSTTF4TzlYUnkwdXA3MG9I?=
 =?utf-8?B?clk5M0pKSFkyelpXaEkzUGRKZlJjbzF1WDJKRHJVdmdjcExacmk2UXNWZENo?=
 =?utf-8?B?cHIvcThwZHE0NklVeGxqaXZZdkFsNEl2V2lyQ1QxMElEelhIL2QrMjFvZEd2?=
 =?utf-8?B?Z1JyalZWN25uT1pwUmRQdWZ4cTkzT0E0RGhXWko4bE9vcjZZOTFacE53SnR0?=
 =?utf-8?B?bnFsUENDek5tMTdPbFdOU1lFM1B1WllLQ2V0NW51QXluTUVER2FlQ3FzWno1?=
 =?utf-8?B?TGtoeEkzSncrNFpJbGRuRzV1V0ZybmNPSXlxdk5PTC9kRHZlVEhCSmJzQ2oz?=
 =?utf-8?Q?rpSgNHWAf7dD19sANRG2ysuR/m2eaM9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11490.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wnk2ZUswNnpyVnlnVEFSc0lQclNOMXFMWGlVS3JRWHl2cWFzdVJhd3ZGUWhw?=
 =?utf-8?B?WUYzM05SSGxxblpVSWcwVGxRdE5yUDgwR3pZZlA0NE5JYmhSWGd0clp2c2d5?=
 =?utf-8?B?ZTJ5YnN5RU5EejVTTk15SS9LdzFrUnZFLzFwcEpxRXhNQUNYaXhJN3cyV0FU?=
 =?utf-8?B?bGhTc081bG1zUCtmMWtkYWtDc3llU0R6REEvdzhFeWRzd3FjaVl4ZHdnak5U?=
 =?utf-8?B?bEQ3UHA1RlBmcEFzZ1ZnczYvYTFjSW5hSlpCMlFVK2pOR3ExeFY4RUtCTlZK?=
 =?utf-8?B?SU9LQzF1elRGZ3hxUGVWOGQ4bkZPNHl0VkhPU3llUEI1WDZINXhBM1pSdmpY?=
 =?utf-8?B?YVlMSUpyR0pucmI0NndPaXBWaUxYMzdBampiWVowSE1melNMc0FwMkFPZlVI?=
 =?utf-8?B?RXcrQlExaTk1aFZBRCtDN085NVROTGV4S1FwbmdRTFNyNGJkY0ZuTVFiUEds?=
 =?utf-8?B?ZVVSMlhPaXEyWjE1d09pdzgxcEFIa0Y5aEtXdDdmdytub0k3RzQ4S2NjaXgx?=
 =?utf-8?B?YkRMUWkrME52U1dKSi9NZmRkL2x0WlYvdlVpM1FVY0dxbEJVQ0RkRWJlb211?=
 =?utf-8?B?S09neUhqb3hpS0F5RkVDam81RnJLQ2pkV3RBWlpSdGRyU1FsMlJ2eUVLY2l1?=
 =?utf-8?B?Q0psV3RRR0ZxcTVuSnJWeWIweDNFbWlwNGhEMjhPQXFvMjZWNCs5Y2twYTU2?=
 =?utf-8?B?aU4vdHF5bmowQmVZUGFsWDFkVVZHRVhmYUdOZSt3S2haczJOWEhHWFMyd3lQ?=
 =?utf-8?B?d2Q0RTJvM01vb1d1SXpwT2FjaVRxTEpWdUNjUFM3Q3cwRzlyQkxKQXpMMUtK?=
 =?utf-8?B?dHVKRFd2Rjc3N1ZFc2dPdnVtakZJZUE1UjNKUlIxUS8vVTZIYzNvZUlzRmFH?=
 =?utf-8?B?R3lLQ3VQNFRiS3N4T1krSmFhTVJKaEdpRE5tMUNweExJTW0rdXBaQlYzRjRt?=
 =?utf-8?B?SDlQZHlNSmxCODRzNGR3OHIwVDRhQTlMWGwyZjd1a0JZU25DZnJvU2xhZDVF?=
 =?utf-8?B?Rm8rMzNJenRxMy8xVzBHZUw1R3Y3Y2x5QkxnZ2lYdzllTGpuUDhFdE5XeHRG?=
 =?utf-8?B?OVJjTnJ1cmdxVmVjeE5NUFRRQlc3UjR3TWRVNCtiNnY1NEhKMjBZY1NraVp4?=
 =?utf-8?B?TVR3bStvZTBHT0tDNWhVYTZyQ0RFQzMyajVveUxSaU44Zld1MmF6SlJNSTFS?=
 =?utf-8?B?cFh2bkZOMGl2YXlKR1dKcitBeFhEZTlNeUk3NnBDU2FkTkF2UExldUlzV0p4?=
 =?utf-8?B?SDhqOEk5czF2MUdYS1paOVowSUhsN1ZJNDdKK1FDWkdRbklOckc5Zi9NeFVj?=
 =?utf-8?B?RVBJSW44akR2MFRWdHF0K0p4M2xuN3JNYWo3SmUzUTI5Nk1vdDlpWUFmNHpE?=
 =?utf-8?B?SGlhMUVHdWs1SnN1c0hKT2VEcE1udW5ldEI1TFpBUEVzUlhQQ1dLZU5BaGR3?=
 =?utf-8?B?K0h5MzZ2ZkVaNDJzNWJqRERwcmYwOTNUZTE5Q1E0SURpR25tdXJiUitsT0ZR?=
 =?utf-8?B?WWh6dGNOc3JBUnZoMi9LSDB1Q0diYUFHNWFFYm9zOVZ0YTlaZE1WQnlmbkZR?=
 =?utf-8?B?a0IxSkIrdkpDQnc5dDdYNkx6bWdGWGdSMHBVc1lsNjJJbThKcnBSTTRiY2tr?=
 =?utf-8?B?blJZSnRZQ0drdTVDL2doViszMm1tSDh4akZTYkVlS3hwVEtiZHdOL3dlbTJD?=
 =?utf-8?B?ZmpmL0dlOUFOQ0lvaXowdlRZaU8xYVV2VmJvZnRLa29sZVB6LzU1eU9kd0Jm?=
 =?utf-8?B?YVJXVkFYbmRLNHRMK293c1pyTDJhWVJKTlRueDNCK2FnUU8vNHVxb0JsclJK?=
 =?utf-8?B?eGhFMnM1ZHhNcDNvM2NwbUVtcGM3SlpaWjBGTW5OMElrT3ZGYzVhdHlZZ1Za?=
 =?utf-8?B?OFpHN2kzQTE0eXBFTXRDZnB6NnlITWZERmVSSGd2WmtKMWRuT3o3a2ZXTlNR?=
 =?utf-8?B?dEwzbk11WVhHOVlTNUZjcjYvd1BlN2JxZy9NcE1MK1IrT1hnUFB2Z1dqTFJG?=
 =?utf-8?B?RUdkZ2lwUkZvNTF3bWpna2J6dHM3UjBZai9ENXpCcU90K3RZRG1xVm1vQkJr?=
 =?utf-8?B?VEJIMlZ6S0p4SEV6czVXWmJtZVV4bld4TzVNQjZEQ3BrUi9qS0FHdWZvYm8r?=
 =?utf-8?Q?oYL57ivYyQlOHKEnok0uDwOhP?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b408ebb6-3cee-42d8-5697-08de0b97ec76
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11490.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:07:07.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oitUDSsXVmSRW6CtTxoGBYentnO+wa/M4wq7ectiq9P2Akj6Xe0Sn9smkSS0IC4TH6BJM0twsTLH0VjQ6NOs0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12057

This code is intended to operate on the CTRL1 register, but ctrl[1] is
actually CTRL2. Correctly, ctrl[0] is CTRL1.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Fixes: 71af91565052 ("rtc: rx8025: fix 12/24 hour mode detection on RX-8035")
Cc: stable@vger.kernel.org
---
 drivers/rtc/rtc-rx8025.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index aabe62c283a1..7e9f7cb90c28 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -316,7 +316,7 @@ static int rx8025_init_client(struct i2c_client *client)
 			return hour_reg;
 		rx8025->is_24 = (hour_reg & RX8035_BIT_HOUR_1224);
 	} else {
-		rx8025->is_24 = (ctrl[1] & RX8025_BIT_CTRL1_1224);
+		rx8025->is_24 = (ctrl[0] & RX8025_BIT_CTRL1_1224);
 	}
 out:
 	return err;
-- 
2.43.0


