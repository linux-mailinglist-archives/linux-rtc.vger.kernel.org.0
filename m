Return-Path: <linux-rtc+bounces-5788-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B427CD3A3D1
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D216305BA32
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD503090DE;
	Mon, 19 Jan 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="XssbvHEU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021115.outbound.protection.outlook.com [52.101.70.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB443081A2;
	Mon, 19 Jan 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816335; cv=fail; b=IPibMFqhdhiF5nMiXg1oa6Y/sGJdesMKkSgWJCGTpZvBXbf4p6a4SxtyrGYtgTFK29C1dNRren0S8TPfzIGwPc4E+4lPKGMEtLv2RkaLkkwUC4STHybQ76seWfxtZ/4UjDnNBsnVic5SC39HMhn5ZoKA/5szLtUbSiB2T5dmYx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816335; c=relaxed/simple;
	bh=Tv05fZ9WYNSdMp5bi31hr2kVIZJxMNNtDTwLWLCabsg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Vp1nXtyVhxV3RLz6XiqnjKO2RO6zV9s+WlbSrNBv49TVxEQ09uljcLJxqP1gM5RAMyhJGf31noDq/C3Wl2xpPhiKcHzF2afeKjUbCJ/Kdr+8pxGsi3pcy7ULQpO7r4O6BmIq2ujrLbuZlbrrals3zSHX0Wxdy6b/yLvacbTdEBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=XssbvHEU; arc=fail smtp.client-ip=52.101.70.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chcMvIPtyG+4/HiQjgKP2aI9uL4ZmJ/7hZNBXiAC++NAA7SmcR9FwVuCKAk2lLxFEg8vo4sGMyxnHEhC/sVp797nzlreTjzocpF+CY0eEut6qefiF0T6fXVZpH1XzJWt3C6XnrZGXKKYdKp4qukBB2f9hAse1d+dVC6kbDY5pI/a7ah6JHKY9hp6diQe+TQIbjx1nq7YS2hxxE/JqIuq3ANcIWJKcumkDW+rcOqgmJ1n8qP/ARnVTfFx+En7OGVuCUMcnVnP2QrDampzifwju+D7HP+Chnb7Qluklm02Borl8/mwamLpGJkyUJReymptx7v6XTz9LFeH3/0blaCizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qfefg7U18uX7JoBQ37efONXiaznDDlfatWBtwVSfNBk=;
 b=VVVCnbuFiw00K12/znirELgVNyhCVM78S6a1ITyII/OV93ZQiD+mfcqGfowShGRbHiXwAZzSx0WtCurosWGz8jU3TrFdokU978mtz8TT40VY2i42Jtm7AdyoTklOuOADlQJNdhY2T4+9oW0Ni68dFROtSazq917TBcNOdReA1m89k8Pc6ydjcGV84mPPyfd2/DkO05D6Zo7Z8QV2u5mh6ditGc4NPUT+c20Ry6mqtYZ8f/A90mUzdQPUd9pubhWWtW2Hz587cDCzZxfsJUm7HUneE8hAKSO/x5OtF8QhvHMQhxBCQXczyVlfqEIXsR0+zM9R1c5yttFAeFT2/BZ0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfefg7U18uX7JoBQ37efONXiaznDDlfatWBtwVSfNBk=;
 b=XssbvHEUoy0zIW/AK1Lqf7zYG1c1I1Tvj78Ir+QpZuvw71SM/lqWg25P56Asz+QeyHL7qb0JtUdSdn4c7PC++6QzdOY6Vf0LQadoAfraJ3ThgDiMARrRV1zpB9HqJlxIneh6XPKcDUW+VfvtXYxOqjFRKJUzyvW/AgQ8YCswWnuwIcDvVpNVLBm4BZ7fq7E6fgvw5A0nJIOc/dR8kxn0Z7naoIQfOFCgvHt7SwCHa484L5DTXvnZ9HPH5dhCTuUqj8wRR4oz4Yrebe17sVOmjB7qGUBi+Aw/9XNeFgZgV2nFHgnpxARD8FfO08ZJ1mlsxwQpB7qu6EEBLeA8sEdN7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAWPR06MB9950.eurprd06.prod.outlook.com (2603:10a6:102:4c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:51:51 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:51 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:32 +0000
Subject: [PATCH v3 6/6] rtc: zynqmp: use dynamic max and min offset ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-6-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=1449;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=Tv05fZ9WYNSdMp5bi31hr2kVIZJxMNNtDTwLWLCabsg=;
 b=sf8DCVnaIZdRoFVL1FGwi17u55y9mARkyZ+vrZ/xKGTx9SjF0zYpHL8WWhW5IgWZ2pGVcODp/
 biyhuHUa/wnAzTI1vO5e/50mS4QBNJFcxqhlQo0nwHb1RA75qA//1GJ
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAWPR06MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dc2321-52e9-48c0-bd05-08de57405e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0ozOTFma1lxcWFWY2pVdkxZUnp0aHhsdStrVmpZQWRWajhNeFlQT2E4SVZV?=
 =?utf-8?B?VC9rNEZNY2tpUDRMQXpHSmdWdUMxOVpaOGF2NWk2U0QxMVM1UFV4K3JtMHZ2?=
 =?utf-8?B?VDN3WThyL2ZMRzBzVWVuVmx4UmQxenR6bnNqZkJMQjJJOTE4YnhzSy9aYnd2?=
 =?utf-8?B?OWNBSEtNZGNSdTRobXZLZUVvWjVSRkJlSVpzNTNHK2hicFplZjk2U2VBVFJY?=
 =?utf-8?B?Z1lMSUZvVmdNcHRjU1FwbFJ6ckl1UTE0T2cwbzJTQkNRcnppbWROT1F6dmRi?=
 =?utf-8?B?TWc0ZTBHcHRKUzJKd2laUEtzUUFSQkdmbElKMmR0MWttc09zSDkwbjM5eVpL?=
 =?utf-8?B?RkY2L1FKYVJOYmVwTDdZOU9rRFZKbjBRVjlOVWRsKzZCa1FrTkRFd0YyNm5J?=
 =?utf-8?B?d1lwZDNBSGpyUkZ0bkt1RWd4MU1BQzNET3pWZnQzVkFzZ24yYjF1WnpKdXJr?=
 =?utf-8?B?cjNjT0VrK3pTSUlyWUxMNHJQNUxLR1BGQTNaTWNmWEdPSEpzRm9LcnFVS3B6?=
 =?utf-8?B?Y2tmRTNEWDI4RDUrSHBHL3FBS3pYVXExbkpvRGNPUGVsS0JqaTZxVHhDSVRQ?=
 =?utf-8?B?bWpqOUh1VUhOSEIrNDAwYnZQWmVkU0orNHJZU2RmWWlQU2U5WFdrdzVOTmVq?=
 =?utf-8?B?YkVmSFZiYW54VTcwcW55MGRaMXdIbGNtc014Q3htUTRKaUd4aHkveXB2Q1dp?=
 =?utf-8?B?YWVkb1pUMW9WU1o3TkpDTkh0ZllrTlpxVTZscEgwbEtTNU9Ic25MajF5b3lS?=
 =?utf-8?B?em1yT3pEcDM5dnFXZU9oeHlIWGNWelBEbmorVFZCKzg2dUxPcTg1QklsMktk?=
 =?utf-8?B?V2lkb0liS3ErZGRmS3NrdTJnUW5QMEU4NURoMldRSzJhZHJoR1FqSlJHZ2F2?=
 =?utf-8?B?cWxkZVErVkFzQ0FqVUlmWXlOOSsxLy9ENTBHaXdxWTJiL0lxUk54eVV4N1Rq?=
 =?utf-8?B?MlRJMVZ2V1Z2bWN3clZNN2kwTWJBT2w3THVjbVJnOXBUd0JicHMrb2ZOb3NK?=
 =?utf-8?B?R1l1clBCVUhqTksxeE5ab1ROb3h1Y1RPOFYwcDU5UVoyaE42MWRHNHhxeHVj?=
 =?utf-8?B?Yzd4Q2JlY2tnYVkzRVlBZi92RXl3L0FGa0FsdzFIZ1Zva0hJTzdmRzJCdndM?=
 =?utf-8?B?SzF3NmpLUWFXWWFUcUQ5L043R0VoOWkvbkRQZVY5VGY3cWRlY0Y5RmVHZWlr?=
 =?utf-8?B?L3l3NkJtbkRxV1RBVVpkbmYxeW9xenhVSmEzRE8rNEN0V1Q4N3g3UUdacjNB?=
 =?utf-8?B?aFRXSjhpMFoxRXU1ZTZhejYxRDlQWWVuelJRbElZQ3EzdXYyWXhVZTRCeEtO?=
 =?utf-8?B?REd3cS9ONmE0d0piYmsyNE9XNTJZN0J0MEFxR3JDSXQ1bk9rV0QzMndFcXRn?=
 =?utf-8?B?QnNVemhKLzVpdjFLSnB1djBqNDlnbEZpZEJGOStvSUxEK1NiVVk1M1Nmb0hQ?=
 =?utf-8?B?QnhGT3BxeU5DVWhWQzZBNEpaeGRNelIwaVpGVWROdml6U0NBaU9FaStQM3NV?=
 =?utf-8?B?bGw2eGw4YkVpaVhCQnRyOFE2OVY1ZmNQOFpoOVF3Z3VmbThKWE84RGlyTWZX?=
 =?utf-8?B?ODNxUGliSTdhQ0tvam9YVjNPZmVqSGowSWVuTEpkV1N0UDZkQ09mUnpKWVR4?=
 =?utf-8?B?MVVRMTFWeFQ4SzQ2Y3FkZWoxeFgrKzRpbWVsT3pad1RGNjdRL1YxNUpoL1dp?=
 =?utf-8?B?OS9Kek1JWldNTlFrU3ZxOTlHSlVUUnJUa3lMMldxV1VIV1hLRW01SFJ5Y29K?=
 =?utf-8?B?K0VueTFhUGpWeDJ4UC9pNENGVE9oYlFxVmpQU1NJS0E3WTU0OTBGVFJxZk1o?=
 =?utf-8?B?RDI5NjlBa0NLTFFsSmY4YjllNUR0Zmcya0VHdXRzMklCei9ZcktpZ0YxR0dm?=
 =?utf-8?B?SWtGQXhURDU4OTRab3MzbGk3Mm9keTBUbUJHV0FlcmtkbFRRbisrMXJRdVBP?=
 =?utf-8?B?eTBnajdnS2o4MFN1TFE1ZXpBeWNNWTJiVmlIcm8xK0xUa3NEVlFPN1ZIeU81?=
 =?utf-8?B?eEh2RS8yVjBReXJmYkt3aEFqSkgzZThQR2JBRnJlcUZoSXJlVjFmVDYwbW9I?=
 =?utf-8?B?M2hTbkRLUERrQkZRQTdTWVI2NzBVTkp3enB5MitReHREWmxHRXllRno3MlBy?=
 =?utf-8?B?cmp2U3FUaEFYbm1aTXBabEdCc3NCd2YwcFVQVUNtZlo3NzZPc29Fc1NwajRI?=
 =?utf-8?Q?R9skllJcA3YI7V4z4dsWzcc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUl2bkZaSW4zbnpWYTlBckxPYjE5N09yZHFBdDdOVndtZGNqU2xXQmxSK1Vw?=
 =?utf-8?B?YlRtamVMK21mMXp5aWxMVUltcWhEZGFTcXBlcEgxNUZaWVhSY3JOZ0d3c0w3?=
 =?utf-8?B?L0Q1REl3T2JMbkJWYU9ZQ3JmYVYzbDJkay8rRVFrSmVYc2dnRlg3OHdKa0hi?=
 =?utf-8?B?WWhhRXN6c2Z5VVd1cExrR2dsWW1VbWR1a0dzWE9KdDZmNDhqbmprYWRDZzFr?=
 =?utf-8?B?Q2p6bnBDcFhsa0duaUFEdEY5MHl6a2xOa0oxMlUvalJjZ053VzcxcGhiWmND?=
 =?utf-8?B?WUIrWjB5eW4wcHE1MnFZdnJtdm9qN2h0Zll6TmljRm4xQXVvalpIZTJrcUVt?=
 =?utf-8?B?SkhJMXhVRHpmSEFIOUI4MnIwajlaV09LUFl1OCtNcHFsWmYwR2J1TjVYWUFa?=
 =?utf-8?B?dnl1OXMzZFNkNFJDTHo2VGNmOXZOT3QxTFk4SGNXb1BXU0x5cmZ6ZE40ditt?=
 =?utf-8?B?VUZEYzFZYUtHcC9JeVN5UGV2S3ArL1NOcENrVGVDVDF4UWRMMUhqakMwZFhp?=
 =?utf-8?B?MXNZSmMvV1RzSWlERjRSbUphcktuRGo5eWxJMG13b2NnMlE5SHdQckFzTjdq?=
 =?utf-8?B?aEwrY2RJMWtsTWl4eUtzMFg5bDNRUnhCVWNwVjA5M1JaSS9YMnZGdkozbHZF?=
 =?utf-8?B?Skp6ZGJHL0Mya3EvTUh1MElNNFlESURLY0tMVklHUGRKbWVodkkyREVHaVVw?=
 =?utf-8?B?VEJKYWxiZitvWll1ZWFYYWttUUtzVlY5ZG14eEJIZWs3cXVLZXh2c3NyN0pB?=
 =?utf-8?B?TVIwaUhqVDdOenJJc2NHWndaVFdwMUdrTXRibTFVSHZjTU04VlNWdTdlWkMv?=
 =?utf-8?B?VHk1aS9leDU0MGxNSHl3cE1MeDIyQk43bkQxZXpJRS9RTHN1TnlVOGY5Tllh?=
 =?utf-8?B?a3lLb2g5Z1hjbzdsZjhPTVh6Z3JjQ0xiSTRXMHJYRWdBenpUVzlobWgrb3Mx?=
 =?utf-8?B?L2F4em1vV2NGOHc3dWFjRG0xcG1UZ0lqdHgzOGJrRlBSaHNsSDc3UGFOVlVC?=
 =?utf-8?B?ak5zck9sSzN0ako1MGtYT2ZDNjhEdFd3T3J0MUJoeGpqZnhmYjJYOXVnVVRI?=
 =?utf-8?B?V1JmSkVZbCtDakxwL3NHeXhFRDBFMGQyYVZaYTh4UUJDbE50amIxK2xwRmJ4?=
 =?utf-8?B?K0VxbHVTNVNWREJTVlB5a0oyMkQzUHEySktuTUEyOWlVVThiaVhMN2ZKK3FK?=
 =?utf-8?B?cFBQcFhVa09aQk9BNGFRSTcrUlIzbjlXdzB3WjZHY1ZlenF5cFdtTm5qYW92?=
 =?utf-8?B?VEFQeWlLSGRmZ3Z6d0JUZXYxdW5ZT01HZDJnYTAxZ25ucmEyU3RaWE4vZ0g5?=
 =?utf-8?B?emEyMjA5cmYvbjE0amhQZU51THNKd2lxVklmeEpIWGlTNjRCTDl4dVRCWXg5?=
 =?utf-8?B?Sm00aFgyL1BLWTFTVWhnSWIzVGV5cXByL1BQekpNSVBOeDFWcXYrbDViT21E?=
 =?utf-8?B?d0oxRjZYS2N2TnhCbW04NHJaaytGcjJKWUp4c05zcEl4Yk5wckZDdVRFNkpz?=
 =?utf-8?B?RHR5ejhWRGpGdjM1bFNzcVN6V21ybWtSUW43QUdqNmwxWGtGRlBvd1FIR1J3?=
 =?utf-8?B?Mk9VMGVoK2kxR1R3c2hFc1QzcUUwS0p2eDQyT2ZoZ1B6eWlTTnFVM0E1dTlX?=
 =?utf-8?B?QXhFY1lYRGFDeG5JajBLcGhaVFJBaFArNjBBZkgyVjdRQU05dFdhWDlsbVdC?=
 =?utf-8?B?ckRDNFhROVhMSjlrR1NwVHlKY2lYVSsrWTdJZjVnaDRCYmtROFZKZkhFMzdw?=
 =?utf-8?B?MEZrRUtMK0svaTdsOUk1ejdqUGJYR0tQbmIwY2RJYXMyczZCdjF2WjhzOTFT?=
 =?utf-8?B?RlBGSGtodGUwUkdjbEoxa2d5VlpTVlBvREFWTS9oTm8vZFFrbHQ0anFma29Q?=
 =?utf-8?B?T1RjNCtRb2RiRG94b2VGRWlSS3ZvWWdmTWVkc2ZSV1NZenJTTVlja1FyRnUr?=
 =?utf-8?B?d1MvRU15RmJXSkp6ZG52WDd5Ri9zRFZxeHd5a1ZhNU9tY2hoVUg2OHBJZW5w?=
 =?utf-8?B?UTNwQ05uVWltcmExbTUrV1JnRjFnK1RFQUpsQjNIaTZLVFYveG9STHFUb1F5?=
 =?utf-8?B?YWhBSE9abXcrSWNKRjhGaVBySGtsVnhRczU4bnU5dytMNEZFL1JOMDcza0pU?=
 =?utf-8?B?NjJMRDlicVNseHhoTXBTVmpxNEptL1hpY1lvOUtOdlUvdXNNMGJvakhIMHVZ?=
 =?utf-8?B?OFBqc1VzZEJtNDgrNTRWWkVmUVBVSzJVd2pMRE5UdGdaUG1pdkk3bjZSZzdn?=
 =?utf-8?B?czhVM09zeFJabGR0MW4xZVR6UXp0YVZSUDl5UnpRNzVHTWxsSlBvVlNKLzlB?=
 =?utf-8?B?VzZOcEtjOVREbW54cGx0Y3NkSDV2SURpSHU5aGlkUWdQbFkvaER2akh2Tnlh?=
 =?utf-8?Q?cMm0UI062zbWRwRs=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dc2321-52e9-48c0-bd05-08de57405e92
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:51.0465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PA3Zj0404aeidA5l0ZxDTDGzg2JOX1GX6e3IfuSZJHWzNPHl1A6sNTNTvwXuf/oTEmXUmdrXBNYU5AErJK5CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9950

Maximum and minimum offsets in ppb that can be handled are dependent on
the rtc clock frequency and what can fit in the 16-bit register field.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 1bc957b3a9058aa1d809696c13662ecef0437a92..8fc2f838707c32297e812ef1b8a195ff55f849e3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -44,8 +44,6 @@
 #define RTC_FR_MASK		0xF0000
 #define RTC_FR_MAX_TICKS	16
 #define RTC_PPB			1000000000LL
-#define RTC_MIN_OFFSET		-32768000
-#define RTC_MAX_OFFSET		32767000
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -215,12 +213,12 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Tick to offset multiplier */
 	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
-	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
-		return -ERANGE;
-
 	/* Number ticks for given offset */
 	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
 
+	if (freq + max_tick > RTC_TICK_MASK || (freq + max_tick < 1))
+		return -ERANGE;
+
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
 		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);

-- 
2.47.3


