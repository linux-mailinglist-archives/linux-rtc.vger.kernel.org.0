Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9D704BD
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 17:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfGVP6c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 11:58:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39978 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfGVP6c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 11:58:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so39978006wrl.7
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jul 2019 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlMZCbBogiBe8CKEsdLTZ6VIoSAztcxYCfvT3Oi//4g=;
        b=qv8CdKmN3b4cumLSC6TscZwzBsOMvdxcMniYlj5uVgu9wxmvhkdUWo+mYUAuCDL8QI
         YUPCtxr/BPFwMxbwGM0aI/2/s7Tv3fLwS7iBVcYREM/QDZC9uZ7Gn8eiWBEkw8DoiEDJ
         CxlZjZjXhAnlvCdJaDTU97NLZmYmApcWtmxWmW7BVxrS7kImuDpHHkRVbl6qYvtir0Ir
         m0UdhytPz8mOdxDUiJ+yhc89nv+NU0OpSVUDuwxx9Osh6+KTK/fsbwl0lY8L7RoTHPAC
         NC7sQjav0tLb47KkBP52/p/x46xrqKH+ZLQ7Q/Z6KK7CkbJ0sccqgdY72yVQPk+fCbod
         xT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlMZCbBogiBe8CKEsdLTZ6VIoSAztcxYCfvT3Oi//4g=;
        b=k9Hxzp62/MFyvxGmI7vbVy/S9zgQ1AXMKPKgwFXCqCRjxs8zVgdJ2qIps9bhPN4CvW
         isvdthSrLy2ajESF33smDT/oajU4Ibdn3rNlwVBVonJx0Y8S3RBimOC/dNA9jzE64YrV
         W9g4A9ycYuktfuIpKxq38ptYyq+Y4h/64zAWIwc9V+9NiOmsv5PL4eWPyd/NIrn5FxzD
         hlQAPr/Nd3GtsdkIoHqyjcv/C5vXaxMJpfBXM/BPL9Wp58z7zqASPxh91zzG4enxnO6b
         f7pWjeuNyQzr8SJXfKwVCwGKB7MY33E5kxTsyUl8QuOqjEkLkr3QAyes0PpyMdvMjTe2
         Kh2w==
X-Gm-Message-State: APjAAAVrXCFa+5Taed6yxw1/XGzd6Ng9HrcyLz1UwOW5hqtNOXtRIq66
        V+/D3CDhNTEpla6vbto7Ojzb/6+vD1M=
X-Google-Smtp-Source: APXvYqwqKqMPZioO2YWuRIXBaRxHcYrj/CReN8Jct+n/18HB6eCleintzAVMt654oNu1amVsqfWT5w==
X-Received: by 2002:adf:f646:: with SMTP id x6mr80148245wrp.18.1563811109170;
        Mon, 22 Jul 2019 08:58:29 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id 91sm84840716wrp.3.2019.07.22.08.58.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:58:28 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bruno.thomsen@gmail.com, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: [PATCH 2/4] rtc: pcf2127: cleanup register and bit defines
Date:   Mon, 22 Jul 2019 17:58:09 +0200
Message-Id: <20190722155811.11980-3-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722155811.11980-1-bruno.thomsen@gmail.com>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Cleanup defines before adding new features to driver.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 59 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 58eb96506e4b..cd8def79b379 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -19,26 +19,32 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 
-#define PCF2127_REG_CTRL1       (0x00)  /* Control Register 1 */
-#define PCF2127_REG_CTRL2       (0x01)  /* Control Register 2 */
-
-#define PCF2127_REG_CTRL3       (0x02)  /* Control Register 3 */
-#define PCF2127_REG_CTRL3_BLF		BIT(2)
-
-#define PCF2127_REG_SC          (0x03)  /* datetime */
-#define PCF2127_REG_MN          (0x04)
-#define PCF2127_REG_HR          (0x05)
-#define PCF2127_REG_DM          (0x06)
-#define PCF2127_REG_DW          (0x07)
-#define PCF2127_REG_MO          (0x08)
-#define PCF2127_REG_YR          (0x09)
-
-/* the pcf2127 has 512 bytes nvmem, pcf2129 doesn't */
-#define PCF2127_REG_RAM_addr_MSB       0x1a
-#define PCF2127_REG_RAM_wrt_cmd        0x1c
-#define PCF2127_REG_RAM_rd_cmd         0x1d
+/* Control register 1 */
+#define PCF2127_REG_CTRL1		0x00
+/* Control register 2 */
+#define PCF2127_REG_CTRL2		0x01
+/* Control register 3 */
+#define PCF2127_REG_CTRL3		0x02
+#define PCF2127_BIT_CTRL3_BLF			BIT(2)
+/* Time and date registers */
+#define PCF2127_REG_SC			0x03
+#define PCF2127_BIT_SC_OSF			BIT(7)
+#define PCF2127_REG_MN			0x04
+#define PCF2127_REG_HR			0x05
+#define PCF2127_REG_DM			0x06
+#define PCF2127_REG_DW			0x07
+#define PCF2127_REG_MO			0x08
+#define PCF2127_REG_YR			0x09
+/*
+ * RAM registers
+ * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
+ * battery backed and can survive a power outage.
+ * PCF2129 doesn't have this feature.
+ */
+#define PCF2127_REG_RAM_ADDR_MSB	0x1A
+#define PCF2127_REG_RAM_WRT_CMD		0x1C
+#define PCF2127_REG_RAM_RD_CMD		0x1D
 
-#define PCF2127_OSF             BIT(7)  /* Oscillator Fail flag */
 
 struct pcf2127 {
 	struct rtc_device *rtc;
@@ -73,11 +79,12 @@ static int pcf2127_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return ret;
 	}
 
-	if (buf[PCF2127_REG_CTRL3] & PCF2127_REG_CTRL3_BLF)
+	if (buf[PCF2127_REG_CTRL3] & PCF2127_BIT_CTRL3_BLF)
 		dev_info(dev,
 			"low voltage detected, check/replace RTC battery.\n");
 
-	if (buf[PCF2127_REG_SC] & PCF2127_OSF) {
+	/* Clock integrity is not guaranteed when OSF flag is set. */
+	if (buf[PCF2127_REG_SC] & PCF2127_BIT_SC_OSF) {
 		/*
 		 * no need clear the flag here,
 		 * it will be cleared once the new date is saved
@@ -166,7 +173,7 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 		if (ret)
 			return ret;
 
-		touser = touser & PCF2127_REG_CTRL3_BLF ? 1 : 0;
+		touser = touser & PCF2127_BIT_CTRL3_BLF ? 1 : 0;
 
 		if (copy_to_user((void __user *)arg, &touser, sizeof(int)))
 			return -EFAULT;
@@ -192,12 +199,12 @@ static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 	int ret;
 	unsigned char offsetbuf[] = { offset >> 8, offset };
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_addr_MSB,
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_ADDR_MSB,
 				offsetbuf, 2);
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_rd_cmd,
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
 			       val, bytes);
 
 	return ret ?: bytes;
@@ -210,12 +217,12 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	int ret;
 	unsigned char offsetbuf[] = { offset >> 8, offset };
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_addr_MSB,
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_ADDR_MSB,
 				offsetbuf, 2);
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_wrt_cmd,
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
 				val, bytes);
 
 	return ret ?: bytes;
-- 
2.21.0

