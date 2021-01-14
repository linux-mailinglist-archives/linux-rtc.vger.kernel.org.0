Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218832F5EA8
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbhANKXv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbhANKXu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 05:23:50 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06F1C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a12so5153569wrv.8
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hXpzk7OffqSrHKLaiatk3ajUz4KlXJ/8J4lT5+GFR1I=;
        b=cWyvmtck+Ru9tLEC4AUdUbsEbLrYRwRdybsVkqPeCM2TUIIjtN3OHHDW3IdyMudlYj
         5f2VFMwVgFP6SSaYv5z1jl2LZaiRZjVJ2k8DtX6P3hdDyKjFVK6q8hu379tYgf021QB5
         kswXTpkzhVU3ZKCbX0+krkA9oAiiAxEnDg7iPptBxcEROkJrpxV21vZnLH9Pje/eOUKB
         CT8SzZftfVBQi2Mo3LCIekP9hfjc1D2UDeafyPA2/pVp7zIjGU0ITBMaJ60RG2AoowoB
         lbrqpKeHqvhIvOfwMlV8Ph8uFput3brC3y6nCOAMFQWfryZl9PYBfU5qcXvGTD+Kt864
         V0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hXpzk7OffqSrHKLaiatk3ajUz4KlXJ/8J4lT5+GFR1I=;
        b=JHBPccVz/9F2n88IxCP3+woHBYH6ME1bEABotBia2mvSVqF50hLBxk9bIADGdsApvZ
         B2LfJ88xsAymPRNshLY7Aw/ojmdRyC1fY63FMXp6xaGGXieh+++qoKIXvHi25iFzAuh3
         ZpwQZ2C/2mWdsalGRMAXk6sG7SPwATJ4+ObJWfeGidGDOlZFIwVTw+pCZCD3gHb1HAYW
         pODiBJ1ZWuy/DlxVTeARH8BJzEs0iIFGNoSVDFGr3QUs0yFCDI9+DQLVZhDEpre0ofNZ
         LfZSB6WnZMaNcKooUZ2DQHDIf4E/MB8v9Ge889CZht34G6nHJC8qm9Gr4Zf39RjJsUNN
         Ms4Q==
X-Gm-Message-State: AOAM532BxJzE6g3ytCX/aOK33alLBXUOdLew9z4rAJugVYMje5EDafS8
        wMTpeE3mFOIuc4eoGnBHZnKACg==
X-Google-Smtp-Source: ABdhPJy9v8GD2EuiKN4Wxze5S5VeDveDx+zR3Z0+C06KqZtUssyCPZ/2SPqRiLUhxyOD++aqmszTDA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr6863125wrt.223.1610619743596;
        Thu, 14 Jan 2021 02:22:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l7sm2468467wmg.41.2021.01.14.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:22:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 1/3] rtc: s5m: select REGMAP_I2C
Date:   Thu, 14 Jan 2021 11:22:17 +0100
Message-Id: <20210114102219.23682-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210114102219.23682-1-brgl@bgdev.pl>
References: <20210114102219.23682-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The rtc-s5m uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Fixes: 959df7778bbd ("rtc: Enable compile testing for Maxim and Samsung drivers")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6123f9f4fbc9..e4bef40831c7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -692,6 +692,7 @@ config RTC_DRV_S5M
 	tristate "Samsung S2M/S5M series"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	select REGMAP_IRQ
+	select REGMAP_I2C
 	help
 	  If you say yes here you will get support for the
 	  RTC of Samsung S2MPS14 and S5M PMIC series.
-- 
2.29.1

