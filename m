Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8372811F486
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfLNWD4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:56 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:38005 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfLNWDF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:05 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 191BB1C0002;
        Sat, 14 Dec 2019 22:03:04 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 06/17] rtc: pcf8563: remove RTC_VL_CLR handling
Date:   Sat, 14 Dec 2019 23:02:48 +0100
Message-Id: <20191214220259.621996-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove RTC_VL_CLR handling because it is a disservice to userspace as it
removes the important information that the RTC data is invalid. This may
lead userspace to set an invalid system time later on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8563.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 3c322f3079b0..c701eef82349 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -291,21 +291,6 @@ static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
 					sizeof(int)))
 			return -EFAULT;
 		return 0;
-	case RTC_VL_CLR:
-		/*
-		 * Clear the VL bit in the seconds register in case
-		 * the time has not been set already (which would
-		 * have cleared it). This does not really matter
-		 * because of the cached voltage_low value but do it
-		 * anyway for consistency.
-		 */
-		if (pcf8563_rtc_read_time(dev, &tm))
-			pcf8563_rtc_set_time(dev, &tm);
-
-		/* Clear the cached value. */
-		pcf8563->voltage_low = 0;
-
-		return 0;
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.23.0

