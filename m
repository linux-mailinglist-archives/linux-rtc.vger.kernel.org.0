Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3A226468F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 15:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgIJNHU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 09:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgIJNFt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642CBC06179E
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:04 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b79so5716259wmb.4
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33HvCzmAdaLlwRHDyqC4pE+Fu8CzZCLUT7jQwq64ZmM=;
        b=zLiBumH9bdvbhME9635lK8sWPXtz3wvQnRLN9BiB1M3oT8+jGRsuYqrEYl+HeFpVPG
         MdHF/TDk9l9J0Khjw/HFvFlLyZfaw67RZCjWroX8eHw6n48Tr9jad0k0BIasBeGXYfIU
         3fVh1gOEHYnyoQpHZ5BPOYIM1skUomvAwszglWpp5nY4i/0JoDX84drE1t6NW03tIHeR
         2d5icLUkSlc+ub6SILnCplsWfcN+XDnnxdYkkUbgKX6cL6oqYRiR4ZgD2MklsIo2afH1
         kfLKs+85otXaNLZlj84TYTmMSG3P0n7EhURwz5xJ83A1N/q/shHrH1j3Dyc0PLFOHZ3B
         Zksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33HvCzmAdaLlwRHDyqC4pE+Fu8CzZCLUT7jQwq64ZmM=;
        b=HIWM1vQ8J6nwJJzskhBCDrbz0q0snWEIKHMRyZ8APlcZQyOf30YzI+MTL4tsdejV1h
         gZb0XwjY/XmD0tPCjOmDWTav8NE0XmftOB7MgDxYaT64pOkiIrKcj2JlUZJRb0KhQc1n
         955rAjY6BKAfRTat5I9FyzItNsZnbo3sf5NEh66BDzaUJIPW/kGUGUavLPDW+jKpOzu5
         oPcHarH0EsiKaTC4cn7L3sPuPSr+ciMomGkV7jVq+OStOXxPIGbh8J46db9Ii4bW9hAc
         KJvzBoFGdT5lMGHFPnWUqmXCA3ISr3ZdXorwAh9OhV/kadGsyDnszO8eRRyZBw23IbhX
         egZA==
X-Gm-Message-State: AOAM533KLBv/s2q4HJnMx3fer9O9cH8r2Ovasxpy4KYgY2AroNxuSw0m
        N3YpHHpVXKfEVKxr0kmdz5qjHw==
X-Google-Smtp-Source: ABdhPJy3raa9gr29pIrx1im1S+1sVLkicexIz3zya//5Zki/QyyDsHCxqhFkSJOUK1G18zoRaAeIQg==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr2709wmc.112.1599743103105;
        Thu, 10 Sep 2020 06:05:03 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 05/11] rtc: rx8010: don't use magic values for time buffer length
Date:   Thu, 10 Sep 2020 15:04:40 +0200
Message-Id: <20200910130446.5689-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
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
index 67ff06a76629..b065973b8a14 100644
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

