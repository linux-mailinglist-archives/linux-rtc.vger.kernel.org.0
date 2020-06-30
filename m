Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C9120EB87
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 04:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgF3Cmz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 22:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgF3Cmy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 22:42:54 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0063C061755
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:54 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l6so17300402qkc.6
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2ImtA55OJagGDZlnoMstIkdiImtofhKX1wBXe3GJCI=;
        b=dEhgJ3SIqDUsTs4Bt6SULKwOPx3h2uxpfKGaLpHg4yJkNqJhnp8AiGQgO7GhuczBqJ
         zrE4AB9Ooipx8TyGuK3SFNTwg+5vkrZlNqWl20/adgwqOFIqDormbg9qrsbfxuJGkNqq
         ChkUY9ZW/JpznKdW1VUgUC71bxCdI7frPqooM10S9A1wrxN6XwjWC7FFgrltSK9+vSlA
         5YFypc28se8YbU0O2j+r3V+VbXOQaDUlc9yWU1tR4WB/ruW2CpJVcIu8srbSrkMqRYvv
         qHwQG4h3eQSZs/ZLQyiJvLIXGPF9psAg1Cp29xwL5RFrbmLj5pCTKl4weZTkuFLDwYM2
         dLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2ImtA55OJagGDZlnoMstIkdiImtofhKX1wBXe3GJCI=;
        b=gUaiTw6kg7w0Dg2zF3dLhHMpdlkzmpF6ipgOd1Tmv3uB/rr8pPOnnMh+8Oq04zo3ip
         FcfAaXQxiPauEYdb2NP5+i7vCtn3oqixYRRLzn9YupclxF/wYyM8qFTX5bL4OTUjTUzA
         S0bZonN1yWdBmPhskfvOjde/M7QWBQRdvLU4vSHBc+iv9ZP+MqDV3R5mYdKUGg60jeG6
         s+iqSqwHatSiLTjzW2bBSPHZcRBGDQwMxOGktaEkhtrFmUV66SFpR4zVXwLllXtsSwZs
         Yf8xj2WrI0VrUUQvS5AnCDGOrEt+IvM0oBCc/4HZjHcoemNReinigAWgtvFwtvS+5Ygi
         SZxg==
X-Gm-Message-State: AOAM531VshaB6DwYm1UOMzrfo6SUph7hxDEXLvfC6cBoT6DqDQPRbKFv
        5koy8viaxP2ZByZZ1s6gUwQ=
X-Google-Smtp-Source: ABdhPJwIS0l+qOlDGj5uKx0hToS5z3TGu9gWfktWLHSW1+jQst7kjXoaSKfBYukI2Q9RDn2Wx9KJEw==
X-Received: by 2002:a37:6643:: with SMTP id a64mr17737646qkc.397.1593484973996;
        Mon, 29 Jun 2020 19:42:53 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p66sm1911185qkf.58.2020.06.29.19.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:42:53 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v4 1/2] rtc: pcf2127: add pca2129 device id
Date:   Mon, 29 Jun 2020 22:42:10 -0400
Message-Id: <20200630024211.12782-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630024211.12782-1-liambeguin@gmail.com>
References: <20200630024211.12782-1-liambeguin@gmail.com>
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
Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
Changes since v1:
- Document new compatible string for the pca2129

Changes since v2:
- None

Change since v3:
- Add Reviewed-by trailer

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

