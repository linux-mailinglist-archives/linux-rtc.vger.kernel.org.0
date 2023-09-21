Return-Path: <linux-rtc+bounces-4-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1C7A9FD3
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Sep 2023 22:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FFE51C209F7
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Sep 2023 20:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE98218C08;
	Thu, 21 Sep 2023 20:28:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B1182D1
	for <linux-rtc@vger.kernel.org>; Thu, 21 Sep 2023 20:28:13 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D07CAE257
	for <linux-rtc@vger.kernel.org>; Thu, 21 Sep 2023 13:27:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703a0453fso24047521fa.3
        for <linux-rtc@vger.kernel.org>; Thu, 21 Sep 2023 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695328065; x=1695932865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VjJPXsrYAqjFL9Nf8NIel2/K4dIRRk1OeUMv0TCyUw=;
        b=iIthuDwMR+kZ4eJDokD9KqDrlipW2CB4uJn6lYJRKpsMw1A5ClD4jgJKJruHg+XZGJ
         ck1/YJQdprY3PohMj/hj0SMw+acNGSYg/6z88+bKvea9T0si5gRET+7vtYSWFd8FyYKD
         acJrndxB6NAzsAlO2kYE2RRp2udomcwYjQ68V3tor5q2/dGWTkGUcKHEBDGf1VGT47Cr
         WSnK+UsZ2FDYNxKdiVTGk7Q5xKDtC2fmQeaTh8q4kEmWbLm4T3uXT0NdakevLv6EgKWJ
         s6q7eMQ+XS0D5J7SU0e0D5vM7Lk9rs+TQgX8JZdHAHV0FIBCXbGy2Z0/TMTsPbVD24A9
         ukBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328065; x=1695932865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VjJPXsrYAqjFL9Nf8NIel2/K4dIRRk1OeUMv0TCyUw=;
        b=u7LAedvRemnpni20awGNm+wR1NegvuaETccrk8tDUciZTLmo7Wa+gZ1v62MFxKNVvu
         Q7IB05Su4JhaifYc1NPoz9REJQMmyviQ45VJ+YrF6qZkSglluRKtD2If2EmhUUq15Zmb
         VeL52ZsVoJsLjDqFwNMjZVDVTs/9EimikGpQ0AZbyz5mqEhNWGMkiAsWJ4g1HQW4hL6/
         yfou+kWuq4AuUZjJd2ihAJR+MXXS6Q3ni8qST9e1wVwcnIsos/Qxz9130C/Lul40JhVL
         YNDmhQ7kBBf3NygT7OA7OrhJktccIyuFesKxYF1/LnvGPCRuxt4lYPUAsV26awrJopva
         Ph0g==
X-Gm-Message-State: AOJu0YxgbH2OeOh1i7HEV0Ki7LbMUjqRvTQqgrkPSIWHN89lYMBWzOrq
	fyxbsEv60KfaMdYx9VCc6vZG2Q==
X-Google-Smtp-Source: AGHT+IGFn7MokoBEuQEOUGLAbeRVMl3+32En/E5zHnp7dndZVa+xuHv7NpsZs6rGfY5goMVQP86kUA==
X-Received: by 2002:a2e:a404:0:b0:2be:5b09:553b with SMTP id p4-20020a2ea404000000b002be5b09553bmr6018229ljn.8.1695328065334;
        Thu, 21 Sep 2023 13:27:45 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id y2-20020a2eb002000000b002bcbc62dc22sm524892ljk.86.2023.09.21.13.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 13:27:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Sep 2023 22:27:43 +0200
Subject: [PATCH 2/2] rtc: rtc7301: Support byte-addressed IO
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-rtc-7301-regwidth-v1-2-1900556181bf@linaro.org>
References: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
In-Reply-To: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>
Cc: Jose Vasconcellos <jvasco@verizon.net>, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The old RTC7301 driver in OpenWrt used byte access, but the
current mainline Linux driver uses 32bit word access.

Make this configurable using device properties using the
standard property "reg-io-width" in e.g. device tree.

This is needed for the USRobotics USR8200 which has the
chip connected using byte accesses.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/rtc/rtc-r7301.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index 5dbaeb7af648..843e16966b65 100644
--- a/drivers/rtc/rtc-r7301.c
+++ b/drivers/rtc/rtc-r7301.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/delay.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
@@ -55,12 +56,23 @@ struct rtc7301_priv {
 	u8 bank;
 };
 
-static const struct regmap_config rtc7301_regmap_config = {
+/*
+ * When the device is memory-mapped, some platforms pack the registers into
+ * 32-bit access using the lower 8 bits at each 4-byte stride, while others
+ * expose them as simply consequitive bytes.
+ */
+static const struct regmap_config rtc7301_regmap_32_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.reg_stride = 4,
 };
 
+static const struct regmap_config rtc7301_regmap_8_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+};
+
 static u8 rtc7301_read(struct rtc7301_priv *priv, unsigned int reg)
 {
 	int reg_stride = regmap_get_reg_stride(priv->regmap);
@@ -356,7 +368,9 @@ static int __init rtc7301_rtc_probe(struct platform_device *dev)
 	void __iomem *regs;
 	struct rtc7301_priv *priv;
 	struct rtc_device *rtc;
+	static const struct regmap_config *mapconf;
 	int ret;
+	u32 val;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -366,8 +380,22 @@ static int __init rtc7301_rtc_probe(struct platform_device *dev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
+	ret = device_property_read_u32(&dev->dev, "reg-io-width", &val);
+	if (!ret)
+		/* Default to 32bit accesses */
+		val = 4;
+
+	switch (val) {
+	case 1:
+		mapconf = &rtc7301_regmap_8_config;
+		break;
+	case 4:
+	default:
+		mapconf = &rtc7301_regmap_32_config;
+	}
+
 	priv->regmap = devm_regmap_init_mmio(&dev->dev, regs,
-					     &rtc7301_regmap_config);
+					     mapconf);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 

-- 
2.41.0


