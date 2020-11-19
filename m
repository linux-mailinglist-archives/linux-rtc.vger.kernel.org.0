Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B492B91BE
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgKSLrA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbgKSLm1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:27 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BC8C061A04
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:24 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c9so6870648wml.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D+F/vslCkoMlgK6AevmyT7Am1/w2NuFk/P8bU7WWRdY=;
        b=QigWrsxbi5uTIexkJUp/ZLckqd3mzs89FP3S9j/0dlF1dVsFZ9sbO9SBb3DdLKO2nC
         +ei29M1XTdfAvcWi16jPOcWxupihz+dtO4CCO1wq2kNVNkG75dkJomOWeXbHD3vG5EBZ
         IL1EdLu2y5/e1mkLJUa9EbR/Cjxbe7QcGMaOsjsH7OHtRJCyrNVUGeWLvVUWb0L8k+lw
         hWrR51k7AOwMyzQo8MC5T7afWzr67uyecbCu0OTIDqq6Jwc1YWPn5NSq7r6JD0zFuzS6
         whPZQng5KGahpatBPYOVwp/l4Fq1ND6mvi+F+9lYHmrk9QKHGWW/gxOMOuqfTHZCtNU8
         IaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+F/vslCkoMlgK6AevmyT7Am1/w2NuFk/P8bU7WWRdY=;
        b=X5Jqy9JqqogmCS2WXTzcQnXxQZ1VuogOYc7zUUvDwqQEaVXh2s1ttG6i7gIuxZEtRh
         wYUwyYNaehOEalDxfw4ZzTcyWt2PTI3QKBTYuj5ydhU2Co/UY19eWEdzUr4siPrD8izP
         aJw0VKn92mn5DabKRsRtHmzkN323vEd58vlOKa3JMwMmyPAsG9YWzsLBEJBQ8p+R2/lW
         AC/Px7nxU71CQ5+dz5drh7FsmMvMnwdVuo7TwTrCdGU4ZL6CAfZA/bYCxAS/R0y7FTJV
         M/Yb1XlJAfl/vD4eDumXBtn16xo/LsEuG+zliih5VBtBDP9pIjWl8Yq1L+SKDXjo3ZE2
         g1HA==
X-Gm-Message-State: AOAM530UMN+rvzlakINtgSfgLd0jWa2nIFVmRPAmnjARzg7dy6MAmy6H
        R1nmTxqSpTH1uMb+OTyXePQQecLyf+lJIg==
X-Google-Smtp-Source: ABdhPJxgDPdi22CdXYkILY9RZGnNeE/BFeJIABZ+aJjeayxO26J5PhoaMbq6kDCxwDEnMaaQI5FBwA==
X-Received: by 2002:a1c:5f08:: with SMTP id t8mr4033215wmb.84.1605786143306;
        Thu, 19 Nov 2020 03:42:23 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 18/59] rtc: max6916: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:08 +0100
Message-Id: <20201119114149.4117-19-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max6916.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-max6916.c b/drivers/rtc/rtc-max6916.c
index e72e768ab8ff..06e98d6351ee 100644
--- a/drivers/rtc/rtc-max6916.c
+++ b/drivers/rtc/rtc-max6916.c
@@ -137,14 +137,14 @@ static int max6916_probe(struct spi_device *spi)
 	max6916_read_reg(&spi->dev, MAX6916_STATUS_REG, &data);
 	dev_info(&spi->dev, "MAX6916 RTC Status Reg = 0x%02x\n", data);
 
-	rtc = devm_rtc_device_register(&spi->dev, "max6916",
-				       &max6916_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &max6916_rtc_ops;
 	spi_set_drvdata(spi, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static struct spi_driver max6916_driver = {
-- 
2.29.1

