Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807E6108C9
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2019 16:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfEAOHl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 May 2019 10:07:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52715 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfEAOHl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 May 2019 10:07:41 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ACB99FF807;
        Wed,  1 May 2019 14:07:38 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] rtc: drop set_mms and set_mmss64
Date:   Wed,  1 May 2019 16:07:35 +0200
Message-Id: <20190501140735.2607-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There are no users of set_mms and set_mmss64 as they have all been
converted to set_time and are handling the tm to time conversion on their
own.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 6 ------
 drivers/rtc/systohc.c   | 6 +-----
 include/linux/rtc.h     | 2 --
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 56ed0c3a8c85..4124f4dd376b 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -145,12 +145,6 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 		err = -ENODEV;
 	else if (rtc->ops->set_time)
 		err = rtc->ops->set_time(rtc->dev.parent, tm);
-	else if (rtc->ops->set_mmss64)
-		err = rtc->ops->set_mmss64(rtc->dev.parent,
-					   rtc_tm_to_time64(tm));
-	else if (rtc->ops->set_mmss)
-		err = rtc->ops->set_mmss(rtc->dev.parent,
-					 rtc_tm_to_time64(tm));
 	else
 		err = -EINVAL;
 
diff --git a/drivers/rtc/systohc.c b/drivers/rtc/systohc.c
index 8bf8e0c1e8fd..8b70f0520e13 100644
--- a/drivers/rtc/systohc.c
+++ b/drivers/rtc/systohc.c
@@ -30,8 +30,7 @@ int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
 	if (!rtc)
 		goto out_err;
 
-	if (!rtc->ops || (!rtc->ops->set_time && !rtc->ops->set_mmss64 &&
-			  !rtc->ops->set_mmss))
+	if (!rtc->ops || !rtc->ops->set_time)
 		goto out_close;
 
 	/* Compute the value of tv_nsec we require the caller to supply in
@@ -53,9 +52,6 @@ int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
 
 	rtc_time64_to_tm(to_set.tv_sec, &tm);
 
-	/* rtc_hctosys exclusively uses UTC, so we call set_time here, not
-	 * set_mmss.
-	 */
 	err = rtc_set_time(rtc, &tm);
 
 out_close:
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 48d3f8e0b64f..df666cf29ef1 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -79,8 +79,6 @@ struct rtc_class_ops {
 	int (*read_alarm)(struct device *, struct rtc_wkalrm *);
 	int (*set_alarm)(struct device *, struct rtc_wkalrm *);
 	int (*proc)(struct device *, struct seq_file *);
-	int (*set_mmss64)(struct device *, time64_t secs);
-	int (*set_mmss)(struct device *, unsigned long secs);
 	int (*alarm_irq_enable)(struct device *, unsigned int enabled);
 	int (*read_offset)(struct device *, long *offset);
 	int (*set_offset)(struct device *, long offset);
-- 
2.20.1

