Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029C22E2666
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Dec 2020 12:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgLXLcY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Dec 2020 06:32:24 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:25864 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgLXLcY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Dec 2020 06:32:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608809519; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=eX18DIRMoHpmB0MxA0f7v42xg6kMkU4vr9nekIYENcY=; b=f6+LThrpW0I+VUCFIoa927fNKsfFNhZmEyf1UzRV+OVPq0rJWb1RRlTvgV9zr6FncMUS6jCT
 zO9/rPOUHha4iU9Gl66wJHATV/YS/Z7mz6xCG2aChxwzWdx9atOzUnwEZvQTxmzRTyRdG9EU
 +r2xvr1DdZ321fErV2rZIOuH7Js=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJhNWYyNyIsICJsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fe47c12da471981883f5fef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 11:31:30
 GMT
Sender: guixiong=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30BD6C43462; Thu, 24 Dec 2020 11:31:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from guixiong-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: guixiong)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15D44C433C6;
        Thu, 24 Dec 2020 11:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15D44C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=guixiong@codeaurora.org
From:   Guixiong Wei <guixiong@codeaurora.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guixiong Wei <guixiong@codeaurora.org>
Subject: [PATCH] rtc: pm8xxx: Read ALARM_EN and update to alarm enabled status
Date:   Thu, 24 Dec 2020 19:28:57 +0800
Message-Id: <1608809337-18852-1-git-send-email-guixiong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

ALARM_EN status is retained in PMIC register after device shutdown
if poweron_alarm is enabled. Read it to make sure the driver has
consistent value with the register status.

Signed-off-by: Guixiong Wei <guixiong@codeaurora.org>
---
 drivers/rtc/rtc-pm8xxx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 0d9dd6f..70d1ff5 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -20,6 +20,7 @@
 /* RTC_CTRL register bit fields */
 #define PM8xxx_RTC_ENABLE		BIT(7)
 #define PM8xxx_RTC_ALARM_CLEAR		BIT(0)
+#define PM8xxx_RTC_ALARM_ENABLE		BIT(7)
 
 #define NUM_8_BIT_RTC_REGS		0x4
 
@@ -265,6 +266,7 @@ static int pm8xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	int rc;
+	unsigned int ctrl_reg;
 	u8 value[NUM_8_BIT_RTC_REGS];
 	unsigned long secs;
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
@@ -282,6 +284,13 @@ static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 	rtc_time64_to_tm(secs, &alarm->time);
 
+	rc = regmap_read(rtc_dd->regmap, regs->alarm_ctrl, &ctrl_reg);
+	if (rc) {
+		dev_err(dev, "Read from RTC alarm control register failed\n");
+		return rc;
+	}
+	alarm->enabled = !!(ctrl_reg & PM8xxx_RTC_ALARM_ENABLE);
+
 	dev_dbg(dev, "Alarm set for - h:m:s=%ptRt, y-m-d=%ptRdr\n",
 		&alarm->time, &alarm->time);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

