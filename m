Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DEA43230A
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhJRPjN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:39:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37651 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhJRPjM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:39:12 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id EB9D7240010;
        Mon, 18 Oct 2021 15:36:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] rtc: pcf8523: allow usage on ACPI platforms
Date:   Mon, 18 Oct 2021 17:36:49 +0200
Message-Id: <20211018153651.82069-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
References: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Always provide an OF table to ensure ACPI platforms can also use this
driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 79a571db803b..181c3425d6c7 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -389,19 +389,17 @@ static const struct i2c_device_id pcf8523_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pcf8523_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id pcf8523_of_match[] = {
 	{ .compatible = "nxp,pcf8523" },
 	{ .compatible = "microcrystal,rv8523" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf8523_of_match);
-#endif
 
 static struct i2c_driver pcf8523_driver = {
 	.driver = {
 		.name = "rtc-pcf8523",
-		.of_match_table = of_match_ptr(pcf8523_of_match),
+		.of_match_table = pcf8523_of_match,
 	},
 	.probe = pcf8523_probe,
 	.id_table = pcf8523_id,
-- 
2.31.1

