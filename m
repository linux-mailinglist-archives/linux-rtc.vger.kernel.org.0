Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E93E1F0D41
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2020 19:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgFGRGm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 13:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgFGRGm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jun 2020 13:06:42 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2F0C08C5C3
        for <linux-rtc@vger.kernel.org>; Sun,  7 Jun 2020 10:06:42 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id q8so15032984qkm.12
        for <linux-rtc@vger.kernel.org>; Sun, 07 Jun 2020 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h6tnPz3vD6ei00z1shSU5wFG1bicDY0zKYMBA+QbHEY=;
        b=b9mV4d36Bop8n54Vauh8HvizL/jRbMLzgFA8viIwjqIHT20AnIG96vUAxyqWYk0NM3
         fPCtorYsySloOX2l0Hkjm3YRVsZ9jU0Wi72sEKb5wg34uPpvEub62T0Uu+eUYYHHtSRh
         PNfUtnHJFNMxAIdV+zKbMnBQvyzZziQzUB+g1nZIxrEVPx7+0HL3p1FnTeIdqtVOnI+9
         xpLfeckbPrKTb0cv7/gSgNJCTSrBHVjpNen1DRAnpia6gzGVvA6ASv28Zxm3MxyNB6yb
         gIa6aP4sfDF7uhEk/1yporBWL5j8DNeL+0zGhm1VekNBdgOvM6VByZCkvr+e+2jLM5VY
         nuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6tnPz3vD6ei00z1shSU5wFG1bicDY0zKYMBA+QbHEY=;
        b=iIeT0aLxSk9+JcbFPoAMS3u1bmL7ISkqcNEiLRiuiV8LlVirA1Im5ta5AiY7Za3X90
         6K+aD8C6AKSjikQWNecgLY3jfB6uCHcKW2PH+k9iYGqjiFt6KLwXbfp/QqZaxtWaTz1T
         zQGFhpPdBF1jAippPeUH6MhL+E/B05dNOIwJtGY4faMdQ8RBpUfsh5OoVHTIkbijUeTz
         pao8UuwZi8UFwrb93XJpD4qflxxpVfw/BUzlR9/VDkQsXH1lvcghjALys72VLo7pqn0v
         p1aaf2Ow85blXGbGUtLEt8+y2UAkcmsbPZ5p5MhESz+Nsb/N42zi4DEcy0b9jzblhNmQ
         uxvw==
X-Gm-Message-State: AOAM5324SpYAlxKccXWpcNdnKlMkSP7yVcJrqLZ2NJIBZwPKY2Az4/iw
        pruVxl6m1smKQMiS685eGZhWBXbV
X-Google-Smtp-Source: ABdhPJz/RxYqn2t2kJMO7X5oYdiYmWMqcAln3vCyOR8nB0WOU2K6/8HeoAxCInZVlRRhz29bxHfbpg==
X-Received: by 2002:a05:620a:201b:: with SMTP id c27mr9957053qka.363.1591549601373;
        Sun, 07 Jun 2020 10:06:41 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p203sm5047088qke.132.2020.06.07.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 10:06:40 -0700 (PDT)
From:   liambeguin@gmail.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH 1/3] rtc: pcf2127: add pca2129 device id
Date:   Sun,  7 Jun 2020 13:06:08 -0400
Message-Id: <20200607170610.24534-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200607170610.24534-1-liambeguin@gmail.com>
References: <20200607170610.24534-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

From: Liam Beguin <lvb@xiphos.com>

The PCA2129 is the automotive grade version of the PCF2129.
add it to the list of compatibles.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-pcf2127.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4e50d6768f13..396a1144a213 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -546,6 +546,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 static const struct of_device_id pcf2127_of_match[] = {
 	{ .compatible = "nxp,pcf2127" },
 	{ .compatible = "nxp,pcf2129" },
+	{ .compatible = "nxp,pca2129" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf2127_of_match);
@@ -656,6 +657,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 static const struct i2c_device_id pcf2127_i2c_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
@@ -720,6 +722,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 static const struct spi_device_id pcf2127_spi_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
-- 
2.27.0

