Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3882365E25
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhDTRD0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:03:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50166 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbhDTRDZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:03:25 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtm1-0004de-1J
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:02:53 +0000
Received: by mail-ed1-f72.google.com with SMTP id n18-20020a0564020612b02903853320059eso4441546edv.0
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHDtfujd3OPxNtMM86LnHidWuIbqjKYUJi1OA9n+rmQ=;
        b=tBuGN8Xl4PSaHdE0RLal+hXL3F8qeEQfMVIiuE5ZhkrH8n1vbloLkF3XBieqund61x
         4uN2sw0qE8Agn3MzUuIoWC7SIYB3qqfSErE2zbTtZaoEGzRZg7RV0e+pB5g+E+pxzDWA
         sL+Geri+rqNLemyX3hmYKFTCCuyvWjcT0r86NNhwFO8bou54KH8MXHujw7rzH3rSF2Uc
         V9LE+bFfM1i+gddIWpZnlXG0sG6tZPRNUnBBY/E/Pok0oP9OUVrT9M6y70AFkTqnbpUS
         yAgZ6IEuWV0zp8+Sgt1ZSLzIYGZapSTxm+EjDaKo6QJDrFkt3hKRfXqkElYns7bGaeDz
         yXSQ==
X-Gm-Message-State: AOAM531TsxrJ9207CpgunATAoGItDzMCbSldlvKynK+u7DsmxBI0H3Cq
        4oxHGau9MaSBvrpswrAl9Sw9mqDcx4RfADL1Id/EsAyKblI3BAtwSFtolLNzCwonWKb0Ox8fDjh
        p1+9YVUifoZpgUUQtiJdEZ7noV6sty4kaCP7hiw==
X-Received: by 2002:a05:6402:26ca:: with SMTP id x10mr19010615edd.386.1618938172774;
        Tue, 20 Apr 2021 10:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/sePBPRPQUTmx8fDkJ2+CsjWnEpj49FgojrQhVJZqntZu2qHLjMn0Vt3q4U7LC4bOpSKRAQ==
X-Received: by 2002:a05:6402:26ca:: with SMTP id x10mr19010591edd.386.1618938172615;
        Tue, 20 Apr 2021 10:02:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:52 -0700 (PDT)
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
Subject: [PATCH 8/9] regulator: s2mpa01: Drop initialization via platform data
Date:   Tue, 20 Apr 2021 19:02:43 +0200
Message-Id: <20210420170244.13467-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

None of the platforms with S2MPA01 use board files, so any
initialization via platform data can be safely removed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/regulator/s2mpa01.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 115f59530852..28b424fe7bea 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -340,7 +340,6 @@ static const struct regulator_desc regulators[] = {
 static int s2mpa01_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct sec_platform_data *pdata = dev_get_platdata(iodev->dev);
 	struct regulator_config config = { };
 	struct s2mpa01_info *s2mpa01;
 	int i;
@@ -356,9 +355,6 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 	for (i = 0; i < S2MPA01_REGULATOR_MAX; i++) {
 		struct regulator_dev *rdev;
 
-		if (pdata)
-			config.init_data = pdata->regulators[i].initdata;
-
 		rdev = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
 		if (IS_ERR(rdev)) {
-- 
2.25.1

