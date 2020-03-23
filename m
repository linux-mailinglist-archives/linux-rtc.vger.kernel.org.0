Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44A718F02A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 08:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgCWHQn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 03:16:43 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33438 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727369AbgCWHQn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 03:16:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584947802; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OBzrnIrYOQqvkeCsNZazNpi4PFkSztP1b56S3A8EX38=; b=f+/b/rcQVlcyxpDruK20b2APgz1XWxMwdRfiuztiP+K5Ny08ig0vJbPNA7nfwCewPIPTmE4M
 NVzl2sIcumK/E6fUHA6lyKvWG8N62DlgaACm3sApjQE8utNcDNzcTmRSoFzF7xe+RC4odlBL
 VuYvjIPUzIArirtyT5Q3d9H3t+s=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJhNWYyNyIsICJsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78624a.7fc54291b340-smtp-out-n04;
 Mon, 23 Mar 2020 07:16:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6240AC433D2; Mon, 23 Mar 2020 07:16:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from maggarwa-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: maggarwa)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B6FCC433CB;
        Mon, 23 Mar 2020 07:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B6FCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=maggarwa@codeaurora.org
From:   Mohit Aggarwal <maggarwa@codeaurora.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     Mohit Aggarwal <maggarwa@codeaurora.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
Date:   Mon, 23 Mar 2020 12:46:09 +0530
Message-Id: <1584947769-12076-1-git-send-email-maggarwa@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently, alarm register is not cleared on resume
leading to reboot during power off charging mode.

Signed-off-by: Mohit Aggarwal <maggarwa@codeaurora.org>
---
 drivers/rtc/rtc-pm8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index bbe013f..f0d89a4 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -301,6 +301,7 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 	unsigned int ctrl_reg;
+	u8 value[NUM_8_BIT_RTC_REGS] = {0};
 
 	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
 
@@ -319,6 +320,16 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 		goto rtc_rw_fail;
 	}
 
+	/* Clear Alarm register */
+	if (!enable) {
+		     rc = regmap_bulk_write(rtc_dd->regmap, regs->alarm_rw, value,
+					sizeof(value));
+		     if (rc) {
+			     dev_err(dev, "Write to RTC ALARM register failed\n");
+			     goto rtc_rw_fail;
+		     }
+	}
+
 rtc_rw_fail:
 	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
 	return rc;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
