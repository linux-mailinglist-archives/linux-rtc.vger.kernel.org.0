Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A10A994C3
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbfHVNTy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:19:54 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42879 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbfHVNTy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:19:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id b16so5387719wrq.9;
        Thu, 22 Aug 2019 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YtEgS3a59qGIbOV1HTWE1e/qiDN5d44GwGNe2nrAAsw=;
        b=LNFVTHkwXpEC27df6ulXj/LaWk+0z4YZWALXX7JmDoiZnpIKjPd9Me2QAbyxUJy0PM
         J1wf8pygoANIe7z60eS9IY6DgTs3Rn+MiJgFu1dbpTFyeMyjz2SBsKNv/4KwtDPB60EP
         IaTCZTwdW1F0mL3+ytqSpdk5gOv3aQFmniDN4eshIZjd6BTRwjFKAJ7MN6tEJImrojtS
         YwF5I1lryOOlZenqUuh3oAr3cLzAqT2/xhkUIaP1FjlUdkWTanrzb4iRghS1kyl7pnbb
         +Q0Ah0hg6oczBN+ZEeYq+G2xUwV0h3GCxUwVLUVtRtTIdazujgldoCnNad44n9ziIvMj
         R4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YtEgS3a59qGIbOV1HTWE1e/qiDN5d44GwGNe2nrAAsw=;
        b=r7tsjaBaeV6wPZzQqJR80ZRd1n1fbgt6mncajGJNJc3B5+zG2K9hubPt4jsd1w21kW
         1Ihua2thgsLXzyLbMf5dZRMJ4Aa7MNmIiIvTMq89L5UmcNZqL4pzQ/tOqI7XkK92yRlc
         wPKsUUUcWARVt4aOLveYfVcCOr7yAQxOauMc2n82ZgkNqjg7aV/Z656uvf2RMJnWvwro
         UwLX3atsVCKur+oQDRgbrXH1TuNpEhwNqD98tLn9kUiu1Cct5lxbfXZsNwof7PFVrYzm
         jvhDVoJsyd+PmcBgm5IieHi/QvF46dGY+Ylo//k3HlfzsppxREcYqfPQ3+YhtaBB1Jur
         UD+Q==
X-Gm-Message-State: APjAAAVB0LIutu8psNDrbI3/CeYGh3rd/GLu4ArHy/Twq9QWOeNrBGKt
        ZaIF3waD6Rupa5yFsYD/4WwzWQMNenwaiw==
X-Google-Smtp-Source: APXvYqwWtJafFn1aPf+tu5KDwOKO46F0H3k234BVWqRCS4gww4+FA8asmbYIjtkb4o9AcSDHCuw52Q==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr46506253wrp.38.1566479991762;
        Thu, 22 Aug 2019 06:19:51 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id d19sm34644045wrb.7.2019.08.22.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:19:51 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        bruno.thomsen@gmail.com
Subject: [PATCH v3 3/5] rtc: pcf2127: bugfix: read rtc disables watchdog
Date:   Thu, 22 Aug 2019 15:19:34 +0200
Message-Id: <20190822131936.18772-3-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822131936.18772-1-bruno.thomsen@gmail.com>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
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
v3: no change.
v2: new bugfix, not in v1.

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

