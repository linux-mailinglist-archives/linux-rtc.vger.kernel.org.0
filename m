Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38225655F35
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 03:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbiLZCiw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Dec 2022 21:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLZCiu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Dec 2022 21:38:50 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26A926CC;
        Sun, 25 Dec 2022 18:38:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyauMDfoEhXTY8PJV2E78F7ApingqAesfUBQmAAjOH/R4hOGZCxVPrL3QWLK5XbixAOOkoQFF5qYm5chL/RNfkavAxNnXygEAR2nik7z5l+H0JmvPR5vzmDHvROOO8Nzmn1jky9KbjgjNJI1yGOrke/3dfoeyRqeL7toCZseRR5Ho3ip+9+6ZOnaFpL3nX5ncWoSJgon6SsC7q7v6r1houYhMuKpefFljJ7xPzoY3oVpMp1uUzCDVzGbErFS49ZdRWzGT7cNMVaSo1oCpg/sePMSaXCHVNLyHJypeSbIgQcv1KuHkSob4zsXkNNGqUzoGrtae91u2GIv8UOFdpGaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMuD0hrIlmNcv1wJ5/eZiYUAC8zAOTNfwVCXdxF0rRA=;
 b=ZoG1MNqaDDUIbRc33n80QfjH80j5SRit/dmFOBtzA9CnXtJxuILRNV6poev9MYPSNQuYzEiJUtYwI41J8ZsakjIV8LSrTzIpIF+lVgmTi4dpZ/4xBnKf7NvewQjlqS6hZ3zTcw/ZQpx4xo3kNmAxMxE1aKBLmNmCQnYEpGO41Uvl5/KjZSK67elLWbHYOyDkV6RdTe+GV8U/qKgcuEQ5ltfLAJYO1T8fSBJWIscinSuU5JI8pA6q0JDHzZfOF+FEBVx3db6ijzZ2jfUDcb9W0BstH+NWaxJc2c6DodyiZ4ijDoRqXn0RSk8hecBP4tsOzmyQHADfI478xgL7+lF4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMuD0hrIlmNcv1wJ5/eZiYUAC8zAOTNfwVCXdxF0rRA=;
 b=edB6SgHesDFQ1s8gLcKouIGDB31I61ed7RWOS69rsnSTTESZS5zdIUMvpVBZ2Q9GmUzjioL8Oumj6t0ynl2IkOqJ0pFwUZ+JPo1gS5kwTfMTfGgEg4Ogz6m3QTpCvmQixwzPT+SZR6dg6rGokAZ4sqFDXaeVhCt9/VO+LsxAq8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by VE1PR04MB7328.eurprd04.prod.outlook.com (2603:10a6:800:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 02:38:46 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:38:46 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v2 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Date:   Mon, 26 Dec 2022 10:39:40 +0800
Message-Id: <20221226023942.1027270-3-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4213108-e172-407d-499f-08dae6ea4f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCYZoaJI5rI3VZliVd35WwMdqDHyB2QgQloqLQfvEH19GxD3LZhdOYa72OojUQYBlFmX1ApYI94+06YEFKCb8RgtpcuQ3azrZzEfnm46QwGxCeAAhpuXWvhgbd6io2thfEIgEFtqdU+5Z8s8jZlLGR4ajO6Ign5cfct/90sF6fCpCd8veWu55zwAGwhZBrj3FNx51J5d/x6VdIfzvK1MB4wUYfFRviTWyGsIlznwMnVRYALvSLFjn1DRGxa6aQO71RTZcgnz7Rgh89wPGNQv0hkj7RS1K9Lqi5nVj8rEETdqRRhBNfMpDX41stuj0WvCInKMDhl5F5ToWcV5XnuCx3Qr2Znum9CkXzF/zmKSV/RNn0NpJSBqy++PMR0YKK1wfmKQ2giLN6j6abah/v1QHrQexqSEcqHrnLb0cxW4g0xmaXp9nkz1IF4dsEuBgTHQkkeBPEtkIpvTUaaCgVeF8ckB0tuXHVAAuQANwgK8EufBwZ1M0XnN+gXRKuMvOE7962XNeck5CRMOQ6S9qjCJdUdL7MDVbDQTJjur3wIBhJNt8XtJKILOF8/IOqUj3oQ3sKbj3T8rS1Dmz0Dmdoox3UoyYb6OpyAnwMtuaNwaooavTpuCO2igqFr4EIPgZVM3L0XF3ys5/kxWPnrAUqwHs2t6DoN4SJml0JykQHj7whzOFCCD2P2pvmfhxcC4oUUp7nnWyy1SbEaqcsRtyo+FQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(451199015)(478600001)(6486002)(6666004)(2906002)(316002)(52116002)(36756003)(38100700002)(83380400001)(38350700002)(1076003)(2616005)(26005)(6506007)(186003)(6512007)(86362001)(5660300002)(7416002)(41300700001)(8676002)(4326008)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aLU0AwWtWg7YKpb+RoZoruxZvJ5pelgPxk8wgs2jOsN1weFfqszbbhqDLQPM?=
 =?us-ascii?Q?anNTw5Nr7Bv6CTNy5RIdBxyRqFKXK1LkzsVKPqHJJFkoqY7olvJy+rE/0817?=
 =?us-ascii?Q?MYZSfzQzdZDUoz8Od7ZBP4ax5x5b9CCucUa3Bgbj1BRwncnwqiAjfd7S5USn?=
 =?us-ascii?Q?U3EoV1N3P0WWuX27YlYZzfEruzGgHlAHOLvsHvUk2s0EG2Am7VxfqklkXhrd?=
 =?us-ascii?Q?WjdNiyU11WUdMBa4GjkR4QeL44QLt5jbHdTP5h7VYvv6gHtELCHQSi1YchZa?=
 =?us-ascii?Q?2j7pIxdcwGcBJmskxO3GdVI7oZPQR0R1mP6867Vx/ncYddCFX+ZLIHA+vxFx?=
 =?us-ascii?Q?cMZRevIcS+czRdqVaYXINyqZhxHhObRqJsAwdEwu9MuLfl9thZBJWxl2++RD?=
 =?us-ascii?Q?LJHeIZXRetCU2OOhq5qOvCov4SONh/BQ0K0jAc5M+mAapAboHMLhbyrHobj1?=
 =?us-ascii?Q?HpYdO+hTXd8k5Q5LM8+O55xb00Y+pTpjd1QH5CjV+qgT6zRr6w/7M2beOwxo?=
 =?us-ascii?Q?mRBypn0Qs8Ysx7zZSBq74Gfv7qLEIXzPyX4VBHyJ8aokSpVXKi1gDB0nHe3J?=
 =?us-ascii?Q?m5Yk/7yom94ibMBkPfyR1gsUbEiTF7/ySXCWnah7xXEdNfXK/vBrS5lWTY8N?=
 =?us-ascii?Q?HvVX8x964Ypmzjc9B2aoczLui02CH8IqOvM3KMrw+bRggyBr3fNnVujb1ycM?=
 =?us-ascii?Q?N4+ALct0BIkIk84+M5JEHjOv+LY4Af98vzRrPQsmNaderwTDxhnJpyyc0+Qn?=
 =?us-ascii?Q?jZvPLocE1W2UgayShyNghkMOs/Z3exJ9AB6+e2yfaco5sB8g9vvGe7OZc2xU?=
 =?us-ascii?Q?eFJco1D2IuTH2SV56fiGzjGBn8YU7GtU5ZRcGRfQc6y8t6hzNwqF5djatdyJ?=
 =?us-ascii?Q?6FX1+8Ll8CbZF3bFyHUnmPv/NMaQNu7a48KA3HU6UVm+ky1OTtTu87tc5sA9?=
 =?us-ascii?Q?bUbOzetkMAbYCUWmRwvRLzf2U9vXYt2ChQlt7nIN+XbbkHx3T+Xp06T/NXI1?=
 =?us-ascii?Q?siU5bvD06d/jXI+pLdJkwSYgs8Ft6tH2IJYZ1holPPQmO7TrDyAgh1QoRq7o?=
 =?us-ascii?Q?CZoVAQbOId+ViayHbW+Tb+O799IFWuIzLvST6xWAQp2K4jR0GzcH9duNjTc0?=
 =?us-ascii?Q?tzqRG8nu6zddr2r/vd5XEgVh/xTKGtuSFhLbLBWhHgTuRSXnu9BTNlv8A4oH?=
 =?us-ascii?Q?8G+yczNJux8Jwk7sVVXb25ZsLa3MoK4oxCV57cGmNrCu5kktATCilKFTT1fn?=
 =?us-ascii?Q?DQ++w9ntdOgOhAtDD+HiCbvgl8OmYzTo5gKlUMYx1SZjurbaj/E/Xlmvk9/e?=
 =?us-ascii?Q?xLqTUVDcjj3NI4cFe0q711nWWGBGeZooT7wmrM7wxIZ+mRdl8FfEhtWOcLYt?=
 =?us-ascii?Q?ldGOw2A4klTu9lEdRF4qDvvARAMQ8xy0AsP5a5fL6/DudCVUHQYMYS5DHdkv?=
 =?us-ascii?Q?frttcnglS/nO16EdIfQ3diHSh2Z+DeKabEQQ0bvynA8vdj+t/JCXTONDWOPp?=
 =?us-ascii?Q?kvPlGBt/VfdXOeWGMEBThn/FbjAJLOKjcnprYOekqcxfJzRTWoMehSbiH4ko?=
 =?us-ascii?Q?rqXVp0i1MIWcuZo95ELqZXrV3YGqBYlOZwWTf8M0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4213108-e172-407d-499f-08dae6ea4f8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:38:46.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CHIZiXllDUtMXlqishVsD9XTcLE46p/wDKGgyDj40zJlKseUGnEDozkzsIrX9YEdprSy2kVT6r4q2NO8b3HHQ==
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
---
 drivers/input/keyboard/Kconfig            |  11 ++
 drivers/input/keyboard/Makefile           |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 190 ++++++++++++++++++++++
 3 files changed, 202 insertions(+)
 create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 00292118b79b..8efcd95492b3 100644
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
index 000000000000..2aaf44f9354b
--- /dev/null
+++ b/drivers/input/keyboard/nxp-bbnsm-pwrkey.c
@@ -0,0 +1,190 @@
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
+	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nxp,bbnsm-regmap");
+	if (IS_ERR(bbnsm->regmap)) {
+		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
+		return PTR_ERR(bbnsm->regmap);
+	}
+
+	if (of_property_read_u32(np, "linux,code", &bbnsm->keycode)) {
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
+	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+
+	return 0;
+}
+
+static const struct of_device_id bbnsm_pwrkey_ids[] = {
+	{ .compatible = "nxp,bbnsm-pwrkey" },
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

