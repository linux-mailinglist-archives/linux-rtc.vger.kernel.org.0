Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADDE2B9175
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgKSLn6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgKSLnF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:05 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4909FC061A53
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:04 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p1so6040966wrf.12
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kj1XFCNYXRV/njfVjs4Ag/WpgjQdsavMbI7mVJToB1A=;
        b=u5YkmIui8TBX84E4s9zs9lIfaV4McIitjL2qgwQDyEUusXOmQ5iRJ7zufbqR/D270d
         E2KlJmesqjo8seQvnd/JWUEuGBFOz8Ysp/4LBlEBmyJbZXSDGda7u4aqFVeSjJ9xAdXM
         opxD6g4fzlpUPJqTmtWU5wShQdqr+gGDGRGJKQC0Gik1CHaUr2Hilorv6Zymb6L19JHU
         4Z4dVL+QZFET2dgIaULQFif0NZbvPb6IFLi9Fh0UpucLlzMb6qC/jj2PhyJYoYISvZMM
         iqMtBiLFo+VzyRRMuSCcpYXJHAtrzR5Ie/z8/+iEL0GQXELlp7p9Z7/AO5a5U7AzJ+ui
         U8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kj1XFCNYXRV/njfVjs4Ag/WpgjQdsavMbI7mVJToB1A=;
        b=GZ6phsIFMBzqfJLrPYFVBTy8pj3xZJK2LFnwdjHVNN6Wlh23fZR7/9vQR/KGdZTmZ5
         WkJ2DCX3HIsvy6yysBBbFY2seFMbs5LSh2RQfN0g2K6kdE4TVJeDaJkIlofX6vfI8cHl
         5zuHxwYza0yu7USrQhjjHmHmjvwsF4ZiloqxpD4AhBz9WOf3V1phyyMoIErXh+YPMMjH
         KzwZ0lntGcJO/yw4HzfAXFy2VpLWYYmXE2OaW7YqfY+nDnv7Ot6uqL/xBTJ/oWgEGNzz
         KUeoKrLPpvMnEHE/kIDk+gr0SNEyvrXQ1QUucC8PWJsiSjp+dVCbfbNAAwNqpDrYz8KY
         4oAQ==
X-Gm-Message-State: AOAM533WyWra+nuvkh766ogiGySGM/9yA4n9/5Uh98nWTcTAcqOqQSAz
        2a1bXfGgxzH4cK94//6uUQurjg==
X-Google-Smtp-Source: ABdhPJymR6wIpmdhr2puj0GgaV9PCpn+UpYgKNv7hGqyrNRWRVBxnz7uhg25EYpNFI/bQZtuoCLd0g==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr10472174wrn.39.1605786182868;
        Thu, 19 Nov 2020 03:43:02 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:02 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 54/59] rtc: fm3130: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:44 +0100
Message-Id: <20201119114149.4117-55-brgl@bgdev.pl>
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

While at it: remove unnecessary goto label.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-fm3130.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index 677ec2da13d8..29e296f2faab 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -344,7 +344,6 @@ static int fm3130_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct fm3130		*fm3130;
-	int			err = -ENODEV;
 	int			tmp;
 	struct i2c_adapter	*adapter = client->adapter;
 
@@ -390,8 +389,7 @@ static int fm3130_probe(struct i2c_client *client,
 	tmp = i2c_transfer(adapter, fm3130->msg, 4);
 	if (tmp != 4) {
 		dev_dbg(&client->dev, "read error %d\n", tmp);
-		err = -EIO;
-		goto exit_free;
+		return -EIO;
 	}
 
 	fm3130->regs[FM3130_RTC_CONTROL] =
@@ -501,17 +499,13 @@ static int fm3130_probe(struct i2c_client *client,
 
 	/* We won't bail out here because we just got invalid data.
 	   Time setting from u-boot doesn't work anyway */
-	fm3130->rtc = devm_rtc_device_register(&client->dev, client->name,
-				&fm3130_rtc_ops, THIS_MODULE);
-	if (IS_ERR(fm3130->rtc)) {
-		err = PTR_ERR(fm3130->rtc);
-		dev_err(&client->dev,
-			"unable to register the class device\n");
-		goto exit_free;
-	}
-	return 0;
-exit_free:
-	return err;
+	fm3130->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(fm3130->rtc))
+		return PTR_ERR(fm3130->rtc);
+
+	fm3130->rtc->ops = &fm3130_rtc_ops;
+
+	return devm_rtc_register_device(fm3130->rtc);
 }
 
 static struct i2c_driver fm3130_driver = {
-- 
2.29.1

