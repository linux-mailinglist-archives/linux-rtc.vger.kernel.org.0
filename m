Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7742BB649
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Nov 2020 21:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgKTULT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 Nov 2020 15:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbgKTULT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 Nov 2020 15:11:19 -0500
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A8CC0613CF
        for <linux-rtc@vger.kernel.org>; Fri, 20 Nov 2020 12:11:18 -0800 (PST)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94)
        (envelope-from <johannes@sipsolutions.net>)
        id 1kgCkV-00BZyG-I1; Fri, 20 Nov 2020 21:11:15 +0100
From:   Johannes Berg <johannes@sipsolutions.net>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-um@lists.infradead.org,
        Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH] rtc: enable RTC framework on ARCH=um
Date:   Fri, 20 Nov 2020 21:11:06 +0100
Message-Id: <20201120211103.6895ac740d11.Ic19a9926e8e4c70c03329e55f9e5b1d45095b904@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Johannes Berg <johannes.berg@intel.com>

There's no real reason it should be disabled, and at least we can
use it for development & testing with the RTC test driver.

However, two devices are missing a HAS_IOMEM dependency, so add
that to avoid build failures from e.g. allyesconfig.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
Would there be objection to taking this through the linux-um tree?
I have a couple of patches that depend on it as well, to add
suspend/resume support with a pseudo-RTC to wake up from it.
---
 drivers/rtc/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 48c536acd777..de187b563989 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -13,7 +13,7 @@ config RTC_MC146818_LIB
 menuconfig RTC_CLASS
 	bool "Real Time Clock"
 	default n
-	depends on !S390 && !UML
+	depends on !S390
 	select RTC_LIB
 	help
 	  Generic RTC class support. If you say yes here, you will
@@ -1007,6 +1007,7 @@ config RTC_DRV_DS1553
 
 config RTC_DRV_DS1685_FAMILY
 	tristate "Dallas/Maxim DS1685 Family"
+	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the Dallas/Maxim DS1685
 	  family of real time chips.  This family includes the DS1685/DS1687,
@@ -1140,6 +1141,7 @@ config RTC_DRV_STK17TA8
 
 config RTC_DRV_M48T86
 	tristate "ST M48T86/Dallas DS12887"
+	depends on HAS_IOMEM
 	help
 	  If you say Y here you will get support for the
 	  ST M48T86 and Dallas DS12887 RTC chips.
-- 
2.26.2

