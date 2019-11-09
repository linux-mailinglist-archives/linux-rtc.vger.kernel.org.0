Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A55F6019
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2019 16:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfKIPrB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Nov 2019 10:47:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37755 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfKIPrB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Nov 2019 10:47:01 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so6724487lfp.4;
        Sat, 09 Nov 2019 07:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2MNWyYxDIwl5/Y9DLOD0SRUpFh0800mLWYZQrn0cFw=;
        b=O0B6+Ie/CO8H2I8KqlKT5A11S9gWLbnRbEKHRPQjq9M4dQwy9khnxFG2rp1S5wnWYr
         bjagMxx1Sg20hb85dtRGpUTZjYlvKbl+uPMQiqZYuhms8+KHBy7kgHmcOE+Yy8ySRUhW
         RODFrqLNTx6Wc0Ui3Ae1eH++IwrCqpbVyYe9mE1Dg2S/atkh9NZEmYyJkMRRFWXSJtMl
         JgW5qcPxDSeglcyoeAc2vvg9vcYZlpS+r7pexwuvmArzoUXclK2iYFlwrGlomXiYe2fE
         NF6ru+eceDaHO60BUmSKnffAZz6VI8jDDHsiaKYRZolEpD2HpbLGcWDf9HrEAD7EIrpz
         sTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2MNWyYxDIwl5/Y9DLOD0SRUpFh0800mLWYZQrn0cFw=;
        b=qQTSgyJJcClVVA7bC/UcT8CwEew10NVgqtT5RYFh7/PgWN7liMV6HEvUBM7Vn5lAVQ
         UCHhcXPfx11w5vCrML75X4dHyQzcdWSZ8jCXrlQaFatL8/eGamZozPMCqxQj5V4Z4y94
         4yPVgOFEPVr9oqOiu4mhy896a3r7M+zQe29jvP7YUTpGPuqTb8QLO4leMMaM+1YI4OYH
         9qhqpwmCH8Q0jqUPatA4Kxjoo7D0SL8fU1GzrQhHGvrzkyKqXlDTHKyr4gt0IZdSOhl3
         TEYti+xhVIbnbsPxjAMzm2hHQVR/GQj8lbVA/YREKyXeeByKavI10QRuWBVQC8NmCUiM
         tlbw==
X-Gm-Message-State: APjAAAVs2KVSre5o/6aGZF+ft7lXRcRMVXwzsSAgyvWvz2PzbQguIwun
        wm1mHHZQVaQVpu+ZEdLXQUA=
X-Google-Smtp-Source: APXvYqw7Wc2SqEr14zEtA4gEhuGkHtPnDY8WzisxoCQksCKTowyLt6PBdISKi9DqX1DMkNxmCsHwDA==
X-Received: by 2002:a19:4909:: with SMTP id w9mr9975308lfa.174.1573314419271;
        Sat, 09 Nov 2019 07:46:59 -0800 (PST)
Received: from localhost.localdomain ([188.243.226.168])
        by smtp.gmail.com with ESMTPSA id g21sm4141987ljh.2.2019.11.09.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 07:46:58 -0800 (PST)
From:   Andrey Skvortsov <andrej.skvortzov@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] rtc: tps65910: allow using RTC without alarm interrupt
Date:   Sat,  9 Nov 2019 18:46:52 +0300
Message-Id: <20191109154652.7419-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 drivers/rtc/rtc-tps65910.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 2c0467a9e717..aa3a001ef413 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -361,6 +361,13 @@ static const struct rtc_class_ops tps65910_rtc_ops = {
 	.set_offset	= tps65910_set_offset,
 };
 
+static const struct rtc_class_ops tps65910_rtc_ops_noirq = {
+	.read_time	= tps65910_rtc_read_time,
+	.set_time	= tps65910_rtc_set_time,
+	.read_offset	= tps65910_read_offset,
+	.set_offset	= tps65910_set_offset,
+};
+
 static int tps65910_rtc_probe(struct platform_device *pdev)
 {
 	struct tps65910 *tps65910 = NULL;
@@ -415,13 +422,17 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
 		dev_name(&pdev->dev), &pdev->dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "IRQ is not free.\n");
-		return ret;
+		dev_err(&pdev->dev, "request IRQ:%d failed, err = %d\n",
+			 irq, ret);
+		irq = -1;
 	}
 	tps_rtc->irq = irq;
-	device_set_wakeup_capable(&pdev->dev, 1);
+	if (irq != -1) {
+		device_set_wakeup_capable(&pdev->dev, 1);
+		tps_rtc->rtc->ops = &tps65910_rtc_ops;
+	} else
+		tps_rtc->rtc->ops = &tps65910_rtc_ops_noirq;
 
-	tps_rtc->rtc->ops = &tps65910_rtc_ops;
 	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-- 
2.20.1

