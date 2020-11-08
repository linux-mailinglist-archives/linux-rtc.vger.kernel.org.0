Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F8F2AADE1
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Nov 2020 23:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgKHWhm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Nov 2020 17:37:42 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43231 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHWhm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Nov 2020 17:37:42 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F386D1C0002;
        Sun,  8 Nov 2020 22:37:39 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: rv3032: fix nvram nvmem priv pointer
Date:   Sun,  8 Nov 2020 23:37:10 +0100
Message-Id: <20201108223710.1574331-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The nvmem priv pointer is set to rv3032 but the rv3032_nvram_write and
rv3032_nvram_read expect the regmap pointer.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 3e67f71f4261..14e931d6f9c6 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -889,7 +889,7 @@ static int rv3032_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	nvmem_cfg.priv = rv3032;
+	nvmem_cfg.priv = rv3032->regmap;
 	rtc_nvmem_register(rv3032->rtc, &nvmem_cfg);
 	eeprom_cfg.priv = rv3032;
 	rtc_nvmem_register(rv3032->rtc, &eeprom_cfg);
-- 
2.28.0

