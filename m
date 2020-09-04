Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FE825DD20
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbgIDPWg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbgIDPV0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2053EC061249
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:25 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so6452273wmk.1
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4PF6iUUI6SI+SJ6z3aC7j/JhZxFAycexdCgWf22To5o=;
        b=hG22uCLiFR7asAwpfTFSwQU1iT/gHSJGscx3xXml/kyxE1JnDfx2MImY/2H1R8hLKJ
         KfCjg6MZKknAkIKZotyKG6V6+B4nonb97c3ZWtPawkNO8Jkk2A4zk1b4rjfuNlZFAIMP
         7Nengc5DlafgZ1S+i4Vx+EqWWER+cB9wNIsVMWDs8lbGwmw97s+ZL173l3s2Obdzotar
         ayKP7cRX4JqUx2ALb/DjcNiWn377sT5SR3DGB9Laa8iyUktr0lOizPQHLFHIvu6DI1kx
         i/crp9Xnio/Y+MqlzSjqheLANh0YjRxvrEgBrOsSZkzu7pWuJiKCVnHyQ9qzaIcp66vt
         JHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4PF6iUUI6SI+SJ6z3aC7j/JhZxFAycexdCgWf22To5o=;
        b=eMLSaUZB4DuhTxfvbjk8hHLBoruMdZwNKPJf375fAyWGg0hre4SRuntsiqv6oBph9M
         q5rZOMh0WMmjWZCu7Eqas6sfzlsycFKTQ+eOCt1vgZt/BTyyR7fpAGoJZhOfVedi6891
         EJvEt1ATI13rzjoHC/dPoMpHs8Ol7GvGpMLCu1gRv7V8Reo2aJWAHbBZCOovS2wpYJzI
         Zq+sRDR8yw6zauau2HnFlhRnFCt4NG8XIrkupACj1H2Dac+DixMH/rEKjdpIwKoqGI12
         uIscGZx9sCbpNbdDOqz1ENLEymWUuHVll1EO6J6fj1bo73ZVct0OrIJ0hLd1sR974jMt
         2YhQ==
X-Gm-Message-State: AOAM533RoufCw5TQck6zEhZ+mh5Z4e0fVLhnlt4Si4yOSjgAFgv3L5Tk
        HAbBu+/sps1hUX+gcGu4nSGoYQ==
X-Google-Smtp-Source: ABdhPJzwZNrCv4oELX+wCyr/BptjE1Vzk+IEHthZyONGkq5f0OG68w9UJLc9TtP8XmHM+y68jgRZMQ==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr8082237wmc.73.1599232883838;
        Fri, 04 Sep 2020 08:21:23 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/8] rtc: rx8010: consolidate local variables of the same type
Date:   Fri,  4 Sep 2020 17:21:10 +0200
Message-Id: <20200904152116.2157-3-brgl@bgdev.pl>
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

