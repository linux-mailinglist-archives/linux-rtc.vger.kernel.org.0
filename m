Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AE041BB72
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 01:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243597AbhI1X7U (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 19:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243618AbhI1X7M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 19:59:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43242C061774
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o1-20020a056902110100b005b69483a0b4so1232093ybu.0
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ihkiWIdVP9dVl3VzYiirCjeRk2Jnoz/1Mr1zuXgTp3A=;
        b=aGCho/ZT42f9FJECHoQ5FwNACnqrnDRQrW3EZKeZ8fMIZkWu9yfckiBil2MSAfl1PW
         /XBdnPIKQnx/ix06HKtL5uVNePgfm8jPP9VtjIOEYpkEiTwq/AVAykTzhcNRk1+EOro+
         o8x070TidaiwQUry0PIVobVy853jKSi5f1/Lw13QXlS/cfAxchUAcdwUDHShJCVFkomf
         C8HnzTJKPNSqepRR+sGptuGANLleuLWjxsNAeYOISEVcQKaEVk6++FDcaAJUUe7XIxQP
         LEGeoyhx/s+PRWt7SIOXarb6g3PV1VWl3xMRO0HfcoTrOz4BaWi8RB+QiuWaf2ikXyGe
         i0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ihkiWIdVP9dVl3VzYiirCjeRk2Jnoz/1Mr1zuXgTp3A=;
        b=xIsBwu5nu1bSTBvI1++W4NBkzhSOI2q1lwO70z2IO2i6b0Mh0H48Wc2GcGmnHCIABx
         A5HCkIjhq4Pt9zAOvCrkhK/cAxEeW9vikKahz9ESvvjdI/cQ1Z8/NAV8HV3XJueLaffu
         ktW/dtovU56tLyGJCa6khw65uFv/XHmnWD/OGRoagZ/Q1dkTk8xLPCoB4oC69beeHZh+
         hQiqEAi09gcv/L2UlqWMjs4V6zcayusjT4NQXiEcpuoIpcoqxtLH0qMvvP8oAAotEOnm
         yjjBDAvupPVb3/FIMF2qJSE53fbFz1yMRjaLBIM0OHNQi9HnHrli1uIHJtuuQlRfNDr0
         VLWQ==
X-Gm-Message-State: AOAM531KNeT1Vht/GLN2SkqAI0XoyW/1TOxfXI+kDgKAt0M5Cc3ubBWr
        fEf5/w2qj7LDfW+cw+7cZfO5I068Fc4kB5M8PkE=
X-Google-Smtp-Source: ABdhPJy1ak/rbpUYju2D4z+JFHyh/My10IdIhBzBl3vMZ2iJUIcpwrdRjCAU6M7zNko3A+i42IClCJSTWrIcUgd9klk=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:ac1:: with SMTP id
 184mr10211657ybk.381.1632873439393; Tue, 28 Sep 2021 16:57:19 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:29 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-13-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 12/12] ARM: rtc: remove HAVE_S3C_RTC in favor of direct dependencies
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

The config HAVE_S3C_RTC is not really needed since we can simply just
add the dependencies directly to RTC_DRV_S3C. Also, one less config to
keep track of!

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/Kconfig              |  1 -
 arch/arm/mach-exynos/Kconfig  |  1 -
 arch/arm/mach-s5pv210/Kconfig |  1 -
 arch/arm64/Kconfig.platforms  |  1 -
 drivers/rtc/Kconfig           | 10 ++--------
 5 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fc196421b2ce..5ed6b5de981e 100644
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
index 2ad19a08bf06..8b72a70b6c43 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -19,7 +19,6 @@ menuconfig ARCH_EXYNOS
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
 	select S5P_DEV_MFC
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 62b90dda571f..681823687018 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -12,7 +12,6 @@ config ARCH_S5PV210
 	select CLKSRC_SAMSUNG_PWM
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select SOC_SAMSUNG
 	help
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e44d5e9f5058..02c8637d3f09 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,7 +91,6 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
 	select SOC_SAMSUNG
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
2.33.0.685.g46640cef36-goog

