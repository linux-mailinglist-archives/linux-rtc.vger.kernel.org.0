Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F14655F38
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 03:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbiLZCi5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Dec 2022 21:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiLZCi4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Dec 2022 21:38:56 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65AF26CF;
        Sun, 25 Dec 2022 18:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr0V4UQNBiI05ok25bICZQv/sLfFslSkWMMRG5RKawmcxwrlLZb3IoHakL792wJIeuyKIuU49PAOj2y9L6s9OzGOqMPnWyLc1KO8sVLSj6H/ucrmwyhsfPEkXx52uKN+orgqSDoJOQVkpXqiIEMUMVR5vNqNyrnEfNQkrIBMws/Xamzoyu0ZyZ8ftR/YVjgS+mDXgVj3wcavEiIvyyFHrYiD7TyeYApENTcyODVCKQkygZUL/lkqvnCIOAI9c0O2YZCJHW8bA/Z/h2LUhYEX8YQ6iro6pe3vkIfVQosmLog+bDgM7qBxLiqOynoKbCrubgL6WFT+/t0Bcx+HdEarcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9vT1ilF7EFgAGaLgspeMl9xSWYLglvZYVsb0C7T0XE=;
 b=HCqKIwa+HapOxtz+H3Q5v7wp01Ch8GAjzQ11Z/01AfLUvqhf5eD1TF6Ep0kYPFhFuNZNm9DrLB2FhSmnsdFoqKHVEgQ4DMECeE65H3/5djPTafRrUIinyg69eHdvoQWIQLnobOggdPI0r8K1mU3zsqC+EtYimau+g4XvUMQ1vuBu44M7M/c/kLn1K4dR+UuUn3lJN8OvRDp6fj6mHHg+9oQkSiuqqGKSTAaksZy0Xf83E7iERoFI6kMFJfEaPHP7y1oZmPvqAhnN8LZ+mC8KzbIfdTH3x4uZFISQ6bAUN8QB3ssMGl4EAFeB9FqgiTnoqKe/YntspqNi3SiuQGAGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9vT1ilF7EFgAGaLgspeMl9xSWYLglvZYVsb0C7T0XE=;
 b=IyxvxTPYOcjaiQ3F//o1oErNSce0OUwR3cOVn3l/xcQPDjFwqK7tmQyBEb9BAJiuPG0FXi7Lv2EVCH8Y6mOeCHC7aIkpbXV8OymymWTuUl3cCHGe4FDwZItoyy47f40HnBHSoEhl5ZEwbHBIhLz1KAOMH/GpXGCC3Kn6SWiOOyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by VE1PR04MB7328.eurprd04.prod.outlook.com (2603:10a6:800:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 02:38:52 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:38:52 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v2 3/4] rtc: bbnsm: Add the bbnsm rtc support
Date:   Mon, 26 Dec 2022 10:39:41 +0800
Message-Id: <20221226023942.1027270-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221226023942.1027270-1-ping.bai@nxp.com>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|VE1PR04MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc9a596-0b06-44b5-d7bc-08dae6ea5346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFFfnFJEocKQ8MOHYQOvQsF7Zx7EvQrUfBhst1jKs431PJHeJfyZNtAH44PyORQJMfsd+///LvvtyCWvtv1IcYKFaFvon7mntpA6LGLazdr9ZDepauzDfMKNbB3qaayOSL00scbUYzdZWM+aOw1XrdcJ6bmp9cmLQ3FMG0xbGgOtErWp8lMJMnwk8aVsqJQUW/VyubZslm+51whXwYwhBKpvXHCRFhy9fYw3dBM7dRV1QiL7tvNqb5RAS3KnUb/S2pZII/H+fvQOaj/Zg4nalo3ILfJFBsHvcLAS/xU1PYgeHuhPk+DRH7+rVTIMgK3B1PxB6HJ0HGQcGMKpjERvtObdmmQdaIIwuexr7jDe1at1M7fWIkklZxuRZnzFUGen2h7N5hUghleX+Ih4WoNGiAV7MuRctduhENJ4cKq8F6F1+uvc4jRvBKNULeaZRGYHaeVyb9ijwcq/RAivMz5LW9H6pCLVwuS9tFsMFBL55cFS87om7juhGYGL4PHBm3GGz2rotwdhXGPTbtc6rbfowxFR/qsYlWz5iQlg5QX+jwgg/IlYA8A4UHnr6k3Zh5LmFUMQbpj49TEPOaCN0qOXqLuP3f8FaeljDpu7luWpbHwXnA2yb1QKAgp1A1tzwzCnBJ1NVQfPtGD95C0GItbv1TrTO/4AA3pyBaCTb2QK1EZk0b4Uk8NeizZV461KLYnr/QVTC6r28YJWwE1gGlfQqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(451199015)(478600001)(6486002)(6666004)(2906002)(316002)(52116002)(36756003)(38100700002)(83380400001)(38350700002)(1076003)(2616005)(26005)(6506007)(186003)(6512007)(86362001)(5660300002)(7416002)(41300700001)(8676002)(4326008)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhRptRu5b6ag4cfdmowkUaXJagT2bDpHV/oc/m6UIth1bFJ3E/EL6KeR0J0W?=
 =?us-ascii?Q?aq8tWOhW5TUfxhkT1bzmdxM5DhSjI1WDkN7F+n1Zlw4jAcNc+uuuKFAHXIj2?=
 =?us-ascii?Q?AldBP60i1OMmOTgTIfP69YMfq3fY4IagUqbU2vCmpCGhkB978YYXqgddHlAI?=
 =?us-ascii?Q?HLSxU85oi4Kfe4rBL/vGHg9HfDd9AyMo2Zf26AbkXUe+Mv9cqs+OHasVla/s?=
 =?us-ascii?Q?5UlOllmWTJkmIZvAxZ1rw/P71Jctzk4LkD0LdhvfNnNQkIAQBJDmi2ppMtei?=
 =?us-ascii?Q?BMTm9ipDWOGOkPi1ViZgdebD2xU8BNa9e5kV1Jt6Wi/8lu+4CQYow6Nhrk1B?=
 =?us-ascii?Q?g7gKi//xrl22xkPE49OCyAVWtkWnY4VUvTR3DSbOnUEaV132XGaK7CjIU45s?=
 =?us-ascii?Q?Mm9jxGt6Y/YU62vM/doEBp9w8M06GVkqLI33pznlELhs3T4vu+yj3wWrme5b?=
 =?us-ascii?Q?WLq0Gn0rGmFYXw1ttloI1vABigc6NSTeD/Robt4QFwhJOzyYezdNkxsvRHVC?=
 =?us-ascii?Q?y5lzD8MppHd4RGahPmn0LsbysuaIC0AN7+RW5R2UaZaRzNDbRXtLf7TRBHsy?=
 =?us-ascii?Q?9sK57DiIlz3OFgGSEchezw+BkTZUTakIkCJ5/2HK9wTaxOUy/UPlDBzuT+pX?=
 =?us-ascii?Q?UOcMzVphPbxf4IJ1vrKaaTBoGU/no7ZaA3DAKe4qLQdDEFToCT2WQ5npfkG2?=
 =?us-ascii?Q?QVu6B1tEM35a7Yz2nls5y+F2/DdAnKm9EJcsYm1gHR7+tZTCSisuFg+uKR8J?=
 =?us-ascii?Q?B4loOWR3A2+rZdS0657kELDdgYOHorJlA8VX4AN87FOhoxLedZ1KyuOSeG3y?=
 =?us-ascii?Q?kQMNP3WjJPpDXNKRu9I0vEu3z/Y5rM8UXmRJfVWmiwYShtzdiTL2BRTVFogp?=
 =?us-ascii?Q?h+9sr/ZAxN4/p/k56X33fXphZbBnEIiQw3qHgwjKoQoicPnNaUb59JAK4Zhr?=
 =?us-ascii?Q?aQKYyUrrsvFMupATlPNd+GHlKTH60xsFJYFJqcznl2GbnXsSLrfCKbIgodrP?=
 =?us-ascii?Q?RegkCYQZOdhKMVHBpr9evK8cNU0KyKKzvm3DpuMNzmTY9hIcbwoEQd6frAX6?=
 =?us-ascii?Q?U/RAOERIoAO02Io/i7GxTEt+Faa+lrr+Rz1kSkf9i9BH8YJ6ZNP6hK6+pXel?=
 =?us-ascii?Q?XtlVLPXj/I4jNeQqdC+jdddPHKI/7RtNPvD0hTVYFt9UU/Ro2i7EOEVbda1q?=
 =?us-ascii?Q?fS6z88gAs6dFv7s0vulq5i+3t0+Ky+jfq1vwihCuTWzdwlcZaWQJSRfVfT4j?=
 =?us-ascii?Q?n8q5dxwFb8DdEccAxcFl+KxYS4GbdRvVmkUwtqrIF8kgPag0cWmXDt6OyOf2?=
 =?us-ascii?Q?gUcMoLXu3nBpskCAAioxjZfeQ6gXRY3Z4Qxo48wpYkpWNrNDRM+UIyvNIMRu?=
 =?us-ascii?Q?wPItP0KpbH/Q++ZFp255LOXWPzjrDP3zzwZ9AlfAf49MkAxsxGkWotb42H0k?=
 =?us-ascii?Q?6wDWPuTdxVuEw5LnSChiV+xQUOjJ0Z+ImhOan+afXb59JTb9C7vNBFBfyu3C?=
 =?us-ascii?Q?gHQw3VAhzX/V29U/ofomsqwz5ij4Frdq1keqX2T6/qA7mOnq/f/dQV/tivCN?=
 =?us-ascii?Q?LluA7XomVyWmZqWPqqtyJdecgeHiodWG/IguZZ3n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc9a596-0b06-44b5-d7bc-08dae6ea5346
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:38:52.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Isd0o8wLN+7JvaKb8gYBay7ELlxlzC2biO+/6EsI1OMEvE2YmW3QzlD3LZqycgYrXYcDYvGEKlsHw++hFUq+Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7328
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
---
 drivers/rtc/Kconfig         |  12 ++
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c | 225 ++++++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ab9a1f814119..0c8534a49c78 100644
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
index 000000000000..4704a7901341
--- /dev/null
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -0,0 +1,225 @@
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
+	if ((val & RTC_EN_MSK) != RTC_EN) {
+		dev_warn(dev, "RTC is not enabled, time is invalid!\n");
+		return -EINVAL;
+	}
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
+	struct bbnsm_rtc *bbnsm;
+	int ret;
+
+	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->rtc = devm_rtc_allocate_device(&pdev->dev);
+
+	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nxp,bbnsm-regmap");
+	if (IS_ERR(bbnsm->regmap)) {
+		dev_err(&pdev->dev, "bbnsm get regmap failed\n");
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
+	{ .compatible = "nxp,bbnsm-rtc", },
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

