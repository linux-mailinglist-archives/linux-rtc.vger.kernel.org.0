Return-Path: <linux-rtc+bounces-3675-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD94A74AE4
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505D91B62FD4
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CC121C9E3;
	Fri, 28 Mar 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf2FqG/y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A041EB5CD
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168665; cv=none; b=TJ/bcxg403QRb+17WKPw2dK59pw0teVh4sCD2P80zBgIq0GOv8frsGHgu0GJ5t/VhaSSSYJvyI3a2eMYvvqtPUsrqPNcNWX78Uaf0obmGNVn+Z4c3C49XfQXnsMeq3zc7J3keZqEAs+gf16s2wtnmrLiafRMvLBzjVHlbUBEG4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168665; c=relaxed/simple;
	bh=ch+tVjxpZDhWADsqi2xUerCCp822EcsZf6tgYWcJO4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKBmWosJAMCWAgLNMyDTJLJTLMlZKIhzPTme5GY3o1hsaJbw+OpQ4nQYYq49rliyg9riC3nZf3nuPVYXwKhdFB3uK54WJNvs+kqYoQJaVedwbhLTuLqMLPKGffSFHPpeMSVlnOvosWFhuVsjY0vNEJmsZ2pgHQNavqt79TAuAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf2FqG/y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3529510a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=Zf2FqG/y66Mgu8ATKGA31rciFAuExv5XNSLhAv0+YKi4j4U4gYffRGpK7M1S8Kzgtv
         LlEZ6RwmB2Jpou5Nu0DEC4YBjs7V+EdbhLTUj6Q98nIc4XEC+//hna6B4S+/fr9LEK9W
         efYuaVdPTPg++Zce4PzuR0trfm3oaEQcjN0fGXPg25Y6ug3jl2ShfRrvdEFOUJLXaPV2
         GdyhXFti/bXK8UzOE54t4NkqSnkjSXd7FzCc9kUDEQ8blR2Mgj5r5WjKbz+AvNKCi8tb
         R9UswMJyeD5S2721BlX8PwsWXX8jfCMLKhRjiF8b0M6foBA2arWpqoi2VwqGlh7j14dp
         5epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=SgYVmeTMLiDvknN67chvg8x41qUTRNPpch2yvDQj/DVEtnThwKDiOfmBF/g5AiqeZo
         rpKbStfBDF+hUtVOOJN0seOyvuy7JgrTZdlm9Qr58JjfgQjNAJu+Vvy+3pdfR6WASw/s
         GRZWl2p437Yers6NPAf8iZLTO1Z6SbWwak4PhhqGjW0sZwmbaKsM2RJ8ZuqQICDi4y4W
         HDTvKrd+xeqvdA63uvS5C7qRsmHguKzS8P89KUTxOjxBOljGbf2dwE9dZpRL+Po/WGQL
         5SkmWuRdPVNv8BQZfi9yOkx3nX4VFIUdRHuFMysCjjPfOB8CIO/6YwR1w3x8gnjvh6nd
         7kOw==
X-Forwarded-Encrypted: i=1; AJvYcCVIJ1pw1sYikl21j3I9hMdvD+rqUZOFkcCXgysRwbgTsMRz46wp03/SbjlDY6+WVdG002WqirIYeu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwecmhBzTjmdnFiPI/3pa6bpZntcIODKeOluqFPmIDm99sNIIJo
	VCI/ZVjcZju24jnhdNG3YRu+/ssdng5tC+lOg6Zi3JJGsr95/TyEcKEBH26MPXU=
X-Gm-Gg: ASbGnct+HloaE+xLNMXn9j+4qhfm9doGXTYOsjtMzGPd1qS1nc4lHXbhMc3eKAy3WPj
	yV4qUq5s2X3TN96Q3pv9Ylis9vWOEY1yVtaCO926aC5ZHW0mNKHJJkoINGMIy9XU/2qpTbrSrnp
	YqIpjNManioGxLOBqo7lNRh/k+gBLHyII8JzgPScYXTonNiDO8wDeXoohjGd0Ta0ca4Yx40oqRa
	x9OyM9LUIFuzAqXWuawc+d7xSpSQCVOXqS87GBjz4RfDQjyNaNBIteogWwK30pczo+F0zRBr+RD
	v/KoKUo0P8e5v0KQ+c3fxTtBp7x135Okr2248+ZoFDrXLSxLwDj+cWTuobPnSQinowPl3yZHzJl
	vS2hTI5szHmjR8ZNN7Q8POZEXUYr7
X-Google-Smtp-Source: AGHT+IHxP2Uv5JCL7mBzhNxmy1vBuez9/wb1XD7Bn0E0BvHAW9NPQJMgxLbLOCUMtAwVk4l4WbA2Aw==
X-Received: by 2002:a05:6402:2744:b0:5e5:c847:1a56 with SMTP id 4fb4d7f45d1cf-5ed8e28cdbcmr6969582a12.10.1743168658859;
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:56 +0000
Subject: [PATCH v2 10/32] mfd: sec: merge separate core and irq modules
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-10-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 9 ---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,7 +16,6 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
@@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


