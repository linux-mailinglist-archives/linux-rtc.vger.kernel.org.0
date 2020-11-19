Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791A92B9179
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgKSLoA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbgKSLnB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:01 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80426C061A4F
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:59 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id d142so6879927wmd.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4yYGhBhI6Ur+vp4EEN0lPa/rfwWyPscUr2NQJNq7HAM=;
        b=jNNh71QuCq87YhG+A2GzxRBbtp1kou6xzTHqjLV01RVkQQzMNrY7Llq62HgghvIzFD
         b7sNrzrgS3g9fI78o0Cz0HVYfFzSTVPYKyh4t0j+ez80d1lPE1mF2O+e4GclgGIGswGu
         CjaNW+R3g9kECiq2if631m2cuURkcQtY+WnB6N2au/ZFZ4BGAQvnmb0hrl0Q1yPmj85D
         9BP5cxElsya/OvGh6Ieitadn7+KFo2ZKFCHkQSboyGk477CNfwIDHP0NytlQOz6gPnCZ
         2QsWZrS0Hq3fX8rrHh09qenZoHAZaBIhAV53ZWZgBDoAE1PhbDWAcb3R21gY/T8KveQW
         txDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4yYGhBhI6Ur+vp4EEN0lPa/rfwWyPscUr2NQJNq7HAM=;
        b=gy1MkpbEQVxQGwHSSgdmOhbz0cUmfwwlZk5m1IOvKa8nqK6LbIyWQtMjKNtyP0SXJY
         AKtI1ioKpfOVkQsHtKpzGWin2d8edKAtpHiK51e+vi7ymLVkJoaNhFE27w6+TS/14Bdg
         9bL5heEB0WWLjW9evr6f0DfEyWVCDvMttsamXGTZWBB3bQ6A9OZpOaOTouaM2b1Y2vND
         JmJ+DSxYBFVKP0lsZ5FXvtWdKcyK5pSvkV/mQGdkEDN6sBWhz6WL5rC2nFYKmEZJlUlC
         VOVMQT7VSI1ot74jnUzmiAJcwQAMrVswhmW6oPmF+UMtNHCFTmVVmWmPH5Sv+yJHVhON
         lqLg==
X-Gm-Message-State: AOAM531Bkxt3t1+vlqrGI4vP91xIfMFM41tpPYeDMV5G5GRrspYjInVU
        IR87vOB/FAUZaNWemBpyeRUKUA==
X-Google-Smtp-Source: ABdhPJzPczaMMzxYXrX5OO2gKlwtxmZ3K4A9rbFO4hu8nL/Q8lwP7jPewFjV0fKA9rqo9gh8yjDjVA==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr4081594wmk.63.1605786178303;
        Thu, 19 Nov 2020 03:42:58 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:57 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 50/59] rtc: v3020: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:40 +0100
Message-Id: <20201119114149.4117-51-brgl@bgdev.pl>
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
 drivers/rtc/rtc-v3020.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-v3020.c b/drivers/rtc/rtc-v3020.c
index d2da92187d56..e947cd1538a9 100644
--- a/drivers/rtc/rtc-v3020.c
+++ b/drivers/rtc/rtc-v3020.c
@@ -329,13 +329,18 @@ static int rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->rtc = devm_rtc_device_register(&pdev->dev, "v3020",
-					&v3020_rtc_ops, THIS_MODULE);
+	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(chip->rtc)) {
 		retval = PTR_ERR(chip->rtc);
 		goto err_io;
 	}
 
+	chip->rtc->ops = &v3020_rtc_ops;
+
+	retval = devm_rtc_register_device(chip->rtc);
+	if (retval)
+		goto err_io;
+
 	return 0;
 
 err_io:
-- 
2.29.1

