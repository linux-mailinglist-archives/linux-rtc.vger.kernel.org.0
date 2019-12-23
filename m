Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE02B129413
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfLWKOi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:14:38 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50263 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbfLWKOi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:14:38 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 38ADD240003;
        Mon, 23 Dec 2019 10:14:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] rtc: rv3029: annotate init and exit functions
Date:   Mon, 23 Dec 2019 11:14:30 +0100
Message-Id: <20191223101430.1091572-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv30{2,4}9_register_driver and rv30{2,4}9_unregister_driver are only called
from the init and exit functions of the module. Annotate them properly.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 220ea91bf86a..62718231731b 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -823,7 +823,7 @@ static struct i2c_driver rv3029_driver = {
 	.id_table	= rv3029_id,
 };
 
-static int rv3029_register_driver(void)
+static int __init rv3029_register_driver(void)
 {
 	return i2c_add_driver(&rv3029_driver);
 }
@@ -835,7 +835,7 @@ static void rv3029_unregister_driver(void)
 
 #else
 
-static int rv3029_register_driver(void)
+static int __init rv3029_register_driver(void)
 {
 	return 0;
 }
@@ -866,24 +866,24 @@ static struct spi_driver rv3049_driver = {
 	.probe   = rv3049_probe,
 };
 
-static int rv3049_register_driver(void)
+static int __init rv3049_register_driver(void)
 {
 	return spi_register_driver(&rv3049_driver);
 }
 
-static void rv3049_unregister_driver(void)
+static void __exit rv3049_unregister_driver(void)
 {
 	spi_unregister_driver(&rv3049_driver);
 }
 
 #else
 
-static int rv3049_register_driver(void)
+static int __init rv3049_register_driver(void)
 {
 	return 0;
 }
 
-static void rv3049_unregister_driver(void)
+static void __exit rv3049_unregister_driver(void)
 {
 }
 
-- 
2.23.0

