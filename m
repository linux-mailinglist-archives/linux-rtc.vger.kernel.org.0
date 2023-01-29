Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0554667FD44
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 08:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjA2HHb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Jan 2023 02:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjA2HH0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Jan 2023 02:07:26 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8190422A03;
        Sat, 28 Jan 2023 23:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P13v+8yt9M1LwAZmfPGHoizPM4/We663qw6SWu6Qn//pYKbYVkCybHArZJqoeS6MVgjoVoIrwpG3Bmd9Oh8JwoInjzNy3XzS3mX65II2RZ9sYLYt2Y1A4t10nrQTuSIerV2MDoSspTaNTZQ3CwCAACojrCZjpE5hgA2KGaoODXvmhLTMPXwRaguGP/acvgX7zMEkf3IRkOXygZ6wOa7ucib4aK2hs1l8Jv1XaJLa6l/+St3K/Sc9qXLBm9CtKRZB2jMxE/P25f21XId4nPdDEHf+61N8/2bwB9MnQaOGKdlserK/GI8ojgh28oSNVPaSy+A6BtGL6s+lZokOWuaQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNQEKSD0SwfvFR4Ud8oMe8N5uEOdIUC9x5hYLNrBhUU=;
 b=nz6JVfPxjAM8kKNRMEyjx6Edh/TYsKb61CKqiTSKNqqdhjwHj84w8KR7xuYCpwOzl8vPWVfuaLcDt4XWCKzgpq2rHcBPSt3+I4p4MOYulTEqMlBzineCxvmGuBnKHzsD6WIkmgQaDap0h6WZhfYIkLQ6N45KqB/chf17pcFifrND46XVg7eM9rI7MvzsoClxnL0MMAoT9rVfVuswQW7BbSqCcCZWMH3Id/Tn5mCe5kwgDvXE7q5V5gJCtr99NDrn8FRplAxLbINMTfB+W3cmMe23qzh1VaklWRFIw6cTTtIebZx8TQbaXY5LZsiJxNVKxW0d9P6JbwRZpvrfRCY6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNQEKSD0SwfvFR4Ud8oMe8N5uEOdIUC9x5hYLNrBhUU=;
 b=BosaOF6FGHAhFAeBWGBC9y7YWtWIY2rSRDJQ0UIpOsu6uW96mhXgAAf+HMQ3W4fWGyKGNmAVazpp0Vx+4gnXYoXI5Iix4U040syGLUpO41ynLltgmuVT2OYO0zY/XthwGkqJ61TYLOV3WOXX7mq+lRbaggtuNr38hzgzgxVodO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 07:07:22 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c%3]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 07:07:22 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v4 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Date:   Sun, 29 Jan 2023 15:08:21 +0800
Message-Id: <20230129070823.1945489-3-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 41d01fba-adb8-43cc-1809-08db01c7778d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTDx2U4Yn9cyj8JLh3/hNOM6ocxhimp9toxB1UknUaMV4V2My89fTgi2ehn16jTa4sDCD0NhiRSmiBmvA1UiCWF+KDnTc3jnLMmoF+Kua0KjKHf/cwjM4Sz4ZUz6rIkeDW4RlfFBIvVVLaf4jAwhIUaqH7+WeQIa/zD6iYI2kinXD1gdsIoa5pmM+g90v0/6SHv9Bx5e8QHjdTH8jei71m9r1bj3mrEEM6nGp3TUKZ+Xbw30qOJ+KfhAXdngbc6Fx2O9yUxcP38eQx1Gt6d5GyZD0J4xoPT9FWRANuYeKsKtD2632sxxodGKc49NMLz2m5Pb1T0K7ZrkuufI8PbYGJ+EmIxlqHr9yD1HKUTcGEdOnLo4UvbbGc2nvNddQ6GsvuOJgbrNvo3KRNHdVusuNoEX8kAqTt94kw18iG54IZHa2HZYfDi85TR8AZc9a6WcUMd8+5r98pP+YhN3GEHg89ezaR9NTx3y6dhL/HmtwF0yQYq4x4ZH9LCn4nzOhkpT7BuhvIK5OFSmxEoWdD/WFow+DzSsSTcOk7pPJt8StHu3nXcC9mIPauXNpYQ7BbwAf15AdYJT5e27fjDHn3R4XcPm8W57pBuFdHOOFzfZD23EY1S3hbhtycxtWN6JLIvdLff1QJ6j4og2ZOhK83BE5YJFnTg/yyI4TQzmnizXweJ670USAp65/a9P3yoWpUdy05HCEeFKNGm+J0TnShpDVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(2906002)(36756003)(52116002)(7416002)(478600001)(6486002)(38350700002)(86362001)(38100700002)(41300700001)(2616005)(1076003)(6506007)(66476007)(8676002)(66556008)(4326008)(66946007)(316002)(8936002)(5660300002)(26005)(186003)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rZV6u3/UAcHwTDnDwf8keKYgS4tZOOlD4BFy9Ibe3aKcfwKmSqk+VPeZziC7?=
 =?us-ascii?Q?YIno0k9HkD6ZuDyvxgWBiXefkdJhMgOqNFPLesH/IZ8YJhFZDIAL+5hBg3EF?=
 =?us-ascii?Q?13EHTkaTEsP1OOwVLFEoNn6monP+nkhh7JLI+p6Fx184UG++T3Ld4E7+BCKw?=
 =?us-ascii?Q?tjHQRoaVrV741p+QWWWeEsw9KQgpbbAXuUG6iuXStUtfoRMR1RvA6zXiJuF/?=
 =?us-ascii?Q?6B32zraFTGc/kuP87+P4V3SOa5yFL+Ubi+OmCSR4FSubVcLOZnlT9ZHZ7WRF?=
 =?us-ascii?Q?uf/LYCpUGT8ViBh8yoWH3A2v7s3vfobQoq0yrrONgpfYrhjy3tZgMv5W3CS5?=
 =?us-ascii?Q?3TuhOnJjJsWNiJOkQSPpN5q0PwfwZaDhbXBV5EK49RCTPv30jkfYLud5/2/J?=
 =?us-ascii?Q?sk+mUL8D/9utvO6qHKllDaA8bVx/fvyGuO4POnPIZH6Cid7Rpw/V+m8yQnyO?=
 =?us-ascii?Q?7ZNCn1uFiT9VjxohVqdr4lePAJ8aC4enrjSZluhtdrrNdlbIzZe9tIiSMDYf?=
 =?us-ascii?Q?xIYGNLMym8d8/DB/+dHzoyegU4zGOc3asACxhrbrEkGHV2syjpJfaaDDIE9I?=
 =?us-ascii?Q?kE4/hkT+YKKO11pj3ZWnscmY2WO7Eb83e2/sr8DWzokcSiy/Lq4/hAehKnai?=
 =?us-ascii?Q?bPkVAbfBVnJDQnGnkGN1GHC2Fim00VAWCw/9kSDbA1iQCVWvs6k+jg2EHqeM?=
 =?us-ascii?Q?lXLMwDHpwJL7452ESAoJ26un2dcFtZuXcF+qbvXgpAe2w0Nfo7DhvVqlzqX2?=
 =?us-ascii?Q?w6hAPSUQQmPEyhYeBp0TYIjdTB4m3XfyJUcUf4hdduLzkpBtwEO1ma40dmgR?=
 =?us-ascii?Q?rtaDSozj6JparRrVPWL/gBOkAaDs+UyLbqVkwhdn6Ysx/+Bmj4T0LVu/G/CB?=
 =?us-ascii?Q?6Y5+mHQHttXrypyMoNN4WuC3ASRhFwKyE+60mMGnhYCWcB1qYgEsSWADo7yj?=
 =?us-ascii?Q?g0p5k5lR1v4VYzkPMWZ71PWRWbvkCxXTvFjKYaia2xVWYtzbKJIGu4FdrTNY?=
 =?us-ascii?Q?nwAExde8ol97B4+KdjOKSj/cEcnaFR51WI7zrzracyMhpI/jXnDV98TtLABX?=
 =?us-ascii?Q?OWc9nGkckn82ZXY5NqQwl7KWfKJW8pZePxrauu/skDyX7WFLQErqt3B4zpnA?=
 =?us-ascii?Q?/R4S5nINvIRPTyoottA7U4MRuuXSI9iN7Xt6KKi+MLqKYqpqH066SdWS1IO1?=
 =?us-ascii?Q?uuTHwaSG1f83+cF9eb5W9uOI2QluW/b0C+tLheE7NSEyos/Eri1kQpzP1Rzk?=
 =?us-ascii?Q?wGyVSA86UdUznta4VjZP5MnxzJ6y1ibHMJ7T8yYQOyXGHVkQrVMUI36cPlla?=
 =?us-ascii?Q?/iIuEjdymqtaI3Ihnmhgwq7vFjvkgNPaEWvO+xEUc3tf63m6dH5H30LJSo8E?=
 =?us-ascii?Q?7oDdLYqOWExk/NeOunIonO00ZY6FWbOcZpveAT0W6R6nan6WTLYvoC65hQiy?=
 =?us-ascii?Q?kY8CDUI1DCCQTk4uGBkgK3Sc27XbkwGXSoR2qHqvungSzGs2SMBZTJI7srWq?=
 =?us-ascii?Q?8aS4ps+IvEOUULyRanM0tKHTGYCazR1jieJ7qEZd2IsWO7U83pxz0FPWs+TY?=
 =?us-ascii?Q?ssMyXxGzsRn4rB7ApLjPjBECGqR1vUfhdXSbPlQP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d01fba-adb8-43cc-1809-08db01c7778d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:07:22.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADEnG6cmfW7/1CMZ3PvWQyIbkbEwGxO7MuGFue3VQeXEHZ9mfNtZGK9EDKGqL83d2Oo6g6KNkdNIbrT1Jz8awQ==
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

The ON/OFF logic inside the BBNSM allows for connecting directly
into a PMIC or other voltage regulator device. The module has an
button input signal and a wakeup request input signal. It also
has two interrupts (set_pwr_off_irq and set_pwr_on_irq) and an
active-low PMIC enable (pmic_en_b) output.

Add the power key support for the ON/OFF button function found in
BBNSM module.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
  - v2 changes:
    - use device_property_read_u32() to read the property
    - clean up the goto return, return directly
    - sort the header file alphabetically
    - rename the file to add 'nxp' prefix

  - v3 changes:
    - get the regmap directly from the parent node

  - v4 changes:
    - update the compatible string to align with binding file
    - fix the device_property_read_u32 as stated in v2.
    - add back the 'dev_warn' for 'dev_pm_set_wake_irq' return fail.
---
 drivers/input/keyboard/Kconfig            |  11 ++
 drivers/input/keyboard/Makefile           |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 192 ++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 84490915ae4d..43827e34f276 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -456,6 +456,17 @@ config KEYBOARD_SNVS_PWRKEY
 	  To compile this driver as a module, choose M here; the
 	  module will be called snvs_pwrkey.
 
+config KEYBOARD_BBNSM_PWRKEY
+	tristate "NXP BBNSM Power Key Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on OF
+	help
+	  This is the bbnsm powerkey driver for the NXP i.MX application
+	  processors.
+
+	  To compile this driver as a module, choose M here; the
+	  module will be called bbnsm_pwrkey.
+
 config KEYBOARD_IMX
 	tristate "IMX keypad support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 5f67196bb2c1..e34dd65a34c3 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_KEYBOARD_AMIGA)		+= amikbd.o
 obj-$(CONFIG_KEYBOARD_APPLESPI)		+= applespi.o
 obj-$(CONFIG_KEYBOARD_ATARI)		+= atakbd.o
 obj-$(CONFIG_KEYBOARD_ATKBD)		+= atkbd.o
+obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+= nxp-bbnsm-pwrkey.o
 obj-$(CONFIG_KEYBOARD_BCM)		+= bcm-keypad.o
 obj-$(CONFIG_KEYBOARD_CAP11XX)		+= cap11xx.o
 obj-$(CONFIG_KEYBOARD_CLPS711X)		+= clps711x-keypad.o
diff --git a/drivers/input/keyboard/nxp-bbnsm-pwrkey.c b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
new file mode 100644
index 000000000000..154ce58b9d5a
--- /dev/null
+++ b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2022 NXP.
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/regmap.h>
+
+#define BBNSM_CTRL		0x8
+#define BBNSM_INT_EN		0x10
+#define BBNSM_EVENTS		0x14
+#define BBNSM_PAD_CTRL		0x24
+
+#define BBNSM_BTN_PRESSED	BIT(7)
+#define BBNSM_PWR_ON		BIT(6)
+#define BBNSM_BTN_OFF		BIT(5)
+#define BBNSM_EMG_OFF		BIT(4)
+#define BBNSM_PWRKEY_EVENTS	(BBNSM_PWR_ON | BBNSM_BTN_OFF | BBNSM_EMG_OFF)
+#define BBNSM_DP_EN		BIT(24)
+
+#define DEBOUNCE_TIME		30
+#define REPEAT_INTERVAL		60
+
+struct bbnsm_pwrkey {
+	struct regmap *regmap;
+	int irq;
+	int keycode;
+	int keystate;  /* 1:pressed */
+	struct timer_list check_timer;
+	struct input_dev *input;
+};
+
+static void bbnsm_pwrkey_check_for_events(struct timer_list *t)
+{
+	struct bbnsm_pwrkey *bbnsm = from_timer(bbnsm, t, check_timer);
+	struct input_dev *input = bbnsm->input;
+	u32 state;
+
+	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &state);
+
+	state = state & BBNSM_BTN_PRESSED ? 1 : 0;
+
+	/* only report new event if status changed */
+	if (state ^ bbnsm->keystate) {
+		bbnsm->keystate = state;
+		input_event(input, EV_KEY, bbnsm->keycode, state);
+		input_sync(input);
+		pm_relax(bbnsm->input->dev.parent);
+	}
+
+	/* repeat check if pressed long */
+	if (state) {
+		mod_timer(&bbnsm->check_timer,
+			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
+	}
+}
+
+static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
+{
+	struct platform_device *pdev = dev_id;
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+	struct input_dev *input = bbnsm->input;
+	u32 event;
+
+	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
+	if (event & BBNSM_BTN_OFF)
+		mod_timer(&bbnsm->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+	else
+		return IRQ_NONE;
+
+	pm_wakeup_event(input->dev.parent, 0);
+
+	/* clear PWR OFF */
+	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
+
+	return IRQ_HANDLED;
+}
+
+static void bbnsm_pwrkey_act(void *pdata)
+{
+	struct bbnsm_pwrkey *bbnsm = pdata;
+
+	del_timer_sync(&bbnsm->check_timer);
+}
+
+static int bbnsm_pwrkey_probe(struct platform_device *pdev)
+{
+	struct bbnsm_pwrkey *bbnsm;
+	struct input_dev *input;
+	struct device_node *np = pdev->dev.of_node;
+	int error;
+
+	bbnsm = devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(bbnsm->regmap)) {
+		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
+		return PTR_ERR(bbnsm->regmap);
+	}
+
+	if (device_property_read_u32(&pdev->dev, "linux,code", &bbnsm->keycode)) {
+		bbnsm->keycode = KEY_POWER;
+		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
+	}
+
+	bbnsm->irq = platform_get_irq(pdev, 0);
+	if (bbnsm->irq < 0)
+		return -EINVAL;
+
+	/* config the BBNSM power related register */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, BBNSM_DP_EN, BBNSM_DP_EN);
+
+	/* clear the unexpected interrupt before driver ready */
+	regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, BBNSM_PWRKEY_EVENTS, BBNSM_PWRKEY_EVENTS);
+
+	timer_setup(&bbnsm->check_timer, bbnsm_pwrkey_check_for_events, 0);
+
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input) {
+		dev_err(&pdev->dev, "failed to allocate the input device\n");
+		return -ENOMEM;
+	}
+
+	input->name = pdev->name;
+	input->phys = "bbnsm-pwrkey/input0";
+	input->id.bustype = BUS_HOST;
+
+	input_set_capability(input, EV_KEY, bbnsm->keycode);
+
+	/* input customer action to cancel release timer */
+	error = devm_add_action(&pdev->dev, bbnsm_pwrkey_act, bbnsm);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register remove action\n");
+		return error;
+	}
+
+	bbnsm->input = input;
+	platform_set_drvdata(pdev, bbnsm);
+
+	error = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_pwrkey_interrupt,
+			       IRQF_SHARED, pdev->name, pdev);
+	if (error) {
+		dev_err(&pdev->dev, "interrupt not available.\n");
+		return error;
+	}
+
+	error = input_register_device(input);
+	if (error < 0) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+	error = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	if (error)
+		dev_warn(&pdev->dev, "irq wake enable failed.\n");
+
+	return 0;
+}
+
+static const struct of_device_id bbnsm_pwrkey_ids[] = {
+	{ .compatible = "nxp,imx93-bbnsm-pwrkey" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
+
+static struct platform_driver bbnsm_pwrkey_driver = {
+	.driver = {
+		.name = "bbnsm_pwrkey",
+		.of_match_table = bbnsm_pwrkey_ids,
+	},
+	.probe = bbnsm_pwrkey_probe,
+};
+module_platform_driver(bbnsm_pwrkey_driver);
+
+MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
+MODULE_DESCRIPTION("NXP bbnsm power key Driver");
+MODULE_LICENSE("GPL");
-- 
2.37.1

