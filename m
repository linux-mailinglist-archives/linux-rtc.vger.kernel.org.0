Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4B82B91B9
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgKSLqn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbgKSLm3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:29 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30A6C061A49
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:28 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so6057937wrw.10
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hgVYTg0nBVKyzCt7mHcc2oQTRzr5HJj2f6v1HlorgCg=;
        b=svi+Oy3TZjzKeJL5CbOW6+70dGvk8nqim+BCGmR+utqOjN/f/GCqEcJ87yjWABwWCK
         T9box9RmE9PUD8F7CU2lhiDssVu+3IUFeve2t29EtIgKZTMJJNPCWUeIY9ANTI2gTHP6
         ZcOBPqbMlrIpdYqOPCucGcXOKuILkY7lp/h7ZVb4DUgVWCCXfFAhDb7t41m//SVBGDna
         mOz4Ve7o2yGuybEvSceWsPNAY73anioMTsqtAV1Qy/eANE55F0s2TRoQ7tt9WykxWQOa
         +oiqYI5eJaJOECtiUEV4Ae4olurx4//lT3cklbHfoqJjPm4ntsjMLVrq4PSQ9SjuPNGh
         3XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hgVYTg0nBVKyzCt7mHcc2oQTRzr5HJj2f6v1HlorgCg=;
        b=Xnjt8O2fiD51iGywLeTHyG7Wa1TLsVvfQRP6OC6w08fc+BMkTtsOGSkzEksz3B0zTU
         qcXB0clRiuMT+AgOwl/NBYne2Ryk1GxhaZ9fRD8S+SXe1+JTNSFGOPf/qwXnnyi4Ksyf
         EnQPSyKx2c/2aYTesqRT167CG/LTwJfCQtPNAnSlSZBrFPzTB5D1tGqBrr3Sx5Sn/VLz
         eqer2tFmGqhTSGTUV8u650HQYWiTtXr8VosIVAglpTA1bFEy4O4L79yo8iRZXka+kyvD
         F5EfOs5by/BK4WEVlruWIzFlt9XWhcClulwQ8dHJhq5AnMIiKg8fN8vYthNwqHuDwwyf
         cyZA==
X-Gm-Message-State: AOAM532JuW+/tQZeQnqqJ0fE+VPR+gxXLYGsKgN2F2QgI1378X6Bk4xM
        35RadHwwtLOhIx/AH4NWyeB3Gg==
X-Google-Smtp-Source: ABdhPJznB7SGU8Z5LOEiB7AqDuaRW73Ki7JDIIyTo2ZXqXmbWzTFKPT4vB61pCpLqo2P0ihs3Ff8Hg==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr9555698wrp.209.1605786147652;
        Thu, 19 Nov 2020 03:42:27 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 22/59] rtc: moxart: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:12 +0100
Message-Id: <20201119114149.4117-23-brgl@bgdev.pl>
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
 drivers/rtc/rtc-moxart.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-moxart.c b/drivers/rtc/rtc-moxart.c
index 6b24ac9e1cfa..f354bc8abecf 100644
--- a/drivers/rtc/rtc-moxart.c
+++ b/drivers/rtc/rtc-moxart.c
@@ -294,15 +294,13 @@ static int moxart_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	moxart_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-						   &moxart_rtc_ops,
-						   THIS_MODULE);
-	if (IS_ERR(moxart_rtc->rtc)) {
-		dev_err(&pdev->dev, "devm_rtc_device_register failed\n");
+	moxart_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(moxart_rtc->rtc))
 		return PTR_ERR(moxart_rtc->rtc);
-	}
 
-	return 0;
+	moxart_rtc->rtc->ops = &moxart_rtc_ops;
+
+	return devm_rtc_register_device(moxart_rtc->rtc);
 }
 
 static const struct of_device_id moxart_rtc_match[] = {
-- 
2.29.1

