Return-Path: <linux-rtc+bounces-3762-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF922A7A111
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 12:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA31F3B59EF
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4799C24BC08;
	Thu,  3 Apr 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mvjT7qGT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70524BBE8;
	Thu,  3 Apr 2025 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676448; cv=fail; b=S7xlKQcx6ZikgvEpCYgFqwLoxwZPjL0j769XTYJHU8Hbp8tuYnzwWO0sMxjQR3rFrdbuXsaSQY22NmUK7F+Km3YAF4+gxmgg5HbZGGT97eFQ113e2ZJgWOcQNAiJnhJgbVeS/HXNPLR63CBHQcBugeGgRuY+5W51Sfc7RmUptOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676448; c=relaxed/simple;
	bh=fcwD5zWKrpfyZYW0beyldDG4XBC0M8gdrxKTLUpaOjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ceUA9ylL76PBhYF9X0j2RD/Jw63vjlpJ4GBi95SuFTscMElhbvtA5iwVKvJQQbwqEhuP+NQU6cwSlmG/wdtWqLKjYoGiNoqOPFLTdIsGVFAZwqEYMD0b2fFEyhXOWq7D6t6uYMaBQnJGPomAo/8FI6hny5j+SjnSPRcqSpNGtPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mvjT7qGT; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLMSp+q2sM7AKdYTPBoUUGL2PyXxf2X/kTOjqf7cpkzv72T3G3vAoWB0P8y1OrFciqNQcsgE9YntfhwippFY6zaIv99pXGBJtpnLn630K2FVbx8BaehMNRdkLJG8kHDy6EaEc2WpdSrswk1GD61Zq7yH+RF4cXIYsNFsdZfFvw0w4o8TUnvdkY/3BsUjRboSqpGGPcjjtSe67NDiKsHzXU0Cvucx171JHTEUsAcxFcMJbEbldDAU7od1xKW9lxNZnQUixkg9lQyQKucbNZFILQ2JgURzCOdfAR2/uhTlJ2bsypwRVBqZxrkrl/v14iwYR+K41W2Dmu+QAhUmtJDFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=kRGREfdpL3VxtSEwZZdiDPrEEHiM8s+/3YrQ//b3acOr7Y+CV3jJhGmr1FhR+i4kh7RXGl1RQbwcekhm9GmNfO8Hd6rq7MBejUUEZkvEIzzjR8cJ9sdPDpZONSjv9Ck27uG/AyjKio3yEHipLu+6mECWq39iHZrcAdsrGaChiKqS9jD2OoGSMiSWx44qar0vc0KaYDAczMIwkZxedGc9QgQNTKBk2jr3Ly9bRBSnhumYgjy7RvZo6+eew19ljTrBE4rgGObUz6srFS1TnOekuMGG+esseQhofky0T/0PSr9Y43VJXO3U0AF1pHEmemWeIBohyzybIIYgC1jAxfw3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=mvjT7qGTdAB8EhJsG7J28Ta/7SzTcqNN09NRHumYE6/MAyASUtLcIWHle/vftbaKGs0UoUx/8qLWklvysIvXAiTzGEBDNegytCj+9Q0bbTgXl6X8YMPMDuawBNvpFOotZV3MORGWic+IcIFhmC0v2i9PCr+n/vwJCkd+oKXYPyFuPYEPZsD7p5Y2AXwaF7eQ5vMdkV3cfiAFN8Lh6AqR/JYhNdSKMNmAHJRcn90vL7At4VIsMxbFZtVPvmgjvGUEvRPTQnqv7vMBEcEs8+/qyGF+4k12s8PUR4YdtgurkJReZBXYizYE7aEVjyW8bbuOK1S7Xgd5+mqDpU4REDZ8hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:57 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
Date: Thu,  3 Apr 2025 13:33:45 +0300
Message-ID: <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::25) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: df245145-7930-4e43-198e-08dd729b0a4d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXArN3FSSEZZUWZRVFJDU0F4VnFiTjZHaU1kdmRCV0RBeEIyOHZvSUREcDRR?=
 =?utf-8?B?cUVRNWJyelJub1pCSlhnY1dBZmJJT0FJbkpKWlpQbUtlU0lpUTdQa0Z6NFhY?=
 =?utf-8?B?OFlya2M1cHFEOHZ5b1JWU2s2ZFVMdVZBdmJORTM2VVBPdXprTllhbnYzcThx?=
 =?utf-8?B?R0xOOXpvTFp2U3dJejNXeVVsQkVxaTV5Y3BaR2RuR3lpOWFpRGZtcHZVWUQ5?=
 =?utf-8?B?NjE3Wm4yeU1ITDNzUTNmYjBhaDVndmpNc2dkY2ZZdGREVVpRRVhRQW9ubkFJ?=
 =?utf-8?B?bGJMUTVFSHBEaXVPQWRiVCsrWUtPemFSMUp2RE9SNkcwUkpnOVN5NisyRkY3?=
 =?utf-8?B?TExEQ1B5biszQ2N2bmFQK1M3MllpaXpyazY5UHJFQU1haEVjelpBUmR4THJH?=
 =?utf-8?B?M2ZpaEFxbDE4ZjZUNzcyUFJMM0x1SWRQYlJuek1SVWhURjRyK2pPV3EyUjZQ?=
 =?utf-8?B?dFZiQ1J0TU1xSHlqYlBNei9ZWmpTcVcrK05DaFFwdElCUW10Zmo1MnlGZWtX?=
 =?utf-8?B?bGJxcU9EZkVtZ2IwbEMxMUxBb3lkeFM2aXd5VjBGQUVXZ1NZY2NYRzZJUmov?=
 =?utf-8?B?TUFjdUw4MmFLRnI0S1lZYVZuRUZFSEdzWGJCc0l6ZDZ2SS9yTXBJUDZQNFRv?=
 =?utf-8?B?QU9JeFJ2d2VBUlZpNHBqOGdVQWtTVWFnbHJRL2l6bUE4UER0MzFDZ2pWKzlS?=
 =?utf-8?B?U2NnUHptWXJmd2dQVFFIb0diOFd3TXNEbVJRcEFvU1NFTzJZenl4elN3ZWYv?=
 =?utf-8?B?QkxyV2V3d01ORU4xU2czb1JEQ3prQkUzVFUwK0V5dGtPeTNGaFppK3JHcWlz?=
 =?utf-8?B?UElmeWY0OXBDTDBpakJIYzVZTGF4TUVlMm9vTzgxUTJOdTEvaEw2V1ZHSzZ2?=
 =?utf-8?B?NTAzZThDUE8vejNSd0lLb2pWV0EyZUt2eHVXTGM4NDB2am1PdjVZRGFVYW5W?=
 =?utf-8?B?VU9NMjBqU2RBeVpaV3BZOGRUTHlLdDV0QXozMVQ4WjRXRk8veTJuOVc1aXRp?=
 =?utf-8?B?OG8yMVEzblFid1BWZVRpb1V2RmNEcWl2emE1Tk1xSURCQXBrSGVsTTM0dFIv?=
 =?utf-8?B?aGRVQytYeCtMSlNHYk1UMHV2QmtzUXhST2taMklwczlGcFo0TVNtNUtFMmFq?=
 =?utf-8?B?dklmOC9ZUEMxR1RBNXI5Y3d1SkQxRGJ4bWtyOEF4Vkg3SHBaaHNpSmNhR1dX?=
 =?utf-8?B?SzVXMVUxd2l6ZGxjekRnOFJGd1owek1xdTd2UnNSV3R5UWpwUitPZmhmZ1Q3?=
 =?utf-8?B?NDUzVllSSmhCcllVNVJpNmwvUEtnY0lkK2IremRWWVAzNXRTd1JqSVhpdy9I?=
 =?utf-8?B?T3lIRXhIa1JubWlRbm9DeDgyS2dqSlNMZG85cXBFb2Q4MXBnMkxMVHVHTHVi?=
 =?utf-8?B?S1BZQ0RSVWJ0M2VXVVZIS1pveXA2NUFxSFVJaXI4WHZpTXRwYmMxWjhkVjd2?=
 =?utf-8?B?eFBBNVVMYW5lUGVCd2gzV1kvRkJkVlNGSWErVGUzclpUQnVwaFFkc1RqU0wv?=
 =?utf-8?B?QW1KVTlXT1R4TktvY0lkUmpaZGs0cWwxYWNjSlpSN2pYV2dENjZhaXMwUUJ6?=
 =?utf-8?B?dHZUVldDTzZ0aGNCSVhiYUtyY2FheGRHanAwSGxUTEZOZHFNNWJUbVJmamhQ?=
 =?utf-8?B?OHRoOXh4S3lzcmNBZ2hPYVlZRVQ4eWk4UTdybHFiUnMvRE9uZ1p3ZG03S1Fn?=
 =?utf-8?B?ZlpWOVBsRXQzUWZRUDQ3OGNjOE5Fd2J2Y1d5cFVWbTFUbzVETXRyWVQ5QkRB?=
 =?utf-8?B?aTRqYW9mdStDRGorTFlFeE5uTStCOFFmN3lHdnBGKzRpRnJocDl1L2NUNFl2?=
 =?utf-8?B?d2l3bkE1dFNwbkMxaTFpOUQzc3J4Um9jRFB4VUVpeXlob0VuWG9aVXgwcWtj?=
 =?utf-8?B?bnlZVHMrYWlxWk51REVRVDhld2N3UStyWTAraTRGTExPeWNpWGhQcEIxcVJo?=
 =?utf-8?Q?w+Wtck0mSi0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2dMeHNYYTFDNGFqWGkzdFVuald0Ukk3cFJhVCt4OFpMc3MrRStIVjI5Vit5?=
 =?utf-8?B?V3FJRldoSnh0cXIwdTF2V0N3SEFiQmRpQUYwcVFUdVNOb3ZvdE9qNmgvMjUy?=
 =?utf-8?B?TzEvUVVXdys5WkNEdmcrY3YxeUUybkx2d29mN1JvUTVvUDJJT2Q1bnJpQk1j?=
 =?utf-8?B?dUZZdWg5ZkhNc3BhOHp0ZTdGT05ScmtrMkF6eHUrcCt3azNJUUxjQnk3VTU2?=
 =?utf-8?B?M2hTRW9NS2dmYkFzK3dhMmJTNlVwTE5XRlMvVmxwTGlXL1Y5cXFUMWV6RHQv?=
 =?utf-8?B?cGhsOGZhUkVIdnZMSUpPb0IxdVJlTFo1THlwSkVFM3kvNkE5T1Znb1E2NFRW?=
 =?utf-8?B?am1DV3UyYmdtM0RTb3pJbitzR3hZbXBSVkwwWXM4b0Z1T1JENTZ2ekJHcW1M?=
 =?utf-8?B?RjdWdllzUVU4RW5tUVZFVlozWFBUNE45aUlmbDFZTTFqMUdoRnZhZXo3TUhx?=
 =?utf-8?B?T0xNUVBQUXlGaVZGaVFYUHpRdG04MHA5dUpnUitRRFJEZlczWVVZdVVZdURO?=
 =?utf-8?B?M0NBcTRyUlZ0cWVVSXdXeUtvZnJocmtRZGhpdXpxcDJOalFYemRHWkhTaTR0?=
 =?utf-8?B?V0tVUm04TitUWVlzdHRSTmhlZW8rcjhnV3JZdVlMR05yNFFDMHNGMjVXcCtF?=
 =?utf-8?B?Rzl0MXpFVHF1RGd0WEhvQk05WUc4K0xjbnlpK3ArZUlOWVRwY0RnSGd4dk1R?=
 =?utf-8?B?RkFkZ0lCME9YK3RCM3ExZGFsSUFldmJnbDZ3OUVockp2MENuc0FxMjFCSnhH?=
 =?utf-8?B?dFJzdk9NRmRvOUJBRE41UHc0QVdTb0VsMmdDN2Nid2NtNHNuckhySUhTOXBQ?=
 =?utf-8?B?ME1wdzZjRTl0WW91R2FBMUg5ZEN1QjkwUnQ2YjA0ZVpCeVZRaFY1ZW5aT3hC?=
 =?utf-8?B?MHBidmxLaTVqaVRqZnRhRk1TSGxQTVFMcmpFamsraTNGYk9xY2tOOTJYaHUr?=
 =?utf-8?B?cDdBayt3RGlXejBLWWUyWHU4aVFHU1ZQa1VtZFBwNHE2RnduMVRBYUw3UFZt?=
 =?utf-8?B?YkhBTFhSUHVGSVJoYnNqeVZsazNrbmlXZGNQOTF1MWM1aFZzeE9xL2kyQVVy?=
 =?utf-8?B?Wlpzazk3RFZVZUZ2L2FyeitXejJMNE5NUjd0ZU9aMERtSVFLRnQ2M29vRU5C?=
 =?utf-8?B?UytwL3hXbDZ5blhiZGhCQ2VxdmcxRjg0SDY5UytiNmRmOXV3ZEgyQVBuOEhN?=
 =?utf-8?B?MlQybVg3UUF4ZG03UWFjOHduV3l5MTkrcG5PZUx2MUpaYm5sQnMyeit2UEhl?=
 =?utf-8?B?RHBWVWxOK2xxeDNSbktpZzkwWmpNMmUySnF5cEhRV1dtdWo5NndKUERlOExk?=
 =?utf-8?B?L245WTVaZW9xcXVqQ0Yvd0pJU3NHeFBTbHdzeTh5MWZhQWU5UVNmeW1UbnN3?=
 =?utf-8?B?TmFqRjQ3YkZod2p2dW9ZOFJCaEpTYllqc1JNQy9ibUNYQlYyTkt5cE81M3VV?=
 =?utf-8?B?QWhENzlHT3ZReVd2eWFrNVM4TzU0Wi8rNXdlejNEZmVGS1pkcmdKdVh0Wm16?=
 =?utf-8?B?RitxY2NWMk5hdk9IaDFLL0VBbExVdmN4cTZCcTc1NGRMN2g3dzJ3TXM4L0dT?=
 =?utf-8?B?ZGRWQlQ0ck0vczB5UlNFN3QvK3QrZnp0c05jL0owREZ6MStaSXR2TkQyUHY4?=
 =?utf-8?B?WmRicVZPa3BlYTlodE1kRDlzY1R0WlZhR3FmY3lkWVV6ak91bzdQYVJqWDlD?=
 =?utf-8?B?WWtPMEZZRUY3YTNES2hDVGpYR2ZLclc4eUxqQ2l2NXhoazMrZEtOR1ZlSk42?=
 =?utf-8?B?V0poYkk0d3RhVFIzYlFFN1Nad09kNFdKRzRDd1FDZ0xCQWJOaDk3dXVyN051?=
 =?utf-8?B?bTJDSFVpb1llZEpPTEJJUVBDaU4wTk5JNlhMWkh2WXhhZHZqTTRITnhJbDBJ?=
 =?utf-8?B?NjhVWUhRakh5dGlndlJTbEdkUlNpYkpEK1ZEM1ZmbU1ubUVkbDYrRGNEb0N3?=
 =?utf-8?B?eXFzYnJrQlhvWnJ2YngxSHF4MzJSMGI2bG1UWlB5bnVpNlZrWk5YRU5vNHFm?=
 =?utf-8?B?UlFVMUlRb2dSQkRRcFk3bUFMN2JIbllZN0pmWEFVVG16Uis1OTdoNG92STN2?=
 =?utf-8?B?K0RvSUtWUkw5STVGTHdHdWxqV2Y2WXI4dC83SkUzZWswNE9WdXlyd1hjTGJM?=
 =?utf-8?B?anJIOVdPQUNwcnRQK3ZCSG1vbyt1NGZtVmlob0grVlBHTGEySG83cTRKRWsy?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df245145-7930-4e43-198e-08dd729b0a4d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:57.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84IqRBCbXIXKHk8xY7bNPrPlO4mncuGxr1KYgjRm3zu503j5jlL7IH5ab53T22VBcv4tFN14Eq/howSwHjRQmql4RtbG6pUURRdw/IUUhNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..c24b88b0206e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1227,6 +1227,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


