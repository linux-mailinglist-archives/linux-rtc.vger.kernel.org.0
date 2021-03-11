Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293F3336D1A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 08:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhCKHax (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 02:30:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:57693 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhCKHaj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 02:30:39 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 10 Mar 2021 23:30:39 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Mar 2021 23:30:36 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 13:00:08 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 25DDC4107; Thu, 11 Mar 2021 13:00:07 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 1/3] rtc: pm8xxx: Add RTC support for PMIC PMK8350
Date:   Thu, 11 Mar 2021 12:59:56 +0530
Message-Id: <1615447798-6959-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the comaptible string for PMIC PMK8350.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/rtc/rtc-pm8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index eb20659..29a1c65 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -445,6 +445,16 @@ static const struct pm8xxx_rtc_regs pm8941_regs = {
 	.alarm_en	= BIT(7),
 };
 
+static const struct pm8xxx_rtc_regs pmk8350_regs = {
+	.ctrl		= 0x6146,
+	.write		= 0x6140,
+	.read		= 0x6148,
+	.alarm_rw	= 0x6240,
+	.alarm_ctrl	= 0x6246,
+	.alarm_ctrl2	= 0x6248,
+	.alarm_en	= BIT(7),
+};
+
 /*
  * Hardcoded RTC bases until IORESOURCE_REG mapping is figured out
  */
@@ -453,6 +463,7 @@ static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8018-rtc", .data = &pm8921_regs },
 	{ .compatible = "qcom,pm8058-rtc", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8941-rtc", .data = &pm8941_regs },
+	{ .compatible = "qcom,pmk8350-rtc", .data = &pmk8350_regs },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

