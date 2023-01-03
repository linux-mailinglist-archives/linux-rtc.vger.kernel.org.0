Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3AB65BB65
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 08:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236930AbjACHqt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Jan 2023 02:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236919AbjACHqr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Jan 2023 02:46:47 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2059.outbound.protection.outlook.com [40.107.15.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C70B11;
        Mon,  2 Jan 2023 23:46:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkyKHDcQSc82sl2gv9+/1pavceOUaxswbE1rDtiSqXWliLagytZllkZBOVFY8uPkCSKJG3iR2dDAO9BYIb+DH0dBrXkSa/hiylD0yk0Q5+56XrHdjfUNfYEEI6tRpeBR1z6tcL05Snr2ETu60Pc2Q4i7r4E9KDxc9ENvcGkOMWZ6mb7kcCN2WXEynBw2P3sq+vCzNc6NOugt9I13s2nMjuEUaGPKKWA/PwyVE1mIxBH9dGuQTEoJIZtXaTgnXR23bLlRjk/qivTNijbSXdRCBYLNc/OkFYDDM09TwQzFw2W2emtC87mzuHx7xrvlBkZX4dEMJxGCXu9mt92tNw0iWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPmW5jEtR3yiiG7i5iwd4O53CG7/MlqzIZGn3troHEU=;
 b=i+rWTnc2SEaR5qPcMWjdgoWgyRfgouWbYyxiK+urJRuDu4Tv6fxDLL0WjcGOllDaBz3bX8gUTAq6qj3pmBX696BLL/Q0BrgRLWQgRfkbqGdpPStzEZMuPmD58C0Hwc94cJRx3ih7u7pO3ce/pdInQPDynqastDBJl0crPbfPV+lagxjIum6r0hkGNWMG40C5dXrvfgF4krq3OTZjbk0Omdu/NSG/y8+aNGEv+ypGVEi+2+W50RheOBUAGYoNGbVRv8HxLpQNJC/IT9mqK6npNAojtqwePLLY7Sd4In3FcqfHjtNRxFHnYhZInj6uNniC5VPN/F8OZuMFH/PFFMEK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPmW5jEtR3yiiG7i5iwd4O53CG7/MlqzIZGn3troHEU=;
 b=i9CeyFHTjzqrZsn1D35WZsPesJ7ZcwiLtKkyS6Su1PlLFvnlg2aueicW3/FBsaE5UpmY2pSe0ucjj2w8Zc7QPhkDp/HRSbnHRrrJwlt3J38t2JMUINb3SJM+6JxT85TgN2u8yRthEp6D7IIeB6e7jJk6BAhP6g52OEqVHqh8bY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 07:46:43 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 07:46:43 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v3 3/4] rtc: bbnsm: Add the bbnsm rtc support
Date:   Tue,  3 Jan 2023 15:47:41 +0800
Message-Id: <20230103074742.2324924-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230103074742.2324924-1-ping.bai@nxp.com>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|VI1PR04MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 81829650-5be5-4627-dcc6-08daed5ea849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaesgLMNa3G4rzUTs/JySiyX8w/P6qqYdIYAkK1PJZGaE6WfxP89YwvzEkAptGRD7T5pzFbV57ZUmVyWurSBKe94mov/JEMqunyv9VzSmmw07nfp6Q9Zbmz98xbBF6aVrT4Ki9vd0wYrZIz20iTsOLErKCBsNPr/FjO6yqgtQd/gjI68yhmq4HbFfkmKOcEykOek+iixS7mF1FuVh70Z0x9FCb2F51mTUx5NQ7iFLQH3gILssZmw0Hl+E6uGeZCePi/Dbvd3msytvFDcggZ5jFtYc62CLdbTEk3kuNc1juCchY7/a+Xq6e7jjtNZa3ZgPMoPZo3G07ahhnlDl4SEVVhcMeCKb+YoGankN0FYZYE5qcLhYGiqOZ0swp/Rv3rJ2h5Udo8GkOFxd4a3VcnY8/suU0uNDzsNpPa9kYnTV4zLvUu+njceUcruVvcIreUVfcdruPiEcRwT9fb6y6ZejK/gnWS2nuJDbS3jyAnoHsTKf7DuG2upDcl4niEbaVZzF2hKKvsQLnxtuKp7UPBuN6eBZyN8HHoFsjj36i8hMj4CiUzZeaE3t1gW1ND935M/LklOD8s8iwjbKP1R6BEUjiRzghq/l7FHU612wetz53DHydB5pz+e4znXHYnnd9u7Aeedw8RI0BVX6JIUa84W9xwnbWhy2vWCkg+6IHZ0K40zLzR42qZMVE/lD+AFJH0eEBPxi9+z81eAd1+GMBFwfrDFQ4IjzlvebuQlUaU+wdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(8936002)(41300700001)(2906002)(8676002)(38100700002)(66946007)(1076003)(38350700002)(7416002)(83380400001)(66476007)(5660300002)(66556008)(4326008)(186003)(478600001)(6512007)(26005)(2616005)(316002)(6486002)(52116002)(36756003)(6506007)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7rQ/QuA8kixEDEH/kCjULKCEwikGKdDqBh6OnPcaX3VdzCxOFywVzqnRioA?=
 =?us-ascii?Q?xsOw9F6JvKOPtxxDa1ILqpF7LPh9o2U5kAe0CYHOkklPlJUoxPwvocg+slZH?=
 =?us-ascii?Q?0MuLTf1Q9hy6XAWMfR9TtfkSguiM3U5gcBFup0euZ6KSF62xCQ0bj8oFTi4s?=
 =?us-ascii?Q?C1Jz75hu7GJuTWNEZtNajaUazAZgE02JgllnrR3p5O894CrtppXS25FL9osG?=
 =?us-ascii?Q?0khVA2TJifB4GtKjSyAvumuwqwpv0a0mpbncns9NW6L2dUYVP0z6q/5hNE/v?=
 =?us-ascii?Q?Q4VhPzeFDFdH62ikgDDnZ2KFnm1Sc6QFRbIx1v6hQ9wqMoQSvPeASNbqJca1?=
 =?us-ascii?Q?HTvWLA/D43y7acH9N4fJVUND34uppThfQx4lIMP4g+7MfyQkpL/l7PGmt3Kj?=
 =?us-ascii?Q?saUNDIHx+OHbbJiyEBcYn82tOtRCe303g4SxmGi6vAsAYLG385Ul8WPEHhZw?=
 =?us-ascii?Q?O8eteBmvqIB48p3+eZ+Rib10XjwCoh4mbJJYtHHnv3SzaKH5SBJQH0nkIbji?=
 =?us-ascii?Q?OYxmI7MAWqk8mWAqAl2bPcr35yOYhXPYbH7gl/CjOdIuZFoZKhfXWpX+69/J?=
 =?us-ascii?Q?waSMiPZyEHLxMs0mo02gI77yuIs12wOH64xDlvA3ge/yIxT9HH4HiHbZaxBs?=
 =?us-ascii?Q?2pjBD1WHXYl1saXiePSwPcZ+tyLbhjNttlMZ2M3pf0tun3tZXiIL6yhsfySG?=
 =?us-ascii?Q?DJwInFQ5EXokX+jMy2UERJRnxYfVaXlstv3GdDB3gaUTwLDCTzAklBO9gCfM?=
 =?us-ascii?Q?8HXy+ckDegKMP31lKQmdgC7QKQSeszqHr3lrAFWF2A2lO02Re4WUk5m2X+Us?=
 =?us-ascii?Q?GWpMxUQCFlAfnVj3AdFuXsm1ouHNGuaaeiS4TARmB5i4xn0iMZ+FEXnt/nb+?=
 =?us-ascii?Q?oRg8tIFdcBRYH4uKOsWrqLlg6ms67QeMjPdYfz3tbJKFaA0Vp0038f/xyF/A?=
 =?us-ascii?Q?Ks4vTKlCW27o/L4TzSqYWTSWIqzL5fp9VyulVxEAFN8FukPeJihwc3QmNk5C?=
 =?us-ascii?Q?ng1n7znE+1G9M9A7YINuQPb1J6XwUmSFfwEYejgHfAtfLPHLTxNKEswWK17m?=
 =?us-ascii?Q?fyJammzvrzhLDFDRVH5P3oZXVeGx3mhtTrn6beyWmh7qwSg1Oy/krRhYxPzB?=
 =?us-ascii?Q?mJOcVCv7j/BSnaNH6SQpvvpN/Kh0ajxtMksbqkhAUsrJkOH0wWFc+dOL0qKn?=
 =?us-ascii?Q?Io/5/XCroOQZnjpMDoHkSxiWIJy3oVIAogLzNmAwjbUTvCZSYLyoPL1O1jfD?=
 =?us-ascii?Q?N/+LsT457DjgX0jLRp1011X5FHqoqewfLHNHmr8Xfw9+2U3gL3umXAJAFlyH?=
 =?us-ascii?Q?aU8NCx0qcUAWnpPkryN4URQC9VYBhAafmUvr/laMrNfQ05Htoji17VcWcXkI?=
 =?us-ascii?Q?jF0/ur+tYyzABSHv8z7wBJ4Ky7OUiTZZnjR/tXbOc1yaX2a9s424WyIGszSF?=
 =?us-ascii?Q?cnlfzZ38sg0qAGZ+MFRCeMaXdxQF0BvtqwwyX+BQP0Auuj61sw0i6QbD/HXQ?=
 =?us-ascii?Q?8zvPantlbKiAnmdeoAFciC9HWsGupw/NvTLnZ5Ttc8qROVxojD6aInZNUurQ?=
 =?us-ascii?Q?R80woOynOqPmCgCaEaTIAzaoXz0ZZUbpESBUPDL0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81829650-5be5-4627-dcc6-08daed5ea849
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 07:46:43.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdmCqbE6u5lidDpL0trg8rGgmaGa12/VvmkB+JwyxV7gU7IAFyLFXOTFFGYCBkO2Najg0gsuwQlpd5+XozXhvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
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
index 000000000000..fd7046695d01
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

