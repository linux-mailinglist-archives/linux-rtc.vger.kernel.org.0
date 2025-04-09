Return-Path: <linux-rtc+bounces-3863-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A5A83223
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F3247A4C50
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AADE21518F;
	Wed,  9 Apr 2025 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4nuTEp/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBB213E65
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231058; cv=none; b=U2e0O76Pe3fYwT4D9XVzMpAHRWAeNd2pyJ7ca8obkYlF2giCRT6xPlFZbRCYywWvxz0mD6g8Acf4qh4RFsoElY79DU+5If4u5wxfWE8uBxju4SVvRTGwpz+8pvrmfxFoPu0d4IYOMP1GPk+neSeF7OxoAxs+tvxi3SaSBIuwlHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231058; c=relaxed/simple;
	bh=oKsUOZVVIPJ0FZ1hRtLGE+U8FMFNMZ/Ejmjo0fiUpc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gyf+btNL8QtEJgWQ1g49XBgqxDN6IwKi4zlj4uul237KueHxKo1QLOierSzetfOBaVEd0h3nqmvn13wwl3pPOzTz9ZYoylwt4gaNK69ca1RL8gl3MlKBEycTJO0NaPA+/ywpFUm/8AeStbD5TV5XiwLHZPW5lArx44oNs2cRuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4nuTEp/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso191421a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=P4nuTEp//DciYDHu3tCnU+YAs5wD2T3rCQs86x6Ng0rrx0L/7ffORpOspH5UG/7NEM
         QWHNggAKGBBqqkE1AxHz+/BoNwjLje4MywJTwZX9btBfwOOpdlRvWv2vRxi7SjaRQGex
         be9G48KhEn4OaWVscU0ufcQeAgr01jFn4/dVrdkC4oTk3MAHwRhu/Vm76JGxBXiK/lMJ
         nlzDUbMBuO0KwAYXMGbv7cKXt+Yfac4J5ZgfRKKweWxXHc38OJ3pLKPG3NlErzthEayx
         +M8oj/jP7OWVn3KDCEYq4oBhxhHTw7AZLVxivOLq8h4dPahArkV7BccgZb26sWQoFwDF
         nvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=xCjUyZflUNgSls3fhFXihbQPQcJzDM5oAPcuZikCgPrinGAhk20XowVjfrnmDE+D/7
         vfo0eexXfrxppk3rMCk8VeSdBDNsSn0b43/zn1Oa1clmcTI4Is+2kWcXQFddR6YxFkL9
         PlbVGIaqRMkwMBxC5f+/Oz+ZrIm7EoZ7SPod7PHF3xTo/H1LPbW1Lnl+p0dsILJeePjL
         7eL+FML7jXhE42WajERYraQCjoOgsVDEiw8weqEKL8Fn6/cKSsXZq3fa6Qll22OkK5h4
         zdmgEOxbjP4sNC2exC/mWcT65Y6B0QbX9Oc3qUardHnHYySj7RNd6DZkR1S9smz/edMl
         tkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFmJCJdS4ks/QsiNvYZdg4qHOuegsna/kReI666VI88KEVdWkCSCPQYONYWdmGH1qo9aXjL55+NiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6VGSgixzGVhw9hxa1QoJE+zVDBreQZl+XH3zJzQ5Xv8NcQ8q4
	Ux3fPPjnYGkbOdbiP1vMGDUjxUjcbO/0tpdUReEhCMa6xCxdMASlGVQcx16Nv9E=
X-Gm-Gg: ASbGnctA3cUUGDSBpo2ixBKdPAEXnB2m9NaWOlhp2Y0ZIFHyGsN33wxE/kWdnfAtwAC
	DSG26igrQLg9GnXCfwU8i/i0xebAuY3W86vDR/V4pU02fup05Wrnp+kB6C/BDoV6SIpRvnUTi9H
	uzuF0wEN5Nigks12axjfkWzx34MfHNOTzi9Mx/3+QTWBy8I9CZ88W9P7Iud7D6YVF0fsnYRVE7R
	3bS2m6BMB9UUaiOjJPS5D53oX4t8Zfn7wpm7aFlS2tSTnUp2SuNfYGVDA+UJwlRTVuPAe0Nj2CG
	CteVMYiq0Ms7awmlb2S7alO4TTv3UBhpLYmI8Kgt9cUeOYVtBloJy0ir3EaGBKc1WOKujbZGaix
	PLy8flDoqgYKIGfBYRgKpZfSrUvGanIhWiwl3Zg==
X-Google-Smtp-Source: AGHT+IGwqRhQoC3fOMayfmVAcj7UA23NDr6Q3DFxxTe6qZCKM345xZ2mndUpMT12OV06uBa0ucpMZQ==
X-Received: by 2002:a17:907:3e1b:b0:ac7:cdaa:8946 with SMTP id a640c23a62f3a-acabd181303mr9820366b.11.1744231052442;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:27 +0100
Subject: [PATCH v4 06/32] mfd: sec: Update includes to add missing and
 remove superfluous ones
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-6-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.49.0.604.gff1f9ca942-goog


