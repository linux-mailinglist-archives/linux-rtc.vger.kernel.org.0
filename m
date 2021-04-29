Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26AE36F23A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 23:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbhD2Vo4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 17:44:56 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53125 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237337AbhD2Voz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Apr 2021 17:44:55 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A129D200002;
        Thu, 29 Apr 2021 21:44:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: sysfs: check features instead of ops
Date:   Thu, 29 Apr 2021 23:44:03 +0200
Message-Id: <20210429214403.2610952-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Test RTC_FEATURE_ALARM instead of relying on .set_alarm to know whether
alarms are available.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index 8a957d31a1a4..74026f67fdfb 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -273,7 +273,7 @@ static bool rtc_does_wakealarm(struct rtc_device *rtc)
 	if (!device_can_wakeup(rtc->dev.parent))
 		return false;
 
-	return rtc->ops->set_alarm != NULL;
+	return !!test_bit(RTC_FEATURE_ALARM, rtc->features);
 }
 
 static umode_t rtc_attr_is_visible(struct kobject *kobj,
-- 
2.30.2

