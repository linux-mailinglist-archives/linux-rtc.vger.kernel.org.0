Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22582B91B4
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgKSLqU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgKSLmc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:32 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E61C061A4D
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:31 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so6870945wml.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMLtLSPP1X7dkQ23sNMEDY+1BXHOIakvEBZ62gPRgGw=;
        b=V6MHRwfTZ/mv8IvgMW/nuBYNE/9YA2eqLA7pnXl0f0/W9k7sktVFEmryki0asE+OSU
         ysKX/FW5zQFyWHWQjITE18VnrQ57QTkQz0dOACigyH0nKsRfAbChfej3Z1rDb3nDFNsH
         75kq7y4UMSOTjZ+qG7uNlaiRrEANZGFcE7yBH65NW77jt8iLFrmcNWvVISRUajJ9ZDQo
         VZsZWYuT9mQ4KUpkBu7tTM9ExQCWXSQwaDjUhfqF/JM+BBmbacKCW30bdCcDTR26MSKw
         7OcxsY2cNU8uWSzyGzS+SKLPWVbCZ+0YrelL/zBzWA7B/AILZUBHitDu6r09dbqfldgU
         278Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMLtLSPP1X7dkQ23sNMEDY+1BXHOIakvEBZ62gPRgGw=;
        b=GOW0smPD1UC7dt60uaQW9FtrHDdkbOToc4d6Me+/CRL70/GY6VuxPsxJpsSUy/pufm
         drmzR/mmg25tCYaqXDT816MuBC/mEcceujoMQsledGJNjyPSrBtZgcj86BLj9kMckVfR
         HT/snQGSuowIU90nF5oKJU2CrDoJJaJ73738OrxZVtXk/ioDoSYxM5myE4+bgNh6evgB
         bahCUw4i/ZhpdgTw+HRU0JjC/VRlbrhIX9QzgTd0KmetRjP0Hn/NfOWOxFTtU98OQIhj
         MJZIZ1WW5iVOXvCw0P9TlJhN4Dcas0/+rbXWOphRlwTJ0yxVJ3+DwP9jX/XSFY42cY5f
         lkig==
X-Gm-Message-State: AOAM533NAbgvsjoFwIfK8ho8ZRN9Fkf9zMp8+5rLFv+r0OgCJZQCKVzL
        IAS/OgAAXO8ok73FvAY/RfSL9w==
X-Google-Smtp-Source: ABdhPJxQixp/KV1y74JU9Wtpg9s1GaQbisJwkU66+52eX32s6LUNCOhgLAnYLnG63YheMgT/y+pd8w==
X-Received: by 2002:a05:600c:2287:: with SMTP id 7mr1648364wmf.189.1605786149800;
        Thu, 19 Nov 2020 03:42:29 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 24/59] rtc: generic: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:14 +0100
Message-Id: <20201119114149.4117-25-brgl@bgdev.pl>
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
 drivers/rtc/rtc-generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-generic.c b/drivers/rtc/rtc-generic.c
index 89ae78e93b83..6254f65bee7d 100644
--- a/drivers/rtc/rtc-generic.c
+++ b/drivers/rtc/rtc-generic.c
@@ -15,14 +15,14 @@ static int __init generic_rtc_probe(struct platform_device *dev)
 	struct rtc_device *rtc;
 	const struct rtc_class_ops *ops = dev_get_platdata(&dev->dev);
 
-	rtc = devm_rtc_device_register(&dev->dev, "rtc-generic",
-					ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&dev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = ops;
 	platform_set_drvdata(dev, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static struct platform_driver generic_rtc_driver = {
-- 
2.29.1

