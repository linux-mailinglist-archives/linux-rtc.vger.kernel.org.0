Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E1E41AA63
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbhI1IGJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:09 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:50711 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239341AbhI1IFc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id CDE272B0161F;
        Tue, 28 Sep 2021 04:03:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Sep 2021 04:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=SaufLTRKbCSob
        Q2OUN+vL4Q3M/tZ13OlIGAkrA6LvBQ=; b=TLIFyr9Uts+f5XfcpR1ZhKYY5wHgl
        f4OT59daNJxM4PBJf/oVI9vM8H2x2nIBLAr04VRqfxgvkxVbqCSg4zh/sSscYCH2
        7ZMagFVEScP38fiuHylZnA5NoRPmVJU6jEAKVBPcK5Ndt6fje35M0/eg9+kBPwmx
        y2gdLZbvZTFrhsPYwKxRDYQwLwMgRIPuJVKv3RSJQ4J5jgHt7JimhJuo5xY00M+o
        kMRzU7u9Iyruuoiox0OYrF9s/IZtC1cBMSVzB41WDTuwp8SedyL3LZbOgembnXqI
        i+PiGOUXSWP4vR6wL0Ly8Je6rkkmNAH6MU6o2hgOUHYEIxURxTKXE2qoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=SaufLTRKbCSobQ2OUN+vL4Q3M/tZ13OlIGAkrA6LvBQ=; b=VSSbnJCw
        /+2FyKl0D4UDz3+dbkwmF9THFo5J7Tx72mIgYn4eOfr6MvSvsqhr3guUG0su8/CH
        +wA3K0ZoGayRbc555P6PG/pxTZMjvgXTaALJ4Znt5Lj9elgl00lthCBbouD+6tgy
        qU7w1cr5z3yoYM/QrEqwlIhiFdwy++W+wEylsU7/2/HBOMPXaxMNuJgTzY8KQq7h
        b65v8WmwdFUE/TOMwhsB0XCxJmzZiFNh88cUl3RfDQDYVRUeyq2vXJVVWT15qmq3
        ZHMM9/vY/FQBWkNP2WDK9Rke+7HZeEs85i+7jMCXihcBmjXo6d+zPqM7F8/IhFC6
        VOJp7D9axM6ttw==
X-ME-Sender: <xms:aMxSYQkPMZ5XSo9QtVqpJ1lOdHG6Vf-751QuxNbg09ipNORBBX0Ucg>
    <xme:aMxSYf2Yp2AH5wQLOFN-EmD9PBvft_iDqZhfYRjYyShlXXaiVh58hbKHlJUZaKZ0S
    XFcE7qvk5bzOBiaAQ>
X-ME-Received: <xmr:aMxSYerJayEh5dkAt7D_RDUhuzXRd4R1fPtiCP7ESpsNBt1Q8nTNZlAz6O8ED-QmJYzag7ijOhF-_nD423F84jX_azqy7E15uTTIwDE5M-XKXx0IFDzKp0xs_AU6sri5iZEIfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:aMxSYcmg6GYrh9vdpnZTNM_4zTJnfxb3HIYmAsTd1HtD_12vH8VJWQ>
    <xmx:aMxSYe3PEJUh84yeaR4MgXhjMHt_HFGOksg_qN34KY-SFekd_mYLKA>
    <xmx:aMxSYTsSWkh2wYp8GIGJn-5195xma8qDmAsmUczX7T7pFOnBFHgMJQ>
    <xmx:aMxSYR1MwHo5t0lL6pOBuvQSE64beD473hBXD_svNmL45NJJ6Bz1Q6vNpW8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:51 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 7/9] clk: sunxi-ng: Add support for the sun6i RTC clocks
Date:   Tue, 28 Sep 2021 03:03:33 -0500
Message-Id: <20210928080335.36706-8-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC power domain in sun6i and newer SoCs manages the 16 MHz RC
oscillator (called "IOSC" or "osc16M") and the optional 32 kHz crystal
oscillator (called "LOSC" or "osc32k"). Starting with the H6, this power
domain handles the 24 MHz DCXO (called "HOSC", "dcxo24M", or "osc24M")
as well. The H6 also introduces a calibration circuit for IOSC.

Later SoCs introduce further variations on the design:
 - H616 adds an additional mux for the 32 kHz fanout source.
 - R329 adds an additional mux for the RTC timekeeping clock, a clock
   for the SPI bus between power domains inside the RTC, and removes the
   IOSC calibration functionality.

Take advantage of the CCU framework to handle this increased complexity.
The CCU framework provides pre-made widgets for the mux/gate/divider
combinations. And it allows plugging in different clocks for the same
specifiers based on the compatible string.

This driver is intended to be a drop-in replacement for the existing RTC
clock driver. So some runtime adjustment of the clock parents is needed,
both to handle hardware differences, and to support the old binding
which omitted some of the input clocks.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - Rebase on v2 of the module support series.
  - Load the CCU driver from the RTC driver, not as an OF provider.

 drivers/clk/sunxi-ng/Kconfig         |   5 +
 drivers/clk/sunxi-ng/Makefile        |   2 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 373 +++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  16 ++
 drivers/clk/sunxi-ng/ccu_gate.c      |   3 +
 drivers/rtc/rtc-sun6i.c              |   5 +
 include/linux/clk/sunxi-ng.h         |   9 +
 7 files changed, 413 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 727ff755eca4..fcbdabf4deae 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -59,6 +59,11 @@ config SUN6I_A31_CCU
 	default MACH_SUN6I
 	depends on MACH_SUN6I || COMPILE_TEST
 
+config SUN6I_RTC_CCU
+	tristate "Support for the Allwinner H616/R329 RTC CCU"
+	default ARM64 && ARCH_SUNXI
+	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
 	default MACH_SUN8I
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 659d55150c32..4a326226e78d 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_SUN50I_H616_CCU)	+= sun50i-h616-ccu.o
 obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
+obj-$(CONFIG_SUN6I_RTC_CCU)	+= sun6i-rtc-ccu.o
 obj-$(CONFIG_SUN8I_A23_CCU)	+= sun8i-a23-ccu.o
 obj-$(CONFIG_SUN8I_A33_CCU)	+= sun8i-a33-ccu.o
 obj-$(CONFIG_SUN8I_A83T_CCU)	+= sun8i-a83t-ccu.o
@@ -56,6 +57,7 @@ sun50i-h616-ccu-y		+= ccu-sun50i-h616.o
 sun4i-a10-ccu-y			+= ccu-sun4i-a10.o
 sun5i-ccu-y			+= ccu-sun5i.o
 sun6i-a31-ccu-y			+= ccu-sun6i-a31.o
+sun6i-rtc-ccu-y			+= ccu-sun6i-rtc.o
 sun8i-a23-ccu-y			+= ccu-sun8i-a23.o
 sun8i-a33-ccu-y			+= ccu-sun8i-a33.o
 sun8i-a83t-ccu-y		+= ccu-sun8i-a83t.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
new file mode 100644
index 000000000000..7e67466c481d
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
+//
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include "ccu_common.h"
+
+#include "ccu_div.h"
+#include "ccu_gate.h"
+#include "ccu_mux.h"
+
+#include "ccu-sun6i-rtc.h"
+
+#define IOSC_ACCURACY			300000000 /* 30% */
+#define IOSC_RATE			16000000
+
+#define LOSC_RATE			32768
+#define LOSC_RATE_SHIFT			15
+
+#define LOSC_CTRL_KEY			0x16aa0000
+
+#define IOSC_32K_CLK_DIV_REG		0x8
+#define IOSC_32K_CLK_DIV		GENMASK(4, 0)
+#define IOSC_32K_PRE_DIV		32
+
+#define IOSC_CLK_CALI_REG		0xc
+#define IOSC_CLK_CALI_DIV_ONES		22
+#define IOSC_CLK_CALI_EN		BIT(1)
+#define IOSC_CLK_CALI_SRC_SEL		BIT(0)
+
+#define DCXO_CTRL_REG			0x160
+#define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
+
+struct sun6i_rtc_match_data {
+	const struct sunxi_ccu_desc	*desc;
+	void				(*setup)(void);
+};
+
+static bool have_iosc_calib;
+
+static int ccu_iosc_enable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_enable(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static void ccu_iosc_disable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_disable(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static int ccu_iosc_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_is_enabled(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	if (have_iosc_calib) {
+		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
+
+		/*
+		 * Recover the IOSC frequency by shifting the ones place of
+		 * (fixed-point divider * 32768) into bit zero.
+		 */
+		if (reg & IOSC_CLK_CALI_EN)
+			return reg >> (IOSC_CLK_CALI_DIV_ONES - LOSC_RATE_SHIFT);
+	}
+
+	return IOSC_RATE;
+}
+
+static unsigned long ccu_iosc_recalc_accuracy(struct clk_hw *hw,
+					      unsigned long parent_accuracy)
+{
+	return IOSC_ACCURACY;
+}
+
+static const struct clk_ops ccu_iosc_ops = {
+	.enable			= ccu_iosc_enable,
+	.disable		= ccu_iosc_disable,
+	.is_enabled		= ccu_iosc_is_enabled,
+	.recalc_rate		= ccu_iosc_recalc_rate,
+	.recalc_accuracy	= ccu_iosc_recalc_accuracy,
+};
+
+static struct ccu_common iosc_clk = {
+	.reg		= DCXO_CTRL_REG,
+	.hw.init	= CLK_HW_INIT_NO_PARENT("iosc", &ccu_iosc_ops,
+						CLK_GET_RATE_NOCACHE),
+};
+
+static int ccu_iosc_32k_enable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (!have_iosc_calib)
+		return 0;
+
+	spin_lock_irqsave(cm->lock, flags);
+
+	reg = readl(cm->base + IOSC_CLK_CALI_REG);
+	writel(reg | IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL,
+	       cm->base + IOSC_CLK_CALI_REG);
+
+	spin_unlock_irqrestore(cm->lock, flags);
+
+	return 0;
+}
+
+static void ccu_iosc_32k_disable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (!have_iosc_calib)
+		return;
+
+	spin_lock_irqsave(cm->lock, flags);
+
+	reg = readl(cm->base + IOSC_CLK_CALI_REG);
+	writel(reg & ~(IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL),
+	       cm->base + IOSC_CLK_CALI_REG);
+
+	spin_unlock_irqrestore(cm->lock, flags);
+}
+
+static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 reg;
+
+	if (have_iosc_calib) {
+		reg = readl(cm->base + IOSC_CLK_CALI_REG);
+
+		/* Assume the calibrated 32k clock is accurate. */
+		if (reg & IOSC_CLK_CALI_SRC_SEL)
+			return LOSC_RATE;
+	}
+
+	reg = readl(cm->base + IOSC_32K_CLK_DIV_REG) & IOSC_32K_CLK_DIV;
+
+	return parent_rate / IOSC_32K_PRE_DIV / (reg + 1);
+}
+
+static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
+						  unsigned long parent_accuracy)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 reg;
+
+	if (have_iosc_calib) {
+		reg = readl(cm->base + IOSC_CLK_CALI_REG);
+
+		/* Assume the calibrated 32k clock is accurate. */
+		if (reg & IOSC_CLK_CALI_SRC_SEL)
+			return 0;
+	}
+
+	return parent_accuracy;
+}
+
+static const struct clk_ops ccu_iosc_32k_ops = {
+	.enable			= ccu_iosc_32k_enable,
+	.disable		= ccu_iosc_32k_disable,
+	.recalc_rate		= ccu_iosc_32k_recalc_rate,
+	.recalc_accuracy	= ccu_iosc_32k_recalc_accuracy,
+};
+
+static struct ccu_common iosc_32k_clk = {
+	.hw.init	= CLK_HW_INIT_HW("iosc-32k", &iosc_clk.hw,
+					 &ccu_iosc_32k_ops, 0),
+};
+
+/* .fw_name will be nulled out below if the clock-names property is missing. */
+static struct clk_parent_data ext_osc32k[] = {
+	{ .fw_name = "ext-osc32k", .index = 0 }
+};
+static SUNXI_CCU_GATE_DATA(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			   ext_osc32k, 0x0, BIT(4), 0);
+
+static const struct clk_hw *osc32k_parents[] = { &iosc_32k_clk.hw,
+						 &ext_osc32k_gate_clk.common.hw };
+static SUNXI_CCU_MUX_HW_WITH_KEY(osc32k_clk, "osc32k", osc32k_parents,
+				 0x0, 0, 1, 0);
+
+/* This falls back to the global name for FW nodes without a hosc reference. */
+static struct clk_parent_data osc24M[] = {
+	{ .fw_name = "hosc", .name = "osc24M" }
+};
+static struct ccu_gate osc24M_32k_clk = {
+	.enable	= BIT(16),
+	.common	= {
+		.reg		= 0x60,
+		.prediv		= 750,
+		.features	= CCU_FEATURE_ALL_PREDIV,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
+							   &ccu_gate_ops, 0),
+	},
+};
+
+static CLK_FIXED_FACTOR_HW(rtc_32k_fixed_clk, "rtc-32k",
+			   &osc32k_clk.common.hw, 1, 1, 0);
+
+static const struct clk_hw *rtc_32k_parents[] = { &osc32k_clk.common.hw,
+						  &osc24M_32k_clk.common.hw };
+static SUNXI_CCU_MUX_HW_WITH_KEY(rtc_32k_mux_clk, "rtc-32k", rtc_32k_parents,
+				 0x0, 1, 1, 0);
+
+static struct clk_parent_data osc32k_fanout_parents[] = {
+	{ .hw = &osc32k_clk.common.hw },
+	/* This parent is replaced below for some hardware variants. */
+	{ .fw_name = "pll-32k" },
+	{ .hw = &osc24M_32k_clk.common.hw },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(osc32k_fanout_clk, "osc32k-fanout",
+				    osc32k_fanout_parents,
+				    0x60, 1, 2, BIT(0), 0);
+
+static SUNXI_CCU_M_FW_WITH_GATE(rtc_spi_clk, "rtc-spi", "ahb",
+				0x310, 0, 5, BIT(31), 0);
+
+static struct ccu_common *sun50i_h616_rtc_ccu_clks[] = {
+	&iosc_clk,
+	&iosc_32k_clk,
+	&osc32k_clk.common,
+	&osc24M_32k_clk.common,
+	&osc32k_fanout_clk.common,
+};
+
+static struct ccu_common *sun50i_r329_rtc_ccu_clks[] = {
+	&iosc_clk,
+	&iosc_32k_clk,
+	&ext_osc32k_gate_clk.common,
+	&osc32k_clk.common,
+	&osc24M_32k_clk.common,
+	&rtc_32k_mux_clk.common,
+	&osc32k_fanout_clk.common,
+	&rtc_spi_clk.common,
+};
+
+static struct clk_hw_onecell_data sun50i_h616_rtc_ccu_hw_clks = {
+	.num = CLK_NUMBER,
+	.hws = {
+		[CLK_OSC32K]		= &osc32k_clk.common.hw,
+		[CLK_OSC32K_FANOUT]	= &osc32k_fanout_clk.common.hw,
+		[CLK_IOSC]		= &iosc_clk.hw,
+
+		[CLK_IOSC_32K]		= &iosc_32k_clk.hw,
+		[CLK_EXT_OSC32K_GATE]	= NULL,
+		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
+		[CLK_RTC_32K]		= &rtc_32k_fixed_clk.hw,
+		[CLK_RTC_SPI]		= NULL,
+	},
+};
+
+static struct clk_hw_onecell_data sun50i_r329_rtc_ccu_hw_clks = {
+	.num = CLK_NUMBER,
+	.hws = {
+		[CLK_OSC32K]		= &osc32k_clk.common.hw,
+		[CLK_OSC32K_FANOUT]	= &osc32k_fanout_clk.common.hw,
+		[CLK_IOSC]		= &iosc_clk.hw,
+
+		[CLK_IOSC_32K]		= &iosc_32k_clk.hw,
+		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
+		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
+		[CLK_RTC_32K]		= &rtc_32k_mux_clk.common.hw,
+		[CLK_RTC_SPI]		= &rtc_spi_clk.common.hw,
+	},
+};
+
+static const struct sunxi_ccu_desc sun50i_h616_rtc_ccu_desc = {
+	.ccu_clks	= sun50i_h616_rtc_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun50i_h616_rtc_ccu_clks),
+
+	.hw_clks	= &sun50i_h616_rtc_ccu_hw_clks,
+};
+
+static const struct sunxi_ccu_desc sun50i_r329_rtc_ccu_desc = {
+	.ccu_clks	= sun50i_r329_rtc_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun50i_r329_rtc_ccu_clks),
+
+	.hw_clks	= &sun50i_r329_rtc_ccu_hw_clks,
+};
+
+static void sun50i_h616_rtc_ccu_setup(void)
+{
+	have_iosc_calib = 1;
+
+	/* Remove the second parent as external osc32k is not supported. */
+	osc32k_parents[1] = osc32k_parents[0];
+}
+
+static void sun50i_r329_rtc_ccu_setup(void)
+{
+	have_iosc_calib = 0;
+
+	osc32k_fanout_parents[1] = (struct clk_parent_data) {
+		.hw = &ext_osc32k_gate_clk.common.hw
+	};
+}
+
+static const struct sun6i_rtc_match_data sun50i_h616_rtc_ccu_data = {
+	.desc	= &sun50i_h616_rtc_ccu_desc,
+	.setup	= sun50i_h616_rtc_ccu_setup,
+};
+
+static const struct sun6i_rtc_match_data sun50i_r329_rtc_ccu_data = {
+	.desc	= &sun50i_r329_rtc_ccu_desc,
+	.setup	= sun50i_r329_rtc_ccu_setup,
+};
+
+static const struct of_device_id sun6i_rtc_ccu_match[] = {
+	{
+		.compatible	= "allwinner,sun50i-h616-rtc",
+		.data		= &sun50i_h616_rtc_ccu_data,
+	},
+	{
+		.compatible	= "allwinner,sun50i-r329-rtc",
+		.data		= &sun50i_r329_rtc_ccu_data,
+	},
+};
+
+int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
+{
+	struct device_node *node = dev->of_node;
+	const struct sun6i_rtc_match_data *data;
+	const struct of_device_id *match;
+	int i;
+
+	match = of_match_device(sun6i_rtc_ccu_match, dev);
+	if (!match)
+		return 0;
+
+	data = match->data;
+
+	/* ext-osc32k was the only input clock in the old binding. */
+	if (!of_property_read_bool(node, "clock-names"))
+		ext_osc32k[0].fw_name = NULL;
+
+	/* Rename the first 3 clocks to respect clock-output-names. */
+	for (i = CLK_OSC32K; i <= CLK_IOSC; ++i) {
+		struct clk_init_data *init = (struct clk_init_data *)
+			data->desc->hw_clks->hws[i]->init;
+
+		of_property_read_string_index(node, "clock-output-names", i,
+					      &init->name);
+	}
+
+	data->setup();
+
+	return devm_sunxi_ccu_probe(dev, reg, data->desc);
+}
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
new file mode 100644
index 000000000000..5c91dc1fb3eb
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _CCU_SUN6I_RTC_H
+#define _CCU_SUN6I_RTC_H
+
+#include <dt-bindings/clock/sun6i-rtc.h>
+
+#define CLK_IOSC_32K		4
+#define CLK_EXT_OSC32K_GATE	5
+#define CLK_OSC24M_32K		6
+#define CLK_RTC_32K		7
+#define CLK_RTC_SPI		8
+
+#define CLK_NUMBER		(CLK_RTC_SPI + 1)
+
+#endif /* _CCU_SUN6I_RTC_H */
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index b77288f44118..a2115a21807d 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -24,6 +24,7 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 
 	spin_unlock_irqrestore(common->lock, flags);
 }
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_disable, SUNXI_CCU);
 
 static void ccu_gate_disable(struct clk_hw *hw)
 {
@@ -49,6 +50,7 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_enable, SUNXI_CCU);
 
 static int ccu_gate_enable(struct clk_hw *hw)
 {
@@ -64,6 +66,7 @@ int ccu_gate_helper_is_enabled(struct ccu_common *common, u32 gate)
 
 	return readl(common->base + common->reg) & gate;
 }
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_is_enabled, SUNXI_CCU);
 
 static int ccu_gate_is_enabled(struct clk_hw *hw)
 {
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 711832c758ae..079c7c8f3b54 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -13,6 +13,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/sunxi-ng.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/fs.h>
@@ -683,6 +684,10 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 		chip->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(chip->base))
 			return PTR_ERR(chip->base);
+
+		ret = sun6i_rtc_ccu_probe(&pdev->dev, chip->base);
+		if (ret)
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, chip);
diff --git a/include/linux/clk/sunxi-ng.h b/include/linux/clk/sunxi-ng.h
index cf32123b39f5..0630298686ee 100644
--- a/include/linux/clk/sunxi-ng.h
+++ b/include/linux/clk/sunxi-ng.h
@@ -9,4 +9,13 @@
 int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode);
 int sunxi_ccu_get_mmc_timing_mode(struct clk *clk);
 
+#ifdef CONFIG_SUN6I_RTC_CCU
+int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg);
+#else
+static inline int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
+{
+	return 0;
+}
+#endif
+
 #endif
-- 
2.31.1

