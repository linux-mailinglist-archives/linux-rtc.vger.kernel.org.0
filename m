Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A0E4D952
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 20:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfFTSen (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 14:34:43 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43221 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfFTSem (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 14:34:42 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C57E51BF205;
        Thu, 20 Jun 2019 18:34:39 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Dylan Howey <Dylan.Howey@tennantco.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/4] rtc: pcf2123: convert to SPDX identifier
Date:   Thu, 20 Jun 2019 20:34:32 +0200
Message-Id: <20190620183433.30779-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
References: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index d263c8bab62a..f31feffed2d2 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * An SPI driver for the Philips PCF2123 RTC
  * Copyright 2009 Cyber Switching, Inc.
@@ -10,10 +11,6 @@
  * Thanks to Christian Pellegrin <chripell@fsfe.org> for
  * the sysfs contributions to this driver.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Please note that the CS is active high, so platform data
  * should look something like:
  *
-- 
2.21.0

