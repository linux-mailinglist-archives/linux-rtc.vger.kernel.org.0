Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24B3E8520
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Aug 2021 23:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbhHJVU5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Aug 2021 17:20:57 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59233 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbhHJVUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Aug 2021 17:20:55 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 20F8D1C0003;
        Tue, 10 Aug 2021 21:20:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: move RTC_LIB_KUNIT_TEST to proper location
Date:   Tue, 10 Aug 2021 23:20:07 +0200
Message-Id: <20210810212008.631359-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810212008.631359-1-alexandre.belloni@bootlin.com>
References: <20210810212008.631359-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move RTC_LIB_KUNIT_TEST under RTC_LIB so it is clear in the menu this is
part of the RTC subsystem.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig  | 19 +++++++++----------
 drivers/rtc/Makefile |  3 ++-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index b3cf3a274c05..daff06707455 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -10,16 +10,6 @@ config RTC_MC146818_LIB
 	bool
 	select RTC_LIB
 
-config RTC_LIB_KUNIT_TEST
-	tristate "KUnit test for RTC lib functions" if !KUNIT_ALL_TESTS
-	depends on KUNIT
-	default KUNIT_ALL_TESTS
-	select RTC_LIB
-	help
-	  Enable this option to test RTC library functions.
-
-	  If unsure, say N.
-
 menuconfig RTC_CLASS
 	bool "Real Time Clock"
 	default n
@@ -85,6 +75,15 @@ config RTC_DEBUG
 	  Say yes here to enable debugging support in the RTC framework
 	  and individual RTC drivers.
 
+config RTC_LIB_KUNIT_TEST
+	tristate "KUnit test for RTC lib functions" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test RTC library functions.
+
+	  If unsure, say N.
+
 config RTC_NVMEM
 	bool "RTC non volatile storage support"
 	select NVMEM
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 763d3628c603..5ceeafe4d5b2 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -15,6 +15,8 @@ rtc-core-$(CONFIG_RTC_INTF_DEV)		+= dev.o
 rtc-core-$(CONFIG_RTC_INTF_PROC)	+= proc.o
 rtc-core-$(CONFIG_RTC_INTF_SYSFS)	+= sysfs.o
 
+obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
+
 # Keep the list ordered.
 
 obj-$(CONFIG_RTC_DRV_88PM80X)	+= rtc-88pm80x.o
@@ -178,4 +180,3 @@ obj-$(CONFIG_RTC_DRV_WM8350)	+= rtc-wm8350.o
 obj-$(CONFIG_RTC_DRV_X1205)	+= rtc-x1205.o
 obj-$(CONFIG_RTC_DRV_XGENE)	+= rtc-xgene.o
 obj-$(CONFIG_RTC_DRV_ZYNQMP)	+= rtc-zynqmp.o
-obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
-- 
2.31.1

