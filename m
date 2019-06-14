Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93DF452B3
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 05:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfFNDUG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Jun 2019 23:20:06 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:34690 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFNDUF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Jun 2019 23:20:05 -0400
Received: from tony.xie?rock-chips.com (unknown [192.168.167.152])
        by lucky1.263xmail.com (Postfix) with ESMTP id 28D7C54DEB;
        Fri, 14 Jun 2019 11:17:43 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P20303T139952891324160S1560482259794024_;
        Fri, 14 Jun 2019 11:17:41 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <253e62f960b9431d8ca182157cc282f4>
X-RL-SENDER: tony.xie@rock-chips.com
X-SENDER: xxx@rock-chips.com
X-LOGIN-NAME: tony.xie@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Tony Xie <tony.xie@rock-chips.com>
To:     heiko@sntech.de
Cc:     broonie@kernel.org, lee.jones@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com, tony.xie@rock-chips.com
Subject: [PATCH v9 6/6] clk: RK808: add RK809 and RK817 support.
Date:   Thu, 13 Jun 2019 23:17:38 -0400
Message-Id: <20190614031738.15909-1-tony.xie@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614031425.15741-1-tony.xie@rock-chips.com>
References: <20190614031425.15741-1-tony.xie@rock-chips.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RK809 and RK817 are power management IC chips for multimedia products.
most of their functions and registers are same, including the clkout
funciton.

Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/Kconfig     |  9 +++---
 drivers/clk/clk-rk808.c | 64 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e5b2fe80eab4..532ab112fa8a 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -52,13 +52,12 @@ config COMMON_CLK_MAX9485
 	  This driver supports Maxim 9485 Programmable Audio Clock Generator
 
 config COMMON_CLK_RK808
-	tristate "Clock driver for RK805/RK808/RK818"
+	tristate "Clock driver for RK805/RK808/RK809/RK817/RK818"
 	depends on MFD_RK808
 	---help---
-	  This driver supports RK805, RK808 and RK818 crystal oscillator clock. These
-	  multi-function devices have two fixed-rate oscillators,
-	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
-	  by control register.
+	  This driver supports RK805, RK809 and RK817, RK808 and RK818 crystal oscillator clock.
+	  These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
+	  Clkout1 is always on, Clkout2 can off by control register.
 
 config COMMON_CLK_HI655X
 	tristate "Clock driver for Hi655x" if EXPERT
diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
index 8d90bdf5b946..75f2cf0dfc9f 100644
--- a/drivers/clk/clk-rk808.c
+++ b/drivers/clk/clk-rk808.c
@@ -96,6 +96,68 @@ of_clk_rk808_get(struct of_phandle_args *clkspec, void *data)
 	return idx ? &rk808_clkout->clkout2_hw : &rk808_clkout->clkout1_hw;
 }
 
+static int rk817_clkout2_enable(struct clk_hw *hw, bool enable)
+{
+	struct rk808_clkout *rk808_clkout = container_of(hw,
+							 struct rk808_clkout,
+							 clkout2_hw);
+	struct rk808 *rk808 = rk808_clkout->rk808;
+
+	return regmap_update_bits(rk808->regmap, RK817_SYS_CFG(1),
+				  RK817_CLK32KOUT2_EN,
+				  enable ? RK817_CLK32KOUT2_EN : 0);
+}
+
+static int rk817_clkout2_prepare(struct clk_hw *hw)
+{
+	return rk817_clkout2_enable(hw, true);
+}
+
+static void rk817_clkout2_unprepare(struct clk_hw *hw)
+{
+	rk817_clkout2_enable(hw, false);
+}
+
+static int rk817_clkout2_is_prepared(struct clk_hw *hw)
+{
+	struct rk808_clkout *rk808_clkout = container_of(hw,
+							 struct rk808_clkout,
+							 clkout2_hw);
+	struct rk808 *rk808 = rk808_clkout->rk808;
+	unsigned int val;
+
+	int ret = regmap_read(rk808->regmap, RK817_SYS_CFG(1), &val);
+
+	if (ret < 0)
+		return 0;
+
+	return (val & RK817_CLK32KOUT2_EN) ? 1 : 0;
+}
+
+static const struct clk_ops rk817_clkout2_ops = {
+	.prepare = rk817_clkout2_prepare,
+	.unprepare = rk817_clkout2_unprepare,
+	.is_prepared = rk817_clkout2_is_prepared,
+	.recalc_rate = rk808_clkout_recalc_rate,
+};
+
+static const struct clk_ops *rkpmic_get_ops(long variant)
+{
+	switch (variant) {
+	case RK809_ID:
+	case RK817_ID:
+		return &rk817_clkout2_ops;
+	/*
+	 * For the default case, it match the following PMIC type.
+	 * RK805_ID
+	 * RK808_ID
+	 * RK818_ID
+	 */
+	default:
+		return &rk808_clkout2_ops;
+	}
+}
+
 static int rk808_clkout_probe(struct platform_device *pdev)
 {
 	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
@@ -127,7 +189,7 @@ static int rk808_clkout_probe(struct platform_device *pdev)
 		return ret;
 
 	init.name = "rk808-clkout2";
-	init.ops = &rk808_clkout2_ops;
+	init.ops = rkpmic_get_ops(rk808->variant);
 	rk808_clkout->clkout2_hw.init = &init;
 
 	/* optional override of the clockname */
-- 
2.17.1



