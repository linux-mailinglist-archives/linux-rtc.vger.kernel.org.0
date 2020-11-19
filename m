Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B84B2B91D8
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKSLsR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgKSLmK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:10 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04C5C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:08 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so6047997wrc.11
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oX6wcEul0SQXqQ5wOdLLxVTiARQ/rjlnKPOtwZUU778=;
        b=MtxraTQbcoCHWmLJQyRoIvqY9Xj23wL7HcHLDHXZuNMe7+62TC6IRHwBTzoUVV3sC+
         G0pR2P1t369D1KaL/rwNkbiEivfy1YwSmkCmoXJxwZJ1Ibyo+d7AmHPxvSGX9x/pXS8B
         WhYCFWCHuoU8eMXCkneT0OFaO6R5VK5EqsW6iw1AE7tsXaGQvRw+bjsFqVtOBHG70oT3
         mPmP6kBbCysG6IuB1l5veomQtxfEr3eQdeUKCsdtWmgSSmtUH+Ale9FcYxaTVY8LMiyU
         //Q8MS/q5ncZs1DoVmBeeQiVOHs5AvoYLREppR+XXkzsyPgMTw0JMqMOaNvyHbs7uIUa
         QK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oX6wcEul0SQXqQ5wOdLLxVTiARQ/rjlnKPOtwZUU778=;
        b=oCNpPApSOfh93mFhP765ldlGor2pDpAbkBljQw4hKlE7zGS3gIqH7yFYNtR27hHAqU
         qNu6aVOJJa+oo0AViySjFINEm1mb3tyPEyAorpvryYvfYOII/GupMY3RI2cAeNelUO0u
         VN7wK/d9tgPj9gz2miXt/8JuN+TL9V4t+uTL4Ip4hkY/+c11n/7JOnSjXco0YzWMCCcj
         CpuZ2MDW522LuSW8o4NIY7pyyCm3nuDcWFoJl7GOK+BUrkJgDZ17U+FIgpHsGeDjO/nW
         VFjXvPPc88Z4ug1p1InkRrOmjrm6yzLDYLxrMz73x09v1zfSmkklAlOGlVJj/MiQaRAp
         a3Rw==
X-Gm-Message-State: AOAM532Npep/CM+xNr02uzfbUjBOUKSU7VGd8HKjra9B8jTn7GlANFV9
        02MEcI6MHCNhChlbyYGZNsp5sQ==
X-Google-Smtp-Source: ABdhPJxEVDtM6HCbx8sZhEgbkPJ+ircYzKu6MDGjggNxNR5EU77JaJRWe2KO8BR0V/65PuDgtfoMqQ==
X-Received: by 2002:adf:f441:: with SMTP id f1mr9752545wrp.225.1605786127656;
        Thu, 19 Nov 2020 03:42:07 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:07 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 03/59] rtc: ds1390: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:53 +0100
Message-Id: <20201119114149.4117-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-ds1390.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1390.c b/drivers/rtc/rtc-ds1390.c
index 66fc8617d07e..9e4d09eac323 100644
--- a/drivers/rtc/rtc-ds1390.c
+++ b/drivers/rtc/rtc-ds1390.c
@@ -203,14 +203,13 @@ static int ds1390_probe(struct spi_device *spi)
 	if (spi->dev.of_node)
 		ds1390_trickle_of_init(spi);
 
-	chip->rtc = devm_rtc_device_register(&spi->dev, "ds1390",
-					&ds1390_rtc_ops, THIS_MODULE);
-	if (IS_ERR(chip->rtc)) {
-		dev_err(&spi->dev, "unable to register device\n");
-		res = PTR_ERR(chip->rtc);
-	}
+	chip->rtc = devm_rtc_allocate_device(&spi->dev);
+	if (IS_ERR(chip->rtc))
+		return PTR_ERR(chip->rtc);
+
+	chip->rtc->ops = &ds1390_rtc_ops;
 
-	return res;
+	return devm_rtc_register_device(chip->rtc);
 }
 
 static const struct of_device_id ds1390_of_match[] = {
-- 
2.29.1

