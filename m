Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C253632D4
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Apr 2021 02:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbhDRAUz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Apr 2021 20:20:55 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35557 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhDRAUy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Apr 2021 20:20:54 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 44F50E0006;
        Sun, 18 Apr 2021 00:20:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: pcf8523: remove useless define
Date:   Sun, 18 Apr 2021 02:20:21 +0200
Message-Id: <20210418002023.1000265-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Drop DRIVER_NAME as it is only used once

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 5e1e7b2a8c9a..fe3ab41d8326 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -9,8 +9,6 @@
 #include <linux/rtc.h>
 #include <linux/of.h>
 
-#define DRIVER_NAME "rtc-pcf8523"
-
 #define REG_CONTROL1 0x00
 #define REG_CONTROL1_CAP_SEL BIT(7)
 #define REG_CONTROL1_STOP    BIT(5)
@@ -373,7 +371,7 @@ MODULE_DEVICE_TABLE(of, pcf8523_of_match);
 
 static struct i2c_driver pcf8523_driver = {
 	.driver = {
-		.name = DRIVER_NAME,
+		.name = "rtc-pcf8523",
 		.of_match_table = of_match_ptr(pcf8523_of_match),
 	},
 	.probe = pcf8523_probe,
-- 
2.30.2

