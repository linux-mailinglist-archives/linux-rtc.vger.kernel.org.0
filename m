Return-Path: <linux-rtc+bounces-5819-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCs4MjK2cGndZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5819-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:19:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73055E48
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4937F961D5A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720C147D956;
	Wed, 21 Jan 2026 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="VwcMeXZs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F247ECCB;
	Wed, 21 Jan 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993510; cv=pass; b=UWV3f3bhTyassX3N+SY1ZM4SLOn+BzFCSJFpX5OwIv3zK7OqEuoOgWyN8WnSPNmujpudsRriemfOslhIVl8ULsihueiLQS5/t3ipKs2r3YINTrW62WHxB6qJBnRVjBD87d/2O8abZjcn9KSn8QpDM+Yu2Wq4rrORFmRXvMhQ59E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993510; c=relaxed/simple;
	bh=XzyKX1iXhjH/xe6SwbPUU2TPiS68z964fkgnLa/Ll7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h59/JSmMs+UzQwbtPYmfUPW+P69GyorHc73+GjmWxYedeuXMqbK9ti/jr/CSPl82g40+QdToHlk5+H0gikIbX/mo4M/BTG5XO5phh5OkgjsKPCDjsFasBli0ZD3mryUqQ3lOwtZh5L6Z33rPTP+YLoVXUJ9nm19QnxkW0t8Shnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=VwcMeXZs; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993490; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CnmSDABxcOhHqfA89YMjM7rS8TBHbSfyJtkC0E2Ocxunxj81oT5Mznny52K1c3/HWQ1hYkV3LhIoOKxSqBXNpJOdJ29zat1+HPf5mhtt7SbE2ok93TR4YnIg/oSFp0pI7ICcrcdoK/eBE2fCKkRnVAWmvj3QsSSrf/WuRAlgHcI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993490; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c+vBV4VT1dMjsTAU9tsfPgC8rjnBjBQSGpwb/wpSV2s=; 
	b=npwVALibQKN7qOrX1A002P2CXw+xmBWvEDswr6yxXYApGVbH+NwmAusZcDCSeapkh6kKBBkQXqfSASeNAJsfSAQaeohqOWlzCGVR9EbPrvG9hQvDCRhVOF2XHLNZH7zgkLLmx8o45Hu7btXlZP/pzFhNFQZodcScSVOusPG35Lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993490;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=c+vBV4VT1dMjsTAU9tsfPgC8rjnBjBQSGpwb/wpSV2s=;
	b=VwcMeXZs8A2M9bULzdko8GAaqWCwf+mUEITdtkXoVVqqJ+A5pVUTDkkPkBJE0wQZ
	TZdJrcLTqxo41HD7j6oGYIb/DkaAoFLYQNJlnm+vbn1DKdF4GuqOOYr4dCgcDOiuxuY
	SgehDodgCmb4wvVOjdMyI+OPkgbjhq8JJ8hDjN4k=
Received: by mx.zohomail.com with SMTPS id 1768993486830785.6868370776832;
	Wed, 21 Jan 2026 03:04:46 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:13 +0800
Subject: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=10406;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=XzyKX1iXhjH/xe6SwbPUU2TPiS68z964fkgnLa/Ll7U=;
 b=b3o2BSCLMzB6Z0pr+Id6k3NBkfOa2eF/19I1MilbZG3CXD9a9RyaTnEkxci/Tc9KoV401PqlJ
 43O28YMPUdjBktQNZ+pnuzGTdv0Vd+zXnkhvII5PThTjnoTTTwFRW1a
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5819-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 5D73055E48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the internal CCU found in the RTC module of the Allwinner
A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatible
with older SoCs like the sun6i, the A733 introduces several new features.

The A733 RTC CCU supports choosing one of three external crystal
frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
logic to automatically identify the frequency used on the board and
exports this DCXO signal as the "hosc" clock.

Furthermore, the driver implements logic to derive a 32kHz reference
from the HOSC. This is achieved through a muxed clock path using fixed
pre-dividers to normalize the different crystal frequencies to ~32kHz.
This path reuses the same hardware mux registers as the HOSC clock.

Additionally, this CCU provides several gate clocks for specific
peripherals, including SerDes, HDMI, and UFS. The driver is implemented
as an auxiliary driver to be bound to the sun6i-rtc driver.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/Kconfig               |   5 +
 drivers/clk/sunxi-ng/Makefile              |   2 +
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c | 204 +++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h |  18 +++
 drivers/clk/sunxi-ng/ccu_rtc.h             |   7 +
 5 files changed, 236 insertions(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 6af2d020e03e..16afbf249f26 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
 	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
+config SUN60I_A733_RTC_CCU
+	tristate "Support for the Allwinner A733 RTC CCU"
+	default ARCH_SUNXI
+	depends on ARM64 || COMPILE_TEST
+
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
 	default ARCH_SUNXI
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index c3f810a025a8..b0d823440c33 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SUN50I_H616_CCU)	+= sun50i-h616-ccu.o
 obj-$(CONFIG_SUN55I_A523_CCU)	+= sun55i-a523-ccu.o
 obj-$(CONFIG_SUN55I_A523_MCU_CCU)	+= sun55i-a523-mcu-ccu.o
 obj-$(CONFIG_SUN55I_A523_R_CCU)	+= sun55i-a523-r-ccu.o
+obj-$(CONFIG_SUN60I_A733_RTC_CCU)	+= sun60i-a733-rtc-ccu.o
 obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
@@ -67,6 +68,7 @@ sun50i-h616-ccu-y		+= ccu-sun50i-h616.o
 sun55i-a523-ccu-y		+= ccu-sun55i-a523.o
 sun55i-a523-mcu-ccu-y		+= ccu-sun55i-a523-mcu.o
 sun55i-a523-r-ccu-y		+= ccu-sun55i-a523-r.o
+sun60i-a733-rtc-ccu-y		+= ccu-sun60i-a733-rtc.o
 sun4i-a10-ccu-y			+= ccu-sun4i-a10.o
 sun5i-ccu-y			+= ccu-sun5i.o
 sun6i-a31-ccu-y			+= ccu-sun6i-a31.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c
new file mode 100644
index 000000000000..d17aceffa16e
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+
+#include "ccu_common.h"
+
+#include "ccu_gate.h"
+#include "ccu_mux.h"
+#include "ccu_rtc.h"
+
+#include "ccu-sun60i-a733-rtc.h"
+
+static struct ccu_common iosc_clk = {
+	.reg		= DCXO_CTRL_REG,
+	.features	= CCU_FEATURE_IOSC_CALIBRATION,
+	.hw.init	= CLK_HW_INIT_NO_PARENT("iosc", &ccu_iosc_ops,
+						CLK_GET_RATE_NOCACHE),
+};
+
+static struct ccu_common iosc_32k_clk = {
+	.features	= CCU_FEATURE_IOSC_CALIBRATION,
+	.hw.init	= CLK_HW_INIT_HW("iosc-32k", &iosc_clk.hw,
+					 &ccu_iosc_32k_ops,
+					 CLK_GET_RATE_NOCACHE),
+};
+
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			 "ext-osc32k", 0x0, BIT(4), 0);
+
+static const struct clk_hw *osc32k_parents[] = {
+	&iosc_32k_clk.hw,
+	&ext_osc32k_gate_clk.common.hw,
+};
+
+static struct ccu_mux osc32k_clk = {
+	.mux	= _SUNXI_CCU_MUX(0, 1),
+	.common	= {
+		.reg		= LOSC_CTRL_REG,
+		.features	= CCU_FEATURE_KEY_FIELD,
+		.hw.init	= CLK_HW_INIT_PARENTS_HW("osc32k",
+							 osc32k_parents,
+							 &ccu_mux_ops,
+							 0),
+	},
+};
+
+static const struct clk_parent_data hosc_parents[] = {
+	{ .fw_name = "osc24M" },
+	{ .fw_name = "osc19M" },
+	{ .fw_name = "osc26M" },
+	{ .fw_name = "osc24M" },
+};
+
+struct ccu_mux hosc_clk = {
+	.enable	= DCXO_CTRL_DCXO_EN,
+	.mux	= _SUNXI_CCU_MUX(14, 2),
+	.common	= {
+		.reg		= DCXO_CTRL_REG,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("hosc",
+							   hosc_parents,
+							   &ccu_mux_ro_ops,
+							   0),
+	},
+};
+
+static const struct ccu_mux_fixed_prediv hosc_32k_predivs[] = {
+	{ .index = 0, .div = 732 },
+	{ .index = 1, .div = 586 },
+	{ .index = 2, .div = 793 },
+	{ .index = 3, .div = 732 },
+};
+
+static struct ccu_mux hosc_32k_mux_clk = {
+	.enable		= DCXO_CTRL_DCXO_EN,
+	.mux		= {
+		.shift		= 14,
+		.width		= 2,
+		.fixed_predivs	= hosc_32k_predivs,
+		.n_predivs	= ARRAY_SIZE(hosc_32k_predivs),
+	},
+	.common		= {
+		.reg		= DCXO_CTRL_REG,
+		.features	= CCU_FEATURE_FIXED_PREDIV,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("hosc-32k-mux",
+							   hosc_parents,
+							   &ccu_mux_ro_ops,
+							   0),
+	},
+};
+
+static SUNXI_CCU_GATE_HW(hosc_32k_clk, "hosc-32k", &hosc_32k_mux_clk.common.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
+static const struct clk_hw *rtc_32k_parents[] = {
+	&osc32k_clk.common.hw,
+	&hosc_32k_clk.common.hw,
+};
+
+static struct ccu_mux rtc_32k_clk = {
+	.mux	= _SUNXI_CCU_MUX(1, 1),
+	.common	= {
+		.reg		= LOSC_CTRL_REG,
+		.features	= CCU_FEATURE_KEY_FIELD,
+		.hw.init	= CLK_HW_INIT_PARENTS_HW("rtc-32k",
+							 rtc_32k_parents,
+							 &ccu_mux_ops,
+							 0),
+	},
+};
+
+static const struct clk_parent_data osc32k_fanout_parents[] = {
+	{ .hw = &osc32k_clk.common.hw },
+	{ .hw = &ext_osc32k_gate_clk.common.hw },
+	{ .hw = &hosc_32k_clk.common.hw },
+};
+
+static SUNXI_CCU_MUX_DATA_WITH_GATE(osc32k_fanout_clk, "osc32k-fanout", osc32k_fanout_parents,
+				    LOSC_OUT_GATING_REG,
+				    1, 2,	/* mux */
+				    BIT(0),	/* gate */
+				    0);
+
+static SUNXI_CCU_GATE_HW(hosc_serdes1_clk, "hosc-serdes1", &hosc_clk.common.hw,
+			 DCXO_GATING_REG, DCXO_SERDES1_GATING, 0);
+static SUNXI_CCU_GATE_HW(hosc_serdes0_clk, "hosc-serdes0", &hosc_clk.common.hw,
+			 DCXO_GATING_REG, DCXO_SERDES0_GATING, 0);
+static SUNXI_CCU_GATE_HW(hosc_hdmi_clk, "hosc-hdmi", &hosc_clk.common.hw,
+			 DCXO_GATING_REG, DCXO_HDMI_GATING, 0);
+static SUNXI_CCU_GATE_HW(hosc_ufs_clk, "hosc-ufs", &hosc_clk.common.hw,
+			 DCXO_GATING_REG, DCXO_UFS_GATING, 0);
+
+static struct ccu_common *sun60i_rtc_ccu_clks[] = {
+	&iosc_clk,
+	&iosc_32k_clk,
+	&ext_osc32k_gate_clk.common,
+	&osc32k_clk.common,
+	&hosc_clk.common,
+	&hosc_32k_mux_clk.common,
+	&hosc_32k_clk.common,
+	&rtc_32k_clk.common,
+	&osc32k_fanout_clk.common,
+	&hosc_serdes1_clk.common,
+	&hosc_serdes0_clk.common,
+	&hosc_hdmi_clk.common,
+	&hosc_ufs_clk.common,
+};
+
+static struct clk_hw_onecell_data sun60i_rtc_ccu_hw_clks = {
+	.num = CLK_NUMBER,
+	.hws = {
+		[CLK_IOSC]		= &iosc_clk.hw,
+		[CLK_OSC32K]		= &osc32k_clk.common.hw,
+		[CLK_HOSC]		= &hosc_clk.common.hw,
+		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC32K_FANOUT]	= &osc32k_fanout_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_IOSC_32K]		= &iosc_32k_clk.hw,
+		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
+		[CLK_HOSC_32K_MUX]	= &hosc_32k_mux_clk.common.hw,
+		[CLK_HOSC_32K]		= &hosc_32k_clk.common.hw,
+	},
+};
+
+static const struct sunxi_ccu_desc sun60i_rtc_ccu_desc = {
+	.ccu_clks	= sun60i_rtc_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun60i_rtc_ccu_clks),
+
+	.hw_clks	= &sun60i_rtc_ccu_hw_clks,
+};
+
+static int sun60i_rtc_ccu_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	void __iomem *reg = dev->platform_data;
+
+	return devm_sunxi_ccu_probe(dev, reg, &sun60i_rtc_ccu_desc);
+}
+
+static const struct auxiliary_device_id sun60i_ccu_rtc_ids[] = {
+	{ .name = SUN6I_RTC_AUX_ID(sun60i) },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sun60i_ccu_rtc_ids);
+
+static struct auxiliary_driver sun60i_ccu_rtc_driver = {
+	.probe = sun60i_rtc_ccu_probe,
+	.id_table = sun60i_ccu_rtc_ids,
+};
+module_auxiliary_driver(sun60i_ccu_rtc_driver);
+
+MODULE_IMPORT_NS("SUNXI_CCU");
+MODULE_DESCRIPTION("Support for the Allwinner A733 RTC CCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h
new file mode 100644
index 000000000000..41ec6195b5e7
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#ifndef _CCU_SUN60I_A733_RTC_H_
+#define _CCU_SUN60I_A733_RTC_H_
+
+#include <dt-bindings/clock/sun60i-a733-rtc.h>
+
+#define CLK_IOSC_32K		9
+#define CLK_EXT_OSC32K_GATE	10
+#define CLK_HOSC_32K_MUX	11
+#define CLK_HOSC_32K		12
+
+#define CLK_NUMBER		(CLK_HOSC_32K + 1)
+
+#endif /* _CCU_SUN60I_A733_RTC_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_rtc.h
index 1c44c2206a25..665162723796 100644
--- a/drivers/clk/sunxi-ng/ccu_rtc.h
+++ b/drivers/clk/sunxi-ng/ccu_rtc.h
@@ -27,8 +27,15 @@
 #define LOSC_OUT_GATING_REG		0x60
 
 #define DCXO_CTRL_REG			0x160
+#define DCXO_CTRL_DCXO_EN		BIT(1)
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define DCXO_GATING_REG			0x16c
+#define DCXO_SERDES1_GATING		BIT(5)
+#define DCXO_SERDES0_GATING		BIT(4)
+#define DCXO_HDMI_GATING		BIT(1)
+#define DCXO_UFS_GATING			BIT(0)
+
 #define SUN6I_RTC_AUX_ID(_name)		"rtc_sun6i." #_name
 
 extern const struct clk_ops ccu_iosc_ops;

-- 
2.52.0


