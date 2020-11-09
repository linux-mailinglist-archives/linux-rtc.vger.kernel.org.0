Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAEB2AC0EE
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgKIQeX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgKIQeX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:23 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8C7C0613D3
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so9351931wrc.11
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/duoUCbLOM0QFQ/QGXANkt+cjZ5PU0ZBTqU1VBXp8I=;
        b=cYIY0EwoyCnJZ4DJixNxtNSlZKaThhyWl0cZA88Hvjjq6nR/RdFYlDNUZuSeNLpnDd
         yPHSLmCoVC5UuZ1GwzLe9z7smYNFAC8V9Yf2gXtt0WqRgWrFwyHJEwMEnoe/C6v4XE22
         OgFfsaNjwNNZyoXV4sVhOxHN3VRLWoKkJ2GQDI4ANOuQCsKGgOh79QW7zDPi2zORpQSB
         Z7ign7C2hXr7Bf8PcDxdTyoStDhsTe1dupsnk0T/uUA8BnS9xBGo0LkTuIGpsPhFO3jJ
         N8rKbBrV+gHvi7gdaMRbwo0eJz3gd8WJkf0ZxlP1Qq/TmfhojfZOaTG4EALwmHqGPECW
         RGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/duoUCbLOM0QFQ/QGXANkt+cjZ5PU0ZBTqU1VBXp8I=;
        b=kOD1O+kUIT5NR+JdakVqRzUsYS9tlWgIDc0KgcZJTHudzH4Y2H3tPl8/8Ml0pydRxl
         2xc5ZF7c9nXzr9dT1GjYXlWyty11zmVDQanWhneUiPEaDdHUGvgeRKEHKT1WgO/uwHLq
         NvgosqwgSZRBgBvdtLrY8LQ3gIyLsuMIPfWkf+mmilP38CK1siwXYNXmErJRq4MRgQzY
         DRKa4v+DyFYXpukXAInmBK9J7HM6ZER3OwD8t/h6FHROV1TCdC2rHRNRlXA33zYA0X/R
         DMKrB1jvJUOfsvR0rnkaieXxzdQEM8wixqRIXyoJlAkYDZj4qcmVEDuGUyPJV4K2ghh2
         /Xfw==
X-Gm-Message-State: AOAM531/HYDF4CL9eaf/0cdqHmo+LAd0dkj5JgjFyefLV7wk55WIlnFn
        MhaNtxSr8M+m99X6nUDPB1bMp1gY+v5wFA==
X-Google-Smtp-Source: ABdhPJyHkPNhmfT8JFojH4HNxgsBWeTp+E2FgCZmKUHOuHsoYIKdOpHCmzSY4624MbTpsfkc4X9aaA==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr18213052wri.233.1604939660064;
        Mon, 09 Nov 2020 08:34:20 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/8] rtc: omap: use devm_pinctrl_register()
Date:   Mon,  9 Nov 2020 17:34:02 +0100
Message-Id: <20201109163409.24301-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use a managed variant of pinctrl_register(). This way we can shorten
the remove() callback as well as drop a goto label from probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-omap.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index c20fc7937dfa..606fa80ad6e0 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -879,7 +879,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	/* Support ext_wakeup pinconf */
 	rtc_pinctrl_desc.name = dev_name(&pdev->dev);
 
-	rtc->pctldev = pinctrl_register(&rtc_pinctrl_desc, &pdev->dev, rtc);
+	rtc->pctldev = devm_pinctrl_register(&pdev->dev, &rtc_pinctrl_desc, rtc);
 	if (IS_ERR(rtc->pctldev)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		ret = PTR_ERR(rtc->pctldev);
@@ -888,7 +888,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 
 	ret = rtc_register_device(rtc->rtc);
 	if (ret)
-		goto err_deregister_pinctrl;
+		goto err;
 
 	rtc_nvmem_register(rtc->rtc, &omap_rtc_nvmem_config);
 
@@ -901,8 +901,6 @@ static int omap_rtc_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_deregister_pinctrl:
-	pinctrl_unregister(rtc->pctldev);
 err:
 	clk_disable_unprepare(rtc->clk);
 	device_init_wakeup(&pdev->dev, false);
@@ -945,9 +943,6 @@ static int omap_rtc_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	/* Remove ext_wakeup pinconf */
-	pinctrl_unregister(rtc->pctldev);
-
 	return 0;
 }
 
-- 
2.29.1

