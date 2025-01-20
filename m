Return-Path: <linux-rtc+bounces-2944-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE77A1655E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 03:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F359D164D32
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 02:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB23F130A7D;
	Mon, 20 Jan 2025 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ELMshrkR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC584A2B;
	Mon, 20 Jan 2025 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737340000; cv=fail; b=bzjPWI3a3U5MKcYk54Hzf8k4Wv2oh7psiqUQYUJVqXrzbuEdFcVdH9jm3YO6Rr+WAsoiQ/PLXYxH2bBsSJ4FJ00L5IP2YTVmdq1SF3yJySQS3LvvuTUkxvmydWO5h9nEQORs/m1ZQtwhFbJvfLvIup0gdgJzH8D/4ck5ELnk7i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737340000; c=relaxed/simple;
	bh=EN2k/2Zt+hegS4CGsu8OPcUqieIFeCVz8DbmKySo3N4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Qi62eFG5FZIvnpcZBDLx08jk85oiKmRAtqNHpDgyMw7WqpjxuJjWnHtKi9cNw0+feDAbxpyD78OptdkU8/sN6H0MrT+Qu7WRSKCNw7LIobBT1ohYSAJQridpTswe1KLM3+GVbQBdADla88RstblJQFW6x+XydBsQti3bG9g6Lm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ELMshrkR; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqaWj9B4rR1mdIp8NYx5i7joq418deYoUeksWOkaXLhBs2ZNLNzp40itY1d7M+9EHiitR4kYU2PADZyJq8OzDq41+p9HeomkAz4H5AtIZv2hloiE7vXrVyrzVUXsjn18Tlt78t0dZcDTHahnMqu6IPPBwliWP8qF7LQmDuTug4Vpv/GFEnU1Gt3Td1+8IhUbenbxvYONlcr1qpq94wwa/p+qM5iSCh2QW3MJRaSp/JMvQ1n79T5/sirIKL9NbUkPdP4TOFDQrto1s3M7BM2CDIYXUcy0f+iCe04SHxQ+IE2HNTvgAHMyFOwZbPCbqSpL4MaOs7kR72Pe7wMhShz2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxIy1MINgP4AsV84ZZTh16+5NK6mkgDtqnQlGJzhFHU=;
 b=OSQt6kYH8eLJv/vBQqkDKCZdlhRm47UfguDau/vJ7xj1GKvNp11sMKh4UKpkax7YBBJ3BvUdJc+8mY3eMk4bSMpgTTQa75TrOiVVJ6Wq2KsvaDdc7Pvc8HIHWn7bc8Gd0YyzPl3W6eM1h6i2dcpsO+cUHQYeczpKvk/MQdFfLBCBzsMQrIegvxumZM8EHd9gTUH4ChJ7BwrzLKOMF1TaUdP3F1TK0MuTm90O5Zoa0Xh4zB0mdP1BN1bl7kpjo2bccwHsGa3h01LSf/VPaLPDiAfY+M3gOGSzxD6HdKjBPpauXC18IOg+isFq9tb32zajcJUb1WboyJ4FZBIHgSEMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxIy1MINgP4AsV84ZZTh16+5NK6mkgDtqnQlGJzhFHU=;
 b=ELMshrkR26+uA4xheVICMQwNQbXKIRl8DQULI08xl8uxv229ZguOE8sfCuwSvgWwcIuS44p1Izg6VZp9sWjrWAZE8EXISZMzq8mVEXQ2PVO3PosS7xUpsVGuDSIQ6zVA//23q7Q2o3fvRFW4FDqebRRsI8SaqFlohLf0QsA49j3AYaxztBTmgu8PSLgZ7tGCFk7jEZyrE7p6CGS976n0AtSlx9vG5tYzVFI7+NZj1IXx17lUBvhoTVaT9VT4ek9ANiFMVl2Grdni3PiqEyTjoiclgkOma7678ttI8bp1xnoQi/GUVXu8aQFtnBYi19alLShJP+TMdLhEbXGnx2ij1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 02:26:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 02:26:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 10:25:34 +0800
Subject: [PATCH 2/4] firmware: arm_scmi: imx: Introduce bbm_info hook
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rtc-v1-2-08c50830bac9@nxp.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737339953; l=2191;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=64KNtg8mNAuAOCB4DlUfZa1lYCiwprX7QtiyIFbHFiY=;
 b=37Mi4t0q7VmQ1QxBLvoDq8DPeGqXFJNc75veDumeMNc74VnGPhOQUImE39+2Fm8gibHvXfqiJ
 8/3KARqnvY+DVa9A1DzLHrTbTW8UHM0NkMViLayvmeXulZ1NubKxxQ0
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 801d0328-b084-4988-8517-08dd38f9db66
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHk3eXMyMEkvU0pMKzlqR2QzTHh6ZE95WVo4UGloWEd5TzZMeCt5TDQzcUJt?=
 =?utf-8?B?Z0tjdnpDVVhyYjZvWTk1R21CekFGa0ZiUGJWK2VmSnVpU1M4RWhrWWM2ZWQv?=
 =?utf-8?B?bkVoUGFDSCtJcWxic2Zzb2FkTkl5RDdXZ3hrNUFBS2F3R1JIV0xIbmJLQ01F?=
 =?utf-8?B?K3l5elgzSVRpakNKNHFkWE9pSlJRcFBvdTJqaWczMTVjYnlzRkV1L2xyZkZD?=
 =?utf-8?B?TVJrUUR1WVVpamdLNXBsK0dVZithc2tlTG0zaXllNXcza1JGdE9peitiUEhx?=
 =?utf-8?B?Y1RWL0NYb0pra0Z4Y1QvbDNQZ0RTSkQ2TXViVDhiQkdUTjVFVmNvS0JUVTYr?=
 =?utf-8?B?S0tjVVIrMnhibGYzVnJEWEtRem9xTGZ5S0UvcmowTWc0MWt5eVV1cmlVUkE2?=
 =?utf-8?B?NDBESU10ekkvSW1UM1d3UnZSQU0rRytDQXVZSm1sRFVjazJwQ0hRMHBMQlNL?=
 =?utf-8?B?YU9rVm41OGF2a0JvTGdRUEFPNEE4MnE4Z2l1MUZ3ZDNqY3ZOM1J1MW1JU2pr?=
 =?utf-8?B?OFMrYmJ5UVdKNVlSbjlNNEZqdFdOcUJkNDNnWkxUZUM1eWZGWUtLd2lraXFJ?=
 =?utf-8?B?bXRJOWJPNytNeHExNkFGQUk3Z1UvVFowWEtyckRlY1R5QWduclBsK0xOQ01M?=
 =?utf-8?B?WGwrcEpNOXM5S1ZxUlcrandzVXhrNVh4d2lrYjZFc1BERFQ5VkYxZElGakk5?=
 =?utf-8?B?dEJtQUNmY3lzWFNUQmdrMExLK1hHa3V6SlFYRmxFT1pic3ZXUUJJVTVBZ2Vp?=
 =?utf-8?B?U3hzMXBldDdOUm12NlFrcWI3RGxuT2xIQ3ljOUhyRzIvYVdhNytWZjJ3c2Y5?=
 =?utf-8?B?WE5FbmhCVFpmSGlEMyswYjdacEg3TnQya29sNnQvM1lEM0VTQ1MvZU9iRi9D?=
 =?utf-8?B?bU1hUlFBd2pIYmhXU3FERW1pTGRwV1IxblpJUHlDc21pR0UxT1NoZjBQeTAr?=
 =?utf-8?B?Uk9NR3BWZDVJN2FTVTA0eXZ0ZUNVKysxVjRtaU1EaU9USlRvY21iTWhKNTZI?=
 =?utf-8?B?OGExekV4SS9PaDU5UTlQL1M2RFlwMnE3OGhZNDZnbzcrdnVYdWZsN2Z6QnRy?=
 =?utf-8?B?UkF0Nmo5TEFIbVpaY0ZqMGw4SDFjbzJhbmhPUGEyN0U0S1JFd21STkptYm9Y?=
 =?utf-8?B?UnNmbEtrVWI5T1JjS0gzNVd0dnZVRHhkNXA2ZjJxNm9rWTh1ekNVMnVUWUN2?=
 =?utf-8?B?dHpKVWlSTUx4NFRsTUEwSmFPTUtkb052bzJ0Ujg2TU9WWi9wUy9jaVZmZFc3?=
 =?utf-8?B?dGZyQlltZytmc09MMVk0a1hicEZ1eTlIVDFBRWV1RzhxYTk0dHRxbEFEaTI4?=
 =?utf-8?B?TVIwMFRPYkM5KzhwbEx5eTFvVFM1cVlhL2pKSGMvdlV6bVlLcEJPVy9qMFdk?=
 =?utf-8?B?UUtxUFFNT0czdEFrcy9MZCtadk1pbUJZWUFrUWZSSWYrSVVDVG5XYXQ2VEVp?=
 =?utf-8?B?cXRwTkFGMmMzaVFxczFKQ0Jjc2NCZWlHYkVJZnlFajJrMUE4N2F4M0gxMHlG?=
 =?utf-8?B?VmgwVXRFU0pJNjk0RExKVzBwaWtYbTJMcmJEaHBmWXBQUEhET0Y2UzU1Z1Z6?=
 =?utf-8?B?OUkyZXVzU2ozd21IYlI2TVNaWlBTYXplRks5MVRBV2tIdEwxRzhkWmxMMnhT?=
 =?utf-8?B?b2tpL0w2Q2ZML0pqUkszWjRIQXhWdncxUlFhUHN5NG1CNXdTK3Z5SS9zVDhz?=
 =?utf-8?B?ZGZaY21vY3Mvbm5naUx5Wmw5OUhkREtrdUVkRitNQjdIQUlUU3RXejNMU1I0?=
 =?utf-8?B?SElSNWN1blF3U0s3MjRKeDFxQUdGVWFveHhRUzhzNHA4dHJtc3hqcExXNzNF?=
 =?utf-8?B?WVEwUWZaSC9QYTRuYnQwcVBIQWt6TW9JSFYwN0F6b01jcnNhcXB0bElURHVK?=
 =?utf-8?B?c1RrTC9mZnFRSGRlaHhMWW15dmF0aFlxK25ERVZoMmdOMFpUTSs0L284Wk9u?=
 =?utf-8?Q?cILXwVLXQdURuuEa7Hl73IgnoKp+xpuM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUY1K0hmaFVYTjlkdGh3UUpoekFIKytzL25xOThMVWdqVVBNVHJkeFBPd1Nj?=
 =?utf-8?B?b1hsUk5TV3lKM21aQWVuWEN1NCtIQ0dtTWVhL0hFTmZlN1cvVU1GWUdwM1ZL?=
 =?utf-8?B?YWRzSG9XRTFsbWRMWlBLRmlmVVUvelF5aUdXOGZicTRVdWNiOC9waEdFZTlR?=
 =?utf-8?B?cFB4ZWJlVTBpbXREMkJRY1JwQnRCK2UwZUdVeUM0VllzcS82QzlibitkekQ2?=
 =?utf-8?B?N0lBUXMyd0pFd3NjblhadHNLakhMTTZRSWYxSWhXSCsxaWRlQ0Vxc0l4ZHNk?=
 =?utf-8?B?WU5XM2k3RjY4dTN4RnJQVlk1bHc3UEhucm5LZFFEcWNzWUxXeW1pYmg4c3FJ?=
 =?utf-8?B?MXVqeXZza3Y1V0V2L1FKWmNSTGkvZU5aMkxobmdDaGxTSEw5YW1RWXlaQ2Zu?=
 =?utf-8?B?TDZwTHF6MDZCa0V3WnhzbHZad3l6eXF4eDUvUWdkU2drRmowclEzS1BnSXpo?=
 =?utf-8?B?Q2labHFua21JTmFkb2JYUHduNVFFUmNMNEZvVnZERGV5bjhuQVRpOTdPalpD?=
 =?utf-8?B?UkZyaHIwazMxWEVFbHkrcmdYcVV2dm5FQ1lCZjdLMFUybC9DNTRaWVhKN0pa?=
 =?utf-8?B?cEIweDZuNENjV2M2QVVOVDlGd2hUZGZkZVpiSTFSVTJ2eXV2ZVdIUDJkWUda?=
 =?utf-8?B?b3Y4U0Z0NXU3aHFpUlBUdnFXRHdlYTN0WkNpdG9BaUlyb2Y2ZGxVYUlXVlJX?=
 =?utf-8?B?aVhsbEtiOGVIb0h4VEROWUlpNzV5TFRUZHlTVDVJc2UvRGVLNGJORE9JQmRl?=
 =?utf-8?B?V2NnYUNTTkpHZXhoY21zN0JHOTZuS2ptcTZ3YTEyWjBQelZLM3FEdlhtTnZW?=
 =?utf-8?B?N3lOM1pxUko1WXVLTXlQdUwyYTRKMWtEZXA4YmVudTQybHVCVGlCZWhpM09o?=
 =?utf-8?B?QUN0WFhBUi9UaTZ1VXJJQXdPWkk5eCtvVE43OTIzUzBuZ3Q5RVpzek50MkN5?=
 =?utf-8?B?eVJNcEV4dS9CQzFVaGdDRE5VYlgrb09rOU5pSURHd0tockhWTVpDNEpuUURv?=
 =?utf-8?B?TTNPWUtrbW5FMzFRcjFVeGltNEJlUk5UekFURytRSXhFK2JVTUZWMDVZeVZj?=
 =?utf-8?B?NVZFeEdJTDg0T1A4aW1UOThJL3JhVHdaNzM1ejBBaWROMHUybHlNN0QzS3Q3?=
 =?utf-8?B?SUZHTy9LdGlBTmdpai9JbVBWaGJzNm1XVlNoZVc2UWZXVzhmMytudXA2R2xo?=
 =?utf-8?B?d0ZaMFVCVG1YRDF6ZUVOK1ZNbk5YM054VE93cklWT1pnUUVQMzVPNDZ0MU1q?=
 =?utf-8?B?K2I3bDE3TVIrYTg1WjRLYXV4RHQzZHJUZ3NYS01QTkhZYTU0NTJyVC83Wnhw?=
 =?utf-8?B?VHgzUzV1NWFOaVEzSUVHc0ttRENPR2JIc2dNWnFoNWg5VFZoelFNZitxOE45?=
 =?utf-8?B?RGZ1Njg4cFlkbkZUYVBabmNSb0IyVzIrRmZNbFJkUmhFSEZYWEZhby9qUXlB?=
 =?utf-8?B?anE3QytPQTBhOW5EUVEzTFdrQ29lc3l4NGlVRmhJZkIwRFo2RlV3MnpjQTJu?=
 =?utf-8?B?UVgwRDhvTTcrdWkvWm5YUTZYbEJubmdaOWV2Z1ZjVlErZGVvSmgrRnZlbzJL?=
 =?utf-8?B?aGMvckRvZEFreVBNUGpqcnJpOVc4d2VUR0EwTWxjazdRVmt0a0hkT0NGOUV4?=
 =?utf-8?B?TXk5dFAwR1ZHRURlOVZGTjJjUU1xVVd2N2tUd0hkejMrMHFIeXNSUHgzcVJn?=
 =?utf-8?B?SWNiY3JFU2NGMGRlRERKb2VRRVMyQzRvTUprcFN3NjhRWVdvTkNHQ0FlMlhN?=
 =?utf-8?B?NHl5dTk2RDhlRnczb3J3Q0ZLZXJaTHdESFNDbEpkV2tvY2RLaUQzb0U2NzFl?=
 =?utf-8?B?RDNWeTJMZkZlbGtpR2lFV2hRUXROakh6Y1BUNzZmcjY4aVpiZ3lzUEIwRzdw?=
 =?utf-8?B?ZVZEUFFLb09MY1NqeTZ2aVVETnVYdWFkMENBWGN2dEorME1yVnpyZUhEYkRu?=
 =?utf-8?B?QWFxa3V5MTVhUU80a1pKRWJ0YnZpczM0SnpGOUFEUzQ1OG1ZUGdhVDhRZ0JE?=
 =?utf-8?B?M1VPT2QzdGNpQnNDN21iT29qT01LdWgza0lxU2tsTWd0NjJvdzBVbDFmems3?=
 =?utf-8?B?OGNLdDd3U05BU3ZVTlNFbjIrQ3BIWTFhMFZrUmpTUERKR2RLOTFhQ0VTbllt?=
 =?utf-8?Q?SY5k/WVdflUb6icx6bjn4TzbY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801d0328-b084-4988-8517-08dd38f9db66
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 02:26:33.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc1JfUdcDuRbI/a70ATtzSOCF3JFh0Yp0t44uHJoTAIvBJc7jknOxJPnSPaxmAFF+AIE7NuNo0NBfBbZd+6ibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

From: Peng Fan <peng.fan@nxp.com>

Add bbm_info hook to let BBM protocol users could query the
how many RTCs and GPRs are supported by SCMI platform.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 15 +++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index 86fadfe8e3560b1cab5876a1029e38d91d938e2f..9d40ea817f4bdd2304c932bf3f52b7673a35eaff 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -246,6 +246,20 @@ static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
 	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
 };
 
+static int scmi_imx_bbm_info(const struct scmi_protocol_handle *ph, u32 *nr_rtc,
+			     u32 *nr_gpr)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+
+	if (nr_rtc)
+		*nr_rtc = pi->nr_rtc;
+
+	if (nr_gpr)
+		*nr_gpr = pi->nr_gpr;
+
+	return 0;
+}
+
 static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,
 				     u32 rtc_id, u64 sec)
 {
@@ -351,6 +365,7 @@ static int scmi_imx_bbm_button_get(const struct scmi_protocol_handle *ph, u32 *s
 }
 
 static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
+	.bbm_info = scmi_imx_bbm_info,
 	.rtc_time_get = scmi_imx_bbm_rtc_time_get,
 	.rtc_time_set = scmi_imx_bbm_rtc_time_set,
 	.rtc_alarm_set = scmi_imx_bbm_rtc_alarm_set,
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 53b356a26414279f4aaaa8287c32209ed1ad57b4..a0e7e99c4f43ba3e735f50b9eadbfa07a7803947 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -20,6 +20,8 @@
 #define SCMI_IMX_SUBVENDOR	"IMX"
 
 struct scmi_imx_bbm_proto_ops {
+	int (*bbm_info)(const struct scmi_protocol_handle *ph, u32 *nr_rtc,
+			u32 *nr_gpr);
 	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
 			    uint64_t sec);
 	int (*rtc_time_get)(const struct scmi_protocol_handle *ph, u32 id,

-- 
2.37.1


