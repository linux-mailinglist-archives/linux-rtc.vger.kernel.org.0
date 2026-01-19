Return-Path: <linux-rtc+bounces-5784-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C059FD3A3C3
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4A1D30864FB
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2A4308F3B;
	Mon, 19 Jan 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="QkOnjgbk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021104.outbound.protection.outlook.com [52.101.70.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30603074A1;
	Mon, 19 Jan 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816318; cv=fail; b=mZQC3+dqejvqSOU12bsK5F8UkwMAwHefgV93Mft+4kYiy4t1E8vlmYwx0dXj4x5sBFf/Ors5iIsB7+UE3HR4hm/CH+0Qg6UV+/3KklR14Vcg3HJBndtpk8GJNT44eYeG0yPeOMqM58Z+s78KNDW+QRvWUl+eVYp2r4TCYVl/ofk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816318; c=relaxed/simple;
	bh=0Ym2fYiYAR4HBtZ9Ppbhnk8gR7df/9ikF0SiOIZfbPI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TWMtFldEdJ6AbMxeAvFLj+AVsxS/FfAsItAwQNNsOvlS0e4rExqbaGf8izMi3UizLHUbpqd+talsu3OabDFaBqmwCCHalGWPX8eP1foOqT0RWuXIZmr1RdjC7BG+JsNMY5D3g/5m0NINf/pmbMU9opKOll0KwM9rwhRwux91L44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=QkOnjgbk; arc=fail smtp.client-ip=52.101.70.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNz4oe0VmGPiqlCR/876XmLhtXtE/Cew1rofj9WwNdH6KAknPQL6Y2eY5I/e6t9+du2grXNkJzUOguB6OZKw30le1ufbXSahMkBNXah1zxsH2Dv1+MJSZmmkswVNM5yztDIwab3ENIzpE4EJZ413jZxrksPFLmojNbbes/EU6qFzAWPNcVCb2hedQ00w/5WYTtRWDq8NmIrUPyd56OPJcsgLXDZkppTSgfXQVotpDzUWN/Fv18yvZM+QWaHXnEpAS/SbwGbCweCu2evqgHAKMy6gaCQBR+QRi5dWHIilE/8iyJgqPcSDPTogf8SIt7VO3FR+MMtfrerczIg6DH/rUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upVY4yeQ4SQly3bz9H6tyVaqrObuS95ISOFt1NhOOEg=;
 b=SWOfjw5EGhEhtkuBybkdFSQf3QyRlAiH4kYa3Zj5FIBuilVlwmJ3Io5MpkY1aPW3PuffOnt59B8q53vsTmClqFywBUg4avZQz+RgrBH3pAbEyNISQGSSbJ2t5SBGX3w+Oj+a9NJ23MCrtnh1lwtwPInSVPXE11/R+zSyfF5nrdrPDN8CaqKjs2FOkVRjNc+epJblLP626so3DP1/hqsO6sCb5PE7VAltprCEZMHCaH5oKNv14VoNP+xXPYGfFBWpOMow4vVz7oTtgKRfI/yWIVsXTx3wwbZLmqgzHpUbwSyTel/nLSkZ5KNwVX7pqDDqltldq8qAEFXftHAuzv09Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upVY4yeQ4SQly3bz9H6tyVaqrObuS95ISOFt1NhOOEg=;
 b=QkOnjgbk14HYbBp1jd08EWc3YWL4qcJCv2u4vc5MhIat8pr6aTsCDANh6Piul3290PY3jtEyD2WM22T4emSwMbMjd5taEL8PU1jfNP0RuR0qnlloz+OLj/teEk34rGaSFbcqsJfdUnC5cheLzW6FoxAsxE8MS9B9Q0BPAv/OI1ocH3rvX2ehH/HLmTz0YO1vjFlwEoXsPGh40/dcZBhiAwW2g5OOaladhiOWaB5c7v6W4mRQY+NIC/4cYY5vomOKpEKtC3Vn4CdR7A0c4mL9QzRSjmv8oUEhZNX43qAgxZ3Oc7PnoEl1YY8ILqCRSvl43YuuGcm/iRn3v0MgKMDeAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by VI1PR06MB8902.eurprd06.prod.outlook.com (2603:10a6:800:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 09:51:47 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:47 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH v3 0/6] rtc: zynqmp: fixes for read and set offset
Date: Mon, 19 Jan 2026 09:51:26 +0000
Message-Id: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7+bWkC/33OzQrCMAzA8VeRno00ravFk+8hHrq2cwH3YTuLc
 +zd7QYeBPH4D+SXTCz6QD6y42ZiwSeK1LU55HbDbG3aqwdyuZngokDBEV5je296CIOFR+/M4CM
 4obhUe2s5liwv9sFX9FzR8yV3TXHowrjeSLhM/3IJgYOU+lBY9FIX5SkZiuZmdrZr2AIm8UEUR
 65/IiIjOj+FCiujpftG5nl+A29vSRr7AAAA
X-Change-ID: 20251201-zynqmp-rtc-updates-d260364cc01b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 kernel test robot <lkp@intel.com>, Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=2270;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=0Ym2fYiYAR4HBtZ9Ppbhnk8gR7df/9ikF0SiOIZfbPI=;
 b=5PMN6BEl8kxnLquEu6DAzkFl1W8ofb2cFLGr3ERUuf23AAH2xChb74rBsch3/oirigeDuJMqq
 ljeMmDtGbyFCAvWI15C28fSAXuwSzwM1UrnHZtUoyN9UjoESAGu03g0
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
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|VI1PR06MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: e59473b4-8330-46b5-1a9f-08de57405c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU5tbkZuTFRSaVM4NFp1cWdKeExUeDBvWkRiWXVmMnFhUFV6OEplTkVSbXFM?=
 =?utf-8?B?dGFqbE5PYVg5WXZuWnE5c1JQQldEL1pKeDBVb2RFYzlpNHM2MWZJM1lTc3dM?=
 =?utf-8?B?Rno3V0EvcUJZY0gyUEFKZW5YNnAzKzRmME5aNkJicXN4dzJuMjJ4L0lzS2dX?=
 =?utf-8?B?bk5nNktBVUxNeFR3T2J2WVVvNytEZ0dtc2pvZktlUU5vd0xDazFTSjRvZ2ty?=
 =?utf-8?B?aFI2V0c5T3FmaldLUitPeTJBcGNLK0E1MzloM04wN1llSWIzbnRndTI1Wmd2?=
 =?utf-8?B?NU1kVXV1eTRDYjhGY1NjU2UvWkJsUTRwVUJ1cHRqcGZiNTFFSTFsN3hsRXh2?=
 =?utf-8?B?aEpXbXFLSy9pTGVhUmsxd1BYNmpVUzVCblJRQ0cxbUwySmpNWDR4RDNRK1Vy?=
 =?utf-8?B?azBMOXAxUTJiR0NlZGl1Wm5vOWVCNmdEUGlOeDNGaHhOWDhqa1dEL2JQOFBn?=
 =?utf-8?B?YUV6bmJIKzYyb3FaN3ZUNXE0b2RBeTdRTTBScHdTYzdTL2xyRkkwREZHTWti?=
 =?utf-8?B?SFdMd0RDRXNLZDludXNZa1VrbTNEYlJrNm8xeDd4ZmtKQTFSUW5GVjhvQ1px?=
 =?utf-8?B?eDNxUjNHejdldzVTQmhRbSsvRTYyeUpMb2F3T1R3c2xvai9LNXpQaVZtWlpL?=
 =?utf-8?B?bVY5bXJFWmhHMG1HODdDL0pJRXI2VllnQ21PbkR1VW9PdkwwS0hZeThXOFh6?=
 =?utf-8?B?TzYwbDQwRmZLdFRXM3lDd2FSbUFHNmdlR1pEQmRoR2dyUHNEbUtMWFp4QkYy?=
 =?utf-8?B?OU1sWTFUQVpweHVLbTN4bU5XSTFML0tNdXR6Y25ZdUZhbHRQVEFiZEN4UzYy?=
 =?utf-8?B?UjY0NXdzK2djaWFBQVBJTHdISThKME1sc0Y4YStWMm14a0sxWFRlajdKcE5o?=
 =?utf-8?B?QzNpb3phLzYrcVI4cjFPcmFoMndXVHBMTW5Mc0YrOEtEVkJmaWlaRCtVWmZQ?=
 =?utf-8?B?ci80dVVlUlZDQ2xUc0JCeTNPZ1FFM3kyWmsyOCtkdGViTVRFT1ZPOUR4c3E5?=
 =?utf-8?B?SVFwbWJTeWYwcXYydUcxeTFkeXBhRDgrYkQ0NEIwaW9oSStuOStjSkJKMENl?=
 =?utf-8?B?cThPekgwWjB3RFZlTldCQTN4b1BaWVRqY1RUSzl1WjZiVThVTC9ab0Q4alRP?=
 =?utf-8?B?QUpQOU9jc2ZnMlg1YkZ3aVJpRFBMV0lvZGpDMy9ZTTd0eWJyM1hSZ2pHR1Bw?=
 =?utf-8?B?Y3ZMMCtkOEFuNGVBb0hwekUrQS9NWis0VFVRVlkzK3N2YXJJemZWeHdSYmpG?=
 =?utf-8?B?UTFjVVIwVEI1NnRFanFobGNpT1RwRUFLUjlRZVRtNVJmL1VWRkdBQ0FwLzZp?=
 =?utf-8?B?K3ZIUTFST0VIbGd1b1gyTGNEK3VQN3dOdHJWNGFNOUd2MlFCU1VYVXVQaW04?=
 =?utf-8?B?Z0pvYnZ2TXM5RDRaNUFScWpQeVNLdWg0NGg2enEzQ0hQbXJUK0ZmcGN2Z0Rz?=
 =?utf-8?B?OVE4K3ZQTkxNVGUxQmlTTmhuRDFjQ2tKbkxnUFhOOXZNRWNMOGFUQmZnNkxC?=
 =?utf-8?B?cFdrR01oN3NaT1hBblVDMmR0WlhCWkRaeFl4Q1o2alE2ZXJ6N3QwdC85a2kv?=
 =?utf-8?B?YnArblF3ZnAyV0x5eGNMQnRGQ0JPV0gxVUxUVzlxSWExbFhJbnJkSEhxaU80?=
 =?utf-8?B?TGR6RVFMT3drV2Zsd1cwTmZiS0pxeEZJUjY2RksreHZmZFBzVUZDbXhzUjFZ?=
 =?utf-8?B?dTNCZTFwOE1JQzEyWDlxclNsQ08wYWFQNU9qVHJNY1RQeHNndlFCL3hFNUp5?=
 =?utf-8?B?cHJhaXVaaHhMTE0wSmIzTU1PeVhYRzBZd0h2M1d0YzhGV25CbUEvcm9GakhV?=
 =?utf-8?B?ejEwZmtwbGNYVEhSVldTeTNlOURKYmd6Ym85VTVockVEZ0pxUWhPVm9qNlFN?=
 =?utf-8?B?RmZTU293c2w5V2FyY0ZMOVJ4cmQ1K2xPVGhKTTd2Q25uU3l0ZDU0SWc0SjAz?=
 =?utf-8?B?Z0JObkZlQ2JPVVF0NEl6VzMyazZWanlmWE9kcEFvTlhGamNodDdIeWI1RUpI?=
 =?utf-8?B?Sm9nTjRlQmFlOUtweDJBSUdBczZRcXIxOTgrcGNXNjFwQUh5dXI5TENoeVh3?=
 =?utf-8?B?bVlZZmIrakxhQ3JGa3NkVHBRbUQ5cmg0bGdkMVd3MEUwcWFQcURsdFhZdS9C?=
 =?utf-8?B?cDJSQVAwVWNseFl0cktuM1VVbHpHVE04azNpQ0F4dnA1N0MwazQwOEx0Wmt6?=
 =?utf-8?Q?kT5U9BAxOe4OjdFAez7tgj8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnhITGwrOENUWjhuWUpNMGwzSU1tRXMrMW1UMDBQd1RJY0pHK0pJYkVSVDFn?=
 =?utf-8?B?WlBqczBGSHE5TFpmYVN5cE94cGNRZG9tNlZyQ2M3MHNvaXRqZ1pPS3dTWWRQ?=
 =?utf-8?B?TkFKSlFLKytFNzVTZDYvWTFuWWtJYjBUWWU4Z0FwR1lVR2VrcGsxSGxiM29S?=
 =?utf-8?B?dngxRXRNVDN3Z0o1R2V5ZmRaaFV0ZmtKWnRhaUVVL2N3cnYyb09ZeGhRWDBa?=
 =?utf-8?B?NXo2bmlYMThwZWlOelhKOC96YUJFTWJmS09vb1Y0RWsyQTA0S0E3QlhlQzJS?=
 =?utf-8?B?Y25iaXp0cHpnOWN3bGVWM2dYZk1XZjkvTWhsUk1rK2N4b0V4c25KQ1Y1ZmFq?=
 =?utf-8?B?UnhOMkJOTEgrdGhUV01CWHd4dXFZMkx4OS9DSzZxTUhrTkZ1MmpSclBEK2JR?=
 =?utf-8?B?Q093Ukk1eUxORzNVMTZyTDVtZUxCK0w4SENyeEdLSEVxcHVMZS9xL3BLR016?=
 =?utf-8?B?Z3RDMDRNTWRRczFud1lYYVo5OGNJREF3RzZXUWhLZHJtekp1eTJkdUh2blBu?=
 =?utf-8?B?QzFiOHdsa1B6dzFRNzJrNnVqZEg0eVpTOEsvMXVVK3VmRkZWTlk2Ky9BV21Y?=
 =?utf-8?B?cDdXeHFiTE94MWZjay8vV3JxSWJ1MmFpcFR6NVErNnkvKytiSkdwT0FYWHZw?=
 =?utf-8?B?SE1tNlpLNUZlRUhzTnNBc3FiVDgvWWZsOE1mM2t0OHdKTXhrKzRqNkNhZ3du?=
 =?utf-8?B?QWxkK1h2LzdTangvbVVGZ3c0UDJpaFhSUS9xVnFYSW9lNkF4d2pxY0Noc3FY?=
 =?utf-8?B?aEhaWnFVVHFCeXVLQUpTUjY0Vmo3bGhkUGM5L0h4QlRwamR3M3kzZ1Bjd0VO?=
 =?utf-8?B?N1lrbStyc0tRYmlzU1ZaSXZ3V1hzZnlleFVWek9XdTBnL1I3VE82M1Z2ZWNH?=
 =?utf-8?B?Yzl2UU1md0tPUXlzY2RaSVVKcDZCTWx3WW9zWVpzLzc0QmJ2eWVub29Ea2lP?=
 =?utf-8?B?Z1ZUd2ljTVl2RlcxZitMeEt6aXNkdk5BYXJLbFY5dnF2ZExPWlY3ajZ5Sjds?=
 =?utf-8?B?NC9zWWhPcG5TYUxxOVZXVzFSeGxaN2JsWkE2SFlESzZyMEVxcG1uRjdCUDZI?=
 =?utf-8?B?UmhwQnJkdHc3TEVzYkJLc2d4UUNMRUQzdDhsN1l3azV4VzEyR2ovOHQ0TXFL?=
 =?utf-8?B?ZjlvNndmYzg1Z0dzK3JWK0JPZkw0RzNBVlExRkVUTnVDeWFQV1M4d2EwMTZx?=
 =?utf-8?B?aGhWTGRKMDU0SmVxUVh0ZDd1dTMzK25YV3BsQnYydzBQN2FONlRtT0U2cWZs?=
 =?utf-8?B?Q0llYjJBWUFCYkxta3FoQzhyeWR1V0RMemJIREtrcml2ZDV5a1dXU2N4Zi9F?=
 =?utf-8?B?NTVNWGFlYzh2YVVXV1AvM0MyNWR5YWM1cjRxUXZWN0IyZ0I0TzRCN2puQ2ZM?=
 =?utf-8?B?ZE16ck5nSWtkcFFMQ2lSUzRMb0dnMkIydHNzU0E4bzlBVUxRaUFheGF1SFhX?=
 =?utf-8?B?cWZydVRIZkR1ZG5wcjh0Skx5TEUzWUk5d2Y3ZEFKVlhJV2lMNnpoSXlCZjNq?=
 =?utf-8?B?R3pPOE8wVVRrbjhaOXR6N21jZFhhbkNtSEQ3dEtHaUtVYjZ2SFU2QVExWlRt?=
 =?utf-8?B?QjJEdFJoSS9YRUZmdTRuUEpMS0RMUHN5U1RCdVVoR3AzSkZWem5VVjlBYmxj?=
 =?utf-8?B?U1BDSmJKMlhTRm5KS2Z3bG1SRGlYb0FudHgxTmlkVEY0TXI5S3JWeUxtU1Fr?=
 =?utf-8?B?T0taYm95TnVNdUorYWRjcUVEZXFMYU80NGlVYnRUMlJSejhEalJVWmRTZWg1?=
 =?utf-8?B?d2lleHNBTVJQSldoWjJDc1JMKzRheWxZVklBVnoycXI2UlBKODN6TGxqWkY1?=
 =?utf-8?B?MVl1Qm52QkFGdnRUdUo2U2dSRUQ1bjRVVDJoUG5yUEdUM0ljclVnYTZ6OHp0?=
 =?utf-8?B?cXVhUXVhQTQycXl6NERJSTczQmx1RFB4VDMzRVhEdS9seW1nb0p4ZE9KREM3?=
 =?utf-8?B?bUEvOGVsZkNSbGNvQTZKRk5seEJjZkZ3bGswemZ3RWRleFhBQW1ZeDZSZDFK?=
 =?utf-8?B?b3RPeUEvTnNCdkl6eWRYL01NeWhaK3liRGl2WVBQVTdqNEhtSDY1ZHkzamdk?=
 =?utf-8?B?MWFpNUxlTFZJdlQ5UmxxSGUwT2t5MHFudDEwTlRiZHhQcVVXMjZ1Uk91dGZ4?=
 =?utf-8?B?a2RVZ0dxcFpRM3Z3S1JkdVhCM0ZIeDVtc3B6ejBWbXl5dGM4R09nSzVCcWN0?=
 =?utf-8?B?WDQwL0FtTmhFc3UwVVBPLzJoaC83WnhPYlU0MmdEblZqVTdYN1BIUTRUeWRF?=
 =?utf-8?B?ZkE4NnZWSlUwMC9leFVuMjNlczhLcDVRaW5kRWJYM3BNTHQvN0U0UUtnVHN6?=
 =?utf-8?B?UXBFNks4a3ZvbmtvU1RyL1NQNW1XM2tsOVA4VEZHN3dEYjdlayt2d1dURmpQ?=
 =?utf-8?Q?Tnd5pWSF9gYwXYa4=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59473b4-8330-46b5-1a9f-08de57405c9a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:47.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o6WwEqm4IAl5Is8tcJCvrQYfd7y28Rqc3hSCNSgDzWfEtd9UgVpSE0hmSaIgpD9ZMq95FkfkoROuK9rtS+VEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8902

Add improvements for read and set offset functions.
The basic functionality is still the same, but offset correction values
are now updated to match with expected.

The RTC calibration value operates with full ticks,
and fractional ticks which are a 1/16 of a full tick.
The 16 lowest bits in the calibration registers are for the full ticks
and value matches the external oscillator in Hz. Through that,
the maximum and minimum offset values can be calculated dynamically,
as they depend on the input frequency used.

For docs on the calibration register, see
https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/CALIB_READ-RTC-Register

Due to rounding errors (different number of fract ticks),
offset readback will differ slightly depending on
if the offset is negative or positive. This is however well below the granularity
provided by the hardware.

For example
$ echo 34335 > offset 
$ cat offset 
34335
$ echo -34335 > offset 
$ cat offset 
-34326

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
Changes in v3:
- Add commit for limiting building of driver to zynqmp arch.
- Reorder variable declarations in set_offset
- Link to v2: https://lore.kernel.org/r/20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com

Changes in v2:
- Add commit introducing check for calibration value overflow
- Update comments
- Align data types across set and read
- Rename fract_tick as fract_data conforming to data sheet
- Further improve on set offset calculation logic
- Link to v1: https://lore.kernel.org/r/20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com

---
Tomas Melin (6):
      rtc: zynqmp: declare dependency on arch
      rtc: zynqmp: correct frequency value
      rtc: zynqmp: check calibration max value
      rtc: zynqmp: rework read_offset
      rtc: zynqmp: rework set_offset
      rtc: zynqmp: use dynamic max and min offset ranges

 drivers/rtc/Kconfig      |  2 +-
 drivers/rtc/rtc-zynqmp.c | 74 ++++++++++++++++++++++++++----------------------
 2 files changed, 41 insertions(+), 35 deletions(-)
---
base-commit: cd635e33b0113287c94021be53d2a7c61a1614e9
change-id: 20251201-zynqmp-rtc-updates-d260364cc01b

Best regards,
-- 
Tomas Melin <tomas.melin@vaisala.com>


