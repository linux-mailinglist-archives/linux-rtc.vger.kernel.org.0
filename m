Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6132B91A8
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgKSLqJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbgKSLmf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:35 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E805C061A54
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:35 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so6157130wrt.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LmdiGYWwSYXjsc+ZWeNt5koQ7cYqCpQf1IPaNGZ1VTI=;
        b=XAQ1Vw2Rve7mUsE1TMh/AB8znkvTYDB7MBAYeG+RvrruUCcOTSgEwNINk4nkQha/og
         qqyJIKCEPsNyzJhJNXG0qY9Cd0xfeNmkBT3PeXsKRZxjb85JaocBNLLQj+JpDywZ0upp
         6Ndi9cb5ARgd6bMTe5nOuR4BHEp1T5uJrHzkiWniQAqy0GhfmFQzQ094F/ppTrLyeV5V
         Gfs10+5LCrA/VFD2W65oQFTjyicYTbQNQNGPJ1E+Zr/Zrm/MdsZ3gQP+7qAoLXCixCcw
         2xV0rOek7x1lfzVL77ge1NAAZGSB7+KWThqvtx11qsGmePMHml/G3nSRw4IsUCtAPj13
         SgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LmdiGYWwSYXjsc+ZWeNt5koQ7cYqCpQf1IPaNGZ1VTI=;
        b=sIAViYcDas3bBQzbWoldBwyDwbeFra52YJQqAErm/hTwVidstYTxZAfgXWo4vF7ILE
         JuckTMoZiMmUfsYgFO2R1J8L8Etj4psv8uzYetmjmISGTCUw9l582D3DH6W48jiTgxwG
         nqKlDuBTaO2LiTjscdHzOx1bIHRWf1/CfiEG/7mRz/7FWz4bTz5FO0icx/qmWeIh9Y/S
         ZDfFTBriHgrsiAZdrFnELGq6oryOptMlWTcC4G84tLDyHRy5IICeYJfmvDt7Axke6rxM
         zqNycJWtJDxrxaceCxayQxb1aJOyJsLSMJd+Q0aaNTiSj2KI6/OTzzyJXk3J2fhofJ6V
         whUw==
X-Gm-Message-State: AOAM5313sluJPg8G0YyaI/jGDNveoJ/YNbuVFN1VYPZThir7qufbkNgN
        /r9EnnOdqSNnPzDfeYEU1l78jQ==
X-Google-Smtp-Source: ABdhPJy+58/Zp4C0RJeffwe4/AH5O4hz3YOj+Quit22j8AHKDuI9Lv3n/3w57ICMAySe0wqJN1Qfdg==
X-Received: by 2002:adf:bb92:: with SMTP id q18mr9497926wrg.315.1605786153991;
        Thu, 19 Nov 2020 03:42:33 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:33 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 28/59] rtc: ds1286: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:18 +0100
Message-Id: <20201119114149.4117-29-brgl@bgdev.pl>
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
 drivers/rtc/rtc-ds1286.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1286.c b/drivers/rtc/rtc-ds1286.c
index 7acf849d4902..0886ac9890c3 100644
--- a/drivers/rtc/rtc-ds1286.c
+++ b/drivers/rtc/rtc-ds1286.c
@@ -322,7 +322,6 @@ static const struct rtc_class_ops ds1286_ops = {
 
 static int ds1286_probe(struct platform_device *pdev)
 {
-	struct rtc_device *rtc;
 	struct ds1286_priv *priv;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct ds1286_priv), GFP_KERNEL);
@@ -335,12 +334,14 @@ static int ds1286_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
-	rtc = devm_rtc_device_register(&pdev->dev, "ds1286", &ds1286_ops,
-					THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-	priv->rtc = rtc;
-	return 0;
+
+	priv->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(priv->rtc))
+		return PTR_ERR(priv->rtc);
+
+	priv->rtc->ops = &ds1286_ops;
+
+	return devm_rtc_register_device(priv->rtc);
 }
 
 static struct platform_driver ds1286_platform_driver = {
-- 
2.29.1

