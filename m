Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FE517B7A8
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgCFHoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:44:11 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60681 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgCFHoL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:44:11 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8E280E0004;
        Fri,  6 Mar 2020 07:44:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rtc: mpc5121: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 08:44:03 +0100
Message-Id: <20200306074404.58909-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306074404.58909-1-alexandre.belloni@bootlin.com>
References: <20200306074404.58909-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mpc5121.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 5507f1847f7c..3040844129ce 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -111,7 +111,7 @@ static int mpc5121_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	 */
 	now = in_be32(&regs->actual_time) + in_be32(&regs->target_time);
 
-	rtc_time_to_tm(now, tm);
+	rtc_time64_to_tm(now, tm);
 
 	/*
 	 * update second minute hour registers
@@ -126,16 +126,14 @@ static int mpc5121_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct mpc5121_rtc_data *rtc = dev_get_drvdata(dev);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
-	int ret;
 	unsigned long now;
 
 	/*
 	 * The actual_time register is read only so we write the offset
 	 * between it and linux time to the target_time register.
 	 */
-	ret = rtc_tm_to_time(tm, &now);
-	if (ret == 0)
-		out_be32(&regs->target_time, now - in_be32(&regs->actual_time));
+	now = rtc_tm_to_time64(tm);
+	out_be32(&regs->target_time, now - in_be32(&regs->actual_time));
 
 	/*
 	 * update second minute hour registers
-- 
2.24.1

