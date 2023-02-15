Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DF0697471
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Feb 2023 03:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjBOCkD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Feb 2023 21:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBOCkC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Feb 2023 21:40:02 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A23631E3D;
        Tue, 14 Feb 2023 18:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4YY1XtAPMD7UKNRzp8QG3eyPZPJp+S9dBfAfRloez8xE5LPjyArjANiUBRAcLCYLhj0KoUp0pCZDzZc4xYQIb4hNZYSLuroPGaSdztzt8SWUAegU5WQQHFBw21JEBuBEaXtz4g+Cn4PvczAUm3VD1poPvUXqNISPzqERHn+BGY/agPBTJ9DxtKqJVxhFBoy2P19H6tVKbQrlKp6CPmPlI+f1atGf5Zl64v8o291Ekoz4FZP6ufLsTY9c8CDWuR/R79S2SybppzUMv5AnAMePGuvSpR6RfNgphSKjbp1ApwX8GHZo/umxxsM/fV2dFfX1t1BThTsSxNj0NPuRG3LsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSKnKHSLHsjfO8Wwj5ZDytRSX0ZESYsBYAc75v/z4Jo=;
 b=GJptRkCJsw/g4UvbTLz8LCXHjctetHFQRRXUUe6EAN30dtM8TBQb0pQJndCwapbrxeBqD4lYIcXtlIzEHLY1yn5LNsUTd8gQ2YmG8dYomHCGxu3NlY2sd/CwsnxM31agDQiXVWzvQkPC/RlrZ+clHOicVMQndpRVPwyHpI7IcXgnmyn9Nuxfj+LlxhDYtIOlma9id0rOeK6xwANnVfYdzgZW1uf0RYlAuXFPvOkQWnb8q8PHF7daqeQZlDbXfS9Jkj2vF2DPmHc2CkjIGNa6GDpFizE2fMrgKXjDBFD3+MO8okCqcpNFZwuYc8FRrfDTQdzoT7GT69Oc8dCslxSGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSKnKHSLHsjfO8Wwj5ZDytRSX0ZESYsBYAc75v/z4Jo=;
 b=qg6ZYk5IsF/ruzNAcc0X1EFA1XivOZ8L/UPBJX2K8wzE64+ap1LRbBcrWngkDkJccuSGi1YwxF3Jkv7lFGL2j2mbJCIuOR80tjf5xGz9Z42kc3syPCE6MiI8R+WDzSkjgBC0Y+a+MveqR4V/g/t7zpdWdCHTi6IAL3Kmk+vPyWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 02:39:57 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:39:57 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v5 1/3] input: bbnsm_pwrkey: Add bbnsm power key support
Date:   Wed, 15 Feb 2023 10:41:15 +0800
Message-Id: <20230215024117.3357341-2-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 62c91766-37f4-495b-0f16-08db0efded72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: efw7kObRbuEpr2YKp6oO56mhSExllALJwggq07kwe2VMPChDXOkE9mu1ualh45cX5JrJOm+RD8AYRrz+UhH8870D8P8znky4pYgIFuDRZ66O6r3S/ZMBa/7M4VOOyVmEOBpUGBe7Z2+4uaHQf8I+VSoI3RyMXunM64tRr7/SX6tKPeM0g4RQUuspyTwpD77Fq1G2w7id/f41bPaHxta/xHNFhHn3+1v6w1nFggi7iFdhyLqgJmGnC3QhPd8RVXxrpGRoJ4tCLh5UM+6XTOE7CqU/gjTkck6rIl3xg1Tf8eSA3akwT47jY/bTww6yyd68dQUaBgwChTRQg8WCPVDPcSUDcCxvV7HAdKg0t4m8aCKSZ6LSwpR5rMhad5OqfVqzN6d6FSheARzDuDS09LBcwHoqs8NaBsnEkVy0MjIZxOXH8tqvyVBvPhNW511kwGVfk/IDF6S3koLZVxYwFi7PtGztq1Cir5YfGlX0tqStNImnZVez3jhKKL46IXhlIYqVu+ignTTPTdSS7ehuChqGGhB0y/4vZ2arMWPyKoOCS6VTg19Tn2+bU8xIRoNnguwG/8M3f0l/ys0u7LxIchKf/S3ZpLRQv3VbQHkjknxiZJisQ8mW0iaDeGdz47qLNuzl8LIj6kUHpcbfZDChHmINUONSx/6WjMVr5e2XSEFxHZ180DJWWIDv/9Dl94/2naxdoXr+5HIZmDXC6nHhNr8bSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(38100700002)(38350700002)(1076003)(6506007)(6666004)(36756003)(52116002)(316002)(7416002)(5660300002)(6486002)(478600001)(6512007)(26005)(186003)(83380400001)(2616005)(66556008)(66946007)(66476007)(8936002)(2906002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFX9K5AEIKc1kNiZPak9GTnkuNsmKcxFZqBx2+eoZ6AUy8v+TQA8YC4QSlEm?=
 =?us-ascii?Q?o9IkdrvM6G0WC5f2PDC/5Fm/iyj5De2dekHl3uMmNzMBb9dUjLCEjsCh7PsY?=
 =?us-ascii?Q?fiJnKt3ILnxrY60YowxTjHb5NQa+omnun1R4KG1hUixmFQKlkvCDtHdFf3Yx?=
 =?us-ascii?Q?YwH3WaoJ6IbQmz8I7E4eQeoCoifxqEyT9Cr8aARoGQIA9IqkD7Z1OUJx3JMT?=
 =?us-ascii?Q?10OuujwkIzoGgQxD1AG34fSBVj1CXuryEcdL9GuuO5OS7UIIqn3p9OET6zeM?=
 =?us-ascii?Q?4FEeFE2+/y0uCkruwmqLiUQIKqXH3AWLgfQFoMY2yQ7u4gnPeddSEcjqoK8+?=
 =?us-ascii?Q?qdv3U6KYER5HMA2m7AzlUhvHQEZDt3XIGK+an7BjYxfQjQVGqFDEZ5Mindg8?=
 =?us-ascii?Q?S7w8RhN1r+NYLk1DH16OsmXJUV6Gq4oarJKMYDXfwlX0Q9evA6bsaCeGNC3z?=
 =?us-ascii?Q?82uW3ELNtfQAYwLorTAnu11kUzgDQz50diAVRQWR+1FOJ86tTOrUv9j9GsSW?=
 =?us-ascii?Q?hxhRpSY5Pb+LK5TPo6pOBSc3pO2sC1QinJb1HbWWeK2+BEkDH+2xP1Cc2jh5?=
 =?us-ascii?Q?3RoEJ6QF7Jd17SSOiHBbhruAqzFnuN2XeWWJc29y+qeSx70CDZOCpLX/vaUI?=
 =?us-ascii?Q?jiL0ZoUlZEpg1DlDPx/+Rm/N7SB2OgaV30sw6rcagfKQf93+KkBo0d32z8GV?=
 =?us-ascii?Q?v0H1/EUwdQbJ9F65H3eocQtrXXRSqXYh7baviDs+UC5WWKPs4E4/EotimsuM?=
 =?us-ascii?Q?TbrEm0u4PEF58JmhGKjQUVXjFSvHjY8mksCznU153e3ula7gq7/wDPy1EqKZ?=
 =?us-ascii?Q?2tQfUCGlXYKrQrQZx8zJ45RmaJ0z4blRgURI5Xp2MiiQQPCr+oxMIiqX//Gw?=
 =?us-ascii?Q?JBLFEWxcSwBWKbjT7fARvQdP9s8hylBhoUW8zZKwOKPizu4qPyrNkAUWdLBG?=
 =?us-ascii?Q?YYT6xByvrkXbrG5cgdRXbAlOO1eGxQ05XI6dzQIJo3Ci5VQMxABlMiAo+tQI?=
 =?us-ascii?Q?0iji4aqqpSl8upMHpe0UQb6rZ/uiv+pEnGY0g4lWeZB9W7Ju3h3+Zz0OY1jw?=
 =?us-ascii?Q?RBd+eaZMs9X6wp1J2TyIlHJNZGcNvDVT1f7/340urljI09pxB1/0UlaNX6wp?=
 =?us-ascii?Q?h7cDNyXJvEBYFXTtQayeiSr4375gspWKHpy5vSuCKl6Ph+p3Per5L36AEMEY?=
 =?us-ascii?Q?i1zex7VcT2vdG2tSgacAcRaIz0weW7W3YDNyR/AWa+5lXLlTtBf0VgdnWO4t?=
 =?us-ascii?Q?O6X641jpBiowUNVwgfFnLodfPnY5L40NokvsF6LCWL27TUacPi3qexrKaJaF?=
 =?us-ascii?Q?YjHXvuXu2myQ/kiMzs1X2CvMrQFzG74WYpEF/JzGDy7/uLDlBZQRd0tx3kON?=
 =?us-ascii?Q?/++i3/TrsHLVfdGX94++3Dd8CfF4Xb92/xUYgBTkyJJZwzZ/F4r5Su7GVJyc?=
 =?us-ascii?Q?xHabfjN3FGuSWrd4YvjGxEs3YwnemytPitpz94/bpIMM8ECX9p3VPfIBZBbd?=
 =?us-ascii?Q?ZHOSXC5ClAsTX3SGQAam0Dj1F0EBjNH9GHw2q8mFRKM7LYD5XjpcDHJshJ36?=
 =?us-ascii?Q?z1DQRX+LtlMiPT//JnnxuIKAmPHfNFwJ8+EcEyfs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c91766-37f4-495b-0f16-08db0efded72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:39:57.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haIVytBqmuta7kORlW5yDgfeCl1lmhrw1lco84R+jfljiiWxkbbBso5+LGnMqQU21qS7AtEZzKiHI/LKx5AdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
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
 - v5 changes:
    - move the bbnsm pwr key driver to input/misc as Dmitry suggested
    - replace del_timer_sync with timer_shutdown_sync() 
    - minor refine for error log string

  - v4 changes:
    - update the compatible string to align with binding file
    - fix the device_property_read_u32 as stated in v2.
    - add back the 'dev_warn' for 'dev_pm_set_wake_irq' return fail.

  - v3 changes:
    - get the regmap directly from the parent node
 
  - v2 changes:
    - use device_property_read_u32() to read the property
    - clean up the goto return, return directly
    - sort the header file alphabetically
    - rename the file to add 'nxp' prefix
---
 drivers/input/misc/Kconfig            |  11 ++
 drivers/input/misc/Makefile           |   1 +
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 192 ++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/input/misc/nxp-bbnsm-pwrkey.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 5c2d0c06d2a5..81a54a59e13c 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -119,6 +119,17 @@ config INPUT_ATMEL_CAPTOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called atmel_captouch.
 
+config INPUT_BBNSM_PWRKEY
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
 config INPUT_BMA150
 	tristate "BMA150/SMB380 acceleration sensor support"
 	depends on I2C
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 61949263300d..04296a4abe8e 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_INPUT_ATC260X_ONKEY)	+= atc260x-onkey.o
 obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
 obj-$(CONFIG_INPUT_ATMEL_CAPTOUCH)	+= atmel_captouch.o
+obj-$(CONFIG_INPUT_BBNSM_PWRKEY)	+= nxp-bbnsm-pwrkey.o
 obj-$(CONFIG_INPUT_BMA150)		+= bma150.o
 obj-$(CONFIG_INPUT_CM109)		+= cm109.o
 obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
new file mode 100644
index 000000000000..737e202ec513
--- /dev/null
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
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
+	timer_shutdown_sync(&bbnsm->check_timer);
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
+		dev_warn(&pdev->dev, "key code is not specified, using default KEY_POWER\n");
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
2.34.1

