Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E369F2B91A0
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgKSLpe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbgKSLml (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:41 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A88DC094240
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:40 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so6049612wrc.11
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HZesi5/RkEdX17j0U2jPHR63fjI784wDBzo60het7M=;
        b=gtO1Mg9SsOd2xtXMwLKr4oaOKk4DSgYsoLKdDihTJKVGR6TBjIAm4HNoZ6kvpu/auW
         fO2vcFOhbYeD0RTtR3azbX3zDCrY/QK4/EUd/vu7mme/u3cWNiwo4Yv5OdJt3/hbRdoH
         O/ObVb+fjjoT8DALli24odITfydZA1nY0dDLuiBFFGlaYeKEJ95A1XI1C4X9IjDbO4EA
         VnCe0mvyzB4Z5lfNj7jaI2k0E/z51mPDWOgkZcm6gcyuniW1/2EPsZG4zRweA2QBxpOJ
         //bXtoxzgDqDV2s2kg9TLBolESEcpT3aG8GJnwjpZ/bcBqRkTVSXJme/Erv5L3gtyBga
         h9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HZesi5/RkEdX17j0U2jPHR63fjI784wDBzo60het7M=;
        b=iue4MYG8x1vfhO7k+aOQ0IkAFnYyx/ZP1SDIHgyb9ocgHWo2oA1O/pq3WSuhSCl8gS
         iBMfRbN2sNTeeSxg/2h2z1j9F8DAJziFXF4X2SAPO5hkRslubtFan5te3IM9/vLL1pPH
         zDlYo0D9hsbXjpE8Uav1fYDBQMkZCgmmnSWde09nAnT4tLwfAu9AdVahm9XzdjymsNCE
         nwrlBryn1dFU8lg30J+dhK9J7mv0zBPF1Bp+qi7HYjULWVz0/3GtxQ0uZvzDIoAdbIa4
         2rmP1xav7+a/OPOsoL8Xrn8wsAu8PRRyj3g5IFlcGOkTXuntU3mWy3V/jhXjIRbnei8+
         /rhQ==
X-Gm-Message-State: AOAM531J35PCcjSgjKVPXab/Xyyh1ro+IcjmzEHj/ANU5cbAs6iylv+y
        v1P/YVmM+ZnHheW0yAz7q/8/LQ==
X-Google-Smtp-Source: ABdhPJy/KbEpttHi4TRpbrM7wQC5gMOpwpU4yYiiCxxsKHdeneodLgJraYZgf40C8CozJZz79/IYlg==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr9681087wrr.295.1605786158960;
        Thu, 19 Nov 2020 03:42:38 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 33/59] rtc: max6902: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:23 +0100
Message-Id: <20201119114149.4117-34-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max6902.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-max6902.c b/drivers/rtc/rtc-max6902.c
index daaeb6fb6c2d..9eed4ee05892 100644
--- a/drivers/rtc/rtc-max6902.c
+++ b/drivers/rtc/rtc-max6902.c
@@ -130,13 +130,14 @@ static int max6902_probe(struct spi_device *spi)
 	if (res != 0)
 		return res;
 
-	rtc = devm_rtc_device_register(&spi->dev, "max6902",
-				&max6902_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &max6902_rtc_ops;
 	spi_set_drvdata(spi, rtc);
-	return 0;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static struct spi_driver max6902_driver = {
-- 
2.29.1

