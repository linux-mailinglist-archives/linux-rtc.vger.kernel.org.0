Return-Path: <linux-rtc+bounces-5839-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN0WEBY3cmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5839-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:41:26 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A468092
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76DD76AC870
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0636C32B99A;
	Thu, 22 Jan 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="iQzZTw2L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE0332EA0;
	Thu, 22 Jan 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090041; cv=fail; b=YRL0BUHmjoogGvJmw7pQ0pXxozzQU7NFFhXnfTbGrjnGmQhUHZcxGcRXczcgaNpCilr4X7pQmaWMLgKQv4z8bN6AEgl1+La4KDm98+4s9FBW4asSTNR0jI5Piu+jpJ9/fJbdk0p7dpSlf+8Rk/8hvigIgOdXAhJmnh0Zr4SEVnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090041; c=relaxed/simple;
	bh=Is42AFzpbFs4BnXP441pZX84WUy5/bJNDyvw9zrnD4A=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=t109W4piPoHCl/r9xKzTutQzMeHF3L12eR/nCEZObIgpdy63ItydXxyVPSQ/ecG93UECqC/0VKZAvNzS9hrd2BSVqdjIOElYNBs2FJbeYb3WM7/8lgvk6S21/PiN19ApSroFmXYfAa2Sc8aE0SolbAh+XV9m5xPj/PeIoDRF0U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=iQzZTw2L; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obKKkZ6kc07xfjvFBGmMkDnE9ek+cqro63jnMNlgr3xR/m5ri0QWztM6pA5svgALGsL2nXptG343PcBdv2ezZ48eC4XekaKiPDT/v+7huD5uwEsWiQFT+8LEgTemZNVnMBX0nCoBv8rBbpIE3J+iPw7p3Zan/vVX4H1jCG+NxJM+eAzQKpQ0UhoqSySuerTE00mdxw9OitDub8UwNVsX82nFEfm1NJh+9jfUMQ8U23wmNVPo/TunYecYA0N1YwOLGSZC4sKsrgJP8Fl37xf/wOEo6FEAV52GH8Itqp5dJh54j6Xkcei/zTEyH5d9izRVdgmMF8cv8XMD0Ur95+nQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPIlOJdzykreejv+4TumXtAR2Fal7Gga8eA1VV5RrGQ=;
 b=KrLkzNEa//Up3wpT/pzD6EFET2cNtbD04uLvDcXZvZLG/8itfHm5NTBMGaW/VcnEEwKZlKnizdc+5L84fwWusjNmwT2tIKzkki3wPUk8ArMYfTxZQH1mJeA5rqc/q8Tb1z0tUzqko7WoMl3cwEHHpIz/IWch5yx6Vg1LZoPKD/qJALJOk/LWi5MLY6N3MP/rUImSWBBtxaqtrg5YeaQhEJcK6k1Z6JLsfrf9zUyIBVVqtM6/0lESgZP08Ae87acRrWa4kygwvXjjgY5yZrMGynKVgOn6NnBvYky/zK9NwssDZGjgmbNUzh2hh++i8HY5Q9G/y5PTGMZLttuEUX6QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPIlOJdzykreejv+4TumXtAR2Fal7Gga8eA1VV5RrGQ=;
 b=iQzZTw2Lf1Wh0mRLIkuLkN6FUHDUOm3wlU6v/fHTD3e+p68CB7s1XZDIMe6O104UbWI6LoL/Q67r8GeAbyB/38p3ssGtkeioUGC5WoYaxvOHXY7jKiPg3tPIsHL/V5en7fpS8irqdjdYNl2TfEneF6I0fpixUJtFyx0/0pK66PadKMBYF7IG7OeRYaetgdkLxMWa9sTc30RJL2GsrOyGBd6WtIR83NJZ4fo+WmJZPw/YXEWDpmVn0OdvJhEhmvKB8sm5XAP35iyokssIJe5eyzgsqvh2ybWYrxP1Z2td93Bgi+dQIfZyZm/tVEOO4d6QOekl20cAJZu4T2iLxUkT+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS8PR06MB7413.eurprd06.prod.outlook.com (2603:10a6:20b:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:53:52 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:53:52 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH v4 0/5] rtc: zynqmp: fixes for read and set offset
Date: Thu, 22 Jan 2026 13:53:44 +0000
Message-Id: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgrcmkC/33OSw6CMBCA4auYrq2ZaQGLK+9hXJS2SBN52GIjE
 u5uITHRSFz+k8w3MxJvnDWeHDYjcSZYb9smRrLdEFXJ5mKo1bEJA5YiA6TPobnVHXW9ovdOy95
 4qlkGPEuUAixIXOycKe1jQU/n2JX1feuG5UbAefqXC0iBci72qULDRVocg7ReXuVOtTWZwcDeS
 AYIYhVhERHxKcywlILrX4R/IJivIjwiUukcWKmNLPAbmabpBWbhhypAAQAA
X-Change-ID: 20251201-zynqmp-rtc-updates-d260364cc01b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090031; l=2482;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=Is42AFzpbFs4BnXP441pZX84WUy5/bJNDyvw9zrnD4A=;
 b=3ioWuwJgyvTXKfuE2XdzSV1y9l+9NoYiXfoL+4ZKIFaS+dT5lR24xVR8WwZnglFCTSACLu803
 GLN6TSigPuUDiUsikFzbXQV/w6HuPO2lcqRoBkIcyYS09sdBhMJ/x2e
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
X-MS-Office365-Filtering-Correlation-Id: 132bc2ce-c1cf-4874-512c-08de59bdad3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDRXWk1SWENBMUkzd3VydmtGc0NLa1B2aVJyRVR6bDVHUnNLQ2hza1djTW44?=
 =?utf-8?B?YnJHNjdzUnBWdHZZaXNsVHZFSVdBc0MwOEQ3YVpONEVPNnlVT09DM0RRUnRE?=
 =?utf-8?B?WWhwMVRxaGJrajBoMDVROHRxRUtILzZ0bWxuR2N5RVVEYTJtMnd5TmJMM2NS?=
 =?utf-8?B?eVh6VEpvR1MyV2F0bFRzSyswbXBxMTZ1c2NNdnlBSTFjajk5czIramZnNzR6?=
 =?utf-8?B?TmhBaVZhWXAwYmhUMVdGTS9NdGNCRGhIWHNsUVEzL3VpZEMrZGczaldDeHJY?=
 =?utf-8?B?U05ib2xYRmd0OENDREVXMS90YTgvZnRsRFVQWGVPVEZkZnRjUThMa0hQQW0y?=
 =?utf-8?B?KzFkU1pTWVk4S2c2emZ0V08vZFNLK0x5SjlwdnFlb0I1TGdzcHk2aWUxNHd3?=
 =?utf-8?B?M1lRa1o3cEthbWxnZXJMaWcrS2M5bjYzOUhWQmdHblYvNUVlY1YxUHk3WjVj?=
 =?utf-8?B?WFh5NXF5NE13Q05TYXNhYkw3aUZ3Vlpzb1RHdmhuaWJLeldSckJkVE1kUWw2?=
 =?utf-8?B?WkxLSHlRVlVnazlyZlRFWER3ZWRlU3dsZk9WRWsyekd2alBhOGxLaVdTUlRp?=
 =?utf-8?B?TkhRMmVqYWF3d3dmS0NBVmIyMEw1c29LbTF1alhhQWdLZlFnV0Z4ckUzZUZ4?=
 =?utf-8?B?Wk91YXdQMEtQSlo2MDQxcEFXUDArejQxWHhMazdzaGJEdFBuTTFpZ0s4UVhO?=
 =?utf-8?B?aTNldkNSc2I0cUNxWk5EZTI3QUludmxIa2RDNXhaNHdsQnBRY1VhODBMOXRS?=
 =?utf-8?B?SURtSTlQeEFlclpLTlJKbWJ3ZXE5NUQyS0FGeEZFSmo1NTJXYTgrQS9tNWM2?=
 =?utf-8?B?UWhkTnE5dWJnc0t5eE1pdll2V21ldjZpeWhNaUhPbTBadTRMMHBUN3U4a3Uw?=
 =?utf-8?B?a1BRbnltc0VMeG4zODlmWlZBT0hUSVREZEYzaDY3eWl4SGVWZmZBY1FEekF1?=
 =?utf-8?B?T1pNLzlRdmRneXVQcFpON3R1cmRKdlNlb1BhZkd6ZDYwYk9RdVM4YUVEV3hv?=
 =?utf-8?B?bmRWaDZWeE83WDRvY0FOMEM4amFOSDlRQm1vTGI2NTRmZW94MExaQTZCdDhm?=
 =?utf-8?B?a1FtUWNadmZTTVk4KytCMUdQZFJ3UGxWRi9wMHA2NnN1OFdRUVloNmxSRVND?=
 =?utf-8?B?VFdWbFZjdytYSVVpS1NacW15N2tGaWR1T1FvY1FPQUJ3T2xBWWgwRDl5NEd3?=
 =?utf-8?B?MjltVWoyOGd2S045enRHYXpFVEJMd1ZjMXdpWmg3ZG01bkIrS09FVHMveEZy?=
 =?utf-8?B?Y3ZmUllpaElkcVFsdWdPbDJtcGZSZFgxemxVejU5OEgxNk11dFM3OXZBZEth?=
 =?utf-8?B?eFFEaWN2T1N2RGFNYXkzeFdxSURHQlpoOUcxV0VBT2dTSFFMRUE3cGsrNzlI?=
 =?utf-8?B?cGJiMFVaMXpXbXF3WnJLN01SWWpBamZFUytMS3BzVDZ4bkQ2SUhJVW90U05o?=
 =?utf-8?B?ajBCUWtnSFYxZk5DVk1RaUJsd29oZUNoOW4wYk50MEhUTU41dHhWSXpPOVBJ?=
 =?utf-8?B?bk95M2NLWTErRGNxL29lK0VDdHZrM1RCa3dMTjRLNllqZDJFNTdFQjY3SWcz?=
 =?utf-8?B?Y21VMGI3MVNsaXNqbDZ3b2E2TnpseE5WY1gzUlZPZkhycXVxc1ppY0drTGJl?=
 =?utf-8?B?UnBPaE5LMkpMZU9yOGppTTVJVWlsMmpEUWpWZlJvQU9XV1REenJlMkl1M1o0?=
 =?utf-8?B?b1R3RUN4MGNNcFd2TmZrWmJ0aXR5TUd6b1NORE5yL1FBUGl6YXp1R0FmVnI3?=
 =?utf-8?B?RGF5Q1ptRWd3K3RtcVUyaHFqY2hFZDVhdzVuUEtkY1liTmtrTXo3WkxES1RE?=
 =?utf-8?B?dUdLNkZYWVEzZkF4MHJQVXlBQWNaQmRIRTZMbzNNaFhXZzIxdnV0WHpyMndI?=
 =?utf-8?B?TzVuSng3THdlcVVkTzIxQ1hUZ3pPTnJNc0MrdWdsUFNyN3p6ZDJ4L3lCOGxO?=
 =?utf-8?B?eFduTFRSY2x5TXVzRVgvOWxOV2NlUEw0WHVZYStuOGZZaU1OTzNsLyt0Ni8z?=
 =?utf-8?B?N212ME12MmlrVnNtM2dkSHZDcndWUWI1WlQwSzF2ckQwWXR3cUxabytTSERU?=
 =?utf-8?B?aXNDUTQrU0E4SytDU3FjWW9vNE4vREFzYUpjSXB4YzlHU3BPVE9yYkJsdG9V?=
 =?utf-8?B?NGhrNkkxNHFZSTB6OWN5REFPdlJPV2RNT252RzNrWjZZYkdVY1MvOW5hd2RK?=
 =?utf-8?Q?b616NrYep3vJ0YCOJPBAS3o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk1Cbm9oK0JvdlQrbFFIYitUUzBPMXlHeklTbFBhNExnZjBENmcwMGlJZTMw?=
 =?utf-8?B?dUw3NWk2aXVOUXpoR0xXS21HVmpHT0dBMWNqUmZLZHczNmY5V1BwM3dvVEhK?=
 =?utf-8?B?S3dyNkJnZW9mMGsxYnRHU2RPdzNJNlR4bTA3U0I5MkFTRngzd2RnOVlLYmN1?=
 =?utf-8?B?aGNsajdRVXB4bXdCZ1EyZmttZWF4RDFnY0N1QncyRXJwU2g3MHpOYkJ6M2tx?=
 =?utf-8?B?eTF3dHdBVE1GNU5zdWxhS1o4bmIrOFFYdzIzMzRITzhPdDFxZ3lIdW5GczJi?=
 =?utf-8?B?OW1CT2ZvMWUzWVFzZTNGT01EUmpBNFJ6VUNGOXRtTWc3ODlVRStqTjlGR0k2?=
 =?utf-8?B?OSs3a21EQ2M2QjFDWkpoS0c5LzlydURzRm9rYXN6OEFheGFQcFdRMUh3UDZE?=
 =?utf-8?B?R2p1Nkk4Y1lzY3BRdTVDekhqaW5WQ295T3YwZTlpbE1NWlpDUFFUZzJ1aWwr?=
 =?utf-8?B?L2gySW5GU0dBTUxEeURCcUdvMlJXdEJ5TmFnakhlaG5HQWdseGx6V05yODUw?=
 =?utf-8?B?NzFPc1gxMGpYeUVZWVlqa0k0N1ozTjRYSzQxejFvUkRkOWpqYjJTYy8zMEZT?=
 =?utf-8?B?aTI5N3dKUVVBK2pvNXNyRE1SY1puazlVYy8ybldxcXoxcFdRaFc3Z2o3ZmhZ?=
 =?utf-8?B?TTUwcFNVVEJRaUxtRk9OTzkxb254cWwvRjlwN2VJNFRyVENPNlNxWWxpQkhZ?=
 =?utf-8?B?aHI4WVhWVFByQnVQUVlyNzNDNExoUXpyTEdkeUk5RHdxQlpIamZjVjg0UDVk?=
 =?utf-8?B?UW1OM1NrZWVQZHNtMlZ2TWVxbW9VakJsbnZESmJxYXBCOWNWNy9reWY4U0lO?=
 =?utf-8?B?Nzd5Y1pzWjlWZUxRb1poVkxLN3pGSGJiellOOGhSa3dRZGJ3RHVDN0h3QVFo?=
 =?utf-8?B?akJCMWFSR3BvbzdVdE8vY0tYbXpwdWNIQnplT0ZuZDh3RkZtWE8vTXA2Z1RZ?=
 =?utf-8?B?WGRZa29xSG9lZEFmYUFTN0JFSk0yWk52dXJnV0NFY2NMcGVFWDgrek1WVWlr?=
 =?utf-8?B?aHY3bHc4SUwzUkNna2NmTlVUMEMxWFZhajBvMjkvTzRvVXFBRktLSnV5QUJS?=
 =?utf-8?B?Mzh4MWtLZ01ha3d5QnNLeThDcDhndWVsVHM2cXVmeUZZdUlYc0V3T2Z1UVYr?=
 =?utf-8?B?d2ZlTksrVzNnVkpKWCt5amhtR09nRzk1VGxBVzVyWm4rclgrRVBLNGxIM3lD?=
 =?utf-8?B?cG5aL2ZsOW5KUkR3engxaEtyaXhOWWNjVVJHbGwrMEx6U3pvWHRXSkI0RERp?=
 =?utf-8?B?Vk00Q0F5YU9hMGFMYzNqS0RVL2plZ1NBNklnb0V3V1E3NEdqTEpOYkRVZnhh?=
 =?utf-8?B?a0YvS005Y2lWT3I2WmJuTXNwcXdieDQ2UzByUUlzS2ppenFVYTFoVDJQUCtn?=
 =?utf-8?B?S0NHb3JmSFYwNWxpOW1GMTlDaXZrWFZHV0VSYlQzZTRzR2tadjltV1FBazRh?=
 =?utf-8?B?VThYRHlsa1FkQUMzRTdmTmNWTEhURlZoK0Y0MWpTUjNnazhiK282K0t0Qys5?=
 =?utf-8?B?dndKbG5NMGhqSVgwVzB5Sm9wOEN0aFE1VTUxbXdQNW53NzgyNUNOelM3Q1lF?=
 =?utf-8?B?MjBYMU9mNDdBSWhYcmpTWFZGQk56SnQyT1dJZDZvZFA1N2hZclJJZ0JqUWRC?=
 =?utf-8?B?Y05NcDVWTGE4bWVMcnBiTlNLUi9mZjJpMkRMM1B5V2lrcnpXdDYwTHVjWHBx?=
 =?utf-8?B?dS9seU1oNEVkcVR4a2lDMWxmVElQQzZWY2wxOFJYTG1yQ0xZbGNTSnpJYVdO?=
 =?utf-8?B?NXFGR1B3bW83MnJYbDhVZ3A0V0pnbkxjR3VBVVVpUXF6VTBBSXRuOE85Z09m?=
 =?utf-8?B?czh1MTVYTlYvNjg5ZEpXSGtQcjdpbGNNQlpBRkJvNDgwM3JFd3g1YVlLWDF5?=
 =?utf-8?B?NzEwbWVWT0Y5bHI0TS9uQmNGWEt6VmxvM3lSL2ZWQmpYN1lPSjhjTElyelZP?=
 =?utf-8?B?YmthUnNVcnNScXlnek5vMXV2blJxcnJINVVHU0h6Rmd6ME55U2xnQk1KQnRh?=
 =?utf-8?B?NGFKQ2N2V1l3dCt0RnBFSVhuZUxrTk5uejNyMWxYeXlIYTM2NEVVT3hUWE5R?=
 =?utf-8?B?amdVZG95bjNPcDJDNmFLZWI5U3RYMzhuaE4wSE13WjFwMEliMmVneDIxbVhr?=
 =?utf-8?B?ZFVwdHU0aXVlZjFDNnNJY09mL0dLWGJ1TXloaGIwZWk4M3pxL2hVb1dPME0w?=
 =?utf-8?B?akYyZEtHSUpoc1NtUS92MWxoM0xSNkdmVDFuVTdWRmlLbk9qMGZ2QVZkZEsw?=
 =?utf-8?B?akRldHRtdVhlQlRqSjdKaXV4Vnpib0cwaFM4cEhvZG9JSjU4VmRXaGlPVlFG?=
 =?utf-8?B?b3ZjcGRINFl4cEJGVnJuVHo5dTJpdnkwTlFmNnArZjcwemtKTnl0VXdxRk8v?=
 =?utf-8?Q?HvV+XOyBk//jQqyo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132bc2ce-c1cf-4874-512c-08de59bdad3f
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:52.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Geqn84Kz/zUl0bgBJj37sZju8sf60ifwkbPKeVVm++EHN8arv/wnIfV3E9+0BqTPcpo9T0hYszwgGvFZ6MaOQ==
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
	TAGGED_FROM(0.00)[bounces-5839-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-rtc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,vaisala.com:email,vaisala.com:dkim,vaisala.com:mid]
X-Rspamd-Queue-Id: A69A468092
X-Rspamd-Action: no action

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
Changes in v4:
- Do not limit building to zynqmp arch as building on other platforms
  might be needed. Implies dropping commit.
- No need for RTC_PPB to be 64 bit value, use 32 bit instead
- Link to v3: https://lore.kernel.org/r/20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com

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
Tomas Melin (5):
      rtc: zynqmp: correct frequency value
      rtc: zynqmp: check calibration max value
      rtc: zynqmp: rework read_offset
      rtc: zynqmp: rework set_offset
      rtc: zynqmp: use dynamic max and min offset ranges

 drivers/rtc/rtc-zynqmp.c | 75 ++++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 34 deletions(-)
---
base-commit: cd635e33b0113287c94021be53d2a7c61a1614e9
change-id: 20251201-zynqmp-rtc-updates-d260364cc01b

Best regards,
-- 
Tomas Melin <tomas.melin@vaisala.com>


