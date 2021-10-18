Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BC143229B
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbhJRPVw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:21:52 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:41349 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbhJRPVv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 64FF2100002;
        Mon, 18 Oct 2021 15:19:39 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] rtc: add parameter ioctl
Date:   Mon, 18 Oct 2021 17:19:28 +0200
Message-Id: <20211018151933.76865-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
References: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add an ioctl allowing to get and set extra parameters for an RTC. For now,
only handle getting available features.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/dev.c        | 40 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/rtc.h | 18 ++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 5b8ebe86124a..143c097eff0f 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -208,6 +208,7 @@ static long rtc_dev_ioctl(struct file *file,
 	const struct rtc_class_ops *ops = rtc->ops;
 	struct rtc_time tm;
 	struct rtc_wkalrm alarm;
+	struct rtc_param param;
 	void __user *uarg = (void __user *)arg;
 
 	err = mutex_lock_interruptible(&rtc->ops_lock);
@@ -221,6 +222,7 @@ static long rtc_dev_ioctl(struct file *file,
 	switch (cmd) {
 	case RTC_EPOCH_SET:
 	case RTC_SET_TIME:
+	case RTC_PARAM_SET:
 		if (!capable(CAP_SYS_TIME))
 			err = -EACCES;
 		break;
@@ -382,6 +384,44 @@ static long rtc_dev_ioctl(struct file *file,
 			err = -EFAULT;
 		return err;
 
+	case RTC_PARAM_GET:
+		if (copy_from_user(&param, uarg, sizeof(param))) {
+			mutex_unlock(&rtc->ops_lock);
+			return -EFAULT;
+		}
+
+		switch(param.param) {
+			long offset;
+		case RTC_PARAM_FEATURES:
+			if (param.index != 0)
+				err = -EINVAL;
+			param.uvalue = rtc->features[0];
+			break;
+
+		default:
+			err = -EINVAL;
+		}
+
+		if (!err)
+			if (copy_to_user(uarg, &param, sizeof(param)))
+				err = -EFAULT;
+
+		break;
+
+	case RTC_PARAM_SET:
+		if (copy_from_user(&param, uarg, sizeof(param))) {
+			mutex_unlock(&rtc->ops_lock);
+			return -EFAULT;
+		}
+
+		switch(param.param) {
+		case RTC_PARAM_FEATURES:
+		default:
+			err = -EINVAL;
+		}
+
+		break;
+
 	default:
 		/* Finally try the driver's ioctl interface */
 		if (ops->ioctl) {
diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index f4037c541925..3241f9ecc639 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -14,6 +14,7 @@
 
 #include <linux/const.h>
 #include <linux/ioctl.h>
+#include <linux/types.h>
 
 /*
  * The struct used to pass data via the following ioctl. Similar to the
@@ -66,6 +67,17 @@ struct rtc_pll_info {
 	long pll_clock;     /* base PLL frequency */
 };
 
+struct rtc_param {
+	__u64 param;
+	union {
+		__u64 uvalue;
+		__s64 svalue;
+		__u64 ptr;
+	};
+	__u32 index;
+	__u32 __pad;
+};
+
 /*
  * ioctl calls that are permitted to the /dev/rtc interface, if
  * any of the RTC drivers are enabled.
@@ -95,6 +107,9 @@ struct rtc_pll_info {
 #define RTC_PLL_GET	_IOR('p', 0x11, struct rtc_pll_info)  /* Get PLL correction */
 #define RTC_PLL_SET	_IOW('p', 0x12, struct rtc_pll_info)  /* Set PLL correction */
 
+#define RTC_PARAM_GET	_IOW('p', 0x13, struct rtc_param)  /* Get parameter */
+#define RTC_PARAM_SET	_IOW('p', 0x14, struct rtc_param)  /* Set parameter */
+
 #define RTC_VL_DATA_INVALID	_BITUL(0) /* Voltage too low, RTC data is invalid */
 #define RTC_VL_BACKUP_LOW	_BITUL(1) /* Backup voltage is low */
 #define RTC_VL_BACKUP_EMPTY	_BITUL(2) /* Backup empty or not present */
@@ -118,6 +133,9 @@ struct rtc_pll_info {
 #define RTC_FEATURE_UPDATE_INTERRUPT	4
 #define RTC_FEATURE_CNT			5
 
+/* parameter list */
+#define RTC_PARAM_FEATURES		0
+
 #define RTC_MAX_FREQ	8192
 
 
-- 
2.31.1

