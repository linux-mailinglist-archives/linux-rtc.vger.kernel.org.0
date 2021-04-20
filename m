Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58019365E12
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhDTRCM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:02:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50101 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhDTRCJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:02:09 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtkm-0004V9-Q4
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:01:36 +0000
Received: by mail-ed1-f72.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bso13574685edb.23
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4MQZJQCSFcmUXULRJb5AryMwyvkkTE7eS672AhRJWI=;
        b=LGmqbX/DEauHM5EL1jOK5M/GYzkn09k0K04lS0pV9yzaspDn/R9xzZFBnN/ICAaip5
         FOQ7TfzBn0r6IIixnokTKHJxTnok/FQdj97ySgStoy4waE+5BCHeJXdT1WQWA/kqWBag
         8JTlDacbPE4N7RRVobbzIrVmzh6i8JAsdGTyGJWdql48YA0ncbD9+pOR/MHw3kFCPAFl
         voeQvoMkwHDkWoPQEeQls+0yaMEA+/V0S1STR8IZ/Vi1jEKE97tafS4VupTG6JR7ei8j
         1DK7e7jrcG/2803il+e6ooF5QEGnnsBbZaVVtRRL3KXeyVyOKDiGgLSRayXbEWX5beF6
         0yIg==
X-Gm-Message-State: AOAM530nrfOu4QAHHKum2zQQ+FtM9LqZn87f2RhQjhS8ndViKseMqlOa
        Ay73GWyRhyM1a9+spjPNsT1qzyBt1/psublpblwkEsFDeB5AmYtqbsfOmWwi+2Hd7ZWID+bG9aw
        ZIbpEAqM3nNMjPD8ntwKeOiwyhpTW0C7FhuenBQ==
X-Received: by 2002:a17:906:a10e:: with SMTP id t14mr28175394ejy.103.1618938096012;
        Tue, 20 Apr 2021 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5VBAesIurvAN/mJmidYWOkS3cFDUzXX2qoPNrx8KEYx6J8WUPmFjGJfIG6RsmohoUpNTSUw==
X-Received: by 2002:a17:906:a10e:: with SMTP id t14mr28175378ejy.103.1618938095878;
        Tue, 20 Apr 2021 10:01:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id x7sm16334441eds.67.2021.04.20.10.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:01:35 -0700 (PDT)
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
Subject: [PATCH 4/9] mfd: sec: Remove unused irq_base in platform data
Date:   Tue, 20 Apr 2021 19:01:13 +0200
Message-Id: <20210420170118.12788-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The 'irq_base' field of platform data structure is not assigned,
therefore its default value of 0 has no impact and can be safely
dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 1 -
 drivers/mfd/sec-irq.c            | 4 +---
 include/linux/mfd/samsung/core.h | 3 ---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 4c4db3171ce6..a9d4fbc51997 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -337,7 +337,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
-	sec_pmic->irq_base = pdata->irq_base;
 	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
 
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index a98c5d165039..e473c2fb42d5 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -444,7 +444,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	if (!sec_pmic->irq) {
 		dev_warn(sec_pmic->dev,
 			 "No interrupt specified, no interrupts\n");
-		sec_pmic->irq_base = 0;
 		return 0;
 	}
 
@@ -482,8 +481,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq,
 				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				       sec_pmic->irq_base, sec_irq_chip,
-				       &sec_pmic->irq_data);
+				       0, sec_irq_chip, &sec_pmic->irq_data);
 	if (ret != 0) {
 		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
 		return ret;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index bfde1b7c6303..9864f13b7814 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,6 @@ struct sec_pmic_dev {
 	struct i2c_client *i2c;
 
 	unsigned long device_type;
-	int irq_base;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 
@@ -83,8 +82,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	int				irq_base;
-
 	bool				wakeup;
 	bool				buck_voltage_lock;
 
-- 
2.25.1

