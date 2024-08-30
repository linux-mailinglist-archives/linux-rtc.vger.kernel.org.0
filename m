Return-Path: <linux-rtc+bounces-1802-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B521966246
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA6DF285EB9
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D79D1B1516;
	Fri, 30 Aug 2024 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BzBOSaUC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312581AF4CA
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022962; cv=none; b=RmFFLTmKSqL+Rh2fpCh9zHQePJqN4nHkKH8iCUgNBihhR4l76UP5pF6TmyR1RiVXDJWEqbpAjWyU3MOF1k5urt70ySX2Wlzs9gtiBaVzqBL0QX13py51gaiyUFRmKHawEfdFqI9wFD3ekkYL8GE31YHd+d43uVXg9jGxiyEp8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022962; c=relaxed/simple;
	bh=wvfwRQLrN9kD/9lyJX4OW7n3rT05KxxsagXfsAsYucA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PEGqXW3h7b7cmdGPHBW5XHMzVo1vdP684Uk1TRCg4p8OVcPqJtVvgcJoh9LsonQFWFOU3gpjfHcMK4K0T2t8yvnzDIEMa05Gps3uWPnPTWAka6FCYTZfq1WGrgdfolMdzcsCJmWP3DYJg8cauiEsyQsevmMGIDrMKxfpOEewBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BzBOSaUC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42812945633so15842265e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022959; x=1725627759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClDiCYd44g4J7sgoEfy+nhd9AikYpygCAxI2dc/eBbo=;
        b=BzBOSaUCge/fh8A0kBEg3wkv2unpNnbusn0dJHwK1PrAymvMOvo10XrhcRHWW2HMbI
         FTfTZ1EkmgXxJKVxM6Prhvcjxyy/RsEbOxURfeiUzdvl+9++IPa6iXSuoLU0lPgge5cA
         i3y0MA0ehmLRjFn/3ui8hrc7mInFmLmyBDAjJh6V0yxX/Y7L6SH1ECTqqPirGRwV1zf8
         +7KeqR9od0//uG6iYb0KQ4LawmfDvMKWiaC/lDU+/p6OnsA40rtNKmZy9IrrL2f5OkyR
         xswUytsGpDmw2QOxvMxY9SfMcsQqsXnuPYn0t5EwNDYJXNHqRjnbnI6A0lqIiCrhBkdM
         JAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022959; x=1725627759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClDiCYd44g4J7sgoEfy+nhd9AikYpygCAxI2dc/eBbo=;
        b=oqLHWtfgPTCT/8uAON/IRndW/pZtg4Jt5NmBNWrO/HXpOSxtRXH3sNJ02hin5aUbmH
         kGrqLS7iul2q32MR+sfzUaa8denkhW5WL3x4mTeUF00N55Qu5RtubP+FqAeWNfnpIU6G
         AAkU4wvkmMfiLgTOcpM2tAjDpQF3J46MbKGdS/KrbyWxn//XIp9PS+Z0LXuREm4nR7iF
         kvWz9jambDhK7MkZxD3mVUPo8QaftzgRir/5pfUHq+/UzRQ3C0gYZZvUD2e9YSAN1G4o
         mjwPdtHyGjAuvJ0q5hwNpbvnTETvTu1N3GKcVkyTheiGmGnaZyY4tWCurBPscMV4OA0O
         /nZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVTZ8GetrAdIAoQRPIviY0EmfCohqm7k9K9iLwtjUtNEUKBzXis34T5YhhFR9VPLeA6OpxufnbfAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuASd289uauieE8H3w2ZgZ6C7n5441nBb4HczT7M1kjE8sWMqN
	qy22+lYmBJ99KRUDEIr9FpltSK3KkjpMOTzrX/Wq1GdAPNYJ0N3l00L7fLKAs88=
X-Google-Smtp-Source: AGHT+IH4fGRhHaay0+3nSIkt77XXiNCreg1uyREJ5LAh4q3IK+1rj9ZZwYu69ervEXzYiHZs+TecwA==
X-Received: by 2002:a05:600c:4f42:b0:42b:afbb:171b with SMTP id 5b1f17b1804b1-42bb029de44mr46389085e9.35.1725022958362;
        Fri, 30 Aug 2024 06:02:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 04/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
Date: Fri, 30 Aug 2024 16:02:10 +0300
Message-Id: <20240830130218.3377060-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
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
or an external clock device.

The HW block diagram for the clock generator is as follows:

           +----------+ XC   `\
RTXIN  --->|          |----->| \       +----+  VBATTCLK
           | 32K clock|      |  |----->|gate|----------->
           | osc      | XBYP |  |      +----+
RTXOUT --->|          |----->| /
           +----------+      ,

After discussions w/ Stephen Boyd the clock tree associated with this
hardware block was exported in Linux as:

vbattb-xtal
   xbyp
   xc
      mux
         vbattbclk

where:
- input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
- xc, xbyp are mux inputs
- mux is the internal mux
- vbattclk is the gate clock that feeds in the end the RTC

to allow selecting the input of the MUX though assigned-clock DT
properties, using the already existing clock drivers and avoid adding
other DT properties. If the crystal oscillator is connected as on RTXIN,
RTXOUT pins the XC will be selected as mux input. If an external clock
device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
mux input.

The load capacitance of the on-board crystal oscillator can be configured
with renesas,vbattb-load-nanofarads DT property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- updated patch description
- dropped dependency on MFD_RENESAS_VBATTB as now there is no
  driver built under this flag
- dropped include/clk.h
- added pm_runtime and reset control support
- updated register offsets
- registered 4 clocks: xc, xbyp, mux, vbattclk using generic
  clock drivers
- added MODULE_DEVICE_TABLE()

Changes in v2:
- updated patch description
- added vendor name in Kconfig flag
- used cleanup.h lock helpers
- dropped the MFD code
- updated registers offsets
- added vbattb_clk_update_bits() and used it where possible
- added vbattb_clk_need_bypass() to detect the bypass setup necessity
- changed the compatible and driver names


 drivers/clk/renesas/Kconfig      |   4 +
 drivers/clk/renesas/Makefile     |   1 +
 drivers/clk/renesas/clk-vbattb.c | 204 +++++++++++++++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 drivers/clk/renesas/clk-vbattb.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 76791a1c50ac..4e835a3f1ab4 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -237,6 +237,10 @@ config CLK_RZV2H
 	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RENESAS_VBATTB
+	bool "Renesas VBATTB clock controller"
+	select RESET_CONTROLLER
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 23d2e26051c8..82efaa835ac7 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -53,3 +53,4 @@ obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSTP)	+= clk-mstp.o
 obj-$(CONFIG_CLK_RENESAS_DIV6)		+= clk-div6.o
+obj-$(CONFIG_CLK_RENESAS_VBATTB)	+= clk-vbattb.o
diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
new file mode 100644
index 000000000000..22147f4983d7
--- /dev/null
+++ b/drivers/clk/renesas/clk-vbattb.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VBATTB clock driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/clock/r9a08g045-vbattb.h>
+
+#define VBATTB_BKSCCR			0x1c
+#define VBATTB_BKSCCR_SOSEL_BIT		6
+#define VBATTB_SOSCCR2			0x24
+#define VBATTB_SOSCCR2_SOSTP2_BIT	0
+#define VBATTB_XOSCCR			0x30
+#define VBATTB_XOSCCR_OUTEN_BIT		16
+#define VBATTB_XOSCCR_XSEL		GENMASK(1, 0)
+#define VBATTB_XOSCCR_XSEL_4_PF		0x0
+#define VBATTB_XOSCCR_XSEL_7_PF		0x1
+#define VBATTB_XOSCCR_XSEL_9_PF		0x2
+#define VBATTB_XOSCCR_XSEL_12_5_PF	0x3
+
+/**
+ * struct vbattb_clk - VBATTB clock data structure
+ * @base: base address
+ * @lock: lock
+ */
+struct vbattb_clk {
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+static int vbattb_clk_validate_load_capacitance(u32 *reg_lc, u32 of_lc)
+{
+	switch (of_lc) {
+	case 4000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_4_PF;
+		break;
+	case 7000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_7_PF;
+		break;
+	case 9000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_9_PF;
+		break;
+	case 12500:
+		*reg_lc = VBATTB_XOSCCR_XSEL_12_5_PF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void vbattb_clk_action(void *data)
+{
+	struct device *dev = data;
+	struct reset_control *rstc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_assert(rstc);
+	if (ret)
+		dev_err(dev, "Failed to de-assert reset!");
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		dev_err(dev, "Failed to runtime suspend!");
+
+	of_clk_del_provider(dev->of_node);
+}
+
+static int vbattb_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct clk_parent_data parent_data = {};
+	struct clk_hw_onecell_data *clk_data;
+	const struct clk_hw *parent_hws[2];
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	struct vbattb_clk *vbclk;
+	u32 of_lc, reg_lc;
+	struct clk_hw *hw;
+	/* 4 clocks are exported: VBATTB_XC, VBATTB_XBYP, VBATTB_MUX, VBATTB_VBATTCLK. */
+	u8 num_clks = 4;
+	int ret;
+
+	/* Default to 4pF as this is not needed if external clock device is connected. */
+	of_lc = 4000;
+	of_property_read_u32(np, "renesas,vbattb-load-nanofarads", &of_lc);
+
+	ret = vbattb_clk_validate_load_capacitance(&reg_lc, of_lc);
+	if (ret)
+		return ret;
+
+	vbclk = devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
+	if (!vbclk)
+		return -ENOMEM;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_clks), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = num_clks;
+
+	vbclk->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vbclk->base))
+		return PTR_ERR(vbclk->base);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	rstc = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		pm_runtime_put_sync(dev);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, rstc);
+	ret = devm_add_action_or_reset(dev, vbattb_clk_action, dev);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&vbclk->lock);
+
+	parent_data.fw_name = "rtx";
+	hw = devm_clk_hw_register_gate_parent_data(dev, "xc", &parent_data, 0,
+						   vbclk->base + VBATTB_SOSCCR2,
+						   VBATTB_SOSCCR2_SOSTP2_BIT,
+						   CLK_GATE_SET_TO_DISABLE, &vbclk->lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_XC] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor_fwname(dev, np, "xbyp", "rtx", 0, 1, 1);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_XBYP] = hw;
+
+	parent_hws[0] = clk_data->hws[VBATTB_XC];
+	parent_hws[1] = clk_data->hws[VBATTB_XBYP];
+	hw = devm_clk_hw_register_mux_parent_hws(dev, "mux", parent_hws, 2, 0,
+						 vbclk->base + VBATTB_BKSCCR,
+						 VBATTB_BKSCCR_SOSEL_BIT,
+						 1, 0, &vbclk->lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_MUX] = hw;
+
+	/* Set load capacitance before registering the VBATTCLK clock. */
+	scoped_guard(spinlock, &vbclk->lock) {
+		u32 val = readl_relaxed(vbclk->base + VBATTB_XOSCCR);
+
+		val &= ~VBATTB_XOSCCR_XSEL;
+		val |= reg_lc;
+		writel_relaxed(val, vbclk->base + VBATTB_XOSCCR);
+	}
+
+	hw = devm_clk_hw_register_gate_parent_hw(dev, "vbattclk", hw, 0,
+						 vbclk->base + VBATTB_XOSCCR,
+						 VBATTB_XOSCCR_OUTEN_BIT, 0,
+						 &vbclk->lock);
+
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_VBATTCLK] = hw;
+
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id vbattb_clk_match[] = {
+	{ .compatible = "renesas,r9a08g045-vbattb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, vbattb_clk_match);
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


