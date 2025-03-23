Return-Path: <linux-rtc+bounces-3571-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D4A6D18D
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70BC116D76D
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1551C8604;
	Sun, 23 Mar 2025 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bn0jCS/R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB21C860D
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769571; cv=none; b=rvmcIIXDYGvo3yD1tkmRL7moVnf7falhTmD18dLWHDmw/YbstoHIzmmE1G4tlumEgBQbgdrmaV5QBKq8QfnwZ1p8JN2gYEMwsKQtWJUL5V2AceEyNP6yU20cQ+r4hpvVh/EC4qp7J2QShOh1A9fGb8AorSlwSlv7RSk53P/a59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769571; c=relaxed/simple;
	bh=rkPD/zJcnab9QOgG4eBd9kcunv90F+5fDLXXmd7T+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hg4tBr7CAea66/KM4Zf5N+pv4quvkdyCRl0RZztZthuc4vamG07UHEE33Y056Re9vW+PnJvL32dRqEwvv2/lQYLu2w9vVPaq96WBsu+bSVxMCPtp3t52u/XArrESRkn+2R+kf7WCVq+z42YszVHwDd2IAkSyz2tywjL3xjJAFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bn0jCS/R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso764023466b.0
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769566; x=1743374366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epweE/CfbfJt2xFB7j7q8NZbqQJAbZszVB23uUdGgMg=;
        b=Bn0jCS/Ra25KHxZJRN1n0qBrrfdaimM9cmptgXjqUNHI/Pq7FzwR0M1ikBvDjcATjo
         G4rkB0umCLBkvzv6XuA84/oJrJTGNtBFasqR3vJynx2TXl1Azy0QXemzMQF0Nns4iIK5
         vmaddux083dELXofhEuf2UpVYJcN488QBcQbQ619lnaLFCh8yqIUFRdwZT9XhDYsGnv3
         jpR8N02h4yAtZmbTDV6FmO8IaLPKVrUizt6f5e15oaADerSpfcBKm/UdTbvryoLijl0D
         G1MmPo3WnqyUcyntEzG8OcyYBd4HsXzbU9WI/6VGwhxpejvg1L3aYFeTRAQTG0Z1ks2Y
         3BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769566; x=1743374366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epweE/CfbfJt2xFB7j7q8NZbqQJAbZszVB23uUdGgMg=;
        b=SknGlZs97kfIAUXEOr4L0G7B2Kq7C7LWA5yuJO9yjJSwgbs/27Ul1NL7LlOahTSwra
         cs36GVV4gfkHBYzMzlqUXznlmmcSv400kaWhaGQVBokp6Q06HgzGRePF/Ed12fBpMQ6G
         ykg7HPMQWOQUeQISp14mKbowOUdeJch5ITsddiK9BO9Sf173zUKlzh0CI0QG2rpNqnRZ
         CPf3a7LknqDCNKnwgXIkgrImgs2JTV5VvQgB0mb9WkzCwhRDkCtqHBvaGHQPc1L0QWuq
         04pYffgINBA5KDdCnKA2wNJWpdnNBV1RON7pn7CRRj7c0BXRSYvK1zPHfr4aTVr/6rgG
         nsLg==
X-Forwarded-Encrypted: i=1; AJvYcCWz0qFLExjLHmN/5XPxf8Oy0GH7CfVUW36ftuwqPWgiaCzPaRQ19dfDb85+9OVFSEMmmrbC/lNab6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3x6dIqPe2NB+1WnUClh47Ow1+S4Esem8KDXTBmJarzEnm8x5
	6v+KeconWc4+qYpWKei46dIuRTef+YAITjKJQZXDLEozan0oS0XwOfbpyujqHYg=
X-Gm-Gg: ASbGnctzoYBr3UNNPOJba+ChOCkW/DgNQ6TBRBzJKUH277LRBk89vI1XdQn8JmrU3Wh
	/LlLHAg/V9tZaEQ7ncAF1vP+WP4h3RVwoIZmTiTpy5459inT46O4FXgnjz/Yu2EjVMQ+NwOjm3H
	igvu5vYiVHRVPG9ucnbLLKpiyJDWoHTn9ttED9hY41NqHa502Z7SExBISunoJAlzKJ9yWWO4Vt8
	B7y7fW+SKfnsSOfT/ct/ThNLRUvsdc/fL3muNij5bF+fkeW5ryWydwO34weBlQwngNfktTLFXG6
	sNxA4he4Zol4z7l5FRM0eb6dzh9jWW8IGH40f79M4cW9Nv/GIVhTGTRCx7oOzj/HJ8FSaDdce5x
	jQuhenkSWsmKRCGoBPwulDzpvfeUk
X-Google-Smtp-Source: AGHT+IFxrAKkMvESpg2DzD65IhmLmaroltgGQ5JYq8gpBxP70jAXR5CPVBPl8pc6WMyqqMZfFh61ag==
X-Received: by 2002:a17:907:7f22:b0:ac3:2a54:875d with SMTP id a640c23a62f3a-ac3f251b8a8mr1007451366b.36.1742769566602;
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:21 +0000
Subject: [PATCH 05/34] mfd: sec: sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-5-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.395.g12beb8f557-goog


