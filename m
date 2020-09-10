Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08F42653D4
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgIJVkq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbgIJNFh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:37 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8FCC06179A
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:03 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so5716198wmb.4
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0uif8G7qHTGRhCmGeHPmCwg86SJ2eGD23rP8ij/IiTw=;
        b=gb8G4Fxh3KQ3n8CxPbVo6AHusqeWeHNuQJv14YbC8w5o71a/LD/mUEJs06V1WBrKsI
         ujHkimYi85EqYVCRha+Jv5LxryYkLKVNKolPcztATkaHBYykPu8IauwcsofY7ObUlh4j
         d5bv/pRE2isIvJo3a5oINc0ZQ4AT+WnOfOwTFnA+iR3vtpuLRxVByd8sBQrkV2CjpgkS
         aR4E/HefjSqMtrwz0b9+aKqB3B4TLfPvoL7QH+UXIrgkegP9kdGroVBwwtbb78V4Bm+5
         5Q53aou/xPtCJuJIMx12893gxth82y4pJrhmBGrIWGiZ67NNr3kor/VjBNynOttHGylu
         J7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0uif8G7qHTGRhCmGeHPmCwg86SJ2eGD23rP8ij/IiTw=;
        b=bp6aZ7Q1G5Eb5UFHp+ld8QFDOjannRzFH/uxgPfjB1Vy4Mw7Vy/8VrRqbO5W3LZRCM
         lfmVuOtlKmG+DYciRztSN1kAhrNO5Y36tFEgDsF4q7ckfjdT0Hqk2Zc9errBkq01kPc5
         jBHs1aqDIe4w017z112V6eDiyapSRu+gzScHAuM9nqeXpn+q4QgZP16+mfHyEvHAQ74z
         k1JMlmdqBuLEDEixY/5hlEcgLbp/iKNYMcKkmDb9BgGltdzqxI+CWCe1Ero4iB2kwFhj
         d/MPYh6BkmUi98F34UHgbPa2o9BCKaEIMG1uoZHkcodXtJzntlE41PwQi08HOAEXLtWt
         Z0WA==
X-Gm-Message-State: AOAM530uB+jhoxcNg2aVrhFmcFt92hNf3BA3Md5kHDqyDSRYUezHV1W8
        77Is1TjG+Jn/kqo1r+YvqwdX8g==
X-Google-Smtp-Source: ABdhPJyicW4ns45b8xZhcFkK1PbXfBjeX/nBAc4igspZuSMMeFcb4ULvJxC9mxlgL33Lek65yIZOWA==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr8868118wmh.31.1599743101924;
        Thu, 10 Sep 2020 06:05:01 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 04/11] rtc: rx8010: rename ret to err in rx8010_set_time()
Date:   Thu, 10 Sep 2020 15:04:39 +0200
Message-Id: <20200910130446.5689-5-brgl@bgdev.pl>
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

All other functions in this driver use 'err' for integer return values.
Do the same in rx8010_set_time() for consistency.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 2038700a3e8e..67ff06a76629 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -140,7 +140,7 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 date[7];
-	int ctrl, flagreg, ret;
+	int ctrl, flagreg, err;
 
 	if ((dt->tm_year < 100) || (dt->tm_year > 199))
 		return -EINVAL;
@@ -150,10 +150,10 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	if (ctrl < 0)
 		return ctrl;
 	rx8010->ctrlreg = ctrl | RX8010_CTRL_STOP;
-	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
 					rx8010->ctrlreg);
-	if (ret < 0)
-		return ret;
+	if (err < 0)
+		return err;
 
 	date[RX8010_SEC - RX8010_SEC] = bin2bcd(dt->tm_sec);
 	date[RX8010_MIN - RX8010_SEC] = bin2bcd(dt->tm_min);
@@ -163,27 +163,27 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	date[RX8010_YEAR - RX8010_SEC] = bin2bcd(dt->tm_year - 100);
 	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
 
-	ret = i2c_smbus_write_i2c_block_data(rx8010->client,
+	err = i2c_smbus_write_i2c_block_data(rx8010->client,
 					     RX8010_SEC, 7, date);
-	if (ret < 0)
-		return ret;
+	if (err < 0)
+		return err;
 
 	/* clear STOP bit after changing clock/calendar */
 	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
 	if (ctrl < 0)
 		return ctrl;
 	rx8010->ctrlreg = ctrl & ~RX8010_CTRL_STOP;
-	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
 					rx8010->ctrlreg);
-	if (ret < 0)
-		return ret;
+	if (err < 0)
+		return err;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
 	if (flagreg < 0)
 		return flagreg;
 
 	if (flagreg & RX8010_FLAG_VLF)
-		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
+		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
 						flagreg & ~RX8010_FLAG_VLF);
 
 	return 0;
-- 
2.26.1

