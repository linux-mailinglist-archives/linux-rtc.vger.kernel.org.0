Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D7D412D36
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Sep 2021 05:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhIUDQA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Sep 2021 23:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349470AbhIUC0k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Sep 2021 22:26:40 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE2FC1E3A53
        for <linux-rtc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:42 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id u7-20020a632347000000b0026722cd9defso16037567pgm.7
        for <linux-rtc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=F6cGi29a7AfEikhLMTK8OrCpcnf5YNIMe8XqMKTgBWE=;
        b=WaybUjqVu/zv+vIZpFhmoCtqsH0J+cSC+hsipU29HLqreSTA/oMTEV/usynjaGKZv9
         msiqVmzTwaISJLYoVuxNtt/gOJvHGb5rzFhqx8PlX8iGzC6ckmoHCoC+/hATCx2U31/j
         TkVCx8hqU8GF/UDHHT56XsQM+OTxqhNkZk9Y/iPCywv/zZ7F4ZAIi8ehJxEe76mkRz7m
         hH6zzWmqGPwAO8mqf7wcq0CCIre4iWQ3SvtB3uVg9xWldB19R5ZESw1sLbOiM9W/8gnD
         Z3arInj4gTz0ScRRtSPLos5dgfQAQrczWtK0J4PeTHKcyQw2hrt9Qdw4zYI2rIzCUBRJ
         /bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=F6cGi29a7AfEikhLMTK8OrCpcnf5YNIMe8XqMKTgBWE=;
        b=5hjpBEjwj1eZPpc2cU+66Up20qmzRyvt0nPA5f9AGLYsUvUdZ5ZfRx+63OZuDLVwQd
         BIjuCsvdhNPrO7bO6Uh6P5nlYaDro5g8UcJ3AmErg6rbL7Bqpu+g4swGBw0xZ1szcSUj
         P2Ve9Vy4CIWBnwSN//Jzzy0GbllZe6YrMSGCBq5tnzEOqQyIiTKZkO775atw0phVNc5x
         0hAADP6eErf15Vp00nI2zZW2Ab6fLuNRJMpePwgctxWTCF3Mvj3NwQ5tBd2/C2+2Vluj
         m1D00b2tfhyFqrlxggiqHhP4UVb8GhSJL1WrMNsE5y6J7uSUTcyFxFtTgGUHou/uTcvw
         +NLQ==
X-Gm-Message-State: AOAM533HyE/sRMEDQQkOJxviE5sODx+2ADnKI30FSY7rFBGGCIReISu1
        ZnbYZV57s8bNMiwFX+UpaENJqilNJ/K5PcOH/4w=
X-Google-Smtp-Source: ABdhPJxzkMfeAZXRaAianGXffx1iCvr9RAwg8Omo/kfgyxb2a4u5Shp06Gkd/wq7B2gWBPNgyV3oA9U2ASPf6mLOHUo=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:1141:b0:440:3c27:807c with
 SMTP id b1-20020a056a00114100b004403c27807cmr26237287pfm.71.1632164681943;
 Mon, 20 Sep 2021 12:04:41 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:03:49 +0000
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Message-Id: <20210920190350.3860821-5-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 4/4] rtc: change HAVE_S3C_RTC default config logic
From:   Will McVicker <willmcvicker@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Switches the default config logic of HAVE_S3C_RTC to use "default y if
(ARCH_EXYNOS && RTC_CLASS)" versus having ARCH_EXYNOS directly select
it. This provides vendors flexibility to disable the config if desired
or modularize it in the presence of a generic kernel.

Verified this change doesn't impact the .config.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 drivers/rtc/Kconfig          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a884e5da8b0f..f9f829aab511 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,7 +91,6 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
 	help
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e1bc5214494e..40afdb37d2a5 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1406,6 +1406,7 @@ config RTC_DRV_OMAP
 
 config HAVE_S3C_RTC
 	bool
+	default y if (ARCH_EXYNOS && RTC_CLASS)
 	help
 	  This will include RTC support for Samsung SoCs. If
 	  you want to include RTC support for any machine, kindly
-- 
2.33.0.464.g1972c5931b-goog

