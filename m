Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C4E11F4C0
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfLNWLU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:11:20 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:47317 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfLNWK2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:28 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A21881C0003;
        Sat, 14 Dec 2019 22:10:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 01/16] rtc: rv3029: use proper name for the driver
Date:   Sat, 14 Dec 2019 23:10:07 +0100
Message-Id: <20191214221022.622482-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The correct name for the rtc is rv3029. c2 is actually the package form
factor rv3029c3 exists and simply has a smaller form factor.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 90a004c6398e..e68329eb5af2 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -879,7 +879,7 @@ MODULE_DEVICE_TABLE(of, rv3029_of_match);
 
 static struct i2c_driver rv3029_driver = {
 	.driver = {
-		.name = "rtc-rv3029c2",
+		.name = "rv3029",
 		.of_match_table = of_match_ptr(rv3029_of_match),
 	},
 	.probe		= rv3029_i2c_probe,
-- 
2.23.0

