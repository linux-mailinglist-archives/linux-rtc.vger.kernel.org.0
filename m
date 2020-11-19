Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313782B91DA
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgKSLsS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgKSLmJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:09 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3521C061A48
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:07 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 10so6883255wml.2
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bW99gdBHcp6/Wgj5kbKnIPrjD6pJqlCtMEvHu/hoqdU=;
        b=Fs5WNQgAUWMiBABbH+g9FLs4Z5RNJoBSr0fHL/YDaRSQS3B/NhRhUdMnJ/2+TsXgEh
         XPfIwyrbe6++Pn1tNn3SG422u3Qlaqb4Tk5AOqEzDYMel4eewDxR83pyvmGP2xzQI6HS
         darYaLwG2pKnRaHCRMEYbrWKtE3v3Mez7Oci0NNMzocB+rnfssg0s+c26mN2hBwCORXP
         B6Ot7UShF3rfa6MACnaMCE2j5qwlVdPldd/7FQSjrhYxMDGSulIG9Izyu0gz4nFjXb2Q
         H2hT7faw00lF6E4Bly3P3Tjj601AEGiAxGM4k77xeu2LTfGU1Kpk11MY3tWBDVNbObaB
         0f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bW99gdBHcp6/Wgj5kbKnIPrjD6pJqlCtMEvHu/hoqdU=;
        b=PAu6/km+MkswtYguYN9uSvyFG4koypGA5X00ZUXQ4z3AklwbZfmqAYIEfgnHNvavtP
         igzNUz6LHnq2kaedo3Pc10gy4wEmcdNGHJMD1UOQbTP9MzGEpSj6mpmKRgW1JMEC4kwW
         861/gBmWAh7e9YF08dIvaApPWFHAFMZ3Vs40hM8Yi7h16Sfm34lHAj763PjhmN9Y7FK1
         x7sC1scLVJYdzSIKJFRw14KbgLhdxVb4DuQD5gd6joYek4yHDY7NJLEuXbiqoMatjcOu
         hIVibEtRTxf1in8CXuza29R6UgjXpzzroGkXSxyia5r3hkwU2YD6kCXgAdmMmvP5xIEm
         PX3Q==
X-Gm-Message-State: AOAM533yJlAdzIV0Z8zkASS4SqfCsDJ/N97l/+YM/u/3vmfgBIZTV9Bz
        4uJ6zH6aSn/58ZAEZhr0BGFsLw==
X-Google-Smtp-Source: ABdhPJwxbAm7Je1WcgBxcMlNOAN3Z7/oTCfYy0eMccoMnjkh57UVFHXGSsaWmEi+qffjgI8EyDQgcg==
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr4099018wmb.139.1605786126669;
        Thu, 19 Nov 2020 03:42:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/59] rtc: m41t94: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:52 +0100
Message-Id: <20201119114149.4117-3-brgl@bgdev.pl>
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
 drivers/rtc/rtc-m41t94.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-m41t94.c b/drivers/rtc/rtc-m41t94.c
index 6803b0273302..6e970ad350d8 100644
--- a/drivers/rtc/rtc-m41t94.c
+++ b/drivers/rtc/rtc-m41t94.c
@@ -120,14 +120,14 @@ static int m41t94_probe(struct spi_device *spi)
 		return res;
 	}
 
-	rtc = devm_rtc_device_register(&spi->dev, m41t94_driver.driver.name,
-					&m41t94_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
-	spi_set_drvdata(spi, rtc);
+	rtc->ops = &m41t94_rtc_ops;
 
-	return 0;
+	spi_set_drvdata(spi, rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct spi_driver m41t94_driver = {
-- 
2.29.1

