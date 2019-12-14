Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973F711F487
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfLNWEG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:04:06 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48415 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfLNWDD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:03 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AB20960005;
        Sat, 14 Dec 2019 22:03:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 01/17] rtc: define RTC_VL_READ values
Date:   Sat, 14 Dec 2019 23:02:43 +0100
Message-Id: <20191214220259.621996-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently, the meaning of the value returned by RTC_VL_READ is undocumented
and left to the driver implementation. In order to get more meaningful
values, define a set of values to use as to make clear to userspace what is
the status of the various voltages feeding the RTC.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/uapi/linux/rtc.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 2ad1788968d0..095af360326a 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -92,7 +92,12 @@ struct rtc_pll_info {
 #define RTC_PLL_GET	_IOR('p', 0x11, struct rtc_pll_info)  /* Get PLL correction */
 #define RTC_PLL_SET	_IOW('p', 0x12, struct rtc_pll_info)  /* Set PLL correction */
 
-#define RTC_VL_READ	_IOR('p', 0x13, int)	/* Voltage low detector */
+#define RTC_VL_DATA_INVALID	BIT(0) /* Voltage too low, RTC data is invalid */
+#define RTC_VL_BACKUP_LOW	BIT(1) /* Backup voltage is low */
+#define RTC_VL_BACKUP_EMPTY	BIT(2) /* Backup empty or not present */
+#define RTC_VL_ACCURACY_LOW	BIT(3) /* Voltage is low, RTC accuracy is reduced */
+
+#define RTC_VL_READ	_IOR('p', 0x13, unsigned int)	/* Voltage low detection */
 #define RTC_VL_CLR	_IO('p', 0x14)		/* Clear voltage low information */
 
 /* interrupt flags */
-- 
2.23.0

