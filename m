Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85A8269101
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 18:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgINQCO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 12:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgINPqb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BB5C06121F
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:12 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so555491wmm.2
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZxSmrYbaeMpZke8aTud2a7+NtoqExH3ux3lqAPkyJY=;
        b=rAMF2TjxpBJIoU7kYaDU+icaC5IeQQwOQ5XHKvgZF0r9czxEwV6F/wSKOF8fskvj9L
         mlOQz+g+CPu7MjpDonN+Px4GTc4l3HKLhkmtkKO+bcrETWlCod2gyhgrwI95uBX7c1Rz
         B6w5ju9n/qds9XwuWncvf22sG+2c8PA45zcWp7aUl2hmJEzduOej4A/GTJ1SCZQSobgl
         NoweGZlrXbxFO4BpqU8FJtkKIx3KxKO7vbeGAl+Jl0jNymr3lCmv1LL6WR0m6lgYgV2X
         QWydK90cKYinntlqqRL6wlbQDnbXIlGZZWsdhUFeGbehJ52+kKWLs7QSxOBIcFniS2eo
         dr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZxSmrYbaeMpZke8aTud2a7+NtoqExH3ux3lqAPkyJY=;
        b=ImG5FoK1gBoqoE+02Rzx/7mU4rbbpBWC2EG3DTxLC5Ux2rDU2QQ2jq/+XCTZaLa7Tn
         6nc2T/HVPLX2Ut54dlUh/6DWU/S3MSf7ozGQX8FR5KBir6hGEgFLcL4MQ+41bwXOskVw
         lqwdukZw9eo/Q18QMlQpjIlKYvdd84ZPyNIWSJ6LaHdXpNBMTgT+JyayXz8rOaGuzT5y
         JRPzjc+v2snRdnh7F0ZjlUrj5rmEqhi/nXiN52m2rluVK13HKoFlh/6jjS4T/5hlpCwW
         /b2ksAuMPjkgbUVFo7+F+r+hAZcUfMCoLRZqJ69aoWfYWPGsFECI8H1nIWmJ7ydZgnP1
         IHsg==
X-Gm-Message-State: AOAM533sdzmiZDlC/Q3H5kSq2eipRNCO2mK1rzsuOeclmy+2I7cXDVqU
        jR3PPYYYLN1UsnFQFHh1Pzkxdg==
X-Google-Smtp-Source: ABdhPJyxI9z9y1wOPKAmsQvoxoaW/k8ouSEm71r187J1QGCrBr+P9qK1muhme2XC1UygjJqzK6OoRQ==
X-Received: by 2002:a1c:67d4:: with SMTP id b203mr33404wmc.120.1600098371007;
        Mon, 14 Sep 2020 08:46:11 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 07/14] rtc: rx8010: don't use magic values for time buffer length
Date:   Mon, 14 Sep 2020 17:45:54 +0200
Message-Id: <20200914154601.32245-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The time buffer len is used directly in this driver. For readability
it's better to define it as the difference between the date register
offsets and use sizeof() whenever referencing it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 300314ab7b6d..2c894e7aab6d 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -108,7 +108,7 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	u8 date[7];
+	u8 date[RX8010_YEAR - RX8010_SEC + 1];
 	int flagreg, err;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
@@ -121,8 +121,8 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 	}
 
 	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
-					    7, date);
-	if (err != 7)
+					    sizeof(date), date);
+	if (err != sizeof(date))
 		return err < 0 ? err : -EIO;
 
 	dt->tm_sec = bcd2bin(date[RX8010_SEC - RX8010_SEC] & 0x7f);
@@ -139,7 +139,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	u8 date[7];
+	u8 date[RX8010_YEAR - RX8010_SEC + 1];
 	int ctrl, flagreg, err;
 
 	if ((dt->tm_year < 100) || (dt->tm_year > 199))
@@ -164,7 +164,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
 
 	err = i2c_smbus_write_i2c_block_data(rx8010->client,
-					     RX8010_SEC, 7, date);
+					     RX8010_SEC, sizeof(date),
+					     date);
 	if (err < 0)
 		return err;
 
-- 
2.26.1

