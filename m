Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2ABB65BB61
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 08:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjACHqm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Jan 2023 02:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjACHql (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Jan 2023 02:46:41 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2045.outbound.protection.outlook.com [40.107.15.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4865FB11;
        Mon,  2 Jan 2023 23:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeNRghVnwxJk9jhBtxdnJigo6Y6lHASXCeUrrxrHv+CGRtiPLmH4S68T+iFYtlhtu3GeUQeN+5Q8Ywkh0fwE+CpB67kw29iU9NtUkan6WWu9mok8WkM7/1pehWJ0C/YmJv8Xim9ZTwJDdk1bS5NRH0CwV5FKgXJE+ql6a4Aa/0qNiSomqwA43k13/meD1VAIlnISVvkxk15tgUKHqAiDax3PvqqWVrOr0jWAA+mTzQZTplMBITwY2L5mTPOCfJ3IcXB7n4XjaRQqzoASOvh2zhMeY3eyHSZ6gJkqjicK+Jcb5dIig3qb9EyamPpoUG0DBANbcVE9oI42BbqQLoCE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbq+1S/My0nG+foNSTCZdaBMPPvDkGM3ynEhyXEX1lQ=;
 b=jBJMqdUf4ghscEI6oxGjN2nxbBd+sF59BN79eYlvEW64ejJApEIFt8U7/lv5OqnsChFJgsxQpFE/qnBnxsc60EH6hkgVsGACq/VZzOB5cgNUXo1tuXKlGj7kE1nUWfsIvwete7EcaHQ+4Km6E5PhgTV8NhErTbpqDlU+7aXqbdev6ASEPGk7AJ2tNEW8FBO1eNziYQvOe57QokuCHBJrscUSYtdSkSjNM6lLPSL8tjivyxMb1nov3i7Z9T2S1YL8h72bu4ja5ObswxS434/Hl7jYcNLCAOaI9Bu3vWsgncv7HRKQvaQI7Dk9vh+3LEQ3/YrDTyRUXi/yp2jWO8iIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbq+1S/My0nG+foNSTCZdaBMPPvDkGM3ynEhyXEX1lQ=;
 b=Xtct89v4ORwe0d+l7T5xupe2imfbjRiYizGxsCAQAkNgegK+jfRm+AD7FX5pFD5Xh9yfX+Ponuzi/QBhaSn9aobvcGwfb3ulog4Nw6cU0kPU/qafVheG7eHezGWPPRFpd21uA7XmZ6RgobsDA6L15i4momZbjKJEFg9yiYTRZQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 07:46:37 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 07:46:37 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v3 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Date:   Tue,  3 Jan 2023 15:47:40 +0800
Message-Id: <20230103074742.2324924-3-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef5c0efb-66e0-459b-e00b-08daed5ea4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWJZp5r4tYrUK1Er9eZcO066Wu4TyK9oMwM6RRXRXoLXlZjzMpGEobb/Z18FEcbM7AA5EKRKlzNLEVKfJqADScL5/n6LGRsDlXcAY/HDl7Hlto1BqB+kpwNxB2HFSi8jZu08Gy+cAQD70kQxObE6lQs1xkfpTOqZSTVZWiPwW9xmIEn0yIUD9d1MIIuqg1ugXUeDA2KUx/D01EV9zUzfsbLAAJiipZif32uyVIAsOKxI2BMcMve9ayrq4JjApAgTegx4orkceoyzfNZkNseYcHFO3GcrpeyXtM5Zvz/WuMMXGDXUVI3MhbZpP2YcdCJFV0bLbLPxfTJJJCq5FS0jUxXdb404rTo4wylkAXQ6vjP8+769ylBkQVwWgk07rcIBos0Z3QSvvzxngxjljBx0e3f3z3sprMwYCp5hP4k16Ap4mKVjoaTpirLrlFSv3VHfa04saD+ja+b1bYU1kR+zPII16pNNMOLfOFqrKoR7ZAHJeO5jkito9/O6ln9DUCWTpVNLPg+6cBtrSm4s6w9x3RxZODju1l6E+r9Rugxdl4lBtnTutOMK/O7rlUIy3vITA9bvT9fFu3MJfqwcbDkpo07lv+bimtThfjWbJjBusXfCGgQSDT+IsbUig1gYy5RBBeMt3r6Z3hssEhHc/x+hBn5C5/RqAUYezujbTPOSRSPEvNNuPQYytxfudw57vlXHvmHBq+1T8GvrnPJJFKx7KTI3qqAEgykX33+p67kdcxE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(8936002)(41300700001)(6666004)(2906002)(8676002)(38100700002)(66946007)(1076003)(38350700002)(7416002)(83380400001)(66476007)(5660300002)(66556008)(4326008)(186003)(478600001)(6512007)(26005)(2616005)(316002)(6486002)(52116002)(36756003)(6506007)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1dXNIyNjZxo2nDjIvmbvM3C+3yVfrzl+W+55VKxLaiKajqfwjuBCL7GrwPT?=
 =?us-ascii?Q?lNj1bQCQyRgGF6dCm0uYVSDgtNnet+Msgu4ffiM4GHQx6xLH4hAF5bIeoY5d?=
 =?us-ascii?Q?w8JIjinnu3FWlVRGkamazcFC5r9Cx094/ZtnsVjL96wlGpRa9hliT1x6zjjO?=
 =?us-ascii?Q?BSsg/ygBtwN4K/PRHdlEFXd4D/GzixmkvWvzahbiWlBEJ6ICnbahoEOV1CKs?=
 =?us-ascii?Q?dmkP/UaSiwnbIs0GsxKVFdx6TryQ9ZaIvUKcNsYkrG75cutwK6CWiasd0hYs?=
 =?us-ascii?Q?9hvyPsfoF/EzwVGmYKSXySIzXg7LbJDlxmxqz43JjprjqdQfIFyGnT4OqSJs?=
 =?us-ascii?Q?RODDGBbaOOCkTa/Si0dp0hV1TL7ND0P0gafj0t5AxJ2/f503oggCWGN4OLhT?=
 =?us-ascii?Q?3/WxkQKfPHrJD9vagfsUeuqWqA/SbTi0RSS0SgSF2zOi6fw4be7ovLMmlkNw?=
 =?us-ascii?Q?fZRAFW0WB0Rf0M8oe175LRjsH9u8TMofmY8bIf8SBl00KjS969lsbdnYYOO+?=
 =?us-ascii?Q?Ns/aaBUDcDrjcmzp8kgFYKZu2RXdpt5HIdOZcaz/zNiFzkj+KqbI7nUsMD1i?=
 =?us-ascii?Q?cWQ41MtJsOyPz4HqYAgqZ5nMxkHtOy1QwfdPQXcKuB/FOih7UfOUzYCi1U/B?=
 =?us-ascii?Q?pbbUi5BZloZXl17CgBc+Nzcvma8zo1CkIDsdgeiOAn5lMGfoZfy/DzvIM7/L?=
 =?us-ascii?Q?TXtgcjjlbTaRRmZyegPTYq8zjLpO2CHvitXjf9n5lsCsznm2LOSLTnHBixF6?=
 =?us-ascii?Q?sVlEsIrha0NdmtMsLWK94B/VlvgSyvZ4fEvjJIE9Hp9SBIkJAVSwk1rg8JXo?=
 =?us-ascii?Q?0VFJ+cEqTrLQSmBiz6NkUki/UnrW1GWDoS3qX0bQ0o/lRQXDGQRY8kb7nIvQ?=
 =?us-ascii?Q?fWoqSldfsT+rJADsdxEpoNBlRyDrIT+gInoCq/2ALXQdwXZcft2BecQDkaQx?=
 =?us-ascii?Q?e/ULfrrFnw7Mofbytq/IwRmImlIzo/uxO30z/fXa+z/UU4x+BnXZa1n1pGVW?=
 =?us-ascii?Q?aRUIw60jENAiQKqGSjCd6n3FxyTxJhtqnhl28YEYXkgTRLetc8mCHm/t6jJu?=
 =?us-ascii?Q?woUGkv0cy+FNeIOpoZlFqtM7+AdRqAodwW3odmgWp8dgaaCzyWn49ksptFWE?=
 =?us-ascii?Q?MWenThdePDPhjVcIaAGWmBm9QiIv5GJHmm2Sjrk5sPmDFMpXGGVtiSwTFmo8?=
 =?us-ascii?Q?CjFFa0U6iUdwoMRMDgQMHgsPpxKidKr9R6zBTkCSCtOKMU8jrvFC4t6GAYmg?=
 =?us-ascii?Q?JFcQ36dPhR0oK+SoJ5U5F/CkOkYIyl9hpcZBOjCc23c9qGqofi9PlsTeV/An?=
 =?us-ascii?Q?+BymsycBuQ9NEPxo4krgNaXgXCTazMNKT1Qns4lAtPpondDZPd92D9e0xLI1?=
 =?us-ascii?Q?2x0zTODodAtRDfTml1ipLdKTqJxSuWKTRZqIMf0rTdJdJGBsqv1IAdFSURnh?=
 =?us-ascii?Q?AmioZPWetA0yyT1zgXv63hu7NSgHVsTgvtlS8/RliKCufugzHgSq1U+c1mvy?=
 =?us-ascii?Q?yOdsAV236z3g//O6sCoyw3LiH2+hy1DjmK8ffCQK9Sqx+91iSkiCyqp8RWyB?=
 =?us-ascii?Q?vYJggGWk0NBE689k27BF5jGwYVFLP4qaGE6HGF9X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5c0efb-66e0-459b-e00b-08daed5ea4f3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 07:46:37.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Odw5MPELLn0Jvhun389oMKM3MOGQSB5Vey5HDlJjZ4dNNEA6OC4MfY+4DP+n8choaN9Auw27imFC7HMpj0ejw==
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
---
 drivers/input/keyboard/Kconfig            |  11 ++
 drivers/input/keyboard/Makefile           |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c | 190 ++++++++++++++++++++++
 3 files changed, 202 insertions(+)
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
index 000000000000..dc937036c952
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
+	bbnsm->regmap = syscon_node_to_regmap(np->parent);
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

