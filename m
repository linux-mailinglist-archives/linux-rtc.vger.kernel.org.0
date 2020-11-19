Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8472B9165
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgKSLmZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgKSLmO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:14 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AA1C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:14 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so6460208wmb.2
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DovsDkO+V3xiJOyc8HtCKGDT2NBthj/53O/8I5sHshs=;
        b=swOB5hKc2ZKXgS6vofyOwszzlQLTvuDbsEuuT0JImSKst2Nk5IKEByW3ObfNP7MLlZ
         qM7gNWRGXJ6ratNMrzo2g/YhvAEp5Ira9Lm0CHbn/8KvaeB2ZUc23ES/ry0+5Em+EgKf
         w5kLF7htE5xOsI0xqyfdMSOtlr055laT050g3anAq5nBxy/CwgPwxugAdqA2VeY3EdKh
         JW3CzhnZz9rl5yZvCnlEuJ/Bu3pdQIhglS7k3aswTYbstRFBbWWlcaFNHLbS9Yv45gbs
         SeWSVPUcnDy4CCSWHku8Bo7QEw90FTPnoPsVaxmeK9xc+bhsCebuh/KuE9TMWQYap+jV
         oOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DovsDkO+V3xiJOyc8HtCKGDT2NBthj/53O/8I5sHshs=;
        b=tA5/e0coYIq5XcmSEa7sXfYFd+3GogOQ6L5cEVUdpwCgOiKpe1gx2WI4z53UEgu6v5
         0iNULy1yqCsfdbk05cpMEYtZSQQnrfUY4UWQnDfr20QgVHWPzLc1L3f3d0tN7IBtVF8i
         dzysnL93ec2Ic+ulXx7r0DKlulyMxjp7FbH9hll04E+DmTJ7VDI7IM9N3Og3vbxqdrMj
         hSuwThRlaZZVYQ/fHXenhJvmZHQYIJayEEh+z2J4AAvLBy+O/KmPqYUHjLHlOZ5Z+oC0
         4t+TDAr1QzL9Z9UrQEurSyXqC/7tyWnWIZn0PJuKPO6j2tys4EXA7eslzIoepkd+Kf1l
         /8gQ==
X-Gm-Message-State: AOAM533fWlXTKnjvSFcMOrXyaDE8hjulzCsdH8myOb3T+t+kLjG8Knoy
        kdSoeTg66ryE/xuUgT4YN/Hp2A==
X-Google-Smtp-Source: ABdhPJzhiggh6BkaEYWK0n/c0S7WrLywBlv1t8Z1PYlGc2u0xdO0zKYRzu+vRe5nS//hu7Zx+0jjuQ==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr4078409wmk.63.1605786133203;
        Thu, 19 Nov 2020 03:42:13 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 08/59] rtc: m48t35: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:58 +0100
Message-Id: <20201119114149.4117-9-brgl@bgdev.pl>
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
 drivers/rtc/rtc-m48t35.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-m48t35.c b/drivers/rtc/rtc-m48t35.c
index 92f19bf997b2..0f4a3cb1e1f0 100644
--- a/drivers/rtc/rtc-m48t35.c
+++ b/drivers/rtc/rtc-m48t35.c
@@ -173,9 +173,13 @@ static int m48t35_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	priv->rtc = devm_rtc_device_register(&pdev->dev, "m48t35",
-				  &m48t35_ops, THIS_MODULE);
-	return PTR_ERR_OR_ZERO(priv->rtc);
+	priv->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(priv->rtc))
+		return PTR_ERR(priv->rtc);
+
+	priv->rtc->ops = &m48t35_ops;
+
+	return devm_rtc_register_device(priv->rtc);
 }
 
 static struct platform_driver m48t35_platform_driver = {
-- 
2.29.1

