Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377E817B7AB
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgCFHoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:44:11 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:46619 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgCFHoK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:44:10 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 84633200004;
        Fri,  6 Mar 2020 07:44:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: mpc5121: set range
Date:   Fri,  6 Mar 2020 08:44:02 +0100
Message-Id: <20200306074404.58909-3-alexandre.belloni@bootlin.com>
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

The datasheet states that 4052 is the maximum value for year. However, the
mpc5121 read_time and set_time function abuse the target time register
instead of using the broken down time so it is limited to 2106.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mpc5121.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 845212fd1e33..5507f1847f7c 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -352,6 +352,8 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 
 	rtc->rtc->ops = &mpc5200_rtc_ops;
 	rtc->rtc->uie_unsupported = 1;
+	rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
+	rtc->rtc->range_max = 65733206399ULL; /* 4052-12-31 23:59:59 */
 
 	if (of_device_is_compatible(op->dev.of_node, "fsl,mpc5121-rtc")) {
 		u32 ka;
@@ -362,6 +364,13 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 			out_be32(&rtc->regs->keep_alive, ka);
 		}
 		rtc->rtc->ops = &mpc5121_rtc_ops;
+		/*
+		 * This is a limitation of the driver that abuses the target
+		 * time register, the actual maximum year for the mpc5121 is
+		 * also 4052.
+		 */
+		rtc->rtc->range_min = 0;
+		rtc->rtc->range_max = U32_MAX;
 	}
 
 	err = rtc_register_device(rtc->rtc);
-- 
2.24.1

