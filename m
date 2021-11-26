Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5368D45E8E8
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 08:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245205AbhKZIAb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Nov 2021 03:00:31 -0500
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227]:25248 "EHLO
        alexa-out-tai-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345072AbhKZH6b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Nov 2021 02:58:31 -0500
X-Greylist: delayed 380 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 02:58:30 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637913319; x=1669449319;
  h=from:to:cc:subject:date:message-id;
  bh=NJ5svLlAZ6xiVU1WgloAaItcZWYgqCd5TquR5rLHZc4=;
  b=BS53quzcX5xP3GCVe1g6NslXw67Mw5nva8WzNH5oJ0mi92lbNXe1aWHb
   b1XyVEsNNdv2KfaokqkQnWXYMcfNVa3Iz4K17WxbePM6wMBv6xTbYS9D4
   hDhaUjSC9tuMXUDzbr9gxhEAZQunQjoChyePr/21u172RG+6BVINayc2C
   E=;
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
  by alexa-out-tai-02.qualcomm.com with ESMTP; 26 Nov 2021 15:48:57 +0800
X-QCInternal: smtphost
Received: from jianbinz-gv.ap.qualcomm.com ([10.238.176.241])
  by ironmsg01-tai.qualcomm.com with ESMTP; 26 Nov 2021 15:48:53 +0800
Received: by jianbinz-gv.ap.qualcomm.com (Postfix, from userid 3963613)
        id 9BAAC1F00C19; Fri, 26 Nov 2021 15:48:51 +0800 (CST)
From:   jianbin zhang <quic_jianbinz@quicinc.com>
To:     alexandre.belloni@bootlin.com, a.zummo@towertech.it
Cc:     jianbinz <quic_jianbinz@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: pm8xxx: Disable alarm irq if alarm time is less than rtc time and alarm irq is enabled
Date:   Fri, 26 Nov 2021 15:48:45 +0800
Message-Id: <20211126074845.9160-1-quic_jianbinz@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: jianbinz <quic_jianbinz@quicinc.com>

If device is boot up by rtc alarm, the alarm irq will still be enabled and
the alarm time is smaller than current rtc time before any alarm is set or canceled.

If the device is shutdown this time, the device will reboot automatically.

So disable irq if alarm time is less than rtc time and irq is enabled.

Reproduced steps:
1/ set the alarm
2/ shutdown
3/ alarm happens, the device boots
4/ shutdown
5/ alarm irq is still set, device boots again

The plan to solve the issue is to acknowledge and clear the irq at step
3 in pm8xxx driver.

Signed-off-by: jianbin zhang <quic_jianbinz@quicinc.com>
---
 drivers/rtc/rtc-pm8xxx.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 29a1c65661e9..c8a75d3e9c43 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -267,16 +267,19 @@ static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	int rc;
 	unsigned int ctrl_reg;
+	unsigned long irq_flags;
 	u8 value[NUM_8_BIT_RTC_REGS];
 	unsigned long secs;
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 
+	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
+
 	rc = regmap_bulk_read(rtc_dd->regmap, regs->alarm_rw, value,
 			      sizeof(value));
 	if (rc) {
 		dev_err(dev, "RTC alarm time read failed\n");
-		return rc;
+		goto rtc_rw_fail;
 	}
 
 	secs = value[0] | (value[1] << 8) | (value[2] << 16) |
@@ -287,14 +290,30 @@ static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	rc = regmap_read(rtc_dd->regmap, regs->alarm_ctrl, &ctrl_reg);
 	if (rc) {
 		dev_err(dev, "Read from RTC alarm control register failed\n");
-		return rc;
+		goto rtc_rw_fail;
+	}
+
+	if (ctrl_reg && (rtc_tm_to_ktime(alarm->time) >=
+				rtc_dd->rtc->aie_timer.node.expires)) {
+		ctrl_reg &= ~regs->alarm_en;
+		rc = regmap_write(rtc_dd->regmap, regs->alarm_ctrl, ctrl_reg);
+		if (rc) {
+			dev_err(dev, "Update RTC control register failed \n");
+			goto rtc_rw_fail;
+		}
 	}
 	alarm->enabled = !!(ctrl_reg & PM8xxx_RTC_ALARM_ENABLE);
 
+	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+
 	dev_dbg(dev, "Alarm set for - h:m:s=%ptRt, y-m-d=%ptRdr\n",
 		&alarm->time, &alarm->time);
 
 	return 0;
+
+rtc_rw_fail:
+	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+	return rc;
 }
 
 static int pm8xxx_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
-- 
2.17.1

