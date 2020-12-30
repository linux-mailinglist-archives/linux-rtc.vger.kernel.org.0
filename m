Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040762E7A26
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Dec 2020 16:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgL3PAX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 30 Dec 2020 10:00:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:39992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgL3PAX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 30 Dec 2020 10:00:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45FC321973;
        Wed, 30 Dec 2020 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609340382;
        bh=8Tm4+r/3ULTX6/AYNnKQLnmE6Ug4OE8sLY/1YXNk9Fo=;
        h=From:To:Cc:Subject:Date:From;
        b=r1eaIpye85I9oYl9j4jcg5w1PG2Pq5vaLmQWyP76febiteJEr/N8UDXZk42xQlk0/
         fba+VfZ07fQQdPLuupJeCkuguA7LfpXzunIsozVhemt2GhrbIn8QR5KSVc1fYx+PnV
         irZCc1VTA8kTGfFSWh3eydpVCb4hXuInETjWvUCDOLksW6kGYVT5t4yleJDwH9HmyG
         OBjueBpEAHnlAkCoV7IUU+27u+omtHzDIdjrrzXIW5XT9OsOoKMmAFFYDhkpKZKsX5
         LZJQPTbgA7X8M7WmK7P9mgzR6xI0bFzKjrUEZrVXZTDpftLVMYGC0V7TwcobKI/wnd
         hmbbGRElHGLZw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Henning Schild <henning.schild@siemens.com>,
        Claudius Heine <ch@denx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: rx6110: fix build against modular I2C
Date:   Wed, 30 Dec 2020 15:59:11 +0100
Message-Id: <20201230145938.3254459-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

With CONFIG_I2C=m, the #ifdef section is disabled, as shown
by this warning:

drivers/rtc/rtc-rx6110.c:314:12: error: unused function 'rx6110_probe' [-Werror,-Wunused-function]

Change the driver to use IS_ENABLED() instead, which works
for both module and built-in subsystems.

Fixes: afa819c2c6bf ("rtc: rx6110: add i2c support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/rtc-rx6110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index a7b671a21022..79161d4c6ce4 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -331,7 +331,7 @@ static int rx6110_probe(struct rx6110_data *rx6110, struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_SPI_MASTER
+#if IS_ENABLED(CONFIG_SPI_MASTER)
 static struct regmap_config regmap_spi_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -411,7 +411,7 @@ static void rx6110_spi_unregister(void)
 }
 #endif /* CONFIG_SPI_MASTER */
 
-#ifdef CONFIG_I2C
+#if IS_ENABLED(CONFIG_I2C)
 static struct regmap_config regmap_i2c_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-- 
2.29.2

