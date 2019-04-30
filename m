Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22401F2F8
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfD3Jcg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:32:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49867 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfD3JcU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:32:20 -0400
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5D53B200003;
        Tue, 30 Apr 2019 09:32:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Baruch Siach <baruch@tkos.co.il>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/4] rtc: digicolor: use .set_time
Date:   Tue, 30 Apr 2019 11:32:11 +0200
Message-Id: <20190430093212.28425-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use .set_time instead of the deprecated .set_mmss.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-digicolor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
index e6e16aaac254..ed2fc1adafd5 100644
--- a/drivers/rtc/rtc-digicolor.c
+++ b/drivers/rtc/rtc-digicolor.c
@@ -106,11 +106,11 @@ static int dc_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int dc_rtc_set_mmss(struct device *dev, unsigned long secs)
+static int dc_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct dc_rtc *rtc = dev_get_drvdata(dev);
 
-	return dc_rtc_write(rtc, secs);
+	return dc_rtc_write(rtc, rtc_tm_to_time64(tm));
 }
 
 static int dc_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
@@ -161,7 +161,7 @@ static int dc_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 static const struct rtc_class_ops dc_rtc_ops = {
 	.read_time		= dc_rtc_read_time,
-	.set_mmss		= dc_rtc_set_mmss,
+	.set_time		= dc_rtc_set_time,
 	.read_alarm		= dc_rtc_read_alarm,
 	.set_alarm		= dc_rtc_set_alarm,
 	.alarm_irq_enable	= dc_rtc_alarm_irq_enable,
-- 
2.20.1

