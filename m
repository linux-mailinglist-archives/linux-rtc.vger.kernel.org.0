Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD9A25DD10
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbgIDPVp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730771AbgIDPVa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC56AC06125E
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z4so7136108wrr.4
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+NW3ywAC/uanmt42NpnVbbuokCChZKYNRWziVF2DC4=;
        b=N2blinJjlupo88maqUS5WAVYUyr4cxdQ/rPg+8LSJY7CEPEpxcFJhypybzP5x7Z/Nm
         yAJhPV3cpxBcd60hXygcgcH7AR+nGWKLfJ7Cv5dpnUe0tLctk2M9ZFINwnFcTZF3ydz7
         DlBED3Hz2zkW54uoD/Gtdl2ITJrjDCHDqDOEzOFM1KFx+luO59Nhad90V+4GY9Gfv8yl
         9n7/6UlXhxjWci5hFnYNAj6edZWfWEOSG25t4zJdYFZEvyp1qZEJPGXDVqW8BuWIiqlK
         IiSYTF/YNhPQh/feA5TbMizHcAvFnuKdOGYEuV4NsENV+rVTG76FVmKlFx31zFNA+Cdm
         21xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+NW3ywAC/uanmt42NpnVbbuokCChZKYNRWziVF2DC4=;
        b=X1bOXF6yLznsbeWQrrJEolMmDJ26D+6WkZm60bD7iYblpk/Crcuq1PRIuxJn9pSf8+
         xrmuueJkzrqJCJcTCe4K7gvG1E9fdQ9X5s90a1i+Z4K06Ie3mhJuIrakVLZG4YyW1+Qk
         C9bMm+6hMrbAfGTrGYz0ejSBevR590DURhWIgCmKqjpKeHjwSYhiwlfawDVzjqZIll42
         WRNq6fLkyn2i79d3/Vm4v8jfx3QAjkKWOK+l6O8egzQKfWt+fZD7H3oV4zhm6E/Hq/XK
         J84SiNkHm2Fae8nXE9r5DhBT2yGXCiMDbHTyrhVaYc4LuZBHMj38HLZPT9Xt0PKSbafF
         kQLA==
X-Gm-Message-State: AOAM532ht2I95lx/g4ffwNR7q5rlWimU8rEKr7qdBMv4YXlx/Khnk+CC
        8aHhEqFkB4nzNQuCB5PtyChjCw==
X-Google-Smtp-Source: ABdhPJyuKewa1rTm4mj8n8YuA7Q4/uIFSQWnj17ML08IvCmIMK67PeeWiPxQqKEku7qkH3WDhX5R1A==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr2605254wrp.224.1599232887545;
        Fri, 04 Sep 2020 08:21:27 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/8] rtc: rx8010: don't use magic values for time buffer length
Date:   Fri,  4 Sep 2020 17:21:13 +0200
Message-Id: <20200904152116.2157-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904152116.2157-1-brgl@bgdev.pl>
References: <20200904152116.2157-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The time buffer len is used directly in this driver. For readability
it's better to define a constant.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 67ff06a76629..f3bed7be2533 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -48,6 +48,8 @@
 
 #define RX8010_ALARM_AE		BIT(7)
 
+#define RX8010_TIME_BUF_LEN	7
+
 static const struct i2c_device_id rx8010_id[] = {
 	{ "rx8010", 0 },
 	{ }
@@ -108,7 +110,7 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	u8 date[7];
+	u8 date[RX8010_TIME_BUF_LEN];
 	int flagreg, err;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
@@ -121,8 +123,8 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 	}
 
 	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
-					    7, date);
-	if (err != 7)
+					    RX8010_TIME_BUF_LEN, date);
+	if (err != RX8010_TIME_BUF_LEN)
 		return err < 0 ? err : -EIO;
 
 	dt->tm_sec = bcd2bin(date[RX8010_SEC - RX8010_SEC] & 0x7f);
@@ -139,7 +141,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	u8 date[7];
+	u8 date[RX8010_TIME_BUF_LEN];
 	int ctrl, flagreg, err;
 
 	if ((dt->tm_year < 100) || (dt->tm_year > 199))
@@ -164,7 +166,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
 
 	err = i2c_smbus_write_i2c_block_data(rx8010->client,
-					     RX8010_SEC, 7, date);
+					     RX8010_SEC, RX8010_TIME_BUF_LEN,
+					     date);
 	if (err < 0)
 		return err;
 
-- 
2.26.1

