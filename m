Return-Path: <linux-rtc+bounces-3672-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED92A74ABA
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED2097A4376
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEAE19B3CB;
	Fri, 28 Mar 2025 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gy5zWocH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AEA18C322
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168662; cv=none; b=fXEMCYo8y0SkJDr6YObhr1LmZV61/25yQFCock41BEPZkQSyrMg7FIejtj4N2uJLttJHgeCzqAUygMCGghFVVucqJYlsqtKzso2ixSgsALeP3H9I/mYHA0y6gbV88yL/78N4ar/viq+29vZcwlnp1bDyaOwPpmywzqgHovDXe9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168662; c=relaxed/simple;
	bh=3ZuAbxXX06ozk3Tfj9ghYJsYuA9BYsa2OTFam90KOhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jE5LameQCmlbd1XTwiosgea+10XHf/6zsYno52Rp5ORW6mB/8NOivZ0WSxNRIo/znTn6amQMw08o3L4NiHcjd5MZAxi/ZpjzR8sj7vEir83EcklmVwm8HbchcQHY4z/LhNNfsMl4W9IZbdAhBx6bzQgD3ZGqIpuBqOEBmJetM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gy5zWocH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso3969634a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168657; x=1743773457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=gy5zWocH220gM4vlXnyEutGxwYpgc/qID+F7iJiZXWeSa911CfqC7WUGVZyHRTehOj
         44Yscmmvha849Lhy/yUnwQZaPdlgO0tBBFnNJgble93aTmVEO3+psdBFuvKLsyMEpOoH
         jbXg1Q9ghA/tVb1JlMr32vhiH4yLctdy7GB14eQuQdbN2cDXmMJuwaBFCzCd05mQRE+v
         VDJ8ABAGogSrMOAFVh8pvgPkVFudAtNxMKJ4WILmHfCn6SGPK9z/3ie1jOFQ7ocCi6wz
         aYKydGvJUh8Ot/jB5PuICpgHWtHRlbnGG9Xc2bfSBEs3StSQ4m7xEDo+nmpUMx2B1jIn
         Bleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168657; x=1743773457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=nxN0X3+D5lurClwGawCbTQT0WrUZNIb24yTKyVr2AmBxebPY/qwvPTZpWmbMxw9JzK
         GlCJFTzP9JB0b8EukGlXwFFCeAUtEeLlwVexIk+us+OfYyVYtAz90xmYKhPiT6Vd1wHv
         gWRNkVRE2iRcjM0xGIahunMsW4lWkuDQKwMPnLe2a+jneFvYC0ndD19Jcrhvlr+cdB7W
         1UTf/MasboJhruAqH18Vb/8fFarN6gQc1oA00VCUrHKSdbzaViv5K7PJ44oasJLmQ8sm
         1j96rPVHc1/9/L67ilTk/bSiyswX1W7cUn0QeUChKf/9E6H7MVUXsXo/49WO8iw8ayhQ
         dCYg==
X-Forwarded-Encrypted: i=1; AJvYcCUoc9lZk24yisjqQO7LRR2XBo1+e7DH7p43SFEVjvy0WvNVMYdhWqFg2jFar6WRMCqDIyXEhvwRJEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgPDs4z2wufMR/ASzxmZolcKGoKmeRlktZ6HN9K57b36lB1xd
	niKUjBRprR1lWGYD1u1D8h3vWMb/yTXc8td7WMbZbzn7VDaocT6GrQLdvhIybVE=
X-Gm-Gg: ASbGncsDD+AT2EYXkVEiJhiyXxTHnLeV67Crg5juzbYnwd5YDj6GGinvjfD0fhaxpKt
	lqzzAJGp1XfJdUwNWkDMfXX0ecj8+tkxroHorv9ibFHjqoRCDFU7NWl2fHvbPO1zaVUsHuOW7w8
	hNN6VP6brifcFmKrAlg9SRKqBKqMflg/vy1PoX2GaFwcTpcV9/Cc2w4HLiVRav4XR1RMWCQMToT
	nuNkmMiAtYOlr98PrKMBDfTXOq/z0D9ys6wJjIbh+lheGOiKOwmj7la3/JDZclvi0Zh6Uf3DiFR
	cC4BML0rqReKaOu5DIVSicXx0COUVBZLPrPrR4DqXIXbB+Xc73M2mDKuWX7w5ewfaSckjfU0iTC
	oKjw721OfQoNokfEyuEx7CyzS4Fc9
X-Google-Smtp-Source: AGHT+IErgpXJQXu0yTyDAgPw0TRfi7/5SsCs6OHgbYuTJRvfG8I41tDr8heCTVeJZ5ksC6WY2RfqLQ==
X-Received: by 2002:a05:6402:278d:b0:5ed:18dc:c0fb with SMTP id 4fb4d7f45d1cf-5ed8be0dec5mr7564036a12.0.1743168656590;
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:52 +0000
Subject: [PATCH v2 06/32] mfd: sec: update includes to add missing and
 remove superfluous ones
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-6-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 7 +++----
 drivers/mfd/sec-irq.c  | 5 ++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37..b12020c416aa8bf552f3d3b7829f6a38a773f674 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,9 +3,9 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,13 +17,12 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c..3ed2902c3a2634a6ea656d890ecea934053bd192 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -3,7 +3,10 @@
 // Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/device.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/dev_printk.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>

-- 
2.49.0.472.ge94155a9ec-goog


