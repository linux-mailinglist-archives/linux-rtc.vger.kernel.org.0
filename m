Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD825368179
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 15:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhDVNdv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 09:33:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230005AbhDVNdv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Apr 2021 09:33:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4086E6145C;
        Thu, 22 Apr 2021 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619098396;
        bh=OhKyg/Fldv5I1xF4E06/ZwuVoCgL3MDDc7XVUldqtl0=;
        h=From:To:Cc:Subject:Date:From;
        b=XPpSJ33rA0JIvd53op7hDBIK0sjoFaHJAOkhlH8EErBhXBVZ67dt6yvX61a0aT7NM
         bWJZXvLjYLQsQg6L9OksHREK96lIw8TE1R3ovFarQG9Ye6z+cmLxAl5USXX/N0Unbq
         3iybqyq7HsACVqeAIyWweUJskilihgBKeAqWDMa8ErpSCW1aL2UtbY6f8mE/2P/MoL
         Nr4jIKf9uBKBWf86hTi9QY6haFY63l2YKTbe9l9MVQ/db6ajbMzL73GUnZfIxJWjWb
         uUz40wr2jB0q+SqxFx05g3kGzfWFKrutHj/kcSxhr6R0l9NCn0UhY4PU3MFFOw9noq
         z9I/PDsRILQkg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: bd70528: fix BD71815 watchdog dependency
Date:   Thu, 22 Apr 2021 15:32:43 +0200
Message-Id: <20210422133307.1710832-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The added Kconfig dependency is slightly incorrect, which can
lead to a link failure when the watchdog is a loadable module:

arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_rtc_based_timers':
rtc-bd70528.c:(.text+0x6cc): undefined reference to `bd70528_wdt_set'
arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_time':
rtc-bd70528.c:(.text+0xaa0): undefined reference to `bd70528_wdt_lock'
arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0xab8): undefined reference to `bd70528_wdt_unlock'
arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_alm_enable':
rtc-bd70528.c:(.text+0xfc0): undefined reference to `bd70528_wdt_lock'
arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0x1030): undefined reference to `bd70528_wdt_unlock'

The problem is that it allows to be built-in if any of the other
drivers are built-in, even when the watchdog is a loadable module.

Rework this so that having the watchdog as a loadable module always
forces the rtc to be a module as well instead of built-in, regardless
of the other ones.

Fixes: c56dc069f268 ("rtc: bd70528: Support RTC on ROHM BD71815")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index d8c13fded164..91cc106e2bf6 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -502,7 +502,8 @@ config RTC_DRV_M41T80_WDT
 
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
-	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
+	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 || BD70528_WATCHDOG
+	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
 	help
 	  If you say Y here you will get support for the RTC
 	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
-- 
2.29.2

