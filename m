Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4982B9178
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgKSLn7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgKSLnC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:02 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEACC061A48
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:01 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so6456323wmb.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKpHBnJOxeNfseDIbAnBRefqDh1bNvtW26xYHmaRAOI=;
        b=pXe2/+X8kiGPNLJQT01Tv+hEayd1byb5VROT6MoCs2fBuCiOSnwnbCCTpHFA0JHnXe
         TV4LwAD3FZfsq9ZHvNcqB8vj51+7cHXYcH6ihKhohWiFwsaJo3MhCx3s38XYJpbEFu9R
         Cb1+FiOUni1/pC1w9f5jeDlMTvILcshUvJT+DEvsSjSJgb92+8QL9X/L2fYbUu4g2jZt
         6EkMbCiQQBGVe9k3UPYXkbVf2LeXekkwB6gmm1U1Pv4K2IZHIsTAYWSxpVsarM4yNGcZ
         1Kra1r81kXcBdLb5C1DSDWFUr/eSWhGu+77B0Z//oSigDdibhvyksEWhJqE/xBN0uC/1
         WXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKpHBnJOxeNfseDIbAnBRefqDh1bNvtW26xYHmaRAOI=;
        b=sdq3eHQr1R3U940SmRM+UUZKuR9hjHrICId0o9NqzdMexMIogUSZBa6sA3ucHdv4kZ
         b+puYfiwHAnrarVlezFECwVy4oPDWll+E59dCKIbRo+ZDejCPbiqNNAOMRv0Z2qaKbly
         Q85d1Hfe3VsnanIE0nqpQVw7i/kePLPJeNuF1K9H6RPm+MC1aseUHooqgZGbyuuHHLn8
         7sUIPz7Ezv6fr11ASen6xYJK58GeVuj1z8juiLoPQ7L1xrozFLig/jLWt52vNp3WBx0Y
         mBBDtEp6yxktBc5dVr7tGCdz3P761dMqZ5pZEdZNag7Tq+Lh5R9hvrUwsynny5KQotR0
         gZGg==
X-Gm-Message-State: AOAM533lHFtblV5HeaPTEE3fGDSx5upMOCToTSwbymAntRmlWzs0qYCu
        /FzfOx1aJ9Q+InLw+v1r14i/PHPGidWB3Q==
X-Google-Smtp-Source: ABdhPJxeul1MeGOvy60f2Vi7YQ8dy5jvk/a1/kohfcB2ZyuhFCV83t12JDRTKRLPXNwo/pqfY7k4yQ==
X-Received: by 2002:a05:600c:4101:: with SMTP id j1mr4019930wmi.35.1605786180384;
        Thu, 19 Nov 2020 03:43:00 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 52/59] rtc: rx4581: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:42 +0100
Message-Id: <20201119114149.4117-53-brgl@bgdev.pl>
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
 drivers/rtc/rtc-rx4581.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx4581.c b/drivers/rtc/rtc-rx4581.c
index c092e0452347..5d42aa051b4c 100644
--- a/drivers/rtc/rtc-rx4581.c
+++ b/drivers/rtc/rtc-rx4581.c
@@ -261,13 +261,14 @@ static int rx4581_probe(struct spi_device *spi)
 	if (res != 0)
 		return res;
 
-	rtc = devm_rtc_device_register(&spi->dev, "rx4581",
-				&rx4581_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &rx4581_rtc_ops;
 	spi_set_drvdata(spi, rtc);
-	return 0;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct spi_device_id rx4581_id[] = {
-- 
2.29.1

