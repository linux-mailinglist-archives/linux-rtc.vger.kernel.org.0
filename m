Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5772653D7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgIJVlU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbgIJNFZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2585BC061795
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so6601917wrp.8
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4PF6iUUI6SI+SJ6z3aC7j/JhZxFAycexdCgWf22To5o=;
        b=AiUoZAkXZa6DzILy730HrrK0W+sMBIXOXnSJSj1YNkV18zd+woSsRLc5tQyiO9hyua
         OyDDAJU+rJFIru3zGYePqcVsmV088eF+dGOIbk43G5PSkObyu8ASTHkMQT3xBge/EFRG
         cjJ1oaFDFU9abjWWG2+dYoIAVs8OWXZ+Jo7AoOIZjVigXgJ3pCTa8zpuiemS4JGAGd6R
         arybGGlLq67U2ijjr400/z0o15sKbpvr8fd+4v9T922e5K6Hg+I16ba6a70pnbFeFb//
         AhiCi58BSROJcZ8JaCUqhjVTIod55onVCYGreqGVJTDaAFOiv3fhCdhippfoD+xMwE7O
         r5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4PF6iUUI6SI+SJ6z3aC7j/JhZxFAycexdCgWf22To5o=;
        b=k1D+prf2AwKlyWD3jwyf7YFJ2cTYtTUOGTBsgFSK923l59oPdWuEWr/HURsolQBcE1
         psfKSj5J/9gXkX2be6RtrZ1j1wN/ZAPEWk8xzEMlyO0dV0MaGl2lnXXIC2ghFMgLpQQd
         YJxOqc0w7xmcfI3PNCd5acOrtQzencqvysrl7qW70nLLJDd5L/UpckdbsoWAYmgRzL5S
         YZvAf/DzrTwlYmnuXXMw2gYhj9/L3GkFjdGzp//2QLYc+4mt+uVMVQhQeGh6xEZsMmx2
         LThEiDt3cWojnVU/ghUoo/AXbyxfFwka4tcZAW1ZyO5tpW22mRD10yGI46YmY0H3x+Ri
         m9oA==
X-Gm-Message-State: AOAM5325APpnY7ya0DTi2haRvikNjQhraBtUGCqzL6MYQ+gdJVQQylR7
        Gi/RbreTht+3OG0TnXoujbcfsA==
X-Google-Smtp-Source: ABdhPJy2+TmxrCBV+QcXYzez3I3qTcnaBkMR3Gj258SX0dnjEo2hibzzWJ3Y3Pcwno+Pp1lquCnj2g==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr9850115wrt.276.1599743099638;
        Thu, 10 Sep 2020 06:04:59 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:04:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 02/11] rtc: rx8010: consolidate local variables of the same type
Date:   Thu, 10 Sep 2020 15:04:37 +0200
Message-Id: <20200910130446.5689-3-brgl@bgdev.pl>
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

Move local variables of the same type into a single line for better
readability.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 2faf5357a3a5..4c790d33f589 100644
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

