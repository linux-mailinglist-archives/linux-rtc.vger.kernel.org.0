Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AE42B9176
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgKSLn7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgKSLnE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:04 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CFAC061A51
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:02 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id m6so6076932wrg.7
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fh0/ML4VFEC9H+vJV6RWtrAyOJTOn4EWW2FuW2aJX+M=;
        b=nq65fEuUWFAN2kxughIowzyAZ/KF07TGDU25+nWq5Ozvi3zX/4NET3JTnu5AY2jinR
         sO8BV3xKwShEab9KXxfgzdqgH2yDwwnAxZDC6lxPnwkgVNLO0PdaUxdifqrE/VdgBfYL
         YV6RMEDfUIO7DIHIKUMXzStk8zE4O77ONRqv820PEe1TdcVg4ws7a5xe3k3E0O86q9fl
         N87P2pVpYmnb96oy8tdIo90aQ4jToQkVyPD3vCa2AxvaeExsgC1W3+QSRWsDvMUoz981
         KriMbNJa3OTiqcFM8u4nozwrAcd1xQUl0Rk4V64FLZLIJKEZqteE3TxtMvDeiDDjfTMi
         UHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fh0/ML4VFEC9H+vJV6RWtrAyOJTOn4EWW2FuW2aJX+M=;
        b=eJwS/ebiRmXKWyCCHvzctUsAsmuFXQ8pOTFFZp5f88FBNqHy9/CA5BuCk9++T0Pw9n
         Oej2v8NYoD++UdJYph0ef7zcM9ZUOTLNz0IK4i4yU6eS/kpiCpLEIfpF/egVS6YyYvI4
         SZwWhpW155yOonW9ZGrwKbLknf71vva9QhjHzYDVyZOD3TxdQeUA4JdP9xX6zORv+86Q
         0T1bulm+Q5NCwm5cpWQQntrQk7bGCE9r6viLiRhfFXNK2dr065lxvlQvT9mki9VGbpQT
         jfSR1w1IAcHJUXYLn9kIwgfJjkifjinMDE1h+U7J/BunT+TDqsWj71OSu9IKCtKUi7DC
         MKQA==
X-Gm-Message-State: AOAM533D8fx6YYFoci//SZMclcVHqj2ricC07dnMzrZaacdGOTOY0j7O
        nmtbh/zCduaef+1S2XSrmQQElA==
X-Google-Smtp-Source: ABdhPJw5aOIENoQLUC/qJB8iVUJ1V/qfxtDoSsIzTGV/yXFjyqiqquHGS1w4nkL0SnTdS4d0nct+BA==
X-Received: by 2002:adf:bb92:: with SMTP id q18mr9500032wrg.315.1605786181762;
        Thu, 19 Nov 2020 03:43:01 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 53/59] rtc: m41t93: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:43 +0100
Message-Id: <20201119114149.4117-54-brgl@bgdev.pl>
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
 drivers/rtc/rtc-m41t93.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 9444cb5f5190..7faa8a4f0032 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -181,14 +181,14 @@ static int m41t93_probe(struct spi_device *spi)
 		return -ENODEV;
 	}
 
-	rtc = devm_rtc_device_register(&spi->dev, m41t93_driver.driver.name,
-					&m41t93_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &m41t93_rtc_ops;
 	spi_set_drvdata(spi, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static struct spi_driver m41t93_driver = {
-- 
2.29.1

