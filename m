Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC154FB6B6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 11:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344101AbiDKJC6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 05:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344064AbiDKJC4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 05:02:56 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718513ED2C;
        Mon, 11 Apr 2022 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649667642; x=1681203642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FpEDA+GS5qfcXtMPCXwZ6dkNuDr6m2XDr85AWQXzJ7E=;
  b=cQO7cA1vTphqBGKByfQXiq3vsjRiwzpWJ2X7yFi7DI9G/waHgJbLHRhk
   Svg1wKgwCAUSNji/R7I4A5BZvxkMegBOHjrkaW78KAdbK3kFZ9yrFDuIE
   SexiW/wvhMcun1xJAfL+q+Ztr/0d5ocR9oJvpjzBmDtHfwvUNPpVRraPf
   c/gcCXZVIWO5ZSiZNj8ceSoQSLsY1sfG0EfSvf35KdIVEIihN3MUlvC1L
   SzFrHjbSUaSkH/ANj5PujmXZbCt91YSTdJVulXuOJ+cUZkAKVlYLevq2N
   ZstWA8k2os2kUY4NrLhbdL9bm43qqO55uSmpIVMFN2jgt7UaiJK436AMG
   g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="160047649"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 02:00:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 02:00:38 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 7/9] clk: microchip: mpfs: re-parent the configurable clocks
Date:   Mon, 11 Apr 2022 09:59:15 +0100
Message-ID: <20220411085916.941433-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently the mpfs clock driver uses a reference clock called the
"msspll", set in the device tree, as the parent for the cpu/axi/ahb
(config) clocks. The frequency of the msspll is determined by the FPGA
bitstream & the bootloader configures the clock to match the bitstream.
The real reference is provided by a 100 or 125 MHz off chip oscillator.

However, the msspll clock is not actually the parent of all clocks on
the system - the reference clock for the rtc/mtimer actually has the
off chip oscillator as its parent.

In order to fix this, add support for reading the configuration of the
msspll & reparent the "config" clocks so that they are derived from
this clock rather than the reference in the device tree.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

@Stephen/Mike: Is it acceptable to add the recalc rate without a set
rate? If not lmk and I will add one.

 drivers/clk/microchip/clk-mpfs.c | 151 +++++++++++++++++++++++++++----
 1 file changed, 132 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index a361b8743a32..7c8dd5924c05 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -11,20 +11,47 @@
 #include <dt-bindings/clock/microchip,mpfs-clock.h>
 
 /* address offset of control registers */
+#define REG_MSSPLL_REF_CR	0x08u
+#define REG_MSSPLL_POSTDIV_CR	0x10u
+#define REG_MSSPLL_SSCG_2_CR	0x2Cu
 #define REG_CLOCK_CONFIG_CR	0x08u
 #define REG_SUBBLK_CLOCK_CR	0x84u
 #define REG_SUBBLK_RESET_CR	0x88u
 
+#define MSSPLL_FBDIV_SHIFT	0x00u
+#define MSSPLL_FBDIV_WIDTH	0x0Cu
+#define MSSPLL_REFDIV_SHIFT	0x08u
+#define MSSPLL_REFDIV_WIDTH	0x06u
+#define MSSPLL_POSTDIV_SHIFT	0x08u
+#define MSSPLL_POSTDIV_WIDTH	0x07u
+#define MSSPLL_FIXED_DIV	4u
+
 struct mpfs_clock_data {
 	void __iomem *base;
+	void __iomem *msspll_base;
 	struct clk_hw_onecell_data hw_data;
 };
 
+struct mpfs_msspll_hw_clock {
+	void __iomem *base;
+	unsigned int id;
+	u32 reg_offset;
+	u32 shift;
+	u32 width;
+	u32 flags;
+	struct clk_hw hw;
+	struct clk_init_data init;
+};
+
+#define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
+
 struct mpfs_cfg_clock {
 	const struct clk_div_table *table;
 	unsigned int id;
+	u32 reg_offset;
 	u8 shift;
 	u8 width;
+	u8 flags;
 };
 
 struct mpfs_cfg_hw_clock {
@@ -55,7 +82,7 @@ struct mpfs_periph_hw_clock {
  */
 static DEFINE_SPINLOCK(mpfs_clk_lock);
 
-static const struct clk_parent_data mpfs_cfg_parent[] = {
+static const struct clk_parent_data mpfs_ext_ref[] = {
 	{ .index = 0 },
 };
 
@@ -69,6 +96,75 @@ static const struct clk_div_table mpfs_div_ahb_table[] = {
 	{ 0, 0 }
 };
 
+static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
+	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
+	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
+	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
+	u32 mult, ref_div, postdiv;
+
+	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
+	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
+	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
+	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
+	postdiv = readl_relaxed(postdiv_addr) >> MSSPLL_POSTDIV_SHIFT;
+	postdiv &= clk_div_mask(MSSPLL_POSTDIV_WIDTH);
+
+	return prate * mult / (ref_div * MSSPLL_FIXED_DIV * postdiv);
+}
+
+static const struct clk_ops mpfs_clk_msspll_ops = {
+	.recalc_rate = mpfs_clk_msspll_recalc_rate,
+};
+
+#define CLK_PLL(_id, _name, _parent, _shift, _width, _flags, _offset) {			\
+	.id = _id,									\
+	.shift = _shift,								\
+	.width = _width,								\
+	.reg_offset = _offset,								\
+	.flags = _flags,								\
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent, &mpfs_clk_msspll_ops, 0),	\
+}
+
+static struct mpfs_msspll_hw_clock mpfs_msspll_clks[] = {
+	CLK_PLL(CLK_MSSPLL, "clk_msspll", mpfs_ext_ref, MSSPLL_FBDIV_SHIFT,
+		MSSPLL_FBDIV_WIDTH, 0, REG_MSSPLL_SSCG_2_CR),
+};
+
+static int mpfs_clk_register_msspll(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hw,
+				    void __iomem *base)
+{
+	msspll_hw->base = base;
+
+	return devm_clk_hw_register(dev, &msspll_hw->hw);
+}
+
+static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
+				     unsigned int num_clks, struct mpfs_clock_data *data)
+{
+	void __iomem *base = data->msspll_base;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_clks; i++) {
+		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
+
+		ret = mpfs_clk_register_msspll(dev, msspll_hw, base);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
+					     CLK_MSSPLL);
+
+		data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
+	}
+
+	return 0;
+}
+
+/*
+ * "CFG" clocks
+ */
+
 static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
 	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
@@ -76,10 +172,10 @@ static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long p
 	void __iomem *base_addr = cfg_hw->sys_base;
 	u32 val;
 
-	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->shift;
+	val = readl_relaxed(base_addr + cfg->reg_offset) >> cfg->shift;
 	val &= clk_div_mask(cfg->width);
 
-	return prate / (1u << val);
+	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
 }
 
 static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
@@ -105,11 +201,10 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 		return divider_setting;
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
+	val = readl_relaxed(base_addr + cfg->reg_offset);
 	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
 	val |= divider_setting << cfg->shift;
-	writel_relaxed(val, base_addr + REG_CLOCK_CONFIG_CR);
+	writel_relaxed(val, base_addr + cfg->reg_offset);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
 
@@ -122,19 +217,23 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
 	.set_rate = mpfs_cfg_clk_set_rate,
 };
 
-#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags) {		\
-	.cfg.id = _id,								\
-	.cfg.shift = _shift,							\
-	.cfg.width = _width,							\
-	.cfg.table = _table,							\
-	.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent, &mpfs_clk_cfg_ops,	\
-					    _flags),				\
+#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
+	.cfg.id = _id,									\
+	.cfg.shift = _shift,								\
+	.cfg.width = _width,								\
+	.cfg.table = _table,								\
+	.cfg.reg_offset = _offset,							\
+	.cfg.flags = _flags,								\
+	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
 }
 
 static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
-	CLK_CFG(CLK_CPU, "clk_cpu", mpfs_cfg_parent, 0, 2, mpfs_div_cpu_axi_table, 0),
-	CLK_CFG(CLK_AXI, "clk_axi", mpfs_cfg_parent, 2, 2, mpfs_div_cpu_axi_table, 0),
-	CLK_CFG(CLK_AHB, "clk_ahb", mpfs_cfg_parent, 4, 2, mpfs_div_ahb_table, 0),
+	CLK_CFG(CLK_CPU, "clk_cpu", "clk_msspll", 0, 2, mpfs_div_cpu_axi_table, 0,
+		REG_CLOCK_CONFIG_CR),
+	CLK_CFG(CLK_AXI, "clk_axi", "clk_msspll", 2, 2, mpfs_div_cpu_axi_table, 0,
+		REG_CLOCK_CONFIG_CR),
+	CLK_CFG(CLK_AHB, "clk_ahb", "clk_msspll", 4, 2, mpfs_div_ahb_table, 0,
+		REG_CLOCK_CONFIG_CR),
 };
 
 static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
@@ -160,13 +259,17 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     cfg_hw->cfg.id);
 
-		id = cfg_hws[i].cfg.id;
+		id = cfg_hw->cfg.id;
 		data->hw_data.hws[id] = &cfg_hw->hw;
 	}
 
 	return 0;
 }
 
+/*
+ * peripheral clocks - devices connected to axi or ahb buses.
+ */
+
 static int mpfs_periph_clk_enable(struct clk_hw *hw)
 {
 	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
@@ -324,8 +427,9 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	unsigned int num_clks;
 	int ret;
 
-	/* CLK_RESERVED is not part of cfg_clks nor periph_clks, so add 1 */
-	num_clks = ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_clks) + 1;
+	/* CLK_RESERVED is not part of clock arrays, so add 1 */
+	num_clks = ARRAY_SIZE(mpfs_msspll_clks) + ARRAY_SIZE(mpfs_cfg_clks)
+		   + ARRAY_SIZE(mpfs_periph_clks) + 1;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hw_data.hws, num_clks), GFP_KERNEL);
 	if (!clk_data)
@@ -335,8 +439,17 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(clk_data->base))
 		return PTR_ERR(clk_data->base);
 
+	clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(clk_data->msspll_base))
+		return PTR_ERR(clk_data->msspll_base);
+
 	clk_data->hw_data.num = num_clks;
 
+	ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
+					clk_data);
+	if (ret)
+		return ret;
+
 	ret = mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpfs_cfg_clks), clk_data);
 	if (ret)
 		return ret;
-- 
2.35.1

