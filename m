Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6B4CE416
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfJGNrc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:47:32 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41629 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfJGNrb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:47:31 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E80C5200002;
        Mon,  7 Oct 2019 13:47:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 02/10] rtc: ds1347: remove verbose messages
Date:   Mon,  7 Oct 2019 15:47:16 +0200
Message-Id: <20191007134724.15505-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
References: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Printing debugging (and opaque) information is not useful and only clutters
the boot log. Remove those messages.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1347.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index d392a7bfdd1c..ab5533c7f99d 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -141,13 +141,6 @@ static int ds1347_probe(struct spi_device *spi)
 	data = data & 0x1B;
 	regmap_write(map, DS1347_STATUS_REG, data);
 
-	/* display the settings */
-	regmap_read(map, DS1347_CONTROL_REG, &data);
-	dev_info(&spi->dev, "DS1347 RTC CTRL Reg = 0x%02x\n", data);
-
-	regmap_read(map, DS1347_STATUS_REG, &data);
-	dev_info(&spi->dev, "DS1347 RTC Status Reg = 0x%02x\n", data);
-
 	rtc = devm_rtc_device_register(&spi->dev, "ds1347",
 				&ds1347_rtc_ops, THIS_MODULE);
 
-- 
2.21.0

