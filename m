Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5577234FF25
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Mar 2021 13:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhCaLCu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 Mar 2021 07:02:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52114 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235477AbhCaLC0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 Mar 2021 07:02:26 -0400
X-UUID: 7dd0e9d406b9407782cd923822a5c78a-20210331
X-UUID: 7dd0e9d406b9407782cd923822a5c78a-20210331
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 367814857; Wed, 31 Mar 2021 19:02:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 19:02:18 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fei Shao <fshao@chromium.org>
CC:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 1/8] mfd: mt6358: refine interrupt code
Date:   Wed, 31 Mar 2021 19:02:00 +0800
Message-ID: <1617188527-3392-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch refines the interrupt related code to support new chips.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
changes since v6:
- no change.
---
 drivers/mfd/mt6358-irq.c        | 65 +++++++++++++++++++--------------
 include/linux/mfd/mt6358/core.h |  8 ++--
 2 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index db734f2831ff..4b094e5e51cc 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -13,7 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-static struct irq_top_t mt6358_ints[] = {
+#define MTK_PMIC_REG_WIDTH 16
+
+static const struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(BUCK),
 	MT6358_TOP_GEN(LDO),
 	MT6358_TOP_GEN(PSC),
@@ -24,6 +26,13 @@ static struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(MISC),
 };
 
+static struct pmic_irq_data mt6358_irqd = {
+	.num_top = ARRAY_SIZE(mt6358_ints),
+	.num_pmic_irqs = MT6358_IRQ_NR,
+	.top_int_status_reg = MT6358_TOP_INT_STATUS0,
+	.pmic_ints = mt6358_ints,
+};
+
 static void pmic_irq_enable(struct irq_data *data)
 {
 	unsigned int hwirq = irqd_to_hwirq(data);
@@ -62,15 +71,15 @@ static void pmic_irq_sync_unlock(struct irq_data *data)
 		/* Find out the IRQ group */
 		top_gp = 0;
 		while ((top_gp + 1) < irqd->num_top &&
-		       i >= mt6358_ints[top_gp + 1].hwirq_base)
+		       i >= irqd->pmic_ints[top_gp + 1].hwirq_base)
 			top_gp++;
 
 		/* Find the IRQ registers */
-		gp_offset = i - mt6358_ints[top_gp].hwirq_base;
-		int_regs = gp_offset / MT6358_REG_WIDTH;
-		shift = gp_offset % MT6358_REG_WIDTH;
-		en_reg = mt6358_ints[top_gp].en_reg +
-			 (mt6358_ints[top_gp].en_reg_shift * int_regs);
+		gp_offset = i - irqd->pmic_ints[top_gp].hwirq_base;
+		int_regs = gp_offset / MTK_PMIC_REG_WIDTH;
+		shift = gp_offset % MTK_PMIC_REG_WIDTH;
+		en_reg = irqd->pmic_ints[top_gp].en_reg +
+			 (irqd->pmic_ints[top_gp].en_reg_shift * int_regs);
 
 		regmap_update_bits(chip->regmap, en_reg, BIT(shift),
 				   irqd->enable_hwirq[i] << shift);
@@ -95,10 +104,11 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 	unsigned int irq_status, sta_reg, status;
 	unsigned int hwirq, virq;
 	int i, j, ret;
+	struct pmic_irq_data *irqd = chip->irq_data;
 
-	for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
-		sta_reg = mt6358_ints[top_gp].sta_reg +
-			mt6358_ints[top_gp].sta_reg_shift * i;
+	for (i = 0; i < irqd->pmic_ints[top_gp].num_int_regs; i++) {
+		sta_reg = irqd->pmic_ints[top_gp].sta_reg +
+			irqd->pmic_ints[top_gp].sta_reg_shift * i;
 
 		ret = regmap_read(chip->regmap, sta_reg, &irq_status);
 		if (ret) {
@@ -114,8 +124,8 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 		do {
 			j = __ffs(status);
 
-			hwirq = mt6358_ints[top_gp].hwirq_base +
-				MT6358_REG_WIDTH * i + j;
+			hwirq = irqd->pmic_ints[top_gp].hwirq_base +
+				MTK_PMIC_REG_WIDTH * i + j;
 
 			virq = irq_find_mapping(chip->irq_domain, hwirq);
 			if (virq)
@@ -131,12 +141,12 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 static irqreturn_t mt6358_irq_handler(int irq, void *data)
 {
 	struct mt6397_chip *chip = data;
-	struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
+	struct pmic_irq_data *irqd = chip->irq_data;
 	unsigned int bit, i, top_irq_status = 0;
 	int ret;
 
 	ret = regmap_read(chip->regmap,
-			  mt6358_irq_data->top_int_status_reg,
+			  irqd->top_int_status_reg,
 			  &top_irq_status);
 	if (ret) {
 		dev_err(chip->dev,
@@ -144,8 +154,8 @@ static irqreturn_t mt6358_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	for (i = 0; i < mt6358_irq_data->num_top; i++) {
-		bit = BIT(mt6358_ints[i].top_offset);
+	for (i = 0; i < irqd->num_top; i++) {
+		bit = BIT(irqd->pmic_ints[i].top_offset);
 		if (top_irq_status & bit) {
 			mt6358_irq_sp_handler(chip, i);
 			top_irq_status &= ~bit;
@@ -180,17 +190,18 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 	int i, j, ret;
 	struct pmic_irq_data *irqd;
 
-	irqd = devm_kzalloc(chip->dev, sizeof(*irqd), GFP_KERNEL);
-	if (!irqd)
-		return -ENOMEM;
+	switch (chip->chip_id) {
+	case MT6358_CHIP_ID:
+		chip->irq_data = &mt6358_irqd;
+		break;
 
-	chip->irq_data = irqd;
+	default:
+		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
+		return -ENODEV;
+	}
 
 	mutex_init(&chip->irqlock);
-	irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
-	irqd->num_pmic_irqs = MT6358_IRQ_NR;
-	irqd->num_top = ARRAY_SIZE(mt6358_ints);
-
+	irqd = chip->irq_data;
 	irqd->enable_hwirq = devm_kcalloc(chip->dev,
 					  irqd->num_pmic_irqs,
 					  sizeof(*irqd->enable_hwirq),
@@ -207,10 +218,10 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 
 	/* Disable all interrupts for initializing */
 	for (i = 0; i < irqd->num_top; i++) {
-		for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
+		for (j = 0; j < irqd->pmic_ints[i].num_int_regs; j++)
 			regmap_write(chip->regmap,
-				     mt6358_ints[i].en_reg +
-				     mt6358_ints[i].en_reg_shift * j, 0);
+				     irqd->pmic_ints[i].en_reg +
+				     irqd->pmic_ints[i].en_reg_shift * j, 0);
 	}
 
 	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
index c5a11b7458d4..68578e2019b0 100644
--- a/include/linux/mfd/mt6358/core.h
+++ b/include/linux/mfd/mt6358/core.h
@@ -6,12 +6,9 @@
 #ifndef __MFD_MT6358_CORE_H__
 #define __MFD_MT6358_CORE_H__
 
-#define MT6358_REG_WIDTH 16
-
 struct irq_top_t {
 	int hwirq_base;
 	unsigned int num_int_regs;
-	unsigned int num_int_bits;
 	unsigned int en_reg;
 	unsigned int en_reg_shift;
 	unsigned int sta_reg;
@@ -25,6 +22,7 @@ struct pmic_irq_data {
 	unsigned short top_int_status_reg;
 	bool *enable_hwirq;
 	bool *cache_hwirq;
+	const struct irq_top_t *pmic_ints;
 };
 
 enum mt6358_irq_top_status_shift {
@@ -146,8 +144,8 @@ enum mt6358_irq_numbers {
 {	\
 	.hwirq_base = MT6358_IRQ_##sp##_BASE,	\
 	.num_int_regs =	\
-		((MT6358_IRQ_##sp##_BITS - 1) / MT6358_REG_WIDTH) + 1,	\
-	.num_int_bits = MT6358_IRQ_##sp##_BITS, \
+		((MT6358_IRQ_##sp##_BITS - 1) /	\
+		MTK_PMIC_REG_WIDTH) + 1,	\
 	.en_reg = MT6358_##sp##_TOP_INT_CON0,	\
 	.en_reg_shift = 0x6,	\
 	.sta_reg = MT6358_##sp##_TOP_INT_STATUS0,	\
-- 
2.18.0

