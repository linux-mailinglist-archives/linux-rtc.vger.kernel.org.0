Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449D42B9169
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgKSLnc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgKSLnH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:07 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DBCC061A04
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:07 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so6041201wrf.12
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/KBRlaFKGbe0xLBXMmc6glwV3M4cZcHY9cORvEW9Nw=;
        b=E9+h4fQeQczTxBc6rm0Z9Tjagek/wUuDp/EJygIf9sbee98ZCh9VfjZG1hILt+Uty7
         tpdvQCk9I9xtbIc5llhFcrvAt2uCBGAqN80YvUNEo1TRKO6GwP3hfRI9zzwk7R+T75MS
         peBBIO5tV4+kXS1JSWYsvZ4OGQoDszf7VslAkUBGAg5dGGtpiYgSxB6gl0BJLz9yrUma
         RRMf2vVb1or2009APoSc/CRHJ098YsFXLk962uG17747CjiUlbkZviSZs2u5MN4Trh1I
         XArk3aLr7ZYmMjT9wpRrVILgv5Vj2q8Mn5Kj9C6jEber1vvEJ+THENWxF5PhuH/u8IIW
         l9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/KBRlaFKGbe0xLBXMmc6glwV3M4cZcHY9cORvEW9Nw=;
        b=clUv11En2fRrBz7+xXNeWhI7tWu6xBEaHuKRyybOmwpQjs6PdQj0wsHFmEmZntrfud
         7AHDUEWvDb4fcreN0nafmoIy5mwUPsyHXiFCKsFwSgCNlIuU7Sw5OcXXO3iqmwai0BH5
         F/0jnyWK2uYQhuRz8HqXF8AXI1qven1Qy0/Ew1n9QyTM94HL/MECNVg946QkQTyJICu/
         f+blAQkOz7qiclmU+R/pCnnMPbdjTGDhuaD4XUayJooDSNT/tsyEMnJTLjbQ/wFYsaCV
         Gl/Mh46r/DAgIi32fgbjLpdJfPM+Pien+pvwsTo4GfLmgwbOXOjntKb/ntqsfJ+NJGjg
         UnAQ==
X-Gm-Message-State: AOAM532EIVKS+SmSvHQL3+agh/vhcxkebFElXA8ANRNKCSR0t/FlUk+i
        WhikvFBBung2pL8s2wGg3YaDeQ==
X-Google-Smtp-Source: ABdhPJy1R84q6TSGacEWcJ6YNL53nSDBm+4VPXV6/GVYPsIy/+H7OQmgRU0PVd/mk1B7EmaohYyyHQ==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr9683172wrr.295.1605786186137;
        Thu, 19 Nov 2020 03:43:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 57/59] rtc: as3722: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:47 +0100
Message-Id: <20201119114149.4117-58-brgl@bgdev.pl>
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
 drivers/rtc/rtc-as3722.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-as3722.c b/drivers/rtc/rtc-as3722.c
index 0f21af27f4cf..90e70279a5d4 100644
--- a/drivers/rtc/rtc-as3722.c
+++ b/drivers/rtc/rtc-as3722.c
@@ -189,14 +189,11 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	as3722_rtc->rtc = devm_rtc_device_register(&pdev->dev, "as3722-rtc",
-				&as3722_rtc_ops, THIS_MODULE);
-	if (IS_ERR(as3722_rtc->rtc)) {
-		ret = PTR_ERR(as3722_rtc->rtc);
-		dev_err(&pdev->dev, "RTC register failed: %d\n", ret);
-		return ret;
-	}
+	as3722_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(as3722_rtc->rtc))
+		return PTR_ERR(as3722_rtc->rtc);
 
+	as3722_rtc->rtc->ops = &as3722_rtc_ops;
 	as3722_rtc->alarm_irq = platform_get_irq(pdev, 0);
 	dev_info(&pdev->dev, "RTC interrupt %d\n", as3722_rtc->alarm_irq);
 
@@ -209,7 +206,8 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 	disable_irq(as3722_rtc->alarm_irq);
-	return 0;
+
+	return devm_rtc_register_device(as3722_rtc->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.29.1

