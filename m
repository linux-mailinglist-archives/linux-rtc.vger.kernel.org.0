Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFE1D9B2E
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394641AbfJPUM3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:12:29 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:33655 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389032AbfJPUM3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:12:29 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 03489FF807;
        Wed, 16 Oct 2019 20:12:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Biwen Li <biwen.li@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/4] rtc: fsl-ftm-alarm: switch to ktime_get_real_seconds
Date:   Wed, 16 Oct 2019 22:12:21 +0200
Message-Id: <20191016201223.30568-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201223.30568-1-alexandre.belloni@bootlin.com>
References: <20191016201223.30568-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver drops the nanoseconds part of the timespec64, there is no need
to call ktime_get_real_ts64.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index b83f7afa8311..e954c51bf39b 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -180,10 +180,7 @@ static int ftm_rtc_alarm_irq_enable(struct device *dev,
  */
 static int ftm_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct timespec64 ts64;
-
-	ktime_get_real_ts64(&ts64);
-	rtc_time_to_tm(ts64.tv_sec, tm);
+	rtc_time_to_tm(ktime_get_real_seconds(), tm);
 
 	return 0;
 }
-- 
2.21.0

