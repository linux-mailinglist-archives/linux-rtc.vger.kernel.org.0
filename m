Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3FC67FD47
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 08:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjA2HHf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Jan 2023 02:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbjA2HHc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Jan 2023 02:07:32 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED483227BD;
        Sat, 28 Jan 2023 23:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOUIVAOxTcyBCgmg55CgiURkhrtIR/cwVVMu0wFmZfHTbR8y8WaC8BWLFUF5CaGQiHuIDEx5A+tuMzPzf3//ktjRPveqxq0MsAI5WLUg92iLPybZzCia12Tz76ysva8FjZre8zlyXQG3Ynl2YOIzv/YW+5EUQs9EEbQrmPVPKI4ZwpCR0Oa34lslZcJrpHqducHZjGgtSr3/haxhbONYtTN1tvNE8zDTmpCJr7IZeo8+9ealSwojMJGbmOAM8LfeHefPriJ5C0LCQkApABmt/cEJtmA0ENd+80Kqdq3z4scd990aBVeRsgOHCBQ3OPUlX+Yz0imPzzLsIcdoa9mV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM4isGeqmeO40sDjUlLM9GRjsoAHEu9VahTS+rmDxLI=;
 b=A/lRfyXu0MWrO7HTFfeBF8SOrw7ZaExO+DXMAkjbM60ir7Vzm7e+1Hnmk09eF9qD3FH7X565Ul1QFzBaoNX/qys+JChxppP5XtSRqnMt5pNwGINiMr47Zk82lQVEZbwVT+xvt/+/lgZCQ+A3LUwy/ZrQvPTJ6BCblwuEa/v+O8BwqWDPI6zI40u7kPEeOkHcfhce7VF7EZLXjsf3KtZGj0RoHZwMDiUiZuydlBj0SS7JUkDqLlDpHzIqMrMt/7lmBaTyeOW8i4iF5Vq/OAGVMsOZXX+0qnrtpnfb69FoYu+pNbB2wlL1Zm/cFw2f0RfeBqnNtiB2Wy62Y5t6UwaVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM4isGeqmeO40sDjUlLM9GRjsoAHEu9VahTS+rmDxLI=;
 b=gn7mA0XmOtQ9CJ2E6WUV3OVsgnYGav+CLDgsGuqhT4Z8GPDKdFHWpG6/Sw95LRXrlSHxNxCNhuRy7zGoUO6TfEKalM3SSRULhIpBlvN6XpLFH20HU0c0POtsrMxEy+yGgpCOtnVt+sNl/En9L8C/WbeO6RK/KStNdU23GUvG/mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 07:07:27 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c%3]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 07:07:27 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v4 3/4] rtc: bbnsm: Add the bbnsm rtc support
Date:   Sun, 29 Jan 2023 15:08:22 +0800
Message-Id: <20230129070823.1945489-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230129070823.1945489-1-ping.bai@nxp.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|PAXPR04MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: f2666365-6b4d-4906-bdb1-08db01c77ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYhWAm0zfeeXrjb850cxlhwjDwFfULbcs2Ydd1jjV9HkDLqNhkprrmNOTl1+lQdK0aMK5Iv8l+R8w+bdXXVSVVb1adYHSspeMe4F3numAAUDATi5H8d/0945VioGZzstYWJkM6ROKPdwldR5UJaah//zqqSADuQOVgNz8WINjXhsltrqL73kpo7DTK6t9hidnTBxECWu5K0d13yfA5EFsvQR/8o9G5VNd1Oc/NFDcO6eeiDhVCPauRMtJnpYL1d/aHSG3o77UVR64yZClpQsvlwfO4TlyIqzzWebyi/cQpYEOV2NL8RGIdSqM6ZFAIaCEbz/3p1JyC4x3xVDAihCg47pqByQ+yhNv67OJ4qdwO1amAIau0Dt9yvZ8XYO+byxE9YMRn9o26/8cT6wjZJcZOAtL9mI/rVNf08Kotaplfyv2+9FHBKg8zxCPpMCMGDHO8lx7k+I7SGxpw8hqnl0tneRHSMew1F/tjrAeJbLHqVrgjREp7PB2Qh2oFGoMJCQlR7ELH9vbH6UR3sIkGaQmMrffFrWed3g0pz+1FcfKTCVjuUfynXVt0RqIgZ2vxgbN2zgkxsenXcR4cU9pElzfdmdUMcywYqXWL9F/sUe8AB7ztDE79+NtbEmjVsrjUDmc4b2rN8O2v2tMDvp8Su/++FFfdO8H5v3d+BzVMSlS/OsWuqdsaMsYTwyMjHcjLRVaBY07YXvP3DV1JHPxPxC8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(2906002)(36756003)(52116002)(6666004)(7416002)(478600001)(6486002)(38350700002)(86362001)(38100700002)(41300700001)(2616005)(1076003)(6506007)(66476007)(8676002)(66556008)(4326008)(66946007)(316002)(8936002)(5660300002)(26005)(186003)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Fv+MgTYoYeJRz4LhJuZ0V4S109cCDX3ljfpT+4wsWy/25FRVRzMFLK9KvUf?=
 =?us-ascii?Q?izkdWKjGD4eDCz9TF8T5zjr39MLqaIWgpepyxibBW5VqbskVR6UWYhTrD+lf?=
 =?us-ascii?Q?2RPTe2QGgg+cCdmXzJ9bfjjzP7DOnFf9zFWzHwxF0zh9mi7zjklkqYA4U/x4?=
 =?us-ascii?Q?0BMg+9wI/ExME4XsuEP31SBEmgMBim8wH/aZm/ybEi9gqqH2RIs+h5S519ie?=
 =?us-ascii?Q?zKwuFq5NjsFMBJAkMdFZQvp5YKa+HAHGLrSC7hpoX0qpVNnpjuV3HH8s1Uwq?=
 =?us-ascii?Q?nrSlk3TZPmCquuv0tY6BD89XfMg06bAXXDEGeeGeFJevk5JUS1WJ51AMDrnO?=
 =?us-ascii?Q?4//bi1dJSKMFuJZcaRFtRzNzihqd7oUTE9A0cAn47Cn0Gpk2Y+Edb1eQEJzL?=
 =?us-ascii?Q?gYIID8m7dNH2yOTyEdQ/bFlorb1eBE97KH6fRcTkk3r8VpMXzeA+mbz6e1Tv?=
 =?us-ascii?Q?0H4F4v2flVouD2/nGwWE3T1AQ+YatLjy7LgkjZXOVWh4dtZ+6kQawSkwnY4F?=
 =?us-ascii?Q?pu2BKSuasNNCc1kZ5f69hq9b9CeNWC2K3dz5igKcGlB8hmuosHuAqU3pKVBN?=
 =?us-ascii?Q?5I+EbxGR5F+L9e6ttFdjfXpAfl/Re1IXFssr9DZC0O2YSU83/Ql8pkpNVC5w?=
 =?us-ascii?Q?FXET5KnvF5l5BxiWBwlKb7/KmYU/b1rhOamBbqoTS6witu5t5SB54wIrJHE6?=
 =?us-ascii?Q?emeLFVPk8n82Q5SFekM3XiPoiZ9gSuG+JTP2b5eF8nM2+E9qbsLf2+msEHlv?=
 =?us-ascii?Q?ApP58ThlVocz95y+1kMPKHI6Cg2iFmbKcH8kjDJo9KMNkwWFwPcIv5q+zn5a?=
 =?us-ascii?Q?RuglgIEJIyGsBWgovPtPO1F6slpjB5BXi/FkpTr1nBTDn+jrN95nrfYyz25m?=
 =?us-ascii?Q?SIJwcQEbwAti9Zmlo4zT06E1rJxLATDGaytC/WrfCZvBemiV2OBJpb4zipeH?=
 =?us-ascii?Q?l0C/IG3nvzAIp5pnh6Vksq/+15FjecoNXDlGZcKEYdaafgN8NVZmYhMBRCiM?=
 =?us-ascii?Q?ndGzuXASlV2MqZxmTlQ6sa3/QQLuZxtazm9zAJyPG0yMmgtKmJn3IVtbda6n?=
 =?us-ascii?Q?5Hem7KGv2B5E+P+ciFqVoxq5HuoCdGRQHXZhGmnpgWgFp2KF+j3CPGmZV6/y?=
 =?us-ascii?Q?hG1xOCnG9tBJ57W/Hajwut4WiqTw+LwyI2fvWrzGv1eIhZyIvF9VEh2BSnCI?=
 =?us-ascii?Q?qvxT2PA85bbMSps6YNRsKnIzGSKuY0KCKamiw5jbDYeBFvs/+sHafFmauCkG?=
 =?us-ascii?Q?5/5cfbIy3GT1Dn9dzzTQIxH2wg6fFf+Z90/TK19iGMKWvHPJTsWTua3Piozs?=
 =?us-ascii?Q?/dRUBMO0HN2xcOYvwF++9IKjqX2mNhsFhlt7nJStPmGa328xDdhEAfYrq4NT?=
 =?us-ascii?Q?bxuoSxYRNfZCYG0yP1pkPlSZmpVW8aDJpLYX7c0w08/rM3v5VC/m1TXN22+u?=
 =?us-ascii?Q?+dpH7zKE6FNb6ETCtFu+3+vpcT2gKgoxXDRGBVfT5fi4DSJZ9xvd8NG2EGyu?=
 =?us-ascii?Q?2AMwximcskBahPhQ4P9w+dQYYe56winaeY6RMjov763k/ttVE7LMFsXcLxgr?=
 =?us-ascii?Q?IndGnIUrYXa6imys06suRcnjnvyvRrUQETAI/rpU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2666365-6b4d-4906-bdb1-08db01c77ac3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:07:27.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/DZ5I+pGFS2Bx7aw+hRlShECBlgiKvD57rOuJ1mw/g+bwp1MGPNHnwgFWgNFVkhbMiaUnB+59iGRz1KFLNOJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The BBNSM module includes a real time counter with alarm.
Add a RTC driver for this function.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
  - v2 changes:
    - sort the header file alphabetically
    - rename the file to add 'nxp' prefix
    - refine bbnsm_rtc_irq_handler function, remove the unnecessary
      event variable
    - add rtc enable check in .read_time, remove rtc enable in probe function
    - remove unnecessary dev_err log in probe function

  - v3 changes:
    - get the regmap directly from parent node
    - remove unnecessary dev_err log print

  - v4 changes:
    - update the compatible string to align with binding file
---
 drivers/rtc/Kconfig         |  12 ++
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c | 226 ++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 677d2601d305..1b9e8395d118 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1786,6 +1786,18 @@ config RTC_DRV_SNVS
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-snvs".
 
+config RTC_DRV_BBNSM
+	tristate "NXP BBNSM RTC support"
+	select REGMAP_MMIO
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	help
+	   If you say yes here you get support for the NXP BBNSM RTC module.
+
+	   This driver can also be built as a module, if so, the module
+	   will be called "rtc-bbnsm".
+
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index d3c042dcbc73..0f11027a7388 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_RTC_DRV_ASPEED)	+= rtc-aspeed.o
 obj-$(CONFIG_RTC_DRV_AT91RM9200)+= rtc-at91rm9200.o
 obj-$(CONFIG_RTC_DRV_AT91SAM9)	+= rtc-at91sam9.o
 obj-$(CONFIG_RTC_DRV_AU1XXX)	+= rtc-au1xxx.o
+obj-$(CONFIG_RTC_DRV_BBNSM)	+= rtc-nxp-bbnsm.o
 obj-$(CONFIG_RTC_DRV_BD70528)	+= rtc-bd70528.o
 obj-$(CONFIG_RTC_DRV_BQ32K)	+= rtc-bq32k.o
 obj-$(CONFIG_RTC_DRV_BQ4802)	+= rtc-bq4802.o
diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
new file mode 100644
index 000000000000..1009388b635e
--- /dev/null
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2022 NXP.
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define BBNSM_CTRL	0x8
+#define BBNSM_INT_EN	0x10
+#define BBNSM_EVENTS	0x14
+#define BBNSM_RTC_LS	0x40
+#define BBNSM_RTC_MS	0x44
+#define BBNSM_TA	0x50
+
+#define RTC_EN		0x2
+#define RTC_EN_MSK	0x3
+#define TA_EN		(0x2 << 2)
+#define TA_DIS		(0x1 << 2)
+#define TA_EN_MSK	(0x3 << 2)
+#define RTC_INT_EN	0x2
+#define TA_INT_EN	(0x2 << 2)
+
+#define BBNSM_EVENT_TA	(0x2 << 2)
+
+#define CNTR_TO_SECS_SH	15
+
+struct bbnsm_rtc {
+	struct rtc_device *rtc;
+	struct regmap *regmap;
+	int irq;
+	struct clk *clk;
+};
+
+static u32 bbnsm_read_counter(struct bbnsm_rtc *bbnsm)
+{
+	u32 rtc_msb, rtc_lsb;
+	unsigned int timeout = 100;
+	u32 time;
+	u32 tmp = 0;
+
+	do {
+		time = tmp;
+		/* read the msb */
+		regmap_read(bbnsm->regmap, BBNSM_RTC_MS, &rtc_msb);
+		/* read the lsb */
+		regmap_read(bbnsm->regmap, BBNSM_RTC_LS, &rtc_lsb);
+		/* convert to seconds */
+		tmp = (rtc_msb << 17) | (rtc_lsb >> 15);
+	} while (tmp != time && --timeout);
+
+	return time;
+}
+
+static int bbnsm_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
+	unsigned long time;
+	u32 val;
+
+	regmap_read(bbnsm->regmap, BBNSM_CTRL, &val);
+	if ((val & RTC_EN_MSK) != RTC_EN)
+		return -EINVAL;
+
+	time = bbnsm_read_counter(bbnsm);
+	rtc_time64_to_tm(time, tm);
+
+	return 0;
+}
+
+static int bbnsm_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
+	unsigned long time = rtc_tm_to_time64(tm);
+
+	/* disable the RTC first */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, 0);
+
+	/* write the 32bit sec time to 47 bit timer counter, leaving 15 LSBs blank */
+	regmap_write(bbnsm->regmap, BBNSM_RTC_LS, time << CNTR_TO_SECS_SH);
+	regmap_write(bbnsm->regmap, BBNSM_RTC_MS, time >> (32 - CNTR_TO_SECS_SH));
+
+	/* Enable the RTC again */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
+
+	return 0;
+}
+
+static int bbnsm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
+	u32 bbnsm_events, bbnsm_ta;
+
+	regmap_read(bbnsm->regmap, BBNSM_TA, &bbnsm_ta);
+	rtc_time64_to_tm(bbnsm_ta, &alrm->time);
+
+	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &bbnsm_events);
+	alrm->pending = (bbnsm_events & BBNSM_EVENT_TA) ? 1 : 0;
+
+	return 0;
+}
+
+static int bbnsm_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
+
+	/* enable the alarm event */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, TA_EN_MSK, enable ? TA_EN : TA_DIS);
+	/* enable the alarm interrupt */
+	regmap_update_bits(bbnsm->regmap, BBNSM_INT_EN, TA_EN_MSK, enable ? TA_EN : TA_DIS);
+
+	return 0;
+}
+
+static int bbnsm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct bbnsm_rtc *bbnsm = dev_get_drvdata(dev);
+	unsigned long time = rtc_tm_to_time64(&alrm->time);
+
+	/* disable the alarm */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, TA_EN, TA_EN);
+
+	/* write the seconds to TA */
+	regmap_write(bbnsm->regmap, BBNSM_TA, time);
+
+	return bbnsm_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+static const struct rtc_class_ops bbnsm_rtc_ops = {
+	.read_time = bbnsm_rtc_read_time,
+	.set_time = bbnsm_rtc_set_time,
+	.read_alarm = bbnsm_rtc_read_alarm,
+	.set_alarm = bbnsm_rtc_set_alarm,
+	.alarm_irq_enable = bbnsm_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t bbnsm_rtc_irq_handler(int irq, void *dev_id)
+{
+	struct device *dev = dev_id;
+	struct bbnsm_rtc  *bbnsm = dev_get_drvdata(dev);
+	u32 val;
+
+	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &val);
+	if (val & BBNSM_EVENT_TA) {
+		bbnsm_rtc_alarm_irq_enable(dev, false);
+		/* clear the alarm event */
+		regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, TA_EN_MSK, BBNSM_EVENT_TA);
+		rtc_update_irq(bbnsm->rtc, 1, RTC_AF | RTC_IRQF);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int bbnsm_rtc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct bbnsm_rtc *bbnsm;
+	int ret;
+
+	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(bbnsm->rtc))
+		return PTR_ERR(bbnsm->rtc);
+
+	bbnsm->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(bbnsm->regmap)) {
+		dev_dbg(&pdev->dev, "bbnsm get regmap failed\n");
+		return PTR_ERR(bbnsm->regmap);
+	}
+
+	bbnsm->irq = platform_get_irq(pdev, 0);
+	if (bbnsm->irq < 0)
+		return bbnsm->irq;
+
+	platform_set_drvdata(pdev, bbnsm);
+
+	/* clear all the pending events */
+	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
+
+	device_init_wakeup(&pdev->dev, true);
+	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+
+	ret = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_rtc_irq_handler,
+			IRQF_SHARED, "rtc alarm", &pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
+			bbnsm->irq, ret);
+		return ret;
+	}
+
+	bbnsm->rtc->ops = &bbnsm_rtc_ops;
+	bbnsm->rtc->range_max = U32_MAX;
+
+	return devm_rtc_register_device(bbnsm->rtc);
+}
+
+static const struct of_device_id bbnsm_dt_ids[] = {
+	{ .compatible = "nxp,imx93-bbnsm-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, bbnsm_dt_ids);
+
+static struct platform_driver bbnsm_rtc_driver = {
+	.driver = {
+		.name = "bbnsm_rtc",
+		.of_match_table = bbnsm_dt_ids,
+	},
+	.probe = bbnsm_rtc_probe,
+};
+module_platform_driver(bbnsm_rtc_driver);
+
+MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
+MODULE_DESCRIPTION("NXP BBNSM RTC Driver");
+MODULE_LICENSE("GPL");
-- 
2.37.1

