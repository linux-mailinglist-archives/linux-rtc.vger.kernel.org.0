Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED724322A2
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbhJRPWA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:22:00 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44167 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbhJRPVz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:55 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F0570240015;
        Mon, 18 Oct 2021 15:19:42 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] rtc: add BSM parameter
Date:   Mon, 18 Oct 2021 17:19:31 +0200
Message-Id: <20211018151933.76865-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
References: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

BSM or Backup Switch Mode is a common feature on RTCs, allowing to select
how the RTC will decide when to switch from its primary power supply to the
backup power supply. It is necessary to be able to set it from userspace as
there are uses cases where it has to be done dynamically.

Supported values are:
  RTC_BSM_DISABLED: disabled
  RTC_BSM_DIRECT: switching will happen as soon as Vbackup > Vdd
  RTC_BSM_LEVEL: switching will happen around a threshold, usually with an
  hysteresis
  RTC_BSM_STANDBY: switching will not happen until Vdd > Vbackup, this is
  useful to ensure the RTC doesn't draw any power until the device is first
  powered on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/dev.c        | 10 ++++++++--
 include/linux/rtc.h      |  2 ++
 include/uapi/linux/rtc.h |  9 ++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index abee1fc4705e..e104972a28fd 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -409,7 +409,10 @@ static long rtc_dev_ioctl(struct file *file,
 			break;
 
 		default:
-			err = -EINVAL;
+			if (rtc->ops->param_get)
+				err = rtc->ops->param_get(rtc->dev.parent, &param);
+			else
+				err = -EINVAL;
 		}
 
 		if (!err)
@@ -436,7 +439,10 @@ static long rtc_dev_ioctl(struct file *file,
 			return rtc_set_offset(rtc, param.svalue);
 
 		default:
-			err = -EINVAL;
+			if (rtc->ops->param_set)
+				err = rtc->ops->param_set(rtc->dev.parent, &param);
+			else
+				err = -EINVAL;
 		}
 
 		break;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 354e0843ab17..47fd1c2d3a57 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -66,6 +66,8 @@ struct rtc_class_ops {
 	int (*alarm_irq_enable)(struct device *, unsigned int enabled);
 	int (*read_offset)(struct device *, long *offset);
 	int (*set_offset)(struct device *, long offset);
+	int (*param_get)(struct device *, struct rtc_param *param);
+	int (*param_set)(struct device *, struct rtc_param *param);
 };
 
 struct rtc_device;
diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 5debe82439c2..03e5b776e597 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -132,11 +132,18 @@ struct rtc_param {
 #define RTC_FEATURE_ALARM_RES_2S	3
 #define RTC_FEATURE_UPDATE_INTERRUPT	4
 #define RTC_FEATURE_CORRECTION		5
-#define RTC_FEATURE_CNT			6
+#define RTC_FEATURE_BACKUP_SWITCH_MODE	6
+#define RTC_FEATURE_CNT			7
 
 /* parameter list */
 #define RTC_PARAM_FEATURES		0
 #define RTC_PARAM_CORRECTION		1
+#define RTC_PARAM_BACKUP_SWITCH_MODE	2
+
+#define RTC_BSM_DISABLED	0
+#define RTC_BSM_DIRECT		1
+#define RTC_BSM_LEVEL		2
+#define RTC_BSM_STANDBY		3
 
 #define RTC_MAX_FREQ	8192
 
-- 
2.31.1

