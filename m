Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD0A2B91C9
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgKSLrm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgKSLmU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:20 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5FAC0613D4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:18 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c198so4988618wmd.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qS0nuXOPHBI1RuVlcfb4tmmEAJXNLz9cTtjsZUs/ZKQ=;
        b=DMg0f3aszor5bVjHLsr0GVN0eFFyDfsxVtAiH1KNee2S9anTT68wfRI5MHKySfjwii
         JWpxZaXSVDBRMMDwIH7cItU3+J5SNGraZY5lImND44mShI5RNyVHTMv6xsK57WZRwzBl
         EZ/tmEtFx5g6G901oIJzcPAeHvDT5bWWnisz9S51XgR46oRbO5+xNDdOYioeZ8JiUe1u
         L0g8HP+pPlW6S4wnny7mTzyZ/H/1L3kKLLAyZhLHuoVqeW7WRcEvQHdNUeq1wGJXwNj6
         yJbUt5Iz7a6UkqJ8p00s/CoI5Kjy1zfsRXK1J5wtO5Ckm1DdIc7PH3LK0yodweupyL/g
         lNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qS0nuXOPHBI1RuVlcfb4tmmEAJXNLz9cTtjsZUs/ZKQ=;
        b=a5WrBQQZfT8orv3vEMqHBvhAHusjtF9HAvne2aCRBNiUQ4j7x/4CEaACDjpIWcF7h+
         Vb4P5x0uKvKcMqf7VSJL+YvGntyWNQZ+JZn+VkkLjikg81seDJU+IC1iH1Tt3XKdz57Z
         dWbIgQRpDKTYNHGuP98iHUVLHC97FFQWPGwTAwKiDkMnquASJbFMwOicO1sygMU9scPC
         adSI4Vdyv9Pj+BbFdtRcoj6UVTfKsOoaQfDp+DJUMjszwalkfkBE2UDyxJkMAGvghS55
         zlrWLIPzNM5aKZtmoMzAzbiF3YU3SpOnAinxhxSqkrBDHaLdt5W77nlQGyYTXd3IrfTM
         uwNw==
X-Gm-Message-State: AOAM533rM/K9RUadiZeTbJ/jOjFyy9PydIyB5R7feIQZNr0koes9/1RN
        ZGopLkGgyMpIDaQyi6U6bHS6EA==
X-Google-Smtp-Source: ABdhPJzXju8Fm8+KyXwCANsS/1mB/ZX7c30OH9RrP2P6V8fkgTmSraIeoWzQT9qaLjcDQ98PB1br6A==
X-Received: by 2002:a1c:a70b:: with SMTP id q11mr4326088wme.90.1605786137305;
        Thu, 19 Nov 2020 03:42:17 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 12/59] rtc: pcf8523: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:02 +0100
Message-Id: <20201119114149.4117-13-brgl@bgdev.pl>
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
 drivers/rtc/rtc-pcf8523.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 57d351dfe272..b525998cd70e 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -356,12 +356,13 @@ static int pcf8523_probe(struct i2c_client *client,
 	if (err < 0)
 		return err;
 
-	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
-				       &pcf8523_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
-	return 0;
+	rtc->ops = &pcf8523_rtc_ops;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-- 
2.29.1

