Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122BC697475
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Feb 2023 03:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbjBOCkK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Feb 2023 21:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBOCkI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Feb 2023 21:40:08 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D87527D7F;
        Tue, 14 Feb 2023 18:40:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2MQGQib/WxsxMqvOh/itCuQReN3Jcpj12EWn1IAYepESVhtrgvfz1S1yM5whF+f4J69ZBGgqCluIYGORSRhuf2CtbmjfIvQ2UL3LfV4nhZYAHoOZd5n6z+jwu7xXpWLmIvTy7eBs/FYJRWcM5pnKSyuE3iZ3dMDl3EWYfEyxVbmnFCO6kdGdC2oAs2O6g/7Cqej24+vCdVWv1tsyc4hC1OgfwylKJwvUBqYk+P+hA55dSBhXm+IVBhQ71pRZi/FNCKBzqlWwhYJ5uU+8qBaV0jdQINaiVfbbPBv/gA3ls0wR2u6NKkUJpk5RSa0bU0QM46PVSgofKJu2MFlOtY8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHLnuvufeLEiR8ZNb/p3qZoiysEvRUMqO4eeZE3I8MM=;
 b=QXIh918xYQiAgbABB6vtpHAt0agdgsPMIO2nVd0vYpZEXYMsL/p1s/MJAdUTNTooe/S0b/TwQbS5UTy/vuIn4mWAiVfVtR/HdO0N6FA16x9uExT4PxBJjEhY7l7zODCzRkpfYG2CwuxNu8/GvFp7FTFlOv872OPwtxkXZYo+J0aUQqM3Z4eI6OV3cfEc/RjzRUfG9R2dUqPIiCaMQ3d/9KxaJjYkgM4el1qUdjWUK+2PTMN9kTHkureVZrexanPI5wDSVn6MD1VNxe+SFzdTUDvt/1VbgFeG2qgxjqndIqViVvkkidMXLx8nOEzw5Fp6lbpWeE4L5VDXzW7yWhcNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHLnuvufeLEiR8ZNb/p3qZoiysEvRUMqO4eeZE3I8MM=;
 b=L3FunGHOHbXrhQvfOb4oshNzBuvgDse9NUc4E4HOcmrXbrFt8nFe/7+LXNhaSkg4Gg8NmDVW7zHQOX9VWVSr3D2EbKo976jRIHxV/WDn0rghj/l/YfdwBW225RkneJKYX25RNDew9QGhRCvLD+7WngxRacRQABw2OIFoIkezK1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 02:40:03 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:40:03 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
Date:   Wed, 15 Feb 2023 10:41:16 +0800
Message-Id: <20230215024117.3357341-3-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215024117.3357341-1-ping.bai@nxp.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: db59e998-c040-496a-6969-08db0efdf0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tboYd+VRLLTZufY35iGTy142+EngmEUuTrZrOogYUEjA4XDDuI16TkxL6sWPSdaBvq5Chn5J/KCGNvTsAiMyKfokQ6eunpoBK6oj11XD9vUJ7s7M2HZ/WV5VTPZcYVrmLo2crty9jk70Yb4XpaivX9gN/WefjvRlSTAID++8uCyUBORH6AIOH6WoVcGKSXVgF7bWRJygWTyps94OYApNYM9gCZaHw3f5sw2F/i2xMDUqhz/fPssqW3uL6ZAg17i5XvnMPqP6HxfOKpaztsi1cNMVX/6nAGYcfeNd6wvy6TrWzRo4kjs/9pEQlCNfZ/O91Em8q1VqK08oRyLzOmnGgI6eIHRyCtcDggFMvWSYtFGkpq7kl01TY5Vfrds6Nq6KLPw0rj8perVA8nHA0N9U2i2PejNpYSHqDsHGMEITu2qhPqaUJENhk3a7ySUv/osHtuYwnbBWOGacnc7vSo5HgyCb8BIEBmYz7c7mwszyFuA2QEeRwH2VllFygx1e+nhuJeblZbLx1du5wJIzJ0ItaQIMZorlgIsrHiXy1lb8v3tmPouJERCWCNHPomv8PinnS0854EtE0BC3jroY3QuvPqY08ODm3VdKNmXsJunUoM7LQ4wm32Ls++LopGySwIh032cCtRKU0AbhaQkLxyGPcBfmGG7gLUpjDR9K5lVQ/BRz/u9zDufzzvxRlVJl6z6S082Wxd4KpVoDH8wWzvTiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(38100700002)(38350700002)(1076003)(6506007)(6666004)(36756003)(52116002)(316002)(7416002)(5660300002)(6486002)(478600001)(6512007)(26005)(186003)(83380400001)(2616005)(66556008)(66946007)(66476007)(8936002)(2906002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbiHrZSQGqtWW4RIjxQF20tKzx+3rQZDwse75GCLbSK+xAYgQr0swK00RGKW?=
 =?us-ascii?Q?LnaoYbWrzhBJAL8TXE1+FmP1Nu3N4XK1J3dur05yWIf4OsTQypIDOdmZjdTB?=
 =?us-ascii?Q?+RA/2MLzHG8NYob5zbtafuiZMNk7HNJy0IgnggjJkJ0+pp1fl63XikMKQpne?=
 =?us-ascii?Q?wqzQ80igUY/5wlzBTHLfqRxHYiDdYrlku5iLSkQnLZf/gfwbQwYiwPsgWRdN?=
 =?us-ascii?Q?kowIqLfSujhErlHqcvbz0lPzLkltEH//xgplVxAsJg92ZVevLDV6UJoYo374?=
 =?us-ascii?Q?AGBs5eRAfNAHbQ3aCsyi/l1kRy01ZhAtcBhxghVITbzTTijz0D0skGEJpg1o?=
 =?us-ascii?Q?PBAqXQ1+MvNUfBc+b6GhVjBSU1LxX+/0iK9e0estxXCLwtM4VxepQdH82fCX?=
 =?us-ascii?Q?HZF82llA7nOSN1yuKGPy3zIgw8jt3IBHApJYFgjZkomtTlGquFw/jJ+MSfUN?=
 =?us-ascii?Q?h1sh4WBWk+Lk67AIbiLAnTukWWSHzI/cnuF/O0Ptt395MRisLW+wjW+pCqvF?=
 =?us-ascii?Q?pjEoheof+Uk9o/TQnvnl2I5+/YbYy6a3MdoiQGzl3rYPZ6p7cNpLvRb17Vf/?=
 =?us-ascii?Q?BR08vccGStjZWpgabdWawS5yt9x17SJ+ZqZdYfyHfLuUrfRfgG63i9580EHX?=
 =?us-ascii?Q?VIpcCx7F10mF6T405iqkE7kCjoePAWahGo7P5WkOueT4pNBVJVnKMZRhceVo?=
 =?us-ascii?Q?u31nC0BTJmkMDeQvbLC6vTFR8ck1/8bh2HhDp/rb0+8sEit1MyO2Kpc+P7VA?=
 =?us-ascii?Q?R5dEAgBnzgWsR/ccRbEspwNO9FhUQoMruXzUts6qEKRw/noEx8V0FjC3hxCw?=
 =?us-ascii?Q?lV+TZJ61wFAdybImHs0PslCXBVR0Ynxq13AoRXCync9LiE27lwZZFPzEggMu?=
 =?us-ascii?Q?biY9XjGGnY4vGHTBJpvM9yM/FQ+PQSH5XJ5ktIwPSmVIGMJ9bQ/godQrVbhG?=
 =?us-ascii?Q?oIZ4jRU6mw6XCDaM7RFdffBPpvgV8fKhwxsFk1rVP/eX4SoNFVTjgDSYXRT9?=
 =?us-ascii?Q?ggZebyxPiXJLffKIQ4jR5kRkW1NkiCHGR1FDioJP0KyfROWgFM39JjVU+NWb?=
 =?us-ascii?Q?FomVVuTlt76cQ1gJ2tGcMi4XrAMOrVar9dP+txudNhP5BO735RM9VhvweEbt?=
 =?us-ascii?Q?+vPPVDrtjzm6q3AXahkkgz/bBC4MM/8m/ImnbRjJFRACjG6+xRhj4l6YZlTE?=
 =?us-ascii?Q?swMfxmX7/IxEkwCbGz+8gttL9Vc9XeWGFdHvA8ulHrPgAtlinL+9xg3skgnT?=
 =?us-ascii?Q?/Y6LQKKE4BMucRYOxIwXB5TVsvIYNKV1CBZAvEYt+s9URNTQ/aOn6xDC7/B4?=
 =?us-ascii?Q?EMa0u1YD0sdmQyRzoJUHhf/rHvqOeG4l6jcfOwsK+zdkxU7cl7cjZopjpb5R?=
 =?us-ascii?Q?7cHpbNblC8qJmQwcOOMf9tYlTFc0An/6xVgY+ixL9n1cnkSROIkw514i1pHd?=
 =?us-ascii?Q?hIu+KDjZQiseGvcpgpkV7RjXD4bSjDp3wFN4oqiy7XqbEpFIxMnvt/cahut6?=
 =?us-ascii?Q?AWthU+ibrrsr/0aGvD3X90BCNA2kw9fOI+JcRXATODtLhP4ZW2VRdPni+YpM?=
 =?us-ascii?Q?cHOL5D9X0sRx1YFG/bnTrtuAYXoUa/sXVX40fkbP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db59e998-c040-496a-6969-08db0efdf0c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:40:03.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuEDwdS07frAVSv/kA5LCtf3ih2u6QRJEzrCWDKQTfyK1Q7pkoy6vb49vgl4Sqz36IEHavj6Xkp/lGpy5rDvuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975
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
  - v5 changes: no

  - v4 changes:
    - update the compatible string to align with binding file

  - v3 changes:
    - get the regmap directly from parent node
    - remove unnecessary dev_err log print

  - v2 changes:
    - sort the header file alphabetically
    - rename the file to add 'nxp' prefix
    - refine bbnsm_rtc_irq_handler function, remove the unnecessary
      event variable
    - add rtc enable check in .read_time, remove rtc enable in probe function
    - remove unnecessary dev_err log in probe function
---
 drivers/rtc/Kconfig         |  12 ++
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c | 226 ++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2ba72de0fa47..13c9c57aab73 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1773,6 +1773,18 @@ config RTC_DRV_SNVS
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
index 59eb30289335..ea445d1ebb17 100644
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
2.34.1

