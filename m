Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF68A3E0CD2
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Aug 2021 05:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbhHEDhd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 23:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhHEDhc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Aug 2021 23:37:32 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe06::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5958C061765;
        Wed,  4 Aug 2021 20:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqWg5SQk4yF4z3aLWYyy3RNrrwCB+0DRWkq5CbqyqfS0HqZZKTb+FfTGt+FoLojXEiDT0Fr723bXjYpcbBhlGyh5eDgvqqnzN0RPJibBv0S56dK4qoAdWDYoDPyyNTrLdOJhAP0dybysIbtMxPBbZuKcvNY8Nr1iImS7tq5v3A/xfRMXm4hwz7rR/qmujuG/EJx7KD+hgeHkqOSdOd1+DzlSx9QtjA7UT7V6Mvxa+4cm6RiOxCX+i+FeWuebAJSGM243VwkY419rbgIz6/+BwiLtzPaxBNphPRMPNRG2ERAbHzwuVo5UpTILzMdJsR30qjtayRxxt6jjQuvpJBs4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ezj/WMHiV/p31H30rOeTylX9CC9DKe+LSVLEJ00A9s8=;
 b=hbDlKi0/ZuBV5iXEwU+W7RYRH1BUUA2loSST6RY3ZVJSy7qjU60LgMinWWzW6X1K/xiqJPrShyfvicxUZXvQ6px08nuW1MF9uRDQmkhNDZMlghhbzpjgIrdPSpzrYtgk2ZMHUOP00rihXAsNh0RgAZ7/uRta6ZlrWlXIUSaN4A7Jc4QuZukRWNCoooS5A16Ifam6tztZE4YRsYH6SDJ9XdFCmEScRC1oBlOMb/WZVIZOYhuoaLlhO79WDre1mOYugyRvTL/5/seUpbCzuj/rBwbjbbLP+Jr3FYrEIo3c4hI8pDVR5mj1lV+6HIdvclwTkj4iU8k4GALjN+KEflPGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ezj/WMHiV/p31H30rOeTylX9CC9DKe+LSVLEJ00A9s8=;
 b=il7Znne6S8V+AHM1QvXHCs9DKyDZQqOmT0jqoXMAVfI4KnAI2Sbkg6zMsKFQE9sjiOI3D707r98Egrt8A+2q9faum/C5dcwcCcLnNO9gA9kLcwwmI1Ei06Yuk6O9POLl7NjoASXWc/pBb7mXo/UA8xHArdjUrFPH+DEGPSlB6cg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 03:36:46 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:36:46 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, aisheng.dong@nxp.com, dongas86@gmail.com,
        robh+dt@kernel.org, shawnguo@kernel.org, peng.fan@nxp.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] rtc: imx-rpmsg: Add i.MX RPMSG RTC support
Date:   Thu,  5 Aug 2021 11:35:46 +0800
Message-Id: <20210805033546.1390950-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805033546.1390950-1-aisheng.dong@nxp.com>
References: <20210805033546.1390950-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0059.apcprd02.prod.outlook.com (2603:1096:4:54::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:36:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d2add5c-0f84-457d-ac06-08d957c2400c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB88376DCB1E5F9953D01F3F4580F29@DU2PR04MB8837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZb2ytCAhGZOs1JdFJCq4PGKry+nrQmthz6c/CmSNmm5S1gQqAQpppC2XNGGHNN/NoQC2Mr+3/XhP0HjpWbmGAl6SsCQPMTwmWf2XvIoVVXjGjgdo2jSKyySHXH2bXkgXp7xQwfZGh9mBC9Ln3dS80b8Qbam9H+rWleZnaQRWXj8dV+ImahWu+8FBUY6HcqDO4XnsHV5xRZRSMiRMdeRkP7OubKW7oP2m65yEjRxWkwaMI5X1MTNFHwA2hN99Se9749vKm8ti6fDLWRoZF8QI5bWbFesp6BHioIgUAuB2qit6deMRguzrNr1ZV5qEzgKB59mEXDr7HJ0TaW+CKf5YqobXlr9KdUVS4RSTxDWF9u3zQxUBCdQJwpoTYkkO8mvJ+IrpPITTA42AJIVvPj2qKwmyGTIPa4iVMyen/FkvAqDUyUQgNDZBpMBKknErr943qD1Pwio8ZAHBzzixM/2ALpMuxcrbCYB7CXOQ7PuNcgGfLuSVQoRrZ5gzIy3wW84z92xtpFotlI9LO1sfb2ogVmyeLsaGI4lwMEDRoxvU2EQRAZXHSiQtE5x092cIjsGSq7goZaxwPJcYZq6QtQEG1UeWgdifxi2psJ259aT6JThmTVEbjAVbtmxBnyyhL3P31KAWuPvyvxF8i62IsPpKgvv1+OsaojmdNoKotaDvBe1NYAdgjxW1LbPa50bVGDg9fR489QyE6JGZdfC43CPog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(5660300002)(26005)(6506007)(478600001)(4326008)(66556008)(8676002)(66476007)(186003)(66946007)(316002)(86362001)(6486002)(52116002)(1076003)(83380400001)(36756003)(8936002)(6512007)(38350700002)(2906002)(38100700002)(54906003)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/NAwp5WLt5nnb5b7jRN/baH6oSP6xZlkfaQn3oWzjRW1Lip3W88xZ+mKhEGH?=
 =?us-ascii?Q?rnE1Le/l31QS7jkcrs7mw1hNzOK8VxFAntlxaaz0ac54q+asNyi4zSQlINg0?=
 =?us-ascii?Q?15Q8zMiwbdbVC2Oxe1xe4FEzUTPkq2b+Ew+ZdVPo3OTP1IO/h3xR6qqP51cl?=
 =?us-ascii?Q?Px4yu/1yR7QViPwnA0jOt7J+VxFpqGshTVMSaHPIoqVYLbqw7oMwT+KirtpJ?=
 =?us-ascii?Q?qy5VzvADGgp6F4baGuygN3vKhK35wVGweVUwx+p+l98VXPwiMxfDdCiW5ARk?=
 =?us-ascii?Q?gEupmOWuiP8I4xatKi2xXTDDHUbwW9V6kX8eg/zjwvP/1Lcm0KDh8puGiG1O?=
 =?us-ascii?Q?/ZlJW8hGPTZTXHP5PW0nGVlGZR+lsf9XZk0Gnpm4PDIerQP5EaMPPUZ1FWyk?=
 =?us-ascii?Q?P+HZC2ZSMR3FEliudXBIcNEAZIURl/nc2pLD2l2cZ2CTDr2ZiaYMdOOSIM+7?=
 =?us-ascii?Q?HxWqYVCh6CFq0uIWmleVCtIoCqNxuSMfiPIYKZrfkfr377mKljz0hYBo9a2j?=
 =?us-ascii?Q?nDb0w+a461EpmBOqg/kYgeTZXRGVORjNum6kOPmbkhUR5tccH1K/Grbx4wky?=
 =?us-ascii?Q?86whJ6Wn5KwSYdhyqSMAcU92BMLth0wMXRudptltdadg0jfvhE6hXbVglfCa?=
 =?us-ascii?Q?C7QH+iCHjyIE+jdtlIOOQ7cSMvqqmgoaL+Pyec1BEnE4o9beAo52bnLbIR4w?=
 =?us-ascii?Q?S+oAE+kWW42y4yyVDw/QHed+BIm1gZza0DzlF+A76Z1wvyGTVB8BNv0oo8Y2?=
 =?us-ascii?Q?ZfCrTINP1aPxUL4mLBrcyj6sB8B9EbtHKsyguxTz8nCtd5gFRICMiLY6cD3+?=
 =?us-ascii?Q?qiWwVF63ZGrYdycSsF/dm7h35IGEijiawMaVYnuhWgDIF5aYZkS+ceDepElz?=
 =?us-ascii?Q?3HhWHDdqCoFPbgK50TBBmqYCq1DKv2fyzuy1MSle2NeT0D1oYqSL0ct8ehOm?=
 =?us-ascii?Q?kzLE/MJlTkrz2M2gynkVTpi8dUQwpZOXj9R2pXXE3dMyK6TJMQQ0NKgNJJAT?=
 =?us-ascii?Q?hegYO+GWQu4ORDbWROMHBQu6odKtvP6Jt1AyF8hgJfKN2R0+cdFidOcK8/tJ?=
 =?us-ascii?Q?oMq6DQ4Uf6qWZ0mzHD57bVgARVF7n1SnVcbis0Ra0Bf/N2sZW2lsw3ZSgzxS?=
 =?us-ascii?Q?AvmEv6I0zmzpJ6pmn1f5VY5q8Kai9JoIqUceJY9QSYdZhemQP/BwxtyxRsl3?=
 =?us-ascii?Q?9VuY+dpWyCwbKfmOaoxiHGplhySd5GkMoMpPKirJg27+yrMbXpeWCGxlMwYU?=
 =?us-ascii?Q?zkR3f7i8Z2zXTxmfjBRCRg2G27hAc6wS88KdkV4S5XemBZu1X+S6fvWH8hJo?=
 =?us-ascii?Q?Nd9rNcZEk3Icatf01YoFFm/Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2add5c-0f84-457d-ac06-08d957c2400c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:36:46.2098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOu6KOs0WEpKpoTbgUmPhHK18X1lH/Lq/r+GuF4YQKiDQrEjrcl2Wlh15ZtBlujL/YGZhHzNRCoN9ikpbu+5jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add i.MX RPMSG RTC support.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/rtc/Kconfig                |  10 +
 drivers/rtc/Makefile               |   1 +
 drivers/rtc/rtc-imx-rpmsg.c        | 301 +++++++++++++++++++++++++++++
 include/linux/firmware/imx/rpmsg.h |  37 ++++
 4 files changed, 349 insertions(+)
 create mode 100644 drivers/rtc/rtc-imx-rpmsg.c
 create mode 100644 include/linux/firmware/imx/rpmsg.h

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 12153d5801ce..f0e6c4dd8965 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1763,6 +1763,16 @@ config RTC_DRV_SNVS
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-snvs".
 
+config RTC_DRV_IMX_RPMSG
+	tristate "NXP RPMSG RTC support"
+	select RPMSG_VIRTIO
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on IMX_REMOTEPROC
+	depends on OF
+	help
+	   If you say yes here you get support for the NXP RPMSG
+	   RTC module.
+
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 2dd0dd956b0e..9cebfddcc245 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_RTC_DRV_GOLDFISH)	+= rtc-goldfish.o
 obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
+obj-$(CONFIG_RTC_DRV_IMX_RPMSG)	+= rtc-imx-rpmsg.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
diff --git a/drivers/rtc/rtc-imx-rpmsg.c b/drivers/rtc/rtc-imx-rpmsg.c
new file mode 100644
index 000000000000..0d6d4b18159e
--- /dev/null
+++ b/drivers/rtc/rtc-imx-rpmsg.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2017-2021 NXP
+ */
+
+#include <linux/firmware/imx/rpmsg.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_qos.h>
+#include <linux/rpmsg.h>
+#include <linux/rtc.h>
+
+#define RPMSG_TIMEOUT 1000
+
+#define RTC_RPMSG_SEND		0x0
+#define RTC_RPMSG_RECEIVE	0x1
+#define RTC_RPMSG_NOTIFY	0x2
+
+enum rtc_rpmsg_cmd {
+	RTC_RPMSG_SET_TIME,
+	RTC_RPMSG_GET_TIME,
+	RTC_RPMSG_SET_ALARM,
+	RTC_RPMSG_GET_ALARM,
+	RTC_RPMSG_ENABLE_ALARM,
+};
+
+struct rtc_rpmsg_data {
+	struct imx_rpmsg_head header;
+	u8 reserved0;
+	union {
+		u8 reserved1;
+		u8 ret;
+	};
+	union {
+		u32 reserved2;
+		u32 sec;
+	};
+	union {
+		u8 enable;
+		u8 reserved3;
+	};
+	union {
+		u8 pending;
+		u8 reserved4;
+	};
+} __packed;
+
+struct rtc_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct rtc_rpmsg_data *msg;
+	struct pm_qos_request pm_qos_req;
+	struct completion cmd_complete;
+	struct mutex lock;
+	struct rtc_device *rtc;
+};
+
+static int rtc_send_message(struct rtc_rpmsg_info *info,
+			    struct rtc_rpmsg_data *msg, bool ack)
+{
+	struct device *dev = &info->rpdev->dev;
+	int err;
+
+	mutex_lock(&info->lock);
+
+	cpu_latency_qos_add_request(&info->pm_qos_req, 0);
+	reinit_completion(&info->cmd_complete);
+
+	err = rpmsg_send(info->rpdev->ept, (void *)msg, sizeof(*msg));
+	if (err) {
+		dev_err(dev, "rpmsg send failed: %d\n", err);
+		goto err_out;
+	}
+
+	if (ack) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(dev, "rpmsg send timeout\n");
+			err = -ETIMEDOUT;
+			goto err_out;
+		}
+
+		if (info->msg->ret != 0) {
+			dev_err(dev, "rpmsg not ack %d\n", info->msg->ret);
+			err = -EINVAL;
+			goto err_out;
+		}
+
+		err = 0;
+	}
+
+err_out:
+	cpu_latency_qos_remove_request(&info->pm_qos_req);
+	mutex_unlock(&info->lock);
+
+	return err;
+}
+
+static int imx_rpmsg_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
+	struct rtc_rpmsg_data msg;
+	int ret;
+
+	msg.header.cate = IMX_RPMSG_RTC;
+	msg.header.major = IMX_RMPSG_MAJOR;
+	msg.header.minor = IMX_RMPSG_MINOR;
+	msg.header.type = RTC_RPMSG_SEND;
+	msg.header.cmd = RTC_RPMSG_GET_TIME;
+
+	ret = rtc_send_message(rtc_rpmsg, &msg, true);
+	if (ret)
+		return ret;
+
+	rtc_time64_to_tm(rtc_rpmsg->msg->sec, tm);
+
+	return 0;
+}
+
+static int imx_rpmsg_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
+	struct rtc_rpmsg_data msg;
+	unsigned long time;
+	int ret;
+
+	time = rtc_tm_to_time64(tm);
+
+	msg.header.cate = IMX_RPMSG_RTC;
+	msg.header.major = IMX_RMPSG_MAJOR;
+	msg.header.minor = IMX_RMPSG_MINOR;
+	msg.header.type = RTC_RPMSG_SEND;
+	msg.header.cmd = RTC_RPMSG_SET_TIME;
+	msg.sec = time;
+
+	ret = rtc_send_message(rtc_rpmsg, &msg, true);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int imx_rpmsg_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
+	struct rtc_rpmsg_data msg;
+	int ret;
+
+	msg.header.cate = IMX_RPMSG_RTC;
+	msg.header.major = IMX_RMPSG_MAJOR;
+	msg.header.minor = IMX_RMPSG_MINOR;
+	msg.header.type = RTC_RPMSG_SEND;
+	msg.header.cmd = RTC_RPMSG_GET_ALARM;
+
+	ret = rtc_send_message(rtc_rpmsg, &msg, true);
+	if (ret)
+		return ret;
+
+	rtc_time64_to_tm(rtc_rpmsg->msg->sec, &alrm->time);
+	alrm->pending = rtc_rpmsg->msg->pending;
+
+	return 0;
+}
+
+static int imx_rpmsg_rtc_alarm_irq_enable(struct device *dev,
+	unsigned int enable)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
+	struct rtc_rpmsg_data msg;
+	int ret;
+
+	msg.header.cate = IMX_RPMSG_RTC;
+	msg.header.major = IMX_RMPSG_MAJOR;
+	msg.header.minor = IMX_RMPSG_MINOR;
+	msg.header.type = RTC_RPMSG_SEND;
+	msg.header.cmd = RTC_RPMSG_ENABLE_ALARM;
+	msg.enable = enable;
+
+	ret = rtc_send_message(rtc_rpmsg, &msg, true);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int imx_rpmsg_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
+	struct rtc_rpmsg_data msg;
+	unsigned long time;
+	int ret;
+
+	time = rtc_tm_to_time64(&alrm->time);
+
+	msg.header.cate = IMX_RPMSG_RTC;
+	msg.header.major = IMX_RMPSG_MAJOR;
+	msg.header.minor = IMX_RMPSG_MINOR;
+	msg.header.type = RTC_RPMSG_SEND;
+	msg.header.cmd = RTC_RPMSG_SET_ALARM;
+	msg.sec = time;
+	msg.enable = alrm->enabled;
+
+	ret = rtc_send_message(rtc_rpmsg, &msg, true);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct rtc_class_ops imx_rpmsg_rtc_ops = {
+	.read_time = imx_rpmsg_rtc_read_time,
+	.set_time = imx_rpmsg_rtc_set_time,
+	.read_alarm = imx_rpmsg_rtc_read_alarm,
+	.set_alarm = imx_rpmsg_rtc_set_alarm,
+	.alarm_irq_enable = imx_rpmsg_rtc_alarm_irq_enable,
+};
+
+static int rtc_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rtc_rpmsg_info *rtc_rpmsg;
+
+	dev_info(dev, "new channel: 0x%x -> 0x%x\n", rpdev->src, rpdev->dst);
+
+	rtc_rpmsg = devm_kzalloc(dev, sizeof(*rtc_rpmsg), GFP_KERNEL);
+	if (!rtc_rpmsg)
+		return -ENOMEM;
+
+	rtc_rpmsg->rpdev = rpdev;
+	mutex_init(&rtc_rpmsg->lock);
+	init_completion(&rtc_rpmsg->cmd_complete);
+
+	dev_set_drvdata(dev, rtc_rpmsg);
+
+	device_init_wakeup(dev, true);
+
+	rtc_rpmsg->rtc = devm_rtc_device_register(dev, "rtc-rpmsg",
+						  &imx_rpmsg_rtc_ops,
+						  THIS_MODULE);
+	if (IS_ERR(rtc_rpmsg->rtc)) {
+		dev_err(dev, "failed to register rtc rpmsg: %ld\n", PTR_ERR(rtc_rpmsg->rtc));
+		return PTR_ERR(rtc_rpmsg->rtc);
+	}
+
+	return 0;
+}
+
+static void rtc_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	dev_info(&rpdev->dev, "rtc rpmsg driver is removed\n");
+}
+
+static int rtc_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			void *priv, u32 src)
+{
+	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rtc_rpmsg_data *msg = (struct rtc_rpmsg_data *)data;
+
+	rtc_rpmsg->msg = msg;
+
+	if (msg->header.type == RTC_RPMSG_RECEIVE)
+		complete(&rtc_rpmsg->cmd_complete);
+	else if (msg->header.type == RTC_RPMSG_NOTIFY)
+		rtc_update_irq(rtc_rpmsg->rtc, 1, RTC_IRQF);
+	else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static const struct rpmsg_device_id rtc_rpmsg_id_table[] = {
+	{ .name	= "rpmsg-rtc-channel" },
+	{ },
+};
+
+static struct rpmsg_driver rtc_rpmsg_driver = {
+	.drv.name	= "imx_rtc_rpmsg",
+	.probe		= rtc_rpmsg_probe,
+	.remove		= rtc_rpmsg_remove,
+	.callback	= rtc_rpmsg_cb,
+	.id_table	= rtc_rpmsg_id_table,
+};
+
+/*
+ * imx m4 has a limitation that we can't read data during ns process.
+ * So register rtc a little bit late as rtc core will read data during
+ * register process
+ */
+static int __init rtc_rpmsg_init(void)
+{
+	return register_rpmsg_driver(&rtc_rpmsg_driver);
+}
+late_initcall(rtc_rpmsg_init);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX RPMSG RTC Driver");
+MODULE_ALIAS("platform:imx_rtc_rpmsg");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/rpmsg.h b/include/linux/firmware/imx/rpmsg.h
new file mode 100644
index 000000000000..20bcce23c917
--- /dev/null
+++ b/include/linux/firmware/imx/rpmsg.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019-2021 NXP.
+ */
+
+#ifndef __LINUX_IMX_RPMSG_H__
+#define __LINUX_IMX_RPMSG_H__
+
+#include <linux/types.h>
+
+/*
+ * Global header file for iMX RPMSG
+ */
+
+/* Category define */
+#define IMX_RMPSG_LIFECYCLE     1
+#define IMX_RPMSG_PMIC          2
+#define IMX_RPMSG_AUDIO         3
+#define IMX_RPMSG_KEY           4
+#define IMX_RPMSG_GPIO          5
+#define IMX_RPMSG_RTC           6
+#define IMX_RPMSG_SENSOR        7
+
+/* rpmsg version */
+#define IMX_RMPSG_MAJOR         1
+#define IMX_RMPSG_MINOR         0
+
+struct imx_rpmsg_head {
+	u8 cate;
+	u8 major;
+	u8 minor;
+	u8 type;
+	u8 cmd;
+	u8 reserved[5];
+} __packed;
+
+#endif /* __LINUX_IMX_RPMSG_H__ */
-- 
2.25.1

