Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43117365E23
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbhDTRDY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:03:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50145 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbhDTRDX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:03:23 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtly-0004cR-P6
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:02:50 +0000
Received: by mail-ed1-f71.google.com with SMTP id w14-20020aa7da4e0000b02903834aeed684so11713387eds.13
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CZHnNFNaMNa8a85SBpXammff3rvFDkP+H98gsBQ8d3o=;
        b=MjyILDbyXsefxxWj8iBbWpC1BwWUfKaiuHnJj9y9XLx3hC6HPFOiFZajMMOAbxfZSS
         AgmfOVgCk1jPT2HhSwpHXWMwM8tJlIN+U6ZixwV0Sy6Z2VGe0d3YT4fXVHRLxGWKkfmK
         SQ16VFf11nel52NP11fCrOqlmSzCsO3rrAaWKMTtDWizEorRY8KfH26cvRgaPT3Z5q6N
         QP/Izw9aQahqdPgxem++uUgltKt6rqyev7P6/H0IMKTDJDlVC+VVJVhLS2HcxS4X4PS/
         M2lEqQxb0e8BCqco0mi5pLWxpTiLItB0AlKJjVMhlzW/jRCay+w2GzknStBi1F5DAHWy
         jBxA==
X-Gm-Message-State: AOAM530FrJywYT7VCxU3Q6nfnbtcg8OCi1oPH/Qiisxdz/3b4AqTlvr7
        njRXYTosFivDIcfBrZFYbpTNUI/v/JXBEZ0uh9rXy33qbXf5JLF8K5zOQejXHYblF+Rr+4hQ+o0
        vWmogpLx8xni9g9JlCptU1Y8VhilnBnMFSdRwLA==
X-Received: by 2002:a17:906:4913:: with SMTP id b19mr28867180ejq.439.1618938170534;
        Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOLsxZKglCAv77mKXcTh7j9A7OdejF9kWYftWrwmpV/d4re5KZPtRxzK5D7Kz9pjhQCLFxOg==
X-Received: by 2002:a17:906:4913:: with SMTP id b19mr28867163ejq.439.1618938170410;
        Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:49 -0700 (PDT)
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
Subject: [PATCH 7/9] rtc: s5m: Remove reference to parent's device pdata
Date:   Tue, 20 Apr 2021 19:02:42 +0200
Message-Id: <20210420170244.13467-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The S5M RTC driver does not use parent's device (sec-core PMIC driver)
platform data so there is no need to check for it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-s5m.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 80b66f16db89..038269a6b08c 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -713,16 +713,10 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
-	struct sec_platform_data *pdata = s5m87xx->pdata;
 	struct s5m_rtc_info *info;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
-	if (!pdata) {
-		dev_err(pdev->dev.parent, "Platform data not supplied\n");
-		return -ENODEV;
-	}
-
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.25.1

