Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6916D9B2B
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394657AbfJPUMa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:12:30 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59805 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfJPUMa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:12:30 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3F1EAFF80E;
        Wed, 16 Oct 2019 20:12:28 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Biwen Li <biwen.li@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/4] rtc: fsl-ftm-alarm: avoid struct rtc_time conversions
Date:   Wed, 16 Oct 2019 22:12:23 +0200
Message-Id: <20191016201223.30568-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201223.30568-1-alexandre.belloni@bootlin.com>
References: <20191016201223.30568-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Directly call ktime_get_real_seconds instead of converting the result to a
struct rtc_time and then back to a time64_t.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 039bd2f1a7ee..9e6e994cce99 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -203,17 +203,14 @@ static int ftm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
  */
 static int ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct rtc_time tm;
-	time64_t now, alm_time;
+	time64_t alm_time;
 	unsigned long long cycle;
 	struct ftm_rtc *rtc = dev_get_drvdata(dev);
 
-	ftm_rtc_read_time(dev, &tm);
-	now = rtc_tm_to_time64(&tm);
 	alm_time = rtc_tm_to_time64(&alm->time);
 
 	ftm_clean_alarm(rtc);
-	cycle = (alm_time - now) * rtc->alarm_freq;
+	cycle = (alm_time - ktime_get_real_seconds()) * rtc->alarm_freq;
 	if (cycle > MAX_COUNT_VAL) {
 		pr_err("Out of alarm range {0~262} seconds.\n");
 		return -ERANGE;
-- 
2.21.0

