Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862C7365E27
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhDTRD1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:03:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50183 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbhDTRD1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:03:27 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtm2-0004eq-RG
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:02:54 +0000
Received: by mail-ej1-f71.google.com with SMTP id r14-20020a1709062cceb0290373a80b4002so5027928ejr.20
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NmkwtcSUIB+GcQFfaJ8p9bZLIwyyfL6wMEQEOKgutFA=;
        b=Og55lhO1ckTzaI1vy0t4kJIVRWcSPqRI717jEFwcLAhmvuWE1ysqJylAJ5iF44OKOI
         zxLj51LvyzHYBWXXUmxkK3du4vRPOgqFIkcXBQq1pQ1KA1/qXoypKjVVivAkr0TWd+4W
         D/05NjnLztl+Sf5I66eiO+t2b6sPYJtwsOwxGyKZoVgIGhE1IriB7pbWkXCejulemQTj
         6swnPthTy/Fno8LOoqtiaqMgTLGvCvDJMAgJLX8qq11W9gFhTISz3d+OVuKeiTZMjDOq
         wzlidXfsR7krbk28N8mQyh93FmRWYvj2KW5vYDh0AuIaJMISgKv92HnMYVxKbbiGePd5
         kilA==
X-Gm-Message-State: AOAM530HFNq4sTrtMm3k2k9YSr1XzZAf2WYSMNpxbhH00U+j8vvGyDcu
        zAMj1iu4JwfI3ltZLn9MgY0v8JnPQgJGiY1yzQpV53fcUL4eELWBvrr6+rFo7qDsUxtqcKCS60U
        oS2f13pIg9xxpMaveq1S6f7a3PjNsqOIyvRrTVw==
X-Received: by 2002:a05:6402:176c:: with SMTP id da12mr33224697edb.325.1618938174082;
        Tue, 20 Apr 2021 10:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdl79swpGzRKj/jpsHaqW6VwyUBf+m6mj1RkKyPHba49ZLDGdZ6WYjKjU75zRSIcsrZk10vA==
X-Received: by 2002:a05:6402:176c:: with SMTP id da12mr33224668edb.325.1618938173929;
        Tue, 20 Apr 2021 10:02:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 9/9] regulator: s2mps11: Drop initialization via platform data
Date:   Tue, 20 Apr 2021 19:02:44 +0200
Message-Id: <20210420170244.13467-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

None of the platforms with S2MPS11 use board files, so any
initialization via platform data can be safely removed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/regulator/s2mps11.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 33cf84bce05a..ebc67e3ddd4f 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1120,7 +1120,6 @@ static const struct regulator_desc s2mpu02_regulators[] = {
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct sec_platform_data *pdata = NULL;
 	struct of_regulator_match *rdata = NULL;
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
@@ -1171,17 +1170,6 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	if (!s2mps11->ext_control_gpiod)
 		return -ENOMEM;
 
-	if (!iodev->dev->of_node) {
-		if (iodev->pdata) {
-			pdata = iodev->pdata;
-			goto common_reg;
-		} else {
-			dev_err(pdev->dev.parent,
-				"Platform data or DT node not supplied\n");
-			return -ENODEV;
-		}
-	}
-
 	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
 	if (!rdata)
 		return -ENOMEM;
@@ -1193,7 +1181,6 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-common_reg:
 	platform_set_drvdata(pdev, s2mps11);
 
 	config.dev = &pdev->dev;
@@ -1202,13 +1189,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	for (i = 0; i < rdev_num; i++) {
 		struct regulator_dev *regulator;
 
-		if (pdata) {
-			config.init_data = pdata->regulators[i].initdata;
-			config.of_node = pdata->regulators[i].reg_node;
-		} else {
-			config.init_data = rdata[i].init_data;
-			config.of_node = rdata[i].of_node;
-		}
+		config.init_data = rdata[i].init_data;
+		config.of_node = rdata[i].of_node;
 		config.ena_gpiod = s2mps11->ext_control_gpiod[i];
 		/*
 		 * Hand the GPIO descriptor management over to the regulator
-- 
2.25.1

