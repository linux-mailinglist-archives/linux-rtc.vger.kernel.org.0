Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF4AF2D9
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfD3J2w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:28:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45763 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfD3J2d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:28:33 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0943E1BF21C;
        Tue, 30 Apr 2019 09:28:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 6/7] rtc: jz4740: rework invalid time detection
Date:   Tue, 30 Apr 2019 11:28:20 +0200
Message-Id: <20190430092821.27963-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
References: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The scratchpad register is used to detect an invalid time when power to the
RTC has been lost. Instead of deleting that precious information and set
the time to the UNIX epoch, forward it to userspace.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-jz4740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 32e6b6270efd..6dd00b654f93 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -157,6 +157,9 @@ static int jz4740_rtc_read_time(struct device *dev, struct rtc_time *time)
 	uint32_t secs, secs2;
 	int timeout = 5;
 
+	if (jz4740_rtc_reg_read(rtc, JZ_REG_RTC_SCRATCHPAD) != 0x12345678)
+		return -EINVAL;
+
 	/* If the seconds register is read while it is updated, it can contain a
 	 * bogus value. This can be avoided by making sure that two consecutive
 	 * reads have the same value.
@@ -180,8 +183,13 @@ static int jz4740_rtc_read_time(struct device *dev, struct rtc_time *time)
 static int jz4740_rtc_set_time(struct device *dev, struct rtc_time *time)
 {
 	struct jz4740_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SEC, rtc_tm_to_time64(time));
+	if (ret)
+		return ret;
 
-	return jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SEC, rtc_tm_to_time64(time));
+	return jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SCRATCHPAD, 0x12345678);
 }
 
 static int jz4740_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
@@ -308,7 +316,6 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct jz4740_rtc *rtc;
-	uint32_t scratchpad;
 	struct resource *mem;
 	const struct platform_device_id *id = platform_get_device_id(pdev);
 	const struct of_device_id *of_id = of_match_device(
@@ -376,16 +383,6 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	scratchpad = jz4740_rtc_reg_read(rtc, JZ_REG_RTC_SCRATCHPAD);
-	if (scratchpad != 0x12345678) {
-		ret = jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SCRATCHPAD, 0x12345678);
-		ret = jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SEC, 0);
-		if (ret) {
-			dev_err(&pdev->dev, "Could not write to RTC registers\n");
-			return ret;
-		}
-	}
-
 	if (np && of_device_is_system_power_controller(np)) {
 		if (!pm_power_off) {
 			/* Default: 60ms */
-- 
2.20.1

