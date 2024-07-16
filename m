Return-Path: <linux-rtc+bounces-1511-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91B9323F5
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB761C20B10
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC85D199224;
	Tue, 16 Jul 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZsU2aQVb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12A1990AD
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125844; cv=none; b=es54DTesCvwwHaA5e9DuVIflrmtmy9BcG0if8f2YuthAE2mSayD6meUXoOYaIeZTHG2XksYueNwnj9Fqyv3LHm08dbuc+ecHbsvzp4VHn0oqv76XEX0DHVI7R+fbrVDnFl/c88C2Nv+/44AcY5xjwPoxckH6pZKmqr17eOvbvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125844; c=relaxed/simple;
	bh=U+ch8xmFaHgp294pQbeu+qwAnCUqKlJq3BTYconXUnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pMZv/9K2WvWplooyOBmZUeHIocRtwSCVO9G1AK1oS4ezsDZ0CDM1cxSom586MJYdP18jLItwHJ1CPaK3vXbfzaaQHIGImoF4GPVhWHTMJJTio2bGoWBXXmYu/jHFgpPWN5QTQOXbc2BDTZmsp1Mi8LTxaSmeqyOSUsmv5qZxyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZsU2aQVb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so33988445e9.0
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125841; x=1721730641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsiHF9UHWXiqB8tTS54Gqt7gUxmJuXlqvb9fFcrRGd4=;
        b=ZsU2aQVbpBCL9/4EG1FcVW5dsNzB20MJYUo+xExQ4rtiDmZbLVxvl2UXsBJhD0+QEJ
         VumYzLOBbGt796utg4pJi6w6eScGSsRRyQVloLqxjP1iqDI6vyOWFk4YV4Z/9CKpKyhh
         rO8Tz2mIwVF3PYFaNFsWcLYrY6SmTMQlcDiHUAIkA2wIz+C0mDTsqbbvr02xNl+dO8L5
         Fh37LsYLpcMHA5ztZB7LClbI5oE4luQuj8MNld5zTMaTxqQz9d6VYDRdE22lRqye3rBn
         CMKpDYn0y/oENZk0OFYzOQYFPwq7AMa8YWww7NHs/qKqcg/LhAfuxtGZYhk7rHcDmFgl
         3YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125841; x=1721730641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsiHF9UHWXiqB8tTS54Gqt7gUxmJuXlqvb9fFcrRGd4=;
        b=TxrjCE2Iuhvv6IgLEYqxx2K2l/fud98FLYtVMGEF0WkfcMQjAerx9+5FpjebVBaOmC
         BwBsACdOTSzQ4VuuRb+FGjb/cJ466FIU3Q6Vsv7l8GlFzgesh/VsYuqHfpi4Fq66tFgw
         H/wXz7gQRCHntGEBSvQfnkAr7BL7YtoQGuNdvmM66/nEy20tiD778uyBeaXBc4D7ZV9J
         0tLiiKcayJJC9Sf3YPpcogIZmEkPqwzpl+1+VdtCWqRx2yOsmlDBuFbknaV1L1V2aqjJ
         q1etG0ELbqjLTvPJKnFJwvLz2svxWJujioTpmBAzUGKJIxhaeZV0IHiIYieNIsAbmskA
         m7aw==
X-Forwarded-Encrypted: i=1; AJvYcCVO7bXx1YdlTpR2P6g8/SWVmAwmB1o/Evv54Og5nzB65Gnghlu3DW5qFsMm6mCU9PMOcS97Uz6EChE56nrZvGQKfXJSwpLjWgt+
X-Gm-Message-State: AOJu0YyyEb5MJmd4fhMu7bx6bPmekI/L3uVOTpJAjjKdHr21VKdeyBYu
	Vnbg06QRmlS+Of0bYtCFRYL8hu913h9G7/mkuCORHquwba4BqfqHWDR/bGlT8Qc=
X-Google-Smtp-Source: AGHT+IFeE6ju3CaHVf1REaatVqyeVrgOXii30q0HVq5lQbTES2loCmA1tuKk+ODjr1JSy91v2RZI8A==
X-Received: by 2002:a05:600c:470f:b0:426:6353:4b88 with SMTP id 5b1f17b1804b1-427ba70097amr10672395e9.37.1721125840937;
        Tue, 16 Jul 2024 03:30:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock driver
Date: Tue, 16 Jul 2024 13:30:17 +0300
Message-Id: <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
by the RTC. The input to the VBATTB could be a 32KHz crystal oscillator
or an external clock device. The driver detects the type of the input clock
based on the device tree clock name (xin for crystal, clkin for external
clock device).

The load capacitance of the on-board oscillator need to be configured with
renesas,vbattb-load-nanofarads DT property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated patch description
- added vendor name in Kconfig flag
- used cleanup.h lock helpers
- dropped the MFD code
- updated registers offsets
- added vbattb_clk_update_bits() and used it where possible
- added vbattb_clk_need_bypass() to detect the bypass setup necessity
- changed the compatible and driver names

 drivers/clk/renesas/Kconfig      |   5 +
 drivers/clk/renesas/Makefile     |   1 +
 drivers/clk/renesas/clk-vbattb.c | 212 +++++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/clk/renesas/clk-vbattb.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 4410d16de4e2..1f5f38136eb2 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -228,6 +228,11 @@ config CLK_RZG2L
 	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RENESAS_VBATTB
+	bool "Renesas VBATTB clock controller"
+	depends on MFD_RENESAS_VBATTB
+	select RESET_CONTROLLER
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index f7e18679c3b8..84a2783a7b46 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSTP)	+= clk-mstp.o
 obj-$(CONFIG_CLK_RENESAS_DIV6)		+= clk-div6.o
+obj-$(CONFIG_CLK_RENESAS_VBATTB)	+= clk-vbattb.o
diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
new file mode 100644
index 000000000000..8effe141fc0b
--- /dev/null
+++ b/drivers/clk/renesas/clk-vbattb.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VBATTB clock driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define VBATTB_BKSCCR			0x0
+#define VBATTB_BKSCCR_SOSEL		BIT(6)
+#define VBATTB_SOSCCR2			0x8
+#define VBATTB_SOSCCR2_SOSTP2		BIT(0)
+#define VBATTB_XOSCCR			0x14
+#define VBATTB_XOSCCR_OUTEN		BIT(16)
+#define VBATTB_XOSCCR_XSEL		GENMASK(1, 0)
+#define VBATTB_XOSCCR_XSEL_4_PF		0x0
+#define VBATTB_XOSCCR_XSEL_7_PF		0x1
+#define VBATTB_XOSCCR_XSEL_9_PF		0x2
+#define VBATTB_XOSCCR_XSEL_12_5_PF	0x3
+
+/**
+ * struct vbattb_clk - VBATTB clock data structure
+ * @base: base address
+ * @hw: clk hw
+ * @lock: lock
+ * @load_capacitance: load capacitance
+ */
+struct vbattb_clk {
+	void __iomem *base;
+	struct clk_hw hw;
+	spinlock_t lock;
+	u8 load_capacitance;
+};
+
+#define to_vbattb_clk(_hw) container_of(_hw, struct vbattb_clk, hw)
+
+static void vbattb_clk_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl_relaxed(base + offset);
+	tmp &= ~mask;
+	tmp |= (val & mask);
+	writel_relaxed(tmp, base + offset);
+}
+
+static int vbattb_clk_enable(struct clk_hw *hw)
+{
+	struct vbattb_clk *vbclk = to_vbattb_clk(hw);
+	void __iomem *base = vbclk->base;
+
+	guard(spinlock)(&vbclk->lock);
+
+	vbattb_clk_update_bits(base, VBATTB_SOSCCR2, VBATTB_SOSCCR2_SOSTP2, 0);
+	vbattb_clk_update_bits(base, VBATTB_XOSCCR, VBATTB_XOSCCR_OUTEN | VBATTB_XOSCCR_XSEL,
+			       VBATTB_XOSCCR_OUTEN | vbclk->load_capacitance);
+
+	return 0;
+}
+
+static void vbattb_clk_disable(struct clk_hw *hw)
+{
+	struct vbattb_clk *vbclk = to_vbattb_clk(hw);
+	void __iomem *base = vbclk->base;
+
+	guard(spinlock)(&vbclk->lock);
+
+	vbattb_clk_update_bits(base, VBATTB_XOSCCR, VBATTB_XOSCCR_OUTEN, 0);
+	vbattb_clk_update_bits(base, VBATTB_SOSCCR2, VBATTB_SOSCCR2_SOSTP2, VBATTB_SOSCCR2_SOSTP2);
+}
+
+static int vbattb_clk_is_enabled(struct clk_hw *hw)
+{
+	struct vbattb_clk *vbclk = to_vbattb_clk(hw);
+	void __iomem *base = vbclk->base;
+	unsigned int xosccr, sosccr2;
+
+	guard(spinlock)(&vbclk->lock);
+
+	xosccr = readl_relaxed(base + VBATTB_XOSCCR);
+	sosccr2 = readl_relaxed(base + VBATTB_SOSCCR2);
+
+	return ((xosccr & VBATTB_XOSCCR_OUTEN) && !(sosccr2 & VBATTB_SOSCCR2_SOSTP2));
+}
+
+static const struct clk_ops vbattb_clk_ops = {
+	.enable = vbattb_clk_enable,
+	.disable = vbattb_clk_disable,
+	.is_enabled = vbattb_clk_is_enabled,
+};
+
+static int vbattb_clk_validate_load_capacitance(struct vbattb_clk *vbclk, u32 load_capacitance)
+{
+	switch (load_capacitance) {
+	case 4000:
+		vbclk->load_capacitance = VBATTB_XOSCCR_XSEL_4_PF;
+		break;
+	case 7000:
+		vbclk->load_capacitance = VBATTB_XOSCCR_XSEL_7_PF;
+		break;
+	case 9000:
+		vbclk->load_capacitance = VBATTB_XOSCCR_XSEL_9_PF;
+		break;
+	case 12500:
+		vbclk->load_capacitance = VBATTB_XOSCCR_XSEL_12_5_PF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vbattb_clk_need_bypass(struct device *dev)
+{
+	struct clk *clkin, *xin;
+
+	clkin = devm_clk_get_optional(dev, "clkin");
+	xin = devm_clk_get_optional(dev, "xin");
+
+	if (!IS_ERR_OR_NULL(clkin) && !IS_ERR_OR_NULL(xin))
+		return -EINVAL;
+	else if (!clkin && !IS_ERR_OR_NULL(xin))
+		return 0;
+	else if (!IS_ERR_OR_NULL(clkin) && !xin)
+		return 1;
+
+	return -EINVAL;
+}
+
+static int vbattb_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct clk_parent_data parent_data = {};
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct vbattb_clk *vbclk;
+	u32 load_capacitance;
+	struct clk_hw *hw;
+	int ret, bypass;
+
+	vbclk = devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
+	if (!vbclk)
+		return -ENOMEM;
+
+	vbclk->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vbclk->base))
+		return PTR_ERR(vbclk->base);
+
+	bypass = vbattb_clk_need_bypass(dev);
+	if (bypass < 0) {
+		return bypass;
+	} else if (bypass) {
+		parent_data.fw_name = "clkin";
+		bypass = VBATTB_BKSCCR_SOSEL;
+	} else {
+		parent_data.fw_name = "xin";
+	}
+
+	ret = of_property_read_u32(np, "renesas,vbattb-load-nanofarads", &load_capacitance);
+	if (ret)
+		return ret;
+
+	ret = vbattb_clk_validate_load_capacitance(vbclk, load_capacitance);
+	if (ret)
+		return ret;
+
+	vbattb_clk_update_bits(vbclk->base, VBATTB_BKSCCR, VBATTB_BKSCCR_SOSEL, bypass);
+
+	spin_lock_init(&vbclk->lock);
+
+	init.name = "vbattclk";
+	init.ops = &vbattb_clk_ops;
+	init.parent_data = &parent_data;
+	init.num_parents = 1;
+	init.flags = 0;
+
+	vbclk->hw.init = &init;
+	hw = &vbclk->hw;
+
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ret;
+
+	return of_clk_add_hw_provider(np, of_clk_hw_simple_get, hw);
+}
+
+static const struct of_device_id vbattb_clk_match[] = {
+	{ .compatible = "renesas,r9a08g045-vbattb-clk" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver vbattb_clk_driver = {
+	.driver		= {
+		.name	= "renesas-vbattb-clk",
+		.of_match_table = vbattb_clk_match,
+	},
+	.probe = vbattb_clk_probe,
+};
+module_platform_driver(vbattb_clk_driver);
+
+MODULE_DESCRIPTION("Renesas VBATTB Clock Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.2


