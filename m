Return-Path: <linux-rtc+bounces-5779-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031CD3A0CE
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 08:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 491F430086F1
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 07:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A30338931;
	Mon, 19 Jan 2026 07:57:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA86500964
	for <linux-rtc@vger.kernel.org>; Mon, 19 Jan 2026 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809440; cv=none; b=rSLnQMuD6SSjDR0tRw7WGnsaBAKcjtaF3XQPsMkOYU1F5tE+oTHEgTO082eNZ5rdOZ2xxUvwozkNDX6vt/UMk8nUuyp8tT+HMCFhFyhpSMypA0GnYK5UR8dUMWBEX0ds1bAbt/xFjgHPUzm3N0y3UQz6EMNa5YxQFgZFWngXavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809440; c=relaxed/simple;
	bh=URSIX1L1XRwcnjpDF60ehtlYKjNZ54rdLkHbawaeZ3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TpjB43d/X+MhE4bz3Jp7E3JzaIk78+CSuyabhsM0zBCzg63qKpakmKJWitfbwo+vBwqw+oSy9btH1uzbzYnuT8qQsPwKLMke5RdwWmJq5bdhC5QEpSaa0XjI3FeZUl+E6tk2UWcA/HetlhwHEwl2SXKJIKWCDgr9pnFeAPiIm/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f5381d168so3662987b3a.2
        for <linux-rtc@vger.kernel.org>; Sun, 18 Jan 2026 23:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768809438; x=1769414238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r1aVO8rEMV3iAHa78OH6vdU8Vf6tJYYIKfUUGULuyA=;
        b=SWDDdecsjAXLERkX15M7IkUCEtppugfJK3IU4Fg8pwKDlKQDEST6LGqfuJPwvf9atj
         T9Vq9k0VIBAWXP4aIlV7u2AOVzIJfsU82Nx6/nCuaskyrgAfFYKoKmBhwE5Wf8R6rCuD
         hbqPrg43CRaSqpwuexmOhRgnfGFz6x1ul7ve4a0NStPg12BeIa70og+wU/d7qUFNqIUF
         BQXyM+dKEviTFaH6Bic5CIlffzodglZRLwLr8TJn4fdpGTUsci7nhpBsYgUEshfaLWMb
         1LOUg/Z+4iisJH1d37uhpKm3VjuWb5rAq7ya5U9QE8yCiLHdcGVHQqePe08g/X7nBkC6
         G6xQ==
X-Gm-Message-State: AOJu0YxYl3dn0QTM89gadd2E4VpUpk7JfcPQaV23gH+574M8toLOKowc
	4Q0Yl3ur6zqz0UiIkwB/sEdN7kQ3uc964Gnj15uxfmNkkZ9ldA4xgqbgi3N7hp0GZ0w=
X-Gm-Gg: AY/fxX7JStsI03Icyj1+5HR5cqg87/XVySW4i6j77Uxn4N5WCUp8epXOqtnwy5eS6rV
	UjDFeKd9s7kBM2+ohiitBIA5z5PHVbjKW8stkOM1jwEaumoi/ZH+zfyR/cCeBx09RYiR+3WeZSX
	cp/ccRGhoYzVclnNjpFKU6bJZaaSiyc42hbKTWaE3FY50L3JufoRPDRRewA0wrkKXmjx6WgsvDP
	MkIpMQ1ZyGPvv8uR7G4fV4+cBFzklzzTBiDEkpq0QNk9BzSSaYg6GQOLr5hhc2VEXbiylU+1rwx
	/Q15jzoWDLvqlizGbYEpNd00iOmRU4pibuq7ykx7GdAzkc5f8ZMBK2gUp29aBW3UxHw1S85mBDY
	r1PWzk+20k7d2TkZtjArfu6kD4RGUq+4iAbzd+VVPSLBE6QnZaupkJGY9ovOdRgOIlVl+L3XGTE
	94zfLmvR8cfkhQp743SrLZsw4RWzdg2HySlSxSbrsDmYDm
X-Received: by 2002:a05:6a00:a245:b0:7ff:d378:98f with SMTP id d2e1a72fcca58-81fa01da21cmr9902157b3a.37.1768809438010;
        Sun, 18 Jan 2026 23:57:18 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277a15sm8415339b3a.42.2026.01.18.23.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:57:17 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1] rtc: add device selector for rtc_class_ops callbacks
Date: Mon, 19 Jan 2026 15:57:10 +0800
Message-ID: <20260119075710.2078816-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rtc_ops_dev() helper to allow drivers to choose whether
rtc_class_ops callbacks receive rtc->dev or rtc->dev.parent. This
enables Rust RTC drivers to store driver data on the RTC device [1].

The helper checks RTC_OPS_USE_RTC_DEV flag: if set, returns &rtc->dev;
otherwise returns rtc->dev.parent.

Update all rtc_class_ops callback invocations to use rtc_ops_dev(rtc)
instead of directly accessing rtc->dev.parent.

Maintains backward compatibility for existing C drivers.

Link: https://lore.kernel.org/rust-for-linux/DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org/ [1]
Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/dev.c       |  6 +++---
 drivers/rtc/interface.c | 18 +++++++++---------
 drivers/rtc/proc.c      |  2 +-
 include/linux/rtc.h     | 15 +++++++++++++++
 4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index baf1a8ca8b2b1..eddcc5a69db3b 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
 		}
 		default:
 			if (rtc->ops->param_get)
-				err = rtc->ops->param_get(rtc->dev.parent, &param);
+				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
 			else
 				err = -EINVAL;
 		}
@@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
 
 		default:
 			if (rtc->ops->param_set)
-				err = rtc->ops->param_set(rtc->dev.parent, &param);
+				err = rtc->ops->param_set(rtc_ops_dev(rtc), &param);
 			else
 				err = -EINVAL;
 		}
@@ -450,7 +450,7 @@ static long rtc_dev_ioctl(struct file *file,
 	default:
 		/* Finally try the driver's ioctl interface */
 		if (ops->ioctl) {
-			err = ops->ioctl(rtc->dev.parent, cmd, arg);
+			err = ops->ioctl(rtc_ops_dev(rtc), cmd, arg);
 			if (err == -ENOIOCTLCMD)
 				err = -ENOTTY;
 		} else {
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index b8b298efd9a9c..4c81130fb0394 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
 		err = -EINVAL;
 	} else {
 		memset(tm, 0, sizeof(struct rtc_time));
-		err = rtc->ops->read_time(rtc->dev.parent, tm);
+		err = rtc->ops->read_time(rtc_ops_dev(rtc), tm);
 		if (err < 0) {
 			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
 				err);
@@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	if (!rtc->ops)
 		err = -ENODEV;
 	else if (rtc->ops->set_time)
-		err = rtc->ops->set_time(rtc->dev.parent, tm);
+		err = rtc->ops->set_time(rtc_ops_dev(rtc), tm);
 	else
 		err = -EINVAL;
 
@@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_wday = -1;
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
-		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->read_alarm(rtc_ops_dev(rtc), alarm);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
@@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		err = -EINVAL;
 	else
-		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->set_alarm(rtc_ops_dev(rtc), alarm);
 
 	/*
 	 * Check for potential race described above. If the waiting for next
@@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		err = -EINVAL;
 	else
-		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
+		err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), enabled);
 
 	mutex_unlock(&rtc->ops_lock);
 
@@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
 		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
-			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+			err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), 1);
 		if (err)
 			goto out;
 	} else {
@@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
 	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		return;
 
-	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
+	rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), false);
 	trace_rtc_alarm_irq_enable(0, 0);
 }
 
@@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->read_offset(rtc_ops_dev(rtc), offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_read_offset(*offset, ret);
@@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->set_offset(rtc_ops_dev(rtc), offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_set_offset(offset, ret);
diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
index cbcdbb19d848e..bf688079d0fbb 100644
--- a/drivers/rtc/proc.c
+++ b/drivers/rtc/proc.c
@@ -73,7 +73,7 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
 	seq_printf(seq, "24hr\t\t: yes\n");
 
 	if (ops->proc)
-		ops->proc(rtc->dev.parent, seq);
+		ops->proc(rtc_ops_dev(rtc), seq);
 
 	return 0;
 }
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 95da051fb155d..1dd4a45d0186e 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -83,6 +83,7 @@ struct rtc_timer {
 /* flags */
 #define RTC_DEV_BUSY 0
 #define RTC_NO_CDEV  1
+#define RTC_OPS_USE_RTC_DEV 2
 
 struct rtc_device {
 	struct device dev;
@@ -167,6 +168,20 @@ struct rtc_device {
 #define rtc_lock(d) mutex_lock(&d->ops_lock)
 #define rtc_unlock(d) mutex_unlock(&d->ops_lock)
 
+/**
+ * rtc_ops_dev - Get the device pointer for RTC ops callbacks
+ * @rtc: RTC device
+ *
+ * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
+ * otherwise returns rtc->dev.parent.
+ */
+static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
+{
+	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
+		return &rtc->dev;
+	return rtc->dev.parent;
+}
+
 /* useful timestamps */
 #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
-- 
2.43.0


