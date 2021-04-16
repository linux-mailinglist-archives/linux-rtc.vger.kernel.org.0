Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C370636177B
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Apr 2021 04:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238126AbhDPCUV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Apr 2021 22:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236747AbhDPCUV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Apr 2021 22:20:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63260C061574;
        Thu, 15 Apr 2021 19:19:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 31so2750907pgn.13;
        Thu, 15 Apr 2021 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1c3XANJp3SRLg0MiJy2ydzLv+HXxXVrH+J+qpyjxeMo=;
        b=RvLCBMeKc9B10u/JSftidewJh+NxFiz3AG+ygV5Q3aiKH9BWYKqnT6NsxNICxM+2Dm
         cneLYlyuBmW/lgGHoKMlYGW64UftFNPUJy19PUmp28y2o8X+/skqkXqUHtuMMNSGC3xR
         p0bQ2KI6S3TPNz28fwTfB5y2uodapSnV9LdiTt/9QlyuoDWRhKWXbFkrv+qBa3EqXK/Y
         784ZpL34JsoPqojatFq2KivhwrMjfTnuHV4LOiEqudAa2/67Eu5XK32I3IjjdOXp3YUT
         aktxnB8LcwFdokQOob7I93enjFBMSCFOwxIDUbywuszShurUHEJ+73pP+3p6/Jg0y+0U
         APng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1c3XANJp3SRLg0MiJy2ydzLv+HXxXVrH+J+qpyjxeMo=;
        b=iEmir+YfU4/TOFesQs2qR2b+IkMh2N4SR/8Z+EAbuJ0zDJW1bpCRvnwjK13PwkieHR
         2XOupPur82q8Z0P16kK+s8ZtN3pBdK2yz6RgevTOCCZM+PTLAV1ONc+uL4qt0h0+jeoP
         hxjt0/ACx+Et19ZxZjyqZcu6cvjoVq/KT0tN/pVweOikS9CLKq0qf5T6pJYUQhMAvsk+
         aD1UDqIhghfxDhw9ug9BNKwPKVp7l95uofPswhCaXW3jPlkpdcsBHuf0C5LHKp5tD+7l
         Va5zCxNMYMUTX2etJ48Re0cQgyqtfMVv/7WFneC2M24SLCEfSiWri8lVEyvoGYV4Uzir
         PR9w==
X-Gm-Message-State: AOAM531OT81HmVkfKqfORYS8eMN4syF/+y0JxJJFbJmVEBM6dP+Awe7N
        81/RcbeqkH4QuewaPgzy5XU=
X-Google-Smtp-Source: ABdhPJy4H/k0YeMasBgQvdxoT1mYCifNxP+u/yBrtA9K/OYh3Zvo5A41irfb4y2kPvvsTMndSaPm3w==
X-Received: by 2002:a65:5c8a:: with SMTP id a10mr6157057pgt.233.1618539596557;
        Thu, 15 Apr 2021 19:19:56 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([209.9.72.212])
        by smtp.gmail.com with ESMTPSA id g14sm3520255pjh.28.2021.04.15.19.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 19:19:56 -0700 (PDT)
From:   zhuguangqing83@gmail.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: [PATCH] rtc: Fix missing IRQF_ONESHOT as only threaded handler
Date:   Fri, 16 Apr 2021 10:19:49 +0800
Message-Id: <20210416021949.1569-1-zhuguangqing83@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Guangqing Zhu <zhuguangqing83@gmail.com>

Coccinelle noticed:
1. drivers/rtc/rtc-s5m.c:810:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
2. drivers/rtc/rtc-rk808.c:441:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
3. drivers/rtc/rtc-max77686.c:779:7-27: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
4. drivers/rtc/rtc-tps65910.c:415:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
5. drivers/rtc/rtc-lp8788.c:277:8-33: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
6. drivers/rtc/rtc-max8998.c:283:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
7. drivers/rtc/rtc-rc5t583.c:241:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT
8. drivers/rtc/rtc-max8997.c:495:7-32: ERROR: Threaded IRQ with no primary
   handler requested without IRQF_ONESHOT

Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
---
 drivers/rtc/rtc-lp8788.c   | 2 +-
 drivers/rtc/rtc-max77686.c | 4 ++--
 drivers/rtc/rtc-max8997.c  | 2 +-
 drivers/rtc/rtc-max8998.c  | 3 ++-
 drivers/rtc/rtc-rc5t583.c  | 2 +-
 drivers/rtc/rtc-rk808.c    | 2 +-
 drivers/rtc/rtc-s5m.c      | 4 ++--
 drivers/rtc/rtc-tps65910.c | 2 +-
 8 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-lp8788.c b/drivers/rtc/rtc-lp8788.c
index c0b8fbce1082..ebb717ae6c8b 100644
--- a/drivers/rtc/rtc-lp8788.c
+++ b/drivers/rtc/rtc-lp8788.c
@@ -276,7 +276,7 @@ static int lp8788_alarm_irq_register(struct platform_device *pdev,
 
 	return devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				lp8788_alarm_irq_handler,
-				0, LP8788_ALM_IRQ, rtc);
+				IRQF_ONESHOT, LP8788_ALM_IRQ, rtc);
 }
 
 static int lp8788_rtc_probe(struct platform_device *pdev)
diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index d51cc12114cb..a23825ccf62a 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -776,8 +776,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 		goto err_rtc;
 	}
 
-	ret = request_threaded_irq(info->virq, NULL, max77686_rtc_alarm_irq, 0,
-				   "rtc-alarm1", info);
+	ret = request_threaded_irq(info->virq, NULL, max77686_rtc_alarm_irq,
+				   IRQF_ONESHOT, "rtc-alarm1", info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			info->virq, ret);
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index 20e50d9fdf88..15843ed12e36 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -493,7 +493,7 @@ static int max8997_rtc_probe(struct platform_device *pdev)
 	info->virq = virq;
 
 	ret = devm_request_threaded_irq(&pdev->dev, virq, NULL,
-				max8997_rtc_alarm_irq, 0,
+				max8997_rtc_alarm_irq, IRQF_ONESHOT,
 				"rtc-alarm0", info);
 	if (ret < 0)
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
index c873b4509b3c..28c5b367f633 100644
--- a/drivers/rtc/rtc-max8998.c
+++ b/drivers/rtc/rtc-max8998.c
@@ -281,7 +281,8 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
-				max8998_rtc_alarm_irq, 0, "rtc-alarm0", info);
+				max8998_rtc_alarm_irq, IRQF_ONESHOT,
+				"rtc-alarm0", info);
 
 	if (ret < 0)
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index 18684a7026c4..d9f4e0d4d943 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -239,7 +239,7 @@ static int rc5t583_rtc_probe(struct platform_device *pdev)
 
 	irq += RC5T583_IRQ_YALE;
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-		rc5t583_rtc_interrupt, IRQF_TRIGGER_LOW,
+		rc5t583_rtc_interrupt, IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 		"rtc-rc5t583", &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "IRQ is not free.\n");
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index e920da8c08da..753583cff5d4 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -439,7 +439,7 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 
 	/* request alarm irq of rk808 */
 	ret = devm_request_threaded_irq(&pdev->dev, rk808_rtc->irq, NULL,
-					rk808_alarm_irq, 0,
+					rk808_alarm_irq, IRQF_ONESHOT,
 					"RTC alarm", rk808_rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ %d: %d\n",
diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 80b66f16db89..56e82987b4a2 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -808,8 +808,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
-					s5m_rtc_alarm_irq, 0, "rtc-alarm0",
-					info);
+					s5m_rtc_alarm_irq, IRQF_ONESHOT,
+					"rtc-alarm0", info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			info->irq, ret);
diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index bc89c62ccb9b..6ab67820d77c 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -413,7 +413,7 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
+		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 		dev_name(&pdev->dev), &pdev->dev);
 	if (ret < 0)
 		irq = -1;
-- 
2.17.1

