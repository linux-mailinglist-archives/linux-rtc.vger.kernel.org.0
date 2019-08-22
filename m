Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38056994C0
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbfHVNTx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:19:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41516 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732317AbfHVNTx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:19:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so5401505wrr.8;
        Thu, 22 Aug 2019 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+0GMcqTHAEC+PuCJzygw3HvGYKmBoMy49VZ9nky2OE=;
        b=R/dOtmqZ0cEogDXNW5NFt+5Ea5bFYFZNpKYgQuNBheXezcy6KkdHF09bbUXxnIP69O
         9BQnD6yh5xokO5yEGlD/cA5MoNhNR+nEls3uW8wwKLoGAZScUGEVSGmFXDUmupHY4v/S
         lF+hhUFJuvuAiDcH2Y1nTFjnK8aY/4bcWhgmLxAW7f24ddUev/7K6FXykvU5PhrmFKYI
         A1Ut25Mij0SNumgAVeKp71pzf7XiFYAtqgzrxMbZ6mWW6Cv8iJHFYiDLjAqIRY2quvw9
         GKZyHHsQcF4ehDYRs1SJhqpZai3j6snvBIHPmQWSwb+498dirczKvsVGQd/EVQpVhIWn
         5NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+0GMcqTHAEC+PuCJzygw3HvGYKmBoMy49VZ9nky2OE=;
        b=SG+QRsAfGOlJsOu8p0oa3QEZxhr3Hw24t3OCgqOjzSK6ucdTkTgiL1ua3i2s/y48NI
         oR86867zDHbis/BIorUwBLAGEfz7+YbfUqEelcJP50BDdPrePzGQaulrDvZZ8FJsOfWF
         cudn0IdW1AV4roOqbJ6BuuQYrJwOQ+xcujFd/yYltZ8ajAGYAsuZT9N8cOyopS5wH6tv
         nxcBT6q09VMv9DXz/5FFkU8gH+kSqzBckTfoBoFChMxaY0ZR/ji0ypFJXqnSv0eYjL7w
         cwsYQcHIWII+iw6x6EghXICpnlCl1Ifjsdj+GSYqoRbYjq4tUiNvp03B2Ah4UlKqdr6K
         tXOQ==
X-Gm-Message-State: APjAAAU7UeuZPVu67vJwKzYYbODMWvZ/vyfjRBOg77NV2y7JPoMrAQmS
        KuwlC8VUsI5BoNPoCP5rhvtGqQoRsICdJQ==
X-Google-Smtp-Source: APXvYqw2wCLyD+oOzRy7pfTTINejF54Dl9dtIHNp4PWG43M68gjz9s49AxEVRrAgKwkrA7Dj34OzLQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr45331963wrr.194.1566479990431;
        Thu, 22 Aug 2019 06:19:50 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id d19sm34644045wrb.7.2019.08.22.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:19:49 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        bruno.thomsen@gmail.com
Subject: [PATCH v3 2/5] rtc: pcf2127: cleanup register and bit defines
Date:   Thu, 22 Aug 2019 15:19:33 +0200
Message-Id: <20190822131936.18772-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822131936.18772-1-bruno.thomsen@gmail.com>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
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
v3: no change.
v2: updated commit message.

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

