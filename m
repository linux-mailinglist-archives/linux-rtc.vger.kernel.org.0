Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA5714ABF4
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2020 23:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgA0WRb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Jan 2020 17:17:31 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42255 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgA0WRb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Jan 2020 17:17:31 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0E9351C0004;
        Mon, 27 Jan 2020 22:17:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: Kconfig: properly indent sd3078 entry
Date:   Mon, 27 Jan 2020 23:17:23 +0100
Message-Id: <20200127221724.10160-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC_DRV_SD3078 is indented using spaces, use tabs instead.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 5cba01a0b356..01af948a7fc2 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -676,13 +676,13 @@ config RTC_DRV_S5M
 	  will be called rtc-s5m.
 
 config RTC_DRV_SD3078
-    tristate "ZXW Shenzhen whwave SD3078"
-    help
-      If you say yes here you get support for the ZXW Shenzhen whwave
-      SD3078 RTC chips.
+	tristate "ZXW Shenzhen whwave SD3078"
+	help
+	  If you say yes here you get support for the ZXW Shenzhen whwave
+	  SD3078 RTC chips.
 
-      This driver can also be built as a module. If so, the module
-      will be called rtc-sd3078
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-sd3078
 
 endif # I2C
 
-- 
2.24.1

