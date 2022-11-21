Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B316319E4
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 07:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiKUGup (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 01:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiKUGup (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 01:50:45 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3DD1B1D7;
        Sun, 20 Nov 2022 22:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKER61tB9x2oNIcBilZydUrATQ/0t/0dyIfL3pOUZl4pjsfBo4SDTnvimVk83qQxILGMMdqvM/38/PGDNL0uFa1Kxfa4wFPtN4qDs+dEwNrCLPgBTKpSQKyfA80OYJlqRHnJgwVB9pWD9SKr6rIxR+aoAG9+4VknLhLTvDG0KDLysj+WsD/dZYl0k7Hkut8ti3PfSIKwJr+01J5s3yy74QzIZghSS22X9oEi3bNjRL9PptQ8my+iIUEy2puRZQ76oGvxUPjqXwe5gho2COLpkn6I6KSzSlLyuHRr5ajW9I1n79o9KZ9FXe5yQxv0Yks+FyDLuuaP1RYVItVynN8vhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twZ4kE3HGBLFdjhdYFbPxxjYKT9szIVLW74aZ8MTRnw=;
 b=QUsu4dtaN0PQRvs4YnSEyAf4NMcKMRHUQTJzmEeKttoX78ADOGtTbYoEL7v+vGuVCbMpP4l2+f1msAlhfBK2IE5gtLH1Tby223McjRwXcs5mgrOffWAb2KVjQ8fLq+4MCgDnwGGtmRPjiHyQEA6k72C9UpOGQ0GSiKSEqNjcPzcjMfaScbqoSzBc6i58LRk6RSd5P1ZTFQC8+rB0JcCZ4l3BZ4aUgcVTLMUyie6galRJeXPnh/xwJMp9QO31spLGV2hoavyUpVc4ED5Fi7IsPXadlQmZXakqmItkxKM7aA9vq13OB58Mzr83rGo0RB6SBkfN4bWrPl3RVJOVeoopnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twZ4kE3HGBLFdjhdYFbPxxjYKT9szIVLW74aZ8MTRnw=;
 b=q2qM3HvUzHUnzjDY/ddA7QS3kbd4cF5BczILcWcyFGgI7L6F40Q3RmO8RLei5cOXMy++XZr/0VPkBvp7RYe8kD91u7O8kItn5IuzhImY0E3BrAMBgXb/9RzmSUxX9ee5dnQHUc4HpoDEv2nr4/3QVpFKFm0UCAOjHuuUT2ZcOPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:50:40 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 06:50:38 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Date:   Mon, 21 Nov 2022 14:51:42 +0800
Message-Id: <20221121065144.3667658-3-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221121065144.3667658-1-ping.bai@nxp.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fe2a80-1467-4cc3-46e6-08dacb8cb298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aaCO0AJEU0QTcu6sSXHTQE0VAPzjL7M2BZzlsU4aKG8lJw4OJebnCzJFz0KToRanK2eqdP6kl/bil3fY5nRKOLxt3+/a9PM5dMh6DD2vcXX0/8jhrRFOfTOZss2KKRjNdGPSm+GzrjWmPaeqvDJShRSgEbA4fNSGf3ZQIVGZgz18Ip/MAvbslFRB9MOtjYXZ2NEuuEuVrCGvQQKb/DOXVp+OtbqYDdfpRrcewwqa63DvzVW2OmTPAzDlkBRk2p0Iw5SyhQVM+uWDcNY6+AEQPtJkVqCqtfBp3/5a903IXOxM87jBGNf2e9DYxGncoVoF9rZICszPoJBSxuYv+gbWQlO34iM7MWCgNDATP8oPywYAyLTqFyuglNhHJXqgmPTptov53iK88OwDAalEPNLqYiE4kPDSJVGM8pI11oyaN/uJgWTcy8i6QPg8uRIHpV6dVoj9f/1YLBM8mAFcNvpXxWF1XG197qTg8BzM0tO2LeNCFdv0+JxlxDtPqM3tPR6UGHiQWE/5DQ9zXqjbZCYdpd/xpUJSw5uGrVGIw95JWZF1bmnS3VI0Eaaq3+VjkBAm8oYtX1v5XylFBYSTW0rGEdNh7B4W2mTDOB16mPK/IPA1iQZr1WUxV8tGZRDOVajr+6lzayCsA9XA4XU+Den40+5TrAyWCtMpWFTxz+bbkr3c1O/8Wl1a38xqbHpptchbW3O7aKn45wyo7ossY35NNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(38350700002)(41300700001)(2906002)(83380400001)(86362001)(66476007)(8676002)(4326008)(66556008)(316002)(6486002)(66946007)(6512007)(26005)(186003)(1076003)(8936002)(5660300002)(7416002)(478600001)(6506007)(2616005)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1aJvUEkAzZ92RXm0tqFgKVE+TBp0E19TEU+m8gP2YhPlEfrJDQfMKJWj5AIy?=
 =?us-ascii?Q?sglqwRWPkp9PhTMrt2jgxc6QuJKK2v7cXXHR0hxT70gacrXlWxW8j8bRJJJA?=
 =?us-ascii?Q?usyMos4qZPYqd5nRhZs+oyzcVs//ikg+DGzgYpOemCJudGW6wnPMmReHwYBh?=
 =?us-ascii?Q?xf4KZN5zZiyloJIkv1eO4Gm+9jQZX3s+eWaIrCOb+/mWyuu+2kriH5k3w9YR?=
 =?us-ascii?Q?31mYsPtffecva4WlTazHVx8paEbr8Pj3Us5R1FoJMjjlo/rgbCKFXBnz+9EQ?=
 =?us-ascii?Q?Ll9u3fvMY8CR252RgVVcj7BPTegE7ciEpvTXrjyDbkqgInoyw8Xb7G7Ja17u?=
 =?us-ascii?Q?8U5FTjxIGFmp/0FmRJwA5AWi7podydZkJaQqZknbvFwee67RcW95kEB1sY1U?=
 =?us-ascii?Q?GNwiFRo4iFqpLTdxPz8haHDUeEQaMI8TzAPXeNSSOY7UlqLJPNnKE77DouID?=
 =?us-ascii?Q?VW7h2F8Q2jfmK2uXO5UJe5ERuZA/kZck7z7UYmdEmDr3FVdmuxdBqwyC/yfc?=
 =?us-ascii?Q?+e+7aZ1NdtCBbif0pZ1yQGPQj3rL0XCkREWGHSVnU5w3RT5gkE0Zj+Mw7ih7?=
 =?us-ascii?Q?7a9rILAWAeoggdB/cjuWRtBh3EpgGYZvkg47nKMRdCmJ2ws2t+lv3ZyVqr5R?=
 =?us-ascii?Q?3y4M0YP/Jxj/3sGwDPYEliQaXgk2tRYUO7b4NFlfADSqU/rutCWdiNsIaiTA?=
 =?us-ascii?Q?mGMGU0Efb1jQN1O5CGMCJFWF5u+pTS5AcwP79pbF9kjQd3qtK1I42MuwySUw?=
 =?us-ascii?Q?rm3SctkFWIbf/W5Aecagf8SWKyKVYaVhkcX9WZIWlzdMYP70Kzdt4bY2dMmp?=
 =?us-ascii?Q?sboLvv4Ls0Grfzc7r4Ta/0lym/+QVySlco/6BIDtNG1W+wZOVjhA3loQQm57?=
 =?us-ascii?Q?2G6T97QQHArheZSgPm5SS9IO4PInEIyjY3BmqXI58RRwHnGBtdwsfpyALnSC?=
 =?us-ascii?Q?tEr/S+60JDeE+VhMHD3bE3AESWmUj+1uzNgDDmIhlpoEgE9wWpRl4g4IbzgK?=
 =?us-ascii?Q?wJO6QD/HOScEpXOU7BhcOo7TElcgNFkkY+aeLtWYEOrK0ric6vw9gh+Ay9ti?=
 =?us-ascii?Q?D8viHcup009bOJmYKuMmh+971Qm4PNZKr7n8rUEKvJyxW9pHYFIQngbXfc8g?=
 =?us-ascii?Q?NL4hQJHjTU+yJ4qow680CDJccWId4Pg56EzdQTPXoPvn+uEg46U+wQbQiTaB?=
 =?us-ascii?Q?HjMAnWFbOf3BLFTiSPcAlq7p4vwW1YM5n9sILtkhLmpbY847GGZfVG9Ge2CW?=
 =?us-ascii?Q?WekLjaO9I7w3k7a6+90QMdTA+8pDzVjQ1aiAB9o38nRzprAbTiSRZhH18Uq0?=
 =?us-ascii?Q?PVA3ks9DSJTCEvF7OMFE6WovRi5W9/p+b2LKBtmifXOqXfUfMyNQ+LNJD+0a?=
 =?us-ascii?Q?oDg8FYDp/11IzRvNj03PZoFmQEUbPx/MVnNBPEO9kJ/S1jDJ74mcIugJGuWd?=
 =?us-ascii?Q?D7xxGsS2ZWIkYpl/iDQ6NB8Adm9n6PbJNul2gfbyMaeMEerZCWMQwc9oP3n8?=
 =?us-ascii?Q?/QKZ/F3AcyOTMmlVSfadeZZJTvMaRhZ1jH5S5kboYupbwjzlnpSxy9unUWrV?=
 =?us-ascii?Q?7Uzxa3d67t/NuZOFaut34xWiaVPEPRZYC76eQrHt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fe2a80-1467-4cc3-46e6-08dacb8cb298
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 06:50:38.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTkgSxt/K96JIIIAbUCGAq8yKqnvmWo/3SA3zdlqLHTSXt+ioLoj33SvnDYUIQKFXBYw9D16oHcMME7u2YVPYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
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
 drivers/input/keyboard/Kconfig        |  11 ++
 drivers/input/keyboard/Makefile       |   1 +
 drivers/input/keyboard/bbnsm_pwrkey.c | 196 ++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/input/keyboard/bbnsm_pwrkey.c

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
index 5f67196bb2c1..0bc101e004ae 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_KEYBOARD_QT2160)		+= qt2160.o
 obj-$(CONFIG_KEYBOARD_SAMSUNG)		+= samsung-keypad.o
 obj-$(CONFIG_KEYBOARD_SH_KEYSC)		+= sh_keysc.o
 obj-$(CONFIG_KEYBOARD_SNVS_PWRKEY)	+= snvs_pwrkey.o
+obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+= bbnsm_pwrkey.o
 obj-$(CONFIG_KEYBOARD_SPEAR)		+= spear-keyboard.o
 obj-$(CONFIG_KEYBOARD_STMPE)		+= stmpe-keypad.o
 obj-$(CONFIG_KEYBOARD_STOWAWAY)		+= stowaway.o
diff --git a/drivers/input/keyboard/bbnsm_pwrkey.c b/drivers/input/keyboard/bbnsm_pwrkey.c
new file mode 100644
index 000000000000..288ee6844000
--- /dev/null
+++ b/drivers/input/keyboard/bbnsm_pwrkey.c
@@ -0,0 +1,196 @@
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
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/mfd/syscon.h>
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
+	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
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
+		error = -ENOMEM;
+		goto error_probe;
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
+		goto error_probe;
+	}
+
+	bbnsm->input = input;
+	platform_set_drvdata(pdev, bbnsm);
+
+	error = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_pwrkey_interrupt,
+			       IRQF_SHARED, pdev->name, pdev);
+	if (error) {
+		dev_err(&pdev->dev, "interrupt not available.\n");
+		goto error_probe;
+	}
+
+	error = input_register_device(input);
+	if (error < 0) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		goto error_probe;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+	error = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	if (error)
+		dev_err(&pdev->dev, "irq wake enable failed.\n");
+
+	return 0;
+
+error_probe:
+	return error;
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

