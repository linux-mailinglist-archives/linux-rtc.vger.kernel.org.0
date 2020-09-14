Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A87526908D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 17:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgINPql (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgINPq2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:28 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F44C061355
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b79so535818wmb.4
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrnQfXAwl9bcL5E0QBsVJFHpEFR9fxJonOnaBemm2TE=;
        b=HmV/oEnRNtPlxtAT0Sg9rlFRvqlKlQ7ADsGicyJMLcWMMBL8QKsbSV5Qs973MIPXon
         yXPKQ7CvHL5wI+T8l8xPWD26TB7obfBV3XfkTYn9vck1tdlQ8kzctLZtNVV4ndzOVpIB
         hlMeDbo4/EQPJ2INqwfjgS/5DQRmbnywCWXVX9fdiYaBBHNAtEP2LPg67cZRlK/sa2xH
         2ZLgFDTxeNv2UlO45+/EHO7bV6tAAL6NZhwwnpnFXRgEpAHVmboE8G0tDY5I/eivysk3
         A8rCXm6Hgo1tROLBqZjiwGzq5SckG0ntoFuJVfM7uoMIqtR7TQH7TOpZPfVIf8fsCnhO
         nxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrnQfXAwl9bcL5E0QBsVJFHpEFR9fxJonOnaBemm2TE=;
        b=rNF1l+QrvZTmg8taOlznCxuMOWNqOoqGUZ9NLjAUoG/y8aqmt4JcLQKZ2MoYA+crmO
         d0whY91YPTqzQ+hQvvmyOiCa3vCw3Sw7RnyqfXVomUJRt5947xJUvlQ0pFsnvS4t+fWp
         5x992acjSSZWyukE2W6HM1k2JUr+oG+xSV4Vay9uNAqPLiFoi70eM+K47Fgx1dT2Uvea
         j6BuUE9gqrgq0zQcdp2ZxKmXkMwlTMUNRf1CZDCqhrCF8kxgtS9uJAUUyhkK89xg0uLE
         2J1V5tqMDUh/cwF3iYm+EtulemNAL2h7VjrpfY0y2A7JZX7faSYmgNOZEcyzXfD7t1ok
         2t9A==
X-Gm-Message-State: AOAM531meJRHRO7I/357rFnIgUNxdYAC8o3PLUZeag6ibOvvSRWlnsf7
        F6H9nU+yU/jebGgbzQN0K69FpbAW3atDGQ==
X-Google-Smtp-Source: ABdhPJyBZ2pvmkMwfuapBiZzxMdOAuM/klJ/ew3ZcPQMcjFQzmAcJaYDz2JIDAkmm++Uu8HETmvR5g==
X-Received: by 2002:a1c:9c4b:: with SMTP id f72mr17600wme.188.1600098368083;
        Mon, 14 Sep 2020 08:46:08 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 04/14] rtc: rx8010: consolidate local variables of the same type
Date:   Mon, 14 Sep 2020 17:45:51 +0200
Message-Id: <20200914154601.32245-5-brgl@bgdev.pl>
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

Move local variables of the same type into a single line for better
readability.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 79a3d90d2c43..153fa58f0365 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -109,8 +109,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 date[7];
-	int flagreg;
-	int err;
+	int flagreg, err;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
 	if (flagreg < 0)
@@ -141,8 +140,7 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 date[7];
-	int ctrl, flagreg;
-	int ret;
+	int ctrl, flagreg, ret;
 
 	if ((dt->tm_year < 100) || (dt->tm_year > 199))
 		return -EINVAL;
@@ -250,8 +248,7 @@ static int rx8010_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	struct i2c_client *client = rx8010->client;
 	u8 alarmvals[3];
-	int flagreg;
-	int err;
+	int flagreg, err;
 
 	err = i2c_smbus_read_i2c_block_data(client, RX8010_ALMIN, 3, alarmvals);
 	if (err != 3)
@@ -279,8 +276,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 alarmvals[3];
-	int extreg, flagreg;
-	int err;
+	int extreg, flagreg, err;
 
 	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
 	if (flagreg < 0)
@@ -346,9 +342,8 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	int flagreg;
+	int flagreg, err;
 	u8 ctrl;
-	int err;
 
 	ctrl = rx8010->ctrlreg;
 
@@ -387,8 +382,7 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	int tmp;
-	int flagreg;
+	int tmp, flagreg;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-- 
2.26.1

