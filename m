Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F3D2B730A
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Nov 2020 01:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgKRA1z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 19:27:55 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53623 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgKRA1y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 19:27:54 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 901D220002;
        Wed, 18 Nov 2020 00:27:52 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: pcf8523: use BIT
Date:   Wed, 18 Nov 2020 01:27:47 +0100
Message-Id: <20201118002747.1346504-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118002747.1346504-1-alexandre.belloni@bootlin.com>
References: <20201118002747.1346504-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use the BIT macro to define register bits.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index d5f913cb2ec9..5e1e7b2a8c9a 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -12,18 +12,18 @@
 #define DRIVER_NAME "rtc-pcf8523"
 
 #define REG_CONTROL1 0x00
-#define REG_CONTROL1_CAP_SEL (1 << 7)
-#define REG_CONTROL1_STOP    (1 << 5)
+#define REG_CONTROL1_CAP_SEL BIT(7)
+#define REG_CONTROL1_STOP    BIT(5)
 
 #define REG_CONTROL3 0x02
-#define REG_CONTROL3_PM_BLD (1 << 7) /* battery low detection disabled */
-#define REG_CONTROL3_PM_VDD (1 << 6) /* switch-over disabled */
-#define REG_CONTROL3_PM_DSM (1 << 5) /* direct switching mode */
+#define REG_CONTROL3_PM_BLD BIT(7) /* battery low detection disabled */
+#define REG_CONTROL3_PM_VDD BIT(6) /* switch-over disabled */
+#define REG_CONTROL3_PM_DSM BIT(5) /* direct switching mode */
 #define REG_CONTROL3_PM_MASK 0xe0
-#define REG_CONTROL3_BLF (1 << 2) /* battery low bit, read-only */
+#define REG_CONTROL3_BLF BIT(2) /* battery low bit, read-only */
 
 #define REG_SECONDS  0x03
-#define REG_SECONDS_OS (1 << 7)
+#define REG_SECONDS_OS BIT(7)
 
 #define REG_MINUTES  0x04
 #define REG_HOURS    0x05
-- 
2.28.0

