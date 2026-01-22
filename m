Return-Path: <linux-rtc+bounces-5843-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOIyIjBAcmnpfAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5843-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:20:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C8689B8
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E3DA7AB9FE
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A9234A3C5;
	Thu, 22 Jan 2026 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="TBg/DkEu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023E34845C;
	Thu, 22 Jan 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090058; cv=fail; b=HM7eTbheCZ8ryxDoQzPNV98Ns28ipbfbtk0oQNuFOG5wQ10etQGyKuM252YVp5wOuZ5pALl5O7pwE35kXeR1Rws/HO64nfQ4xJqo4P1Do/yYXxFmKgB79H2eII2dixD7O9E7gjrY2w+IF8P6YetWXtgJJVrHAzEhYLPN43mm754=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090058; c=relaxed/simple;
	bh=m9coxxj2SoSE2HN5e/LFkfXYzc3yv6uFO6F7E32YG1A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t1zigflDIM3/mhVMjEu0CZ4NmTsvxMsPCUOcaZ7mxfbf1LmI08zCRDUfZSIBsUsrC4f4JJZYKy9QbSaQSWqxFd+ucb2UnCDiRJxMLiAYf8WWFp32rm7K5ZQaVIRrVW7umZEXAOka+d3Rs5Tb+zpghozijjpZuShmKY6A+T3g+Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=TBg/DkEu; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKdNfYxJLivhimx5McxbGTvHiIfp87QeC+78gAHz8knkKdGQj+M3kXPKqv2kvPnIZfjT3rcfO2G62I7zYJEw/AIAyC62csDukrPffmlNHLhIkRQhHL7xrAICNCzeWlyR1lqujdNatd4Cb4seaSbmYhvBlTaF8YmD/HLYgwcRL4oE72sb8NGae+PuZJ/U1fSNIezEN2e+QMwDQ8BoUFnigAaWpQ+WRQEcEkuYnS5zfpzwaqvv8ofaQJ0+GzmRZAnyOu8Ybgpi+8wTFCxLrilnh/hTF1Mq6SAPwfNMSIKMGrVfr/g1oDtdw4PO8hd/MxVDYY6q4WDiucKSSmGk2ZUATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCiVmn1jR1fo3EvipKkDPYz3BDBUofq5+r8/CFNq/+s=;
 b=vZ5se0egCmtv++grePcGeCvdsDIhSS8m6XAJYcLwE989cvIkYCkwE9pkZTMDnh9lUct8NxsZyzK/D4/xNwxTDoO4SGW1JPtX3eyMTAWtoT8drcESb/7MuHpdJpStVHfvpbnZWnw9MCMd+dulyP5fKek0H9pA/fJi7a3dumX38NG6CjrMuWzoTdR6pCzaxQzXHqu2IrKdDMGeRO5fJyVR7mB1gP4XTUOdwadXzJURjxdrV6jOb4Ujw1uWL6EJeqZZuFnPZDeuG4z+BjGk2Xr48ERWNTNhPJCPuHPBZ5sGvXxFH/rMOBXXWmU+1wgIkpTFX+pOnddt68APlDJ8CVL8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCiVmn1jR1fo3EvipKkDPYz3BDBUofq5+r8/CFNq/+s=;
 b=TBg/DkEu7IYEoF4xS2sUSKrxghS8C+KhlOnEK+3pTs7QLCw8mJhjHaW7KsEJPFfGNyQQr9HcrPO/KEjjfdzFw28jqBZGGbM81WAB2nWE2OX//eEEnfTf4WjU8j0KCCF9scs9Ep6BKMm/KRvzpxBQq83M4ABwiEavv3jB34o4ys6YkhRxWx+EyeW3KKxwpdv74HERJtPCZ8/0Z+f2m8GX6khZbS1U1tjaClFkbs9RX8yNA8SkOL1CNWBhGf0wfwZ4FXxoepO8KRqr+mBm+9aOTH4HxogcmXXAbnR2OqWmZVXWBE5GlGtLb8y+D5lHKYdyR1btqZ478ByF9yswglSgMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS8PR06MB7413.eurprd06.prod.outlook.com (2603:10a6:20b:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:53:55 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:53:55 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 22 Jan 2026 13:53:48 +0000
Subject: [PATCH v4 4/5] rtc: zynqmp: rework set_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-zynqmp-rtc-updates-v4-4-d4edb966b499@vaisala.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090032; l=2576;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=m9coxxj2SoSE2HN5e/LFkfXYzc3yv6uFO6F7E32YG1A=;
 b=+fLpFgQoZypnZrmK8b+U2VI5JS7gRih4T/PIMfSg/83Uydq+toadLZ4CrubChKSxgbmU3E0IA
 slNs1hC5wxGBtrFjydxIE2mecBwPWVuiBJIfLzrrRhg/Dt+7jGgT/JF
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF0000384C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:e) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS8PR06MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 116ce8ba-f942-4a83-1ac6-08de59bdae88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWsrU3Z6aU9NOUFvT3k2Q3pkREZpOExyK2gzOHN1VUJWTjJySVpUZXZzcU1n?=
 =?utf-8?B?a0xZbFNmNU9JQ1lwdUNsYWQ3MWQ5UUhVRFVyNUJDRlVBVXpwL1RUL2p6WWNY?=
 =?utf-8?B?NkdTSk1zcEhhU0xRL2pReWV6TGxlc2Z4Q1hsdzN2dUpnb1hETmVXdWxxcDVW?=
 =?utf-8?B?L3A3ZVR2bVlQUmJjSVoyOFVjcFdsSUNCczlrVW1PZjVZdmhzWmxMaW5DRUxE?=
 =?utf-8?B?YnJRVkw3MFBtR2VGWFJUOGFUSm16cGVMd29wUjlDa0djemcyS3Z3UGlFUWY5?=
 =?utf-8?B?M3ROVW1LVW1OZ2Rrd3NwTmgzNzZUWEFYU2VQRml5M0hnYTUzanlXd1pxWEhQ?=
 =?utf-8?B?T05rMHZYRFE5UmlzSzBjRzJnUkFLYy96MmhveFdKT0FzZ0sxa0N3V1VzalhO?=
 =?utf-8?B?WUtrTUJGM0pIRUNHVk1qTm4rZEc1MWx3R0gwUk5pQ3oxcXBpRndnRWN6M2F4?=
 =?utf-8?B?Skw0WGdad3FZbW1vZlJOUEJxREVlekwvQkFMMndwR0U3SDFTUjZWelBUS2RH?=
 =?utf-8?B?UVB4U2w5dWczRjhjdFBmNkY2b3h2OHZyM2lLZWo4S3BydW0wZmNUOUFUSHM5?=
 =?utf-8?B?NEZ3c2w1WUUrVVJaM0Erb09WcEdpYzFtcllRUEtmTGpIZWprVzFSbGh5NUNR?=
 =?utf-8?B?VFgrOVF1T2FHR2NWUXFCbTNuZ0tKL2p3Q2laWE40R2JzaVlMQkZsVFdYSEUz?=
 =?utf-8?B?WG02RC9RK0pETnRFaUJmdjB4cFRmWHZ6bmZLSCszR3A1WFhyMHBsT04xK0JW?=
 =?utf-8?B?cmZzVHdYdjJwU1c0TlEwNG9XWlFGN1M4OUNZb3VMQTNlTG1LOTczenVNdVZV?=
 =?utf-8?B?dysyTytJUmlWN3hKcUlLUkRlQkNqLzVlbjRTbWNZL1BSeVhKTXFNd3JuRGFU?=
 =?utf-8?B?eTQ0bDZiWmUyZ21BZlo5MmtHRWkyY3UxcVVqTjI0V2kwUkpDUXJ6ZE5CRG1S?=
 =?utf-8?B?cnNiMlRpck0vZElwdVJ3QmZsWUF5ckFEV2c4TUhJbUhEVEFpaWZUcFRJQnJo?=
 =?utf-8?B?SzVxa2J2ZEZzZzhPcGRudnpzdWJLczhad1dsSWQ4SXhSVStZL3U1cnlydW5w?=
 =?utf-8?B?OG4veEVlQjgxdXRhMEJUbGlVandpakdpMC9GcnRwSmhMVmtBUWx5Q0FBL1FG?=
 =?utf-8?B?MithMkprNmp6Ylpkeld1eDQvejR4SGFpSGJPb2hNWkl1RGJ5ZFoxS1JFU2xn?=
 =?utf-8?B?bk4xQzUvUWUzL0owMUlOa20zTmxwMjVkemM4SUlhdWNyUUZHcmQvdVFndWNB?=
 =?utf-8?B?cUI3MEpMMFQwMW9xeDVrUS9HdThONDRpc2VLbGlyNHZid0cwYmtEMUhmb2lD?=
 =?utf-8?B?RldEa0I2Qmk1ZnRRNm9DVzBDSVlqVkordE5iTTZ6YWRSSkE5dStKVWp4Vmla?=
 =?utf-8?B?ZWRMWDh2YkwzK2Y4WXIzWTNqOXdCRkUrd1R4T0N5akhUQjJJUFp3RXg2TFFF?=
 =?utf-8?B?bGZnMVptelBYbTFzZjR5ZDJrMVBlUFg1TldiM2hhU1FaaHNYUjVoYThBYUNy?=
 =?utf-8?B?cEdYNFRNOFFjTElnK2xHbVZjS0MyVDBRdTJQRDNNWkZVM3N6TFNPTlY0cGNn?=
 =?utf-8?B?ZlUyeWZLTzZvN1QwMGNLVW8reGQzLzVNcTRWenNsbjV1K1dFVFRaMHFwRnlF?=
 =?utf-8?B?Z1cvSVhuZ25TVXUza1lleG5JMHZEMU8yaFFVUUl0V21qdHlhWVBDTU5pNmxP?=
 =?utf-8?B?Z1lkeXZWWENWUnRCOTZFV2w1S2U2YkpnMWJlR3NqQmxrVGo4T2xXcG9idHNT?=
 =?utf-8?B?QXZQS3hjUkE0bzVNOGJQRyszV3FkMk54TEdCVkNDZ1BaYTBzaEs3d1RUMnNo?=
 =?utf-8?B?WCszOCtDMG5wQ1IwcC9pekFjZE9OQzhKQmIrbUJ5M1pGOE5lRGgrSHRidStU?=
 =?utf-8?B?NjlpblQ0dGViaEExMXYrL0Q4ZVd2MlM3bWt4MHJSV3JSbE5oMXdlbHFZbXFG?=
 =?utf-8?B?Sy9pa0lVcnhrbm5XbFRVZEYwMy9zTDNMRWJKTkxuRmlKbVNJekVoc2hFU1dX?=
 =?utf-8?B?d3ZOOWFQMFdjbERsa1JvT1NZaEkrTkxYRDl5RFhzZnZuNi9oaHI0Vm80b3pk?=
 =?utf-8?B?ZHRFbU5LaHJZVlcwZ0QxbUpvMjNhRlZ1eU1Ody9yK1k2VGhVVGJOUXlLTzha?=
 =?utf-8?B?SEhBWEFvVEs2SllxS1oxT1NOb0E5T2c4WXgrMk10QTFpTWNtOHpPTXoyMEpH?=
 =?utf-8?Q?AcfMMil2x5ZU1U5+wmQHUbo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFJkajE0MWJxQWZLTFNJT0lKQ3pNVjhCYnBrQzVSSEF1STVwVzBXRmZEQ05W?=
 =?utf-8?B?Z0FreXhTRjdVRWVKYktYaWZPRkw5NEtwcjRsTWd1V0d0TmIzZjlwRVdOeFJO?=
 =?utf-8?B?TWRvR1VUYS9ieW1JRVZZa09iYk5EaEcvZFpZS2dZNFhuOHozTjA5b1lGQWYv?=
 =?utf-8?B?b0FaVm5KdjB0VHh5bU9QNlBjdlJPbzBVMHFjc3RqcDZrbzYvOGg5ZmFVOTZY?=
 =?utf-8?B?TklqS3h0M2V2ZFk2TWxJTGlSQ1MwSTQ2aEVDTkQ1R2R3V3d5Y2JXMElJdlE0?=
 =?utf-8?B?MENJZG5XVUtNUkxmK1MvNkU0WHA2STRSKzE4SWJKbmVwYVpxcm9UbXp2aHo2?=
 =?utf-8?B?MXM0T2tiREorYWp2QWJxaTZRRDlydEQ0dmhQWVF0MGprRisraW5BN2FkOHBL?=
 =?utf-8?B?SGNPZ0svNUN5TWJOUEVZR1EzMnFWSEppVklsaTVieCttYjNQanhOQndoc3Ew?=
 =?utf-8?B?aitjL3h5K3QvYTYvZnZhZ2FocHVTQWZzbVYxSy81VkpnbjRmQTBHbTdRN1FY?=
 =?utf-8?B?Q1d5bGhoMzk3bmEvVksrZlk2dWxRa2YxeGhuNXVYMUpiQjA1REx0QzZacDcz?=
 =?utf-8?B?WXVQVDJKSzI3dHZVVE0xaFdJZ2ZuRnF1RkIzeTAveTlaWWVGd1VCK3pxcnJv?=
 =?utf-8?B?d1RKSVpEeWZYZHVUSkJ6M20wNzVQTjdJSVBVQnBiZFNWQ1Z1UDYybVpRSHVD?=
 =?utf-8?B?c0c2RlFsN0FmNFgxd2liUFI5MllsV2FUTjRzaXVLbXlxR0ZwTFdJN2NOUEdT?=
 =?utf-8?B?ZkpRODNqdFY3QVpKTk1TbHZ0RCt6dk9vaU9BdDV0TWZQZnlxN3FVRFB2Nk9O?=
 =?utf-8?B?M21pcU9BZHFJMTIxK0d6SXRhbDRZYno4cXBzYWZNRDE4dlJSLzliOUJmVGEx?=
 =?utf-8?B?NTZwQWNQL0NMWXVRMzFFY2RsYnBaYW5ub241NzY1TTQrQThlT3k0WDFlamNk?=
 =?utf-8?B?a2dmMVFOdjdObEF0d1RtMWJQTW1qUll1RzNtdFJLdjlXenFVUkFxNS9CU3Zh?=
 =?utf-8?B?UlpZKzRRM01GSVV5L0p1K1B5SGR3YXQ3VTk1OEs4cnpKNm4vdzdVckkzU1h2?=
 =?utf-8?B?Vy82Y2IxMmw0VW9CRG9MZEg2K1hsR1ZTVk55TlNwM1UyVjFZTE5GTVNrWFdQ?=
 =?utf-8?B?YmtZWUVqRTdGNkZVSFk0S0VTWVhQTVNOZEFoUWhMU016eERJM0NzY09VYUpX?=
 =?utf-8?B?NW00cnlRcVMzUGw4NWlnQklmSDBuNnAzSmJpaWJGSkFOZFloYTNUeEhtWVJ3?=
 =?utf-8?B?MTZ5OUN1ckRDQStKaHlWOUd3Wk44UDNWL0dncEMwdHd5ZHJKb2RINFM3cWJk?=
 =?utf-8?B?S2hBb0FqL0RUWC9MRlhTTHAzaVRkZkMxelZqaERXT0VhYmlEeWl2ZEU1cHhZ?=
 =?utf-8?B?Uk1qUk5Td243amZJckoxcUJ1M1Z0MDd5RkFqUGNNYUFRYWl3YklJTUdrSjZH?=
 =?utf-8?B?Y0pQc1BrcFZQUmtBS3ZxYWV5V0R0YjdCRmRNMkVONmd4OW5FMlNVeE5oUFVh?=
 =?utf-8?B?dUdWVEZlUWNCeXJSOElFd3VJRm9mdjdvYVg2c1VNalBjWHRIUVNwRzVlb0tK?=
 =?utf-8?B?VGxDUzR3aXllTXhTSFZsVmJySGpleE81SU84aS9EL0c1NStCZm1OdjNWbDBa?=
 =?utf-8?B?eE9oWUpLYVZLTEFSWDFZN2tQVGF2MExha25abzdGZkV3aFRhb1hyV2FENENh?=
 =?utf-8?B?a1BxS2t0dTZPUHExSlM1QTFldGJqVHh0VWZONi96dFZOaGpZZXdnNVYxLzNz?=
 =?utf-8?B?dW9iVkRWbnF2bkdGUVArSGtZV0MxMmNDZEdhRW9EbUlwanZGeG1XbDdESUxB?=
 =?utf-8?B?eWFnZnd3bjU3aTJrRFIyTVRZL1Z5eVNpUUE1T0FyZ2kyS29FS0RveHJQZEpp?=
 =?utf-8?B?R2gzYVdjQk9nckdjQ0tQbWRub25LZ0dxTStUSG5oNm1SZW8vSXlyL1NxOFA5?=
 =?utf-8?B?djBhcTNmbllQNDNDb0pueWI4ZjRHRk1TdjByR2hOVjBxQ0hDeTdzY1I0TUFD?=
 =?utf-8?B?emdUZDE4cWd3NGttVnVvZ2Z0YXYyY3hkNm5PTFVDRDRjUC8wby9lREpEMkJ3?=
 =?utf-8?B?REJibDlEUDhxa0VYbm9pOGQvZzdPREp2WkhqYWZYWjlyTUdNalRUSGwzTXhj?=
 =?utf-8?B?aWJIaDFxcmlUMS9VMVpvSWZCYlZOT1lydVcrQVM0a3JJTVFocDQ5UHk4alFh?=
 =?utf-8?B?aUhVdGVaK0V2MnE0ZWRabml6T2dEcnRGRjlNWVcwOXk1V1BIZ3U2OC9PWWRD?=
 =?utf-8?B?TkJuc3NkZ0I1dTNRMEtrTE5aQ2ZoWHQ3UE9jbGs5VnhGZkNmN3dVQUNDQWRX?=
 =?utf-8?B?SGhqMmlTdkc1cGpQTFFrejk3ekYzQ2Z5cjNZUFMrc3V6VXRzb3V3bWU4UDJu?=
 =?utf-8?Q?gMY6j3QEc3lFianE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116ce8ba-f942-4a83-1ac6-08de59bdae88
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:54.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuaEy2930VWJT1VEAT6k+zYUmIGETmHex1k6b19GVVsfYobOrBAXWA/0mCSykWwPQ7uyCDcErMQvlyFLVnUGQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[vaisala.com,reject];
	DKIM_TRACE(0.00)[vaisala.com:+];
	TAGGED_FROM(0.00)[bounces-5843-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-rtc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,vaisala.com:email,vaisala.com:dkim,vaisala.com:mid]
X-Rspamd-Queue-Id: 1C3C8689B8
X-Rspamd-Action: no action

set_offset was using remainder of do_div as tick_mult which resulted in
wrong offset. Calibration value also assumed builtin calibration default.
Update fract_offset to correctly calculate the value for
negative offset and replace the for loop with division.

Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index c82f4d490fc7ebb5876b820182f5e79a99e496a8..f0f5dc63e254799ed99927c259c767b30ee877a4 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -208,13 +208,13 @@ static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 static int xlnx_rtc_set_offset(struct device *dev, long offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned char fract_tick = 0;
+	int max_tick, tick_mult, fract_offset, fract_part;
+	int freq = xrtcdev->freq;
 	unsigned int calibval;
-	short int  max_tick;
-	int fract_offset;
+	int fract_data = 0;
 
+	/* Tick to offset multiplier */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
 	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
 		return -ERANGE;
 
@@ -223,29 +223,22 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
-		if (fract_offset < 0) {
-			fract_offset = fract_offset + tick_mult;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		fract_data = fract_offset / fract_part;
+		/* Subtract one from max_tick while adding fract_offset */
+		if (fract_offset < 0 && fract_data) {
 			max_tick--;
-		}
-		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
-			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
-				if (fract_offset <=
-				    (fract_tick *
-				     (tick_mult / RTC_FR_MAX_TICKS)))
-					break;
-			}
+			fract_data += RTC_FR_MAX_TICKS;
 		}
 	}
 
 	/* Zynqmp RTC uses second and fractional tick
 	 * counters for compensation
 	 */
-	calibval = max_tick + RTC_CALIB_DEF;
-
-	if (fract_tick)
-		calibval |= RTC_FR_EN;
+	calibval = max_tick + freq;
 
-	calibval |= (fract_tick << RTC_FR_DATSHIFT);
+	if (fract_data)
+		calibval |= (RTC_FR_EN | (fract_data << RTC_FR_DATSHIFT));
 
 	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
 

-- 
2.47.3


