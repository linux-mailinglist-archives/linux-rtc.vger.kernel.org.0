Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F6D2B9164
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgKSLmZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbgKSLmN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:13 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242ECC0617A7
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:12 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id j7so6126721wrp.3
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MfWMBzPiBuGWzbGLFhVvojJESQz8f4cFh+ZfuzTp/gU=;
        b=xgf7P2VWgv4Hghs9gLtxKPYbNEHI6eUAMs8n+3r6rhK2D7k1BBjMrm4WA47tv2dVFZ
         R2Mt5lp8jyO0yDDmy2E8n1CeELPVRpqGdkmA4LC6UIfa3biZI8ukmAqnOPNBZ8oUOZlQ
         08Nny6n3qySO8AfF6kgPXULkFIj72kl6+7lFklVmal0cYVQQRlnnnNlDGP5q/OMfDVeL
         QgiHGTTpYtPhQ2JTabkMsqhd1VJ4yzgHIp+OzJohfc5fojaLV08JibhIBEIyC8nf3uCV
         oQVUp5tjklM/MPh7RG+WFzxx0NMFZWx4pcZpxAh7JtlKdptoC1dxsxtz8G/ZWYsFflwH
         eemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MfWMBzPiBuGWzbGLFhVvojJESQz8f4cFh+ZfuzTp/gU=;
        b=KtG2W27nf5IneNBidWiSLcnCNnAQofwAQ8mbh2xxqjZ2e5ZGWkuD3Bf9/zFY0FsBNO
         q0kFhuZHwHyqzGUWqzHjOqv2qNe/ZMPehhZebyutSnHjCQiOYLmKcWLbWnErBbKw8Lz3
         bLEiqWnItCkf4tFN60eG4N/qUr9nvebsmq39jhOtGPbz27J7vegCoE3TiNCzVz5eLJep
         WCUprOHY99UifUFwv1XMyBYXWW/OvGC+lwl+hAkSYKlGj8SL3CJ8otF6kXZ2b5FlD31r
         QOsO6gzqgxTB+zRUDeZXRyegTKCWviARB3tReZznwLAwhEET/WW1kYaSUGx2pFjZuIcf
         Zbvg==
X-Gm-Message-State: AOAM533+x9fq9KCXROOIjZeN+2qvOLKDjzTMvq+07YKG2wWHFf+wa6Cb
        BLsgaapqYRMuWFY9uReXw1MJ6A==
X-Google-Smtp-Source: ABdhPJwX1mmr/X+Ntmy5bJF0Co/juD2UIlbPVc7+3i7N23aaeKdqIol0CwAXmie5dMiTvF/IPFuEqA==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr9554419wrp.209.1605786130951;
        Thu, 19 Nov 2020 03:42:10 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:10 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 06/59] rtc: palmas: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:56 +0100
Message-Id: <20201119114149.4117-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-palmas.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index 4bcfb88674d3..d97a751b4a9a 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -301,13 +301,12 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 	palmas_rtc->irq = platform_get_irq(pdev, 0);
 
 	device_init_wakeup(&pdev->dev, 1);
-	palmas_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-				&palmas_rtc_ops, THIS_MODULE);
-	if (IS_ERR(palmas_rtc->rtc)) {
-		ret = PTR_ERR(palmas_rtc->rtc);
-		dev_err(&pdev->dev, "RTC register failed, err = %d\n", ret);
-		return ret;
-	}
+
+	palmas_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(palmas_rtc->rtc))
+		return PTR_ERR(palmas_rtc->rtc);
+
+	palmas_rtc->rtc->ops = &palmas_rtc_ops;
 
 	ret = devm_request_threaded_irq(&pdev->dev, palmas_rtc->irq, NULL,
 			palmas_rtc_interrupt,
@@ -318,7 +317,7 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
+	return devm_rtc_register_device(palmas_rtc->rtc);
 }
 
 static int palmas_rtc_remove(struct platform_device *pdev)
-- 
2.29.1

