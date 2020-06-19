Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CAC2000FC
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2020 06:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgFSEMA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jun 2020 00:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFSEL7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Jun 2020 00:11:59 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74275C0613EE
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2020 21:11:59 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id g11so3873225qvs.2
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2020 21:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOLl3xFNB89z1p+M6Y2anM3in6ooVnaRmuZVTEMh6HU=;
        b=WD+gM0SugF6Mfs3aMLjkuOfEZ2+P37Q/XBKz4I6lw5VDM5YCy8m+5/z4lgj0k1ZqEh
         Vvo/Uwbxn+KJj7qO8kB8dB08+8IzC1lfo75KSv/D5zFgltybguEYZbIGPqmz5HuYkYm4
         saui1A0oTwO+6n5LNr713kedEy7+mnOksaHrrD9CCOas9bV2DcrSlcIxynw7YfXVdGiI
         3vCDK69Bh65xblXLh9x8zWSF+tWm2aD5wlcphh9vwQPvXO2s0p/1Q/imMyZK+H6zQ6p8
         2Jb07NkV8IbqfLRQDxqnpoH7PrYp3JGQLnnvBDksQib6J37FjzVN7vj2BbnveUgWPxij
         Jlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOLl3xFNB89z1p+M6Y2anM3in6ooVnaRmuZVTEMh6HU=;
        b=Xx0oB3m9reLukWe7daUzRXmU+by7hoF8vugu3tVuR2ivDIy+G/aqv0LcM34zHlZASU
         O5LCl0n2K0ZlLXwBCtuksdHMvFX22D4d2Q2NHnhl9Q25T4f2KfZ9GGVX+BGkE/LffG48
         fwT6urbKvr2XsNCwNM2PlKKz9iC9ZaP2kMMbznZ+Ugk+Jd3a/xzDNKcHAo5TYf1ZMu7C
         S95QOkhvlRwYd/imOK94ww0sVFynvjspr78H3U0PUKaYq7aXe9qKKAjblYy4sac/JazG
         aGOzaOJ4VL7Wx+d8im6aKAii4TF2cbo2kkYjsXuqyLS+EjyRso0CHjcigPTtsas1Ssms
         Y6ww==
X-Gm-Message-State: AOAM530YOyvl9ZCS22rI+RP0Q1oodWAi2sMl3P7Q3/vOumyealLgyQIz
        F18cWN5tI6RjKrquUMMD4HKxdv0L
X-Google-Smtp-Source: ABdhPJz2k6k6yjgkXPDye6B7Jzwz2G/bBU4b1B1bDaDI+ymxQpJ5bMYUaHHFdwbNXwG2dy/0t6wkpg==
X-Received: by 2002:a05:6214:922:: with SMTP id dk2mr7100712qvb.87.1592539918749;
        Thu, 18 Jun 2020 21:11:58 -0700 (PDT)
Received: from atris.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id k22sm5425765qke.33.2020.06.18.21.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 21:11:58 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v3 1/2] rtc: pcf2127: add pca2129 device id
Date:   Fri, 19 Jun 2020 00:11:44 -0400
Message-Id: <20200619041145.1882-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619041145.1882-1-liambeguin@gmail.com>
References: <20200619041145.1882-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

The PCA2129 is the automotive grade version of the PCF2129.
add it to the list of compatibles.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
Changes since v1:
- Document new compatible string for the pca2129

Changes since v2:
- None

 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 drivers/rtc/rtc-pcf2127.c                              | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 18cb456752f6..c7d14de214c4 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -52,6 +52,8 @@ properties:
       - nxp,pcf2127
       # Real-time clock
       - nxp,pcf2129
+      # Real-time clock
+      - nxp,pca2129
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c5670776c68..4accee09bfad 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -553,6 +553,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 static const struct of_device_id pcf2127_of_match[] = {
 	{ .compatible = "nxp,pcf2127" },
 	{ .compatible = "nxp,pcf2129" },
+	{ .compatible = "nxp,pca2129" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf2127_of_match);
@@ -664,6 +665,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 static const struct i2c_device_id pcf2127_i2c_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
@@ -729,6 +731,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 static const struct spi_device_id pcf2127_spi_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
-- 
2.27.0

