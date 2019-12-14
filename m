Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5211F476
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfLNWDc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:32 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34197 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfLNWDI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:08 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DF2111BF204;
        Sat, 14 Dec 2019 22:03:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 11/17] rtc: pcf85063: return meaningful value for RTC_VL_READ
Date:   Sat, 14 Dec 2019 23:02:53 +0100
Message-Id: <20191214220259.621996-12-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PCF85063_REG_SC_OS means the voltage dropped too low and data has been
lost.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85063.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 2ddd95420a8c..1db17ba1fc64 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -289,15 +289,9 @@ static int pcf85063_ioctl(struct device *dev, unsigned int cmd,
 		if (ret < 0)
 			return ret;
 
-		if (status & PCF85063_REG_SC_OS)
-			dev_warn(&pcf85063->rtc->dev, "Voltage low, data loss detected.\n");
+		status = status & PCF85063_REG_SC_OS ? RTC_VL_DATA_INVALID : 0;
 
-		status &= PCF85063_REG_SC_OS;
-
-		if (copy_to_user((void __user *)arg, &status, sizeof(int)))
-			return -EFAULT;
-
-		return 0;
+		return put_user(status, (unsigned int __user *)arg);
 
 	default:
 		return -ENOIOCTLCMD;
-- 
2.23.0

