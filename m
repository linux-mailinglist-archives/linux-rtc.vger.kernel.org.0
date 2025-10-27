Return-Path: <linux-rtc+bounces-5167-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF53C0BDBF
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 06:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF973B9A75
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 05:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079A22D7390;
	Mon, 27 Oct 2025 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="vkDEBXkE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D532D63F6;
	Mon, 27 Oct 2025 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544116; cv=none; b=DEZ/im8o0HksA24Tz9vXm6Aav5o1bd1iPBNBxAdDRA0Lc48IvBgjt282hf7IgipYq+El2CN+JM9S2At/Q6rjR5OsMEGLCH7hmwGTGJLD+QJxQjZu4g2/rfhWZGtqW7RuYS0EMqk5Bb8ZrcXswBSPpwkmt45yWSg/EZXcY8QBOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544116; c=relaxed/simple;
	bh=HijjJQqixOK6zBE0X50y2zZxQHMVxg0eoVuuUv55tPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VE3QPQaI/DvbAK0pNOtnWstUTo+0nlROKcnhMoAdqe9r1dCJq+O9Lblb8a2d+0I0+HytP+3jK78DY3MpEMkOgHItyphlZewkkOA+31M//+8wfORUeTEnAbIn1UpiGmTQwYfOi3uKnhSWKSRY5RiqbwxBj0idEjdyZUZhXVZ/c+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=vkDEBXkE; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544103;
	bh=osDKSxZ9iL9lXmA+A93cxMKQAyY4F8JQ8F1+RvWiVUY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vkDEBXkEDAG2wXmwNO8SXxpMQlLwafIEUtutzXYQi+j3QwDRAxQsJOFJJUEO8AUq5
	 uOc2ELscncIINGymoQLQx54DKHKt0DCq4MmsUc0gC31IpiNtIT+yMGeSXZpV9yFNZ+
	 7ORc0Yqyq4AV56h/q68z/vaXlwyijHLiMdELUoow=
X-QQ-mid: zesmtpsz3t1761544099tb27a8db4
X-QQ-Originating-IP: spUKjLANILR6/6GBQO/9zPxVAllQLwBv5cGfy7i5OBs=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3084566462975834195
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:06 +0800
Subject: [PATCH v2 2/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-2-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=10791;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=HijjJQqixOK6zBE0X50y2zZxQHMVxg0eoVuuUv55tPo=;
 b=VAowZPuxI66TFh/GxtVtpZBdlqiVDoplTewNQ9cNJ5A8IYasuo2Ex54rtoQH+OoCJNHM8Va3l
 i6opmXC0JXFBP6ncKmyc+ORF3d4iuZff8rR+DNETx0oCaAax+fX5RGW
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M78WKa2q/EK4gOaJH6dlBHhbDC0QFDCHC8y5jMT9rCAgud5BzmQeWSj6
	ukH1bRhjJx0OacKK/is7IfbCFvV1UqK4E9c+CqDOKtwveKcFW/18kaTX9ygNQaUDQ/U9dNC
	4yxExGwNk5xJoQvwqayY511ncpYOoT19Y/r6YleHb58w329G1SVTp/xNA5LVJ2stxSArPCL
	H0xf5VaGlbmYrk/I3tfZ0Sd3eTgHsJ1XqoR6DdRCfNfOaC5gkbmvuj9EYpkY3Oab6fJ3gUs
	LEDUBbCFe/arMtsrmhSaTwP3eRbHI4yI2ZSh6bLu3TGLcRdvXKaKElbkrBd3IHzkuXVr/GE
	bCY/cWQxv/jVhlqthPhufPQnelYbR8sdRL2RfJ6s3vOcd3QVjIp0N74rRUNPsNWgxuqjkFf
	0Y6FuBNWFSkIPA1j1Y1KgySdTwVO7G3/6ypLyp2Kp0JqKnobkPB+5yqfZNgUrjwwkzbBrNE
	004Wi82iZ1cuFDcXzVWl5wtpYpx4gcaBC4fl9TQ0JNFOyL3ORF4voFzt9TUZ3MZ0jfuzftl
	i9S6Ev1wDu4sBq0LO233sy74xu9vb3H1J8rQtG9TMu0VKhKBDSsZiior+HO9ZbWmR4FStfB
	f6UAA0n/+AC8YdAFZlxJ+oBIiUVaPfJ8IxtGXbfwyJFBMKQWicdm+hntRxKWCF1+BDY94Li
	Nyj4D7OS0/s4aFe3sKsDcnaZG5Ht9sdZLFrD9LQQNUFcco0HZUXs0uVWLnIVhrIpPFBqyRB
	vUN07VL/H1PGln8ZVRGq8t6EJAqEUmsxrP4fs071vb9uFfIOGzScJlD6JBc7he5TdXZ1M0e
	MyCZR6hZAfxheTOzsEkk05eVc7GTx4VMjCJfN9E0io1LHiLf1Fpl6Aptm1tvJ7f3UKS+6MO
	Q9kIXVQX4lEdXGxC21Rowf29r+iMRg0YRSSehYeji+FrarBstJ6/uiu2pMkKiY6/zMvsacJ
	JYG3F9Rne8LCd4fPp1rZ7Sm5zsyn4FGipJ/0xcXlrpiKJjWI8Jtaf9ZnzvC5d2SvaD7BPHc
	kjnLTxXHfHDKIAtGgRS6lrHGuo6nmv0/lbQ2pnL99Ct2GEIkpidjXMCSISJCxFnISkPRhHz
	WtTvNTbj4lszTh1yfY1+Tfc7lXG0dp/wK+SY77mQzGreP/ExV85Cu2g0NV1c9tk4Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
master mode operations is determined by the ILCR (I2C Load Count Register).
Previously, the driver relied on the hardware's reset default
values for this register.

The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
frequencies lower than intended. For example, with the default
31.5 MHz input clock, these default settings result in an SCL
frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
and approximately 338 kHz (fast mode) when targeting 400 kHz.
These frequencies are below the 100 kHz/400 kHz nominal speeds.

This patch integrates the SCL frequency management into
the Common Clock Framework (CCF). Specifically, the ILCR register,
which acts as a frequency divider for the SCL clock, is now registered
as a managed clock (scl_clk) within the CCF.

This patch also cleans up unnecessary whitespace
in the included header files.

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
This patch was affected by the P1 Kconfig, which caused the maintainer
to revert it.
The current commit is a direct cherry-pick and reserves the original changelog.
This note is to clarify for anyone who sees the cover letter marked as v2
while the changelog entries reach v4.
---
Changelog in v4:
- initialize clk_init_data with {} so that init.flags is implicitly set to 0
- minor cleanup and style fixes for better readability
- remove unused spacemit_i2c_scl_clk_exclusive_put() cleanup callback
- replace clk_set_rate_exclusive()/clk_rate_exclusive_put() pair with clk_set_rate()
- simplify LCR LV field macros by using FIELD_GET/FIELD_MAX helpers
- Link to v3: https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/

Changelog in v3:
- use MASK macro in `recalc_rate` function
- rename clock name
- Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com

Changelog in v2:
- Align line breaks.
- Check `lv` in `clk_set_rate` function.
- Force fast mode when SCL frequency is illegal or unavailable.
- Change "linux/bits.h" to <linux/bits.h>
- Kconfig: Add dependency on CCF.
- Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
---
 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 146 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aaa161ae264a722e9e06adc7914cda..fedf5d31f9035b73a27a7f8a764bf5c26975d0e1 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -798,7 +798,7 @@ config I2C_JZ4780
 config I2C_K1
 	tristate "SpacemiT K1 I2C adapter"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF
+	depends on OF && COMMON_CLK
 	help
 	  This option enables support for the I2C interface on the SpacemiT K1
 	  platform.
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..e38a0ba71734ca602854c85672dcb61423453515 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -4,18 +4,21 @@
  */
 
 #include <linux/bitfield.h>
- #include <linux/clk.h>
- #include <linux/i2c.h>
- #include <linux/iopoll.h>
- #include <linux/module.h>
- #include <linux/of_address.h>
- #include <linux/platform_device.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
 #define SPACEMIT_ISR		 0x4		/* Status register */
 #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
 #define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
+#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
 #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
 
 /* SPACEMIT_ICR register fields */
@@ -87,6 +90,13 @@
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
 
+#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
+#define SPACEMIT_LCR_LV_FAST_SHIFT		9
+#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
+#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(17, 9)
+#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	FIELD_MAX(SPACEMIT_LCR_LV_STANDARD_MASK)
+#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		FIELD_MAX(SPACEMIT_LCR_LV_FAST_MASK)
+
 /* i2c bus recover timeout: us */
 #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
 
@@ -104,11 +114,20 @@ enum spacemit_i2c_state {
 	SPACEMIT_STATE_WRITE,
 };
 
+enum spacemit_i2c_mode {
+	SPACEMIT_MODE_STANDARD,
+	SPACEMIT_MODE_FAST
+};
+
 /* i2c-spacemit driver's main struct */
 struct spacemit_i2c_dev {
 	struct device *dev;
 	struct i2c_adapter adapt;
 
+	struct clk_hw scl_clk_hw;
+	struct clk *scl_clk;
+	enum spacemit_i2c_mode mode;
+
 	/* hardware resources */
 	void __iomem *base;
 	int irq;
@@ -129,6 +148,79 @@ struct spacemit_i2c_dev {
 	u32 status;
 };
 
+static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
+{
+	struct spacemit_i2c_dev *i2c = data;
+
+	clk_disable_unprepare(i2c->scl_clk);
+}
+
+static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lv, lcr, mask, shift, max_lv;
+
+	lv = DIV_ROUND_UP(parent_rate, rate);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
+		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
+		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
+		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
+	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
+		mask = SPACEMIT_LCR_LV_FAST_MASK;
+		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
+		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
+	}
+
+	if (!lv || lv > max_lv) {
+		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
+		return -EINVAL;
+	}
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+	lcr &= ~mask;
+	lcr |= lv << shift;
+	writel(lcr, i2c->base + SPACEMIT_ILCR);
+
+	return 0;
+}
+
+static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long *parent_rate)
+{
+	u32 lv, freq;
+
+	lv = DIV_ROUND_UP(*parent_rate, rate);
+	freq = DIV_ROUND_UP(*parent_rate, lv);
+
+	return freq;
+}
+
+static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lcr, lv = 0;
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD)
+		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
+	else if (i2c->mode == SPACEMIT_MODE_FAST)
+		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
+	else
+		return 0;
+
+	return DIV_ROUND_UP(parent_rate, lv);
+}
+
+static const struct clk_ops spacemit_i2c_clk_ops = {
+	.set_rate = spacemit_i2c_clk_set_rate,
+	.round_rate = spacemit_i2c_clk_round_rate,
+	.recalc_rate = spacemit_i2c_clk_recalc_rate,
+};
+
 static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
 {
 	u32 val;
@@ -147,6 +239,26 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
+						 struct clk *parent)
+{
+	struct clk_init_data init = {};
+	char name[32];
+
+	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
+
+	init.name = name;
+	init.ops = &spacemit_i2c_clk_ops;
+	init.parent_data = (struct clk_parent_data[]) {
+		{ .fw_name = "func" },
+	};
+	init.num_parents = 1;
+
+	i2c->scl_clk_hw.init = &init;
+
+	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
+}
+
 static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
 {
 	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
@@ -246,7 +358,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 */
 	val |= SPACEMIT_CR_DRFIE;
 
-	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->mode == SPACEMIT_MODE_FAST)
 		val |= SPACEMIT_CR_MODE_FAST;
 
 	/* disable response to general call */
@@ -538,14 +650,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
 
 	/* For now, this driver doesn't support high-speed. */
-	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
+	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
+	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
+		i2c->mode = SPACEMIT_MODE_FAST;
+	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
+		i2c->mode = SPACEMIT_MODE_STANDARD;
+	} else {
+		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
+		i2c->mode = SPACEMIT_MODE_FAST;
 		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
-	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
-		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
 	i2c->dev = &pdev->dev;
@@ -567,10 +680,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
 
+	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
+	if (IS_ERR(i2c->scl_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
+				     "failed to register scl clock\n");
+
 	clk = devm_clk_get_enabled(dev, "bus");
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
+
+	ret = clk_prepare_enable(i2c->scl_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
+
+	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register cleanup action for clk disable and unprepare");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.51.1


