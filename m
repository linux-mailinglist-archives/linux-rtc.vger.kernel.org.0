Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB62B91CC
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgKSLrn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgKSLmS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:18 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81287C061A4D
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:17 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so6059187wrb.9
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2yNpy/proxW4Hb+nFB5pPJfVOfJDXZ+qUUNtolqrB1I=;
        b=yjyUxObzb7k0OTA+7LiUIucY9q6pxV+jcTeC1uCYErFaTbF14qmhZGA7VbaO/UBtD+
         Z8DyWyj/zHpx3ibVHev8mx43hMZhoAVDH2AfDky6f0NOG/PiS2yHPkxjxIS2zfWwaxeW
         3ggwRSn/i8GV9l20iDp99zsmMg9h9R98LjHnkIHsskyNLlN7bVbdv6j9Jpaqh0qfZUIH
         3satMkbvqIgp/cinEc0qaBnq92r74jHay0Z+EbYaLQuxFxC/OAbSaI/6owH73bVROngf
         N1exWVmMkw+GF1boM80LmBruu/bZR9/aCtLuc590yGkAkInCxfAsy0W05nU8IKh99ift
         YeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2yNpy/proxW4Hb+nFB5pPJfVOfJDXZ+qUUNtolqrB1I=;
        b=EzX7bjYfRBZyQeGIz4EwxRAQOpzeHl/nEsl4SLbSarU2DoQBC8OhboL+q23TYgCdur
         SlR+Zi1Gg5V6aIHrCKdZCB97Z5FFrjANqbk7l0+kF/X+07RpLnVck0nw5End2VJKQhEp
         NKObGPiN0uKJxx+06zcElvb6mLweQXYBWMrj3L+4KAHzcDjFeakrZrcsgFlMTyOx16co
         ugsi2p/Dcy5f3p89NJn+POiInpop/1iV/+QcULna5BuypbUEG699svFGS3r+yWwmmRbp
         6tGbrX1+wtEunndCK/psIB9jrUw7AH2Al8MjTwHTgpmn43/BPW4XtNyr2pb8Dh6/PxkY
         Yafg==
X-Gm-Message-State: AOAM530Ki0J/H5z2v6rRyWZh9R4k81NtYn5BjtgU0+ZRCBbR1trgXcin
        XPym5qqP9Cs2oNr1jxrLhLNCWA==
X-Google-Smtp-Source: ABdhPJxE1aWjd7WWS/Z4VPzsIceqq8O+NZH80eTZ0OJSE3daXmLzToJN5X/V9VKfi08MKFW+qosczg==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr9725549wrq.294.1605786136347;
        Thu, 19 Nov 2020 03:42:16 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 11/59] rtc: efi: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:01 +0100
Message-Id: <20201119114149.4117-12-brgl@bgdev.pl>
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
 drivers/rtc/rtc-efi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index edb64debd173..47e79a54ecae 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -261,15 +261,15 @@ static int __init efi_rtc_probe(struct platform_device *dev)
 	if (efi.get_time(&eft, &cap) != EFI_SUCCESS)
 		return -ENODEV;
 
-	rtc = devm_rtc_device_register(&dev->dev, "rtc-efi", &efi_rtc_ops,
-					THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&dev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &efi_rtc_ops;
 	rtc->uie_unsupported = 1;
 	platform_set_drvdata(dev, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static struct platform_driver efi_rtc_driver = {
-- 
2.29.1

