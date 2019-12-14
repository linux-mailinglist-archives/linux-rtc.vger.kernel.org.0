Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36BCE11F4AE
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfLNWKn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:43 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59967 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLNWKd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:33 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5BE20FF804;
        Sat, 14 Dec 2019 22:10:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 15/16] rtc: rv3029: annotate init and exit functions
Date:   Sat, 14 Dec 2019 23:10:21 +0100
Message-Id: <20191214221022.622482-16-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv3029c2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index b8d501abf2a7..5610ff562652 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -797,24 +797,24 @@ static struct i2c_driver rv3029_driver = {
 	.id_table	= rv3029_id,
 };
 
-static int rv3029_register_driver(void)
+static int __init rv3029_register_driver(void)
 {
 	return i2c_add_driver(&rv3029_driver);
 }
 
-static void rv3029_unregister_driver(void)
+static void __exit rv3029_unregister_driver(void)
 {
 	i2c_del_driver(&rv3029_driver);
 }
 
 #else
 
-static int rv3029_register_driver(void)
+static int __init rv3029_register_driver(void)
 {
 	return 0;
 }
 
-static void rv3029_unregister_driver(void)
+static void __exit rv3029_unregister_driver(void)
 {
 }
 
@@ -840,24 +840,24 @@ static struct spi_driver rv3049_driver = {
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

