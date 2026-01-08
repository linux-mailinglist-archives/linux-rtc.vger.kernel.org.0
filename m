Return-Path: <linux-rtc+bounces-5693-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB34D031E2
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 14:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DFFA3000B55
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727763D2FF9;
	Thu,  8 Jan 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="qjJQl6BE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020127.outbound.protection.outlook.com [52.101.69.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0DA466B67;
	Thu,  8 Jan 2026 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876695; cv=fail; b=QW+lgV4L0NYoMWtrB0kONSVAbEwAayi1WjOR09igwwmySC3jbzLFfU0EtLQFurbg6O1LTmGwVwfOv7TXyIAkufl2x261iV8fsg833E3358SMBPa8II7hoiG9i3JCHEebhvD/MEZusnfUEGl8gSkqOVocYK8FsIIeDKhdEZ8rl98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876695; c=relaxed/simple;
	bh=Lkil1IGnL/Fu+Z38h01S0fXWeafbFE0NDa2Wh1Cdmco=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=OEHx0R0eFqNmH9XeFTj3zmCTnhN54gWPJ56Zrvq2y1WlkScGufrqzXLUKkCwTCfbhHUIwmNmjKHxSrGyBlRY37kPBisjCInDWnVtyGIlyCpIulea6AiV37ssskUKtmMl12Tn6+IpUlOKTI6E8UDY840NMNm07tm6jR6Gj8oR6qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=qjJQl6BE; arc=fail smtp.client-ip=52.101.69.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hks6Ott69uDJHpGOfxjaKsB/9oGwlHpFvlaemmgFf5qNeIqj0zOK/5OFO+UgB+4rHrXuUs3eCliLKAmwCiY5CKCuZ5gWtMBzHhAph/A+GBD+Ox9kKKCLJZ7HfMt3vjkFIAjSuylrgWdtkfl18oKpdxXjqa1x0G3Gwlfwys3VuRZfURv3pevv/PBbwwlwL0VD/reTnaEb/ZYj3SHuWmGurZw71GV76+3MVIFTfJFI/f9clgr0/n/bVKrgefQSQNu6rG8bGSQyqORrgnYooLfXgr/2v33LTv5lKVYm01y+i3j+EwWOtUak4hf77XRIrLf3ZG24To2NOChtJa2JB53s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BurE/6U5n4D4dN3QWQ1o0dtJJy+I2xjAtQjdPVVobNM=;
 b=M59p9MG/5+rxUEVKXi4H+czylAseccMiw9ECwki1izzhaLiAZLcqHvy2lcT3jn+c5glMMN681eKDhQIktAIUZXFec7biRf4jXwJx8Y5MdBOE5s0KKa7b92lh2kDIfKmPFD/BV/7fHMZKenwL2wjuTiDbWbhy1Cf515XUiNFcyfkJgwxUb+tEVc6SxCHd31R9lOjod4WJQ/975We2SNONxVKjg9pz973M8cupzGI2zZ8TqZI6XGlvg6rsn6QZiHkvzOUYwP8zokMSxxni7FRxHF60NfP4yy+UapdrPSh7S0udQn4Xr/3Rsjo3OjNKb66H76r1HYhutUAfON+eUCfLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BurE/6U5n4D4dN3QWQ1o0dtJJy+I2xjAtQjdPVVobNM=;
 b=qjJQl6BEY1SAeoNt5n6rjJcKDpSNA0dEg0iToYieGzmhDnI4fM9t8nt4sZg2IA+G7dTM8qmciuRccgK7U+b2WDCEiZEQVeJDlgs3ETnKj9K6hK2YrRZxpQYArK1DDjgdSXQwxYfBaiciV8DbMBexZtQD1Ibqczm/I4fIINM+/DVYNZ0SY7X2Yp3mDOvJfGGk9qhNWsQu9cts0sBudpmnTuLP9Y99a6X8AYtnW1nSIYEFeeD6MtRy9AIidWQtsKfvYA26+TxmthuDDxMShkQsYGShENt3xfIDi2LvSCsvJ1MtjJLs5Z+uLu4Sw19EFc9Z+OTOv+qWpDqb88lLuQW1rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GV4PR06MB10527.eurprd06.prod.outlook.com (2603:10a6:150:2e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:26 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:26 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH v2 0/5] rtc: zynqmp: fixes for read and set offset
Date: Thu, 08 Jan 2026 12:51:11 +0000
Message-Id: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+oX2kC/32Nyw6CMBBFf4XM2jF9CBJX/odhUdpRJpFXi41I+
 u9WPsDlOck9d4NAninApdjAU+TA45BBHQqwnRkehOwygxKqlEpI/KzD3E/oF4uvyZmFAjpVCV2
 drBWyhTycPN35vUdvTeaOwzL6df+I8mf/5qJEgVrX59JK0nXZXqPhYJ7maMcempTSF8YqMNC2A
 AAA
X-Change-ID: 20251201-zynqmp-rtc-updates-d260364cc01b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=1891;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=Lkil1IGnL/Fu+Z38h01S0fXWeafbFE0NDa2Wh1Cdmco=;
 b=a7mvPhx/elvOFO8MFySnzHG6w6Q7IEfcUerDAuhTq0dICkWaUSBWy2GU7rYS8BCuantOAlW1Q
 TDnhWe7fdg7Bvb0pus0qg90LM68W8BDhKQXO8h1zN6Z7Kow8+DGTWMZ
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GV4PR06MB10527:EE_
X-MS-Office365-Filtering-Correlation-Id: e752618b-5a10-4e54-f19d-08de4eb4a2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWdQU0M2SGs3Ty9kbERvbm1ubmhsMEVFSjlyQm1mcm03T0hubHNaR0dUeDUr?=
 =?utf-8?B?N2tpRk56VExpTWZaWTZaY1NCb2czaDJ0QS9heFQ5ODRWQkxGWG9ZbktTOGRW?=
 =?utf-8?B?U0pHUkVIaWpiRjY1bC8wemIwdWkzSG14VzZTMGQ3US9rVHZFLytYWjZrUlRm?=
 =?utf-8?B?RXJPbTdtSGw4NnZmOVRZRm5HNk9GNlVZQWVNTmI5Mkp1bkw1M0xicWRROHZ3?=
 =?utf-8?B?eVZJKzlWSTBsLzJnMFBmWm94M1ppcldvMkJ1SG1mbTFOQ3d4cHFoRzBLSThP?=
 =?utf-8?B?TG1UeU9pTko0TW5GTDNHb214dmdtYlFCRCtXZlc1ajQ0VC9LZGhXTzYwMStk?=
 =?utf-8?B?YWtqend5eDJSWVRNODlENGxUdit0UitCTzhHaHcweDlaQnlxajFxd242dVdr?=
 =?utf-8?B?enE0OXRwMTBtNlNVdEJkTUY5cmJVSWx2cDRRU2R4ZFlvU0lkQlVEOGh1Mm1v?=
 =?utf-8?B?Y211VC8zalZ3TDJpcnZ2UUJFRStoeWl2ZEcvQm5TZDlOaU8rR0ZqUjdyeEFC?=
 =?utf-8?B?cWl4RFYxL2tKQklsQlVZbG1tRkg0NzRQa21SNHEzRHE1dENtTWVVQVlldXUr?=
 =?utf-8?B?MjJ5Q0hJSGVwV1l1WGI2OXU0Nk5BeU92dzNSN09jb2cwclVhZ1VjUnFoajNF?=
 =?utf-8?B?cmNsUEplKzIvbnFwSmpHbndyYnd3U3R1RFVBZXNyelRYSGYzbllBWHJ4Qktk?=
 =?utf-8?B?QkhaZ1pJZXErRUZQeHZSQzh0UTNEL25Dek1Mb0toZ3N4VUQ1cWl4d2FhdjA3?=
 =?utf-8?B?V0NZN0JIZUNnS1pBK2REVE9JKzJxem1KYmdsZXU1NzlwbUpFS21UeTN4Z01w?=
 =?utf-8?B?MEliTlFZUUZOQVI4TGI3R1ZMWHlzYXN1VEdRd1lrelFEZ0pzVGdkN3AzN2RT?=
 =?utf-8?B?R042OVJZRzJBSkNOUk5SMGFEQmJZNC9nN2s5TUVHYUVSTW1YQ2g5RUdGK1Bq?=
 =?utf-8?B?WjlIU0c1VmFFTUc1ZUpLNXVwOUxIZmd0bW1wWW1rV3B5K3puQW9WZitBWkNz?=
 =?utf-8?B?bzlnLzV3YTdpVzZyczRSTlgvZ0V1eTgwbG9RNGNDcTlIZDdQV1EzcUgxVVps?=
 =?utf-8?B?L1dwWTB5MDE1MTQ0dnBNSkxuUjE3UkwwZUVjOVFhQmRGSDZOTmpkT3B2d2tN?=
 =?utf-8?B?ZTdaTm1LMnp4WC9KSGhtZmg2dStybFFad3Q5bk9iUWZsb3lpcE5zNWZFUW5o?=
 =?utf-8?B?QUdTZ3VGSUJzRWxONy80UmFianNkTVlOb0U3bEZIaTRyckYxdGxhZFhZOVZU?=
 =?utf-8?B?ODF2N3JkeXlPS2hyenBiSFNCc3BMYUJ1NWFmRHJFMWRrODZCbE9EeHhKYTRU?=
 =?utf-8?B?bDhzMlJTY1U4UzJ2V0NESDlLbVJiTk5Bb1JtalBjQlhWd2hHQVg2U29mNzFs?=
 =?utf-8?B?SWRWZzE5K1BJTVhaTEtSbGc3aU05VDdWZ3NLYjRPMzE4TVBnYnpBQlZuWXJ0?=
 =?utf-8?B?MnJtbEtsWmRLMTNod1N1SzBPK0tIaUc1RTd5VlNqOHNNL1ozUVk5dUpscEF0?=
 =?utf-8?B?NkZqbnhYbllIMDNzRzRZaG5HYjZ2SHA2TjZ4eFVzZko2M1krcFl4Wm9ydGpi?=
 =?utf-8?B?S2I4bVc0Tzh5clBVaktzSGtiUHY4bkVKK2VkeWNHOCs0UWJydXNUbHBjbjZ1?=
 =?utf-8?B?N0g1cEYxZjZ4c0t2cDhjdWMwNWhqQTVCdEZ2L3FSN2VZU0E1Z0F1cWZybERV?=
 =?utf-8?B?UE1BajJMRW4zQWVjVFNmdzZvWC9MMTlqbDN1YjZkQ1ZmRXVRbDRhcnAvajQ4?=
 =?utf-8?B?WWdQeWNPeXZzUldmZ1BsaEFDbkFtOWc4c3BWVDc4WGFlcEVyUjQwU3lOVXdC?=
 =?utf-8?B?MGtNSjBPYlFjby9DZzV5U2dDZ1Z2ZWd1ZTQrMm1hbFlYS295ZzQrVldvdmli?=
 =?utf-8?B?WnJvWVRkNWJMZk9CMFh2UDN6NEkwd2ZDQ1hzRmY2Nk9DSGc3V0FQRkZoQVJq?=
 =?utf-8?B?VUNmS2t2R2VHbkJtK2dsK2Nra1JWSVRyaWs3SGxCMWw0bFhaeWpMZ0RVTFU2?=
 =?utf-8?B?VFdqYURqSXcvOTI5MzR3d0xaQVRYeVR2MElnWkVheXAzbk5XZzFmU1B6a0xh?=
 =?utf-8?Q?GGPFGX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEh1N0xZNTlaVkRTd29TN0VOTDRQU2E0OUIvR21IdXdZYjdQY2ZMcnVBdlZB?=
 =?utf-8?B?YWJmL1lPRC83U3hxT21QUDR3cTZlZHJWRmEydkQ5NmJjWndpQnZ6WE5BQUNa?=
 =?utf-8?B?VGFURXdRZVAxNTBEQkZwbG40OTVqaDRCdVQyOGJtWnZxSFBZOUtqaEIyQUIr?=
 =?utf-8?B?OEdiT1FkWi85dmdwL0VZRmh3aHlCTUViRFoxTHFlVWw1RFBET2dUTWJ2V3dq?=
 =?utf-8?B?UW1mRkF0KzFuc3ZWWVp4ZzhicGhZcTlSNEYrMEVTWlZ1RVZDS0lxcEw2ZGVQ?=
 =?utf-8?B?eS8xOTFoZnYxbXE5WXJrTUJ5clpack00TFNUaXc2TThmYkZmM2hjOWpuZXRS?=
 =?utf-8?B?VWZvSkVROUNEN1N1aW5ZNlNqOXJYY2VrWGl3Q1FOTWVGRHRlcjBRY004cEtq?=
 =?utf-8?B?UndwYkh5SCtWZGZmQmgrSkIwNGFmcG9tcGZWbEJwSUpsZVg4cmxOOVR6Rlhl?=
 =?utf-8?B?WENWTFlvR1g0d1U2VFdvV2l6bkVFZXpQQnc1UGN0eE9WMzl0ZldTOUR5WTZK?=
 =?utf-8?B?dm5iNTVjbHdoNGxOMmw1YlJzTG03QTZoeUpwaW55Mkc3M1FuQkJxU0RHaUM4?=
 =?utf-8?B?eVlxYVRtbmx6SW5ETEsrTlBlNnhGZ0ZMeThSckJSN0NrN28zQURFaVdhLzJF?=
 =?utf-8?B?RFVieHQvNUplRjZBMHRHQWZ4UkFtSm8vOWpDcGxndlZ5TUlSSVl3SG1lWlFs?=
 =?utf-8?B?OWt6QUV6NjJncit4azQra2hIYVFmYzZiM0MrMFZWRzRwUUc3QnJVZGN6anNl?=
 =?utf-8?B?M2NnWC9XdGMxSGc2ZVZFVkVwSUQzdmRHVWZvTHdsZFdSYkYwakdtbm96UHJx?=
 =?utf-8?B?ZnJWSnBSOFpGK2pFeThwTGYrUnRaM21MRUxGZ21kZG5qa1JSM29FSHhIc2pU?=
 =?utf-8?B?ajlNU0tHZzRmNnRzc01yL1RucERYcDQxMitTOVpOcit4RWhRa2dCSGdKaDcr?=
 =?utf-8?B?VnJQMVRDNS80dXJYS3FXT1JXM1g1TDRMOWorREthdWUyMXVrTkx6UHc1eENy?=
 =?utf-8?B?QVBOTjNYL2p2bVZnakJ3eGF2TlhrdElPaUlXV0ZtRVRzaGM5OTlrTStmOWZh?=
 =?utf-8?B?SFgwcW1OQUN1cVVocTZDM0QzNDdhc3ZCTEVjbHZIdDU0d0VhRVVIRFU2UlM1?=
 =?utf-8?B?TERwRFk1eHFCaTVucit0YUtEMlpBaUN4S08rY1JkU1R3Zm8zY0h0dEZTMDl3?=
 =?utf-8?B?WTl0elEvRnV2L0dtL1JJUGxkVzIwOUwzUGdXNkZBaHRrZ3JwWVl4WTgzU3dv?=
 =?utf-8?B?bDRFSW1ZdHZnMU9uTzFtS0dDbEI2ek1Wa3l0VlJYTDc1Y0R0K3cySmVoUmln?=
 =?utf-8?B?cVUyQ2ZHejRYYmR0QStHdFBvQThwb2VSakljSFhVaWFTcnRhOFJDQVBGMGNK?=
 =?utf-8?B?WDBGT1pLdW5aRFpFQWMyUy9sNDQ1R2FHS3JST0w5MTZPVUVyWDRROFpSNjlR?=
 =?utf-8?B?emY1Wi9oZzBKR2xlVUVpVkdYSTZzM0FtbEZ1aUFVZG1zV1RPcytjWEdwQ0FE?=
 =?utf-8?B?Y3dMTk9ETW5IYXVIUnpCVlM2Rmd3aVRaNThZUUgvTDVYdW8zODYwN1IxRHdC?=
 =?utf-8?B?ZlZlbnRjczlCYi9KTkc4UVRLZ0VYYU81ZDl1b0luQVY4QzZwekpJdnBZRGdl?=
 =?utf-8?B?dzQzbFBHSkE1QmRxdWJQblhuYTdGT00xNFZ1K1NkbFNCc2JWMnF4UzMyTTla?=
 =?utf-8?B?dGYyS0Y5Q01maGhPc3RvaTVKQThDTTkyMWphTzZzT3RRYXlHQ3cwbDgvWmts?=
 =?utf-8?B?R3cyeVNpeHZ3ckt1RVpkRmFKVkUvbmlScUxtVUtTOGZnUkZSa3BZaVBJYmFP?=
 =?utf-8?B?UUFFQTRmUU1uQ0ozVEVnd25GaEFMa1A3cWFtY1prRVJ0dFZEb2kyNnNqTjhJ?=
 =?utf-8?B?NGFlVG5Zd0xlNlRPWW11V1EvTFB5Nk53WExrdU9KcThLQ1VwMnpOMXRjZXNT?=
 =?utf-8?B?blNGcHVCRDd1YWRjZURFQnJyL3RDVjBXUWc1bE9NR2ovQzBWVWZYZEg1NlRM?=
 =?utf-8?B?akRxV0Fyd0lVVm13Ym9PVWUrN2hLSlpwTFhqU0YzNWU0WXF5QTNxWVFuMzBt?=
 =?utf-8?B?YW4yazNDVjJxRVlTcTlvZDN4L1RsWlJKek83Z2M0L2tRYWFFQklPTmVLSTE3?=
 =?utf-8?B?RUsyTS9lNTFEcmh6M3RzZHBBZTdBUVlVZ3hXYk45WTZaSkN2amoxdGU0aFNE?=
 =?utf-8?B?WSt5bXFtQzl2U0U3bVZ6UDUyalpNRDYvRmltK3dJeTdHMFF2NWova0tZSXVC?=
 =?utf-8?B?NXloeEhIendkZGhrOTBUZjJ0YzZMSEhDVWZNdXJSMllRVjVvWVdBY0FsQk1p?=
 =?utf-8?B?ZytCWFUrTkNGOGFkb3U0TWkzM3RqR0UyTk9LcXBXaVY3cG4ycE5CcGxzWXNB?=
 =?utf-8?Q?3/7jWU95y4ngDfrA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e752618b-5a10-4e54-f19d-08de4eb4a2cd
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:26.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoAB670hpy+0ibROksiQf1s/T4ts2dz7qt1QEHmwEjx20uNtyrJWLaWpfaW8R9lbGTz4h12eKofQf33a+coeSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10527

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
if the offset is negative or positive.

For example
$ echo 34335 > offset 
$ cat offset 
34335
$ echo -34335 > offset 
$ cat offset 
-34326

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
Changes in v2:
- Add commit introducing check for calibration value overflow
- Update comments
- Align data types across set and read
- Rename fract_tick as fract_data conforming to data sheet
- Further improve on set offset calculation logic
- Link to v1: https://lore.kernel.org/r/20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com

---
Tomas Melin (5):
      rtc: zynqmp: correct frequency value
      rtc: zynqmp: check calibration max value
      rtc: zynqmp: rework read_offset
      rtc: zynqmp: rework set_offset
      rtc: zynqmp: use dynamic max and min offset ranges

 drivers/rtc/rtc-zynqmp.c | 74 ++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 34 deletions(-)
---
base-commit: cd635e33b0113287c94021be53d2a7c61a1614e9
change-id: 20251201-zynqmp-rtc-updates-d260364cc01b

Best regards,
-- 
Tomas Melin <tomas.melin@vaisala.com>


