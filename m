Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EB219853A
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 22:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgC3UPh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 16:15:37 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55237 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728715AbgC3UPg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Mar 2020 16:15:36 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 19A37FF803;
        Mon, 30 Mar 2020 20:15:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: sun6i: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Mon, 30 Mar 2020 22:15:10 +0200
Message-Id: <20200330201510.861217-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330201510.861217-1-alexandre.belloni@bootlin.com>
References: <20200330201510.861217-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sun6i.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 446ce38c1592..e2b8b150bcb4 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -498,7 +498,7 @@ static int sun6i_rtc_getalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 
 	wkalrm->enabled = !!(alrm_en & SUN6I_ALRM_EN_CNT_EN);
 	wkalrm->pending = !!(alrm_st & SUN6I_ALRM_EN_CNT_EN);
-	rtc_time_to_tm(chip->alarm, &wkalrm->time);
+	rtc_time64_to_tm(chip->alarm, &wkalrm->time);
 
 	return 0;
 }
@@ -519,8 +519,8 @@ static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		return -EINVAL;
 	}
 
-	rtc_tm_to_time(alrm_tm, &time_set);
-	rtc_tm_to_time(&tm_now, &time_now);
+	time_set = rtc_tm_to_time64(alrm_tm);
+	time_now = rtc_tm_to_time64(&tm_now);
 	if (time_set <= time_now) {
 		dev_err(dev, "Date to set in the past\n");
 		return -EINVAL;
-- 
2.25.1

