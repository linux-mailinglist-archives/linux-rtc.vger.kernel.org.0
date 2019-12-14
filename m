Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7BC011F46C
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfLNWDO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:14 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:44439 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfLNWDL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:11 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 53BD3100006;
        Sat, 14 Dec 2019 22:03:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 17/17] rtc: rx8010: return meaningful value for RTC_VL_READ
Date:   Sat, 14 Dec 2019 23:02:59 +0100
Message-Id: <20191214220259.621996-18-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RX8010_FLAG_VLF means the voltage dropped too low and data has been lost.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8010.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 9b106a26c64b..4021844bf2fa 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -399,11 +399,8 @@ static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		if (flagreg < 0)
 			return flagreg;
 
-		tmp = !!(flagreg & RX8010_FLAG_VLF);
-		if (copy_to_user((void __user *)arg, &tmp, sizeof(int)))
-			return -EFAULT;
-
-		return 0;
+		tmp = flagreg & RX8010_FLAG_VLF ? RTC_VL_DATA_INVALID : 0;
+		return put_user(tmp, (unsigned int __user *)arg);
 
 	default:
 		return -ENOIOCTLCMD;
-- 
2.23.0

