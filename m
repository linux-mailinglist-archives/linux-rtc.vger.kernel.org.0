Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743548BD3F
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 17:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbfHMPgW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 11:36:22 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53753 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfHMPgW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 11:36:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so1931004wmp.3;
        Tue, 13 Aug 2019 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PfJght1t4wRVtt6zBPMGaeEsIVMsuY2LkXUxfSL3G0c=;
        b=c2l2CXJx0VRZ5Li/09osRG8P/CznNctd5JvvKoPk/OsA/x3NQh+itIuEGx+Byk+ov0
         9M24Kd0ch9J2EaO3qva1lbft4eSn3z2cfHg/bKjTHt2A4tuMaI7uZ/SZpISr0PLlY3sD
         S8nVBg8alAzfh7yvXd5fWyWFcyjLdR48T+RVoh3LVJuFfifTFbYrBbNbxO5f3N0oCd9I
         1rwJZAnpr8AIvd+Ss8tej+uJu6TFHdlK/qhTU+Pbr8mOLfY2pzVzpXwgXUdCLdGFZSFx
         TVMMSSkNPmeJAPA215BvJjLa7aZOlAd33RuezVQ+sHjx1Hs6U4bURLgiOUMzDez2OfY+
         sZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PfJght1t4wRVtt6zBPMGaeEsIVMsuY2LkXUxfSL3G0c=;
        b=JkjKGDxfiKycS88WqnM1YoKbefgsM8r50oaMFt6R6Kg4d/pJH9Y+4zvgfhg4H8/ufb
         2aW7ikjek4eI5Vsi9BWH75O6ifvOx1HDiMSZAooJPUlqu9NmJGUsvW7bMbk4Q+85mLdb
         LxKH1FXkli6FA4UQdANcYjehQ8AvUipmlOgH89ErFkfxWglS4BFFnIuitwAi7zNIhRXl
         aDYlXbdp5UxOQCq/hIdp3pS2B2GG9EfRjLZLDoYzXxdp56Hrb5WjUqEGuW96eXr9MLkp
         PejTDY6p/Ye7lCKbb7fvBb8y3cyJfzqXONzO4Ezvk6PrqDgGy4bKIuWKFXzhrgp3fSTB
         MsvQ==
X-Gm-Message-State: APjAAAVnd94CcnAJEG/uT/8adMZtwFYh6d7wkobrN9qYs0URfdOkmaax
        AdZfcWVQo2bmQk+pmC6vyqWweO9UzIZHKQ==
X-Google-Smtp-Source: APXvYqztG8XbO0ESbaQQ7+RG0vdTywVCBLvg6lD+682s5M2Sb+99CH+k9z2nGWrHEq/K7n6r4E9z6g==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr3601397wmj.133.1565710578968;
        Tue, 13 Aug 2019 08:36:18 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id j16sm64744819wrp.62.2019.08.13.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:36:18 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, sean.nyekjaer@prevas.dk,
        bth@kamstrup.com, bruno.thomsen@gmail.com
Subject: [PATCH v2 3/5] rtc: pcf2127: bugfix: read rtc disables watchdog
Date:   Tue, 13 Aug 2019 17:35:58 +0200
Message-Id: <20190813153600.12406-4-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813153600.12406-1-bruno.thomsen@gmail.com>
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The previous fix listed bulk read of registers as root cause of
accendential disabling of watchdog, since the watchdog counter
register (WD_VAL) was zeroed.

Fixes: 3769a375ab83 rtc: pcf2127: bulk read only date and time registers.

Tested with the same PCF2127 chip as Sean reveled root cause
of WD_VAL register value zeroing was caused by reading CTRL2
register which is one of the watchdog feature control registers.

So the solution is to not read the first two control registers
(CTRL1 and CTRL2) in pcf2127_rtc_read_time as they are not
needed anyway. Size of local buf variable is kept to allow
easy usage of register defines to improve readability of code.

Debug trace line was updated after CTRL1 and CTRL2 are no longer
read from the chip. Also replaced magic numbers in buf access
with register defines.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index cd8def79b379..ee4921e4a47c 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -60,20 +60,14 @@ static int pcf2127_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
 	unsigned char buf[10];
 	int ret;
-	int i;
 
-	for (i = 0; i <= PCF2127_REG_CTRL3; i++) {
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1 + i,
-				  (unsigned int *)(buf + i));
-		if (ret) {
-			dev_err(dev, "%s: read error\n", __func__);
-			return ret;
-		}
-	}
-
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_SC,
-			       (buf + PCF2127_REG_SC),
-			       ARRAY_SIZE(buf) - PCF2127_REG_SC);
+	/*
+	 * Avoid reading CTRL2 register as it causes WD_VAL register
+	 * value to reset to 0 which means watchdog is stopped.
+	 */
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL3,
+			       (buf + PCF2127_REG_CTRL3),
+			       ARRAY_SIZE(buf) - PCF2127_REG_CTRL3);
 	if (ret) {
 		dev_err(dev, "%s: read error\n", __func__);
 		return ret;
@@ -95,14 +89,12 @@ static int pcf2127_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	}
 
 	dev_dbg(dev,
-		"%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, "
-		"sec=%02x, min=%02x, hr=%02x, "
+		"%s: raw data is cr3=%02x, sec=%02x, min=%02x, hr=%02x, "
 		"mday=%02x, wday=%02x, mon=%02x, year=%02x\n",
-		__func__,
-		buf[0], buf[1], buf[2],
-		buf[3], buf[4], buf[5],
-		buf[6], buf[7], buf[8], buf[9]);
-
+		__func__, buf[PCF2127_REG_CTRL3], buf[PCF2127_REG_SC],
+		buf[PCF2127_REG_MN], buf[PCF2127_REG_HR],
+		buf[PCF2127_REG_DM], buf[PCF2127_REG_DW],
+		buf[PCF2127_REG_MO], buf[PCF2127_REG_YR]);
 
 	tm->tm_sec = bcd2bin(buf[PCF2127_REG_SC] & 0x7F);
 	tm->tm_min = bcd2bin(buf[PCF2127_REG_MN] & 0x7F);
-- 
2.21.0

