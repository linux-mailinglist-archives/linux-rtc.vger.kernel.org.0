Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA9239CFFE
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Jun 2021 18:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhFFQ0Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Jun 2021 12:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhFFQ0Y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Jun 2021 12:26:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32559C061766
        for <linux-rtc@vger.kernel.org>; Sun,  6 Jun 2021 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=+aLAeR7o1r+uQVoGi6WKyqGkjg5vW7reEPvZ0P/MFvg=; b=j2xLQQDGNZsH5/M/uNt7+CQ0Pr
        FGWINQdn1628aDwyjR3KnqQ+QF5suOcHDRbxi5WcaTZyT/DL9m6+lZYgfbS22ggQ72b+Xyuk+pe1U
        FnJtaowCu2v+2KmMBPxOjBmwHp39MdjzXt8D044p2tyz/Lc7hKeExKMwukBRY/AhEvlwibOSIld27
        eDy0j2yL5htYq4IcjUjNcAU93ogNpxGnbVa9aH+kGGSSJoRgQqfhAAoMhBlMx/QCwgCXpxY2Z6boT
        0cstrqktqLS2QvWQiEjphCXFLJqMEIsMqXHPMC5WtLRiHrO0hhg7jq9PGbQwqqA2yaDVwFEWQnvfr
        42rjzi7Q==;
Received: from [2601:1c0:6280:3f0::bd57] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lpvZZ-000XfK-5s; Sun, 06 Jun 2021 16:24:25 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: pcf8523: rename REG_OFFSET register
Date:   Sun,  6 Jun 2021 09:24:23 -0700
Message-Id: <20210606162423.22235-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
causes a build warning, so rename this macro in the RTC driver.

../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
   44 | #define REG_OFFSET   0x0e

../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the location of the previous definition
   25 | #define REG_OFFSET 3

Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC oscillator")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-pcf8523.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
+++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
@@ -41,7 +41,7 @@
 #define REG_WEEKDAY_ALARM	0x0d
 #define ALARM_DIS BIT(7)
 
-#define REG_OFFSET   0x0e
+#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */
 #define REG_OFFSET_MODE BIT(7)
 
 #define REG_TMR_CLKOUT_CTRL 0x0f
@@ -442,7 +442,7 @@ static int pcf8523_rtc_read_offset(struc
 	u8 value;
 	s8 val;
 
-	err = pcf8523_read(client, REG_OFFSET, &value);
+	err = pcf8523_read(client, REG_OFFSET_TUNE, &value);
 	if (err < 0)
 		return err;
 
@@ -467,7 +467,7 @@ static int pcf8523_rtc_set_offset(struct
 	else
 		value = (reg_m1 & 0x7f) | REG_OFFSET_MODE;
 
-	return pcf8523_write(client, REG_OFFSET, value);
+	return pcf8523_write(client, REG_OFFSET_TUNE, value);
 }
 
 static const struct rtc_class_ops pcf8523_rtc_ops = {
