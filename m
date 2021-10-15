Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BADC42FBE9
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239242AbhJOTXg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:23:36 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40859 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242537AbhJOTXf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:23:35 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C8EC9C0007;
        Fri, 15 Oct 2021 19:21:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] rtc: expose correction feature
Date:   Fri, 15 Oct 2021 21:21:16 +0200
Message-Id: <20211015192121.817642-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
References: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add a new feature for RTCs able to correct the oscillator imprecision. This
is also called offset or trimming. Such drivers have a .set_offset callback,
use that to set the feature bit from the core.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c      | 3 +++
 include/uapi/linux/rtc.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index dbccd71589b9..2e0cbc190a8a 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -389,6 +389,9 @@ int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
 	if (!rtc->ops->set_alarm)
 		clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
+	if (rtc->ops->set_offset)
+		set_bit(RTC_FEATURE_CORRECTION, rtc->features);
+
 	rtc->owner = owner;
 	rtc_device_get_offset(rtc);
 
diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index e4128be7963b..ded2aaab7ec7 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -131,7 +131,8 @@ struct rtc_param {
 #define RTC_FEATURE_ALARM_RES_2S	2
 #define RTC_FEATURE_UPDATE_INTERRUPT	3
 #define RTC_FEATURE_NEED_WEEK_DAY	4
-#define RTC_FEATURE_CNT			5
+#define RTC_FEATURE_CORRECTION		5
+#define RTC_FEATURE_CNT			6
 
 /* parameter list */
 #define RTC_PARAM_FEATURES		0
-- 
2.31.1

