Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77D114B8C56
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Feb 2022 16:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbiBPPY7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Feb 2022 10:24:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiBPPY7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Feb 2022 10:24:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD92025BD43
        for <linux-rtc@vger.kernel.org>; Wed, 16 Feb 2022 07:24:46 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id q7so4000539wrc.13
        for <linux-rtc@vger.kernel.org>; Wed, 16 Feb 2022 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i81WJVHS/DKZVQtZJB/nudb/qfFi3hHrCPgE4seRHws=;
        b=kyBii3Oe+hS/OC65YmE5trZo2mreP6LLNkjqK7pByZt2Z0et4tUKAt5OxGztJlBEKv
         /SSIuh5HlnN/HS2KMMN/CX8QJakEPnHd+tZRIwqgUFNq3+69zC2/oS+yB1/UF0yuLJeN
         oNOycSRanfJbsfiqiHJ7FZLRblB0OfWHglZzIJpqlTKmp1C/+FKdtMMBXe8ohYhJU6qJ
         rkOgJLbrHEzuGzSc9Si3m7yARlI5DenFw/+IHasRGO6anQX4BoYcQ0QjdpcqvErarAbN
         9VUTNqvzsOTgaEIwLIfylkskrl0OIB6qhW3EqHcS8qsT3Az8dab8O9kubnzS0peJ6oag
         h2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i81WJVHS/DKZVQtZJB/nudb/qfFi3hHrCPgE4seRHws=;
        b=01f4QSq834dZ+rkdMtLS2w6sO28bcOtlo5+mEt9+yZqz9V07/pu2jckm3C5QQttcre
         PT6MLbo0Fhd0J0Zngpnsgxw7DqFGY/t+l9eSqK2xhO5ZnA7wp3MaDt78bMz/KHfV+LEu
         W9iWEob+Qz5bMx5mV5fkWhb7JONIbw00as8/nX57rtHRvUnxOWgLPf8ejaDMn9cve3mg
         QFSUOpuce1CK/dsKJSLViHhbhBzAAJmaoSesFBXdgSYNYvAxFzc+umjNqGzVdctrqQ0c
         3fhP7nVVuS6P3Jp+MP6anPzKSuhGAR+KHtD1ILKD+LQtw1gFfy6S9kHLC3hM488RfrrO
         VjXg==
X-Gm-Message-State: AOAM5337pMoyb6I29FgpFmzwwLAs7MZkBJZt40Xx2XF36ouWG6b3HsH1
        8m8gTbEIohs/HtU+pRv7X9JRXw==
X-Google-Smtp-Source: ABdhPJzuYwa4bhdftA50S/mTL28P9udpQiHRvaLm+YJEH8apipCb8auHil39BTI3o3VKihuAxgru0w==
X-Received: by 2002:adf:9f42:0:b0:1e7:e751:9656 with SMTP id f2-20020adf9f42000000b001e7e7519656mr2711648wrg.590.1645025085155;
        Wed, 16 Feb 2022 07:24:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id g12sm16200052wmq.28.2022.02.16.07.24.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Feb 2022 07:24:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] rtc: pm8xxx: Attach wake irq to device
Date:   Wed, 16 Feb 2022 16:24:42 +0100
Message-Id: <1645025082-6138-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Attach the interrupt as a wake-irq to the device, so that:
- A corresponding wakeup source is created (and reported in e.g
  /sys/kernel/debug/wakeup_sources).
- The power subsystem take cares of arming/disarming
  irq-wake automatically on suspend/resume.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/rtc/rtc-pm8xxx.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 29a1c65..75954dd 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -7,6 +7,7 @@
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -527,40 +528,28 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	return devm_rtc_register_device(rtc_dd->rtc);
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int pm8xxx_rtc_resume(struct device *dev)
-{
-	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
+	rc = devm_rtc_register_device(rtc_dd->rtc);
+	if (rc)
+		return rc;
 
-	if (device_may_wakeup(dev))
-		disable_irq_wake(rtc_dd->rtc_alarm_irq);
+	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->rtc_alarm_irq);
+	if (rc)
+		return rc;
 
 	return 0;
 }
 
-static int pm8xxx_rtc_suspend(struct device *dev)
+static int pm8xxx_remove(struct platform_device *pdev)
 {
-	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		enable_irq_wake(rtc_dd->rtc_alarm_irq);
-
+	dev_pm_clear_wake_irq(&pdev->dev);
 	return 0;
 }
-#endif
-
-static SIMPLE_DEV_PM_OPS(pm8xxx_rtc_pm_ops,
-			 pm8xxx_rtc_suspend,
-			 pm8xxx_rtc_resume);
 
 static struct platform_driver pm8xxx_rtc_driver = {
 	.probe		= pm8xxx_rtc_probe,
+	.remove		= pm8xxx_remove,
 	.driver	= {
 		.name		= "rtc-pm8xxx",
-		.pm		= &pm8xxx_rtc_pm_ops,
 		.of_match_table	= pm8xxx_id_table,
 	},
 };
-- 
2.7.4

