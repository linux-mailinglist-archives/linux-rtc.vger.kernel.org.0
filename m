Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6221A2CFFAD
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 00:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgLEXPd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 5 Dec 2020 18:15:33 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38935 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgLEXPd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 5 Dec 2020 18:15:33 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3D7DCFF802;
        Sat,  5 Dec 2020 23:14:51 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: fix RTC removal
Date:   Sun,  6 Dec 2020 00:14:48 +0100
Message-Id: <20201205231449.610980-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since the rtc_register_device, removing an RTC device will end with a
refcount_t: underflow; use-after-free warning since put_device is called
twice in the device tear down path.

Fixes: fdcfd854333b ("rtc: rework rtc_register_device() resource management")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e6b44b7c4ad3..5c6748dfa55d 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -335,7 +335,6 @@ static void devm_rtc_unregister_device(void *data)
 	cdev_device_del(&rtc->char_dev, &rtc->dev);
 	rtc->ops = NULL;
 	mutex_unlock(&rtc->ops_lock);
-	put_device(&rtc->dev);
 }
 
 static void devm_rtc_release_device(void *res)
-- 
2.28.0

