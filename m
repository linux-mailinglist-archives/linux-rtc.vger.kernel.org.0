Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BF22B9177
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgKSLn7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgKSLnC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:02 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F54FC0617A7
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:00 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a3so6456281wmb.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+jKx/KylEoEPXl1ksUY+ZSMBN+gdF7Yb4Tzz+/gCV1U=;
        b=XsUpgDbKoyrVyJrJV0XOeH7r0E5135RoW75nMdoz65LW7XWWr63/BcxD7nkQF6WMXd
         AJkUV52N1OyLVe659c3vDC2rLqd4ac961FJ3kuicJxP+0cQ55QuPF1a++RdvkwEY5Ccz
         swcCs1HzdD24Q7Qa1K7MxEQjY2pnKFCQH7iwjloOtVrQvMyBWLpB69I035fQfbDkGvYq
         Azt6tg9EUUpS3GYOoqDXcma6uem547lGEbakQs97EV97hW7bIIEmSy8+RXqZEGzJaqdS
         lt2BCSlgXcHMy0u2K1PhMW+I0YOjjMATu+0fiujm+XqTUPaHUs8vspW5KrT3TOiUtiVt
         tpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+jKx/KylEoEPXl1ksUY+ZSMBN+gdF7Yb4Tzz+/gCV1U=;
        b=X8zP0qTZCrB+y14gsdmpF7UPQYyG88xCMI8v51u4WqpIMy/L2Wkh+lpTV54PbHSC7H
         gU0DmC4fEIu7Ky6W8QVQ/b9hRmFS40fI0+Hvbws6LLNqoaCdgmR48c+He+yj1iYu9Xft
         GWszOtqQKL6FMo+switPIrKVMn80A1GDVEYokm5l/wRusLumLDDZF2VrwXAd7nEc3dEn
         eYkhGIpZqg+1n5sJmkkikPh1u24xDZmwHz0PVlJuBuiIS7Y+9gJ6dwsazg7Fna4hLCYL
         i/zDtzGNJ8FkN8KLL35vGWmQmVt4ruUVnRtcZuWEr8O6wiASa1Rh2h6EYIPygfBuDG0E
         h3gw==
X-Gm-Message-State: AOAM532eXjl3xbA/0BVHli+FwMwDcPr5YWj7JdveZSKfns6aX4HND+Ki
        6f91JLjV96IeR7cV4NI/3EzCA4O0YrHCcA==
X-Google-Smtp-Source: ABdhPJz52VhAEKWyFtzl3tertRvZQaNMscL7PdRyAPbHmG+svElXy0IuKgRYepVwfhVQQuHhQJzTww==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr3953962wmg.153.1605786179367;
        Thu, 19 Nov 2020 03:42:59 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 51/59] rtc: ds1216: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:41 +0100
Message-Id: <20201119114149.4117-52-brgl@bgdev.pl>
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
 drivers/rtc/rtc-ds1216.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1216.c b/drivers/rtc/rtc-ds1216.c
index 7eeb3f359de8..594f39d4e916 100644
--- a/drivers/rtc/rtc-ds1216.c
+++ b/drivers/rtc/rtc-ds1216.c
@@ -150,14 +150,16 @@ static int __init ds1216_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->ioaddr))
 		return PTR_ERR(priv->ioaddr);
 
-	priv->rtc = devm_rtc_device_register(&pdev->dev, "ds1216",
-					&ds1216_rtc_ops, THIS_MODULE);
+	priv->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(priv->rtc))
 		return PTR_ERR(priv->rtc);
 
+	priv->rtc->ops = &ds1216_rtc_ops;
+
 	/* dummy read to get clock into a known state */
 	ds1216_read(priv->ioaddr, dummy);
-	return 0;
+
+	return devm_rtc_register_device(priv->rtc);
 }
 
 static struct platform_driver ds1216_rtc_platform_driver = {
-- 
2.29.1

