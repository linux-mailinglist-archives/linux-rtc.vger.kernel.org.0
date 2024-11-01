Return-Path: <linux-rtc+bounces-2433-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099979B8E7D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 11:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4152CB227C4
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC45115B111;
	Fri,  1 Nov 2024 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Aj2xsSmz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D615A85A;
	Fri,  1 Nov 2024 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455238; cv=fail; b=CNyL1+1bAR76Fy8j7o3zKq/Y079SWh0LmnFZnCYCOTIj5GzniqfExArCF2te8kL9TDWeWTj5NY9sUvHpymq0aWLZqYxC/dHtojsP/feOtoA8mxuJwmc+mK7Sv0UAljkVO+MiNZHMYUL8mF42T4oHo5UzDmSxC9p/c3m4ElmsFCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455238; c=relaxed/simple;
	bh=SURh2ClaqPA9bturxEbvXCTp54YVoVR/tYUjYSwui6s=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DEAMj0EZYcG2e8PseQQHn5LTsYoqsez2Mw+wPgkmKlSRHimODr5Z4C+n72QloC+w4Yj8WJYqfiDm79osY3hQFBxOIRY1aItswxk3BAEVXE5xUFVqWM0lZZSFMsNR6modMb6FaaarjLUR36sg9TGRgHNxKIzTVZbMtj6x0zpXMcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Aj2xsSmz; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9ArM6YZmYZ5r35goi7L+ZxtHssU7ZjMu1lnpnqQI8CRoFPCSd1G6hmWUpupD+mmvKNPBpm8BXOyOW6OEWZmjL8kLkR5HAggC0EHWtmBpqg44rrhqKXAbcrjmfWvHpdB/ruPKxnqr+/XyzJC1PqgQclbHdZpYhMnvoUDKMHZnuQdxgW8tos1FW/ZBd9Sg1OTtTrWwGE4ZQO9+FQPeug7VakKcw0rQZMEv3JzkTXEiWiZAfF2Aa55jQKDwd7NvD7CGZ6x6LhABmwQB/qpma3Wfr0nKcTgD/XL3Yaq9KnKcIJdNPpi1zifoVRuOqIT717T03XJt3ba45SlEkFMyHJxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOGkNa2NodZXglslbSG/vK4ntaxJ8cbMGZ+qAk4Bvgg=;
 b=IwpkIs76eWDae5tFmiESRTvSfll8EJySOX+yWquPJUQ7/RcBZuubn08gR7L36k0ZHMEY8Se1WflREkvHeKdwAYXtC1vKXYOipJKdYAWZwwemt7LZyctvYoMCYbqxb7o/IRyoQEnMN9hozbZO5eZfmdODfluhJnZm/wlY96ip4UrMjIPdcTKPPmiT1PTHPbP+x+uXo/8f1OXvYZiEFibrAgISKv2pw2dNh4py+V1imzHsfUvOpeuUzmUIJZYxCJ8rOqLm+3PAf+Z+5BDIFzHBsSIyKx27uFyg6W6qAB75jYf10IKnhfu9fVeNIt1SYCNTJPOMm4w06K3+qPsogh5emA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOGkNa2NodZXglslbSG/vK4ntaxJ8cbMGZ+qAk4Bvgg=;
 b=Aj2xsSmzmJRbZgOBCRVjCJSlxody4/QW9F0w8pyMPhpZUrOUWGE4Yw4BNrEkQqvz05+I4HrGvRrfta82I6CW3W9lERDZ3Sjk/iD74avxdsTuWfjTtge0q8y+JT+sAYRd7v+1vcARTRi5k7dByP+uU8FWSLNPoruEiVQWEunj+TlIbxMYt6TPvydlXYiGnPeTXEm74RV9D3v3B0K+OyqeQzU9Q0kDNwVd8GMEMXQJ7CM/Z3ImnG1srPBBX4fGCi4Ypx5G+jyYSppoRsw+X+jZjE4uwYpXI4gvoFAjpFn4Barjzet9peSdRzr9f9s80Ngsj4ivWAc+ca8cB+JislZybA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7693.eurprd04.prod.outlook.com (2603:10a6:102:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 10:00:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 10:00:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: bbnsm: add remove hook
Date: Fri,  1 Nov 2024 18:10:32 +0800
Message-Id: <20241101101032.1446992-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f07efd-8a56-43fe-28b8-08dcfa5c03f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K1sYJ9AX1DjBrj95r8IpW9E44tdCV/mx/5Yt0nWpg83bi7Y7AS/6YI9Xy/Ow?=
 =?us-ascii?Q?fHARV/0Vo1tHcUrk8c0/5mQxUe0OTDmVlh2cE6txbsiictvMvRc6JtD4/8OC?=
 =?us-ascii?Q?f6ZajhMEiOuVSBIFdedu9E6syfpdXXAX0YdNvzla2KqOnU9rBk3Dz5HIEXIa?=
 =?us-ascii?Q?MhV3r5zqqWNlUROfz5seVOhCFTrO0KWisGck9QxrV/bj2/+tc/05A50Nzx2t?=
 =?us-ascii?Q?rLs5WURcucIOtEMSJ0GEqcFwxZRR/t4781I1n/HTf4PX8t1wDQHb+m7SZZDN?=
 =?us-ascii?Q?JbvGSGDk/RyTnBSFr30H0z+LkIyS/MZUNLZJG87wtK3nKX5XIF0xq4ee26Mt?=
 =?us-ascii?Q?fIo1UvXjCNypihp/YacQhMP91DnfsnRWN66Uz+CFFJB7REX5f/HHvr9XozM5?=
 =?us-ascii?Q?fUiPKUbObG34VSVc/tX00HAcYLUqY8tjvwc5BY2rWfR3wBcKtbC4FkuOXN3w?=
 =?us-ascii?Q?gp6VkZTQYTo1nc4oKYY0Arzn45AGf9c99LGoc/4yEkgttA5p5dCzRd8CYItk?=
 =?us-ascii?Q?EfE/OjwANm7NQ4xQlpazeJszrgQpDMAZDWLiMep4KOidob9ys0eFWVyrJESg?=
 =?us-ascii?Q?7nEaZIET0eCpQUOoh9Au88sWOfYQsHK6i2KlDaLySPHJZo4Wz35jk2JH87UE?=
 =?us-ascii?Q?BHlWzscSwjyMCHu4mgO80Q5dlInS5xwIybTQF66GSGdNQpMow3oLKzzS0ttP?=
 =?us-ascii?Q?TqZH48bJXWBHavMrFHgXpiSiMtwzZhCWS5G/Vixc/d5NKsPgwS96lsjgeQ5g?=
 =?us-ascii?Q?A/xnf5hNQSLB3rfUxG5aHQfiOZdyglFtmlfMxfvr4YVI9nSVZ0rKsZnqlbgR?=
 =?us-ascii?Q?u6gTe3BnM/dNAAyVzlZmJ1OGzS5tRI8V2VuSxil6BOezhPSOjJajdIDoBNMm?=
 =?us-ascii?Q?yNq7h3xVLvVShXUhK74B0HR4AOR9P46FH7c6WEl436amkwEmTxEENGg1k/KH?=
 =?us-ascii?Q?CxBbf5Jkug1QOVPWxGYCFf9NpLAt18sMkK+HJeC3F6dsMMQE7emVOSLJgW3i?=
 =?us-ascii?Q?4EQeddg1Ta7zunyAs9TDTUP86JeKTMpC19QgQv5sf7l8eBiiNUK4jtN+i1qy?=
 =?us-ascii?Q?tIZQ4JBnXZtn7HI5WTYy0TiBW8KlR5Y2hVLNOY7HRIR9yKb4c6Rr2UkQ+buH?=
 =?us-ascii?Q?tfsXS0cOcCz9sCooOWgijEI2SzAA7PNHM8KnvwDUjXzEz0WYy8bKPxAEmbmC?=
 =?us-ascii?Q?XPhE4Ok6uDbY8VqiBuTfypaKa/IHFiV/8BDDcIlersbb7uMk9J6VbEFrP0UY?=
 =?us-ascii?Q?nqy3cu+i4JcuNEbesYPaNHEmqmJKrBeGBeAyTSOA434rkmoZePdQRuA092Ud?=
 =?us-ascii?Q?DZl3B8dSi1SdXi/F65kNNCQ0OS7Bpmxq7Z8Q+LLcHf1gye3xy6qxs0KIUf7i?=
 =?us-ascii?Q?qx6jk3o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GtAGST4iaDdlVEW2nYWzElDz8RLNXR1XjC2KIou94z6WLamkfrQy3nKqclLP?=
 =?us-ascii?Q?2mE0wlPHXX8JWrv8YwF94fRTXJ7jSz6e13wGNtKXiutoQBL2tEbDZahZbqLe?=
 =?us-ascii?Q?LxTqYvdfI73eeZpnbXxsTCkbvfnawvCnHJwOfNbB0e+u2T4m66W6GEqu4cB8?=
 =?us-ascii?Q?0hJhphlTM+EWp1D5D5F2hKE3zx9E3BFABbi7F0q9jlLD8tnoa0EMzG9+j+dA?=
 =?us-ascii?Q?oH4oTZlAWnDxJX1U7Cusf2arSKUEiU5TcELVHCswolHkPnQvTrkS/qZKiao1?=
 =?us-ascii?Q?RwQucj8u/a1T+wPPoRidzENxgxSyC3oUWGlQHV9RFfGMW0S++OSgT7kUXwKv?=
 =?us-ascii?Q?SsHhkcL9VMBHbYEJArPGAbls9KU+5bHgNAbCdJa5BvUM4flxbANXXBoMkpVV?=
 =?us-ascii?Q?yBHmls5F/5F44ZsL5mDAMCDHbzr1MU6gf6f4j3D4Sr0nM1x0Im2mbL2/xkaY?=
 =?us-ascii?Q?Yb1WaA2qFTTLWjD705ZYOhsrdgWx0jBQIAUhoAXp7JNZ5ja/j6XyrFGKZd35?=
 =?us-ascii?Q?V/Lqrrtbd6+GCBsOmgdJ9y8KMow9Z3gQQS3Y7fKixfhcoTcMRz3t/ggPYvqG?=
 =?us-ascii?Q?66SDcsdLoB7u2SFn0dblmEmQORVwMWgkuCVsjYYukxNqK4FO7JWbzcIG+MGh?=
 =?us-ascii?Q?EUHIVHh19VZwlh5EQd3dzmeCyczg5HDH7+9qR7T9H5BHT9v8RNMPaQo9Go4+?=
 =?us-ascii?Q?a7Bd+diMa5rFaLv2mO6gZ3+CJ/owxCotlFpuUbt/xDsk1xtkmrOegJqjjHcZ?=
 =?us-ascii?Q?/fG58KbT3qOR/j1uiIqF30EfFyjpfz5ZzE75pqPVeys7ooDzywcDNwHwvfxH?=
 =?us-ascii?Q?s8uluhCVyqsXURjlBU0tqiCZCm5T3mihn1QkPwCQC1xFxLY6HswrVai+BIt8?=
 =?us-ascii?Q?6keDV4kaM8ly9kiDR7YUnHlyEt7jhF5/LZGR2SJ1kIWMI4lpaKCq3FHPEjbF?=
 =?us-ascii?Q?R7HEa49a2qB/cmOLx1BwEV/o6TRNMIhcV2VARKLqOxVjssIExmpyWOsTTDKP?=
 =?us-ascii?Q?KAe2mrrjVQKbS4p2dFWARoCp0FexTqHkgL95lTsuHztujfVwkrWmpWyOvwc5?=
 =?us-ascii?Q?nMsXpUS2a5S07Vbtafk2xkG9wLDOi14hoKAvp1LiWzPrKwgj2XkxWNgvmIXm?=
 =?us-ascii?Q?ATVEugKUYp8GeWLo0f0MN3qQceKXNZRJ0sdl3QC1uF7U08L5gKHGCIufJCFE?=
 =?us-ascii?Q?tZ2gQjTMlre2WpOGhg9AsBegUhHyp7FZ4XzM5tt1IXFGVM55738PyA+vqqSm?=
 =?us-ascii?Q?sJK1CjMBUrHCpK+pUknTRPS35t2Nr9T/AiP8PU396hQ/Vbfsdp3dbAh5Da/A?=
 =?us-ascii?Q?89pM1WyId1Q0dbcO06hBe4a04EpeHQCshBgkOsA0w1Gtt4sOloIL1a6Sspvm?=
 =?us-ascii?Q?zj7MCg9U5Qn6Bby2rGmxf94mogcAr40jDiVYuqFbwSj0VwkyFA2vmwANd529?=
 =?us-ascii?Q?P+YFiJoSvWYVwqvKlFA85CTc8qTtsz2L4J8mOSBLtG0P0uKbA0B5oWrQL/es?=
 =?us-ascii?Q?4CPkGy27WQddOUqZN6FKz1rjWJKzl4HzcVtKvEsATzBXduW45H1pVbf1Syw+?=
 =?us-ascii?Q?bq+tSl4dsi3VYZU51uTF88guTAi9VwhQpblMUYxx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f07efd-8a56-43fe-28b8-08dcfa5c03f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 10:00:30.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9l9qejUsLrpOHxVQrQVSWIOjvtsBORmOCaIy5igGiOg84mN+4l11BIb2YIKLsjbiVSJwdMbU3CmGm5A2voUK9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7693

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-nxp-bbnsm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index acbfbeb8b070..fa88fd8ffadf 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -206,6 +206,12 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(bbnsm->rtc);
 }
 
+static void bbnsm_rtc_remove(struct platform_device *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+}
+
 static const struct of_device_id bbnsm_dt_ids[] = {
 	{ .compatible = "nxp,imx93-bbnsm-rtc" },
 	{ /* sentinel */ },
@@ -218,6 +224,7 @@ static struct platform_driver bbnsm_rtc_driver = {
 		.of_match_table = bbnsm_dt_ids,
 	},
 	.probe = bbnsm_rtc_probe,
+	.remove_new = bbnsm_rtc_remove,
 };
 module_platform_driver(bbnsm_rtc_driver);
 
-- 
2.37.1


