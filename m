Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966532F1274
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 13:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbhAKMl6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 07:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAKMl6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 07:41:58 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CEBC0617A3
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t30so16290391wrb.0
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmSSoDbc+2rw/4h75XEqx7jHACxZ7FHCs9p6Wbzi2zM=;
        b=0F+jeZbn/40ig5h5AsQvYwqSYf1roFYcuJpr1OS3UvzrbytMIJ7EiDuCQSDHRaIAMY
         n2CeXadk2IUrJS0x9s3gKYZbz0L1u80EfJBuy0dS6DFLDcc50cSYcNRNCMLrs8nImVU2
         +YRGvIE8jCudGBWitBLK3UuQYHImzdxj9KMNXkwFIIhcjgtVk2OF92mRgFgG7YGOf68L
         GMq0C1WQtguxs5kDudfJ4yq2LJnTyZntoRSXkEWGGiGBmIYwofir4BWaW2IFuWw+YXkA
         yE5hfWrJQH+rpiDuejhQIdeydzg2deecZKAJ2lM7t5sfbNq1ZC0PuzfeoDi2o/XDDy1X
         MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmSSoDbc+2rw/4h75XEqx7jHACxZ7FHCs9p6Wbzi2zM=;
        b=cbhW1O0DHZI1YwpHow02UMNCfMxr3lnJFf3D/GorvbkKlC6SMts7sxuq8VUzBvXDr4
         HpogZB9BJjO1IbaGb/WzYWED8jbiYKLNR0AW/IKePZEjx0dV5IYqyUPJdLC7z241gmMJ
         tATZgIhp3SH7ERB+Khg6r35Lr0TB2t/QgpqdTThsAUPS4IaQOxKsqfm8a+Z3JYyY4ZTu
         +q9DiP3rmP8iQLkQsV5cvHcJV6RWFx4dsFvHiZSJzgJOhqDu56742ww/FUi4MawB32we
         VmPPEW6ITlmc6+xZSyFCkA1mfZgDnvG/i0U6WnqhKBod8YxT7u9gXnllQoc8pghJBIQ6
         BPog==
X-Gm-Message-State: AOAM533o++FNRA3+7kNOr098h6Yh5bVl4XH8DrwMDU9LBJ4zYg8ACGAq
        n2YcHVSSDpy3R8y2meLZJMyKCg==
X-Google-Smtp-Source: ABdhPJx/JvGKoQ6786uAag5YOB20houzOa4TJHJiLsy2xCYGN6LcTS6vCSnTEqTyzHm4gA8W7tQKuw==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr16344895wrn.296.1610368836875;
        Mon, 11 Jan 2021 04:40:36 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l8sm26492362wrb.73.2021.01.11.04.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:40:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 1/3] rtc: s5m: select REGMAP_I2C
Date:   Mon, 11 Jan 2021 13:40:25 +0100
Message-Id: <20210111124027.21586-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111124027.21586-1-brgl@bgdev.pl>
References: <20210111124027.21586-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The rtc-s5m uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6123f9f4fbc9..e4bef40831c7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -692,6 +692,7 @@ config RTC_DRV_S5M
 	tristate "Samsung S2M/S5M series"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	select REGMAP_IRQ
+	select REGMAP_I2C
 	help
 	  If you say yes here you will get support for the
 	  RTC of Samsung S2MPS14 and S5M PMIC series.
-- 
2.29.1

