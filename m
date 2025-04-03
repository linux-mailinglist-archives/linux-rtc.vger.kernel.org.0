Return-Path: <linux-rtc+bounces-3733-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FCA79EF6
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEB0E1894D53
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B853224418F;
	Thu,  3 Apr 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="levw/Q2B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C54245006
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670748; cv=none; b=tCVB7ksYZtMUe8nexhuJ5iFeyHJYFUzKkEi/7Dqw6DZq1E0WQGvbVtkPsVjIiAsOMc1PdgeVYGoOd9EDstlNSl4PHY5BcFo3c3maeQE2ruGqhz2OsGkG6O/Kv/XhMy5f/KTlZgxzWtGRaLc+PxUsbRU5S/G0iWyOw7THMZTJ5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670748; c=relaxed/simple;
	bh=IlL7av/XZ94MO9yKdjGRUMlQhb8Bpg73uC0VJ87ssYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STKM6G4n3D7SvA+ebtplSFomjRk5SPIDSeqGLBz+WDvLnZNNkmLNHy276s39AzHES+a6D7ZWuiwuf5X+3DnKbtpHPh7wJ566RXpUpCICWSbem8CsU54kTBHhZZpmndkePukFCUJ4OqCjkOQV5dFEckEtPJAu3jwymNbJf25tbTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=levw/Q2B; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac345bd8e13so108711466b.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670744; x=1744275544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=levw/Q2BARYjso4u1EbIZt9wvNnTI1sRcgYNjuDoMU66nukLmh7AUGwFJ2nMQNk8E1
         IZBYBrWgogNkLp+w0WoA4Rnwae6WrMZZLAJV6LW/PV6PaREwMj/Y7zkuaQdntxoYrboN
         +NwQOfrKEew0K7EhHJkSg9t07MrnCGpAyi4Lm+XHuTOCJz/ATffcU8r+U4g8hmrxxBNU
         sGgucLCRMNX1DbRoJzuxpaanT5XjWNZnDV4pnhgmdQ/Vi7xpWNno0ViMcVZ4Tfr6eYO8
         1hoH1NCSd6jQBQMxWcgpH1rpEYINplQkHKsB+S8rxQR/ZAzPYsxaZWB9pO+esvU8wAE6
         tUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670744; x=1744275544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=pDIrkfRpz4KQZaGU7ORySBIhxXQ21VLcmggykT9ViseNBuipR+dv8YUs7qPK3aVXWa
         gmLpBDneg0LtdHArK2q4aqOi4LGD0uI5s/crpEgMNJrj+uT3obFS/fqMotvRXg1KsKbv
         tu2njlWxxapDlhTOm+8GpmxXEhufUK36BHgoSg1MVQfhF79SBa5Duraabro+8LSLqzcp
         EEqG/07j8Wvv5ccJgug5FDU1H8kfRerscCTv99NRVGmmN5RWYrpKiM92ox11XdPhuAOT
         A8bSb7YIHlEzWxjCs4HtWSAxTWtNlWL4FWdzELrwMlRQHGPhygesvrDPn7bkEoPAI2Cr
         5OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7fYlcX1Ey/lvUa5Cf7BcoBLyiGk8jinjJTLY03MnB0kD/dTjh/Szp1QiP+xXJzWyIUrZW/YUNHo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpP8K1poLJ7xYPPYkjVm2m9qq+JWtz0r7i9rckQXQ5guyJirJ
	JYN8icdOchiHTWl8+xobc36Ky5Ol5BqwhYGOHiEU6bROAKDCMi1ymVQU4/KlD74=
X-Gm-Gg: ASbGncu9T0x7lIB14T/jPFraplh8O65Y9px9WO+0nnwxPsw5eIrEUVZrIqOqUVB46PY
	F5ttjKaVf2q9YyWmSlI16dqNdXUtUcHwmSLwp05f2RO9yYHhHXMc1O7SZD6kHVxHrn3jFz3Ukht
	RnXHcMH4jXnx4FmMofby3+vo7dv3hSvQQ71z6hUtGk1cRfrCpd/AJr4zPxSw8kSBQXRNm0C28Hm
	tlKfSoc88Lk1c7bBVs6Gl/JeIaVAQ4Wf6bD3cA1MAO/H3pu7G5e78fzjlDng5IxHW9vO2w8+VPB
	BWyXboLybH8AcLhSoRehFCzyyAH6LWPxlBYxixYBeYzxyNpyP2O3dENw9YiYcPxCNNmdjeMo/wM
	z2q4KJqQeUwhW0exH0+uOPvtDQxm2
X-Google-Smtp-Source: AGHT+IGIWTCEvGgQQzD/67aqQ+onG4uBURQ37h1HwUWRbYYu+VD7A44v+HEWQ+TW3vqt1mLDE4QMoQ==
X-Received: by 2002:a17:906:c153:b0:ac6:fcdd:5a97 with SMTP id a640c23a62f3a-ac7a1972b9emr446196566b.48.1743670743773;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:59 +0100
Subject: [PATCH v3 07/32] mfd: sec: move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-7-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.472.ge94155a9ec-goog


