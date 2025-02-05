Return-Path: <linux-rtc+bounces-3098-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD316A28088
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 191D47A1CCD
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 00:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CADC229B0F;
	Wed,  5 Feb 2025 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P+1OefZ0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AFC228CB0;
	Wed,  5 Feb 2025 00:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717178; cv=fail; b=DKct8Nhwf6rLW9c1SbkDbPHu9kJ0J3bYbYhIWbNtzQ7BJCSlMpqDdQZbKM/J4uyvc/098y6lGzJNQwgMKLDeqpKDRPBIDU0wN6pB4oos+7/mR2vHYAbgS1xG0b/C2kIT1P7wCgNEpyXYxiPJcnstycgngX2UqV23As+oXJzcO8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717178; c=relaxed/simple;
	bh=/EC8zCoNiyDgYUl3GWxR1c0E1R02p9BWvo/Wx1hJgus=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mi4VwE8MCXm9goNgmoaoPlWcwmNT3cvrajHgvb2xUTCS8IL80suogZuw+Yd+9IAoOLUOnOjyGYsf/GpN6Ej+NfdB5ZsL9lTDykkB6ZqWFWshRuKbrFM9qK92W5EmPz9ef9IRe30/c3PG4J3lW6kqCOcm/RsYFpOu6vxIXcLHVAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P+1OefZ0; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfemhTSgeU4sGGfI8Re72cBatV8DGltV2OFSZUTR1hNrm6/d8+7z4I05zuAEnDH5FVRB/Wx2on+vY5bVCgpN1RJT1HYh/1vEOGhW/qvyasDVRIxi6UW448mJoaLa1vK2279LZpPXOuzL3pXZ5cIcGCGkT8sZGN+t6aWPzCMvOYHpwaJrQh9UBWNU0dOQU3VsjiXqDZhtDjsHy3CL8XNC6VXhc6lfmwtFCa1JC5JfuUvWa8tpfjsNl3k9Ds0MiNwQLxJBA2/ByldqksU142nLM0H3pBdcVGLkPSkjV5rUpM1EAA1RbK5AfhXCY2+zd7Ul0guHuApuEAMgs5kzYcd8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsAJU3FUgsUM88m4mSGw1WR2K15UVHFt8h4YUCR7Im8=;
 b=a9M2MvI2sQI6C/8/ygaNTEP4cSZE1O7z/DXxENYRagjXfLDk+pB7XJl33nku9GcfoZZKVOUKlEU9YVYDd/BXFolhPFAZkiM9mJc069mVzvHiCTXufxt41hFTfELJefTxCmhVRDI1IfnG2VwpkE6xHg/p2t0bswg1BbgdJ9BhrS7/PcuH5Mqem5SdO7W2dIizvS7jq7X34lUOoF+jeDehjNoVLPb96wBppj1/6/djlqv8FBg7ggoiR9KnpMTCbXs8Uu4Kw9XtcbgMhQTjk+XUBZ1l93HhU48yh24UFhQu/j8lIKQHPqXYJHCHY71p8V9fDtAaZndjjau4+4Ay3dHhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsAJU3FUgsUM88m4mSGw1WR2K15UVHFt8h4YUCR7Im8=;
 b=P+1OefZ0diM739yPeiRBD5qtteCmV56h99Rgxpn09M38AdX3GYtnLmmOi0EfOW1hyM9yHme1J3uUXbwbyoarJTHR0GPjVgbf16rJ+plO2H/mpUWacHr8JKadSgT/YmAmjbNeSxZGVY5jwOk9EypKz0NYF6q5F/+0cFGuBqDHYi3TQjI9w8i3/YXcA0PnSEux7/PEg5+YTF5UK4uyy7k+PeWyDEyM4h64Q1mLJVE5pQ7AAzAs9bk1dQbRy9RUH5G30ionlKJ5KOhcF+LRTYwXP92jBf/IgRsFPwbODE2XUiojen0B8SsfvV1z3x6g9374LvPVoHKdhTXdhpYBxrdgfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:24 +0800
Subject: [PATCH 6/7] rtc: mpfs: Use devm_pm_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-6-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1347;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7sZhYfT/a75JkuPsULgAYPAtV5pnc5lWQRqy0mNIenc=;
 b=ZZyJ6oBnd4ebUNNhIlVXgX+8rb9tbIafnXdCmfQxVegqmYR6Bau7iTLyWNEhAI0R91LFHHApT
 LE9qzTrd3U7BRiDAm+bXrNBCS4cu5UMLf523JpJJEsXVHDzxwY1rRzh
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d5cc0d-d4e7-48f0-0dbb-08dd45805a56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUN3VlFmUTl5TEtGcVozVFhWSkFvNVJLNUxjcm5BU0gzMGNhWEtnZ3JqdTJj?=
 =?utf-8?B?cE44enl2K0ZTTERQaXFjYjFFZFg3OEwyZGQ0QzBOVmozWWdKRzlZdTZiN25i?=
 =?utf-8?B?Z0RBWExZUVdJWEpuaFh0QzZwRVVIMWNYZGEvL0xwd2hGa2RxMzNnd0hWWnBK?=
 =?utf-8?B?VUxLRHl6ZXJQZlFjT0FjRkIxa0lyOHc2L1dkbjlrOVdYbmdxd0tBTURNbDlq?=
 =?utf-8?B?TWRMY1gxRmluYlg5YUNuaHBFc3QzMkY1eW82VG1jV2pEQmVvMEtIMFRmRW1i?=
 =?utf-8?B?MTFOSk4vWEV5UGRjSlpLT3IwVW5ERnFNNm8rbjRHYlJJOVNXTk93VlNId2ov?=
 =?utf-8?B?c0o3WEtNSUlHZVViRjgrcUNoV21tVTV3Smo1ekdReWVYNDBsb0xQY2NlamND?=
 =?utf-8?B?NTFzOXp0UjQ3VVFxMjdaa1F6emZTRVZQWis4QmkrbGlWMWRDQXRtb0NwZXlE?=
 =?utf-8?B?OGZOUWRMYzRkeVdHZlp2V3JyU1JGc2c2YTBiUzB3Rm1PWUFvR0FEVTE3UEhs?=
 =?utf-8?B?YmEvemRHY1Z5TllRZ2lMeTQ1c1dvdERyWDY2OUFlVzI5cW9SS2ExZnlXNWdI?=
 =?utf-8?B?OXVoMkJ4RitDRmRpdVoxUUJzZ1dGTDRiVVVWRW5SRnZMOXZnOHF5MlcrMDJS?=
 =?utf-8?B?MWFyTHFhQTlyY0FVa2xrUFNNbm42U2kwK3JManZaL2pZQk9TMVAva2tjSjBl?=
 =?utf-8?B?VE5ZZms1bEtWMzQxZmFURm5oT0J5aHlQT3pYY2I2aTkrcU1KWHh1czhlbG5l?=
 =?utf-8?B?UEp2WDR4TVVKMll0aDRmNm16L3dnRzNSd1VEZng2RXJ2YnNLUktTOTdaZkZZ?=
 =?utf-8?B?elU2YTBVbmFoRllIU0ZUeWZBSFJxZGNkS21FYzByZG5CUitHWGpYWXFmcCtj?=
 =?utf-8?B?VnB6Y09UUGwrSktaZ2Z3T1BGLzRKOFE4SHBUWHFoS1dpQWUyK0M5K1dvemk1?=
 =?utf-8?B?ZlpxMURlWVVZQ1NFcXBqbmxqcmJhRUhRQjVPd0d2WWRtRTNSRFpwdFUwbWdu?=
 =?utf-8?B?NWZ6eXB3d1h5a2t3TmsxMysvMW9XakVtbFZORnZ2VnJ2YUlXbFc1NnRMZGRu?=
 =?utf-8?B?SFBGWW9DNEVxaFY3bWw4RjlnK3pLYmIzbk1wKzB0TVc2NnhhVTN6c1hDNzdu?=
 =?utf-8?B?YlloWEdrZGJKUGF3d1VzeFdQUTB2OWtia0hIM25mOG5EUWVxUUtwa3FCTFBS?=
 =?utf-8?B?ejRIYWVVaDNZS0ZjZXNmUE1Oa1pxOXo5NnZMTW95bTdMUENFcEthc1VRRVJv?=
 =?utf-8?B?MjlGbnNrQTd3eWFzZitpcStJMHFIUTVVQ2ErdHFub2QvcWRScXVDR0pQVHBB?=
 =?utf-8?B?M3pLck9jMUhWb1RlOGxrRlQxQmhic1RWWENlbjVwU3AzWU8zSmZRd0trTzAz?=
 =?utf-8?B?dXZiQ0ZVSUZhc1IzZVBrUzhJNklmNXgzdWt1V0hIdERwdk1RNW1rNGdQVWR6?=
 =?utf-8?B?eGVqY2RYeDR6dzJwcEdxR1FEdmZud2tQQ1gyM0p4Y3dHbktlWmdLNzNVMDZG?=
 =?utf-8?B?aDhqeHE1akYvbGlkejhCd0o2NmtWYSt2dUlTZE11WVBySWlaQ0RnSW1rYnEw?=
 =?utf-8?B?WXIxUjhRdjJXU2hqd3drVHBzdDZIL1Z1UlZxeVU1bTdIRDFUdXlsNmIxWHY2?=
 =?utf-8?B?YzJ3M1VBNXUyd0t6bm1nbENFMDJVUktGTjV5REx4dkxVbGVLZUJ0SDFkOWsz?=
 =?utf-8?B?ZEdaS0s3ZlJhK1htTmx4UTJoZ08yd1R5d2NuVTN5OENpa0ZkVElxcUJmS28z?=
 =?utf-8?B?RUdRd1haT1MrMis0MFNJMklMaHRkbkFQcjRSZm9LUzYzbXVyczYvUGRHdDNG?=
 =?utf-8?B?b3BPN3RDby9QTEVYd3Jtb3R4MXdrZ3FHa0J2VlJnbVIwS0xJRENoYTF4RGZm?=
 =?utf-8?B?ZWl2YjN4N2d6ejZNbE9VZ05TT080S2tRYUZXeGdqbzBCUkk5eHdObGNGZkhr?=
 =?utf-8?Q?Hth0FHvZZkyXQIB2+MtZM5l1Vgl8gbBb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djBJU3k4NERYejJCNTROaXU0ZVdXVkFFVkVDdW1tT0NNN0kwU3JKWFBTbUx0?=
 =?utf-8?B?UWFpYUk3TDIyQzU1RW1ZUUNpQmFOMzBhYTNYSGlOTlo2cnFGY2dLQy9uSzFH?=
 =?utf-8?B?Qk1xNWVoOHExVVMzRWRpK2tDS2J1ZGVrbnVWdDl2VVd6MUdseGJIYVc3YytV?=
 =?utf-8?B?RElhRVBlbEhkdkF5OU85anNWdDZyY2k5c1E3Wm1nN3Q3aWFvWERpa0I5K1VC?=
 =?utf-8?B?MFlGZGF1MUxpZXI0R0V1ZTB4dERqbVp5dzZrQmhnTy8xMzU4d0h3RkZrNGlT?=
 =?utf-8?B?M1E5VFB2UlNSMk1HT2J5L01JUUo0ZUNGejJZN2VnN3AyMW0yd1lVZjQxZW1N?=
 =?utf-8?B?K2RwZ0xGTmVmQ0hVRVVXeXRnQzROby9RdnUvci9reDVTUmEyTnVtREtrQmxj?=
 =?utf-8?B?OTNlMXU3SloyWkhNY2ptMUxLVU8yMzNIRm43bnZhSWE2K3RNaXpuNjBMUGIz?=
 =?utf-8?B?WWVmbUltU0xWT0o0ZWdEMkQ0Y09HSUNibkJyTGkzK1hCam51VVg5c0RzQnBW?=
 =?utf-8?B?cXE4KzVNZlJxSEFRYnYzRUVzSElqd1JRN1NTQmIwQzN0K2NjNGVSTEI4c1Rt?=
 =?utf-8?B?MWhBdWV4SGtzQmxQS29JL3MwU0Z0OWprWE55UktEZnFadmczTTNlMWFucjFY?=
 =?utf-8?B?TlhEdmlWQ1JVNjQ1ZHQzRU9NWTgxcG16QVhxNVUrdHptTVpSUGxwQ1VoNnBn?=
 =?utf-8?B?YmtLTHVFS1I1L2pPU0Znay9JRXBwMXFyTkxrNHI5SlBETVl1blVpYWViKzZH?=
 =?utf-8?B?blY2YTVXeitOWm5UdUJqaFVRNGJXWXJuSXN5bzlnSnRKcFVLOFlna2UyWFFB?=
 =?utf-8?B?MHBIS3F3czJWTjh4ay9xUDRIOHlXQnRFQ25EYTkyZWRJMFVMalFPbnNLRm1l?=
 =?utf-8?B?eFp6Q1d5Y2dMQ0FIWTNZa1pua1lyQ3pnRTI5R09Mc0s5UXdKQWtjM25wb3Vv?=
 =?utf-8?B?N1l2ZVl5cHZ3anpBNVliU3MwZ1NwZzRnUk9YWHoydmdab0F4MGhDZFJYa2Jn?=
 =?utf-8?B?UUVJQmVCd2ZqUXNmNHVMeEo1L1RhVzRKTHA3RjNzZWowclpJUVQ0aVZTVkRU?=
 =?utf-8?B?Q0dtS1UrM1FlZEhZbFVYalJnRm1sSUtYYzRzaVA1alhiWEpPZU1Lek1jSkZF?=
 =?utf-8?B?enExWGxhQzJhWi9Gb3ZpajZFVVBCOC95UWdMRnpqMGJlZ0VCL1JzYlYyQW9H?=
 =?utf-8?B?cHl4MFEvMFJVaU1WaUhHTGcwT0FvMk5mN0F3TnhnY0M1eEt1Tko5WmYyZzlP?=
 =?utf-8?B?Rkx5OW9sQ2phblQ5S3pCR2sxVUNYZmlBSXU5NEJKNWE2YWRNdDRQakJPKzUy?=
 =?utf-8?B?cGFhOXNhaUQ1ZExYMjBZaS9HUFp0ajVqRVlFNHc3K2FjSzZxcU1NUnVHWlIr?=
 =?utf-8?B?VWpuT3V4WHp4bWkzRXdZUU1UVVQyYlAyUnlkaTdmbXg1SnFoZThSTVJDVlh5?=
 =?utf-8?B?ZGFFbGt1a2RqcG9IcW9FZThRVnh0c3VRUGJJTHlqZE41RER2czJleE5rc0do?=
 =?utf-8?B?L2daQU1WOHNqQWpqMVJVNk16eFlXaUg2a1hrQ3F6cVNGc01jS2M0SktTckZF?=
 =?utf-8?B?bWNMUVlCUkQ0b1cyY1pxQXkzUHY5UURLVWJOWkRta3NIa2h6MEo1dGdJWHlQ?=
 =?utf-8?B?RDhLR090Nno3MjVxOVgzSGZsUTJkcjZ6eTFNSXJkMjE5MldReHV5aXg0eHRV?=
 =?utf-8?B?MjFjMlR2em1iSFFuK09HRjY5U0Q2STJxc1QwRkRJaE5BUDRDSHdVNWgxeCtF?=
 =?utf-8?B?V2JvQ0FMaVFWdy94bk9hLzN5aFVPeDNFbHRUQ0U0WjlCbSsyQnJCYXRyZEdF?=
 =?utf-8?B?bTR5R04xTkkrUG9rdzB0ajRMTUY1czhuaVhCZmVJMGdVMnhUMTg5L2gzUldY?=
 =?utf-8?B?ZC8zcWRib3dsWXIyVXdMNXVLa2NuYkFSM1k2V1NjRzJxOU5iUUV5ZVhRMTlp?=
 =?utf-8?B?ZGFNMnBRdGNPL2NrUXpPWlZNN3c4Ym5Ec0I1NzlwdUR1VkwxVk9ZejE5YXNO?=
 =?utf-8?B?YWJOQWM4aGtzdVFhY1g1Y1ZsNXRHNjFtSFZBVUtwVDQzelQxZnVrTTgwaEtK?=
 =?utf-8?B?YTY2NzdiQS80MFliVFZ1VVNSNWFQcFQzeGQyQnJncGhVSVc5RjlXNnZpS3Fq?=
 =?utf-8?Q?jE5EktvWHsqZj7pMHo1gUvj9D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d5cc0d-d4e7-48f0-0dbb-08dd45805a56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:33.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Egsm4Fg8ym7JJhPoaUC7uTQB5XsKHT95YEQ9DBL8mwasmxKv8UcFlWZNkcobBKS6n+gxSveulntB2MmLZhgO9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-mpfs.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 3892b0f9917fa7bc4f732cfe2c2b2f548ba7429f..5a38649cbd43b3c6f2fec5db95c4f0013deb2a08 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -267,18 +267,13 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);
 
 	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, wakeup_irq);
+	ret = devm_pm_set_wake_irq(&pdev->dev, wakeup_irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
 	return devm_rtc_register_device(rtcdev->rtc);
 }
 
-static void mpfs_rtc_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-}
-
 static const struct of_device_id mpfs_rtc_of_match[] = {
 	{ .compatible = "microchip,mpfs-rtc" },
 	{ }
@@ -288,7 +283,6 @@ MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
 
 static struct platform_driver mpfs_rtc_driver = {
 	.probe = mpfs_rtc_probe,
-	.remove = mpfs_rtc_remove,
 	.driver	= {
 		.name = "mpfs_rtc",
 		.of_match_table = mpfs_rtc_of_match,

-- 
2.37.1


