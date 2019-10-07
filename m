Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C3ACE424
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfJGNre (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:47:34 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:35535 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbfJGNre (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:47:34 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 651DF240019;
        Mon,  7 Oct 2019 13:47:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 06/10] rtc: ds1347: convert to devm_rtc_allocate_device
Date:   Mon,  7 Oct 2019 15:47:20 +0200
Message-Id: <20191007134724.15505-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
References: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1347.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index 763eb60e5e8f..75c522c8ab26 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -129,13 +129,13 @@ static int ds1347_probe(struct spi_device *spi)
 	data = data & 0x1B;
 	regmap_write(map, DS1347_STATUS_REG, data);
 
-	rtc = devm_rtc_device_register(&spi->dev, "ds1347",
-				&ds1347_rtc_ops, THIS_MODULE);
-
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
-	return 0;
+	rtc->ops = &ds1347_rtc_ops;
+
+	return rtc_register_device(rtc);
 }
 
 static struct spi_driver ds1347_driver = {
-- 
2.21.0

