Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27458CE421
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfJGNrv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:47:51 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:37187 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbfJGNrg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:47:36 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5A7F41C0007;
        Mon,  7 Oct 2019 13:47:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 09/10] rtc: ds1347: use regmap_update_bits
Date:   Mon,  7 Oct 2019 15:47:23 +0200
Message-Id: <20191007134724.15505-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
References: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use regmap_update_bits instead of open coding. Also add proper error
handling.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1347.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index eeaf43586bce..a49ce9991916 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -29,6 +29,8 @@
 #define DS1347_STATUS_REG	0x17
 #define DS1347_CLOCK_BURST	0x3F
 
+#define DS1347_WP_BIT		BIT(7)
+
 #define DS1347_NEOSC_BIT	BIT(7)
 #define DS1347_OSF_BIT		BIT(2)
 
@@ -117,7 +119,7 @@ static int ds1347_probe(struct spi_device *spi)
 	struct rtc_device *rtc;
 	struct regmap_config config;
 	struct regmap *map;
-	unsigned int data;
+	int err;
 
 	memset(&config, 0, sizeof(config));
 	config.reg_bits = 8;
@@ -141,9 +143,9 @@ static int ds1347_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, map);
 
 	/* Disable the write protect of rtc */
-	regmap_read(map, DS1347_CONTROL_REG, &data);
-	data = data & ~(1<<7);
-	regmap_write(map, DS1347_CONTROL_REG, data);
+	err = regmap_update_bits(map, DS1347_CONTROL_REG, DS1347_WP_BIT, 0);
+	if (err)
+		return err;
 
 	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
-- 
2.21.0

