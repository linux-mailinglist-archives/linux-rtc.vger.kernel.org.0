Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182C51C61C3
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2020 22:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgEEUOC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 16:14:02 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40763 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEEUOC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 16:14:02 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B9075FF806;
        Tue,  5 May 2020 20:13:59 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        =?UTF-8?q?Per=20N=C3=B8rgaard=20Christensen?= 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/5] rtc: pcf2127: set regmap max_register
Date:   Tue,  5 May 2020 22:13:09 +0200
Message-Id: <20200505201310.255145-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
References: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set regmap max_register to ease debugging and enforce the register range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 5ac996578523..039078029bd4 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -634,6 +634,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 	static const struct regmap_config config = {
 		.reg_bits = 8,
 		.val_bits = 8,
+		.max_register = 0x1d,
 	};
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -701,6 +702,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		.val_bits = 8,
 		.read_flag_mask = 0xa0,
 		.write_flag_mask = 0x20,
+		.max_register = 0x1d,
 	};
 	struct regmap *regmap;
 
-- 
2.26.2

