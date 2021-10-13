Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD02D42CCBE
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 23:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJMVZU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 17:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhJMVZT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 17:25:19 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4949FC061749
        for <linux-rtc@vger.kernel.org>; Wed, 13 Oct 2021 14:23:16 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id x10-20020a17090abc8a00b001a04877d05bso2262730pjr.5
        for <linux-rtc@vger.kernel.org>; Wed, 13 Oct 2021 14:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=CULyeJTJVJ+bhqH61eKq0VGTitHRm0H9eFT6VyJWHZQ=;
        b=V5vj278IDz5u9J9eQEvIguDgzLJgZpkiwD69OCg3m6SaZ8BuOuDWgh8If+2lIZqRl1
         WkZQ7eNtIbJ4HeiM+avql/plX75XCAHt+wnbbxVNCmV3wk/sFORX9xW3aSWlJDSfAAsi
         UOAsxwd1+uykwN0JUDKQChx0daPE5TTj4zrGWBh5cNI22m7ApH/9BPXJ+PR3sQZ6BQGr
         mgtBMAms75b05FwjBu+W20kViohDWe0vhxmACCg1w6wvLtUT1qLzXffVhIMBGNN5Pu37
         gyGs2uHa7V6pIGfVzs0yY2ry79zAgbUbX47RFwWRDF435XN97QsQoCfWfYdF1jZzGXwh
         ZlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=CULyeJTJVJ+bhqH61eKq0VGTitHRm0H9eFT6VyJWHZQ=;
        b=vQxKJ8NT8e/hWDpqgLD5gCqbvSJVqmtql54f26q8L0TMiFSWjW5LYLcqx+ufIMxbOc
         zsWqZItg6W6jIenQA9iLSLGUOXCHx7HcHYdiKc5qM8ITTTJdc3YgiXcQqSzt1HHg8R30
         2gJsdgP2q2xpRAxVua/K/vPfVHD/DW5JajC5WWYYMPZ7QCOskKlObzV6JiBPgJDzd4Rw
         v1JY5KfGOtkmhYAGf5OPYew1bvkwMaFxpycWA6iSLmF6/4horooJKgbLOqmrNE2vIAXA
         FExIzdVBerXHS91adVschtZ3oCuB4QtkLrKvWIL+UfW6wmgZY44S6Hum/Cis82a6osi3
         nMKg==
X-Gm-Message-State: AOAM532KBTs8NpzDd06ymEMFmibfSt45kD7UgR6v6vDbW/LKnJrHq2Ez
        rDxBQGHtLKiQIDVA7N2PiEnyMrx4msFTgniTM4Y=
X-Google-Smtp-Source: ABdhPJxdZff9YhBwBPiborfQVMP8q1qVYvtCKwp62VbGVaHdZxg/co9HSsItSqABdO5PioENCq6uzHX8tKQ8qB1FXQc=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a63:6c89:: with SMTP id
 h131mr1227261pgc.47.1634160195777; Wed, 13 Oct 2021 14:23:15 -0700 (PDT)
Date:   Wed, 13 Oct 2021 21:22:55 +0000
Message-Id: <20211013212256.3425889-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v3] rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The config HAVE_S3C_RTC is not really needed since we can simply just
add the dependencies directly to RTC_DRV_S3C. Also, one less config to
keep track of!

Signed-off-by: Will McVicker <willmcvicker@google.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/Kconfig              |  1 -
 arch/arm/mach-exynos/Kconfig  |  1 -
 arch/arm/mach-s5pv210/Kconfig |  1 -
 arch/arm64/Kconfig.platforms  |  1 -
 drivers/rtc/Kconfig           | 10 ++--------
 5 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 59baf6c132a7..29b745c05d37 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -475,7 +475,6 @@ config ARCH_S3C24XX
 	select GPIOLIB
 	select GENERIC_IRQ_MULTI_HANDLER
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_IO_H
 	select S3C2410_WATCHDOG
 	select SAMSUNG_ATAGS
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 30f930e20599..dd1ae5571f43 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -21,7 +21,6 @@ menuconfig ARCH_EXYNOS
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index d644b45bc29d..5a96099af991 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -13,7 +13,6 @@ config ARCH_S5PV210
 	select COMMON_CLK_SAMSUNG
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select SOC_SAMSUNG
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 90c5cf4856e1..d5f0f4cdf093 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -94,7 +94,6 @@ config ARCH_EXYNOS
 	select COMMON_CLK_SAMSUNG
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e1bc5214494e..7208eeb8459a 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1404,16 +1404,10 @@ config RTC_DRV_OMAP
 	  This driver can also be built as a module, if so, module
 	  will be called rtc-omap.
 
-config HAVE_S3C_RTC
-	bool
-	help
-	  This will include RTC support for Samsung SoCs. If
-	  you want to include RTC support for any machine, kindly
-	  select this in the respective mach-XXXX/Kconfig file.
-
 config RTC_DRV_S3C
 	tristate "Samsung S3C series SoC RTC"
-	depends on ARCH_S3C64XX || HAVE_S3C_RTC || COMPILE_TEST
+	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S3C24XX || ARCH_S5PV210 || \
+		   COMPILE_TEST
 	help
 	  RTC (Realtime Clock) driver for the clock inbuilt into the
 	  Samsung S3C24XX series of SoCs. This can provide periodic
-- 
2.33.0.882.g93a45727a2-goog

