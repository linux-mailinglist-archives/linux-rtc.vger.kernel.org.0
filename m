Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E855B34FF2F
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Mar 2021 13:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhCaLC4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 Mar 2021 07:02:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52114 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235534AbhCaLCa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 Mar 2021 07:02:30 -0400
X-UUID: 17b415228856475fa6015d2c8e9a7d00-20210331
X-UUID: 17b415228856475fa6015d2c8e9a7d00-20210331
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1758570673; Wed, 31 Mar 2021 19:02:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 19:02:19 +0800
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
Subject: [PATCH v7 7/8] regulator: mt6359: Add support for MT6359P regulator
Date:   Wed, 31 Mar 2021 19:02:06 +0800
Message-ID: <1617188527-3392-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D97410162E80A537FA399D10FC3824F7C8753CFA648FE429D1834526614BE4562000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The MT6359P is a eco version for MT6359 regulator.
We add support based on MT6359 regulator driver.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
changes since v6:
- no change.
---
 drivers/regulator/mt6359-regulator.c       | 379 ++++++++++++++++++++-
 include/linux/mfd/mt6359p/registers.h      | 249 ++++++++++++++
 include/linux/regulator/mt6359-regulator.h |   1 +
 3 files changed, 623 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/mfd/mt6359p/registers.h

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 994d3f67f73d..4f517c9fd6c4 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -4,6 +4,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6359p/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -147,6 +148,29 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),					\
 }
 
+#define MT6359P_LDO1(match, _name, _ops, _volt_table,	\
+	_enable_reg, _enable_mask, _status_reg,		\
+	_vsel_reg, _vsel_mask)				\
+[MT6359_ID_##_name] = {					\
+	.desc = {					\
+		.name = #_name,				\
+		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.ops = &_ops,				\
+		.type = REGULATOR_VOLTAGE,		\
+		.id = MT6359_ID_##_name,		\
+		.owner = THIS_MODULE,			\
+		.n_voltages = ARRAY_SIZE(_volt_table),	\
+		.volt_table = _volt_table,		\
+		.vsel_reg = _vsel_reg,			\
+		.vsel_mask = _vsel_mask,		\
+		.enable_reg = _enable_reg,		\
+		.enable_mask = BIT(_enable_mask),	\
+	},						\
+	.status_reg = _status_reg,			\
+	.qi = BIT(0),					\
+}
+
 static const struct linear_range mt_volt_range1[] = {
 	REGULATOR_LINEAR_RANGE(800000, 0, 0x70, 12500),
 };
@@ -175,6 +199,10 @@ static const struct linear_range mt_volt_range7[] = {
 	REGULATOR_LINEAR_RANGE(500000, 0, 0x7f, 6250),
 };
 
+static const struct linear_range mt_volt_range8[] = {
+	REGULATOR_LINEAR_RANGE(506250, 0, 0x7f, 6250),
+};
+
 static const u32 vsim1_voltages[] = {
 	0, 0, 0, 1700000, 1800000, 0, 0, 0, 2700000, 0, 0, 3000000, 3100000,
 };
@@ -212,6 +240,10 @@ static const u32 vrfck_voltages[] = {
 	0, 0, 1500000, 0, 0, 0, 0, 1600000, 0, 0, 0, 0, 1700000,
 };
 
+static const u32 vrfck_voltages_1[] = {
+	1240000, 1600000,
+};
+
 static const u32 vio28_voltages[] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 2800000, 2900000, 3000000, 3100000, 3300000,
 };
@@ -220,6 +252,11 @@ static const u32 vemc_voltages[] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2900000, 3000000, 0, 3300000,
 };
 
+static const u32 vemc_voltages_1[] = {
+	0, 0, 0, 0, 0, 0, 0, 0, 2500000, 2800000, 2900000, 3000000, 3100000,
+	3300000,
+};
+
 static const u32 va12_voltages[] = {
 	0, 0, 0, 0, 0, 0, 1200000, 1300000,
 };
@@ -356,6 +393,78 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
+					u32 sel)
+{
+	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	int ret;
+	u32 val = 0;
+
+	sel <<= ffs(info->desc.vsel_mask) - 1;
+	ret = regmap_write(rdev->regmap, MT6359P_TMA_KEY_ADDR, TMA_KEY);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(rdev->regmap, MT6359P_VM_MODE_ADDR, &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 0:
+		/* If HW trapping is 0, use VEMC_VOSEL_0 */
+		ret = regmap_update_bits(rdev->regmap,
+					 info->desc.vsel_reg,
+					 info->desc.vsel_mask, sel);
+		break;
+	case 1:
+		/* If HW trapping is 1, use VEMC_VOSEL_1 */
+		ret = regmap_update_bits(rdev->regmap,
+					 info->desc.vsel_reg + 0x2,
+					 info->desc.vsel_mask, sel);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	ret = regmap_write(rdev->regmap, MT6359P_TMA_KEY_ADDR, 0);
+	return ret;
+}
+
+static int mt6359p_vemc_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	int ret;
+	u32 val = 0;
+
+	ret = regmap_read(rdev->regmap, MT6359P_VM_MODE_ADDR, &val);
+	if (ret)
+		return ret;
+	switch (val) {
+	case 0:
+		/* If HW trapping is 0, use VEMC_VOSEL_0 */
+		ret = regmap_read(rdev->regmap,
+				  info->desc.vsel_reg, &val);
+		break;
+	case 1:
+		/* If HW trapping is 1, use VEMC_VOSEL_1 */
+		ret = regmap_read(rdev->regmap,
+				  info->desc.vsel_reg + 0x2, &val);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret)
+		return ret;
+
+	val &= info->desc.vsel_mask;
+	val >>= ffs(info->desc.vsel_mask) - 1;
+
+	return val;
+}
+
 static const struct regulator_ops mt6359_volt_range_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.map_voltage = regulator_map_voltage_linear_range,
@@ -389,6 +498,18 @@ static const struct regulator_ops mt6359_volt_fixed_ops = {
 	.get_status = mt6359_get_status,
 };
 
+static const struct regulator_ops mt6359p_vemc_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = mt6359p_vemc_set_voltage_sel,
+	.get_voltage_sel = mt6359p_vemc_get_voltage_sel,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6359_get_status,
+};
+
 /* The array is indexed by id(MT6359_ID_XXX) */
 static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500, 0,
@@ -626,21 +747,267 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
 };
 
+static struct mt6359_regulator_info mt6359p_regulators[] = {
+	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500, 0,
+		    mt_volt_range1, MT6359_RG_BUCK_VS1_EN_ADDR,
+		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VS1_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VS1_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VS1_LP_ADDR, MT6359_RG_BUCK_VS1_LP_SHIFT,
+		    MT6359_RG_VS1_FPWM_ADDR, MT6359_RG_VS1_FPWM_SHIFT),
+	MT6359_BUCK("buck_vgpu11", VGPU11, 400000, 1193750, 6250, 0,
+		    mt_volt_range2, MT6359_RG_BUCK_VGPU11_EN_ADDR,
+		    MT6359_DA_VGPU11_EN_ADDR, MT6359P_RG_BUCK_VGPU11_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VGPU11_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VGPU11_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
+		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
+		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
+	MT6359_BUCK("buck_vmodem", VMODEM, 400000, 1100000, 6250, 0,
+		    mt_volt_range3, MT6359_RG_BUCK_VMODEM_EN_ADDR,
+		    MT6359_DA_VMODEM_EN_ADDR, MT6359_RG_BUCK_VMODEM_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VMODEM_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VMODEM_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VMODEM_LP_ADDR,
+		    MT6359_RG_BUCK_VMODEM_LP_SHIFT,
+		    MT6359_RG_VMODEM_FCCM_ADDR, MT6359_RG_VMODEM_FCCM_SHIFT),
+	MT6359_BUCK("buck_vpu", VPU, 400000, 1193750, 6250, 0,
+		    mt_volt_range2, MT6359_RG_BUCK_VPU_EN_ADDR,
+		    MT6359_DA_VPU_EN_ADDR, MT6359_RG_BUCK_VPU_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VPU_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VPU_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VPU_LP_ADDR, MT6359_RG_BUCK_VPU_LP_SHIFT,
+		    MT6359_RG_VPU_FCCM_ADDR, MT6359_RG_VPU_FCCM_SHIFT),
+	MT6359_BUCK("buck_vcore", VCORE, 506250, 1300000, 6250, 0,
+		    mt_volt_range8, MT6359_RG_BUCK_VCORE_EN_ADDR,
+		    MT6359_DA_VCORE_EN_ADDR, MT6359P_RG_BUCK_VCORE_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VCORE_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VCORE_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
+		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
+	MT6359_BUCK("buck_vs2", VS2, 800000, 1600000, 12500, 0,
+		    mt_volt_range4, MT6359_RG_BUCK_VS2_EN_ADDR,
+		    MT6359_DA_VS2_EN_ADDR, MT6359_RG_BUCK_VS2_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VS2_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VS2_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VS2_LP_ADDR, MT6359_RG_BUCK_VS2_LP_SHIFT,
+		    MT6359_RG_VS2_FPWM_ADDR, MT6359_RG_VS2_FPWM_SHIFT),
+	MT6359_BUCK("buck_vpa", VPA, 500000, 3650000, 50000, 0,
+		    mt_volt_range5, MT6359_RG_BUCK_VPA_EN_ADDR,
+		    MT6359_DA_VPA_EN_ADDR, MT6359_RG_BUCK_VPA_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VPA_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VPA_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VPA_LP_ADDR, MT6359_RG_BUCK_VPA_LP_SHIFT,
+		    MT6359_RG_VPA_MODESET_ADDR, MT6359_RG_VPA_MODESET_SHIFT),
+	MT6359_BUCK("buck_vproc2", VPROC2, 400000, 1193750, 6250, 0,
+		    mt_volt_range2, MT6359_RG_BUCK_VPROC2_EN_ADDR,
+		    MT6359_DA_VPROC2_EN_ADDR, MT6359_RG_BUCK_VPROC2_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VPROC2_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VPROC2_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VPROC2_LP_ADDR,
+		    MT6359_RG_BUCK_VPROC2_LP_SHIFT,
+		    MT6359_RG_VPROC2_FCCM_ADDR, MT6359_RG_VPROC2_FCCM_SHIFT),
+	MT6359_BUCK("buck_vproc1", VPROC1, 400000, 1193750, 6250, 0,
+		    mt_volt_range2, MT6359_RG_BUCK_VPROC1_EN_ADDR,
+		    MT6359_DA_VPROC1_EN_ADDR, MT6359_RG_BUCK_VPROC1_VOSEL_ADDR,
+		    MT6359_RG_BUCK_VPROC1_VOSEL_MASK <<
+		    MT6359_RG_BUCK_VPROC1_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VPROC1_LP_ADDR,
+		    MT6359_RG_BUCK_VPROC1_LP_SHIFT,
+		    MT6359_RG_VPROC1_FCCM_ADDR, MT6359_RG_VPROC1_FCCM_SHIFT),
+	MT6359_BUCK("buck_vgpu11_sshub", VGPU11_SSHUB, 400000, 1193750, 6250, 0,
+		    mt_volt_range2, MT6359P_RG_BUCK_VGPU11_SSHUB_EN_ADDR,
+		    MT6359_DA_VGPU11_EN_ADDR,
+		    MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_ADDR,
+		    MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_MASK <<
+		    MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_SHIFT,
+		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
+		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
+		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
+	MT6359_REG_FIXED("ldo_vaud18", VAUD18, MT6359P_RG_LDO_VAUD18_EN_ADDR,
+			 MT6359P_DA_VAUD18_B_EN_ADDR, 1800000),
+	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
+		   MT6359P_RG_LDO_VSIM1_EN_ADDR, MT6359P_RG_LDO_VSIM1_EN_SHIFT,
+		   MT6359P_DA_VSIM1_B_EN_ADDR, MT6359P_RG_VSIM1_VOSEL_ADDR,
+		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
+		   480),
+	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
+		   MT6359P_RG_LDO_VIBR_EN_ADDR, MT6359P_RG_LDO_VIBR_EN_SHIFT,
+		   MT6359P_DA_VIBR_B_EN_ADDR, MT6359P_RG_VIBR_VOSEL_ADDR,
+		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
+		   240),
+	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
+		   MT6359P_RG_LDO_VRF12_EN_ADDR, MT6359P_RG_LDO_VRF12_EN_SHIFT,
+		   MT6359P_DA_VRF12_B_EN_ADDR, MT6359P_RG_VRF12_VOSEL_ADDR,
+		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
+		   480),
+	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359P_RG_LDO_VUSB_EN_0_ADDR,
+			 MT6359P_DA_VUSB_B_EN_ADDR, 3000000),
+	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
+			  0, mt_volt_range6, MT6359P_RG_LDO_VSRAM_PROC2_EN_ADDR,
+			  MT6359P_DA_VSRAM_PROC2_B_EN_ADDR,
+			  MT6359P_RG_LDO_VSRAM_PROC2_VOSEL_ADDR,
+			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK <<
+			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT),
+	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
+		   MT6359P_RG_LDO_VIO18_EN_ADDR, MT6359P_RG_LDO_VIO18_EN_SHIFT,
+		   MT6359P_DA_VIO18_B_EN_ADDR, MT6359P_RG_VIO18_VOSEL_ADDR,
+		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
+		   960),
+	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
+		   MT6359P_RG_LDO_VCAMIO_EN_ADDR,
+		   MT6359P_RG_LDO_VCAMIO_EN_SHIFT,
+		   MT6359P_DA_VCAMIO_B_EN_ADDR, MT6359P_RG_VCAMIO_VOSEL_ADDR,
+		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
+		   1290),
+	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359P_RG_LDO_VCN18_EN_ADDR,
+			 MT6359P_DA_VCN18_B_EN_ADDR, 1800000),
+	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359P_RG_LDO_VFE28_EN_ADDR,
+			 MT6359P_DA_VFE28_B_EN_ADDR, 2800000),
+	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
+		   MT6359P_RG_LDO_VCN13_EN_ADDR, MT6359P_RG_LDO_VCN13_EN_SHIFT,
+		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
+		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
+		   240),
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
+		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
+		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
+		   MT6359_RG_VCN33_1_VOSEL_MASK <<
+		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
+	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
+		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
+		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
+		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
+		   MT6359_RG_VCN33_1_VOSEL_MASK <<
+		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
+	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359P_RG_LDO_VAUX18_EN_ADDR,
+			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
+	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
+			  6250, 0, mt_volt_range6,
+			  MT6359P_RG_LDO_VSRAM_OTHERS_EN_ADDR,
+			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
+			  MT6359P_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR,
+			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK <<
+			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT),
+	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
+		   MT6359P_RG_LDO_VEFUSE_EN_ADDR,
+		   MT6359P_RG_LDO_VEFUSE_EN_SHIFT,
+		   MT6359P_DA_VEFUSE_B_EN_ADDR, MT6359P_RG_VEFUSE_VOSEL_ADDR,
+		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
+		   240),
+	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
+		   MT6359P_RG_LDO_VXO22_EN_ADDR, MT6359P_RG_LDO_VXO22_EN_SHIFT,
+		   MT6359P_DA_VXO22_B_EN_ADDR, MT6359P_RG_VXO22_VOSEL_ADDR,
+		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
+		   480),
+	MT6359_LDO("ldo_vrfck_1", VRFCK, vrfck_voltages_1,
+		   MT6359P_RG_LDO_VRFCK_EN_ADDR, MT6359P_RG_LDO_VRFCK_EN_SHIFT,
+		   MT6359P_DA_VRFCK_B_EN_ADDR, MT6359P_RG_VRFCK_VOSEL_ADDR,
+		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
+		   480),
+	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359P_RG_LDO_VBIF28_EN_ADDR,
+			 MT6359P_DA_VBIF28_B_EN_ADDR, 2800000),
+	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
+		   MT6359P_RG_LDO_VIO28_EN_ADDR, MT6359P_RG_LDO_VIO28_EN_SHIFT,
+		   MT6359P_DA_VIO28_B_EN_ADDR, MT6359P_RG_VIO28_VOSEL_ADDR,
+		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
+		   1920),
+	MT6359P_LDO1("ldo_vemc_1", VEMC, mt6359p_vemc_ops, vemc_voltages_1,
+		     MT6359P_RG_LDO_VEMC_EN_ADDR, MT6359P_RG_LDO_VEMC_EN_SHIFT,
+		     MT6359P_DA_VEMC_B_EN_ADDR,
+		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
+		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
+		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
+		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
+		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
+		   MT6359_RG_VCN33_2_VOSEL_MASK <<
+		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
+	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
+		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
+		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
+		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
+		   MT6359_RG_VCN33_2_VOSEL_MASK <<
+		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
+	MT6359_LDO("ldo_va12", VA12, va12_voltages,
+		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
+		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
+		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
+		   960),
+	MT6359_LDO("ldo_va09", VA09, va09_voltages,
+		   MT6359P_RG_LDO_VA09_EN_ADDR, MT6359P_RG_LDO_VA09_EN_SHIFT,
+		   MT6359P_DA_VA09_B_EN_ADDR, MT6359P_RG_VA09_VOSEL_ADDR,
+		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
+		   960),
+	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
+		   MT6359P_RG_LDO_VRF18_EN_ADDR, MT6359P_RG_LDO_VRF18_EN_SHIFT,
+		   MT6359P_DA_VRF18_B_EN_ADDR, MT6359P_RG_VRF18_VOSEL_ADDR,
+		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
+		   240),
+	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1293750, 6250,
+			  0, mt_volt_range7, MT6359P_RG_LDO_VSRAM_MD_EN_ADDR,
+			  MT6359P_DA_VSRAM_MD_B_EN_ADDR,
+			  MT6359P_RG_LDO_VSRAM_MD_VOSEL_ADDR,
+			  MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK <<
+			  MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT),
+	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
+		   MT6359P_RG_LDO_VUFS_EN_ADDR, MT6359P_RG_LDO_VUFS_EN_SHIFT,
+		   MT6359P_DA_VUFS_B_EN_ADDR, MT6359P_RG_VUFS_VOSEL_ADDR,
+		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
+		   1920),
+	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
+		   MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SHIFT,
+		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
+		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
+		   1920),
+	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
+		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
+		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
+		   MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_SHIFT,
+		   480),
+	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
+			  0, mt_volt_range6, MT6359P_RG_LDO_VSRAM_PROC1_EN_ADDR,
+			  MT6359P_DA_VSRAM_PROC1_B_EN_ADDR,
+			  MT6359P_RG_LDO_VSRAM_PROC1_VOSEL_ADDR,
+			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK <<
+			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT),
+	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
+		   MT6359P_RG_LDO_VSIM2_EN_ADDR, MT6359P_RG_LDO_VSIM2_EN_SHIFT,
+		   MT6359P_DA_VSIM2_B_EN_ADDR, MT6359P_RG_VSIM2_VOSEL_ADDR,
+		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
+		   480),
+	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
+			  500000, 1293750, 6250, 0, mt_volt_range6,
+			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
+			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
+			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR,
+			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK <<
+			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
+};
+
 static int mt6359_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
-	int i;
+	struct mt6359_regulator_info *mt6359_info;
+	int i, hw_ver;
+
+	regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
+	if (hw_ver >= MT6359P_CHIP_VER)
+		mt6359_info = mt6359p_regulators;
+	else
+		mt6359_info = mt6359_regulators;
 
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
-	for (i = 0; i < MT6359_MAX_REGULATOR; i++) {
-		config.driver_data = &mt6359_regulators[i];
-		rdev = devm_regulator_register(&pdev->dev, &mt6359_regulators[i].desc, &config);
+	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
+		config.driver_data = mt6359_info;
+		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
 		if (IS_ERR(rdev)) {
-			dev_err(&pdev->dev, "failed to register %s\n",
-				mt6359_regulators[i].desc.name);
+			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
 			return PTR_ERR(rdev);
 		}
 	}
diff --git a/include/linux/mfd/mt6359p/registers.h b/include/linux/mfd/mt6359p/registers.h
new file mode 100644
index 000000000000..3d97c1885171
--- /dev/null
+++ b/include/linux/mfd/mt6359p/registers.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MFD_MT6359P_REGISTERS_H__
+#define __MFD_MT6359P_REGISTERS_H__
+
+#define MT6359P_CHIP_VER 0x5930
+
+/* PMIC Registers */
+#define MT6359P_HWCID                         0x8
+#define MT6359P_TOP_TRAP                      0x50
+#define MT6359P_TOP_TMA_KEY                   0x3a8
+#define MT6359P_BUCK_VCORE_ELR_NUM            0x152a
+#define MT6359P_BUCK_VCORE_ELR0               0x152c
+#define MT6359P_BUCK_VGPU11_SSHUB_CON0        0x15aa
+#define MT6359P_BUCK_VGPU11_ELR0              0x15b4
+#define MT6359P_LDO_VSRAM_PROC1_ELR           0x1b44
+#define MT6359P_LDO_VSRAM_PROC2_ELR           0x1b46
+#define MT6359P_LDO_VSRAM_OTHERS_ELR          0x1b48
+#define MT6359P_LDO_VSRAM_MD_ELR              0x1b4a
+#define MT6359P_LDO_VEMC_ELR_0                0x1b4c
+#define MT6359P_LDO_VFE28_CON0                0x1b88
+#define MT6359P_LDO_VFE28_MON                 0x1b8c
+#define MT6359P_LDO_VXO22_CON0                0x1b9a
+#define MT6359P_LDO_VXO22_MON                 0x1b9e
+#define MT6359P_LDO_VRF18_CON0                0x1bac
+#define MT6359P_LDO_VRF18_MON                 0x1bb0
+#define MT6359P_LDO_VRF12_CON0                0x1bbe
+#define MT6359P_LDO_VRF12_MON                 0x1bc2
+#define MT6359P_LDO_VEFUSE_CON0               0x1bd0
+#define MT6359P_LDO_VEFUSE_MON                0x1bd4
+#define MT6359P_LDO_VCN33_1_CON0              0x1be2
+#define MT6359P_LDO_VCN33_1_MON               0x1be6
+#define MT6359P_LDO_VCN33_1_MULTI_SW          0x1bf4
+#define MT6359P_LDO_VCN33_2_CON0              0x1c08
+#define MT6359P_LDO_VCN33_2_MON               0x1c0c
+#define MT6359P_LDO_VCN33_2_MULTI_SW          0x1c1a
+#define MT6359P_LDO_VCN13_CON0                0x1c1c
+#define MT6359P_LDO_VCN13_MON                 0x1c20
+#define MT6359P_LDO_VCN18_CON0                0x1c2e
+#define MT6359P_LDO_VCN18_MON                 0x1c32
+#define MT6359P_LDO_VA09_CON0                 0x1c40
+#define MT6359P_LDO_VA09_MON                  0x1c44
+#define MT6359P_LDO_VCAMIO_CON0               0x1c52
+#define MT6359P_LDO_VCAMIO_MON                0x1c56
+#define MT6359P_LDO_VA12_CON0                 0x1c64
+#define MT6359P_LDO_VA12_MON                  0x1c68
+#define MT6359P_LDO_VAUX18_CON0               0x1c88
+#define MT6359P_LDO_VAUX18_MON                0x1c8c
+#define MT6359P_LDO_VAUD18_CON0               0x1c9a
+#define MT6359P_LDO_VAUD18_MON                0x1c9e
+#define MT6359P_LDO_VIO18_CON0                0x1cac
+#define MT6359P_LDO_VIO18_MON                 0x1cb0
+#define MT6359P_LDO_VEMC_CON0                 0x1cbe
+#define MT6359P_LDO_VEMC_MON                  0x1cc2
+#define MT6359P_LDO_VSIM1_CON0                0x1cd0
+#define MT6359P_LDO_VSIM1_MON                 0x1cd4
+#define MT6359P_LDO_VSIM2_CON0                0x1ce2
+#define MT6359P_LDO_VSIM2_MON                 0x1ce6
+#define MT6359P_LDO_VUSB_CON0                 0x1d08
+#define MT6359P_LDO_VUSB_MON                  0x1d0c
+#define MT6359P_LDO_VUSB_MULTI_SW             0x1d1a
+#define MT6359P_LDO_VRFCK_CON0                0x1d1c
+#define MT6359P_LDO_VRFCK_MON                 0x1d20
+#define MT6359P_LDO_VBBCK_CON0                0x1d2e
+#define MT6359P_LDO_VBBCK_MON                 0x1d32
+#define MT6359P_LDO_VBIF28_CON0               0x1d40
+#define MT6359P_LDO_VBIF28_MON                0x1d44
+#define MT6359P_LDO_VIBR_CON0                 0x1d52
+#define MT6359P_LDO_VIBR_MON                  0x1d56
+#define MT6359P_LDO_VIO28_CON0                0x1d64
+#define MT6359P_LDO_VIO28_MON                 0x1d68
+#define MT6359P_LDO_VM18_CON0                 0x1d88
+#define MT6359P_LDO_VM18_MON                  0x1d8c
+#define MT6359P_LDO_VUFS_CON0                 0x1d9a
+#define MT6359P_LDO_VUFS_MON                  0x1d9e
+#define MT6359P_LDO_VSRAM_PROC1_CON0          0x1e88
+#define MT6359P_LDO_VSRAM_PROC1_MON           0x1e8c
+#define MT6359P_LDO_VSRAM_PROC1_VOSEL1        0x1e90
+#define MT6359P_LDO_VSRAM_PROC2_CON0          0x1ea8
+#define MT6359P_LDO_VSRAM_PROC2_MON           0x1eac
+#define MT6359P_LDO_VSRAM_PROC2_VOSEL1        0x1eb0
+#define MT6359P_LDO_VSRAM_OTHERS_CON0         0x1f08
+#define MT6359P_LDO_VSRAM_OTHERS_MON          0x1f0c
+#define MT6359P_LDO_VSRAM_OTHERS_VOSEL1       0x1f10
+#define MT6359P_LDO_VSRAM_OTHERS_SSHUB        0x1f28
+#define MT6359P_LDO_VSRAM_MD_CON0             0x1f2e
+#define MT6359P_LDO_VSRAM_MD_MON              0x1f32
+#define MT6359P_LDO_VSRAM_MD_VOSEL1           0x1f36
+#define MT6359P_VFE28_ANA_CON0                0x1f88
+#define MT6359P_VAUX18_ANA_CON0               0x1f8c
+#define MT6359P_VUSB_ANA_CON0                 0x1f90
+#define MT6359P_VBIF28_ANA_CON0               0x1f94
+#define MT6359P_VCN33_1_ANA_CON0              0x1f98
+#define MT6359P_VCN33_2_ANA_CON0              0x1f9c
+#define MT6359P_VEMC_ANA_CON0                 0x1fa0
+#define MT6359P_VSIM1_ANA_CON0                0x1fa2
+#define MT6359P_VSIM2_ANA_CON0                0x1fa6
+#define MT6359P_VIO28_ANA_CON0                0x1faa
+#define MT6359P_VIBR_ANA_CON0                 0x1fae
+#define MT6359P_VFE28_ELR_4                   0x1fc0
+#define MT6359P_VRF18_ANA_CON0                0x2008
+#define MT6359P_VEFUSE_ANA_CON0               0x200c
+#define MT6359P_VCN18_ANA_CON0                0x2010
+#define MT6359P_VCAMIO_ANA_CON0               0x2014
+#define MT6359P_VAUD18_ANA_CON0               0x2018
+#define MT6359P_VIO18_ANA_CON0                0x201c
+#define MT6359P_VM18_ANA_CON0                 0x2020
+#define MT6359P_VUFS_ANA_CON0                 0x2024
+#define MT6359P_VRF12_ANA_CON0                0x202a
+#define MT6359P_VCN13_ANA_CON0                0x202e
+#define MT6359P_VA09_ANA_CON0                 0x2032
+#define MT6359P_VRF18_ELR_3                   0x204e
+#define MT6359P_VXO22_ANA_CON0                0x2088
+#define MT6359P_VRFCK_ANA_CON0                0x208c
+#define MT6359P_VBBCK_ANA_CON0                0x2096
+
+#define MT6359P_RG_BUCK_VCORE_VOSEL_ADDR         MT6359P_BUCK_VCORE_ELR0
+#define MT6359P_RG_BUCK_VGPU11_SSHUB_EN_ADDR     MT6359P_BUCK_VGPU11_SSHUB_CON0
+#define MT6359P_RG_BUCK_VGPU11_VOSEL_ADDR        MT6359P_BUCK_VGPU11_ELR0
+#define MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_ADDR  MT6359P_BUCK_VGPU11_SSHUB_CON0
+#define MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_MASK  0x7F
+#define MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_SHIFT 4
+#define MT6359P_RG_LDO_VSRAM_PROC1_VOSEL_ADDR    MT6359P_LDO_VSRAM_PROC1_ELR
+#define MT6359P_RG_LDO_VSRAM_PROC2_VOSEL_ADDR    MT6359P_LDO_VSRAM_PROC2_ELR
+#define MT6359P_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR   MT6359P_LDO_VSRAM_OTHERS_ELR
+#define MT6359P_RG_LDO_VSRAM_MD_VOSEL_ADDR       MT6359P_LDO_VSRAM_MD_ELR
+#define MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR         MT6359P_LDO_VEMC_ELR_0
+#define MT6359P_RG_LDO_VEMC_VOSEL_0_MASK         0xF
+#define MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT        0
+#define MT6359P_RG_LDO_VFE28_EN_ADDR             MT6359P_LDO_VFE28_CON0
+#define MT6359P_DA_VFE28_B_EN_ADDR               MT6359P_LDO_VFE28_MON
+#define MT6359P_RG_LDO_VXO22_EN_ADDR             MT6359P_LDO_VXO22_CON0
+#define MT6359P_RG_LDO_VXO22_EN_SHIFT            0
+#define MT6359P_DA_VXO22_B_EN_ADDR               MT6359P_LDO_VXO22_MON
+#define MT6359P_RG_LDO_VRF18_EN_ADDR             MT6359P_LDO_VRF18_CON0
+#define MT6359P_RG_LDO_VRF18_EN_SHIFT            0
+#define MT6359P_DA_VRF18_B_EN_ADDR               MT6359P_LDO_VRF18_MON
+#define MT6359P_RG_LDO_VRF12_EN_ADDR             MT6359P_LDO_VRF12_CON0
+#define MT6359P_RG_LDO_VRF12_EN_SHIFT            0
+#define MT6359P_DA_VRF12_B_EN_ADDR               MT6359P_LDO_VRF12_MON
+#define MT6359P_RG_LDO_VEFUSE_EN_ADDR            MT6359P_LDO_VEFUSE_CON0
+#define MT6359P_RG_LDO_VEFUSE_EN_SHIFT           0
+#define MT6359P_DA_VEFUSE_B_EN_ADDR              MT6359P_LDO_VEFUSE_MON
+#define MT6359P_RG_LDO_VCN33_1_EN_0_ADDR         MT6359P_LDO_VCN33_1_CON0
+#define MT6359P_DA_VCN33_1_B_EN_ADDR             MT6359P_LDO_VCN33_1_MON
+#define MT6359P_RG_LDO_VCN33_1_EN_1_ADDR         MT6359P_LDO_VCN33_1_MULTI_SW
+#define MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT        15
+#define MT6359P_RG_LDO_VCN33_2_EN_0_ADDR         MT6359P_LDO_VCN33_2_CON0
+#define MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT        0
+#define MT6359P_DA_VCN33_2_B_EN_ADDR             MT6359P_LDO_VCN33_2_MON
+#define MT6359P_RG_LDO_VCN33_2_EN_1_ADDR         MT6359P_LDO_VCN33_2_MULTI_SW
+#define MT6359P_RG_LDO_VCN13_EN_ADDR             MT6359P_LDO_VCN13_CON0
+#define MT6359P_RG_LDO_VCN13_EN_SHIFT            0
+#define MT6359P_DA_VCN13_B_EN_ADDR               MT6359P_LDO_VCN13_MON
+#define MT6359P_RG_LDO_VCN18_EN_ADDR             MT6359P_LDO_VCN18_CON0
+#define MT6359P_DA_VCN18_B_EN_ADDR               MT6359P_LDO_VCN18_MON
+#define MT6359P_RG_LDO_VA09_EN_ADDR              MT6359P_LDO_VA09_CON0
+#define MT6359P_RG_LDO_VA09_EN_SHIFT             0
+#define MT6359P_DA_VA09_B_EN_ADDR                MT6359P_LDO_VA09_MON
+#define MT6359P_RG_LDO_VCAMIO_EN_ADDR            MT6359P_LDO_VCAMIO_CON0
+#define MT6359P_RG_LDO_VCAMIO_EN_SHIFT           0
+#define MT6359P_DA_VCAMIO_B_EN_ADDR              MT6359P_LDO_VCAMIO_MON
+#define MT6359P_RG_LDO_VA12_EN_ADDR              MT6359P_LDO_VA12_CON0
+#define MT6359P_RG_LDO_VA12_EN_SHIFT             0
+#define MT6359P_DA_VA12_B_EN_ADDR                MT6359P_LDO_VA12_MON
+#define MT6359P_RG_LDO_VAUX18_EN_ADDR            MT6359P_LDO_VAUX18_CON0
+#define MT6359P_DA_VAUX18_B_EN_ADDR              MT6359P_LDO_VAUX18_MON
+#define MT6359P_RG_LDO_VAUD18_EN_ADDR            MT6359P_LDO_VAUD18_CON0
+#define MT6359P_DA_VAUD18_B_EN_ADDR              MT6359P_LDO_VAUD18_MON
+#define MT6359P_RG_LDO_VIO18_EN_ADDR             MT6359P_LDO_VIO18_CON0
+#define MT6359P_RG_LDO_VIO18_EN_SHIFT            0
+#define MT6359P_DA_VIO18_B_EN_ADDR               MT6359P_LDO_VIO18_MON
+#define MT6359P_RG_LDO_VEMC_EN_ADDR              MT6359P_LDO_VEMC_CON0
+#define MT6359P_RG_LDO_VEMC_EN_SHIFT             0
+#define MT6359P_DA_VEMC_B_EN_ADDR                MT6359P_LDO_VEMC_MON
+#define MT6359P_RG_LDO_VSIM1_EN_ADDR             MT6359P_LDO_VSIM1_CON0
+#define MT6359P_RG_LDO_VSIM1_EN_SHIFT            0
+#define MT6359P_DA_VSIM1_B_EN_ADDR               MT6359P_LDO_VSIM1_MON
+#define MT6359P_RG_LDO_VSIM2_EN_ADDR             MT6359P_LDO_VSIM2_CON0
+#define MT6359P_RG_LDO_VSIM2_EN_SHIFT            0
+#define MT6359P_DA_VSIM2_B_EN_ADDR               MT6359P_LDO_VSIM2_MON
+#define MT6359P_RG_LDO_VUSB_EN_0_ADDR            MT6359P_LDO_VUSB_CON0
+#define MT6359P_DA_VUSB_B_EN_ADDR                MT6359P_LDO_VUSB_MON
+#define MT6359P_RG_LDO_VUSB_EN_1_ADDR            MT6359P_LDO_VUSB_MULTI_SW
+#define MT6359P_RG_LDO_VRFCK_EN_ADDR             MT6359P_LDO_VRFCK_CON0
+#define MT6359P_RG_LDO_VRFCK_EN_SHIFT            0
+#define MT6359P_DA_VRFCK_B_EN_ADDR               MT6359P_LDO_VRFCK_MON
+#define MT6359P_RG_LDO_VBBCK_EN_ADDR             MT6359P_LDO_VBBCK_CON0
+#define MT6359P_RG_LDO_VBBCK_EN_SHIFT            0
+#define MT6359P_DA_VBBCK_B_EN_ADDR               MT6359P_LDO_VBBCK_MON
+#define MT6359P_RG_LDO_VBIF28_EN_ADDR            MT6359P_LDO_VBIF28_CON0
+#define MT6359P_DA_VBIF28_B_EN_ADDR              MT6359P_LDO_VBIF28_MON
+#define MT6359P_RG_LDO_VIBR_EN_ADDR              MT6359P_LDO_VIBR_CON0
+#define MT6359P_RG_LDO_VIBR_EN_SHIFT             0
+#define MT6359P_DA_VIBR_B_EN_ADDR                MT6359P_LDO_VIBR_MON
+#define MT6359P_RG_LDO_VIO28_EN_ADDR             MT6359P_LDO_VIO28_CON0
+#define MT6359P_RG_LDO_VIO28_EN_SHIFT            0
+#define MT6359P_DA_VIO28_B_EN_ADDR               MT6359P_LDO_VIO28_MON
+#define MT6359P_RG_LDO_VM18_EN_ADDR              MT6359P_LDO_VM18_CON0
+#define MT6359P_RG_LDO_VM18_EN_SHIFT             0
+#define MT6359P_DA_VM18_B_EN_ADDR                MT6359P_LDO_VM18_MON
+#define MT6359P_RG_LDO_VUFS_EN_ADDR              MT6359P_LDO_VUFS_CON0
+#define MT6359P_RG_LDO_VUFS_EN_SHIFT             0
+#define MT6359P_DA_VUFS_B_EN_ADDR                MT6359P_LDO_VUFS_MON
+#define MT6359P_RG_LDO_VSRAM_PROC1_EN_ADDR       MT6359P_LDO_VSRAM_PROC1_CON0
+#define MT6359P_DA_VSRAM_PROC1_B_EN_ADDR         MT6359P_LDO_VSRAM_PROC1_MON
+#define MT6359P_DA_VSRAM_PROC1_VOSEL_ADDR        MT6359P_LDO_VSRAM_PROC1_VOSEL1
+#define MT6359P_RG_LDO_VSRAM_PROC2_EN_ADDR       MT6359P_LDO_VSRAM_PROC2_CON0
+#define MT6359P_DA_VSRAM_PROC2_B_EN_ADDR         MT6359P_LDO_VSRAM_PROC2_MON
+#define MT6359P_DA_VSRAM_PROC2_VOSEL_ADDR        MT6359P_LDO_VSRAM_PROC2_VOSEL1
+#define MT6359P_RG_LDO_VSRAM_OTHERS_EN_ADDR      MT6359P_LDO_VSRAM_OTHERS_CON0
+#define MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR        MT6359P_LDO_VSRAM_OTHERS_MON
+#define MT6359P_DA_VSRAM_OTHERS_VOSEL_ADDR       MT6359P_LDO_VSRAM_OTHERS_VOSEL1
+#define MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR    MT6359P_LDO_VSRAM_OTHERS_SSHUB
+#define MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR MT6359P_LDO_VSRAM_OTHERS_SSHUB
+#define MT6359P_RG_LDO_VSRAM_MD_EN_ADDR          MT6359P_LDO_VSRAM_MD_CON0
+#define MT6359P_DA_VSRAM_MD_B_EN_ADDR            MT6359P_LDO_VSRAM_MD_MON
+#define MT6359P_DA_VSRAM_MD_VOSEL_ADDR           MT6359P_LDO_VSRAM_MD_VOSEL1
+#define MT6359P_RG_VCN33_1_VOSEL_ADDR            MT6359P_VCN33_1_ANA_CON0
+#define MT6359P_RG_VCN33_2_VOSEL_ADDR            MT6359P_VCN33_2_ANA_CON0
+#define MT6359P_RG_VEMC_VOSEL_ADDR               MT6359P_VEMC_ANA_CON0
+#define MT6359P_RG_VSIM1_VOSEL_ADDR              MT6359P_VSIM1_ANA_CON0
+#define MT6359P_RG_VSIM2_VOSEL_ADDR              MT6359P_VSIM2_ANA_CON0
+#define MT6359P_RG_VIO28_VOSEL_ADDR              MT6359P_VIO28_ANA_CON0
+#define MT6359P_RG_VIBR_VOSEL_ADDR               MT6359P_VIBR_ANA_CON0
+#define MT6359P_RG_VRF18_VOSEL_ADDR              MT6359P_VRF18_ANA_CON0
+#define MT6359P_RG_VEFUSE_VOSEL_ADDR             MT6359P_VEFUSE_ANA_CON0
+#define MT6359P_RG_VCAMIO_VOSEL_ADDR             MT6359P_VCAMIO_ANA_CON0
+#define MT6359P_RG_VIO18_VOSEL_ADDR              MT6359P_VIO18_ANA_CON0
+#define MT6359P_RG_VM18_VOSEL_ADDR               MT6359P_VM18_ANA_CON0
+#define MT6359P_RG_VUFS_VOSEL_ADDR               MT6359P_VUFS_ANA_CON0
+#define MT6359P_RG_VRF12_VOSEL_ADDR              MT6359P_VRF12_ANA_CON0
+#define MT6359P_RG_VCN13_VOSEL_ADDR              MT6359P_VCN13_ANA_CON0
+#define MT6359P_RG_VA09_VOSEL_ADDR               MT6359P_VRF18_ELR_3
+#define MT6359P_RG_VA12_VOSEL_ADDR               MT6359P_VFE28_ELR_4
+#define MT6359P_RG_VXO22_VOSEL_ADDR              MT6359P_VXO22_ANA_CON0
+#define MT6359P_RG_VRFCK_VOSEL_ADDR              MT6359P_VRFCK_ANA_CON0
+#define MT6359P_RG_VBBCK_VOSEL_ADDR              MT6359P_VBBCK_ANA_CON0
+#define MT6359P_RG_VBBCK_VOSEL_MASK              0xF
+#define MT6359P_RG_VBBCK_VOSEL_SHIFT             4
+#define MT6359P_VM_MODE_ADDR                     MT6359P_TOP_TRAP
+#define MT6359P_TMA_KEY_ADDR                     MT6359P_TOP_TMA_KEY
+
+#define TMA_KEY 0x9CA6
+
+#endif /* __MFD_MT6359P_REGISTERS_H__ */
diff --git a/include/linux/regulator/mt6359-regulator.h b/include/linux/regulator/mt6359-regulator.h
index 14c4b715613e..6d6e5a58f482 100644
--- a/include/linux/regulator/mt6359-regulator.h
+++ b/include/linux/regulator/mt6359-regulator.h
@@ -17,6 +17,7 @@ enum {
 	MT6359_ID_VPROC2,
 	MT6359_ID_VPROC1,
 	MT6359_ID_VCORE_SSHUB,
+	MT6359_ID_VGPU11_SSHUB = MT6359_ID_VCORE_SSHUB,
 	MT6359_ID_VAUD18 = 10,
 	MT6359_ID_VSIM1,
 	MT6359_ID_VIBR,
-- 
2.18.0

