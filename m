Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F197341BB74
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 01:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243609AbhI1X7W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 19:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243497AbhI1X7D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 19:59:03 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC46EC06176D
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:15 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id q185-20020a6343c2000000b00287c0b1723eso641925pga.5
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8a+pGr99SbxPPuDqxhZs4f7LER8gsJNgSzQRfQMX/ng=;
        b=cDq5EHjkB+BlLQ77eVTRDNuITFRj28ahb032+NylHFG6C5BUaYWmmJ4RDXzqb46L4a
         gxWX8hWE6q3yQByjEzaxt/goL0Lx8+Wj8NPtkLpHvmYERF4Ml8Z6IBJHSxR5VRtcAy/5
         lGew9v8HMhlLKBREGnbOZPWoThQVPNisaI7K4kEfXkLFqGjlhZMPECrQk4zR9L32cins
         H4dUXJ7RYsQs4O+2jKithABkGhQ1oLBxiPQs0tjU20W472hPN364yVfG4YM/ymDXuIPF
         6rx1621Da0O1VzynkZtiOc0QBJLgvnh1dU4ZfLesXMjwIp3Ya+Xy73FAN3w7owNkH43p
         RrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8a+pGr99SbxPPuDqxhZs4f7LER8gsJNgSzQRfQMX/ng=;
        b=0GsgPJZFcqlmycXhrEtAKJ8R7ySPIBwmeybmf39aCutS708WBiXvckNYbwXCQEz1YV
         yKo+ESj1k9kO+4Mx2sksTYNfIoarGhENrjWWTRQJWbEGPg5p66d1Nqv/o06Hw9g6ermm
         0dHNnZIs5hqZYmzClG9V0sMRcalNLAboO1WYwNQXF4YSKuqHjt58ifNeTTBzAw6Cm/JV
         TqB5ZggqQku8Oj5j+1e94Xo4EjOe6AmWr6hB1l1QRCC4hD8O/XWYVVhW96IUYl3NQU05
         GrWL0npO2zEgyFrkHW3lOGkANpHLGF2etqdGLPI/KP58EdwiEmzoumaqqyg78GVngy5a
         I+Wg==
X-Gm-Message-State: AOAM531qDtGUvwcbpLRpSEYAd2dLYhSeyl/RxJ+hUHPSKTgYM9/dzR6k
        2HHRQP0haTYIitXbZzWGgSeUc3PpG93bjwv/C30=
X-Google-Smtp-Source: ABdhPJxwcUuJteV50bGQEoklWqMpHmLg3VDiAYG2hThPHuW4JGrF3F5rgRl8xIKiaEkUVnIZuEE/iKxS8oQm/Sm4z0o=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:90a:8b8d:: with SMTP id
 z13mr237355pjn.0.1632873434545; Tue, 28 Sep 2021 16:57:14 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:27 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-11-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 10/12] soc: samsung: pmu: modularize the Exynos ARMv8 PMU driver
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

In order to only modularize the Exynos ARMv8 PMU driver, we have to
split it up from the ARM PMU driver. So make the following Kconfig
changes:
  * EXYNOS_PMU -> EXYNOS_PMU_ARM64
  * EXYNOS_PMU_ARM_DRIVERS -> EXYNOS_PMU_ARM

This patch also includes the necessary modularization changes.

Lastly, have EXYNOS_PMU_ARM64 use "default y if ARCH_EXYNOS && ARM64"
instead of having ARCH_EXYNOS select it directly.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/mach-exynos/Kconfig           |  2 +-
 arch/arm64/Kconfig.platforms           |  1 -
 drivers/soc/samsung/Kconfig            | 15 +++++++++------
 drivers/soc/samsung/Makefile           |  8 +++++---
 drivers/soc/samsung/exynos-pmu.c       | 13 +++++++------
 drivers/soc/samsung/exynos-pmu.h       |  2 +-
 include/linux/soc/samsung/exynos-pmu.h |  2 +-
 7 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index afc8cd062605..e97e1d8f7b00 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -13,7 +13,7 @@ menuconfig ARCH_EXYNOS
 	select ARM_GIC
 	select EXYNOS_IRQ_COMBINER
 	select EXYNOS_THERMAL
-	select EXYNOS_PMU
+	select EXYNOS_PMU_ARM
 	select EXYNOS_SROM
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select GPIOLIB
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 67f60cc3c723..e5e4b9b2fb97 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -92,7 +92,6 @@ config ARCH_BRCMSTB
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
-	select EXYNOS_PMU
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index d3746415be72..fdf1162ec98b 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -23,15 +23,18 @@ config EXYNOS_CHIPID
 	  Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
 	  This driver can also be built as module (exynos_chipid).
 
-config EXYNOS_PMU
-	bool "Exynos PMU controller driver" if COMPILE_TEST
-	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
-	select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
+config EXYNOS_PMU_ARM64
+	tristate "Exynos PMU controller driver"
+	depends on ARCH_EXYNOS || (ARM64 && COMPILE_TEST)
+	default y if (ARCH_EXYNOS && ARM64)
+	help
+	  Support for Samsung Exynos ARMv8 PMU controller. This driver can be
+	  built-in or as a module (exynos-pmu).
 
 # There is no need to enable these drivers for ARMv8
-config EXYNOS_PMU_ARM_DRIVERS
+config EXYNOS_PMU_ARM
 	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
-	depends on EXYNOS_PMU
+	depends on ARCH_EXYNOS || (ARM && COMPILE_TEST)
 
 config EXYNOS_PM_DOMAINS
 	bool "Exynos PM domains" if COMPILE_TEST
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 2ae4bea804cf..cd55c72a052d 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -4,10 +4,12 @@ obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
 obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos_chipid.o
 exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 
-obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
+obj-$(CONFIG_EXYNOS_PMU_ARM64)	+= exynos-pmu.o
+
+obj-$(CONFIG_EXYNOS_PMU_ARM)	+= exynos-pmu32.o
+exynos-pmu32-y			+= exynos-pmu.o exynos3250-pmu.o \
+			exynos4-pmu.o exynos5250-pmu.o exynos5420-pmu.o
 
-obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
-					exynos5250-pmu.o exynos5420-pmu.o
 obj-$(CONFIG_EXYNOS_PM_DOMAINS) += pm_domains.o
 obj-$(CONFIG_EXYNOS_REGULATOR_COUPLER) += exynos-regulator-coupler.o
 
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a18c93a4646c..3dd0219c908c 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/module.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
@@ -63,7 +64,7 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
  * Split the data between ARM architectures because it is relatively big
  * and useless on other arch.
  */
-#ifdef CONFIG_EXYNOS_PMU_ARM_DRIVERS
+#ifdef CONFIG_EXYNOS_PMU_ARM
 #define exynos_pmu_data_arm_ptr(data)	(&data)
 #else
 #define exynos_pmu_data_arm_ptr(data)	NULL
@@ -154,9 +155,9 @@ static struct platform_driver exynos_pmu_driver = {
 	.probe = exynos_pmu_probe,
 };
 
-static int __init exynos_pmu_init(void)
-{
-	return platform_driver_register(&exynos_pmu_driver);
+module_platform_driver(exynos_pmu_driver);
 
-}
-postcore_initcall(exynos_pmu_init);
+MODULE_DESCRIPTION("Exynos PMU controller driver");
+MODULE_AUTHOR("Marek Szyprowski <m.szyprowski@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 5e851f32307e..4a7f03c79dd0 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -28,7 +28,7 @@ struct exynos_pmu_data {
 
 extern void __iomem *pmu_base_addr;
 
-#ifdef CONFIG_EXYNOS_PMU_ARM_DRIVERS
+#ifdef CONFIG_EXYNOS_PMU_ARM
 /* list of all exported SoC specific data */
 extern const struct exynos_pmu_data exynos3250_pmu_data;
 extern const struct exynos_pmu_data exynos4210_pmu_data;
diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
index a4f5516cc956..d7317e0902b8 100644
--- a/include/linux/soc/samsung/exynos-pmu.h
+++ b/include/linux/soc/samsung/exynos-pmu.h
@@ -19,7 +19,7 @@ enum sys_powerdown {
 };
 
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
-#ifdef CONFIG_EXYNOS_PMU
+#if IS_ENABLED(CONFIG_EXYNOS_PMU_ARM64) || IS_ENABLED(CONFIG_EXYNOS_PMU_ARM)
 extern struct regmap *exynos_get_pmu_regmap(void);
 #else
 static inline struct regmap *exynos_get_pmu_regmap(void)
-- 
2.33.0.685.g46640cef36-goog

