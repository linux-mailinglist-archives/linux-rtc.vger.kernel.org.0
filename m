Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7078E4158F0
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 09:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbhIWHTc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 03:19:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47520 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235477AbhIWHTc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 Sep 2021 03:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1632381481; x=1663917481;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ZJHCPlUenoX0Vg51QRhzULd4haGISa9pFqNwx4FuZN0=;
  b=SHWCtpId35kiZRARgHBe21PDtSjWFRCna6lLB86Ks6GEQ1V5cjUAnU7y
   wmR8oNx/k9B9Gd+Dm/C8+xFsjmmtlkUmcaJoneL+n95TLaW+t8UNS2yWZ
   iuo0at6FLCOzERFy1b5uN5a2u2X2GbI9t+6RrcJd6o/f44rVtyPaWZmZo
   Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2021 00:18:00 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 00:18:00 -0700
Received: from jianbinz-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 23 Sep 2021 00:17:58 -0700
From:   jianbinz <quic_jianbinz@quicinc.com>
To:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
CC:     jianbinz <quic_jianbinz@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: [PATCH] rtc: Disable alarm irq if alarm time is less than rtc time and irq is enabled
Date:   Thu, 23 Sep 2021 15:17:34 +0800
Message-ID: <20210923071734.25545-1-quic_jianbinz@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If device is boot up by rtc alarm, the alarm irq will still be enabled and the alarm time is smaller than current rtc time before any alarm is set or canceled.
If the device is shutdown this time, the device will reboot automatically.

So disable irq if alarm time is less than rtc time and irq is enabled.

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

