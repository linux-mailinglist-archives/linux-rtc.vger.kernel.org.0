Return-Path: <linux-rtc+bounces-2426-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06A9B8E4E
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BCB1282603
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6211990C0;
	Fri,  1 Nov 2024 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kJjlrQcz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9592191F65
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455068; cv=none; b=P66lJzSeHwsADChQ7lhVWuQ9aTniK2F/ASyvHIH2tDrFY2Ix0NHsIW8UsvPKsf+uynuF+744mk6c0l88VCJuQ1zoeVp3uPEBcXTQVbQAM6pIyBT9SjCr4V8DgYwDysnGOeXaUI4O4JqF+2fbxlPiuapKxlucUgCHnPlxaVH+Ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455068; c=relaxed/simple;
	bh=5VS7huQJEKAhHcQEm7NCYAYokBuq27sIXf/SS0O/M04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUId1EapuGL+62xDloWAa+L7wpLh/Tx+2prYGU/bR7ygXvfAt1isb19QhDBa8eX05K2u6QJVOI0NgyHWCxIyN+KG15A9V0cu2N0Qa0Z/VuKXYH14cBx8Yb98zbBwJ49VoFbGvT4I0DjCvUIhE57eAKSp6AmQCPv/xGzEZ475fz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kJjlrQcz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso1612400a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455064; x=1731059864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3ThccVles5w9h5xpm4pKe/Bf3Vhlh9BHbKUv1nFK9g=;
        b=kJjlrQczAITkOJnoD3IalfJKzMgvhJrJUZwZ+VkwbQF8LnO2yzPMNMr39YKOemF3Pb
         kxRyNGiMWi/m6tGQQ2K1nqNDUU6DRrA/JHkTJNhENI3cA6RvsorPLgI2Sibp9WVWsIIY
         r/qAgUlZClXKCpvKkDikr8tqg0sFro0nPMb/QrCXKWE4pU8rANKS3ts1vnyTeHQ0x4ZI
         XI2eazukVTU25UEr56pzUgDXd6ebFFPUVjc/7euaXvhAm3tSWDRx5PN76g0dZbP2uurT
         xvR8219jNxgKh5lmXOPs9IFr6wzsCXOueybd1iPQETbKojv/lAZBf9kQASlJu2z7Sye3
         xwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455064; x=1731059864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3ThccVles5w9h5xpm4pKe/Bf3Vhlh9BHbKUv1nFK9g=;
        b=TaKGVC76PDx9HEM840osgztGOv+r7i3rYx6AFzgDfzyUlVJuIOxXggvxhXq+KQEpA0
         YwZ5ftBxETL8JfOx9HddVrjl0zje+jxKcoRWHlfMjIW1VPDZuW9Y9mPgazz7vnG7HkA7
         x6swVhL6CJYVw7sisRtssmy5Ksoo4ePymFQoPJ1b37hnW2a/4wP9FPjVyxoR00YG/0/I
         oofQG1WzwKtvI1Wl6hK3m9Q8gFAu5tLJJC02/tBxKzjhbJmAQCVGpUxJFuwL65qybr5i
         /a5EoXvtwFTDtUOu2HXUiN3h+3ZU7JaZTIc1aMMdx7WFt3C+5pGaAfQ3f42s7J2UDJqA
         URhg==
X-Forwarded-Encrypted: i=1; AJvYcCWPAS9ZhBI3CFnUYNtiS0fARVqEtHGhJoPjdrQee5pGbtlOkoVFdOUZY+dcirTwCSzWaFR7ZzJOLvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJrmRrCv+6roIWneWB/CN1KEMKCMi306upNGVDSjesPoxFBD6
	FQ9AaE/+ptHrLyUqFaOY8dLs/YN8Sna6uPMqetXXO/v/g/yJgDdlmhHcbq4tuQI=
X-Google-Smtp-Source: AGHT+IGUlhOCwH2fmBWL8ZNb53+BHcSpXdIr+V/UM4VkSvZJ7t8FyZkdKsmNGaJmF573TUlMHtoPSw==
X-Received: by 2002:a05:6402:13c9:b0:5c9:6eea:8e06 with SMTP id 4fb4d7f45d1cf-5cbbf947c0cmr18513608a12.24.1730455064181;
        Fri, 01 Nov 2024 02:57:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:43 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 3/9] clk: renesas: clk-vbattb: Add VBATTB clock driver
Date: Fri,  1 Nov 2024 11:57:14 +0200
Message-Id: <20241101095720.2247815-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
by the RTC. The input to the VBATTB could be a 32KHz crystal
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
other DT properties. If the crystal is connected on RTXIN,
RTXOUT pins the XC will be selected as mux input. If an external clock
device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
mux input.

The load capacitance of the internal crystal can be configured
with renesas,vbattb-load-nanofarads DT property.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- used tristate
- added depends ARCH_RENESAS || COMPILE_TEST

Changes in v5:
- collected tags

Changes in v4:
- dropped oscillator from patch description
- s/on-board/internal in patch description
- updated dt-binding included file name in the driver as it has been
  renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- dropped the "_BIT" from driver macros
- used "quartz-load-femtofarads" dt property instead of adding a new one
- register the "vbattclk" as critical clock as this feeds the RTC counter
  logic and it needs to stay on from the moment the RTC is configured;
  along with it, added a comment to express this.

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

 drivers/clk/renesas/Kconfig      |   5 +
 drivers/clk/renesas/Makefile     |   1 +
 drivers/clk/renesas/clk-vbattb.c | 205 +++++++++++++++++++++++++++++++
 3 files changed, 211 insertions(+)
 create mode 100644 drivers/clk/renesas/clk-vbattb.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 76791a1c50ac..ff01f5f0ed20 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -237,6 +237,11 @@ config CLK_RZV2H
 	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RENESAS_VBATTB
+	tristate "Renesas VBATTB clock controller"
+	depends on ARCH_RZG2L || COMPILE_TEST
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
index 000000000000..ff9d1ead455c
--- /dev/null
+++ b/drivers/clk/renesas/clk-vbattb.c
@@ -0,0 +1,205 @@
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
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
+
+#define VBATTB_BKSCCR			0x1c
+#define VBATTB_BKSCCR_SOSEL		6
+#define VBATTB_SOSCCR2			0x24
+#define VBATTB_SOSCCR2_SOSTP2		0
+#define VBATTB_XOSCCR			0x30
+#define VBATTB_XOSCCR_OUTEN		16
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
+	of_property_read_u32(np, "quartz-load-femtofarads", &of_lc);
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
+						   VBATTB_SOSCCR2_SOSTP2,
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
+						 VBATTB_BKSCCR_SOSEL,
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
+	/* This feeds the RTC counter clock and it needs to stay on. */
+	hw = devm_clk_hw_register_gate_parent_hw(dev, "vbattclk", hw, CLK_IS_CRITICAL,
+						 vbclk->base + VBATTB_XOSCCR,
+						 VBATTB_XOSCCR_OUTEN, 0,
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


