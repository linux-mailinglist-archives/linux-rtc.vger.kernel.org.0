Return-Path: <linux-rtc+bounces-3732-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00EA79EF7
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AACB617425A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93222459C8;
	Thu,  3 Apr 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sihtSJSP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526C243964
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670747; cv=none; b=BYhJzTXyEq+plQHIE3ZZEL5rdTtkO8Q4JKy7PWysi56rvqhUdyshdy4eGcjJqoemX/JdT3YYxnxSidvN07kGO1/Jq7T5+E2a9TMrZTg2/BfT53xsOFNBMqMgoUUSChuwL3LDxeuEH5PFfkHO05e0InGX5uKe5RxlbrRNdtXpldM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670747; c=relaxed/simple;
	bh=3ZuAbxXX06ozk3Tfj9ghYJsYuA9BYsa2OTFam90KOhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSYnnZOAc45Rhp6y60UoKM4du/WpuIC1uPP7GGv7MuvfWGoqEvx26tlGVLwA3F8gJcoZDNmF6CCEfgNN4IaqcYz5eC18D7i5nL28mArJMK23UhnlSF7f1MSIlZx6dS5vx9KraPG9sAl2rfZJnSjqgP3oKHAVWF/kl04AetB9YQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sihtSJSP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so1305649a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670743; x=1744275543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=sihtSJSP3ON/aTv636TQbOvlzBGpOe/n6JQef3T6U+e1+0o188jAM7AHpZsef9yAzR
         CD/PpZa4iM2RRS7Tgg1n2oobGtUAV9dTwx61Gmj4LglLUZz8twdRNcCu87zVDqpAu+BD
         /l07XXBx/GUjvjRZ3sAbVCUTwrLRGNr+bLVwUZDems0gKQLIb40HQGLG3eKsPiXZ+6so
         VjaUp0s2s7pS9ldY9EALtPXSvUcd0Dk4Tas8rzEGzssQWvcIFZ/Kvp0nv1Z0zMHMXR6r
         u6UQJZHgvtIiCI5gCCpNv9cYPhzDhzCXJWPsjx6v1hSzF6/TbttXnKf4S/f5YdUxtmXR
         /7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670743; x=1744275543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=UvXRFHjNvuiQRkMNgJduUdruLSCGl05buYR9AEMUqqZPyHYyWHPXyam+iW/UTQY7l1
         ethu72ZAhbK04yEr/OvUiH7jeQ0xD5mWrEALpHIACG/L6tmfX/nfJaKwkj0eH2AenIBC
         sMmtG0K14lEqD2cJXRh4NritbY9vozmBfFoCWh5RG8pqQQULXKGTlMalEilCCjgN0wrr
         O8IlX9zSj0v3Fe9n+m5SMhuNlwDYkZ8MK7+7O8Ht+YekNxpELo3CDftzkEzuwwXbU9kW
         0sZOjO8D+Qng5yMqSoRMisTiKE4V7wj6JMw0FTYWl/ahSRrsLQITY1CbwHlCBgYeZDXU
         W/ug==
X-Forwarded-Encrypted: i=1; AJvYcCXWpktaA3c/pNCCmi4aQN88jQIM+EfxTmE3w/qiaTsL5IOhSQ9JleY5wbvgNyVeQN3GFGtbglvqk8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTXu9ib2mX6CKknThCm2C2t2QbWDs6uETbdMtJtxAUVdXaWly
	9kjP7cXvyD72k8AxOohTF7gB5KWmh8RzzMkIgePJUzeEEwwKw/QheUWY4pw518Q=
X-Gm-Gg: ASbGncvyjtyhvsJYYkrio/bp7LfEx2ZuOc0tMuJ/FlBbHHtecOj2TsB0+cJsM5elYNh
	HqB794p7xbyJTxoPQRy349JNBs7F+Sk82rii2uHmdbDsNID/+bv5x1sbPma9EYymuSeADQRJiVM
	EBB5qoKfrEnB7KD8im0ro2RRBIdMs4dX/LlxmDlxW3Mig5HrEDr0PD4ICfHPvuLJHFr+oc6ehyo
	JQr+C7DNFWdNOo8Fz/I7sx2WEcNIKVPvBjwYF8DrgKankSZoo//g46HEejzoVOzTRRssN7NLY/U
	/F/MrO5tzB1hj2Vd2rNpN8tg4IALgy20HjSvn2L+m5OnVEEqFMcpPT4nyCWbpw+hRc7sx+9PkHM
	zo6vCzegtm7uwUZHg3qgS7Qwwts1l
X-Google-Smtp-Source: AGHT+IGkZPSWp4lu5rUJK3n+QeS/CEFX/u4+R1iSLBAES5mqBRreTDwkWOuPbVChNdfUaTLO5xi3fg==
X-Received: by 2002:a05:6402:278b:b0:5eb:4e69:2578 with SMTP id 4fb4d7f45d1cf-5f04eaceb11mr4573614a12.13.1743670743004;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:58 +0100
Subject: [PATCH v3 06/32] mfd: sec: update includes to add missing and
 remove superfluous ones
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-6-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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


