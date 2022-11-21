Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4DF6319E6
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 07:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiKUGur (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 01:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiKUGuq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 01:50:46 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADCA13CD7;
        Sun, 20 Nov 2022 22:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdVhaH65y561fPqGip/qY6eRzZ7KUu555JAarwU1rBTevdkTk38rB0qzeIAV7EDPDFtEiUXqhQ0k5R39v1RHLdocWvKddvW/eVh1hJlJgkQ6Krv+MGmKAxs8MKQexRwOLqsh2CZoqOUPVxcW+LSZp8YQ34m3gDKGNaT6mXXrz4Nu1oqTtXCiUgvxNjH4/CTtn+C/K8XlMRtwK9K6bCwdR/EuczGbWKH834eg2m0jMUxrsize2HwPekMNWW1NoJIep0ohhYX78OBmKH4iFKn6qUfxQSh05aofPffkES7hCjFYLGxXNtroUjHl3r0bgPcQPm+rfLNXzm3pALTfxWgdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keftd6s5Q3q3PrBgQ/afVH7e4t3ZzNQJPCEv+VeKoms=;
 b=ZzR6e3RdrexJh+PjTsyFZOkcLCreYafty2jJ7Nwu/Aifrcf7FOZVoOFEIEbTVmPz84yxBfqcbY0T1HeajTd8gMd4WRB+By1n0CORYnMBRnnKno2FYNDGAjrSvVLggEtY9BYNm9fKSOVTP98bAT5may/oESg6wFihpNjNzKA+NDcU7AhixEI9NkY1wruOk5v4qq1knMZmVPMMNCVWuK8cxWCHQlKvxUBa53eRDMZzxIpV5Fdbtkl0IqR7I+g8U7BZR39OJjzCd3IBNiTbEXZjaP4aGHJMM4GJUoy0r4xQksqN4P1e01fDCPjhqeabBxs3MX5xrO2xafSZe4aNHtgqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keftd6s5Q3q3PrBgQ/afVH7e4t3ZzNQJPCEv+VeKoms=;
 b=AgKHoIjnpMbn9im0p+0SgUw8akZW9KmzehSVRIInJ6hWzsLRyW6TEUNgaV3sAWJlwHMkt+5awS8Qjmarc4A9hp6ajCXZWFxhN81YlWKd1rcF781UAw7XA47Oh2MsdHT03mFJK9AWZmsWfGj0mDIk/WftgRrN5HxjBt6LtTr65Hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:50:43 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 06:50:43 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH 3/4] rtc: bbnsm: Add the bbnsm rtc support
Date:   Mon, 21 Nov 2022 14:51:43 +0800
Message-Id: <20221121065144.3667658-4-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35aa7a1f-0bcd-4972-6f71-08dacb8cb59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwVEpscRlKPRSvOYIbbcX0So9e37Y+uDqodhiBry4os53XYNNmJWNscjXsUyv3Xzu5Yi6eP+tzThgJy34MtW8J0zyoQHxfOvHQQHF11UwoX+eXZI5fHzzNNDD+c0RDUAJP2BVCpjk/N1+9YfOostOX3pF11+tZiVk2kI81Sl+lI5cjfp3LAqUAH5HdMuHANTUVUpaZj5BuSPOkOB1av9Y4KcHcr/XZ1JSUOie8gzkwl6D7xfFXMXl9n7jAyGgTP2TS+FtpkBrUP4NZmdlZGMSzpPIvbs3exNC1qLd/+7isyJsy0Ep4HX/YJ9TFrrcjg/IBiCRxo7qLU+9RxLChcNjt/fq8+DraX5Iues4dBQCqJ+EOQuU54UbedVddD47zk0sHIXC9deo5dMPdZ8aI+XwF2r1HcNk5nhjlnTmYe1cpM2sNJiJBJ5Y9LjMbFYtxI1Am/+/KqK6DL/ObIKq/saoeuI7zpbaQCHQdE40USfxNsYXho5H/scCcPQq2cKmdf59G82aKsw0WUtjAgcmXPOTsob43UXiTgSjJWB/MsgfJxxDAiIp4B/4eHYISNVTiUG7opn+hIH/V/ykWdzZmhWwd9fBwMcD539Ox71pZeyBS2O4SoBeH970lwLEKHqKLFakCPdvaQ1RqipDMogzVyWfHaIp7HUvnnt0wH1ikfYtivEsPx7lzVsp6hb+mdE9UCWdZA2nEP4uWBXe8fUGh2GUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(38350700002)(41300700001)(2906002)(83380400001)(86362001)(66476007)(8676002)(4326008)(66556008)(316002)(6486002)(66946007)(6512007)(26005)(186003)(1076003)(8936002)(5660300002)(7416002)(478600001)(6506007)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tNuVaW2q7EaMR1zHRIRC0NcvH1cpi8pUSV75+FF6XuvI6sNWyQyHul5VZ8ps?=
 =?us-ascii?Q?MP7nOalF7fjG2df9ZcDe17I2qoc9oUCFpapu33/M44DiWQSfvp6Be3NRiA0Y?=
 =?us-ascii?Q?yYiyqSBX1pOHoMsuKDjPkofdKuI8nK97BgVa6ZVe9CgYz4Awv3lYRcXo8BQw?=
 =?us-ascii?Q?xE4iPkisUwKFmFhUMGSu3BX1NlMHKpS5Jr6WaaxOyaV1h7xBoq++W/U2uIZ4?=
 =?us-ascii?Q?367XnNCR0FrMxMxq5fl8P5HIJFJMmDi/rxXZiorsSrSVoIxgRraxZ6yk4+j+?=
 =?us-ascii?Q?WhUe363Q2k0BNPLSPmGDLtJDF6fhf91Xu77c6APYIwY76x+HVktw2qBZd9GA?=
 =?us-ascii?Q?RT1FUkDQDkIalW1aY5uPDKegmvrgqT012txdaB3amI+kjS5sTZJOMaN4rCyW?=
 =?us-ascii?Q?/3Y1wTnWIPckyv7cym1CrySmeTIn3rdNISx9tQVMX5PNM+AjgH2oAYBL+YTl?=
 =?us-ascii?Q?Pu1D+MM29RQFxndV9D6Vot2Z1C3/9CQLq654dyItsvyGXKc314YX2kG2AVTH?=
 =?us-ascii?Q?HcdTMS64hgBZ7I1dgTmSfwuF3nClkb7r2kUJlGPrfu2Laiqr/EzbqYLp9O+o?=
 =?us-ascii?Q?Z4Ugkw01ScGyLruT60JgRhQJBIugJDiYQUBP1avqVc4AnPFv0ifsTVHKF3DD?=
 =?us-ascii?Q?5UV4hEFG532Nj+D63QttCCHUwmNLCcGmFHFbvmQzlGn4ELwd3yYId7P5cOhE?=
 =?us-ascii?Q?56qY0CFyKAQ2gx7ukIYWpKEjEKLFD4Lv9oXo6CZXJu6a5cKV+HdkiiccoAeR?=
 =?us-ascii?Q?ajYfjFmulcdKEf7FTtzKu4G5rU2v1Tej0gox/CgZH5OMkjl67VtVfJwWXXkv?=
 =?us-ascii?Q?vquspAh/n9OELn6uFiZZrFKwJLNVLMBJ0bjjolvUDiW33jm7QNPond6jkq4z?=
 =?us-ascii?Q?b2VNKjrDw1FWX7dwOk0Wz1LwYwsz/NOXfR3a1jkZzfpYAMlhVxxjWU8SIw9I?=
 =?us-ascii?Q?50zfKohD6LSPFB65SOD7IdxneQiKzkzvYtgIyNqRbKmsdHHVAH/jXjf6523P?=
 =?us-ascii?Q?OtXj6bW5GXRFtk6x3ObqrGbF+tP/wHBlLm1TTT7RryeO9KqV3Vk2MGpkbBu5?=
 =?us-ascii?Q?pCUqG09ujSByQoBI/Ku9pmUoMidd4dToX3SUVjPCKtARrwBqoY6sqE8TsWXU?=
 =?us-ascii?Q?VZQcPh0MoDGD50pEJensB31nuWz++7j8ovUGwV30jHTiZ0c09fKfhcyi69Uk?=
 =?us-ascii?Q?d1Kd/E2p8AczZnTYQz2e2bnCmXE+3HECQKAiFWOxj9T83hI3TeVHCbbj1gkJ?=
 =?us-ascii?Q?hIcQCNnzaACcHbBZVulBvJIEtAgiLk2uJQ8iuGLtyxRSme+b7HBdLGqiSR6e?=
 =?us-ascii?Q?aSRIrptiWG3Wbg7re+jEgcvpYuyS9RbaOLgoPJv1cmCX0fYTDCEsxfycyqIv?=
 =?us-ascii?Q?VCqojpMcxLMUchHOswzGgHxjMTizrKH5RAObFId5sfQm/k6PS/FKUwoNxTmz?=
 =?us-ascii?Q?RsKDJVvQXf5UV9h785KMB+x8RVP3WaWJeEgCGpOgXzB8VwPiT6XFgWJvCa87?=
 =?us-ascii?Q?rKX4AbwfdJTRbQPxJikD+ggZMw5nCnX5NJr5S89kxQTfH9ue7wWfUVQgknNO?=
 =?us-ascii?Q?JRFfWdu7goW4fLYYh3KJcZNGlLjqPkArOE8J2DOd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aa7a1f-0bcd-4972-6f71-08dacb8cb59f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 06:50:43.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjJx4HMe9pEhnCpPjEsWbvglIOP2erg1zukY9h2rnxFe3OCCryzDMZ5Uexc2iCJdJf1t7A5mvkK/9321+qJc9w==
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

The BBNSM module includes a real time counter with alarm.
Add a RTC driver for this function.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/Kconfig     |  12 +++
 drivers/rtc/Makefile    |   1 +
 drivers/rtc/rtc-bbnsm.c | 223 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 drivers/rtc/rtc-bbnsm.c

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
index d3c042dcbc73..43bd29b2f42f 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_RTC_DRV_ASPEED)	+= rtc-aspeed.o
 obj-$(CONFIG_RTC_DRV_AT91RM9200)+= rtc-at91rm9200.o
 obj-$(CONFIG_RTC_DRV_AT91SAM9)	+= rtc-at91sam9.o
 obj-$(CONFIG_RTC_DRV_AU1XXX)	+= rtc-au1xxx.o
+obj-$(CONFIG_RTC_DRV_BBNSM)	+= rtc-bbnsm.o
 obj-$(CONFIG_RTC_DRV_BD70528)	+= rtc-bd70528.o
 obj-$(CONFIG_RTC_DRV_BQ32K)	+= rtc-bq32k.o
 obj-$(CONFIG_RTC_DRV_BQ4802)	+= rtc-bq4802.o
diff --git a/drivers/rtc/rtc-bbnsm.c b/drivers/rtc/rtc-bbnsm.c
new file mode 100644
index 000000000000..4157b238ed9a
--- /dev/null
+++ b/drivers/rtc/rtc-bbnsm.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2022 NXP.
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/rtc.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
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
+#define BBNSM_EVENT_TA	TA_EN
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
+	u32 event = 0;
+
+	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &val);
+	if (val & BBNSM_EVENT_TA) {
+		event |= (RTC_AF | RTC_IRQF);
+		bbnsm_rtc_alarm_irq_enable(dev, false);
+		/* clear the alarm event */
+		regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS, TA_EN_MSK, BBNSM_EVENT_TA);
+		rtc_update_irq(bbnsm->rtc, 1, event);
+	}
+
+	return event ? IRQ_HANDLED : IRQ_NONE;
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
+	bbnsm->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
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
+	/* Enable the Real-Time counter */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
+
+	device_init_wakeup(&pdev->dev, true);
+	ret = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to enable the irq wakeup\n");
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

