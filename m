Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD52198538
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 22:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgC3UPe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 16:15:34 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59817 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgC3UPd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Mar 2020 16:15:33 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BE3E0FF808;
        Mon, 30 Mar 2020 20:15:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: remove rtc_time_to_tm and rtc_tm_to_time
Date:   Mon, 30 Mar 2020 22:15:08 +0200
Message-Id: <20200330201510.861217-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There are no callers of the 32bit versions of rtc_time conversion
functions, drop them.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/rtc.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 23990bd29040..bba3db3f7efa 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -34,18 +34,6 @@ static inline time64_t rtc_tm_sub(struct rtc_time *lhs, struct rtc_time *rhs)
 	return rtc_tm_to_time64(lhs) - rtc_tm_to_time64(rhs);
 }
 
-static inline void rtc_time_to_tm(unsigned long time, struct rtc_time *tm)
-{
-	rtc_time64_to_tm(time, tm);
-}
-
-static inline int rtc_tm_to_time(struct rtc_time *tm, unsigned long *time)
-{
-	*time = rtc_tm_to_time64(tm);
-
-	return 0;
-}
-
 #include <linux/device.h>
 #include <linux/seq_file.h>
 #include <linux/cdev.h>
-- 
2.25.1

