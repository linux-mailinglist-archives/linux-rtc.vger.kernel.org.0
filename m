Return-Path: <linux-rtc+bounces-54-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E977BC77B
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 14:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA87281669
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 12:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE5D1643A;
	Sat,  7 Oct 2023 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9OLyJmU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6802C1F5F6
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 12:30:58 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2341C6
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 05:30:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c135cf2459so34975651fa.0
        for <linux-rtc@vger.kernel.org>; Sat, 07 Oct 2023 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696681852; x=1697286652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLPFclkATy4LIwppN+u/n/AESvBYT+nNmBG9F7Vienk=;
        b=W9OLyJmU3Ve9iNg8C/RatCORpDZoC4fMk+WSRNFA23rBojAwg421BgmDtt1QjiihIP
         JaSO2YlMWsYdyvbF/aFlyCuKIvRc+/s210RnvkON5IJOH2hmsJt6U4SYTcw+/GYhUNnK
         GtBF8+ppOucZC3XnIt0QcRi9upjzAPN/RWWjkVxIMD/XttHjD5FH906qYH/SkOJOUCqg
         fJM/TApyRvhSDqVamf75xJ9ukmS9pIOjJjCIVDOR+4zJ2zMVkWNSmbf3wkJ5NZUln+Gp
         kdRP7pWECRx+GFfPsY2CsMqEfS6CrHmudJ6RJD1hn9TOQGnj3eoduUcLYuDk645JiWde
         ONng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696681852; x=1697286652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLPFclkATy4LIwppN+u/n/AESvBYT+nNmBG9F7Vienk=;
        b=R6igDPX6ABNPf4agqwwfMwDmAmD4PLlIYq3eZ45UUI7SdkJMa/UK3K7zst2NeBlQ1C
         veoM1FFdqHIpMPwrrMXGP0uK9NYVBCogsf1WKb5hjle1gdmurqG/xCH5q7OB9KQYTmwd
         vAd4R7/op+CrQELOvpcWwnJEZD7yVTBqVJ9dkSplZYSaCu8pQb1psDpyhxxJ9xDyiD4z
         fJsFqmayYfLCzD4AAxMH9ieY+G+l5Lt/SDnZHEYnfalqrholN0wlkeCv6y5c9hJ75qJR
         voTDxiiC8a7vfH2wYlEkuvDWjeCt/cq00HdbH0nSsciB4HnPNdIrHXvOkcEOKPwFg8pK
         6/Ug==
X-Gm-Message-State: AOJu0YwhD8wvqYKv9tEXY9o19KnQ1q5aLz/9Eo7/+pqI7oOt+0Q8ftG3
	UuHYTMDyB5Fr+pQqcwgdRm15tKXxevWC/sZMxl0=
X-Google-Smtp-Source: AGHT+IFfVwOKbEvfCSN6p85x/+ek9Cp7A2gMPeASsX4kzVNHmRMBMp8jA/k+CbOdx3BU+9aXusB9/w==
X-Received: by 2002:a05:6512:531:b0:4fd:fabf:b6ee with SMTP id o17-20020a056512053100b004fdfabfb6eemr8753564lfc.9.1696681851775;
        Sat, 07 Oct 2023 05:30:51 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 28-20020ac25f5c000000b005068d6de988sm410569lfz.226.2023.10.07.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 05:30:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 07 Oct 2023 14:30:50 +0200
Subject: [PATCH v2 2/2] rtc: rtc7301: Support byte-addressed IO
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231007-rtc-7301-regwidth-v2-2-c913aa95f666@linaro.org>
References: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
In-Reply-To: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, 
 Howard Harte <hharte@magicandroidapps.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The old RTC7301 driver in OpenWrt used byte access, but the
current mainline Linux driver uses 32bit word access.

Make this configurable using device properties using the
standard property "reg-io-width" in e.g. device tree.

This is needed for the USRobotics USR8200 which has the
chip connected using byte accesses.

Debugging and testing by Howard Harte.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/rtc/rtc-r7301.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index 5dbaeb7af648..ef913cf8593f 100644
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
+ * expose them as simply consecutive bytes.
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
@@ -366,8 +380,25 @@ static int __init rtc7301_rtc_probe(struct platform_device *dev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
+	ret = device_property_read_u32(&dev->dev, "reg-io-width", &val);
+	if (ret)
+		/* Default to 32bit accesses */
+		val = 4;
+
+	switch (val) {
+	case 1:
+		mapconf = &rtc7301_regmap_8_config;
+		break;
+	case 4:
+		mapconf = &rtc7301_regmap_32_config;
+		break;
+	default:
+		dev_err(&dev->dev, "invalid reg-io-width %d\n", val);
+		return -EINVAL;
+	}
+
 	priv->regmap = devm_regmap_init_mmio(&dev->dev, regs,
-					     &rtc7301_regmap_config);
+					     mapconf);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 

-- 
2.41.0


