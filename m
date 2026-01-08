Return-Path: <linux-rtc+bounces-5708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D3D05B06
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 19:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397853028188
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 18:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D312BEC4A;
	Thu,  8 Jan 2026 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="qRlwf+iN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020082.outbound.protection.outlook.com [52.101.193.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EA2FD7D5;
	Thu,  8 Jan 2026 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767898090; cv=fail; b=QpMjwL5nzXfrxyvW4RPshmKRPeh3Iw+w4Qexw/TbaPMoD84P4BllrKJU+rjUYTvCobc7MavYMGff/d2uMYjhxTtMKlHg1kAADk8wQYpWmIqaldDF9K0/I45HjC5FQ8JxyRr54yHH1yI6LOZBOTUlWoNBKPjx+R0mAMG9bf6BKXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767898090; c=relaxed/simple;
	bh=bBsHgI0wYvBXzfB/lp6Vp+vK1BrjVTscn6f/+fQeau0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lD7/8jk5RxDG7mFg39lYGOZZCxdN9xsVu8c9IvkzZMWhLD9tgwAAc/lzbMVORehPBtofFWaZfJZjeh61M7qHxtc2kJ+vy9Y2CXdN+6rvgzPcJuYolPQ9mtLfGnTKwd9j5nVIJFnuaX9c8e8/u4yKZ1SLSgGosbUWLjuUdDFFXq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=qRlwf+iN; arc=fail smtp.client-ip=52.101.193.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xauMS6+uL++GmQcJIL4cdP8EvCSjkeDeMhIgmAsHgERYWgAnkHaGl2j4GgYtfkeHKPB7HIfqg/idKAMiod3G+8S/5fL3Zuf76HcOZ4vcHbQ2cFxqDpj+TUshTWPeTyJBXnNauDMU7N2BFlFQHaBFkN/Zx5AfHar8FJUsCeWJkc4MQzlLLKxFrYEC9am6tCJ6VXN8ZzHSR/fCa9Bg7buNnCRkO5qBNHmBmr61MxmuV9Ba1wNRG4I42HY3Zm7yz92g6tzbXdN5CjBvAkN6RCrg8xa711GzP2zCrwup1Kt5A3oHa1gGO2F9/FquPj+OZ+cF1NG8SjjGsV55YYGlJ8J5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDmNJ42jpE/juAEBtxTmIGNleKfvfNHjfXnenJhN8zI=;
 b=D1J95ix6przPfHLOKnkvhfjwd7pQBpg76NjpqcMfBxXCLo/M21/9BA8WVbasW6HHu74inxhz1v/oNDnX25UGEY2RM89m9cu5N0pigk88oU4zQI+iUKGZaxR/TP4elXJWK2PRA/ZZJvnrU3S+d2JJrVz/EnmzTmgcuwbRK9sBfMQz8BQv+RnBUwjix1JyeSG+SFOEBO1EzdHwOuucT49hb9D0DgHP0kCUiNlBE1XY5e1TFE6vKIQJTb6E5y4DW9XHxNre2eqaYZCelAtwQ28aRMmAFEyfmPtj8YMXXp/lLy3mQ/dh/a8wgjzgZ+zmjWE1eSUSsi9whO19Vvuhh3p+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDmNJ42jpE/juAEBtxTmIGNleKfvfNHjfXnenJhN8zI=;
 b=qRlwf+iNAP8bUZq2uR6RqeznCcTad8vD3xsyrjCCUxC682qmz28FlhNFZ+3gyZIY37ivyCoG7nzZiaPaz1xkPIW+FlS2TM5Lb5zDtEZDNLWrau9zb5wNSGvLBvEYz2vVHhBrqLHgwtdA5+skC0LyrlmWF+MuB3DPSohpAaMDlJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH0PR08MB7306.namprd08.prod.outlook.com (2603:10b6:610:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Thu, 8 Jan
 2026 18:48:05 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%4]) with mapi id 15.20.9520.000; Thu, 8 Jan 2026
 18:48:05 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-rtc@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	stable@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf8563: use correct of_node for output clock
Date: Thu,  8 Jan 2026 18:47:48 +0000
Message-ID: <20260108184749.3413348-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH0PR08MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: c674db2d-12a4-43bd-a1e1-08de4ee6751e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u3v7G44XoGVIC4OOIauB7+ps/LUh0ugQXqX8xzsgULxOcq5sZOUTw/9NcK1F?=
 =?us-ascii?Q?yjO1UbZcvTbeOh5qOXCioAQnw7oWuGoMG98/XIhjPwWUp9+bCADgk9tIHMnz?=
 =?us-ascii?Q?EMUcvHU1yHXRGfnVOh6cxyhoNi6crO7NOk6uN75OG9YluoGJpuTXh4+COzUJ?=
 =?us-ascii?Q?m+2bISylFzZKUWQDYuvGtltl1UfD2Y4VTQ5Xa/hK9I7/kPCDnF7BYUznKf+Q?=
 =?us-ascii?Q?1KahLD6gkYF1reEb+jg0jnraMNI0vqgpy62b5Z0lUtF8kJ9/P/7DCzdXK0p3?=
 =?us-ascii?Q?rQAqBhsmq4sRbuj7499NLhe5O6W/97CrNMvIskR0M2whGMGemUEEv0ld7jLP?=
 =?us-ascii?Q?dHnuFz2CS9AWZB/rzgMTATHv0JQks/xrNp576lSTgXQWndTk36ekoS7o3d7L?=
 =?us-ascii?Q?VhQGvdxABnyNN+yo+fptNv2i8ERTzX7v0LR8wWmpQlpTuYVZVSo1psqTq6sO?=
 =?us-ascii?Q?/NEXV5SShLpi1m5s+i3FAIoHLTML8S08rOquNS8ONNYmTKlSzYeFrcitYeVE?=
 =?us-ascii?Q?xQddGnenydfpMteQNgTYkWFWrQD2rD/o+9sSRYshLjX8n/4TGyoTSUzGvdCr?=
 =?us-ascii?Q?OH3X0+5fEdbb8A1q8uxf/3/byytozL0MnKwDs5egrW1jPXBT9sW013pAUn0+?=
 =?us-ascii?Q?759TbgTD1etw08/P2rOOhE26b4rDrzWDeXuQ+Ph0cEFmrE80SWsdSPP7KfqV?=
 =?us-ascii?Q?G9R/Dkz2zEuUpCNw0BDLdwBPEzFywha3bQnUT4ZgOSwjaXGczfMuZJHv08Il?=
 =?us-ascii?Q?skSMzDLFHyz12gG5ki1HSkuguJo8KQT9/81dUQ81nmfUs3BIZKYQDNkGdRJW?=
 =?us-ascii?Q?vI9MKfydVBvK9NvQxE36EcvNGuOL8fFzWKvoECrHaSTNfREvuvlwcG8RLlFW?=
 =?us-ascii?Q?Zq3S8Jzil6ZaK//wGsRl9i3PwCUvl+ptYCMhY96/x1WVZvm2ZlUvNeJPLTxd?=
 =?us-ascii?Q?yYWKpDmD1rxlnHAucHZoy+xNTaYPzrKL7WN/EtxarDg4Z2Mg5cktNo8kM+y/?=
 =?us-ascii?Q?s2SLvJK1y6WYn6KjvFdkQa/8cLI4YV3LBHd9QtjxS5xdUuwD7XXF06jAkqYC?=
 =?us-ascii?Q?JAVP9WArSQB+ri4T2Hfr4OaY4geeppqXAccKzvV4QKFLmnl4pYWz2HPmBdVg?=
 =?us-ascii?Q?X4DJHiVS69jgT6NRVZCGwhSdmEcMVBNKBl4nGYrP64C17rY4BcRF/aRV7SsP?=
 =?us-ascii?Q?kReox4fX8cvFntQkhGGJ4MhkNV2/kROK7fN4tMyASRcpaKDdk9Q1VKLn3DuS?=
 =?us-ascii?Q?IpCMZ0QwYCVjTFfIZh54cUiJ8Ug7M6gvagy13Wzv/XNHNwJbVjnkys6p27q9?=
 =?us-ascii?Q?ZaIeI/AaqpO/fvKRrO7RhQCvl09gophCRbbX+0KYGiBkHPZP26KlSYZiwxBW?=
 =?us-ascii?Q?z/19tvPXqQLL7PyOKU0ilkouGUYoNBSxoCv+tiaJVtvxPJpkup55Rn99KTfx?=
 =?us-ascii?Q?HgdxLQCeVT+yYsSvZquTng4ky68gDWBZbTL7FpTaE48eVykgyA+IViNLChrQ?=
 =?us-ascii?Q?Wmp/s9mmYCf0FID+1l1JQQxU9w3MZEPQxArc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/LvSeT8lEs28hvEvrFve87qa9OMb7lt/TFULyqWrLHBrn1j9hTKmycy1VLGW?=
 =?us-ascii?Q?O/91S7+VDlh9rDyPQJQpYHbgJYbz+GxTURNMVZfdweJ+rOk92ChXgFer4uqB?=
 =?us-ascii?Q?jzDGeLOGmySqgd+6eFaPfb3ggA2BE6elXnda4+OQ46xjN3nmhnsaRRNeQpbu?=
 =?us-ascii?Q?P4JOb3TQWNfGCrod1hDq1Nmym1Ijy1ab9Hb/w7nGAkcliA9BTOaGNqT/djY7?=
 =?us-ascii?Q?LwfZu0QRp3ubcFQP9W8E9O/BqlHCDyjfQqRf///4fu8pu57CPNWwe1OGTEkS?=
 =?us-ascii?Q?/1crGqIeLwEfk8FChF2VaboKLPDabzzvtBf65S4OT5kVZYgDlNgQW3LtDlo3?=
 =?us-ascii?Q?bw/v8UUC1X6TslCpu8ArpQVjXvlixl3YzDAkKUnJlOnJSeKZSyYMhOnuR/SX?=
 =?us-ascii?Q?yumHsRq4Fz+QGp1grTs2DE7u5g+e1WUhKjBWVZd1otmssFO1VUHhc/pP5Fla?=
 =?us-ascii?Q?pjsru/CQ+eHRpjH5eHQPtacvVHH2KiKBniet8mpSer0KPT8fLmyNnjrI4ByM?=
 =?us-ascii?Q?6ZhTSyC27I/rvi4Qm7Ja9s5FugZabHo6Eo/5i5zD7cd5CDPfFyPIiNWjnv9m?=
 =?us-ascii?Q?2H+lnTRYKYGGxJXht63cEKlxlVUXSBfiCh8h+fRpkAoKAwt2dRwAk8JtlKBY?=
 =?us-ascii?Q?jKWUqhYNREVEZcmznVAXLSiK6XwensCA+YKa6P5/YeutsdijGfIrWyL5wKE1?=
 =?us-ascii?Q?1+mg86bMfn0DYONEMmOyBj6mWAmHe3hgcz4fIzRA+RdizAfLUcy5/oRHGZrV?=
 =?us-ascii?Q?not1Xt2MHABrOHMc9FPo73Hn36FqgLyZZCtJtADAcQ98RG5h5HoRkMJJMNd8?=
 =?us-ascii?Q?nWS7pD/qat1bMLpQWuTFc8g3PomE44mZ9AQ7msp2r2hYLSrGBaORENqY+0kC?=
 =?us-ascii?Q?idxfAFEE1A61nTMdgA+dPIp3TwuPDFDJEzwGFnCC19N3b/5jLAibhTQCEkVk?=
 =?us-ascii?Q?bqkilWHeJUyvhGmnyKTGiooPzOEqqnl1ZwCU0FlhXbWUAbUzHmBvfCHd69vh?=
 =?us-ascii?Q?u1qUKY9DVJF2fBYNEtSVD7L22G+KvAKTQ2vTKKJ9pgQA0P5mgqeEPB7Zto6c?=
 =?us-ascii?Q?H0kgtwPO1j9Ebi1WAjD7CMTAoG4e7g5UlRoTKDive6EzyQ/UWnIiNbOW2Mkx?=
 =?us-ascii?Q?BJzMVnwq1JW8G55R/cUczyg8enLGdaSYWidUz+OkG/VH98kwnr8EBagAS0Cx?=
 =?us-ascii?Q?5NJ3gbg1AfXNrrHhviDN0n1IofGAFCUTTXIYNni4v+QGqD3LQVpOV6oJWALM?=
 =?us-ascii?Q?xi427mtZWGidbjRQ2d43yME6iPrjJnz7F9I0r8Us4pqZUAiLt4uPwr5EtRLy?=
 =?us-ascii?Q?YHL+yhreGVDWckVf9lVDE9H8RMzJophw2vItTdhSs2v1D8xPfH6NY1hmX9fh?=
 =?us-ascii?Q?Jp9Qlpuoeu5pW5Al81niDjoU+VGrne/BN6XE4Veu75w4cukKudOwCrkvbR5U?=
 =?us-ascii?Q?HeLlNEMnXHrvlfG3i3asZ9DeVgdhNtvBA3pKKSX4fdZ7ojOjvj18UNiYlqWs?=
 =?us-ascii?Q?qml7vJZ8C98R63aRfO3cjmRFuPyYBLm0aMpMGqHBRw5QqgmJbxCEbRrOQWcy?=
 =?us-ascii?Q?XkLN1za9yoVrUtXAqbEc5W0xevm9WnGszYZfpuxoXiA4rUWS1nUNBIAsAdKK?=
 =?us-ascii?Q?pfGbmT2jktNq0HBFe1HwcTIAbbJ7q8xve2jVH7q3NTVD7apJnVzD/Z/oCQiu?=
 =?us-ascii?Q?d7JmIKIPpklzLDuuyuLVtWdwguSo6iBGMtajByZYL8jJqyMG7P4JEU8X9BXd?=
 =?us-ascii?Q?eojCHSnCVPJNxCuUoi8suN/gkOtFY4s=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c674db2d-12a4-43bd-a1e1-08de4ee6751e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:48:05.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz8zz5zUdUyhoF1/etixiRrceYEJ9XJEwsGRayS8GRcZEO9wLjE59cX9c2yqGP+CLnX8PKVeC6hwGaJGLj9ltY9Uxm/AKppsXIqB9NBU9mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB7306

When switching to regmap, the i2c_client pointer was removed from struct
pcf8563 so this function switched to using the RTC device instead.  But
the RTC device is a child of the original I2C device and does not have
an associated of_node.

Reference the correct device's of_node to ensure that the output clock
can be found when referenced by other devices and so that the override
clock name is read correctly.

Cc: stable@vger.kernel.org
Fixes: 00f1bb9b8486b ("rtc: pcf8563: Switch to regmap")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 4e61011fb7a96..b281e9489df1d 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -424,7 +424,7 @@ static const struct clk_ops pcf8563_clkout_ops = {
 
 static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
 {
-	struct device_node *node = pcf8563->rtc->dev.of_node;
+	struct device_node *node = pcf8563->rtc->dev.parent->of_node;
 	struct clk_init_data init;
 	struct clk *clk;
 	int ret;
-- 
2.52.0


