Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A04011F47D
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLNWDF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:05 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56873 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfLNWDE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:04 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4938F1C0007;
        Sat, 14 Dec 2019 22:03:03 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 04/17] rtc: pcf2127: return meaningful value for RTC_VL_READ
Date:   Sat, 14 Dec 2019 23:02:46 +0100
Message-Id: <20191214220259.621996-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PCF2127_BIT_CTRL3_BLF indicates the battery is low and needs to be replaced
soon.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 5d8ea9ffd05b..5ac996578523 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -197,11 +197,9 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 		if (ret)
 			return ret;
 
-		touser = touser & PCF2127_BIT_CTRL3_BLF ? 1 : 0;
+		touser = touser & PCF2127_BIT_CTRL3_BLF ? RTC_VL_BACKUP_LOW : 0;
 
-		if (copy_to_user((void __user *)arg, &touser, sizeof(int)))
-			return -EFAULT;
-		return 0;
+		return put_user(touser, (unsigned int __user *)arg);
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.23.0

