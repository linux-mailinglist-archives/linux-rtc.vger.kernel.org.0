Return-Path: <linux-rtc+bounces-5842-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN3dG748cmnpfAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5842-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:05:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D068560
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A13DF7A6115
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96482347BC7;
	Thu, 22 Jan 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="GyE4o1/C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3964346782;
	Thu, 22 Jan 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090055; cv=fail; b=tDqTiDsJX9a2+yC3Klm/dTAWb/ALzuKsI0TFSUhkxLL5vsnWWFFPymOSc6bpWy90SRzYDX6n/NjV5EbZ23P48HFDKI+zT95MuR1QcWdcdr2QupC07KQviFWCZ88r6bO7omp7skbxmCaww/EemXONtVvv5ms7dHO8klUNaCegCPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090055; c=relaxed/simple;
	bh=EWUULaYssjTw461odd6U7W0gAvH5hXyV/WaqZIx+qg4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rNbjy23FmZpvnOvhuPHrNlgruoHmsP/RR/3fd6zk6hlDqF5YknIKywsHVRJikxSUnYauga/kDmlrHBmGdZN1RzVut2phhwqy42QhE7EhdKZXFHs3kZEZhGwlv9WD03atVGL8hLyn7I+AznN6U4Lweruc1Vy43xL7RSPaRHpeQTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=GyE4o1/C; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwxD7YVVtvXfLPjeP5K+UpSx7wE1WfTPTEKsQosMucWabadlkfTYM+/GZ/2NOhfR3zqY/hRhso71zuPGKdX1fyafTQlmCyk8lxaMR172eyOteghazrCdX+uCqHQlbqEOOXjMlYSF2BzMwxZXcYxCg2eGmpUMBBaEU1JmTiEJhmShqX5Zj2HfmrwWFDGaA0C53en9JWtdZbKvN1z7MsvNREakX4KyaO1Ra+SXS3zREZh2HQPBW3AEmuffpKxeb3SLs/sgsgGRAjxECe9Dwc1RhPVm27hNz4Zu4F1VWypTf6k0Pa3t9Q5FXcWDEGMDxsDSQLZlKcRloNcC+as7LZRlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzBB9SvOAYAypyJs+QlEAyL5jr7f2qSGj4smQYhVePc=;
 b=f0DVte7RAxOuUW3hphd+czcaMr62FWlT+1XQGnANzhIt6JPcd5pFAfgp5arKFe0Wq41hJU2llWFpu5HVhZqOzlWHV2FH8dFgo0f4wAR3fh1OQj0csrClzxdR95K4e+1qxnwCJRw4TAq/v75Xw/e8E31+AUIVng7RowTSqQG4BmCrRyFImDyW/CeHneqDHbzqoRxnyAQ48Y1mxz4tzRmneAlWLMgWIXLoPm/oghijLqlOOM1KeF225oJZ3TT794eP490Jr+IqzZjo7BfKBIS6986C+85sgIw8aUpxeGc4z4HjjxcpIQCAX/B1/2C64HB5zc1vMmTlIObGkpdC1Vl0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzBB9SvOAYAypyJs+QlEAyL5jr7f2qSGj4smQYhVePc=;
 b=GyE4o1/CshhK9zy8h6fuvFxsraQLKF/qwsiGC2QHmOv019mSZl9y9ERqaudF2TQc5jWgkpEgyuBb/Sd5v6A0pH1xNCc0q3HJcJQpaa6W3Qoznc7PaVwTREM5HfPgPolWWtRnIxzIVej4kyJ4AseT3DJyYTFCLkjbIKtaTFSPFF4v43ezGzmaz2D4qjeB3IiCfLZ7ARhTfiqPf/6/2ZAxzw9QlPoCBNmS/U7it4RyPIdZvVP+lz0agdzI3NnIlwYsarHXun75uyut+baWvIJLRZz2TDyemkSi/guJ8WFAG2iO7KVcHdwuOzSHlq01nNTHIEeiEeuWj+XcVzDis8IYZw==
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
 13:53:54 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 22 Jan 2026 13:53:47 +0000
Subject: [PATCH v4 3/5] rtc: zynqmp: rework read_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-zynqmp-rtc-updates-v4-3-d4edb966b499@vaisala.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090032; l=2457;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=EWUULaYssjTw461odd6U7W0gAvH5hXyV/WaqZIx+qg4=;
 b=uKbnLKB4mM/buSctbekEJSlt65t/t/Rn+utznZnhhwwuSKWXV1AqNHsf00z+FFFVBIuiJFRnY
 ma2XBdjCd9dC6XeURp1sFMO/F7KB1yCf/JrAz+vBiY+IPG42OHnOAFD
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
X-MS-Office365-Filtering-Correlation-Id: c26c0dc1-20b9-4e0f-dbee-08de59bdae31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1djeUZ4N3gvdEMxdlNoOEkzb1FkRFU3ZWs1Tm9XdjVrbzV1dGtaMFU3aVZx?=
 =?utf-8?B?RHVvTUg5VjZWSHkzMXFsbllSQzBWSXpscjZMODc0cFJzTndrZXVDYy9ZREtS?=
 =?utf-8?B?Y0QveWcvV2NKVklTQzU4MEZ4eHpqdU01dXhxZjBDVkx5NVd3eHJwdklkN2M3?=
 =?utf-8?B?SFdGdStUN2RJUEE2SEZaWGpYbWgvQTRYMm5taHBwb2xDaGE4bk1rdSsvYklW?=
 =?utf-8?B?YzhjbGNsK0V1ZlQ2UW9CVllLUmtud0crM1htZmNNWStuSkhtRFdpaFlUUXZz?=
 =?utf-8?B?RTBvc0lpem83dnd1TzBRcng1YTNRTEVDRUlCcC8zdlI4NW9Bd3pCV2R5MU1q?=
 =?utf-8?B?c0FlTGtqQnZvTFE5clZObmdhRTJWcnh5aWJsZ3VXRGlvVVBlMkY5TFY1K3po?=
 =?utf-8?B?K1c1Y0crbVpna1JjWTRlSS90emZrdVh0UEhSc1BQbk54K0UzdFRzaUx5dTRB?=
 =?utf-8?B?cFNYVWs1UUJrRWVJV2Nra01DV1oyYVo1bG1UVDN2QjJ2aUNGNGVMRVZ6ckd3?=
 =?utf-8?B?aVM1V1pMYjNLUHUrQzgyeTRKSjZxVm11WW5zeUM5bTIrUTNDWTlBWVU2MXVY?=
 =?utf-8?B?NS80SmtmMHg4T3NEblRNc2ZBTWdvVE5WOCtmMFhvR1dibUpGcWZOR2taSER4?=
 =?utf-8?B?SlpVakliRHl0aS9qdk9LUnBKbmQzdnE4QkxRd0VMZExJeUtkZGZGdmQwd1Bv?=
 =?utf-8?B?bGkxdmRzRHZkYmsyZThrT1MwTnBoUGNOMi95QlM1T1ltMXgxZ1pHTU8rR1Jn?=
 =?utf-8?B?aU1RcUpydFR5V3JBOEQrUGtOVkpUQVVieWdVZ0ZZSDN5bElOZ2Y5YWdpdWJD?=
 =?utf-8?B?bUlad2JMcU1vUThoeGUyYWhodUlhL0dybC9OZERrN1AzTUhoT2F5cEhyektO?=
 =?utf-8?B?WXBVNkI4QXFpWkNaajJoeTV6V1VLMEJETWRLdE9hSGtWZ2VQL3RiOE9iOTZW?=
 =?utf-8?B?ZDN6cEhoMVpuZ1RRc2VVUDd1SWJYVW5BcjBKbjhpOTRxQlZuOFNZN214ZWph?=
 =?utf-8?B?eTNGWml5TWpVRi9QM0ZGOHgzYllLaUtxazk5T2ZneFRYVnRPYkEyeXFmVWgz?=
 =?utf-8?B?VTlMWWpHY1dQRWdudkh0aG9PTTM1R2s1NVh4aVVQWDBGUGRnaWlqRUZ5VWZh?=
 =?utf-8?B?MS9KOHEyVFVldE52RE5hcjRFMDRjR3dicUpFczdxMmpvUk1aUEhnQ3hEd3lk?=
 =?utf-8?B?WGhFV3hHT2hlVHQ3aDNmajduR2JyUmdWblBrNnIrdnNYa3k0ejhVVUVwSHhG?=
 =?utf-8?B?S1UvY1ZQSk16bGVndi9ZOUxIczNoVEQrb2VFb1hCUFBWRklicDNJZG5KcDRM?=
 =?utf-8?B?WHVaWktUcXNkRnIrck83ZDFTYlp6by95Z2lTRzdHQnBESHNSSVhXYUtCVG5h?=
 =?utf-8?B?Nk5yY2RTZ3RiZUZNbVlpcjVOb2dnYVZBczJGVmxIbWVkR3VoTDdWNE9wdlRU?=
 =?utf-8?B?YjkyWHN3TXZQYXFEZGt1VkFFMFllWGxYQlIwUzZVNU9hcXRXQ3BuYWVNTlNs?=
 =?utf-8?B?N2IzdXR3RWVMdEFXVmtMV3pEMWlIL1BJZ05KRmdKaXlIakREOVNVUjhxeGZa?=
 =?utf-8?B?QS83TDRPSlA5Wk5aU3d1bmZ1Ym5lcDhuaFdqaFBtOCtiemFkVy9Zb2NtOFRx?=
 =?utf-8?B?eTVHeTEyMHgzWHBSOVFIWEZ6a2FiYmlJVklrZVdDZC9hSytKd1JqTGtUWmlT?=
 =?utf-8?B?UXdJc2RJSVlTSU1DMG96ZnZQYnZKS2ltd2V1YmZFdVBJaDlTSTMzUk50WTEz?=
 =?utf-8?B?L3d0Z3hDWUlKWnpySmRNTC9VV1lYWkFZOVdySHloU0hYVjdPTG5kTkU0aE90?=
 =?utf-8?B?NTF4V1l3Rm1yTlJENlVtMFpyVzkycVB3T29BblY1U0xQWUhBclhReEZnb3Jm?=
 =?utf-8?B?RVZtbkFpNForWEZKT3hFSDNac0ZDaFM1a2gyenZEbkxqaXd1RGVTd2JnWTVl?=
 =?utf-8?B?RGdIN3MwRkxrU3IyZVZEUjl6Y2dqR1UrdDFtWVB1VXg2aERkeEdGdXBuR2hY?=
 =?utf-8?B?K1FGZEVmaXZBbnViRFpTVGVWK3ErWENQcUhhWmE2aGpnVHVqL2Q1UU9mZVYx?=
 =?utf-8?B?Sy9VWG9PTEpuZWN3R0ZhK3U2V1pmNTQycEVyQVdWVFdyM0NhOERBOXl1TU1B?=
 =?utf-8?B?eEFCY25ibjErbEJKUGpyYjBlSWVUZnEzdDVNUWFWN3FLdlFvN2IvUlQ4T0ZL?=
 =?utf-8?Q?8nUHDn2mE4qYaUKfRUCUE2U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVoxMzZodHZPNm1hRmhtaitXQ1VNVEVHRGcvTjd6YTZGRElnRmpQb0hUazFZ?=
 =?utf-8?B?a3Q0RmZYLzRaQ090TGRrQTJXYjk2bTE4R3YrRy9IeFV4SU1pMTBXOUNJSitV?=
 =?utf-8?B?MW41QW5zb2QwRTJEMEFiUHMvcDN2VmYvR1BCWUZWWnFTTzBqbndYK1J1MTAw?=
 =?utf-8?B?bmpoSEwvVDhWT1FTUGpld1hkSzBSNW9LZGtzTXduYUtuUSs0eERqWWxWc1lj?=
 =?utf-8?B?c2h2VDRsUmNRNnpWRVA2N2RBTDBrczBFbWR6eVB0N3hTN2x4Z0ZqeDB6aTFh?=
 =?utf-8?B?cFQyOGdLcUdyM1U5Y2NmbWUxYVMxZXU2NU8zS2paVjNEVFNPc3gwenhISFln?=
 =?utf-8?B?YTFBOE9uMnoxWnJHeElmK0Zkenk5NzB6NjJuV2lENERGdzl6TzByNXhxTUJM?=
 =?utf-8?B?M2lpcjM1Y0RTa2dsWVBTTUdMOHk1c2prR2xuQWVhQ2JzRVBmWW8waTZRVStH?=
 =?utf-8?B?MG1ZNm5yM2xQMCtSK2w1Z1JDOFc3K1gycXh6NEtsOThiSHgxS1JpTnkyWEdK?=
 =?utf-8?B?UURGQStPaGpqUUdOcWNwMUNBUUI2azU1MGRyTzFLZ3I2ZDl3VlJHMWo4bEdE?=
 =?utf-8?B?TUt6cFord2VqWHU4MkovVGxCM2dKOXhLNndJOWxWL3U2b2JaWWZSOWFKRUtW?=
 =?utf-8?B?aXg1VGQ2YndwUDJDZEg3SWljN1BEMSt6aUpoMXg4WjlzSlZ1Sy9MUE9RZUQ3?=
 =?utf-8?B?QlJnV0pRUi83b3FqV2xOc25GY2dYditsMkdLd0xHc3Z0UFNwUFVCb3VWQ1o5?=
 =?utf-8?B?eFVkMjl6cWtzNkQ5eUxiTWM4VTk2RFg1N2dhMjBLYmZYc2R3d3U2ZWlJM1hH?=
 =?utf-8?B?WlgzWlNyWk81ZktqNkIvT1N6MVlOQWsrV1ZWT200bDA5cVBOUjZuMEwrS3Zm?=
 =?utf-8?B?SXlybGdNMDc0WjFuY1FNNG8zUDBOUXJONldEVlVFcHkxQzBFYXFKZkMzRjdL?=
 =?utf-8?B?MUlhb3h5U0t5RlZodE5yVEJheVdDSW9zeWZiYXQrZVI4NlV0TnlkZDl4MFNw?=
 =?utf-8?B?OE9yQXp6eWlNV0NwTHBSOFBBL3pDYlhkZ3hkc2N6NUtYUHkzelFBRTA4Qzk0?=
 =?utf-8?B?SEVPNjRQVDZLNGJnZnh3WXlVeXg4Y0VXTzRmT0pBdmNpM2xNenJjS1dHbExx?=
 =?utf-8?B?QjdFNG1WZnc3QzNqaVJqVUhURmNDZ0JmWU5lVmV3dXhRRzh2QlFBSVBaV0tD?=
 =?utf-8?B?cUwxOEFEbUhsUkx5TTgzVnBEbFdTSkg1Yi9nbHZrenNNRThPWHJ4a3ROSVJs?=
 =?utf-8?B?ZlhQMDNRQmE0S3FzallLNjhIWVZxUkdTQTJ1WmhJcXZFZWp4STQvZHlmcFcw?=
 =?utf-8?B?c0U0NUp5V2gvRjVyeWdvT3B5OFdVL3FaQ1pVanp2ZUcyNW5JSndxMzZMMVhY?=
 =?utf-8?B?NGlETkVwYVQ4aVRBVFY2eW4rODNISVRoUUJqWjVEdy90elhRbFk5SVRvT00y?=
 =?utf-8?B?NXNMa0xjNlVCQmQxMDJPdW95dTYvcHJWZmZvYW1hQTZCWVk3Um5qRU96dFRV?=
 =?utf-8?B?UUovV01SOCt2QnIyK0VWTlFDazMvZzB3MVJZOGdHZjJUUWozeEgrWmF1dUlI?=
 =?utf-8?B?S1hUcWd5dVV1WUdCZURsY0xCeHp4N1E4YStuM0JiOHMyS3BmVWVPbW1ER0k5?=
 =?utf-8?B?aGNwa1EwQVRtMTQyeEV3ZjhDZXZ6bzdXWFo4QnNHWTBiRzNYZ0gvTFJteTk2?=
 =?utf-8?B?RldySi8vcTBiT1czQkZ6WUpRejVpV0I0c01jMGk4cWYxSHRIOXN6N0h3U0N5?=
 =?utf-8?B?SDlrU1MrZ0h5WHQwaWx2MlU4aS80cnhMK1pid2dwdmVmTkRWT3REalJ5aUFS?=
 =?utf-8?B?N0M5dkkvcXZVcTg0NDVxQVk4Z0F4VHNhbXVCRm04ejhZS1dpYnJma1lualAv?=
 =?utf-8?B?QkRqRHMwTm4rSWxuVGZMbzJYK3h0cWk1UnNFYi9kV1Fpc2Z1VTh3VG5RYmt6?=
 =?utf-8?B?UXZYMmpWS3ZJZnJpZkZ6UzFoNnJreXJNMmZUU01SQmwzVWRMS2VjZkd1czUy?=
 =?utf-8?B?ZHdMT1llL1FvSUR6Q2NQTkgwZFE3TmY0OE51N3NtRXJLak1qTEs3N3lzbG5Q?=
 =?utf-8?B?a0RUWWR6Nko3WStlN2JFYTYvRkRxUG9SbXVhNnpJSnVZbGNHdzcrL0E1czlG?=
 =?utf-8?B?Y0tROUxrZEF0MTdqcXpOdndna2MrT0RLeGRySmlzT3ptUFRmdmtTZkdrUXh2?=
 =?utf-8?B?NVAzTU9hbEZDWXNaY2pHcHRYYTUvSG9Ed0dnQWtHU2ROSEtEeWhuejFNeVJE?=
 =?utf-8?B?cmRrTnhseWxLS0k4UzFSSWtpazJnN2M3NU5OUGhZUnNNd0NXa0daRmRiMEdF?=
 =?utf-8?B?SVBiZTFET05lZEJtNExSRDV2a1RkK3dYVmdrVmx5Y0ptUUhUUUJXdWZ1L3V2?=
 =?utf-8?Q?w1WD5VEut3OG34qk=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26c0dc1-20b9-4e0f-dbee-08de59bdae31
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:54.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScwgJayD3ttHgx2YIRnkFjr5wbBUpzualn3UX18eHii8fns8Z33y+8CWC0udkYKzhJCID3GifdEyQwiEru3edA==
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
	TAGGED_FROM(0.00)[bounces-5842-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 329D068560
X-Rspamd-Action: no action

read_offset() was using static frequency for determining
the tick offset. It was also using remainder from do_div()
operation as tick_mult value which caused the offset to be
incorrect.

At the same time, rework function to improve readability.
It is worth noting, that due to rounding errors, the offset
readback will differ slightly for positive and negative
calibration values.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index caacce3725e2ef3803ea42d40e77ceaeb7d7b914..c82f4d490fc7ebb5876b820182f5e79a99e496a8 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -43,7 +43,7 @@
 #define RTC_MSEC               1000
 #define RTC_FR_MASK		0xF0000
 #define RTC_FR_MAX_TICKS	16
-#define RTC_PPB			1000000000LL
+#define RTC_PPB			1000000000
 #define RTC_MIN_OFFSET		-32768000
 #define RTC_MAX_OFFSET		32767000
 
@@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned int calibval;
+	unsigned int calibval, fract_data, fract_part;
+	int freq = xrtcdev->freq;
+	int max_tick, tick_mult;
 	long offset_val;
 
+	/* Tick to offset multiplier */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
+
 	calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	/* Offset with seconds ticks */
-	offset_val = calibval & RTC_TICK_MASK;
-	offset_val = offset_val - RTC_CALIB_DEF;
-	offset_val = offset_val * tick_mult;
+	max_tick = calibval & RTC_TICK_MASK;
+	offset_val = max_tick - freq;
+	/* Convert to ppb */
+	offset_val *= tick_mult;
 
 	/* Offset with fractional ticks */
-	if (calibval & RTC_FR_EN)
-		offset_val += ((calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
-			* (tick_mult / RTC_FR_MAX_TICKS);
+	if (calibval & RTC_FR_EN) {
+		fract_data = (calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		offset_val += (fract_part * fract_data);
+	}
+
 	*offset = offset_val;
 
 	return 0;

-- 
2.47.3


