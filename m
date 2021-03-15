Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C2933C488
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 18:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbhCORhS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 13:37:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47742 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236626AbhCORgw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 13:36:52 -0400
X-UUID: ef8be5befc304790b89a035251e80a51-20210316
X-UUID: ef8be5befc304790b89a035251e80a51-20210316
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1998502977; Tue, 16 Mar 2021 01:36:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:36:46 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 01:36:45 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 5/8] mfd: Add support for the MediaTek MT6359 PMIC
Date:   Tue, 16 Mar 2021 01:35:54 +0800
Message-ID: <1615829757-3223-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds support for the MediaTek MT6359 PMIC. This is a
multifunction device with the following sub modules:

- Codec
- Interrupt
- Regulator
- RTC

It is interfaced to the host controller using SPI interface
by a proprietary hardware called PMIC wrapper or pwrap.
MT6359 MFD is a child device of the pwrap.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
changes since v5:
- refine the code structure.
- update file date.
---
 drivers/mfd/mt6358-irq.c             |  24 ++
 drivers/mfd/mt6397-core.c            |  24 ++
 include/linux/mfd/mt6359/core.h      | 133 +++++++
 include/linux/mfd/mt6359/registers.h | 529 +++++++++++++++++++++++++++
 include/linux/mfd/mt6397/core.h      |   1 +
 5 files changed, 711 insertions(+)
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 4b094e5e51cc..83f3ffbdbb4c 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -5,6 +5,8 @@
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6358/core.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/core.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -26,6 +28,17 @@ static const struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(MISC),
 };
 
+static const struct irq_top_t mt6359_ints[] = {
+	MT6359_TOP_GEN(BUCK),
+	MT6359_TOP_GEN(LDO),
+	MT6359_TOP_GEN(PSC),
+	MT6359_TOP_GEN(SCK),
+	MT6359_TOP_GEN(BM),
+	MT6359_TOP_GEN(HK),
+	MT6359_TOP_GEN(AUD),
+	MT6359_TOP_GEN(MISC),
+};
+
 static struct pmic_irq_data mt6358_irqd = {
 	.num_top = ARRAY_SIZE(mt6358_ints),
 	.num_pmic_irqs = MT6358_IRQ_NR,
@@ -33,6 +46,13 @@ static struct pmic_irq_data mt6358_irqd = {
 	.pmic_ints = mt6358_ints,
 };
 
+static struct pmic_irq_data mt6359_irqd = {
+	.num_top = ARRAY_SIZE(mt6359_ints),
+	.num_pmic_irqs = MT6359_IRQ_NR,
+	.top_int_status_reg = MT6359_TOP_INT_STATUS0,
+	.pmic_ints = mt6359_ints,
+};
+
 static void pmic_irq_enable(struct irq_data *data)
 {
 	unsigned int hwirq = irqd_to_hwirq(data);
@@ -195,6 +215,10 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 		chip->irq_data = &mt6358_irqd;
 		break;
 
+	case MT6359_CHIP_ID:
+		chip->irq_data = &mt6359_irqd;
+		break;
+
 	default:
 		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
 		return -ENODEV;
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c..9a615f75fbde 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -13,9 +13,11 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/mt6323/core.h>
 #include <linux/mfd/mt6358/core.h>
+#include <linux/mfd/mt6359/core.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/registers.h>
 
 #define MT6323_RTC_BASE		0x8000
@@ -99,6 +101,17 @@ static const struct mfd_cell mt6358_devs[] = {
 	},
 };
 
+static const struct mfd_cell mt6359_devs[] = {
+	{ .name = "mt6359-regulator", },
+	{
+		.name = "mt6359-rtc",
+		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
+		.resources = mt6358_rtc_resources,
+		.of_compatible = "mediatek,mt6358-rtc",
+	},
+	{ .name = "mt6359-sound", },
+};
+
 static const struct mfd_cell mt6397_devs[] = {
 	{
 		.name = "mt6397-rtc",
@@ -149,6 +162,14 @@ static const struct chip_data mt6358_core = {
 	.irq_init = mt6358_irq_init,
 };
 
+static const struct chip_data mt6359_core = {
+	.cid_addr = MT6359_SWCID,
+	.cid_shift = 8,
+	.cells = mt6359_devs,
+	.cell_size = ARRAY_SIZE(mt6359_devs),
+	.irq_init = mt6358_irq_init,
+};
+
 static const struct chip_data mt6397_core = {
 	.cid_addr = MT6397_CID,
 	.cid_shift = 0,
@@ -218,6 +239,9 @@ static const struct of_device_id mt6397_of_match[] = {
 	}, {
 		.compatible = "mediatek,mt6358",
 		.data = &mt6358_core,
+	}, {
+		.compatible = "mediatek,mt6359",
+		.data = &mt6359_core,
 	}, {
 		.compatible = "mediatek,mt6397",
 		.data = &mt6397_core,
diff --git a/include/linux/mfd/mt6359/core.h b/include/linux/mfd/mt6359/core.h
new file mode 100644
index 000000000000..8d298868126d
--- /dev/null
+++ b/include/linux/mfd/mt6359/core.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MFD_MT6359_CORE_H__
+#define __MFD_MT6359_CORE_H__
+
+enum mt6359_irq_top_status_shift {
+	MT6359_BUCK_TOP = 0,
+	MT6359_LDO_TOP,
+	MT6359_PSC_TOP,
+	MT6359_SCK_TOP,
+	MT6359_BM_TOP,
+	MT6359_HK_TOP,
+	MT6359_AUD_TOP = 7,
+	MT6359_MISC_TOP,
+};
+
+enum mt6359_irq_numbers {
+	MT6359_IRQ_VCORE_OC = 1,
+	MT6359_IRQ_VGPU11_OC,
+	MT6359_IRQ_VGPU12_OC,
+	MT6359_IRQ_VMODEM_OC,
+	MT6359_IRQ_VPROC1_OC,
+	MT6359_IRQ_VPROC2_OC,
+	MT6359_IRQ_VS1_OC,
+	MT6359_IRQ_VS2_OC,
+	MT6359_IRQ_VPA_OC = 9,
+	MT6359_IRQ_VFE28_OC = 16,
+	MT6359_IRQ_VXO22_OC,
+	MT6359_IRQ_VRF18_OC,
+	MT6359_IRQ_VRF12_OC,
+	MT6359_IRQ_VEFUSE_OC,
+	MT6359_IRQ_VCN33_1_OC,
+	MT6359_IRQ_VCN33_2_OC,
+	MT6359_IRQ_VCN13_OC,
+	MT6359_IRQ_VCN18_OC,
+	MT6359_IRQ_VA09_OC,
+	MT6359_IRQ_VCAMIO_OC,
+	MT6359_IRQ_VA12_OC,
+	MT6359_IRQ_VAUX18_OC,
+	MT6359_IRQ_VAUD18_OC,
+	MT6359_IRQ_VIO18_OC,
+	MT6359_IRQ_VSRAM_PROC1_OC,
+	MT6359_IRQ_VSRAM_PROC2_OC,
+	MT6359_IRQ_VSRAM_OTHERS_OC,
+	MT6359_IRQ_VSRAM_MD_OC,
+	MT6359_IRQ_VEMC_OC,
+	MT6359_IRQ_VSIM1_OC,
+	MT6359_IRQ_VSIM2_OC,
+	MT6359_IRQ_VUSB_OC,
+	MT6359_IRQ_VRFCK_OC,
+	MT6359_IRQ_VBBCK_OC,
+	MT6359_IRQ_VBIF28_OC,
+	MT6359_IRQ_VIBR_OC,
+	MT6359_IRQ_VIO28_OC,
+	MT6359_IRQ_VM18_OC,
+	MT6359_IRQ_VUFS_OC = 45,
+	MT6359_IRQ_PWRKEY = 48,
+	MT6359_IRQ_HOMEKEY,
+	MT6359_IRQ_PWRKEY_R,
+	MT6359_IRQ_HOMEKEY_R,
+	MT6359_IRQ_NI_LBAT_INT,
+	MT6359_IRQ_CHRDET_EDGE = 53,
+	MT6359_IRQ_RTC = 64,
+	MT6359_IRQ_FG_BAT_H = 80,
+	MT6359_IRQ_FG_BAT_L,
+	MT6359_IRQ_FG_CUR_H,
+	MT6359_IRQ_FG_CUR_L,
+	MT6359_IRQ_FG_ZCV = 84,
+	MT6359_IRQ_FG_N_CHARGE_L = 87,
+	MT6359_IRQ_FG_IAVG_H,
+	MT6359_IRQ_FG_IAVG_L = 89,
+	MT6359_IRQ_FG_DISCHARGE = 91,
+	MT6359_IRQ_FG_CHARGE,
+	MT6359_IRQ_BATON_LV = 96,
+	MT6359_IRQ_BATON_BAT_IN = 98,
+	MT6359_IRQ_BATON_BAT_OU,
+	MT6359_IRQ_BIF = 100,
+	MT6359_IRQ_BAT_H = 112,
+	MT6359_IRQ_BAT_L,
+	MT6359_IRQ_BAT2_H,
+	MT6359_IRQ_BAT2_L,
+	MT6359_IRQ_BAT_TEMP_H,
+	MT6359_IRQ_BAT_TEMP_L,
+	MT6359_IRQ_THR_H,
+	MT6359_IRQ_THR_L,
+	MT6359_IRQ_AUXADC_IMP,
+	MT6359_IRQ_NAG_C_DLTV = 121,
+	MT6359_IRQ_AUDIO = 128,
+	MT6359_IRQ_ACCDET = 133,
+	MT6359_IRQ_ACCDET_EINT0,
+	MT6359_IRQ_ACCDET_EINT1,
+	MT6359_IRQ_SPI_CMD_ALERT = 144,
+	MT6359_IRQ_NR,
+};
+
+#define MT6359_IRQ_BUCK_BASE MT6359_IRQ_VCORE_OC
+#define MT6359_IRQ_LDO_BASE MT6359_IRQ_VFE28_OC
+#define MT6359_IRQ_PSC_BASE MT6359_IRQ_PWRKEY
+#define MT6359_IRQ_SCK_BASE MT6359_IRQ_RTC
+#define MT6359_IRQ_BM_BASE MT6359_IRQ_FG_BAT_H
+#define MT6359_IRQ_HK_BASE MT6359_IRQ_BAT_H
+#define MT6359_IRQ_AUD_BASE MT6359_IRQ_AUDIO
+#define MT6359_IRQ_MISC_BASE MT6359_IRQ_SPI_CMD_ALERT
+
+#define MT6359_IRQ_BUCK_BITS (MT6359_IRQ_VPA_OC - MT6359_IRQ_BUCK_BASE + 1)
+#define MT6359_IRQ_LDO_BITS (MT6359_IRQ_VUFS_OC - MT6359_IRQ_LDO_BASE + 1)
+#define MT6359_IRQ_PSC_BITS	\
+	(MT6359_IRQ_CHRDET_EDGE - MT6359_IRQ_PSC_BASE + 1)
+#define MT6359_IRQ_SCK_BITS (MT6359_IRQ_RTC - MT6359_IRQ_SCK_BASE + 1)
+#define MT6359_IRQ_BM_BITS (MT6359_IRQ_BIF - MT6359_IRQ_BM_BASE + 1)
+#define MT6359_IRQ_HK_BITS (MT6359_IRQ_NAG_C_DLTV - MT6359_IRQ_HK_BASE + 1)
+#define MT6359_IRQ_AUD_BITS	\
+	(MT6359_IRQ_ACCDET_EINT1 - MT6359_IRQ_AUD_BASE + 1)
+#define MT6359_IRQ_MISC_BITS	\
+	(MT6359_IRQ_SPI_CMD_ALERT - MT6359_IRQ_MISC_BASE + 1)
+
+#define MT6359_TOP_GEN(sp)	\
+{	\
+	.hwirq_base = MT6359_IRQ_##sp##_BASE,	\
+	.num_int_regs =	\
+		((MT6359_IRQ_##sp##_BITS - 1) /	\
+		MTK_PMIC_REG_WIDTH) + 1,	\
+	.en_reg = MT6359_##sp##_TOP_INT_CON0,	\
+	.en_reg_shift = 0x6,	\
+	.sta_reg = MT6359_##sp##_TOP_INT_STATUS0,	\
+	.sta_reg_shift = 0x2,	\
+	.top_offset = MT6359_##sp##_TOP,	\
+}
+
+#endif /* __MFD_MT6359_CORE_H__ */
diff --git a/include/linux/mfd/mt6359/registers.h b/include/linux/mfd/mt6359/registers.h
new file mode 100644
index 000000000000..2135c9695918
--- /dev/null
+++ b/include/linux/mfd/mt6359/registers.h
@@ -0,0 +1,529 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MFD_MT6359_REGISTERS_H__
+#define __MFD_MT6359_REGISTERS_H__
+
+/* PMIC Registers */
+#define MT6359_SWCID                         0xa
+#define MT6359_MISC_TOP_INT_CON0             0x188
+#define MT6359_MISC_TOP_INT_STATUS0          0x194
+#define MT6359_TOP_INT_STATUS0               0x19e
+#define MT6359_SCK_TOP_INT_CON0              0x528
+#define MT6359_SCK_TOP_INT_STATUS0           0x534
+#define MT6359_EOSC_CALI_CON0                0x53a
+#define MT6359_EOSC_CALI_CON1                0x53c
+#define MT6359_RTC_MIX_CON0                  0x53e
+#define MT6359_RTC_MIX_CON1                  0x540
+#define MT6359_RTC_MIX_CON2                  0x542
+#define MT6359_RTC_DSN_ID                    0x580
+#define MT6359_RTC_DSN_REV0                  0x582
+#define MT6359_RTC_DBI                       0x584
+#define MT6359_RTC_DXI                       0x586
+#define MT6359_RTC_BBPU                      0x588
+#define MT6359_RTC_IRQ_STA                   0x58a
+#define MT6359_RTC_IRQ_EN                    0x58c
+#define MT6359_RTC_CII_EN                    0x58e
+#define MT6359_RTC_AL_MASK                   0x590
+#define MT6359_RTC_TC_SEC                    0x592
+#define MT6359_RTC_TC_MIN                    0x594
+#define MT6359_RTC_TC_HOU                    0x596
+#define MT6359_RTC_TC_DOM                    0x598
+#define MT6359_RTC_TC_DOW                    0x59a
+#define MT6359_RTC_TC_MTH                    0x59c
+#define MT6359_RTC_TC_YEA                    0x59e
+#define MT6359_RTC_AL_SEC                    0x5a0
+#define MT6359_RTC_AL_MIN                    0x5a2
+#define MT6359_RTC_AL_HOU                    0x5a4
+#define MT6359_RTC_AL_DOM                    0x5a6
+#define MT6359_RTC_AL_DOW                    0x5a8
+#define MT6359_RTC_AL_MTH                    0x5aa
+#define MT6359_RTC_AL_YEA                    0x5ac
+#define MT6359_RTC_OSC32CON                  0x5ae
+#define MT6359_RTC_POWERKEY1                 0x5b0
+#define MT6359_RTC_POWERKEY2                 0x5b2
+#define MT6359_RTC_PDN1                      0x5b4
+#define MT6359_RTC_PDN2                      0x5b6
+#define MT6359_RTC_SPAR0                     0x5b8
+#define MT6359_RTC_SPAR1                     0x5ba
+#define MT6359_RTC_PROT                      0x5bc
+#define MT6359_RTC_DIFF                      0x5be
+#define MT6359_RTC_CALI                      0x5c0
+#define MT6359_RTC_WRTGR                     0x5c2
+#define MT6359_RTC_CON                       0x5c4
+#define MT6359_RTC_SEC_CTRL                  0x5c6
+#define MT6359_RTC_INT_CNT                   0x5c8
+#define MT6359_RTC_SEC_DAT0                  0x5ca
+#define MT6359_RTC_SEC_DAT1                  0x5cc
+#define MT6359_RTC_SEC_DAT2                  0x5ce
+#define MT6359_RTC_SEC_DSN_ID                0x600
+#define MT6359_RTC_SEC_DSN_REV0              0x602
+#define MT6359_RTC_SEC_DBI                   0x604
+#define MT6359_RTC_SEC_DXI                   0x606
+#define MT6359_RTC_TC_SEC_SEC                0x608
+#define MT6359_RTC_TC_MIN_SEC                0x60a
+#define MT6359_RTC_TC_HOU_SEC                0x60c
+#define MT6359_RTC_TC_DOM_SEC                0x60e
+#define MT6359_RTC_TC_DOW_SEC                0x610
+#define MT6359_RTC_TC_MTH_SEC                0x612
+#define MT6359_RTC_TC_YEA_SEC                0x614
+#define MT6359_RTC_SEC_CK_PDN                0x616
+#define MT6359_RTC_SEC_WRTGR                 0x618
+#define MT6359_PSC_TOP_INT_CON0              0x910
+#define MT6359_PSC_TOP_INT_STATUS0           0x91c
+#define MT6359_BM_TOP_INT_CON0               0xc32
+#define MT6359_BM_TOP_INT_CON1               0xc38
+#define MT6359_BM_TOP_INT_STATUS0            0xc4a
+#define MT6359_BM_TOP_INT_STATUS1            0xc4c
+#define MT6359_HK_TOP_INT_CON0               0xf92
+#define MT6359_HK_TOP_INT_STATUS0            0xf9e
+#define MT6359_BUCK_TOP_INT_CON0             0x1418
+#define MT6359_BUCK_TOP_INT_STATUS0          0x1424
+#define MT6359_BUCK_VPU_CON0                 0x1488
+#define MT6359_BUCK_VPU_DBG0                 0x14a6
+#define MT6359_BUCK_VPU_DBG1                 0x14a8
+#define MT6359_BUCK_VPU_ELR0                 0x14ac
+#define MT6359_BUCK_VCORE_CON0               0x1508
+#define MT6359_BUCK_VCORE_DBG0               0x1526
+#define MT6359_BUCK_VCORE_DBG1               0x1528
+#define MT6359_BUCK_VCORE_SSHUB_CON0         0x152a
+#define MT6359_BUCK_VCORE_ELR0               0x1534
+#define MT6359_BUCK_VGPU11_CON0              0x1588
+#define MT6359_BUCK_VGPU11_DBG0              0x15a6
+#define MT6359_BUCK_VGPU11_DBG1              0x15a8
+#define MT6359_BUCK_VGPU11_ELR0              0x15ac
+#define MT6359_BUCK_VMODEM_CON0              0x1688
+#define MT6359_BUCK_VMODEM_DBG0              0x16a6
+#define MT6359_BUCK_VMODEM_DBG1              0x16a8
+#define MT6359_BUCK_VMODEM_ELR0              0x16ae
+#define MT6359_BUCK_VPROC1_CON0              0x1708
+#define MT6359_BUCK_VPROC1_DBG0              0x1726
+#define MT6359_BUCK_VPROC1_DBG1              0x1728
+#define MT6359_BUCK_VPROC1_ELR0              0x172e
+#define MT6359_BUCK_VPROC2_CON0              0x1788
+#define MT6359_BUCK_VPROC2_DBG0              0x17a6
+#define MT6359_BUCK_VPROC2_DBG1              0x17a8
+#define MT6359_BUCK_VPROC2_ELR0              0x17b2
+#define MT6359_BUCK_VS1_CON0                 0x1808
+#define MT6359_BUCK_VS1_DBG0                 0x1826
+#define MT6359_BUCK_VS1_DBG1                 0x1828
+#define MT6359_BUCK_VS1_ELR0                 0x1834
+#define MT6359_BUCK_VS2_CON0                 0x1888
+#define MT6359_BUCK_VS2_DBG0                 0x18a6
+#define MT6359_BUCK_VS2_DBG1                 0x18a8
+#define MT6359_BUCK_VS2_ELR0                 0x18b4
+#define MT6359_BUCK_VPA_CON0                 0x1908
+#define MT6359_BUCK_VPA_CON1                 0x190e
+#define MT6359_BUCK_VPA_CFG0                 0x1910
+#define MT6359_BUCK_VPA_CFG1                 0x1912
+#define MT6359_BUCK_VPA_DBG0                 0x1914
+#define MT6359_BUCK_VPA_DBG1                 0x1916
+#define MT6359_VGPUVCORE_ANA_CON2            0x198e
+#define MT6359_VGPUVCORE_ANA_CON13           0x19a4
+#define MT6359_VPROC1_ANA_CON3               0x19b2
+#define MT6359_VPROC2_ANA_CON3               0x1a0e
+#define MT6359_VMODEM_ANA_CON3               0x1a1a
+#define MT6359_VPU_ANA_CON3                  0x1a26
+#define MT6359_VS1_ANA_CON0                  0x1a2c
+#define MT6359_VS2_ANA_CON0                  0x1a34
+#define MT6359_VPA_ANA_CON0                  0x1a3c
+#define MT6359_LDO_TOP_INT_CON0              0x1b14
+#define MT6359_LDO_TOP_INT_CON1              0x1b1a
+#define MT6359_LDO_TOP_INT_STATUS0           0x1b28
+#define MT6359_LDO_TOP_INT_STATUS1           0x1b2a
+#define MT6359_LDO_VSRAM_PROC1_ELR           0x1b40
+#define MT6359_LDO_VSRAM_PROC2_ELR           0x1b42
+#define MT6359_LDO_VSRAM_OTHERS_ELR          0x1b44
+#define MT6359_LDO_VSRAM_MD_ELR              0x1b46
+#define MT6359_LDO_VFE28_CON0                0x1b88
+#define MT6359_LDO_VFE28_MON                 0x1b8a
+#define MT6359_LDO_VXO22_CON0                0x1b98
+#define MT6359_LDO_VXO22_MON                 0x1b9a
+#define MT6359_LDO_VRF18_CON0                0x1ba8
+#define MT6359_LDO_VRF18_MON                 0x1baa
+#define MT6359_LDO_VRF12_CON0                0x1bb8
+#define MT6359_LDO_VRF12_MON                 0x1bba
+#define MT6359_LDO_VEFUSE_CON0               0x1bc8
+#define MT6359_LDO_VEFUSE_MON                0x1bca
+#define MT6359_LDO_VCN33_1_CON0              0x1bd8
+#define MT6359_LDO_VCN33_1_MON               0x1bda
+#define MT6359_LDO_VCN33_1_MULTI_SW          0x1be8
+#define MT6359_LDO_VCN33_2_CON0              0x1c08
+#define MT6359_LDO_VCN33_2_MON               0x1c0a
+#define MT6359_LDO_VCN33_2_MULTI_SW          0x1c18
+#define MT6359_LDO_VCN13_CON0                0x1c1a
+#define MT6359_LDO_VCN13_MON                 0x1c1c
+#define MT6359_LDO_VCN18_CON0                0x1c2a
+#define MT6359_LDO_VCN18_MON                 0x1c2c
+#define MT6359_LDO_VA09_CON0                 0x1c3a
+#define MT6359_LDO_VA09_MON                  0x1c3c
+#define MT6359_LDO_VCAMIO_CON0               0x1c4a
+#define MT6359_LDO_VCAMIO_MON                0x1c4c
+#define MT6359_LDO_VA12_CON0                 0x1c5a
+#define MT6359_LDO_VA12_MON                  0x1c5c
+#define MT6359_LDO_VAUX18_CON0               0x1c88
+#define MT6359_LDO_VAUX18_MON                0x1c8a
+#define MT6359_LDO_VAUD18_CON0               0x1c98
+#define MT6359_LDO_VAUD18_MON                0x1c9a
+#define MT6359_LDO_VIO18_CON0                0x1ca8
+#define MT6359_LDO_VIO18_MON                 0x1caa
+#define MT6359_LDO_VEMC_CON0                 0x1cb8
+#define MT6359_LDO_VEMC_MON                  0x1cba
+#define MT6359_LDO_VSIM1_CON0                0x1cc8
+#define MT6359_LDO_VSIM1_MON                 0x1cca
+#define MT6359_LDO_VSIM2_CON0                0x1cd8
+#define MT6359_LDO_VSIM2_MON                 0x1cda
+#define MT6359_LDO_VUSB_CON0                 0x1d08
+#define MT6359_LDO_VUSB_MON                  0x1d0a
+#define MT6359_LDO_VUSB_MULTI_SW             0x1d18
+#define MT6359_LDO_VRFCK_CON0                0x1d1a
+#define MT6359_LDO_VRFCK_MON                 0x1d1c
+#define MT6359_LDO_VBBCK_CON0                0x1d2a
+#define MT6359_LDO_VBBCK_MON                 0x1d2c
+#define MT6359_LDO_VBIF28_CON0               0x1d3a
+#define MT6359_LDO_VBIF28_MON                0x1d3c
+#define MT6359_LDO_VIBR_CON0                 0x1d4a
+#define MT6359_LDO_VIBR_MON                  0x1d4c
+#define MT6359_LDO_VIO28_CON0                0x1d5a
+#define MT6359_LDO_VIO28_MON                 0x1d5c
+#define MT6359_LDO_VM18_CON0                 0x1d88
+#define MT6359_LDO_VM18_MON                  0x1d8a
+#define MT6359_LDO_VUFS_CON0                 0x1d98
+#define MT6359_LDO_VUFS_MON                  0x1d9a
+#define MT6359_LDO_VSRAM_PROC1_CON0          0x1e88
+#define MT6359_LDO_VSRAM_PROC1_MON           0x1e8a
+#define MT6359_LDO_VSRAM_PROC1_VOSEL1        0x1e8e
+#define MT6359_LDO_VSRAM_PROC2_CON0          0x1ea6
+#define MT6359_LDO_VSRAM_PROC2_MON           0x1ea8
+#define MT6359_LDO_VSRAM_PROC2_VOSEL1        0x1eac
+#define MT6359_LDO_VSRAM_OTHERS_CON0         0x1f08
+#define MT6359_LDO_VSRAM_OTHERS_MON          0x1f0a
+#define MT6359_LDO_VSRAM_OTHERS_VOSEL1       0x1f0e
+#define MT6359_LDO_VSRAM_OTHERS_SSHUB        0x1f26
+#define MT6359_LDO_VSRAM_MD_CON0             0x1f2c
+#define MT6359_LDO_VSRAM_MD_MON              0x1f2e
+#define MT6359_LDO_VSRAM_MD_VOSEL1           0x1f32
+#define MT6359_VFE28_ANA_CON0                0x1f88
+#define MT6359_VAUX18_ANA_CON0               0x1f8c
+#define MT6359_VUSB_ANA_CON0                 0x1f90
+#define MT6359_VBIF28_ANA_CON0               0x1f94
+#define MT6359_VCN33_1_ANA_CON0              0x1f98
+#define MT6359_VCN33_2_ANA_CON0              0x1f9c
+#define MT6359_VEMC_ANA_CON0                 0x1fa0
+#define MT6359_VSIM1_ANA_CON0                0x1fa4
+#define MT6359_VSIM2_ANA_CON0                0x1fa8
+#define MT6359_VIO28_ANA_CON0                0x1fac
+#define MT6359_VIBR_ANA_CON0                 0x1fb0
+#define MT6359_VRF18_ANA_CON0                0x2008
+#define MT6359_VEFUSE_ANA_CON0               0x200c
+#define MT6359_VCN18_ANA_CON0                0x2010
+#define MT6359_VCAMIO_ANA_CON0               0x2014
+#define MT6359_VAUD18_ANA_CON0               0x2018
+#define MT6359_VIO18_ANA_CON0                0x201c
+#define MT6359_VM18_ANA_CON0                 0x2020
+#define MT6359_VUFS_ANA_CON0                 0x2024
+#define MT6359_VRF12_ANA_CON0                0x202a
+#define MT6359_VCN13_ANA_CON0                0x202e
+#define MT6359_VA09_ANA_CON0                 0x2032
+#define MT6359_VA12_ANA_CON0                 0x2036
+#define MT6359_VXO22_ANA_CON0                0x2088
+#define MT6359_VRFCK_ANA_CON0                0x208c
+#define MT6359_VBBCK_ANA_CON0                0x2094
+#define MT6359_AUD_TOP_INT_CON0              0x2328
+#define MT6359_AUD_TOP_INT_STATUS0           0x2334
+
+#define MT6359_RG_BUCK_VPU_EN_ADDR             MT6359_BUCK_VPU_CON0
+#define MT6359_RG_BUCK_VPU_LP_ADDR             MT6359_BUCK_VPU_CON0
+#define MT6359_RG_BUCK_VPU_LP_SHIFT            1
+#define MT6359_DA_VPU_VOSEL_ADDR               MT6359_BUCK_VPU_DBG0
+#define MT6359_DA_VPU_VOSEL_MASK               0x7F
+#define MT6359_DA_VPU_VOSEL_SHIFT              0
+#define MT6359_DA_VPU_EN_ADDR                  MT6359_BUCK_VPU_DBG1
+#define MT6359_RG_BUCK_VPU_VOSEL_ADDR          MT6359_BUCK_VPU_ELR0
+#define MT6359_RG_BUCK_VPU_VOSEL_MASK          0x7F
+#define MT6359_RG_BUCK_VPU_VOSEL_SHIFT         0
+#define MT6359_RG_BUCK_VCORE_EN_ADDR           MT6359_BUCK_VCORE_CON0
+#define MT6359_RG_BUCK_VCORE_LP_ADDR           MT6359_BUCK_VCORE_CON0
+#define MT6359_RG_BUCK_VCORE_LP_SHIFT          1
+#define MT6359_DA_VCORE_VOSEL_ADDR             MT6359_BUCK_VCORE_DBG0
+#define MT6359_DA_VCORE_VOSEL_MASK             0x7F
+#define MT6359_DA_VCORE_VOSEL_SHIFT            0
+#define MT6359_DA_VCORE_EN_ADDR                MT6359_BUCK_VCORE_DBG1
+#define MT6359_RG_BUCK_VCORE_SSHUB_EN_ADDR     MT6359_BUCK_VCORE_SSHUB_CON0
+#define MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_ADDR  MT6359_BUCK_VCORE_SSHUB_CON0
+#define MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_MASK  0x7F
+#define MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_SHIFT 4
+#define MT6359_RG_BUCK_VCORE_VOSEL_ADDR        MT6359_BUCK_VCORE_ELR0
+#define MT6359_RG_BUCK_VCORE_VOSEL_MASK        0x7F
+#define MT6359_RG_BUCK_VCORE_VOSEL_SHIFT       0
+#define MT6359_RG_BUCK_VGPU11_EN_ADDR          MT6359_BUCK_VGPU11_CON0
+#define MT6359_RG_BUCK_VGPU11_LP_ADDR          MT6359_BUCK_VGPU11_CON0
+#define MT6359_RG_BUCK_VGPU11_LP_SHIFT         1
+#define MT6359_DA_VGPU11_VOSEL_ADDR            MT6359_BUCK_VGPU11_DBG0
+#define MT6359_DA_VGPU11_VOSEL_MASK            0x7F
+#define MT6359_DA_VGPU11_VOSEL_SHIFT           0
+#define MT6359_DA_VGPU11_EN_ADDR               MT6359_BUCK_VGPU11_DBG1
+#define MT6359_RG_BUCK_VGPU11_VOSEL_ADDR       MT6359_BUCK_VGPU11_ELR0
+#define MT6359_RG_BUCK_VGPU11_VOSEL_MASK       0x7F
+#define MT6359_RG_BUCK_VGPU11_VOSEL_SHIFT      0
+#define MT6359_RG_BUCK_VMODEM_EN_ADDR          MT6359_BUCK_VMODEM_CON0
+#define MT6359_RG_BUCK_VMODEM_LP_ADDR          MT6359_BUCK_VMODEM_CON0
+#define MT6359_RG_BUCK_VMODEM_LP_SHIFT         1
+#define MT6359_DA_VMODEM_VOSEL_ADDR            MT6359_BUCK_VMODEM_DBG0
+#define MT6359_DA_VMODEM_VOSEL_MASK            0x7F
+#define MT6359_DA_VMODEM_VOSEL_SHIFT           0
+#define MT6359_DA_VMODEM_EN_ADDR               MT6359_BUCK_VMODEM_DBG1
+#define MT6359_RG_BUCK_VMODEM_VOSEL_ADDR       MT6359_BUCK_VMODEM_ELR0
+#define MT6359_RG_BUCK_VMODEM_VOSEL_MASK       0x7F
+#define MT6359_RG_BUCK_VMODEM_VOSEL_SHIFT      0
+#define MT6359_RG_BUCK_VPROC1_EN_ADDR          MT6359_BUCK_VPROC1_CON0
+#define MT6359_RG_BUCK_VPROC1_LP_ADDR          MT6359_BUCK_VPROC1_CON0
+#define MT6359_RG_BUCK_VPROC1_LP_SHIFT         1
+#define MT6359_DA_VPROC1_VOSEL_ADDR            MT6359_BUCK_VPROC1_DBG0
+#define MT6359_DA_VPROC1_VOSEL_MASK            0x7F
+#define MT6359_DA_VPROC1_VOSEL_SHIFT           0
+#define MT6359_DA_VPROC1_EN_ADDR               MT6359_BUCK_VPROC1_DBG1
+#define MT6359_RG_BUCK_VPROC1_VOSEL_ADDR       MT6359_BUCK_VPROC1_ELR0
+#define MT6359_RG_BUCK_VPROC1_VOSEL_MASK       0x7F
+#define MT6359_RG_BUCK_VPROC1_VOSEL_SHIFT      0
+#define MT6359_RG_BUCK_VPROC2_EN_ADDR          MT6359_BUCK_VPROC2_CON0
+#define MT6359_RG_BUCK_VPROC2_LP_ADDR          MT6359_BUCK_VPROC2_CON0
+#define MT6359_RG_BUCK_VPROC2_LP_SHIFT         1
+#define MT6359_DA_VPROC2_VOSEL_ADDR            MT6359_BUCK_VPROC2_DBG0
+#define MT6359_DA_VPROC2_VOSEL_MASK            0x7F
+#define MT6359_DA_VPROC2_VOSEL_SHIFT           0
+#define MT6359_DA_VPROC2_EN_ADDR               MT6359_BUCK_VPROC2_DBG1
+#define MT6359_RG_BUCK_VPROC2_VOSEL_ADDR       MT6359_BUCK_VPROC2_ELR0
+#define MT6359_RG_BUCK_VPROC2_VOSEL_MASK       0x7F
+#define MT6359_RG_BUCK_VPROC2_VOSEL_SHIFT      0
+#define MT6359_RG_BUCK_VS1_EN_ADDR             MT6359_BUCK_VS1_CON0
+#define MT6359_RG_BUCK_VS1_LP_ADDR             MT6359_BUCK_VS1_CON0
+#define MT6359_RG_BUCK_VS1_LP_SHIFT            1
+#define MT6359_DA_VS1_VOSEL_ADDR               MT6359_BUCK_VS1_DBG0
+#define MT6359_DA_VS1_VOSEL_MASK               0x7F
+#define MT6359_DA_VS1_VOSEL_SHIFT              0
+#define MT6359_DA_VS1_EN_ADDR                  MT6359_BUCK_VS1_DBG1
+#define MT6359_RG_BUCK_VS1_VOSEL_ADDR          MT6359_BUCK_VS1_ELR0
+#define MT6359_RG_BUCK_VS1_VOSEL_MASK          0x7F
+#define MT6359_RG_BUCK_VS1_VOSEL_SHIFT         0
+#define MT6359_RG_BUCK_VS2_EN_ADDR             MT6359_BUCK_VS2_CON0
+#define MT6359_RG_BUCK_VS2_LP_ADDR             MT6359_BUCK_VS2_CON0
+#define MT6359_RG_BUCK_VS2_LP_SHIFT            1
+#define MT6359_DA_VS2_VOSEL_ADDR               MT6359_BUCK_VS2_DBG0
+#define MT6359_DA_VS2_VOSEL_MASK               0x7F
+#define MT6359_DA_VS2_VOSEL_SHIFT              0
+#define MT6359_DA_VS2_EN_ADDR                  MT6359_BUCK_VS2_DBG1
+#define MT6359_RG_BUCK_VS2_VOSEL_ADDR          MT6359_BUCK_VS2_ELR0
+#define MT6359_RG_BUCK_VS2_VOSEL_MASK          0x7F
+#define MT6359_RG_BUCK_VS2_VOSEL_SHIFT         0
+#define MT6359_RG_BUCK_VPA_EN_ADDR             MT6359_BUCK_VPA_CON0
+#define MT6359_RG_BUCK_VPA_LP_ADDR             MT6359_BUCK_VPA_CON0
+#define MT6359_RG_BUCK_VPA_LP_SHIFT            1
+#define MT6359_RG_BUCK_VPA_VOSEL_ADDR          MT6359_BUCK_VPA_CON1
+#define MT6359_RG_BUCK_VPA_VOSEL_MASK          0x3F
+#define MT6359_RG_BUCK_VPA_VOSEL_SHIFT         0
+#define MT6359_DA_VPA_VOSEL_ADDR               MT6359_BUCK_VPA_DBG0
+#define MT6359_DA_VPA_VOSEL_MASK               0x3F
+#define MT6359_DA_VPA_VOSEL_SHIFT              0
+#define MT6359_DA_VPA_EN_ADDR                  MT6359_BUCK_VPA_DBG1
+#define MT6359_RG_VGPU11_FCCM_ADDR             MT6359_VGPUVCORE_ANA_CON2
+#define MT6359_RG_VGPU11_FCCM_SHIFT            9
+#define MT6359_RG_VCORE_FCCM_ADDR              MT6359_VGPUVCORE_ANA_CON13
+#define MT6359_RG_VCORE_FCCM_SHIFT             5
+#define MT6359_RG_VPROC1_FCCM_ADDR             MT6359_VPROC1_ANA_CON3
+#define MT6359_RG_VPROC1_FCCM_SHIFT            1
+#define MT6359_RG_VPROC2_FCCM_ADDR             MT6359_VPROC2_ANA_CON3
+#define MT6359_RG_VPROC2_FCCM_SHIFT            1
+#define MT6359_RG_VMODEM_FCCM_ADDR             MT6359_VMODEM_ANA_CON3
+#define MT6359_RG_VMODEM_FCCM_SHIFT            1
+#define MT6359_RG_VPU_FCCM_ADDR                MT6359_VPU_ANA_CON3
+#define MT6359_RG_VPU_FCCM_SHIFT               1
+#define MT6359_RG_VS1_FPWM_ADDR                MT6359_VS1_ANA_CON0
+#define MT6359_RG_VS1_FPWM_SHIFT               3
+#define MT6359_RG_VS2_FPWM_ADDR                MT6359_VS2_ANA_CON0
+#define MT6359_RG_VS2_FPWM_SHIFT               3
+#define MT6359_RG_VPA_MODESET_ADDR             MT6359_VPA_ANA_CON0
+#define MT6359_RG_VPA_MODESET_SHIFT            1
+#define MT6359_RG_LDO_VSRAM_PROC1_VOSEL_ADDR   MT6359_LDO_VSRAM_PROC1_ELR
+#define MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK   0x7F
+#define MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT  0
+#define MT6359_RG_LDO_VSRAM_PROC2_VOSEL_ADDR   MT6359_LDO_VSRAM_PROC2_ELR
+#define MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK   0x7F
+#define MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT  0
+#define MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR  MT6359_LDO_VSRAM_OTHERS_ELR
+#define MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK  0x7F
+#define MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT 0
+#define MT6359_RG_LDO_VSRAM_MD_VOSEL_ADDR      MT6359_LDO_VSRAM_MD_ELR
+#define MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK      0x7F
+#define MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT     0
+#define MT6359_RG_LDO_VFE28_EN_ADDR            MT6359_LDO_VFE28_CON0
+#define MT6359_DA_VFE28_B_EN_ADDR              MT6359_LDO_VFE28_MON
+#define MT6359_RG_LDO_VXO22_EN_ADDR            MT6359_LDO_VXO22_CON0
+#define MT6359_RG_LDO_VXO22_EN_SHIFT           0
+#define MT6359_DA_VXO22_B_EN_ADDR              MT6359_LDO_VXO22_MON
+#define MT6359_RG_LDO_VRF18_EN_ADDR            MT6359_LDO_VRF18_CON0
+#define MT6359_RG_LDO_VRF18_EN_SHIFT           0
+#define MT6359_DA_VRF18_B_EN_ADDR              MT6359_LDO_VRF18_MON
+#define MT6359_RG_LDO_VRF12_EN_ADDR            MT6359_LDO_VRF12_CON0
+#define MT6359_RG_LDO_VRF12_EN_SHIFT           0
+#define MT6359_DA_VRF12_B_EN_ADDR              MT6359_LDO_VRF12_MON
+#define MT6359_RG_LDO_VEFUSE_EN_ADDR           MT6359_LDO_VEFUSE_CON0
+#define MT6359_RG_LDO_VEFUSE_EN_SHIFT          0
+#define MT6359_DA_VEFUSE_B_EN_ADDR             MT6359_LDO_VEFUSE_MON
+#define MT6359_RG_LDO_VCN33_1_EN_0_ADDR        MT6359_LDO_VCN33_1_CON0
+#define MT6359_RG_LDO_VCN33_1_EN_0_MASK        0x1
+#define MT6359_RG_LDO_VCN33_1_EN_0_SHIFT       0
+#define MT6359_DA_VCN33_1_B_EN_ADDR            MT6359_LDO_VCN33_1_MON
+#define MT6359_RG_LDO_VCN33_1_EN_1_ADDR        MT6359_LDO_VCN33_1_MULTI_SW
+#define MT6359_RG_LDO_VCN33_1_EN_1_SHIFT       15
+#define MT6359_RG_LDO_VCN33_2_EN_0_ADDR        MT6359_LDO_VCN33_2_CON0
+#define MT6359_RG_LDO_VCN33_2_EN_0_SHIFT       0
+#define MT6359_DA_VCN33_2_B_EN_ADDR            MT6359_LDO_VCN33_2_MON
+#define MT6359_RG_LDO_VCN33_2_EN_1_ADDR        MT6359_LDO_VCN33_2_MULTI_SW
+#define MT6359_RG_LDO_VCN33_2_EN_1_MASK        0x1
+#define MT6359_RG_LDO_VCN33_2_EN_1_SHIFT       15
+#define MT6359_RG_LDO_VCN13_EN_ADDR            MT6359_LDO_VCN13_CON0
+#define MT6359_RG_LDO_VCN13_EN_SHIFT           0
+#define MT6359_DA_VCN13_B_EN_ADDR              MT6359_LDO_VCN13_MON
+#define MT6359_RG_LDO_VCN18_EN_ADDR            MT6359_LDO_VCN18_CON0
+#define MT6359_DA_VCN18_B_EN_ADDR              MT6359_LDO_VCN18_MON
+#define MT6359_RG_LDO_VA09_EN_ADDR             MT6359_LDO_VA09_CON0
+#define MT6359_RG_LDO_VA09_EN_SHIFT            0
+#define MT6359_DA_VA09_B_EN_ADDR               MT6359_LDO_VA09_MON
+#define MT6359_RG_LDO_VCAMIO_EN_ADDR           MT6359_LDO_VCAMIO_CON0
+#define MT6359_RG_LDO_VCAMIO_EN_SHIFT          0
+#define MT6359_DA_VCAMIO_B_EN_ADDR             MT6359_LDO_VCAMIO_MON
+#define MT6359_RG_LDO_VA12_EN_ADDR             MT6359_LDO_VA12_CON0
+#define MT6359_RG_LDO_VA12_EN_SHIFT            0
+#define MT6359_DA_VA12_B_EN_ADDR               MT6359_LDO_VA12_MON
+#define MT6359_RG_LDO_VAUX18_EN_ADDR           MT6359_LDO_VAUX18_CON0
+#define MT6359_DA_VAUX18_B_EN_ADDR             MT6359_LDO_VAUX18_MON
+#define MT6359_RG_LDO_VAUD18_EN_ADDR           MT6359_LDO_VAUD18_CON0
+#define MT6359_DA_VAUD18_B_EN_ADDR             MT6359_LDO_VAUD18_MON
+#define MT6359_RG_LDO_VIO18_EN_ADDR            MT6359_LDO_VIO18_CON0
+#define MT6359_RG_LDO_VIO18_EN_SHIFT           0
+#define MT6359_DA_VIO18_B_EN_ADDR              MT6359_LDO_VIO18_MON
+#define MT6359_RG_LDO_VEMC_EN_ADDR             MT6359_LDO_VEMC_CON0
+#define MT6359_RG_LDO_VEMC_EN_SHIFT            0
+#define MT6359_DA_VEMC_B_EN_ADDR               MT6359_LDO_VEMC_MON
+#define MT6359_RG_LDO_VSIM1_EN_ADDR            MT6359_LDO_VSIM1_CON0
+#define MT6359_RG_LDO_VSIM1_EN_SHIFT           0
+#define MT6359_DA_VSIM1_B_EN_ADDR              MT6359_LDO_VSIM1_MON
+#define MT6359_RG_LDO_VSIM2_EN_ADDR            MT6359_LDO_VSIM2_CON0
+#define MT6359_RG_LDO_VSIM2_EN_SHIFT           0
+#define MT6359_DA_VSIM2_B_EN_ADDR              MT6359_LDO_VSIM2_MON
+#define MT6359_RG_LDO_VUSB_EN_0_ADDR           MT6359_LDO_VUSB_CON0
+#define MT6359_RG_LDO_VUSB_EN_0_MASK           0x1
+#define MT6359_RG_LDO_VUSB_EN_0_SHIFT          0
+#define MT6359_DA_VUSB_B_EN_ADDR               MT6359_LDO_VUSB_MON
+#define MT6359_RG_LDO_VUSB_EN_1_ADDR           MT6359_LDO_VUSB_MULTI_SW
+#define MT6359_RG_LDO_VUSB_EN_1_MASK           0x1
+#define MT6359_RG_LDO_VUSB_EN_1_SHIFT          15
+#define MT6359_RG_LDO_VRFCK_EN_ADDR            MT6359_LDO_VRFCK_CON0
+#define MT6359_RG_LDO_VRFCK_EN_SHIFT           0
+#define MT6359_DA_VRFCK_B_EN_ADDR              MT6359_LDO_VRFCK_MON
+#define MT6359_RG_LDO_VBBCK_EN_ADDR            MT6359_LDO_VBBCK_CON0
+#define MT6359_RG_LDO_VBBCK_EN_SHIFT           0
+#define MT6359_DA_VBBCK_B_EN_ADDR              MT6359_LDO_VBBCK_MON
+#define MT6359_RG_LDO_VBIF28_EN_ADDR           MT6359_LDO_VBIF28_CON0
+#define MT6359_DA_VBIF28_B_EN_ADDR             MT6359_LDO_VBIF28_MON
+#define MT6359_RG_LDO_VIBR_EN_ADDR             MT6359_LDO_VIBR_CON0
+#define MT6359_RG_LDO_VIBR_EN_SHIFT            0
+#define MT6359_DA_VIBR_B_EN_ADDR               MT6359_LDO_VIBR_MON
+#define MT6359_RG_LDO_VIO28_EN_ADDR            MT6359_LDO_VIO28_CON0
+#define MT6359_RG_LDO_VIO28_EN_SHIFT           0
+#define MT6359_DA_VIO28_B_EN_ADDR              MT6359_LDO_VIO28_MON
+#define MT6359_RG_LDO_VM18_EN_ADDR             MT6359_LDO_VM18_CON0
+#define MT6359_RG_LDO_VM18_EN_SHIFT            0
+#define MT6359_DA_VM18_B_EN_ADDR               MT6359_LDO_VM18_MON
+#define MT6359_RG_LDO_VUFS_EN_ADDR             MT6359_LDO_VUFS_CON0
+#define MT6359_RG_LDO_VUFS_EN_SHIFT               0
+#define MT6359_DA_VUFS_B_EN_ADDR               MT6359_LDO_VUFS_MON
+#define MT6359_RG_LDO_VSRAM_PROC1_EN_ADDR      MT6359_LDO_VSRAM_PROC1_CON0
+#define MT6359_DA_VSRAM_PROC1_B_EN_ADDR        MT6359_LDO_VSRAM_PROC1_MON
+#define MT6359_DA_VSRAM_PROC1_VOSEL_ADDR       MT6359_LDO_VSRAM_PROC1_VOSEL1
+#define MT6359_DA_VSRAM_PROC1_VOSEL_MASK       0x7F
+#define MT6359_DA_VSRAM_PROC1_VOSEL_SHIFT      8
+#define MT6359_RG_LDO_VSRAM_PROC2_EN_ADDR      MT6359_LDO_VSRAM_PROC2_CON0
+#define MT6359_DA_VSRAM_PROC2_B_EN_ADDR        MT6359_LDO_VSRAM_PROC2_MON
+#define MT6359_DA_VSRAM_PROC2_VOSEL_ADDR       MT6359_LDO_VSRAM_PROC2_VOSEL1
+#define MT6359_DA_VSRAM_PROC2_VOSEL_MASK       0x7F
+#define MT6359_DA_VSRAM_PROC2_VOSEL_SHIFT      8
+#define MT6359_RG_LDO_VSRAM_OTHERS_EN_ADDR     MT6359_LDO_VSRAM_OTHERS_CON0
+#define MT6359_DA_VSRAM_OTHERS_B_EN_ADDR       MT6359_LDO_VSRAM_OTHERS_MON
+#define MT6359_DA_VSRAM_OTHERS_VOSEL_ADDR      MT6359_LDO_VSRAM_OTHERS_VOSEL1
+#define MT6359_DA_VSRAM_OTHERS_VOSEL_MASK      0x7F
+#define MT6359_DA_VSRAM_OTHERS_VOSEL_SHIFT     8
+#define MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR     MT6359_LDO_VSRAM_OTHERS_SSHUB
+#define MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR  MT6359_LDO_VSRAM_OTHERS_SSHUB
+#define MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK  0x7F
+#define MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT 1
+#define MT6359_RG_LDO_VSRAM_MD_EN_ADDR         MT6359_LDO_VSRAM_MD_CON0
+#define MT6359_DA_VSRAM_MD_B_EN_ADDR           MT6359_LDO_VSRAM_MD_MON
+#define MT6359_DA_VSRAM_MD_VOSEL_ADDR          MT6359_LDO_VSRAM_MD_VOSEL1
+#define MT6359_DA_VSRAM_MD_VOSEL_MASK          0x7F
+#define MT6359_DA_VSRAM_MD_VOSEL_SHIFT         8
+#define MT6359_RG_VCN33_1_VOSEL_ADDR           MT6359_VCN33_1_ANA_CON0
+#define MT6359_RG_VCN33_1_VOSEL_MASK           0xF
+#define MT6359_RG_VCN33_1_VOSEL_SHIFT          8
+#define MT6359_RG_VCN33_2_VOSEL_ADDR           MT6359_VCN33_2_ANA_CON0
+#define MT6359_RG_VCN33_2_VOSEL_MASK           0xF
+#define MT6359_RG_VCN33_2_VOSEL_SHIFT          8
+#define MT6359_RG_VEMC_VOSEL_ADDR              MT6359_VEMC_ANA_CON0
+#define MT6359_RG_VEMC_VOSEL_MASK              0xF
+#define MT6359_RG_VEMC_VOSEL_SHIFT             8
+#define MT6359_RG_VSIM1_VOSEL_ADDR             MT6359_VSIM1_ANA_CON0
+#define MT6359_RG_VSIM1_VOSEL_MASK             0xF
+#define MT6359_RG_VSIM1_VOSEL_SHIFT            8
+#define MT6359_RG_VSIM2_VOSEL_ADDR             MT6359_VSIM2_ANA_CON0
+#define MT6359_RG_VSIM2_VOSEL_MASK             0xF
+#define MT6359_RG_VSIM2_VOSEL_SHIFT            8
+#define MT6359_RG_VIO28_VOSEL_ADDR             MT6359_VIO28_ANA_CON0
+#define MT6359_RG_VIO28_VOSEL_MASK             0xF
+#define MT6359_RG_VIO28_VOSEL_SHIFT            8
+#define MT6359_RG_VIBR_VOSEL_ADDR              MT6359_VIBR_ANA_CON0
+#define MT6359_RG_VIBR_VOSEL_MASK              0xF
+#define MT6359_RG_VIBR_VOSEL_SHIFT             8
+#define MT6359_RG_VRF18_VOSEL_ADDR             MT6359_VRF18_ANA_CON0
+#define MT6359_RG_VRF18_VOSEL_MASK             0xF
+#define MT6359_RG_VRF18_VOSEL_SHIFT            8
+#define MT6359_RG_VEFUSE_VOSEL_ADDR            MT6359_VEFUSE_ANA_CON0
+#define MT6359_RG_VEFUSE_VOSEL_MASK            0xF
+#define MT6359_RG_VEFUSE_VOSEL_SHIFT           8
+#define MT6359_RG_VCAMIO_VOSEL_ADDR            MT6359_VCAMIO_ANA_CON0
+#define MT6359_RG_VCAMIO_VOSEL_MASK            0xF
+#define MT6359_RG_VCAMIO_VOSEL_SHIFT           8
+#define MT6359_RG_VIO18_VOSEL_ADDR             MT6359_VIO18_ANA_CON0
+#define MT6359_RG_VIO18_VOSEL_MASK             0xF
+#define MT6359_RG_VIO18_VOSEL_SHIFT            8
+#define MT6359_RG_VM18_VOSEL_ADDR              MT6359_VM18_ANA_CON0
+#define MT6359_RG_VM18_VOSEL_MASK              0xF
+#define MT6359_RG_VM18_VOSEL_SHIFT             8
+#define MT6359_RG_VUFS_VOSEL_ADDR              MT6359_VUFS_ANA_CON0
+#define MT6359_RG_VUFS_VOSEL_MASK              0xF
+#define MT6359_RG_VUFS_VOSEL_SHIFT             8
+#define MT6359_RG_VRF12_VOSEL_ADDR             MT6359_VRF12_ANA_CON0
+#define MT6359_RG_VRF12_VOSEL_MASK             0xF
+#define MT6359_RG_VRF12_VOSEL_SHIFT            8
+#define MT6359_RG_VCN13_VOSEL_ADDR             MT6359_VCN13_ANA_CON0
+#define MT6359_RG_VCN13_VOSEL_MASK             0xF
+#define MT6359_RG_VCN13_VOSEL_SHIFT            8
+#define MT6359_RG_VA09_VOSEL_ADDR              MT6359_VA09_ANA_CON0
+#define MT6359_RG_VA09_VOSEL_MASK              0xF
+#define MT6359_RG_VA09_VOSEL_SHIFT             8
+#define MT6359_RG_VA12_VOSEL_ADDR              MT6359_VA12_ANA_CON0
+#define MT6359_RG_VA12_VOSEL_MASK              0xF
+#define MT6359_RG_VA12_VOSEL_SHIFT             8
+#define MT6359_RG_VXO22_VOSEL_ADDR             MT6359_VXO22_ANA_CON0
+#define MT6359_RG_VXO22_VOSEL_MASK             0xF
+#define MT6359_RG_VXO22_VOSEL_SHIFT            8
+#define MT6359_RG_VRFCK_VOSEL_ADDR             MT6359_VRFCK_ANA_CON0
+#define MT6359_RG_VRFCK_VOSEL_MASK             0xF
+#define MT6359_RG_VRFCK_VOSEL_SHIFT            8
+#define MT6359_RG_VBBCK_VOSEL_ADDR             MT6359_VBBCK_ANA_CON0
+#define MT6359_RG_VBBCK_VOSEL_MASK             0xF
+#define MT6359_RG_VBBCK_VOSEL_SHIFT            8
+
+#endif /* __MFD_MT6359_REGISTERS_H__ */
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 949268581b36..56f210eebc54 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -13,6 +13,7 @@
 enum chip_id {
 	MT6323_CHIP_ID = 0x23,
 	MT6358_CHIP_ID = 0x58,
+	MT6359_CHIP_ID = 0x59,
 	MT6391_CHIP_ID = 0x91,
 	MT6397_CHIP_ID = 0x97,
 };
-- 
2.18.0

