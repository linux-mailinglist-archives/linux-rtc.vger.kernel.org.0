Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400D111F4AA
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfLNWKm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:42 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:54179 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfLNWKe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:34 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id C66A7100009;
        Sat, 14 Dec 2019 22:10:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 16/16] rtc: rv3029: add nvram support
Date:   Sat, 14 Dec 2019 23:10:22 +0100
Message-Id: <20191214221022.622482-17-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Export the 8 byte RAM using nvmem.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 5610ff562652..4eda0db72b66 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -109,10 +109,8 @@
 #define RV3029_CONTROL_E2P_TOV_MASK	0x3F /* XTAL turnover temp mask */
 
 /* user ram section */
-#define RV3029_USR1_RAM_PAGE		0x38
-#define RV3029_USR1_SECTION_LEN		0x04
-#define RV3029_USR2_RAM_PAGE		0x3C
-#define RV3029_USR2_SECTION_LEN		0x04
+#define RV3029_RAM_PAGE			0x38
+#define RV3029_RAM_SECTION_LEN		8
 
 struct rv3029_data {
 	struct device		*dev;
@@ -474,6 +472,18 @@ static int rv3029_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
+static int rv3029_nvram_write(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	return regmap_bulk_write(priv, RV3029_RAM_PAGE + offset, val, bytes);
+}
+
+static int rv3029_nvram_read(void *priv, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	return regmap_bulk_read(priv, RV3029_RAM_PAGE + offset, val, bytes);
+}
+
 static const struct rv3029_trickle_tab_elem {
 	u32 r;		/* resistance in ohms */
 	u8 conf;	/* trickle config bits */
@@ -694,6 +704,15 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 			const char *name)
 {
 	struct rv3029_data *rv3029;
+	struct nvmem_config nvmem_cfg = {
+		.name = "rv3029_nvram",
+		.word_size = 1,
+		.stride = 1,
+		.size = RV3029_RAM_SECTION_LEN,
+		.type = NVMEM_TYPE_BATTERY_BACKED,
+		.reg_read = rv3029_nvram_read,
+		.reg_write = rv3029_nvram_write,
+	};
 	int rc = 0;
 
 	rv3029 = devm_kzalloc(dev, sizeof(*rv3029), GFP_KERNEL);
@@ -731,7 +750,14 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 	rv3029->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv3029->rtc->range_max = RTC_TIMESTAMP_END_2079;
 
-	return rtc_register_device(rv3029->rtc);
+	rc = rtc_register_device(rv3029->rtc);
+	if (rc)
+		return rc;
+
+	nvmem_cfg.priv = rv3029->regmap;
+	rtc_nvmem_register(rv3029->rtc, &nvmem_cfg);
+
+	return 0;
 }
 
 static const struct regmap_range rv3029_holes_range[] = {
-- 
2.23.0

