Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98BB436BFB
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 22:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhJUUZS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 16:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhJUUZQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 16:25:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD2BC061764
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id u13so1148779edy.10
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jFmmxNUoXzyItR02/hWt9c3XRKJ19vzPlXV6udSTpt4=;
        b=bNrSEqccrWyxW5O/fFfOXrDgyI4vpRGtmC0FKdThUYwjxm3Z4fod8ssiNXKfTYyPPL
         Y/NqQGGas1xaGfw9teN0q8sWzGoJC3DOVoVMXHb1ECrSL4siHnDYtni9/QVlAB4L9U7s
         L2QhdBzmQXyR4pruNmy4D1iDGNmbVyuKWwqaQoXUjOXpkvqP/Wa2NNghau+hXUye2wcG
         fjU5Hv25eSscdTOr7SGpfHIj7oNgsnn2+309mXKJVjqf8ATXq+iDNC3U/fW2e80rsnvb
         ap4O84kPXluo9m91fSJt25qk0BxOzjz3hYa40ERrGDXRUTT7zw7Af6OVGPIrlP1IO2sP
         I20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jFmmxNUoXzyItR02/hWt9c3XRKJ19vzPlXV6udSTpt4=;
        b=t7PZWxjsTv2ggRHmOUgHWf7iONW+HWlprmIpWzfZk+ifOjhOZryBJCfMWn3UtZherp
         nGb5VT4xzsOzBtDyeyvenJfvgi0eOgdnH91cP42gnQ/hFug6lq/FqaqWogy71Xc+8wpf
         UZq8kcUgmbw7cL91fKF1hA8aRkVLECXPkOLDhfbguG0SVgW5ASeYPB9sKQfe758eYSJR
         ESlwfyAAuOLDEx2pvCzF8+JZCwdLSWO4UJ8b0iCQQegqpXTpY0LmvhZoBjXzuf2JnsFi
         8MOLvu6lBc+sQGbO7FmSdquK3UB40glBIEn0cOmeipzv3tWfFSFQ7sn84eHNWAJYyt1U
         f3SA==
X-Gm-Message-State: AOAM5315kJCSrbttq3DJQGrsKBib/iQ/ZxmL8AvPu4/22apDn3FBakfz
        9Ymmr5C1BY3I5HR022VIeofrLsaBn8nam4Nw
X-Google-Smtp-Source: ABdhPJze9WNulDK5lWspCtacI+kKYFt3IVm56pbEalSY+y9H8jClVr56yt2N2xjKVv5/7S5H53VNaA==
X-Received: by 2002:a17:906:3913:: with SMTP id f19mr9457463eje.357.1634847778971;
        Thu, 21 Oct 2021 13:22:58 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id d4sm3384750edk.78.2021.10.21.13.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:22:58 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] rtc: s3c: Remove usage of devm_rtc_device_register()
Date:   Thu, 21 Oct 2021 23:22:54 +0300
Message-Id: <20211021202256.28517-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021202256.28517-1-semen.protsenko@linaro.org>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() API instead. This change doesn't change
the behavior, but allows for further improvements.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
 - Added R-b tag by Krzysztof Kozlowski

 drivers/rtc/rtc-s3c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e57d3ca70a78..10e591794276 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -447,15 +447,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	/* register RTC and exit */
-	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
-					     THIS_MODULE);
+	info->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc)) {
-		dev_err(&pdev->dev, "cannot attach rtc\n");
 		ret = PTR_ERR(info->rtc);
 		goto err_nortc;
 	}
 
+	info->rtc->ops = &s3c_rtcops;
+
+	ret = devm_rtc_register_device(info->rtc);
+	if (ret)
+		goto err_nortc;
+
 	ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
 			       0, "s3c2410-rtc alarm", info);
 	if (ret) {
-- 
2.30.2

