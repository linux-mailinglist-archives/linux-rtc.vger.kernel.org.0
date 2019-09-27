Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 713B0C071B
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Sep 2019 16:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfI0OPX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Sep 2019 10:15:23 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:58961 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0OPX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Sep 2019 10:15:23 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46fv2b42mvz1rGRj;
        Fri, 27 Sep 2019 16:15:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46fv2b3FCbz1qqkK;
        Fri, 27 Sep 2019 16:15:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id RoaC08cbO-fC; Fri, 27 Sep 2019 16:15:18 +0200 (CEST)
X-Auth-Info: RIzVffhVXjeYrCf6SREmhidKiI/+8A01vOUCNHwJtZU=
Received: from xpert.denx.de (unknown [62.91.23.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 27 Sep 2019 16:15:18 +0200 (CEST)
From:   Parthiban Nallathambi <pn@denx.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        parthitce@gmail.com, Parthiban Nallathambi <pn@denx.de>
Subject: [PATCH] rtc: rv3028: add clkout support
Date:   Fri, 27 Sep 2019 16:15:05 +0200
Message-Id: <20190927141505.640751-1-pn@denx.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3028 provides clkout (enabled by default). Add clkout
to clock framework source and control from device tree for
variable frequency with enable and disable functionality.

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
---
 drivers/rtc/rtc-rv3028.c | 156 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2b316661a578..61a2ed32639f 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/clk-provider.h>
 #include <linux/bcd.h>
 #include <linux/bitops.h>
 #include <linux/i2c.h>
@@ -52,6 +53,11 @@
 #define RV3028_STATUS_CLKF		BIT(6)
 #define RV3028_STATUS_EEBUSY		BIT(7)
 
+#define RV3028_CLKOUT_FD_MASK		GENMASK(2, 0)
+#define RV3028_CLKOUT_PORIE		BIT(3)
+#define RV3028_CLKOUT_CLKSY		BIT(6)
+#define RV3028_CLKOUT_CLKOE		BIT(7)
+
 #define RV3028_CTRL1_EERD		BIT(3)
 #define RV3028_CTRL1_WADA		BIT(5)
 
@@ -84,6 +90,9 @@ struct rv3028_data {
 	struct regmap *regmap;
 	struct rtc_device *rtc;
 	enum rv3028_type type;
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw clkout_hw;
+#endif
 };
 
 static u16 rv3028_trickle_resistors[] = {1000, 3000, 6000, 11000};
@@ -581,6 +590,150 @@ static int rv3028_eeprom_read(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+#define clkout_hw_to_rv3028(hw) container_of(hw, struct rv3028_data, clkout_hw)
+
+static int clkout_rates[] = {
+	32768,
+	8192,
+	1024,
+	64,
+	32,
+	1,
+};
+
+static unsigned long rv3028_clkout_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	int clkout, ret;
+	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
+
+	ret = regmap_read(rv3028->regmap, RV3028_CLKOUT, &clkout);
+	if (ret < 0)
+		return 0;
+
+	clkout &= RV3028_CLKOUT_FD_MASK;
+	return clkout_rates[clkout];
+}
+
+static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] <= rate)
+			return clkout_rates[i];
+
+	return 0;
+}
+
+static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	int i, ret;
+	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
+
+	ret = regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
+				 RV3028_STATUS_CLKF, 0);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++) {
+		if (clkout_rates[i] == rate) {
+			ret = regmap_update_bits(rv3028->regmap,
+						 RV3028_CLKOUT,
+						 RV3028_CLKOUT_FD_MASK, i);
+			if (ret < 0)
+				return ret;
+
+			return regmap_write(rv3028->regmap, RV3028_CLKOUT,
+				RV3028_CLKOUT_CLKSY | RV3028_CLKOUT_CLKOE);
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int rv3028_clkout_prepare(struct clk_hw *hw)
+{
+	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
+
+	return regmap_write(rv3028->regmap, RV3028_CLKOUT,
+			    RV3028_CLKOUT_CLKSY | RV3028_CLKOUT_CLKOE);
+}
+
+static void rv3028_clkout_unprepare(struct clk_hw *hw)
+{
+	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
+
+	regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
+	regmap_update_bits(rv3028->regmap, RV3028_STATUS,
+			   RV3028_STATUS_CLKF, 0);
+}
+
+static int rv3028_clkout_is_prepared(struct clk_hw *hw)
+{
+	int clkout, ret;
+	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
+
+	ret = regmap_read(rv3028->regmap, RV3028_CLKOUT, &clkout);
+	if (ret < 0)
+		return ret;
+
+	return !!(clkout & RV3028_CLKOUT_CLKOE);
+}
+
+static const struct clk_ops rv3028_clkout_ops = {
+	.prepare = rv3028_clkout_prepare,
+	.unprepare = rv3028_clkout_unprepare,
+	.is_prepared = rv3028_clkout_is_prepared,
+	.recalc_rate = rv3028_clkout_recalc_rate,
+	.round_rate = rv3028_clkout_round_rate,
+	.set_rate = rv3028_clkout_set_rate,
+};
+
+static int rv3028_clkout_register_clk(struct rv3028_data *rv3028,
+				      struct i2c_client *client)
+{
+	int ret;
+	struct clk *clk;
+	struct clk_init_data init;
+	struct device_node *node = client->dev.of_node;
+
+	/* disable the clkout output */
+	ret = regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
+				 RV3028_STATUS_CLKF, 0);
+	if (ret < 0)
+		return ret;
+
+	init.name = "rv3028-clkout";
+	init.ops = &rv3028_clkout_ops;
+	init.flags = 0;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+	rv3028->clkout_hw.init = &init;
+
+	/* optional override of the clockname */
+	of_property_read_string(node, "clock-output-names", &init.name);
+
+	/* register the clock */
+	clk = devm_clk_register(&client->dev, &rv3028->clkout_hw);
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return 0;
+}
+#endif
+
 static struct rtc_class_ops rv3028_rtc_ops = {
 	.read_time = rv3028_get_time,
 	.set_time = rv3028_set_time,
@@ -708,6 +861,9 @@ static int rv3028_probe(struct i2c_client *client)
 
 	rv3028->rtc->max_user_freq = 1;
 
+#ifdef CONFIG_COMMON_CLK
+	rv3028_clkout_register_clk(rv3028, client);
+#endif
 	return 0;
 }
 
-- 
2.21.0

