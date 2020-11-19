Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5884B2B9198
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgKSLpN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbgKSLmp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:45 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928DBC061A4B
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:43 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c198so4989835wmd.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vUDDxJ6QrhE79EdxKg7lI4ODKwN3GG0oY8e3KZqF1cI=;
        b=W9yL3wLhV/G+OiJXPV54u2ifo0jFlG0/aH5HY/bHsqrcFr0oj+akPzjgVMqg1/NMm1
         2bZ3eGH5wzWEbECWF/opI5i3kDqLjGrCljDlSwRiYzxOI6wD2dvQH0SFNgsECJZ+nug8
         ZBlW352oj1aFkQBP0kUQyUxbuPlJ2agNrPACq+jDFY/y3bUgp7b5U8TxA23Xdy6ev1ij
         O8Zc+27/yg5ciD44WNAsQJnGBWwfsNdUmwFchkcsol3KJGs2M48Llg31lqMsVtnTst7/
         TCRqL8T1PXPLBJqnA+iOZw7g9j/IYLiOzOFxO7++77t68b+0ibSHluv7Pw/H8CBjo0qD
         qd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUDDxJ6QrhE79EdxKg7lI4ODKwN3GG0oY8e3KZqF1cI=;
        b=hhpIGUZfrtzYqLbODKlSv6IWMkc5DJN5/wTZz93O6iomnwjxF+x+mFVxe3oQ3TAUyo
         FjSxesVShmtSElhf7qrMr+GOLLcCx34hvPuLDgTmTY5ZJkn1ThdOt+hUgMZ2BO1zqMsU
         RdXCQjgvGqaAP2AF2QZ7kgvN8c91eiIzjwG8e6XNzzjIKbFswN3iw24ltUVZCONEsEj5
         ivkatPqFD3jDSkpMXdW8yu4u9CMXzIpMvVQBBQlLszYYGOfx++f2K90tdrgeS2/mwb5o
         ZheTmWC+mLM2NbNYaTO2fgh2XmlXaok6tmpnn3N3rg5ZKOEXwUbqR/LGdGzYQSvCoZ3w
         lDfA==
X-Gm-Message-State: AOAM533uEerSOxZlC4fcw5XY17BplvPAlt6ybxg2HUGw+cXoyOTMcR7o
        gGH9YcC5iFHFcVPbLpYEBT0cvw==
X-Google-Smtp-Source: ABdhPJzdY3UgL7H9MVWSejzo3MvTbl+US/npXEvRSau4/Li6cWEG4X103a3Jj2cFdOao12InjVI3Wg==
X-Received: by 2002:a05:600c:2886:: with SMTP id g6mr4164141wmd.110.1605786162343;
        Thu, 19 Nov 2020 03:42:42 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 36/59] rtc: asm9260: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:26 +0100
Message-Id: <20201119114149.4117-37-brgl@bgdev.pl>
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
 drivers/rtc/rtc-asm9260.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index 3ab81cdec00b..c74455bce8b4 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -284,14 +284,14 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 	iowrite32(0, priv->iobase + HW_CIIR);
 	iowrite32(BM_AMR_OFF, priv->iobase + HW_AMR);
 
-	priv->rtc = devm_rtc_device_register(dev, dev_name(dev),
-					     &asm9260_rtc_ops, THIS_MODULE);
+	priv->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(priv->rtc)) {
 		ret = PTR_ERR(priv->rtc);
-		dev_err(dev, "Failed to register RTC device: %d\n", ret);
 		goto err_return;
 	}
 
+	priv->rtc->ops = &asm9260_rtc_ops;
+
 	ret = devm_request_threaded_irq(dev, irq_alarm, NULL,
 					asm9260_rtc_irq, IRQF_ONESHOT,
 					dev_name(dev), priv);
@@ -301,6 +301,10 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 		goto err_return;
 	}
 
+	ret = devm_rtc_register_device(priv->rtc);
+	if (ret)
+		goto err_return;
+
 	return 0;
 
 err_return:
-- 
2.29.1

