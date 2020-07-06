Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677C82152AF
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2020 08:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgGFG1i (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jul 2020 02:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgGFG1i (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Jul 2020 02:27:38 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE01C061794;
        Sun,  5 Jul 2020 23:27:38 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id C8627BC07E;
        Mon,  6 Jul 2020 06:27:33 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: RTC
Date:   Mon,  6 Jul 2020 08:27:27 +0200
Message-Id: <20200706062727.18481-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
          If both the HTTP and HTTPS versions
          return 200 OK and serve the same content:
            Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See https://lkml.org/lkml/2020/6/26/837

 drivers/rtc/rtc-ab-b5ze-s3.c | 2 +-
 drivers/rtc/rtc-bq32k.c      | 2 +-
 drivers/rtc/rtc-mcp795.c     | 2 +-
 drivers/rtc/rtc-pcf85063.c   | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 811fe2005488..2370ac0cdb5f 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -7,7 +7,7 @@
  *
  * Detailed datasheet of the chip is available here:
  *
- *  http://www.abracon.com/realtimeclock/AB-RTCMC-32.768kHz-B5ZE-S3-Application-Manual.pdf
+ *  https://www.abracon.com/realtimeclock/AB-RTCMC-32.768kHz-B5ZE-S3-Application-Manual.pdf
  *
  * This work is based on ISL12057 driver (drivers/rtc/rtc-isl12057.c).
  *
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 4a63f0cd2321..933e4237237d 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2014 Pavel Machek <pavel@denx.de>
  *
  * You can get hardware description at
- * http://www.ti.com/lit/ds/symlink/bq32000.pdf
+ * https://www.ti.com/lit/ds/symlink/bq32000.pdf
  */
 
 #include <linux/module.h>
diff --git a/drivers/rtc/rtc-mcp795.c b/drivers/rtc/rtc-mcp795.c
index 1660d5e79582..21cbf7f892e8 100644
--- a/drivers/rtc/rtc-mcp795.c
+++ b/drivers/rtc/rtc-mcp795.c
@@ -7,7 +7,7 @@
  * based on other Linux RTC drivers
  *
  * Device datasheet:
- * http://ww1.microchip.com/downloads/en/DeviceDoc/22280A.pdf
+ * https://ww1.microchip.com/downloads/en/DeviceDoc/22280A.pdf
  */
 
 #include <linux/module.h>
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 7a87f461bec8..ca55ba975aeb 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -21,8 +21,8 @@
 /*
  * Information for this driver was pulled from the following datasheets.
  *
- *  http://www.nxp.com/documents/data_sheet/PCF85063A.pdf
- *  http://www.nxp.com/documents/data_sheet/PCF85063TP.pdf
+ *  https://www.nxp.com/documents/data_sheet/PCF85063A.pdf
+ *  https://www.nxp.com/documents/data_sheet/PCF85063TP.pdf
  *
  *  PCF85063A -- Rev. 6 — 18 November 2015
  *  PCF85063TP -- Rev. 4 — 6 May 2015
-- 
2.27.0

