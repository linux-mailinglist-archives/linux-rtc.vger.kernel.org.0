Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181F343229D
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhJRPVx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:21:53 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56287 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233244AbhJRPVw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:52 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 63B0F240013;
        Mon, 18 Oct 2021 15:19:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] rtc: expose correction feature
Date:   Mon, 18 Oct 2021 17:19:29 +0200
Message-Id: <20211018151933.76865-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
References: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
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
index 3241f9ecc639..c83bb9a4fa4f 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -131,7 +131,8 @@ struct rtc_param {
 #define RTC_FEATURE_NEED_WEEK_DAY	2
 #define RTC_FEATURE_ALARM_RES_2S	3
 #define RTC_FEATURE_UPDATE_INTERRUPT	4
-#define RTC_FEATURE_CNT			5
+#define RTC_FEATURE_CORRECTION		5
+#define RTC_FEATURE_CNT			6
 
 /* parameter list */
 #define RTC_PARAM_FEATURES		0
-- 
2.31.1

