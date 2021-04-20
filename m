Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E83365E1D
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhDTRDV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:03:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50125 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbhDTRDU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:03:20 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtlv-0004ah-Lm
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:02:47 +0000
Received: by mail-ed1-f70.google.com with SMTP id c13-20020a05640227cdb0290385526e5de5so3427636ede.21
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=keyZF1dMrTytgJE0QXrv29sXyKKIfNCJoe54NneFfoA=;
        b=KipQocmKAlouUIGh82garHZSALlY3JmL4jUHew9/CEQHwL+PRaIScfEIruRzepj2eZ
         8oF8S+kot7J3Bn6qS5le1HQVmEmxeH+aCwz/UnfbUHQ70VCfwHlU6M1I8fl+ib0AusqG
         gDnMd87gM20QJsfFY92r1RaLsc9lcdkHcgOjQ0OU2gGeLPDsIugytI2woXotzk9g83b+
         hnfXtvi4UsHoixAI1mg2mxJJfrDl6d6c1b8NYUqfTvX63RuMapmKA1WiKF0ySyD7GEuV
         umbAt4xpmFtMLrJ35RBNXwBEWbU3qfKDeUrgvuvZH5JUkd+Sg29oR/BjBCzPwujsMiUs
         pW4Q==
X-Gm-Message-State: AOAM530TQAaINyQMW9dcHNo6aFKtq6JxVm/ogZbd1Ufrh7YicIyY2EGQ
        0CS7h1kLnTMiA1iRRnvxaZ99bx+Z1GzzGnc7P+Ehz9SVcuPv1wqC0vFrNJhaMSa06fMMHj/rsh5
        vBJuxT49RBxmfwX5uevnISuquE9B/wcXpWgvXkQ==
X-Received: by 2002:a17:906:8293:: with SMTP id h19mr28510698ejx.217.1618938167392;
        Tue, 20 Apr 2021 10:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZQNmrSU3oUKEeIgav74Ok6jYa6Nq7lnseZVdJOdyMAiCgNg4cKijG2O8AVSf2mLoof7/yXQ==
X-Received: by 2002:a17:906:8293:: with SMTP id h19mr28510678ejx.217.1618938167258;
        Tue, 20 Apr 2021 10:02:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:46 -0700 (PDT)
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
Subject: [PATCH 5/9] mfd: sec: Enable wakeup from suspend via devicetree property
Date:   Tue, 20 Apr 2021 19:02:40 +0200
Message-Id: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set device wakeup capability from devicetree property (done by drivers
core), instead of always setting it to 0 (because value in platform data
is not assigned).

This should not have visible effect on actual resuming from suspend
because the child device - S5M RTC driver - is responsible for waking
up and sets device wakeup unconditionally.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 8 --------
 include/linux/mfd/samsung/core.h | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a9d4fbc51997..1fb29c45f5cf 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -298,12 +298,6 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * ToDo: the 'wakeup' member in the platform data is more of a linux
-	 * specfic information. Hence, there is no binding for that yet and
-	 * not parsed here.
-	 */
-
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
 						"samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
@@ -337,7 +331,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
-	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
 
 	switch (sec_pmic->device_type) {
@@ -429,7 +422,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
 	sec_pmic_configure(sec_pmic);
 	sec_pmic_dump_rev(sec_pmic);
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 9864f13b7814..b0d049a56d16 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -69,8 +69,6 @@ struct sec_pmic_dev {
 	unsigned long device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
-
-	bool wakeup;
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
@@ -82,7 +80,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	bool				wakeup;
 	bool				buck_voltage_lock;
 
 	int				buck_gpios[3];
-- 
2.25.1

