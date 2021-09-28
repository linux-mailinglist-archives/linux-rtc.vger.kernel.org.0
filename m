Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F17D41BB76
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 01:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243406AbhI1X7X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 19:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243599AbhI1X7M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 19:59:12 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FA5C061771
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:17 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id mi13-20020a17090b4b4d00b0019ea046dd7cso3619378pjb.2
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ixpCREpropOCGCRbCNTt+ILPYTGJK7YTyRDE4hs8Q3U=;
        b=TsgdlJd06yMGzkDYI5YTtAleRwmiUdX8LJDX+oB2En6Uwcaj/G8FgoXqLYqf/WvkoP
         SB55oZLt98evS2kyJBBsT9PAH4/+ZKx3m1L0ppa3KKdu0Cstd5wV6LY6EwabpqF8Ekmy
         KiG6I5Nhx5SXyIyADyBC2PB2BDs3qDmypwhG8lJkf2YhkkB8XHOHIoL5dDTP8We7DiHM
         I0CPrUmV4v7SBtolQ3bmlYO3h/Ar1qWbt01GI7w6Ky+w+MbX42RaG5K1KJQRFVILOh0S
         lQ0M6v2EqTOwU6eiStZ0lDufQN0xMYnMkbxq4N+Jq3CAI0VIe7qRAOZcQScyljKJzJB8
         a/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ixpCREpropOCGCRbCNTt+ILPYTGJK7YTyRDE4hs8Q3U=;
        b=qMwBS86W3nMcIU0CjdaRVCfvNwvBoGoR5S3Juof/vUJaUWuo3MjkzdvO2GAevaTyai
         wGfcZb+DGN/pc9YF+/knObwKAp2ikFMrPCpnjSp11lL0Qq0qlL5qkrTrDWVoBG7o9Qtp
         P1WuF+hTDh3xAgHbJpd2bUPKniD3eaGE1GnbuYYkBa4Ovg2buTtmccu4FCSR/ybJv1dh
         /4cvN5RVtoyH433IS6p7wyFkbUBzlYA2Dxsqe3GDMH9Dt1oBIjpyJuumcoVYQGKpvEaF
         RHzB4S4Ntx7ElexI8f15tqRvzqdRlpw2VAwr8rNkcTSqsQd/yTgh7FLrkwiSudGYfKMB
         mmFA==
X-Gm-Message-State: AOAM530qLtKUBuZA57iYX+8D1NLkyNqVa7UDuJcadlGfF6clDlFB1T8N
        j7WAeV8T/ItEMvCtUMD3FK5eQDlhxPLK6h82Tss=
X-Google-Smtp-Source: ABdhPJydPTfhvEcIZ2rCgH9PDFfwCp4cgW7lTL1eXYIXByXNU/KAKSzrz+hFAOGr6G3aLwmq27iWLkEqkVEY8LO1tRk=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:2309:b0:444:6be1:c499 with
 SMTP id h9-20020a056a00230900b004446be1c499mr458802pfh.62.1632873436877; Tue,
 28 Sep 2021 16:57:16 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:28 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-12-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 11/12] soc: samsung: pm_domains: modularize EXYNOS_PM_DOMAINS
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Exynos PM Domains driver into a module. This includes
setting EXYNOS_PM_DOMAINS as tristate and removing it from being
auto-selected by ARCH_EXYNOS. Instead, the config will use
"default y if ARCH_EXYNOS" which allows us to set it to a module via the
defconfig now.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/mach-exynos/Kconfig     |  1 -
 arch/arm64/Kconfig.platforms     |  1 -
 drivers/soc/samsung/Kconfig      |  3 ++-
 drivers/soc/samsung/pm_domains.c | 12 +++++++-----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e97e1d8f7b00..2ad19a08bf06 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -15,7 +15,6 @@ menuconfig ARCH_EXYNOS
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU_ARM
 	select EXYNOS_SROM
-	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select GPIOLIB
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e5e4b9b2fb97..e44d5e9f5058 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,7 +91,6 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index fdf1162ec98b..e4743c29f73c 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -37,8 +37,9 @@ config EXYNOS_PMU_ARM
 	depends on ARCH_EXYNOS || (ARM && COMPILE_TEST)
 
 config EXYNOS_PM_DOMAINS
-	bool "Exynos PM domains" if COMPILE_TEST
+	tristate "Exynos PM domains"
 	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
+	default y if ARCH_EXYNOS
 
 config SAMSUNG_PM_DEBUG
 	bool "Samsung PM Suspend debug"
diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index 5ec0c13f0aaf..6144733fa3c2 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
@@ -160,8 +161,9 @@ static struct platform_driver exynos_pd_driver = {
 	}
 };
 
-static __init int exynos4_pm_init_power_domain(void)
-{
-	return platform_driver_register(&exynos_pd_driver);
-}
-core_initcall(exynos4_pm_init_power_domain);
+module_platform_driver(exynos_pd_driver);
+
+MODULE_DESCRIPTION("Exynos PM domains driver");
+MODULE_AUTHOR("Marek Szyprowski <m.szyprowski@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0.685.g46640cef36-goog

