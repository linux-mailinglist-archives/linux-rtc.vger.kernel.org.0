Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71FCD8BD3D
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 17:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbfHMPgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 11:36:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38112 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfHMPgV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 11:36:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id m125so1847255wmm.3;
        Tue, 13 Aug 2019 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1yJ4ftAjCov31C2AvIIal4auvs/ATcW3oCboKgN7svY=;
        b=h48NKyr3OtkI0cZqjtqor4Rsov5DNwovosH2Czaj/Z1GlqjKUTyxvsaaj1WBkr6B4x
         7YCs3yi1xn9riGZK4IffSRcqz3Kyr1ubm85w3SttuQ9EHHJtRYG1CTgvCVZVzeRHRLJN
         ih47K0pVVz5Gei+1rf7UQwrS4sN5idj85VNMPIAmNpAWmK0fP2FS3+rz5bA2ZYLsEYas
         xWwYexoZ9MMqal9t6weIcq5SGNjTFgnptgkXuy9HhOkpyij4Td3anazsjp+mHmRBqL51
         D74NcfEp+TfoGOb8vryMNSBtUa+mVN053vIrjjhOC8XopFvs9me2kjvQs+D5gRmITalO
         LRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1yJ4ftAjCov31C2AvIIal4auvs/ATcW3oCboKgN7svY=;
        b=d+ygAvL0/NNVXQZz1r+6ahDAkc6C0BccnO2VX1VB2bKEQ26CGH/LWv1F9ynvSd+bmz
         C6BiTWcJSKix9gcBuHrZ9JMBqGgGczcOKZH2d6vbYUOTn5phHm0eb4bwYuG3G9oNShlW
         hvOiptbl4nx8rz7TxbkvA45JEPSsHReX7iVvBjupbo6kLAypBTMhGiqojfQleWTGp6u+
         7a6Ho2QMJ0EjdS3igjSh0QD79k1Upw9WwY68Z8imlCw51G8RjMM1mkTcd2gLF5NGC4BI
         1PqBvPtfvxyEKRDjPrX3G3WpkLtiZUePIFpZ4Bc46miMbi9JW5/FJPlrMOqIbZHye9/j
         XGDw==
X-Gm-Message-State: APjAAAW19/oMT51w4PiIA35/ix0Vq2yNGg7/SzJ6kHnyJNFOKO+xTuRD
        uh1XZhS5lm7qKbNcfUMXBLMAdwryomG/Lw==
X-Google-Smtp-Source: APXvYqyjp9RWWkDCnvs8FkHAQKTNt1lH1twQodclh8Evns3iBpSeybw4/C3Z9S1Amr7S5N1YbiAXNg==
X-Received: by 2002:a1c:7611:: with SMTP id r17mr3763035wmc.117.1565710577912;
        Tue, 13 Aug 2019 08:36:17 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id j16sm64744819wrp.62.2019.08.13.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:36:17 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, sean.nyekjaer@prevas.dk,
        bth@kamstrup.com, bruno.thomsen@gmail.com
Subject: [PATCH v2 2/5] rtc: pcf2127: cleanup register and bit defines
Date:   Tue, 13 Aug 2019 17:35:57 +0200
Message-Id: <20190813153600.12406-3-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813153600.12406-1-bruno.thomsen@gmail.com>
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Cleanup of defines to follow kernel coding style and increase code
readability by using same register and bit define style.

Change PCF2127_REG_RAM_{addr_MSB,wrt_cmd,rd_cmd} to upper case as
kernel coding guide section 12 'Macros, Enums and RTL' states
"Names of macros defining constants and labels in enums are capitalized".

Improve readability of RAM register comment by making whole sentences.

Remove parentheses from register defines as they are only used
for expressions and not constants.

As there are no clear style for name of registers and bits in the
kernel drivers, I suggest the following for at least this driver,
but hopefully also other RTC drivers.

Register name should follow this convention:
[chip]_REG_[reg name] 0xXX

Bit name should follow this convention, so it clearly states which
chip register it's part of:
[chip]_BIT_[reg name]_[bit name] BIT(X)

Additionally I suggest bit defines are always placed right below
its corresponding register define and using an extra tab indentation
for the BIT(X) part. This will visualt make it easy to see that bit
defines are part of the complete register definition.

Rename PCF2127_OSF to PCF2127_BIT_SC_OSF and move it right below
PCF2127_REG_SC. This will improve readability of bit checks as it's
easy to verify that it uses the correct register.

Move end of line comments above register defines as it's more like
a heading for 1 register define and up to 8 bit defines or a
collection of registers that are close related like timestamp
split across 6 registers.

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

