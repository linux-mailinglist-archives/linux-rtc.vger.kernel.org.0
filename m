Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76B4444498
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Nov 2021 16:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhKCPZi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Nov 2021 11:25:38 -0400
Received: from smtp1.axis.com ([195.60.68.17]:7938 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231860AbhKCPZg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 3 Nov 2021 11:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635952980;
  x=1667488980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XflhCzonUdUv001fHgBVkA3+LzsDro0La3NZCHLyQtE=;
  b=PlqxAbb+56Uk17jqizDJrmvXLvCkiVCy9v1N/fUZfXHbWoJDjSDHR2s+
   Wj5XDwkUwdaR5M/4W73p5gkO5VrKga8wlEbx44FiEcRqioilDyHCoEtTw
   q55Svfo4MFPpuxnS+DFI1KnqpMHEaB3eR8t2KdZCGnB1qnMumkINRYN0f
   nPff+jn6rr5gV8o+BQFaB19DWmYrMJYyF4XmOQhD6MSpGQjpROWzXF5E7
   eVVkZRdGpTNF1xHVmLrgIykkuXdcp7FSwr7IlG64FLbSAzsjffjZa45uW
   Hum6pL766tD4YjuEQL0xXv6WCgOiPg8CvzrU+g+LdhUVJUrJnYwGS150E
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] rtc: pcf8523: fix alarm interrupt disabling
Date:   Wed, 3 Nov 2021 16:22:52 +0100
Message-ID: <20211103152253.22844-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the driver to actually disable the IRQ and not overwrite other bits
in the CONTROL_1 register when it is asked to disable the alarm
interrupt.

Compile-tested only.

Fixes: 13e37b7fb75dfaeb4 ("rtc: pcf8523: add alarm support")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/rtc/rtc-pcf8523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 8b6fb20774bf..e26477267451 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -347,7 +347,7 @@ static int pcf8523_irq_enable(struct device *dev, unsigned int enabled)
 	if (err < 0)
 		return err;
 
-	value &= PCF8523_CONTROL1_AIE;
+	value &= ~PCF8523_CONTROL1_AIE;
 
 	if (enabled)
 		value |= PCF8523_CONTROL1_AIE;
-- 
2.28.0

