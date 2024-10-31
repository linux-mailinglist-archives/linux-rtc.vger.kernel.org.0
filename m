Return-Path: <linux-rtc+bounces-2397-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DE9B7C3C
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 14:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B69F1F21BEB
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 13:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2707A19F13B;
	Thu, 31 Oct 2024 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EAAvhO0q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9219AD7E;
	Thu, 31 Oct 2024 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383124; cv=none; b=m6V3K0+ORPk5VFYPXqm50M0+7QgNQtfgExpmmGi+vk4WeBt/HE6/xCtHJCkWYTi2w/T/9NDlvnUKK/0kn8SaiHU5kQaQN4u+5qvhWbvbqGncaCfNNNB1Nbh3J/1yEAImnn4d4Rc4j8Dk3rtJnXfdo24kyJBFNyGD9el3fmRvtCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383124; c=relaxed/simple;
	bh=K4Jix34ZmAkMsQ3H30+rxm2u7BUMg/iQ+sbU4+KW7yk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pl6mCwxObwH7NPobAqsQ/mHkANSDn0vQpb8b0crVU/RRhC4CxYPB1Lgxc+t9ssDV02zJPI6BF6b7mebVQyJ9pnnLJsoTowH8KvZZKS7mM8EOY9z2aoMPSbAa2bUlfc8xDDMQGcgVwLZoUy7BCu8wIDDddQSmxUhqPJgfOR4ZBtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EAAvhO0q; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3478bbd8979011efbd192953cf12861f-20241031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oDQya0p0/PvSGHRPKIR+F0KX+MfKJc7Bp0JQisHRPAE=;
	b=EAAvhO0qvp0euSAlM9jyNI9GTYsH+u1i7WejGcNYUx00HZSFKcW7bdLFOLwXa5ue3f50P6mwemyxTinyE2p9WEz6Nb/lPNt1bK86zXn5rR/bx0KNqmptEJyfbhk8D4Wcm2MXABDnxLHy4eEhiQ4xzE7b6gF+G9O4JFa2JmMX3H0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:67742984-a064-475f-a3fa-3e857662ef96,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:4a9c7a48-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3478bbd8979011efbd192953cf12861f-20241031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 952779602; Thu, 31 Oct 2024 21:58:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Oct 2024 21:58:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Oct 2024 21:58:25 +0800
From: shunxi zhang <ot_shunxi.zhang@mediatek.com>
To: <alexandre.belloni@bootlin.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <lee@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
Subject: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
Date: Thu, 31 Oct 2024 21:58:02 +0800
Message-ID: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.971300-8.000000
X-TMASE-MatchedRID: /gl2UBmeGc7NwJnbTIxiVe7KTDtx8CggTJDl9FKHbrk5bxeAKHFV2NKv
	7sssuub97Zg5HdWrYcr+KLYvU/cv5aaIrmHRD4cCh2VzUlo4HVN/aDoolm3GXWecrqZc3vabLFV
	Od3/b6GS4BSQmyBhG5PvcIecvKSrVLZbtj42l31GEJ5wBUYI5/Rv1UCk/2TUELnT+o+Pj9tmTPz
	RqQw/GiNewOuQJ5Mu5QijPFC+6OAtIDMTpAaDD9C3CwJVRp8z6+eBf9ovw8I0S+jFO7d+PW7MZg
	Qr/ZhpoqWEg2uSZSihwVqHDwJvwslZR1Zk1z/NZjVpzOivqHqF5DRmZ9HCEaC8zQZ2rR/Op8bf3
	35SL+11LbMLc3nVqMovs32duLMZix6H+eZMdt323UCG/IQp2Pv+UEb65dgmQ47E6rstCUYvyz+X
	fQMiJHvUOv/VfHIug3RMx1Ibgq1D4OiVTWoD8RKam63kopwnTMwMfB2KMdIck75FjcZj9SR94+o
	YqU0pc4OgSn2OFDmsrAX9gVCPuK2sV28ESZOe8liwpJdZauwdfohHCqSnabl9eTSR8I6duMr8TL
	wX+3Iz+7eYCAL98x634jeGrXh6pYWmIaSiXIWiLm2Ke1GK7PUDwlkRNC6PCBlt4RZwvTdV4cehR
	tzW6ptFHB+8c84woU8F5dTJtnjvOkUilvGnufTTR2TFg0xG32+EpBnZEzfW6CoqUCyiJ4sppNa9
	SPqmieHKljH/dilm5L43Hj1KuStTO9w9KisCUbBu6+EIezdzKi5Jqc8KFNKjilT0lyeob+q8dY5
	zmcPrIM9YH42424P/T1YH2fyPyQCcVNodhPICeAiCmPx4NwGmRqNBHmBveg6X7YSXnSlqZv9WvR
	V/RbgtuKBGekqUpOlxBO2IcOBaUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.971300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C2B6AC3BC4EFBF100D0E4B8039DF4097F69F5EDB16AFEB98F56840ADB4A980822000:8

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 drivers/rtc/Kconfig                  |   10 +
 drivers/rtc/Makefile                 |    1 +
 drivers/rtc/rtc-mt6685.c             | 1456 ++++++++++++++++++++++++++
 include/linux/mfd/mt6685-audclk.h    |   11 +
 include/linux/mfd/mt6685/core.h      |   22 +
 include/linux/mfd/mt6685/registers.h |  921 ++++++++++++++++
 include/linux/mfd/mt6685/rtc.h       |  318 ++++++
 7 files changed, 2739 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt6685.c
 create mode 100644 include/linux/mfd/mt6685-audclk.h
 create mode 100644 include/linux/mfd/mt6685/core.h
 create mode 100644 include/linux/mfd/mt6685/registers.h
 create mode 100644 include/linux/mfd/mt6685/rtc.h

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 66eb1122248b..7af04dfac978 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1898,6 +1898,16 @@ config RTC_DRV_MT6397
 
 	  If you want to use MediaTek(R) RTC interface, select Y or M here.
 
+config RTC_DRV_MT6685
+	tristate "Mediatek Real Time Clock driver"
+	depends on MFD_MT6685 || (COMPILE_TEST && IRQ_DOMAIN)
+	help
+	  This selects the Mediatek(R) RTC driver. RTC is part of Mediatek
+	  MT6685. You should enable MT6685 MFD before select
+	  Mediatek(R) RTC driver.
+
+	  If you want to use Mediatek(R) RTC interface, select Y or M here.
+
 config RTC_DRV_MT7622
 	tristate "MediaTek SoC based RTC"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index f62340ecc534..ec982192526d 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_RTC_DRV_SSD202D)	+= rtc-ssd202d.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
 obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
+obj-$(CONFIG_RTC_DRV_MT6685)	+= rtc-mt6685.o
 obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
 obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
diff --git a/drivers/rtc/rtc-mt6685.c b/drivers/rtc/rtc-mt6685.c
new file mode 100644
index 000000000000..a3aa747a788a
--- /dev/null
+++ b/drivers/rtc/rtc-mt6685.c
@@ -0,0 +1,1456 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Author: Amber Lin <Mw.lin@mediatek.com>
+ */
+
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/mfd/mt6685/rtc.h>
+#include <linux/mfd/mt6685/core.h>
+#include <linux/mfd/mt6685/registers.h>
+#include <linux/nvmem-provider.h>
+#include <linux/sched/clock.h>
+#include <linux/spmi.h>
+
+#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)
+#include <mt-plat/aee.h>
+#endif
+
+#ifdef SUPPORT_PWR_OFF_ALARM
+#include <linux/notifier.h>
+#include <linux/suspend.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <linux/jiffies.h>
+#include <linux/cpumask.h>
+#include <linux/reboot.h>
+#endif
+
+/*debug information*/
+static int rtc_show_time;
+static int rtc_show_alarm;
+
+module_param(rtc_show_time, int, 0644);
+module_param(rtc_show_alarm, int, 0644);
+
+static int mtk_rtc_write_trigger(struct mt6685_rtc *rtc);
+
+static int counter;
+
+static void power_on_mclk(struct mt6685_rtc *rtc)
+{
+	mutex_lock(&rtc->clk_lock);
+	/*Power on RTC MCLK and 32k clk before write RTC register*/
+	regmap_write(rtc->regmap, RG_RTC_32K_CK_PDN_CLR, RG_RTC_32K_CK_PDN_MASK);
+	regmap_write(rtc->regmap, RG_RTC_MCLK_PDN_CLR, RG_RTC_MCLK_PDN_MASK);
+	counter++;
+	mdelay(1);
+	mutex_unlock(&rtc->clk_lock);
+}
+
+static void power_down_mclk(struct mt6685_rtc *rtc)
+{
+	mutex_lock(&rtc->clk_lock);
+	counter--;
+	if (counter < 0) {
+		//dump_stack();
+		pr_info("mclk_counter[%d]\n", counter);
+	}
+	if (counter == 0) {
+		/*Power down RTC MCLK and 32k clk after write RTC register*/
+		regmap_write(rtc->regmap, RG_RTC_32K_CK_PDN_SET, RG_RTC_32K_CK_PDN_MASK);
+		regmap_write(rtc->regmap, RG_RTC_MCLK_PDN_SET, RG_RTC_MCLK_PDN_MASK);
+		mdelay(1);
+	}
+	mutex_unlock(&rtc->clk_lock);
+}
+
+static int rtc_bulk_read(struct mt6685_rtc *rtc, unsigned int reg,
+			 void *val, size_t val_count)
+{
+	int ret;
+
+	if (rtc->data->single_read_write_is_supported) {
+		ret = regmap_bulk_read(rtc->regmap, reg, val, val_count);
+	} else {
+		int i;
+
+		for (i = 0; i < val_count; i += 2)
+			ret = regmap_bulk_read(rtc->regmap, reg + i, val + i, 2);
+	}
+
+	return ret;
+}
+
+static int rtc_read(struct mt6685_rtc *rtc, unsigned int reg,
+		    unsigned int *val)
+{
+	rtc_bulk_read(rtc, reg, val, 2);
+	return 0;
+}
+
+static int rtc_bulk_write(struct mt6685_rtc *rtc, unsigned int reg,
+			  const void *val, size_t val_count)
+{
+	int ret;
+
+	if (rtc->data->single_read_write_is_supported) {
+		ret = regmap_bulk_write(rtc->regmap, reg, val, val_count);
+	} else {
+		int i;
+
+		for (i = 0; i < val_count; i += 2)
+			ret = regmap_bulk_write(rtc->regmap, reg + i, val + i, 2);
+	}
+
+	return ret;
+}
+
+static int rtc_write(struct mt6685_rtc *rtc, unsigned int reg,
+		     unsigned int val)
+{
+	rtc_bulk_write(rtc, reg, &val, 2);
+	return 0;
+}
+
+static int rtc_update_bits(struct mt6685_rtc *rtc, unsigned int reg,
+			   unsigned int mask, unsigned int val)
+{
+	int ret;
+	unsigned int tmp, orig = 0;
+
+	ret = rtc_read(rtc, reg, &orig);
+	if (ret != 0)
+		return ret;
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+	ret = rtc_write(rtc, reg, tmp);
+	return ret;
+}
+
+static const struct reg_field mt6685_spare_reg_fields[SPARE_RG_MAX] = {
+	[SPARE_FG2] = REG_FIELD(RTC_RG_FG2, 0, 7),
+	[SPARE_FG3] = REG_FIELD(RTC_RG_FG3, 0, 7),
+	[SPARE_SPAR0]  = REG_FIELD(RTC_SPAR0, 0, 7),
+#ifdef SUPPORT_PWR_OFF_ALARM
+	[SPARE_KPOC]   = REG_FIELD(RTC_PDN1_H, 6, 6),
+#endif
+};
+
+static int rtc_field_read(struct mt6685_rtc *rtc,
+			  const struct reg_field *field, unsigned int *val)
+{
+	int ret;
+	unsigned int orig, mask;
+
+	ret = rtc_read(rtc, rtc->addr_base + field->reg, &orig);
+	if (ret != 0)
+		return ret;
+
+	mask = GENMASK(field->msb, field->lsb);
+	orig &= mask;
+	orig >>= field->lsb;
+	*val = orig;
+
+	dev_notice(rtc->rtc_dev->dev.parent, "%s: rg:0x%x, val:0x%x\n",
+		   __func__, field->reg, *val);
+
+	return 0;
+}
+
+static int rtc_unlock_fg_rg(struct mt6685_rtc *rtc, const struct reg_field *field)
+{
+	int ret = 0;
+
+	if (field->reg == RTC_RG_FG2) {
+		ret = rtc_write(rtc, rtc->addr_base + RTC_RG_FG2, 0xaf);
+		ret |= rtc_write(rtc, rtc->addr_base + RTC_RG_FG2, 0xaf);
+		ret |= rtc_write(rtc, rtc->addr_base + RTC_RG_FG2, 0x5e);
+	} else if (field->reg == RTC_RG_FG3) {
+		ret = rtc_write(rtc, rtc->addr_base + RTC_RG_FG3, 0x66);
+		ret |= rtc_write(rtc, rtc->addr_base + RTC_RG_FG3, 0x66);
+		ret |= rtc_write(rtc, rtc->addr_base + RTC_RG_FG3, 0xf1);
+	}
+
+	if (ret != 0) {
+		dev_notice(rtc->rtc_dev->dev.parent, "%s failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rtc_field_write(struct mt6685_rtc *rtc,
+			   const struct reg_field *field, unsigned int val)
+{
+	int ret;
+	unsigned int tmp, orig = 0, latest;
+	unsigned int mask;
+
+	ret = rtc_read(rtc, rtc->addr_base + field->reg, &orig);
+	if (ret != 0)
+		return ret;
+
+	if (rtc->data->chip_version == MT6685_SERIES) {
+		ret = rtc_unlock_fg_rg(rtc, field);
+		if (ret != 0)
+			return ret;
+	}
+
+	mask = GENMASK(field->msb, field->lsb);
+	tmp = orig & ~mask;
+	tmp |= (val << field->lsb) & mask;
+
+	ret = rtc_write(rtc, rtc->addr_base + field->reg, tmp);
+	if (ret != 0)
+		return ret;
+
+	mtk_rtc_write_trigger(rtc);
+
+	rtc_read(rtc, rtc->addr_base + field->reg, &latest);
+	latest &= mask;
+	latest >>= field->lsb;
+
+	if (latest != val)
+		pr_info("%s: reg:0x%x, val:0x%x, latest:0x%x",
+			__func__, field->reg, val, latest);
+
+	return 0;
+}
+
+static u16 rtc_pwron_reg[RTC_OFFSET_COUNT][3] = {
+	{RTC_PWRON_SEC, RTC_PWRON_SEC_MASK, RTC_PWRON_SEC_SHIFT},
+	{RTC_PWRON_MIN, RTC_PWRON_MIN_MASK, RTC_PWRON_MIN_SHIFT},
+	{RTC_PWRON_HOU, RTC_PWRON_HOU_MASK, RTC_PWRON_HOU_SHIFT},
+	{RTC_PWRON_DOM, RTC_PWRON_DOM_MASK, RTC_PWRON_DOM_SHIFT},
+	{0, 0, 0},
+	{RTC_PWRON_MTH, RTC_PWRON_MTH_MASK, RTC_PWRON_MTH_SHIFT},
+	{RTC_PWRON_YEA, RTC_PWRON_YEA_MASK, RTC_PWRON_YEA_SHIFT},
+};
+
+static const struct reg_field mt6685_cali_reg_fields[CALI_FILED_MAX] = {
+	[EOSC_CALI_TD]		= REG_FIELD(EOSC_CALI_TD_MT6685, 0, 2),
+};
+
+static int rtc_eosc_cali_td;
+module_param(rtc_eosc_cali_td, int, 0644);
+
+static void mtk_rtc_enable_k_eosc(struct device *dev)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	u32 td;
+
+	power_on_mclk(rtc);
+
+	if (!rtc->cali_is_supported) {
+		power_down_mclk(rtc);
+		return;
+	}
+
+	if (rtc_eosc_cali_td) {
+		dev_notice(dev, "%s: rtc_eosc_cali_td = %d\n",
+			   __func__, rtc_eosc_cali_td);
+		switch (rtc_eosc_cali_td) {
+		case 1:
+			td = EOSC_CALI_TD_01_SEC;
+			break;
+		case 2:
+			td = EOSC_CALI_TD_02_SEC;
+			break;
+		case 4:
+			td = EOSC_CALI_TD_04_SEC;
+			break;
+		case 16:
+			td = EOSC_CALI_TD_16_SEC;
+			break;
+		default:
+			td = EOSC_CALI_TD_08_SEC;
+			break;
+		}
+
+		rtc_field_write(rtc, &rtc->data->cali_reg_fields[EOSC_CALI_TD], td);
+	}
+	power_down_mclk(rtc);
+}
+
+#ifdef SUPPORT_PWR_OFF_ALARM
+
+static u32 bootmode = NORMAL_BOOT;
+static struct wakeup_source *mt6685_rtc_suspend_lock;
+#if IS_ENABLED(CONFIG_PM)
+static bool rtc_pm_notifier_registered;
+static unsigned long rtc_pm_status;
+#endif
+static bool kpoc_alarm;
+
+#if IS_ENABLED(CONFIG_PM)
+
+#define PM_DUMMY 0xFFFF
+
+static int rtc_pm_event(struct notifier_block *notifier, unsigned long pm_event,
+			void *unused)
+{
+	struct mt6685_rtc *rtc = container_of(notifier,
+		struct mt6685_rtc, pm_nb);
+
+	switch (pm_event) {
+	case PM_SUSPEND_PREPARE:
+		rtc_pm_status = PM_SUSPEND_PREPARE;
+		return NOTIFY_DONE;
+	case PM_POST_SUSPEND:
+		rtc_pm_status = PM_POST_SUSPEND;
+		break;
+	default:
+		rtc_pm_status = PM_DUMMY;
+		break;
+	}
+
+	if (kpoc_alarm) {
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "%s trigger reboot\n", __func__);
+		complete(&rtc->comp);
+		kpoc_alarm = false;
+	}
+	return NOTIFY_DONE;
+}
+#endif /* CONFIG_PM */
+
+static void rtc_mark_kpoc(struct mt6685_rtc *rtc)
+{
+	power_on_mclk(rtc);
+	mutex_lock(&rtc->lock);
+	rtc_field_write(rtc, &rtc->data->spare_reg_fields[SPARE_KPOC], 1);
+	mutex_unlock(&rtc->lock);
+	power_down_mclk(rtc);
+}
+
+static void mtk_rtc_work_queue(struct work_struct *work)
+{
+	struct mt6685_rtc *rtc = container_of(work, struct mt6685_rtc, work);
+	unsigned long ret;
+	unsigned int msecs;
+
+	ret = wait_for_completion_timeout(&rtc->comp, msecs_to_jiffies(30000));
+	if (!ret) {
+		dev_notice(rtc->rtc_dev->dev.parent, "%s timeout\n", __func__);
+		WARN_ON(1);
+	} else {
+		msecs = jiffies_to_msecs(ret);
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "%s timeleft= %d\n", __func__, msecs);
+		rtc_mark_kpoc(rtc);
+		kernel_restart("kpoc");
+	}
+}
+
+static void mtk_rtc_reboot(struct mt6685_rtc *rtc)
+{
+	__pm_stay_awake(mt6685_rtc_suspend_lock);
+
+	init_completion(&rtc->comp);
+	schedule_work_on(cpumask_first(cpu_online_mask), &rtc->work);
+
+#if IS_ENABLED(CONFIG_PM)
+	if (!rtc_pm_notifier_registered)
+		goto reboot;
+
+	if (rtc_pm_status != PM_SUSPEND_PREPARE)
+		goto reboot;
+#endif
+
+	kpoc_alarm = true;
+
+	dev_notice(rtc->rtc_dev->dev.parent, "%s:wait\n", __func__);
+	return;
+
+#if IS_ENABLED(CONFIG_PM)
+reboot:
+	dev_notice(rtc->rtc_dev->dev.parent, "%s:trigger\n", __func__);
+	complete(&rtc->comp);
+#endif
+}
+
+static void mtk_rtc_update_pwron_alarm_flag(struct mt6685_rtc *rtc)
+{
+	int ret;
+
+	power_on_mclk(rtc);
+
+	ret = rtc_update_bits(rtc,
+			      rtc->addr_base + RTC_PDN1,
+			      RTC_PDN1_PWRON_TIME, 0);
+	if (ret < 0)
+		goto exit;
+
+	ret =  rtc_update_bits(rtc,
+			       rtc->addr_base + RTC_PDN2,
+			       RTC_PDN2_PWRON_ALARM, RTC_PDN2_PWRON_ALARM);
+	if (ret < 0)
+		goto exit;
+
+	mtk_rtc_write_trigger(rtc);
+	power_down_mclk(rtc);
+	dev_notice(rtc->rtc_dev->dev.parent, "%s info\n", __func__);
+	return;
+
+exit:
+	power_down_mclk(rtc);
+	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+}
+
+static int mtk_rtc_restore_alarm(struct mt6685_rtc *rtc, struct rtc_time *tm)
+{
+	int ret;
+	u16 data[RTC_OFFSET_COUNT] = { 0 };
+
+	power_on_mclk(rtc);
+
+	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
+			    data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto exit;
+
+	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
+				(tm->tm_sec & RTC_AL_SEC_MASK));
+	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
+				(tm->tm_min & RTC_AL_MIN_MASK));
+	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
+				(tm->tm_hour & RTC_AL_HOU_MASK));
+	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
+				(tm->tm_mday & RTC_AL_DOM_MASK));
+	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
+				(tm->tm_mon & RTC_AL_MTH_MASK));
+	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
+				(tm->tm_year & RTC_AL_YEA_MASK));
+
+	dev_notice(rtc->rtc_dev->dev.parent,
+		   "restore al time = %04d/%02d/%02d %02d:%02d:%02d\n",
+		   tm->tm_year + RTC_MIN_YEAR, tm->tm_mon, tm->tm_mday,
+		   tm->tm_hour, tm->tm_min, tm->tm_sec);
+
+	ret = rtc_bulk_write(rtc, rtc->addr_base + RTC_AL_SEC,
+			     data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto exit;
+
+	ret = rtc_write(rtc, rtc->addr_base + RTC_AL_MASK,
+			RTC_AL_MASK_DOW);
+	if (ret < 0)
+		goto exit;
+
+	ret =  rtc_update_bits(rtc,
+			       rtc->addr_base + RTC_IRQ_EN,
+			       RTC_IRQ_EN_AL, RTC_IRQ_EN_AL);
+	if (ret < 0)
+		goto exit;
+
+	mtk_rtc_write_trigger(rtc);
+	power_down_mclk(rtc);
+	return ret;
+
+exit:
+	power_down_mclk(rtc);
+	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+	return ret;
+}
+
+static bool mtk_rtc_is_pwron_alarm(struct mt6685_rtc *rtc,
+				   struct rtc_time *nowtm, struct rtc_time *tm)
+{
+	u32 pdn1 = 0, spar1 = 0, pdn2 = 0, spar0 = 0;
+	int ret, sec = 0;
+	u16 data[RTC_OFFSET_COUNT] = { 0 };
+
+	ret = rtc_read(rtc, rtc->addr_base + RTC_PDN1, &pdn1);
+	if (ret < 0)
+		goto exit;
+
+	dev_notice(rtc->rtc_dev->dev.parent, "pdn1 = 0x%x\n", pdn1);
+
+	if (pdn1 & RTC_PDN1_PWRON_TIME) {/* power-on time is available */
+
+		/*get current rtc time*/
+		do {
+			ret = rtc_bulk_read(rtc,
+					    rtc->addr_base + RTC_TC_SEC,
+					    data, RTC_OFFSET_COUNT * 2);
+			if (ret < 0)
+				goto exit;
+			nowtm->tm_sec = data[RTC_OFFSET_SEC] & RTC_TC_SEC_MASK;
+			nowtm->tm_min = data[RTC_OFFSET_MIN] & RTC_TC_MIN_MASK;
+			nowtm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_TC_HOU_MASK;
+			nowtm->tm_mday = data[RTC_OFFSET_DOM] & RTC_TC_DOM_MASK;
+			nowtm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
+			nowtm->tm_year = data[RTC_OFFSET_YEAR] & RTC_TC_YEA_MASK;
+
+			ret = rtc_read(rtc,
+				       rtc->addr_base + RTC_TC_SEC, &sec);
+			if (ret < 0)
+				goto exit;
+			sec &= RTC_TC_SEC_MASK;
+
+		} while (sec < nowtm->tm_sec);
+
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "get now time = %04d/%02d/%02d %02d:%02d:%02d\n",
+			   nowtm->tm_year + RTC_MIN_YEAR, nowtm->tm_mon,
+			   nowtm->tm_mday, nowtm->tm_hour,
+			   nowtm->tm_min, nowtm->tm_sec);
+
+		/*get power on time from SPARE */
+		ret = rtc_read(rtc,
+			       rtc->addr_base + RTC_SPAR0, &spar0);
+		if (ret < 0)
+			goto exit;
+
+		ret = rtc_read(rtc,
+			       rtc->addr_base + RTC_SPAR1, &spar1);
+		if (ret < 0)
+			goto exit;
+
+		ret = rtc_read(rtc,
+			       rtc->addr_base + RTC_PDN2, &pdn2);
+		if (ret < 0)
+			goto exit;
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "spar0=0x%x, spar1=0x%x, pdn2=0x%x\n",
+			   spar0, spar1, pdn2);
+
+		tm->tm_sec =
+			(spar0 & RTC_PWRON_SEC_MASK) >> RTC_PWRON_SEC_SHIFT;
+		tm->tm_min =
+			(spar1 & RTC_PWRON_MIN_MASK) >> RTC_PWRON_MIN_SHIFT;
+		tm->tm_hour =
+			(spar1 & RTC_PWRON_HOU_MASK) >> RTC_PWRON_HOU_SHIFT;
+		tm->tm_mday =
+			(spar1 & RTC_PWRON_DOM_MASK) >> RTC_PWRON_DOM_SHIFT;
+		tm->tm_mon =
+			(pdn2 & RTC_PWRON_MTH_MASK) >> RTC_PWRON_MTH_SHIFT;
+		tm->tm_year =
+			(pdn2 & RTC_PWRON_YEA_MASK) >> RTC_PWRON_YEA_SHIFT;
+
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "get pwron time = %04d/%02d/%02d %02d:%02d:%02d\n",
+			   tm->tm_year + RTC_MIN_YEAR, tm->tm_mon, tm->tm_mday,
+			   tm->tm_hour, tm->tm_min, tm->tm_sec);
+
+		return true;
+	}
+	return false;
+exit:
+	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+	return false;
+}
+#endif
+
+static int mtk_rtc_write_trigger(struct mt6685_rtc *rtc)
+{
+	unsigned long timeout = jiffies + HZ;
+	int ret;
+	u32 data = 0;
+
+	ret = rtc_write(rtc,
+			rtc->addr_base + rtc->data->wrtgr, 1);
+	if (ret < 0)
+		return ret;
+
+	while (1) {
+		ret = rtc_read(rtc, rtc->addr_base + RTC_BBPU,
+			       &data);
+		if (ret < 0)
+			break;
+		if (!(data & RTC_BBPU_CBUSY))
+			break;
+		if (time_after(jiffies, timeout)) {
+			ret = -ETIMEDOUT;
+			break;
+		}
+		cpu_relax();
+	}
+	return ret;
+}
+
+static void mtk_rtc_reset_bbpu_alarm_status(struct mt6685_rtc *rtc)
+{
+	u32 bbpu;
+	int ret;
+
+	power_on_mclk(rtc);
+
+	bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
+	ret = rtc_write(rtc, rtc->addr_base + RTC_BBPU, bbpu);
+	if (ret < 0)
+		goto exit;
+
+	mtk_rtc_write_trigger(rtc);
+	power_down_mclk(rtc);
+	return;
+exit:
+	power_down_mclk(rtc);
+	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+}
+
+static int mtk_rtc_is_alarm_irq(struct mt6685_rtc *rtc)
+{
+	u32 irqsta = 0, bbpu = 0, sck = 0, sck_check = 0, irqsta_check = 0;
+	int ret;
+
+	power_on_mclk(rtc);
+
+	ret = rtc_read(rtc, rtc->addr_base + RTC_IRQ_STA, &irqsta);/* read clear */
+
+	/*clear SCK_TOP rtc interrupt*/
+	rtc_read(rtc, SCK_TOP_INT_STATUS0, &sck);
+	rtc_write(rtc, SCK_TOP_INT_STATUS0, sck);
+
+	rtc_read(rtc, SCK_TOP_INT_STATUS0, &sck_check);
+	if (sck_check) {
+		udelay(70);
+		rtc_write(rtc, SCK_TOP_INT_STATUS0, 1);
+
+		rtc_read(rtc, SCK_TOP_INT_STATUS0, &sck_check);
+		if (sck_check) {
+			dev_notice(rtc->rtc_dev->dev.parent,
+				   "%s: TOP INT STA 0x%x\n", __func__, sck_check);
+
+			rtc_read(rtc, rtc->addr_base + RTC_IRQ_STA, &irqsta_check);
+			dev_notice(rtc->rtc_dev->dev.parent,
+				   "%s: IRQ STA 0x%x\n", __func__, irqsta_check);
+		}
+	}
+
+	if (ret == 0 && (irqsta & RTC_IRQ_STA_AL)) {
+		bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN;
+		ret = rtc_write(rtc,
+				rtc->addr_base + RTC_BBPU, bbpu);
+		if (ret < 0)
+			dev_err(rtc->rtc_dev->dev.parent,
+				"%s: %d error\n", __func__, __LINE__);
+
+		ret =  rtc_update_bits(rtc,
+				       rtc->addr_base + RTC_IRQ_EN,
+				       RTC_IRQ_EN_AL, 0);
+		if (ret < 0)
+			dev_err(rtc->rtc_dev->dev.parent,
+				"%s: %d error\n", __func__, __LINE__);
+		mtk_rtc_write_trigger(rtc);
+		power_down_mclk(rtc);
+		return RTC_ALSTA;
+	}
+	power_down_mclk(rtc);
+	return RTC_NONE;
+}
+
+static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
+{
+	struct mt6685_rtc *rtc = data;
+	bool pwron_alm = false;
+	int status = RTC_NONE;
+#ifdef SUPPORT_PWR_OFF_ALARM
+	bool pwron_alarm = false;
+	struct rtc_time nowtm, tm;
+#endif
+
+	mutex_lock(&rtc->lock);
+
+	status = mtk_rtc_is_alarm_irq(rtc);
+
+	if (!rtc->rtc_dev) {
+		mutex_unlock(&rtc->lock);
+		return IRQ_NONE;
+	}
+
+	dev_notice(rtc->rtc_dev->dev.parent, "%s:%d\n", __func__, status);
+
+	if (status == RTC_NONE) {
+		mutex_unlock(&rtc->lock);
+		return IRQ_NONE;
+	}
+
+	mtk_rtc_reset_bbpu_alarm_status(rtc);
+
+#ifdef SUPPORT_PWR_OFF_ALARM
+	pwron_alarm = mtk_rtc_is_pwron_alarm(rtc, &nowtm, &tm);
+	nowtm.tm_year += RTC_MIN_YEAR;
+	tm.tm_year += RTC_MIN_YEAR;
+	if (pwron_alarm) {
+		time64_t now_time, time;
+
+		now_time =
+		    mktime64(nowtm.tm_year, nowtm.tm_mon, nowtm.tm_mday,
+			     nowtm.tm_hour, nowtm.tm_min, nowtm.tm_sec);
+
+		if (now_time == -1) {
+			mutex_unlock(&rtc->lock);
+			goto out;
+		}
+
+		time =
+		    mktime64(tm.tm_year, tm.tm_mon, tm.tm_mday, tm.tm_hour,
+			     tm.tm_min, tm.tm_sec);
+
+		if (time == -1) {
+			mutex_unlock(&rtc->lock);
+			goto out;
+		}
+
+		/* power on */
+		if (now_time >= time - 1 && now_time <= time + 4) {
+			if (bootmode == KERNEL_POWER_OFF_CHARGING_BOOT ||
+			    bootmode == LOW_POWER_OFF_CHARGING_BOOT) {
+				mtk_rtc_reboot(rtc);
+				mutex_unlock(&rtc->lock);
+				disable_irq_nosync(rtc->irq);
+				goto out;
+			} else {
+				mtk_rtc_update_pwron_alarm_flag(rtc);
+				pwron_alm = true;
+			}
+		} else if (now_time < time) {	/* set power-on alarm */
+			time -= 1;
+			rtc_time64_to_tm(time, &tm);
+			tm.tm_year -= RTC_MIN_YEAR_OFFSET;
+			tm.tm_mon += 1;
+			mtk_rtc_restore_alarm(rtc, &tm);
+		}
+	}
+#endif
+	mutex_unlock(&rtc->lock);
+
+out:
+	if (rtc->rtc_dev)
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	if (rtc_show_alarm)
+		dev_notice(rtc->rtc_dev->dev.parent, "%s time is up\n",
+			   pwron_alm ? "power-on" : "alarm");
+
+	return IRQ_HANDLED;
+}
+
+static int __mtk_rtc_read_time(struct mt6685_rtc *rtc,
+			       struct rtc_time *tm, int *sec)
+{
+	int ret;
+	unsigned int reload = 0;
+	u16 data[RTC_OFFSET_COUNT] = { 0 };
+
+	power_on_mclk(rtc);
+
+	rtc_read(rtc, rtc->addr_base + RTC_BBPU, &reload);
+	reload = reload | RTC_BBPU_KEY | RTC_BBPU_RELOAD;
+	rtc_write(rtc, rtc->addr_base + RTC_BBPU, reload);
+	mtk_rtc_write_trigger(rtc);
+	power_down_mclk(rtc);
+
+	mutex_lock(&rtc->lock);
+	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_TC_SEC,
+			    data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto exit;
+
+	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_TC_SEC_MASK;
+	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_TC_MIN_MASK;
+	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_TC_HOU_MASK;
+	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_TC_DOM_MASK;
+	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
+	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_TC_YEA_MASK;
+
+	ret = rtc_read(rtc, rtc->addr_base + RTC_TC_SEC, sec);
+	*sec &= RTC_TC_SEC_MASK;
+exit:
+	mutex_unlock(&rtc->lock);
+	return ret;
+}
+
+static void mtk_rtc_set_pwron_time(struct mt6685_rtc *rtc, struct rtc_time *tm)
+{
+	u32 data[RTC_OFFSET_COUNT];
+	int ret, i;
+
+	data[RTC_OFFSET_SEC] =
+		((tm->tm_sec << RTC_PWRON_SEC_SHIFT) & RTC_PWRON_SEC_MASK);
+	data[RTC_OFFSET_MIN] =
+		((tm->tm_min << RTC_PWRON_MIN_SHIFT) & RTC_PWRON_MIN_MASK);
+	data[RTC_OFFSET_HOUR] =
+		((tm->tm_hour << RTC_PWRON_HOU_SHIFT) & RTC_PWRON_HOU_MASK);
+	data[RTC_OFFSET_DOM] =
+		((tm->tm_mday << RTC_PWRON_DOM_SHIFT) & RTC_PWRON_DOM_MASK);
+	data[RTC_OFFSET_MTH] =
+		((tm->tm_mon << RTC_PWRON_MTH_SHIFT) & RTC_PWRON_MTH_MASK);
+	data[RTC_OFFSET_YEAR] =
+		((tm->tm_year << RTC_PWRON_YEA_SHIFT) & RTC_PWRON_YEA_MASK);
+
+	for (i = RTC_OFFSET_SEC; i < RTC_OFFSET_COUNT; i++) {
+		if (i == RTC_OFFSET_DOW)
+			continue;
+		ret =  rtc_update_bits(rtc,
+				       rtc->addr_base + rtc_pwron_reg[i][RTC_REG],
+				       rtc_pwron_reg[i][RTC_MASK], data[i]);
+		if (ret < 0)
+			goto exit;
+		mtk_rtc_write_trigger(rtc);
+	}
+	return;
+exit:
+	dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+}
+
+static void mtk_rtc_save_pwron_time(struct mt6685_rtc *rtc,
+				    bool enable, struct rtc_time *tm)
+{
+	u32 pdn1 = 0;
+	int ret;
+
+	/* set power on time */
+	mtk_rtc_set_pwron_time(rtc, tm);
+
+	/* update power on alarm related flags */
+	if (enable)
+		pdn1 = RTC_PDN1_PWRON_TIME;
+	ret =  rtc_update_bits(rtc,
+			       rtc->addr_base + RTC_PDN1,
+			       RTC_PDN1_PWRON_TIME, pdn1);
+	if (ret < 0)
+		dev_err(rtc->rtc_dev->dev.parent, "%s error\n", __func__);
+
+	mtk_rtc_write_trigger(rtc);
+}
+
+static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	time64_t time;
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	int days, sec, ret;
+	unsigned long long timeout = sched_clock() + 500000000;
+
+	do {
+		ret = __mtk_rtc_read_time(rtc, tm, &sec);
+		if (ret < 0)
+			goto exit;
+		if (sched_clock() > timeout) {
+			pr_notice("%s, time out\n", __func__);
+			break;
+		}
+	} while (sec < tm->tm_sec);
+
+	/* HW register use 7 bits to store year data, minus
+	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
+	 * RTC_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;//+110
+
+	/* HW register start mon from one, but tm_mon start from zero. */
+	tm->tm_mon--;
+	time = rtc_tm_to_time64(tm);
+
+	/* rtc_tm_to_time64 covert Gregorian date to seconds since
+	 * 01-01-1970 00:00:00, and this date is Thursday.
+	 */
+	days = div_s64(time, 86400);
+	tm->tm_wday = (days + 4) % 7;
+
+	if (rtc_show_time) {
+		dev_notice(rtc->rtc_dev->dev.parent,
+			   "read tc time = %04d/%02d/%02d (%d) %02d:%02d:%02d\n",
+			   tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1,
+			   tm->tm_mday, tm->tm_wday, tm->tm_hour,
+			   tm->tm_min, tm->tm_sec);
+	}
+exit:
+	return ret;
+}
+
+static bool mtk_rtc_check_set_time(struct mt6685_rtc *rtc, struct rtc_time *tm,
+				   int retry_time, int rtc_time_reg)
+{
+	int ret, i, j, write_fail = 0, prot_key = 0xDEAD, hwid = 0, mclk = 0;
+	u16 data[RTC_OFFSET_COUNT], latest[RTC_OFFSET_COUNT];
+
+	data[RTC_OFFSET_SEC] = tm->tm_sec;
+	data[RTC_OFFSET_MIN] = tm->tm_min;
+	data[RTC_OFFSET_HOUR] = tm->tm_hour;
+	data[RTC_OFFSET_DOM] = tm->tm_mday;
+	data[RTC_OFFSET_MTH] = tm->tm_mon;
+	data[RTC_OFFSET_YEAR] = tm->tm_year;
+
+	for (j = 1; j <= retry_time; j++) {
+		write_fail = 0;
+
+		ret = rtc_bulk_read(rtc, rtc->addr_base + rtc_time_reg,
+				    latest, RTC_OFFSET_COUNT * 2);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < RTC_OFFSET_COUNT; i++) {
+			if (i == RTC_OFFSET_DOW)
+				continue;
+
+			latest[i] = latest[i] & rtc_time_mask[i];
+			if (latest[i] != data[i])
+				write_fail++;
+
+			if (j == retry_time) {
+				ret = rtc_read(rtc, rtc->data->hwid, &hwid);
+				if (ret < 0)
+					return ret;
+
+				ret = rtc_read(rtc, RG_RTC_MCLK_PDN, &mclk);
+				if (ret < 0)
+					return ret;
+				mclk = mclk >> RG_RTC_MCLK_PDN_STA_SHIFT & RG_RTC_MCLK_PDN_STA_MASK;
+
+				if (rtc->data->chip_version == MT6685_SERIES) {
+					ret = rtc_read(rtc,
+						       rtc->addr_base + RTC_SPAR_MACRO, &prot_key);
+
+					if (ret < 0)
+						return ret;
+
+					prot_key =
+						prot_key >> SPAR_PROT_STAT_SHIFT
+						& SPAR_PROT_STAT_MASK;
+				}
+
+				dev_info(rtc->rtc_dev->dev.parent,
+					 "[HWID 0x%x, MCLK 0x%x, prot key 0x%x] %s write %d, latest %d\n",
+					 hwid, mclk, prot_key, rtc_time_reg_name[i],
+					 data[i], latest[i]);
+			}
+		}
+
+		if (write_fail > 0)
+			mdelay(2);
+		else
+			break;
+	}
+
+	if (write_fail > 0)
+		return false;
+
+	return true;
+}
+
+static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	int ret, result = 0;
+	u16 data[RTC_OFFSET_COUNT];
+
+	power_on_mclk(rtc);
+
+	dev_notice(rtc->rtc_dev->dev.parent,
+		   "set tc time = %04d/%02d/%02d %02d:%02d:%02d\n",
+		   tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1, tm->tm_mday,
+		   tm->tm_hour, tm->tm_min, tm->tm_sec);
+
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	data[RTC_OFFSET_SEC] = tm->tm_sec;
+	data[RTC_OFFSET_MIN] = tm->tm_min;
+	data[RTC_OFFSET_HOUR] = tm->tm_hour;
+	data[RTC_OFFSET_DOM] = tm->tm_mday;
+	data[RTC_OFFSET_MTH] = tm->tm_mon;
+	data[RTC_OFFSET_YEAR] = tm->tm_year;
+
+	mutex_lock(&rtc->lock);
+	ret = rtc_bulk_write(rtc, rtc->addr_base + RTC_TC_SEC,
+			     data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto exit;
+
+	/* Time register write to hardware after call trigger function */
+	ret = mtk_rtc_write_trigger(rtc);
+	if (ret < 0)
+		goto exit;
+
+	result = mtk_rtc_check_set_time(rtc, tm, 2, RTC_TC_SEC);
+
+	if (!result) {
+		dev_info(rtc->rtc_dev->dev.parent, "check rtc set time\n");
+#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)
+		aee_kernel_warning("mt6685-rtc", "mt6685-rtc: set tick time failed\n");
+#endif
+	}
+
+exit:
+	mutex_unlock(&rtc->lock);
+	power_down_mclk(rtc);
+	return ret;
+}
+
+static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct rtc_time *tm = &alm->time;
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	u32 irqen = 0, pdn2 = 0;
+	int ret;
+	u16 data[RTC_OFFSET_COUNT] = { 0 };
+
+	mutex_lock(&rtc->lock);
+	ret = rtc_read(rtc, rtc->addr_base + RTC_IRQ_EN, &irqen);
+	if (ret < 0)
+		goto err_exit;
+	ret = rtc_read(rtc, rtc->addr_base + RTC_PDN2, &pdn2);
+	if (ret < 0)
+		goto err_exit;
+
+	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
+			    data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto err_exit;
+
+	alm->enabled = !!(irqen & RTC_IRQ_EN_AL);
+	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
+	mutex_unlock(&rtc->lock);
+
+	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
+	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
+	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
+	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
+	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
+	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
+
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon--;
+
+	dev_notice(rtc->rtc_dev->dev.parent,
+		   "read al time = %04d/%02d/%02d %02d:%02d:%02d (%d)\n",
+		   tm->tm_year + RTC_BASE_YEAR, tm->tm_mon + 1, tm->tm_mday,
+		   tm->tm_hour, tm->tm_min, tm->tm_sec, alm->enabled);
+
+	return 0;
+err_exit:
+	mutex_unlock(&rtc->lock);
+	return ret;
+}
+
+static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct rtc_time *tm = &alm->time;
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	int ret, result = 0;
+	u16 data[RTC_OFFSET_COUNT];
+	ktime_t target;
+
+	power_on_mclk(rtc);
+
+	if (alm->enabled == 1) {
+		/* Add one more second to postpone wake time. */
+		target = rtc_tm_to_ktime(*tm);
+		target = ktime_add_ns(target, NSEC_PER_SEC);
+		*tm = rtc_ktime_to_tm(target);
+	}
+
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
+	tm->tm_mon++;
+
+	dev_notice(rtc->rtc_dev->dev.parent,
+		   "set al time = %04d/%02d/%02d %02d:%02d:%02d (%d)\n",
+		   tm->tm_year + RTC_MIN_YEAR, tm->tm_mon, tm->tm_mday,
+		   tm->tm_hour, tm->tm_min, tm->tm_sec, alm->enabled);
+
+	mutex_lock(&rtc->lock);
+
+	switch (alm->enabled) {
+	case 3:
+		/* enable power-on alarm with logo */
+		mtk_rtc_save_pwron_time(rtc, true, tm);
+		break;
+	case 4:
+		/* disable power-on alarm */
+		mtk_rtc_save_pwron_time(rtc, false, tm);
+		break;
+	default:
+		break;
+	}
+
+	ret = rtc_update_bits(rtc,
+			      rtc->addr_base + RTC_PDN2,
+			      RTC_PDN2_PWRON_ALARM, 0);
+	if (ret < 0)
+		goto exit;
+	mtk_rtc_write_trigger(rtc);
+
+	ret = rtc_bulk_read(rtc, rtc->addr_base + RTC_AL_SEC,
+			    data, RTC_OFFSET_COUNT * 2);
+	if (ret < 0)
+		goto exit;
+
+	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
+				(tm->tm_sec & RTC_AL_SEC_MASK));
+	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
+				(tm->tm_min & RTC_AL_MIN_MASK));
+	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
+				(tm->tm_hour & RTC_AL_HOU_MASK));
+	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
+				(tm->tm_mday & RTC_AL_DOM_MASK));
+	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
+				(tm->tm_mon & RTC_AL_MTH_MASK));
+	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
+				(tm->tm_year & RTC_AL_YEA_MASK));
+
+	if (alm->enabled) {
+		ret = rtc_bulk_write(rtc,
+				     rtc->addr_base + RTC_AL_SEC,
+				     data, RTC_OFFSET_COUNT * 2);
+		if (ret < 0)
+			goto exit;
+		ret = rtc_write(rtc, rtc->addr_base + RTC_AL_MASK,
+				RTC_AL_MASK_DOW);
+		if (ret < 0)
+			goto exit;
+
+		ret =  rtc_update_bits(rtc,
+				       rtc->addr_base + RTC_IRQ_EN,
+				       RTC_IRQ_EN_AL, RTC_IRQ_EN_AL);
+		if (ret < 0)
+			goto exit;
+		} else {
+			ret =  rtc_update_bits(rtc,
+					       rtc->addr_base + RTC_IRQ_EN,
+					       RTC_IRQ_EN_AL, 0);
+			if (ret < 0)
+				goto exit;
+		}
+
+	/* All alarm time register write to hardware after calling
+	 * mtk_rtc_write_trigger. This can avoid race condition if alarm
+	 * occur happen during writing alarm time register.
+	 */
+	ret = mtk_rtc_write_trigger(rtc);
+	if (ret < 0)
+		goto exit;
+
+	result = mtk_rtc_check_set_time(rtc, tm, 2, RTC_AL_SEC);
+
+	if (!result) {
+		dev_info(rtc->rtc_dev->dev.parent, "check rtc set alarm\n");
+#if IS_ENABLED(CONFIG_MTK_AEE_FEATURE)
+		aee_kernel_warning("mt6685-rtc", "mt6685-rtc: set alarm time failed\n");
+#endif
+	}
+exit:
+	mutex_unlock(&rtc->lock);
+	power_down_mclk(rtc);
+	return ret;
+}
+
+static int rtc_alarm_set_power_on(struct device *dev, struct rtc_wkalrm *alm)
+{
+	int err = 0;
+	struct rtc_time tm;
+	time64_t now, scheduled;
+
+	err = rtc_valid_tm(&alm->time);
+	if (err != 0)
+		return err;
+	scheduled = rtc_tm_to_time64(&alm->time);
+
+	err = mtk_rtc_read_time(dev, &tm);
+	if (err != 0)
+		return err;
+	now = rtc_tm_to_time64(&tm);
+
+	if (scheduled <= now)
+		alm->enabled = 4;
+	else
+		alm->enabled = 3;
+
+	mtk_rtc_set_alarm(dev, alm);
+
+	return err;
+}
+
+static int mtk_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	void __user *uarg = (void __user *)arg;
+	int err = 0;
+	struct rtc_wkalrm alm;
+
+	switch (cmd) {
+	case RTC_POFF_ALM_SET:
+		if (copy_from_user(&alm.time, uarg, sizeof(alm.time)))
+			return -EFAULT;
+		err = rtc_alarm_set_power_on(dev, &alm);
+		break;
+	default:
+		err = -EINVAL;
+		break;
+	}
+
+	return err;
+}
+
+static const struct rtc_class_ops mtk_rtc_ops = {
+	.ioctl      = mtk_rtc_ioctl,
+	.read_time  = mtk_rtc_read_time,
+	.set_time   = mtk_rtc_set_time,
+	.read_alarm = mtk_rtc_read_alarm,
+	.set_alarm  = mtk_rtc_set_alarm,
+};
+
+static int rtc_nvram_read(void *priv, unsigned int offset, void *val,
+			  size_t bytes)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(priv);
+	unsigned int ival;
+	int ret;
+	u8 *buf = val;
+
+	mutex_lock(&rtc->lock);
+
+	for (; bytes; bytes--) {
+		ret = rtc_field_read(rtc,
+				     &rtc->data->spare_reg_fields[offset++],
+				     &ival);
+
+		if (ret)
+			goto out;
+
+		*buf++ = (u8)ival;
+	}
+
+out:
+	mutex_unlock(&rtc->lock);
+	return ret;
+}
+
+static int rtc_nvram_write(void *priv, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(priv);
+	unsigned int ival;
+	int ret;
+	u8 *buf = val;
+
+	power_on_mclk(rtc);
+
+	mutex_lock(&rtc->lock);
+
+	for (; bytes; bytes--) {
+		ival = *buf++;
+		ret = rtc_field_write(rtc,
+				      &rtc->data->spare_reg_fields[offset++],
+				      ival);
+
+		if (ret)
+			goto out;
+	}
+
+out:
+	mutex_unlock(&rtc->lock);
+	power_down_mclk(rtc);
+	return ret;
+}
+
+static int mtk_rtc_set_spare(struct device *dev)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+	struct nvmem_config nvmem_cfg = {
+		.name = "mtk_rtc_nvmem",
+		.word_size = SPARE_REG_WIDTH,
+		.stride = 1,
+		.size = SPARE_RG_MAX * SPARE_REG_WIDTH,
+		.reg_read = rtc_nvram_read,
+		.reg_write = rtc_nvram_write,
+		.priv = dev,
+	};
+
+	ret = devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
+	if (ret)
+		dev_err(rtc->rtc_dev->dev.parent, "nvmem register failed\n");
+
+	return ret;
+}
+
+static int mtk_rtc_probe(struct platform_device *pdev)
+{
+	struct mt6685_rtc *rtc;
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+#ifdef SUPPORT_PWR_OFF_ALARM
+	struct device_node *of_chosen = NULL;
+	struct tag_bootmode *tag = NULL;
+#endif
+	if (!of_device_is_available(np)) {
+		dev_err(&pdev->dev, "rtc disabled\n");
+		return -1;
+	}
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
+	if (!rtc) {
+		//dev_err(&pdev->dev, "devm_kzalloc failed\n");
+		return -ENOMEM;
+	}
+
+	rtc->data = of_device_get_match_data(&pdev->dev);
+	if (!rtc->data) {
+		dev_err(&pdev->dev, "of_device_get_match_data failed\n");
+		return -ENODEV;
+	}
+
+	if (of_property_read_u32(pdev->dev.of_node, "base", &rtc->addr_base))
+		rtc->addr_base = RTC_DSN_ID;
+
+	pr_notice("%s: rtc->addr_base =0x%x\n", __func__, rtc->addr_base);
+
+	mutex_init(&rtc->lock);
+	mutex_init(&rtc->clk_lock);
+
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev)) {
+		dev_err(&pdev->dev, "Failed devm_rtc_allocate_device: %p\n", rtc->rtc_dev);
+		return PTR_ERR(rtc->rtc_dev);
+	}
+
+	rtc->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!rtc->regmap) {
+		pr_err("%s: get regmap failed\n", __func__);
+		return -ENODEV;
+	}
+
+#ifdef SUPPORT_PWR_OFF_ALARM
+	mt6685_rtc_suspend_lock =
+		wakeup_source_register(NULL, "mt6685-rtc suspend wakelock");
+
+	of_chosen = of_find_node_by_path("/chosen");
+	if (!of_chosen)
+		of_chosen = of_find_node_by_path("/chosen@0");
+
+	if (of_chosen) {
+		tag = (struct tag_bootmode *)of_get_property
+		       (of_chosen, "atag,boot", NULL);
+		if (!tag) {
+			dev_err(&pdev->dev,
+				"%s: failed to get atag,boot\n", __func__);
+		} else {
+			dev_notice(&pdev->dev,
+				   "%s, bootmode:%d\n", __func__, tag->bootmode);
+			bootmode = tag->bootmode;
+		}
+	} else {
+		dev_err(&pdev->dev,
+			"%s: failed to get /chosen and /chosen@0\n", __func__);
+	}
+
+#if IS_ENABLED(CONFIG_PM)
+	rtc->pm_nb.notifier_call = rtc_pm_event;
+	rtc->pm_nb.priority = 0;
+	if (register_pm_notifier(&rtc->pm_nb))
+		dev_err(&pdev->dev, "rtc pm faile\n");
+	else
+		rtc_pm_notifier_registered = true;
+#endif /* CONFIG_PM */
+
+	INIT_WORK(&rtc->work, mtk_rtc_work_queue);
+#endif
+
+	/* Obtain interrupt ID from DTS or MFD */
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq(%d)\n", rtc->irq);
+#if IS_ENABLED(CONFIG_PM)
+		rtc_pm_notifier_registered = false;
+		unregister_pm_notifier(&rtc->pm_nb);
+#endif
+		return rtc->irq;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
+					mtk_rtc_irq_handler_thread,
+					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+					"mt6685-rtc", rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			rtc->irq, ret);
+#if IS_ENABLED(CONFIG_PM)
+		rtc_pm_notifier_registered = false;
+		unregister_pm_notifier(&rtc->pm_nb);
+#endif
+		return ret;
+	}
+
+	/*Enable SCK_TOP rtc interrupt*/
+	rtc_update_bits(rtc, SCK_TOP_INT_CON0, EN_RTC_INTERRUPT, 1);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc_dev->ops = &mtk_rtc_ops;
+
+	if (rtc->data->spare_reg_fields)
+		if (mtk_rtc_set_spare(&pdev->dev))
+			dev_info(&pdev->dev, "spare is not supported\n");
+
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "register rtc device failed\n");
+	};
+
+	enable_irq_wake(rtc->irq);
+
+	if (rtc->data->cali_reg_fields)
+		rtc->cali_is_supported = true;
+
+	power_on_mclk(rtc);
+	power_down_mclk(rtc);
+	return 0;
+}
+
+static void mtk_rtc_shutdown(struct platform_device *pdev)
+{
+	int ret = 0;
+	struct mt6685_rtc *rtc = dev_get_drvdata(&pdev->dev);
+
+	if (rtc->data->chip_version == MT6685_SERIES) {
+		/*Normal sequence power off when PON falling*/
+		ret = rtc_update_bits(rtc, TOP2_ELR1, TOP2_ELR1_MASK, 1);
+		if (ret < 0)
+			dev_info(&pdev->dev, "check mt6685 TOP2_ELR1\n");
+	}
+
+	if (rtc->cali_is_supported)
+		mtk_rtc_enable_k_eosc(&pdev->dev);
+}
+
+static const struct mtk_rtc_data mt6685_rtc_data = {
+	.wrtgr = RTC_WRTGR,
+	.hwid = HWID_MT6685,
+	.chip_version = MT6685_SERIES,
+	.spare_reg_fields = mt6685_spare_reg_fields,
+	.cali_reg_fields = mt6685_cali_reg_fields,
+	.single_read_write_is_supported = true,
+};
+
+static const struct of_device_id mt6685_rtc_of_match[] = {
+	{ .compatible = "mediatek,mt6685-rtc", .data = &mt6685_rtc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt6685_rtc_of_match);
+
+static struct platform_driver mtk_rtc_driver = {
+	.driver = {
+		.name = "mt6685-rtc",
+		.of_match_table = mt6685_rtc_of_match,
+	},
+	.probe	= mtk_rtc_probe,
+	.shutdown = mtk_rtc_shutdown,
+};
+
+module_platform_driver(mtk_rtc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mw Lin <Mw.Lin@mediatek.com>");
+MODULE_DESCRIPTION("RTC Driver for MediaTek MT6685 Clock IC");
diff --git a/include/linux/mfd/mt6685-audclk.h b/include/linux/mfd/mt6685-audclk.h
new file mode 100644
index 000000000000..fd99effd0a6c
--- /dev/null
+++ b/include/linux/mfd/mt6685-audclk.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+#ifndef _AUDIO_DCXO_H_
+#define _AUDIO_DCXO_H_
+
+/* just be called by audio module for dcxo */
+void mt6685_set_dcxo_mode(unsigned int mode);
+void mt6685_set_dcxo(bool enable);
+#endif
diff --git a/include/linux/mfd/mt6685/core.h b/include/linux/mfd/mt6685/core.h
new file mode 100644
index 000000000000..dcaf800e8212
--- /dev/null
+++ b/include/linux/mfd/mt6685/core.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MFD_MT6685_CORE_H__
+#define __MFD_MT6685_CORE_H__
+
+struct mt6685_chip {
+	struct device *dev;
+	struct regmap *regmap;
+	int irq;
+	struct irq_domain *irq_domain;
+	struct mutex irqlock; /* Mid-end lock for synchronous operation */
+	u16 wake_mask[2];
+	u16 irq_masks_cur[2];
+	u16 irq_masks_cache[2];
+	u16 int_con[2];
+	u16 int_status[2];
+};
+
+#endif /* __MFD_MT6685_CORE_H__ */
diff --git a/include/linux/mfd/mt6685/registers.h b/include/linux/mfd/mt6685/registers.h
new file mode 100644
index 000000000000..3072a59545b6
--- /dev/null
+++ b/include/linux/mfd/mt6685/registers.h
@@ -0,0 +1,921 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc
+ */
+
+#ifndef _MT6685_HW_H_
+#define _MT6685_HW_H_
+
+#define MT6685_REG_BASE                  ((unsigned int)(0x0))
+#define MT6685_HWCID_L                   (MT6685_REG_BASE + 0x8)
+#define MT6685_TOP_CON                   (MT6685_REG_BASE + 0x18)
+#define MT6685_TOP_CKPDN_CON0            (MT6685_REG_BASE + 0x10b)
+#define MT6685_TOP_CKPDN_CON0_SET        (MT6685_REG_BASE + 0x10c)
+#define MT6685_TOP_CKPDN_CON0_CLR        (MT6685_REG_BASE + 0x10d)
+#define MT6685_TOP_CKSEL_CON0            (MT6685_REG_BASE + 0x111)
+#define MT6685_TOP_CKSEL_CON0_SET        (MT6685_REG_BASE + 0x112)
+#define MT6685_TOP_CKSEL_CON0_CLR        (MT6685_REG_BASE + 0x113)
+#define MT6685_TOP2_ELR1                 (MT6685_REG_BASE + 0x12f)
+#define MT6685_TOP_DIG_WPK               (MT6685_REG_BASE + 0x3a8)
+#define MT6685_TOP_DIG_WPK_H             (MT6685_REG_BASE + 0x3a9)
+#define MT6685_SCK_TOP_INT_STATUS0       (MT6685_REG_BASE + 0x534)
+#define MT6685_SCK_TOP_INT_RAW_STATUS0   (MT6685_REG_BASE + 0x536)
+#define MT6685_SCK_TOP_CON0_L            (MT6685_REG_BASE + 0x50c)
+#define MT6685_SCK_TOP_CON0_H            (MT6685_REG_BASE + 0x50d)
+#define MT6685_SCK_TOP_CKPDN_CON0_L      (MT6685_REG_BASE + 0x514)
+#define MT6685_SCK_TOP_CKPDN_CON0_L_SET  (MT6685_REG_BASE + 0x515)
+#define MT6685_SCK_TOP_CKPDN_CON0_L_CLR  (MT6685_REG_BASE + 0x516)
+#define MT6685_SCK_TOP_RST_CON0          (MT6685_REG_BASE + 0x522)
+#define MT6685_SCK_TOP_INT_CON0          (MT6685_REG_BASE + 0x528)
+#define MT6685_SCK_TOP_INT_CON0_SET      (MT6685_REG_BASE + 0x52a)
+#define MT6685_SCK_TOP_INT_CON0_CLR      (MT6685_REG_BASE + 0x52c)
+#define MT6685_FQMTR_CON0_L              (MT6685_REG_BASE + 0x546)
+#define MT6685_FQMTR_CON0_H              (MT6685_REG_BASE + 0x547)
+#define MT6685_FQMTR_CON1_L              (MT6685_REG_BASE + 0x548)
+#define MT6685_FQMTR_CON2_L              (MT6685_REG_BASE + 0x54a)
+#define MT6685_SCK_TOP_CKSEL_CON         (MT6685_REG_BASE + 0x568)
+#define MT6685_RTC_SPAR_RELOAD           (MT6685_REG_BASE + 0x56a)
+#define MT6685_RTC_ANA_ID                (MT6685_REG_BASE + 0x580)
+#define MT6685_RTC_DIG_ID                (MT6685_REG_BASE + 0x581)
+#define MT6685_RTC_ANA_REV               (MT6685_REG_BASE + 0x582)
+#define MT6685_RTC_DIG_REV               (MT6685_REG_BASE + 0x583)
+#define MT6685_RTC_DBI                   (MT6685_REG_BASE + 0x584)
+#define MT6685_RTC_ESP                   (MT6685_REG_BASE + 0x585)
+#define MT6685_RTC_FPI                   (MT6685_REG_BASE + 0x586)
+#define MT6685_RTC_DXI                   (MT6685_REG_BASE + 0x587)
+#define MT6685_RTC_BBPU_L                (MT6685_REG_BASE + 0x588)
+#define MT6685_RTC_BBPU_H                (MT6685_REG_BASE + 0x589)
+#define MT6685_RTC_IRQ_STA               (MT6685_REG_BASE + 0x58a)
+#define MT6685_RTC_IRQ_EN                (MT6685_REG_BASE + 0x58c)
+#define MT6685_RTC_CII_EN_L              (MT6685_REG_BASE + 0x58e)
+#define MT6685_RTC_CII_EN_H              (MT6685_REG_BASE + 0x58f)
+#define MT6685_RTC_AL_MASK               (MT6685_REG_BASE + 0x590)
+#define MT6685_RTC_TC_SEC                (MT6685_REG_BASE + 0x592)
+#define MT6685_RTC_TC_MIN                (MT6685_REG_BASE + 0x594)
+#define MT6685_RTC_TC_HOU                (MT6685_REG_BASE + 0x596)
+#define MT6685_RTC_TC_DOM                (MT6685_REG_BASE + 0x598)
+#define MT6685_RTC_TC_DOW                (MT6685_REG_BASE + 0x59a)
+#define MT6685_RTC_TC_MTH_L              (MT6685_REG_BASE + 0x59c)
+#define MT6685_RTC_TC_MTH_H              (MT6685_REG_BASE + 0x59d)
+#define MT6685_RTC_TC_YEA                (MT6685_REG_BASE + 0x59e)
+#define MT6685_RTC_AL_SEC_L              (MT6685_REG_BASE + 0x5a0)
+#define MT6685_RTC_AL_SEC_H              (MT6685_REG_BASE + 0x5a1)
+#define MT6685_RTC_AL_MIN                (MT6685_REG_BASE + 0x5a2)
+#define MT6685_RTC_AL_HOU_L              (MT6685_REG_BASE + 0x5a4)
+#define MT6685_RTC_AL_HOU_H              (MT6685_REG_BASE + 0x5a5)
+#define MT6685_RTC_AL_DOM_L              (MT6685_REG_BASE + 0x5a6)
+#define MT6685_RTC_AL_DOM_H              (MT6685_REG_BASE + 0x5a7)
+#define MT6685_RTC_AL_DOW_L              (MT6685_REG_BASE + 0x5a8)
+#define MT6685_RTC_AL_DOW_H              (MT6685_REG_BASE + 0x5a9)
+#define MT6685_RTC_AL_MTH_L              (MT6685_REG_BASE + 0x5aa)
+#define MT6685_RTC_AL_MTH_H              (MT6685_REG_BASE + 0x5ab)
+#define MT6685_RTC_AL_YEA_L              (MT6685_REG_BASE + 0x5ac)
+#define MT6685_RTC_AL_YEA_H              (MT6685_REG_BASE + 0x5ad)
+#define MT6685_RTC_OSC32CON_L            (MT6685_REG_BASE + 0x5ae)
+#define MT6685_RTC_OSC32CON_H            (MT6685_REG_BASE + 0x5af)
+#define MT6685_RTC_POWERKEY1_L           (MT6685_REG_BASE + 0x5b0)
+#define MT6685_RTC_POWERKEY1_H           (MT6685_REG_BASE + 0x5b1)
+#define MT6685_RTC_POWERKEY2_L           (MT6685_REG_BASE + 0x5b2)
+#define MT6685_RTC_POWERKEY2_H           (MT6685_REG_BASE + 0x5b3)
+#define MT6685_RTC_PDN1_L                (MT6685_REG_BASE + 0x5b4)
+#define MT6685_RTC_PDN1_H                (MT6685_REG_BASE + 0x5b5)
+#define MT6685_RTC_PDN2_L                (MT6685_REG_BASE + 0x5b6)
+#define MT6685_RTC_PDN2_H                (MT6685_REG_BASE + 0x5b7)
+#define MT6685_RTC_SPAR0_L               (MT6685_REG_BASE + 0x5b8)
+#define MT6685_RTC_SPAR0_H               (MT6685_REG_BASE + 0x5b9)
+#define MT6685_RTC_SPAR1_L               (MT6685_REG_BASE + 0x5ba)
+#define MT6685_RTC_SPAR1_H               (MT6685_REG_BASE + 0x5bb)
+#define MT6685_RTC_PROT_L                (MT6685_REG_BASE + 0x5bc)
+#define MT6685_RTC_PROT_H                (MT6685_REG_BASE + 0x5bd)
+#define MT6685_RTC_DIFF_L                (MT6685_REG_BASE + 0x5be)
+#define MT6685_RTC_DIFF_H                (MT6685_REG_BASE + 0x5bf)
+#define MT6685_RTC_CALI_L                (MT6685_REG_BASE + 0x5c0)
+#define MT6685_RTC_CALI_H                (MT6685_REG_BASE + 0x5c1)
+#define MT6685_RTC_WRTGR                 (MT6685_REG_BASE + 0x5c2)
+#define MT6685_RTC_CON_L                 (MT6685_REG_BASE + 0x5c4)
+#define MT6685_RTC_CON_H                 (MT6685_REG_BASE + 0x5c5)
+#define MT6685_RTC_SEC_CTRL              (MT6685_REG_BASE + 0x5c6)
+#define MT6685_RTC_INT_CNT_L             (MT6685_REG_BASE + 0x5c8)
+#define MT6685_RTC_INT_CNT_H             (MT6685_REG_BASE + 0x5c9)
+#define MT6685_RTC_SEC_DAT0_L            (MT6685_REG_BASE + 0x5ca)
+#define MT6685_RTC_SEC_DAT0_H            (MT6685_REG_BASE + 0x5cb)
+#define MT6685_RTC_SEC_DAT1_L            (MT6685_REG_BASE + 0x5cc)
+#define MT6685_RTC_SEC_DAT1_H            (MT6685_REG_BASE + 0x5cd)
+#define MT6685_RTC_SEC_DAT2_L            (MT6685_REG_BASE + 0x5ce)
+#define MT6685_RTC_SEC_DAT2_H            (MT6685_REG_BASE + 0x5cf)
+#define MT6685_RTC_RG_FG0                (MT6685_REG_BASE + 0x5d0)
+#define MT6685_RTC_RG_FG1                (MT6685_REG_BASE + 0x5d2)
+#define MT6685_RTC_RG_FG2                (MT6685_REG_BASE + 0x5d4)
+#define MT6685_RTC_RG_FG3                (MT6685_REG_BASE + 0x5d6)
+#define MT6685_RTC_SPAR_MACRO            (MT6685_REG_BASE + 0x5d8)
+#define MT6685_RTC_SPAR_CORE             (MT6685_REG_BASE + 0x5e0)
+#define MT6685_RTC_EOSC_CALI             (MT6685_REG_BASE + 0x5e2)
+#define MT6685_RTC_SEC_ANA_ID            (MT6685_REG_BASE + 0x600)
+#define MT6685_RTC_SEC_DIG_ID            (MT6685_REG_BASE + 0x601)
+#define MT6685_RTC_SEC_ANA_REV           (MT6685_REG_BASE + 0x602)
+#define MT6685_RTC_SEC_DIG_REV           (MT6685_REG_BASE + 0x603)
+#define MT6685_RTC_SEC_DBI               (MT6685_REG_BASE + 0x604)
+#define MT6685_RTC_SEC_ESP               (MT6685_REG_BASE + 0x605)
+#define MT6685_RTC_SEC_FPI               (MT6685_REG_BASE + 0x606)
+#define MT6685_RTC_SEC_DXI               (MT6685_REG_BASE + 0x607)
+#define MT6685_RTC_TC_SEC_SEC            (MT6685_REG_BASE + 0x608)
+#define MT6685_RTC_TC_MIN_SEC            (MT6685_REG_BASE + 0x60a)
+#define MT6685_RTC_TC_HOU_SEC            (MT6685_REG_BASE + 0x60c)
+#define MT6685_RTC_TC_DOM_SEC            (MT6685_REG_BASE + 0x60e)
+#define MT6685_RTC_TC_DOW_SEC            (MT6685_REG_BASE + 0x610)
+#define MT6685_RTC_TC_MTH_SEC            (MT6685_REG_BASE + 0x612)
+#define MT6685_RTC_TC_YEA_SEC            (MT6685_REG_BASE + 0x614)
+#define MT6685_RTC_SEC_CK_PDN            (MT6685_REG_BASE + 0x616)
+#define MT6685_RTC_SEC_WRTGR             (MT6685_REG_BASE + 0x618)
+#define MT6685_DCXO_DIG_MODE_CW0         (MT6685_REG_BASE + 0x789)
+/* mask is HEX;	shift is Integer */
+#define MT6685_RG_SRCLKEN_IN0_HW_MODE_ADDR                  \
+	MT6685_TOP_CON
+#define MT6685_RG_SRCLKEN_IN0_HW_MODE_MASK                  0x1
+#define MT6685_RG_SRCLKEN_IN0_HW_MODE_SHIFT                 1
+#define MT6685_RG_SRCLKEN_IN1_HW_MODE_ADDR                  \
+	MT6685_TOP_CON
+#define MT6685_RG_SRCLKEN_IN1_HW_MODE_MASK                  0x1
+#define MT6685_RG_FQMTR_32K_CK_PDN_ADDR                     \
+	MT6685_TOP_CKPDN_CON0
+#define MT6685_RG_FQMTR_32K_CK_PDN_MASK                     0x1
+#define MT6685_RG_FQMTR_32K_CK_PDN_SHIFT                    4
+	#define MT6685_RG_SRCLKEN_IN1_HW_MODE_SHIFT             2
+#define MT6685_RG_FQMTR_CK_PDN_ADDR                         \
+	MT6685_TOP_CKPDN_CON0
+#define MT6685_RG_FQMTR_CK_PDN_MASK                         0x1
+#define MT6685_RG_FQMTR_CK_PDN_SHIFT                        5
+#define MT6685_RG_INTRP_CK_PDN_ADDR                         \
+	MT6685_TOP_CKPDN_CON0
+#define MT6685_RG_INTRP_CK_PDN_MASK                         0x1
+#define MT6685_RG_INTRP_CK_PDN_SHIFT                        6
+#define MT6685_TOP_CKPDN_CON0_SET_ADDR                      \
+	MT6685_TOP_CKPDN_CON0_SET
+#define MT6685_TOP_CKPDN_CON0_SET_MASK                      0xFF
+#define MT6685_TOP_CKPDN_CON0_SET_SHIFT                     0
+#define MT6685_TOP_CKPDN_CON0_CLR_ADDR                      \
+	MT6685_TOP_CKPDN_CON0_CLR
+#define MT6685_TOP_CKPDN_CON0_CLR_MASK                      0xFF
+#define MT6685_TOP_CKPDN_CON0_CLR_SHIFT                     0
+#define MT6685_RG_FQMTR_CK_CKSEL_ADDR                       \
+	MT6685_TOP_CKSEL_CON0
+#define MT6685_RG_FQMTR_CK_CKSEL_MASK                       0x7
+#define MT6685_RG_FQMTR_CK_CKSEL_SHIFT                      0
+#define MT6685_RG_PMU32K_CK_CKSEL_ADDR                      \
+	MT6685_TOP_CKSEL_CON0
+#define MT6685_RG_PMU32K_CK_CKSEL_MASK                      0x1
+#define MT6685_RG_PMU32K_CK_CKSEL_SHIFT                     3
+#define MT6685_TOP_CKSEL_CON0_SET_ADDR                      \
+	MT6685_TOP_CKSEL_CON0_SET
+#define MT6685_TOP_CKSEL_CON0_SET_MASK                      0xFF
+#define MT6685_TOP_CKSEL_CON0_SET_SHIFT                     0
+#define MT6685_TOP_CKSEL_CON0_CLR_ADDR                      \
+	MT6685_TOP_CKSEL_CON0_CLR
+#define MT6685_TOP_CKSEL_CON0_CLR_MASK                      0xFF
+#define MT6685_TOP_CKSEL_CON0_CLR_SHIFT                     0
+#define MT6685_DIG_WPK_KEY_ADDR                             \
+	MT6685_TOP_DIG_WPK
+#define MT6685_DIG_WPK_KEY_MASK                             0xFF
+#define MT6685_DIG_WPK_KEY_SHIFT                            0
+#define MT6685_DIG_WPK_KEY_H_ADDR                           \
+	MT6685_TOP_DIG_WPK_H
+#define MT6685_DIG_WPK_KEY_H_MASK                           0xFF
+#define MT6685_DIG_WPK_KEY_H_SHIFT                          0
+#define MT6685_SCK_TOP_XTAL_SEL_ADDR                        \
+	MT6685_SCK_TOP_CON0_L
+#define MT6685_SCK_TOP_XTAL_SEL_MASK                        0x1
+#define MT6685_SCK_TOP_XTAL_SEL_SHIFT                       0
+#define MT6685_RG_RTC_SEC_MCLK_PDN_ADDR                     \
+	MT6685_SCK_TOP_CKPDN_CON0_L
+#define MT6685_RG_RTC_SEC_MCLK_PDN_MASK                     0x1
+#define MT6685_RG_RTC_SEC_MCLK_PDN_SHIFT                    0
+#define MT6685_RG_RTC_EOSC32_CK_PDN_ADDR                    \
+	MT6685_SCK_TOP_CKPDN_CON0_L
+#define MT6685_RG_RTC_EOSC32_CK_PDN_MASK                    0x1
+#define MT6685_RG_RTC_EOSC32_CK_PDN_SHIFT                   2
+#define MT6685_RG_RTC_SEC_32K_CK_PDN_ADDR                   \
+	MT6685_SCK_TOP_CKPDN_CON0_L
+#define MT6685_RG_RTC_SEC_32K_CK_PDN_MASK                   0x1
+#define MT6685_RG_RTC_SEC_32K_CK_PDN_SHIFT                  3
+#define MT6685_RG_RTC_MCLK_PDN_ADDR                         \
+	MT6685_SCK_TOP_CKPDN_CON0_L
+#define MT6685_RG_RTC_MCLK_PDN_MASK                         0x1
+#define MT6685_RG_RTC_MCLK_PDN_SHIFT                        4
+#define MT6685_RG_RTC_32K_CK_PDN_ADDR                       \
+	MT6685_SCK_TOP_CKPDN_CON0_L
+#define MT6685_RG_RTC_32K_CK_PDN_MASK                       0x1
+#define MT6685_RG_RTC_32K_CK_PDN_SHIFT                      5
+#define MT6685_SCK_TOP_CKPDN_CON0_L_SET_ADDR                \
+	MT6685_SCK_TOP_CKPDN_CON0_L_SET
+#define MT6685_SCK_TOP_CKPDN_CON0_L_SET_MASK                0xFF
+#define MT6685_SCK_TOP_CKPDN_CON0_L_SET_SHIFT               0
+#define MT6685_SCK_TOP_CKPDN_CON0_L_CLR_ADDR                \
+	MT6685_SCK_TOP_CKPDN_CON0_L_CLR
+#define MT6685_SCK_TOP_CKPDN_CON0_L_CLR_MASK                0xFF
+#define MT6685_SCK_TOP_CKPDN_CON0_L_CLR_SHIFT               0
+#define MT6685_RG_BANK_FQMTR_RST_ADDR                       \
+	MT6685_SCK_TOP_RST_CON0
+#define MT6685_RG_BANK_FQMTR_RST_MASK                       0x1
+#define MT6685_RG_BANK_FQMTR_RST_SHIFT                      6
+#define MT6685_RG_RTC_DIG_TEST_MODE_ADDR                    \
+	MT6685_RTC_DIG_CON0_H
+#define MT6685_RG_RTC_DIG_TEST_MODE_MASK                    0x1
+#define MT6685_RG_RTC_DIG_TEST_MODE_SHIFT                   7
+#define MT6685_FQMTR_TCKSEL_ADDR                            \
+	MT6685_FQMTR_CON0_L
+#define MT6685_FQMTR_TCKSEL_MASK                            0x7
+#define MT6685_FQMTR_TCKSEL_SHIFT                           0
+#define MT6685_FQMTR_BUSY_ADDR                              \
+	MT6685_FQMTR_CON0_L
+#define MT6685_FQMTR_BUSY_MASK                              0x1
+#define MT6685_FQMTR_BUSY_SHIFT                             3
+#define MT6685_FQMTR_DCXO26M_EN_ADDR                        \
+	MT6685_FQMTR_CON0_L
+#define MT6685_FQMTR_DCXO26M_EN_MASK                        0x1
+#define MT6685_FQMTR_DCXO26M_EN_SHIFT                       4
+#define MT6685_FQMTR_EN_ADDR                                \
+	MT6685_FQMTR_CON0_H
+#define MT6685_FQMTR_EN_MASK                                0x1
+#define MT6685_FQMTR_EN_SHIFT                               7
+#define MT6685_FQMTR_WINSET_L_ADDR                          \
+	MT6685_FQMTR_CON1_L
+#define MT6685_FQMTR_WINSET_L_MASK                          0xFF
+#define MT6685_FQMTR_WINSET_L_SHIFT                         0
+#define MT6685_FQMTR_WINSET_H_ADDR                          \
+	MT6685_FQMTR_CON1_H
+#define MT6685_FQMTR_WINSET_H_MASK                          0xFF
+#define MT6685_FQMTR_WINSET_H_SHIFT                         0
+#define MT6685_FQMTR_DATA_L_ADDR                            \
+	MT6685_FQMTR_CON2_L
+#define MT6685_FQMTR_DATA_L_MASK                            0xFF
+#define MT6685_FQMTR_DATA_L_SHIFT                           0
+#define MT6685_RG_RTC_32K1V8_0_SEL_ADDR                     \
+	MT6685_SCK_TOP_CKSEL_CON
+#define MT6685_RG_RTC_32K1V8_0_SEL_MASK                     0x3
+#define MT6685_RG_RTC_32K1V8_0_SEL_SHIFT                    0
+#define MT6685_SPAR_SW_RELOAD_ADDR                          \
+	MT6685_RTC_SPAR_RELOAD
+#define MT6685_SPAR_SW_RELOAD_MASK                          0x1
+#define MT6685_SPAR_SW_RELOAD_SHIFT                         0
+#define MT6685_RTC_ANA_ID_ADDR                              \
+	MT6685_RTC_ANA_ID
+#define MT6685_RTC_ANA_ID_MASK                              0xFF
+#define MT6685_RTC_ANA_ID_SHIFT                             0
+#define MT6685_RTC_DIG_ID_ADDR                              \
+	MT6685_RTC_DIG_ID
+#define MT6685_RTC_DIG_ID_MASK                              0xFF
+#define MT6685_RTC_DIG_ID_SHIFT                             0
+#define MT6685_RTC_ANA_MINOR_REV_ADDR                       \
+	MT6685_RTC_ANA_REV
+#define MT6685_RTC_ANA_MINOR_REV_MASK                       0xF
+#define MT6685_RTC_ANA_MINOR_REV_SHIFT                      0
+#define MT6685_RTC_ANA_MAJOR_REV_ADDR                       \
+	MT6685_RTC_ANA_REV
+#define MT6685_RTC_ANA_MAJOR_REV_MASK                       0xF
+#define MT6685_RTC_ANA_MAJOR_REV_SHIFT                      4
+#define MT6685_RTC_DIG_MINOR_REV_ADDR                       \
+	MT6685_RTC_DIG_REV
+#define MT6685_RTC_DIG_MINOR_REV_MASK                       0xF
+#define MT6685_RTC_DIG_MINOR_REV_SHIFT                      0
+#define MT6685_RTC_DIG_MAJOR_REV_ADDR                       \
+	MT6685_RTC_DIG_REV
+#define MT6685_RTC_DIG_MAJOR_REV_MASK                       0xF
+#define MT6685_RTC_DIG_MAJOR_REV_SHIFT                      4
+#define MT6685_RTC_CBS_ADDR                                 \
+	MT6685_RTC_DBI
+#define MT6685_RTC_CBS_MASK                                 0x3
+#define MT6685_RTC_CBS_SHIFT                                0
+#define MT6685_RTC_BIX_ADDR                                 \
+	MT6685_RTC_DBI
+#define MT6685_RTC_BIX_MASK                                 0x3
+#define MT6685_RTC_BIX_SHIFT                                2
+#define MT6685_RTC_ESP_ADDR                                 \
+	MT6685_RTC_ESP
+#define MT6685_RTC_ESP_MASK                                 0xFF
+#define MT6685_RTC_ESP_SHIFT                                0
+#define MT6685_RTC_FPI_ADDR                                 \
+	MT6685_RTC_FPI
+#define MT6685_RTC_FPI_MASK                                 0xFF
+#define MT6685_RTC_FPI_SHIFT                                0
+#define MT6685_RTC_DXI_ADDR                                 \
+	MT6685_RTC_DXI
+#define MT6685_RTC_DXI_MASK                                 0xFF
+#define MT6685_RTC_DXI_SHIFT                                0
+#define MT6685_BBPU_ADDR                                    \
+	MT6685_RTC_BBPU_L
+#define MT6685_BBPU_MASK                                    0xF
+#define MT6685_BBPU_SHIFT                                   0
+#define MT6685_CLRPKY_ADDR                                  \
+	MT6685_RTC_BBPU_L
+#define MT6685_CLRPKY_MASK                                  0x1
+#define MT6685_CLRPKY_SHIFT                                 4
+#define MT6685_RELOAD_ADDR                                  \
+	MT6685_RTC_BBPU_L
+#define MT6685_RELOAD_MASK                                  0x1
+#define MT6685_RELOAD_SHIFT                                 5
+#define MT6685_CBUSY_ADDR                                   \
+	MT6685_RTC_BBPU_L
+#define MT6685_CBUSY_MASK                                   0x1
+#define MT6685_CBUSY_SHIFT                                  6
+#define MT6685_ALARM_STATUS_ADDR                            \
+	MT6685_RTC_BBPU_L
+#define MT6685_ALARM_STATUS_MASK                            0x1
+#define MT6685_ALARM_STATUS_SHIFT                           7
+#define MT6685_KEY_BBPU_ADDR                                \
+	MT6685_RTC_BBPU_H
+#define MT6685_KEY_BBPU_MASK                                0xFF
+#define MT6685_KEY_BBPU_SHIFT                               0
+#define MT6685_ALSTA_ADDR                                   \
+	MT6685_RTC_IRQ_STA
+#define MT6685_ALSTA_MASK                                   0x1
+#define MT6685_ALSTA_SHIFT                                  0
+#define MT6685_TCSTA_ADDR                                   \
+	MT6685_RTC_IRQ_STA
+#define MT6685_TCSTA_MASK                                   0x1
+#define MT6685_TCSTA_SHIFT                                  1
+#define MT6685_LPSTA_ADDR                                   \
+	MT6685_RTC_IRQ_STA
+#define MT6685_LPSTA_MASK                                   0x1
+#define MT6685_LPSTA_SHIFT                                  3
+#define MT6685_AL_EN_ADDR                                   \
+	MT6685_RTC_IRQ_EN
+#define MT6685_AL_EN_MASK                                   0x1
+#define MT6685_AL_EN_SHIFT                                  0
+#define MT6685_TC_EN_ADDR                                   \
+	MT6685_RTC_IRQ_EN
+#define MT6685_TC_EN_MASK                                   0x1
+#define MT6685_TC_EN_SHIFT                                  1
+#define MT6685_ONESHOT_ADDR                                 \
+	MT6685_RTC_IRQ_EN
+#define MT6685_ONESHOT_MASK                                 0x1
+#define MT6685_ONESHOT_SHIFT                                2
+#define MT6685_LP_EN_ADDR                                   \
+	MT6685_RTC_IRQ_EN
+#define MT6685_LP_EN_MASK                                   0x1
+#define MT6685_LP_EN_SHIFT                                  3
+#define MT6685_SECCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_SECCII_MASK                                  0x1
+#define MT6685_SECCII_SHIFT                                 0
+#define MT6685_MINCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_MINCII_MASK                                  0x1
+#define MT6685_MINCII_SHIFT                                 1
+#define MT6685_HOUCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_HOUCII_MASK                                  0x1
+#define MT6685_HOUCII_SHIFT                                 2
+#define MT6685_DOMCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_DOMCII_MASK                                  0x1
+#define MT6685_DOMCII_SHIFT                                 3
+#define MT6685_DOWCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_DOWCII_MASK                                  0x1
+#define MT6685_DOWCII_SHIFT                                 4
+#define MT6685_MTHCII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_MTHCII_MASK                                  0x1
+#define MT6685_MTHCII_SHIFT                                 5
+#define MT6685_YEACII_ADDR                                  \
+	MT6685_RTC_CII_EN_L
+#define MT6685_YEACII_MASK                                  0x1
+#define MT6685_YEACII_SHIFT                                 6
+#define MT6685_SECCII_1_2_ADDR                              \
+	MT6685_RTC_CII_EN_L
+#define MT6685_SECCII_1_2_MASK                              0x1
+#define MT6685_SECCII_1_2_SHIFT                             7
+#define MT6685_SECCII_1_4_ADDR                              \
+	MT6685_RTC_CII_EN_H
+#define MT6685_SECCII_1_4_MASK                              0x1
+#define MT6685_SECCII_1_4_SHIFT                             0
+#define MT6685_SECCII_1_8_ADDR                              \
+	MT6685_RTC_CII_EN_H
+#define MT6685_SECCII_1_8_MASK                              0x1
+#define MT6685_SECCII_1_8_SHIFT                             1
+#define MT6685_SEC_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_SEC_MSK_MASK                                 0x1
+#define MT6685_SEC_MSK_SHIFT                                0
+#define MT6685_MIN_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_MIN_MSK_MASK                                 0x1
+#define MT6685_MIN_MSK_SHIFT                                1
+#define MT6685_HOU_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_HOU_MSK_MASK                                 0x1
+#define MT6685_HOU_MSK_SHIFT                                2
+#define MT6685_DOM_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_DOM_MSK_MASK                                 0x1
+#define MT6685_DOM_MSK_SHIFT                                3
+#define MT6685_DOW_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_DOW_MSK_MASK                                 0x1
+#define MT6685_DOW_MSK_SHIFT                                4
+#define MT6685_MTH_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_MTH_MSK_MASK                                 0x1
+#define MT6685_MTH_MSK_SHIFT                                5
+#define MT6685_YEA_MSK_ADDR                                 \
+	MT6685_RTC_AL_MASK
+#define MT6685_YEA_MSK_MASK                                 0x1
+#define MT6685_YEA_MSK_SHIFT                                6
+#define MT6685_TC_SECOND_ADDR                               \
+	MT6685_RTC_TC_SEC
+#define MT6685_TC_SECOND_MASK                               0x3F
+#define MT6685_TC_SECOND_SHIFT                              0
+#define MT6685_TC_MINUTE_ADDR                               \
+	MT6685_RTC_TC_MIN
+#define MT6685_TC_MINUTE_MASK                               0x3F
+#define MT6685_TC_MINUTE_SHIFT                              0
+#define MT6685_TC_HOUR_ADDR                                 \
+	MT6685_RTC_TC_HOU
+#define MT6685_TC_HOUR_MASK                                 0x1F
+#define MT6685_TC_HOUR_SHIFT                                0
+#define MT6685_TC_DOM_ADDR                                  \
+	MT6685_RTC_TC_DOM
+#define MT6685_TC_DOM_MASK                                  0x1F
+#define MT6685_TC_DOM_SHIFT                                 0
+#define MT6685_TC_DOW_ADDR                                  \
+	MT6685_RTC_TC_DOW
+#define MT6685_TC_DOW_MASK                                  0x7
+#define MT6685_TC_DOW_SHIFT                                 0
+#define MT6685_TC_MONTH_ADDR                                \
+	MT6685_RTC_TC_MTH_L
+#define MT6685_TC_MONTH_MASK                                0xF
+#define MT6685_TC_MONTH_SHIFT                               0
+#define MT6685_RTC_MACRO_ID_L_ADDR                          \
+	MT6685_RTC_TC_MTH_L
+#define MT6685_RTC_MACRO_ID_L_MASK                          0xF
+#define MT6685_RTC_MACRO_ID_L_SHIFT                         4
+#define MT6685_RTC_MACRO_ID_H_ADDR                          \
+	MT6685_RTC_TC_MTH_H
+#define MT6685_RTC_MACRO_ID_H_MASK                          0xFF
+#define MT6685_RTC_MACRO_ID_H_SHIFT                         0
+#define MT6685_TC_YEAR_ADDR                                 \
+	MT6685_RTC_TC_YEA
+#define MT6685_TC_YEAR_MASK                                 0x7F
+#define MT6685_TC_YEAR_SHIFT                                0
+#define MT6685_AL_SECOND_ADDR                               \
+	MT6685_RTC_AL_SEC_L
+#define MT6685_AL_SECOND_MASK                               0x3F
+#define MT6685_AL_SECOND_SHIFT                              0
+#define MT6685_BBPU_AUTO_PDN_SEL_ADDR                       \
+	MT6685_RTC_AL_SEC_L
+#define MT6685_BBPU_AUTO_PDN_SEL_MASK                       0x1
+#define MT6685_BBPU_AUTO_PDN_SEL_SHIFT                      6
+#define MT6685_BBPU_2SEC_CK_SEL_ADDR                        \
+	MT6685_RTC_AL_SEC_L
+#define MT6685_BBPU_2SEC_CK_SEL_MASK                        0x1
+#define MT6685_BBPU_2SEC_CK_SEL_SHIFT                       7
+#define MT6685_BBPU_2SEC_EN_ADDR                            \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_BBPU_2SEC_EN_MASK                            0x1
+#define MT6685_BBPU_2SEC_EN_SHIFT                           0
+#define MT6685_BBPU_2SEC_MODE_ADDR                          \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_BBPU_2SEC_MODE_MASK                          0x3
+#define MT6685_BBPU_2SEC_MODE_SHIFT                         1
+#define MT6685_BBPU_2SEC_STAT_CLEAR_ADDR                    \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_BBPU_2SEC_STAT_CLEAR_MASK                    0x1
+#define MT6685_BBPU_2SEC_STAT_CLEAR_SHIFT                   3
+#define MT6685_BBPU_2SEC_STAT_STA_ADDR                      \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_BBPU_2SEC_STAT_STA_MASK                      0x1
+#define MT6685_BBPU_2SEC_STAT_STA_SHIFT                     4
+#define MT6685_RTC_LPD_OPT_ADDR                             \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_RTC_LPD_OPT_MASK                             0x3
+#define MT6685_RTC_LPD_OPT_SHIFT                            5
+#define MT6685_K_EOSC32_VTCXO_ON_SEL_ADDR                   \
+	MT6685_RTC_AL_SEC_H
+#define MT6685_K_EOSC32_VTCXO_ON_SEL_MASK                   0x1
+#define MT6685_K_EOSC32_VTCXO_ON_SEL_SHIFT                  7
+#define MT6685_AL_MINUTE_ADDR                               \
+	MT6685_RTC_AL_MIN
+#define MT6685_AL_MINUTE_MASK                               0x3F
+#define MT6685_AL_MINUTE_SHIFT                              0
+#define MT6685_AL_HOUR_ADDR                                 \
+	MT6685_RTC_AL_HOU_L
+#define MT6685_AL_HOUR_MASK                                 0x1F
+#define MT6685_AL_HOUR_SHIFT                                0
+#define MT6685_NEW_SPARE0_ADDR                              \
+	MT6685_RTC_AL_HOU_H
+#define MT6685_NEW_SPARE0_MASK                              0xFF
+#define MT6685_NEW_SPARE0_SHIFT                             0
+#define MT6685_AL_DOM_ADDR                                  \
+	MT6685_RTC_AL_DOM_L
+#define MT6685_AL_DOM_MASK                                  0x1F
+#define MT6685_AL_DOM_SHIFT                                 0
+#define MT6685_NEW_SPARE1_ADDR                              \
+	MT6685_RTC_AL_DOM_H
+#define MT6685_NEW_SPARE1_MASK                              0xFF
+#define MT6685_NEW_SPARE1_SHIFT                             0
+#define MT6685_AL_DOW_ADDR                                  \
+	MT6685_RTC_AL_DOW_L
+#define MT6685_AL_DOW_MASK                                  0x7
+#define MT6685_AL_DOW_SHIFT                                 0
+#define MT6685_RG_EOSC_CALI_TD_ADDR                         \
+	MT6685_RTC_AL_DOW_L
+#define MT6685_RG_EOSC_CALI_TD_MASK                         0x7
+#define MT6685_RG_EOSC_CALI_TD_SHIFT                        5
+#define MT6685_NEW_SPARE2_ADDR                              \
+	MT6685_RTC_AL_DOW_H
+#define MT6685_NEW_SPARE2_MASK                              0xFF
+#define MT6685_NEW_SPARE2_SHIFT                             0
+#define MT6685_AL_MONTH_ADDR                                \
+	MT6685_RTC_AL_MTH_L
+#define MT6685_AL_MONTH_MASK                                0xF
+#define MT6685_AL_MONTH_SHIFT                               0
+#define MT6685_NEW_SPARE3_ADDR                              \
+	MT6685_RTC_AL_MTH_H
+#define MT6685_NEW_SPARE3_MASK                              0xFF
+#define MT6685_NEW_SPARE3_SHIFT                             0
+#define MT6685_AL_YEAR_ADDR                                 \
+	MT6685_RTC_AL_YEA_L
+#define MT6685_AL_YEAR_MASK                                 0x7F
+#define MT6685_AL_YEAR_SHIFT                                0
+#define MT6685_RTC_K_EOSC_RSV_ADDR                          \
+	MT6685_RTC_AL_YEA_H
+#define MT6685_RTC_K_EOSC_RSV_MASK                          0xFF
+#define MT6685_RTC_K_EOSC_RSV_SHIFT                         0
+#define MT6685_XOSCCALI_ADDR                                \
+	MT6685_RTC_OSC32CON_L
+#define MT6685_XOSCCALI_MASK                                0x1F
+#define MT6685_XOSCCALI_SHIFT                               0
+#define MT6685_RTC_XOSC32_ENB_ADDR                          \
+	MT6685_RTC_OSC32CON_L
+#define MT6685_RTC_XOSC32_ENB_MASK                          0x1
+#define MT6685_RTC_XOSC32_ENB_SHIFT                         5
+#define MT6685_RTC_EMBCK_SEL_MODE_ADDR                      \
+	MT6685_RTC_OSC32CON_L
+#define MT6685_RTC_EMBCK_SEL_MODE_MASK                      0x3
+#define MT6685_RTC_EMBCK_SEL_MODE_SHIFT                     6
+#define MT6685_RTC_EMBCK_SRC_SEL_ADDR                       \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_EMBCK_SRC_SEL_MASK                       0x1
+#define MT6685_RTC_EMBCK_SRC_SEL_SHIFT                      0
+#define MT6685_RTC_EMBCK_SEL_OPTION_ADDR                    \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_EMBCK_SEL_OPTION_MASK                    0x1
+#define MT6685_RTC_EMBCK_SEL_OPTION_SHIFT                   1
+#define MT6685_RTC_GPS_CKOUT_EN_ADDR                        \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_GPS_CKOUT_EN_MASK                        0x1
+#define MT6685_RTC_GPS_CKOUT_EN_SHIFT                       2
+#define MT6685_RTC_EOSC32_VCT_EN_ADDR                       \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_EOSC32_VCT_EN_MASK                       0x1
+#define MT6685_RTC_EOSC32_VCT_EN_SHIFT                      3
+#define MT6685_RTC_EOSC32_CHOP_EN_ADDR                      \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_EOSC32_CHOP_EN_MASK                      0x1
+#define MT6685_RTC_EOSC32_CHOP_EN_SHIFT                     4
+#define MT6685_RTC_GP_OSC32_CON_ADDR                        \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_GP_OSC32_CON_MASK                        0x3
+#define MT6685_RTC_GP_OSC32_CON_SHIFT                       5
+#define MT6685_RTC_REG_XOSC32_ENB_ADDR                      \
+	MT6685_RTC_OSC32CON_H
+#define MT6685_RTC_REG_XOSC32_ENB_MASK                      0x1
+#define MT6685_RTC_REG_XOSC32_ENB_SHIFT                     7
+#define MT6685_RTC_POWERKEY1_L_ADDR                         \
+	MT6685_RTC_POWERKEY1_L
+#define MT6685_RTC_POWERKEY1_L_MASK                         0xFF
+#define MT6685_RTC_POWERKEY1_L_SHIFT                        0
+#define MT6685_RTC_POWERKEY1_H_ADDR                         \
+	MT6685_RTC_POWERKEY1_H
+#define MT6685_RTC_POWERKEY1_H_MASK                         0xFF
+#define MT6685_RTC_POWERKEY1_H_SHIFT                        0
+#define MT6685_RTC_POWERKEY2_L_ADDR                         \
+	MT6685_RTC_POWERKEY2_L
+#define MT6685_RTC_POWERKEY2_L_MASK                         0xFF
+#define MT6685_RTC_POWERKEY2_L_SHIFT                        0
+#define MT6685_RTC_POWERKEY2_H_ADDR                         \
+	MT6685_RTC_POWERKEY2_H
+#define MT6685_RTC_POWERKEY2_H_MASK                         0xFF
+#define MT6685_RTC_POWERKEY2_H_SHIFT                        0
+#define MT6685_RTC_PDN1_L_ADDR                              \
+	MT6685_RTC_PDN1_L
+#define MT6685_RTC_PDN1_L_MASK                              0xFF
+#define MT6685_RTC_PDN1_L_SHIFT                             0
+#define MT6685_RTC_PDN1_H_ADDR                              \
+	MT6685_RTC_PDN1_H
+#define MT6685_RTC_PDN1_H_MASK                              0xFF
+#define MT6685_RTC_PDN1_H_SHIFT                             0
+#define MT6685_RTC_PDN2_L_ADDR                              \
+	MT6685_RTC_PDN2_L
+#define MT6685_RTC_PDN2_L_MASK                              0xFF
+#define MT6685_RTC_PDN2_L_SHIFT                             0
+#define MT6685_RTC_PDN2_H_ADDR                              \
+	MT6685_RTC_PDN2_H
+#define MT6685_RTC_PDN2_H_MASK                              0xFF
+#define MT6685_RTC_PDN2_H_SHIFT                             0
+#define MT6685_RTC_SPAR0_L_ADDR                             \
+	MT6685_RTC_SPAR0_L
+#define MT6685_RTC_SPAR0_L_MASK                             0xFF
+#define MT6685_RTC_SPAR0_L_SHIFT                            0
+#define MT6685_RTC_SPAR0_H_ADDR                             \
+	MT6685_RTC_SPAR0_H
+#define MT6685_RTC_SPAR0_H_MASK                             0xFF
+#define MT6685_RTC_SPAR0_H_SHIFT                            0
+#define MT6685_RTC_SPAR1_L_ADDR                             \
+	MT6685_RTC_SPAR1_L
+#define MT6685_RTC_SPAR1_L_MASK                             0xFF
+#define MT6685_RTC_SPAR1_L_SHIFT                            0
+#define MT6685_RTC_SPAR1_H_ADDR                             \
+	MT6685_RTC_SPAR1_H
+#define MT6685_RTC_SPAR1_H_MASK                             0xFF
+#define MT6685_RTC_SPAR1_H_SHIFT                            0
+#define MT6685_RTC_PROT_L_ADDR                              \
+	MT6685_RTC_PROT_L
+#define MT6685_RTC_PROT_L_MASK                              0xFF
+#define MT6685_RTC_PROT_L_SHIFT                             0
+#define MT6685_RTC_PROT_H_ADDR                              \
+	MT6685_RTC_PROT_H
+#define MT6685_RTC_PROT_H_MASK                              0xFF
+#define MT6685_RTC_PROT_H_SHIFT                             0
+#define MT6685_RTC_DIFF_L_ADDR                              \
+	MT6685_RTC_DIFF_L
+#define MT6685_RTC_DIFF_L_MASK                              0xFF
+#define MT6685_RTC_DIFF_L_SHIFT                             0
+#define MT6685_RTC_DIFF_H_ADDR                              \
+	MT6685_RTC_DIFF_H
+#define MT6685_RTC_DIFF_H_MASK                              0xF
+#define MT6685_RTC_DIFF_H_SHIFT                             0
+#define MT6685_POWER_DETECTED_ADDR                          \
+	MT6685_RTC_DIFF_H
+#define MT6685_POWER_DETECTED_MASK                          0x1
+#define MT6685_POWER_DETECTED_SHIFT                         4
+#define MT6685_K_EOSC32_RSV_ADDR                            \
+	MT6685_RTC_DIFF_H
+#define MT6685_K_EOSC32_RSV_MASK                            0x1
+#define MT6685_K_EOSC32_RSV_SHIFT                           6
+#define MT6685_CALI_RD_SEL_ADDR                             \
+	MT6685_RTC_DIFF_H
+#define MT6685_CALI_RD_SEL_MASK                             0x1
+#define MT6685_CALI_RD_SEL_SHIFT                            7
+#define MT6685_RTC_CALI_L_ADDR                              \
+	MT6685_RTC_CALI_L
+#define MT6685_RTC_CALI_L_MASK                              0xFF
+#define MT6685_RTC_CALI_L_SHIFT                             0
+#define MT6685_RTC_CALI_H_ADDR                              \
+	MT6685_RTC_CALI_H
+#define MT6685_RTC_CALI_H_MASK                              0x3F
+#define MT6685_RTC_CALI_H_SHIFT                             0
+#define MT6685_CALI_WR_SEL_ADDR                             \
+	MT6685_RTC_CALI_H
+#define MT6685_CALI_WR_SEL_MASK                             0x1
+#define MT6685_CALI_WR_SEL_SHIFT                            6
+#define MT6685_K_EOSC32_OVERFLOW_ADDR                       \
+	MT6685_RTC_CALI_H
+#define MT6685_K_EOSC32_OVERFLOW_MASK                       0x1
+#define MT6685_K_EOSC32_OVERFLOW_SHIFT                      7
+#define MT6685_WRTGR_ADDR                                   \
+	MT6685_RTC_WRTGR
+#define MT6685_WRTGR_MASK                                   0x1
+#define MT6685_WRTGR_SHIFT                                  0
+#define MT6685_VBAT_LPSTA_RAW_ADDR                          \
+	MT6685_RTC_CON_L
+#define MT6685_VBAT_LPSTA_RAW_MASK                          0x1
+#define MT6685_VBAT_LPSTA_RAW_SHIFT                         0
+#define MT6685_EOSC32_LPEN_ADDR                             \
+	MT6685_RTC_CON_L
+#define MT6685_EOSC32_LPEN_MASK                             0x1
+#define MT6685_EOSC32_LPEN_SHIFT                            1
+#define MT6685_XOSC32_LPEN_ADDR                             \
+	MT6685_RTC_CON_L
+#define MT6685_XOSC32_LPEN_MASK                             0x1
+#define MT6685_XOSC32_LPEN_SHIFT                            2
+#define MT6685_LPRST_ADDR                                   \
+	MT6685_RTC_CON_L
+#define MT6685_LPRST_MASK                                   0x1
+#define MT6685_LPRST_SHIFT                                  3
+#define MT6685_CDBO_ADDR                                    \
+	MT6685_RTC_CON_L
+#define MT6685_CDBO_MASK                                    0x1
+#define MT6685_CDBO_SHIFT                                   4
+#define MT6685_F32KOB_ADDR                                  \
+	MT6685_RTC_CON_L
+#define MT6685_F32KOB_MASK                                  0x1
+#define MT6685_F32KOB_SHIFT                                 5
+#define MT6685_GPO_ADDR                                     \
+	MT6685_RTC_CON_L
+#define MT6685_GPO_MASK                                     0x1
+#define MT6685_GPO_SHIFT                                    6
+#define MT6685_GOE_ADDR                                     \
+	MT6685_RTC_CON_L
+#define MT6685_GOE_MASK                                     0x1
+#define MT6685_GOE_SHIFT                                    7
+#define MT6685_GSR_ADDR                                     \
+	MT6685_RTC_CON_H
+#define MT6685_GSR_MASK                                     0x1
+#define MT6685_GSR_SHIFT                                    0
+#define MT6685_GSMT_ADDR                                    \
+	MT6685_RTC_CON_H
+#define MT6685_GSMT_MASK                                    0x1
+#define MT6685_GSMT_SHIFT                                   1
+#define MT6685_GPEN_ADDR                                    \
+	MT6685_RTC_CON_H
+#define MT6685_GPEN_MASK                                    0x1
+#define MT6685_GPEN_SHIFT                                   2
+#define MT6685_GPU_ADDR                                     \
+	MT6685_RTC_CON_H
+#define MT6685_GPU_MASK                                     0x1
+#define MT6685_GPU_SHIFT                                    3
+#define MT6685_GE4_ADDR                                     \
+	MT6685_RTC_CON_H
+#define MT6685_GE4_MASK                                     0x1
+#define MT6685_GE4_SHIFT                                    4
+#define MT6685_GE8_ADDR                                     \
+	MT6685_RTC_CON_H
+#define MT6685_GE8_MASK                                     0x1
+#define MT6685_GE8_SHIFT                                    5
+#define MT6685_GPI_ADDR                                     \
+	MT6685_RTC_CON_H
+#define MT6685_GPI_MASK                                     0x1
+#define MT6685_GPI_SHIFT                                    6
+#define MT6685_LPSTA_RAW_ADDR                               \
+	MT6685_RTC_CON_H
+#define MT6685_LPSTA_RAW_MASK                               0x1
+#define MT6685_LPSTA_RAW_SHIFT                              7
+#define MT6685_DAT0_LOCK_ADDR                               \
+	MT6685_RTC_SEC_CTRL
+#define MT6685_DAT0_LOCK_MASK                               0x1
+#define MT6685_DAT0_LOCK_SHIFT                              0
+#define MT6685_DAT1_LOCK_ADDR                               \
+	MT6685_RTC_SEC_CTRL
+#define MT6685_DAT1_LOCK_MASK                               0x1
+#define MT6685_DAT1_LOCK_SHIFT                              1
+#define MT6685_DAT2_LOCK_ADDR                               \
+	MT6685_RTC_SEC_CTRL
+#define MT6685_DAT2_LOCK_MASK                               0x1
+#define MT6685_DAT2_LOCK_SHIFT                              2
+#define MT6685_RTC_INT_CNT_L_ADDR                           \
+	MT6685_RTC_INT_CNT_L
+#define MT6685_RTC_INT_CNT_L_MASK                           0xFF
+#define MT6685_RTC_INT_CNT_L_SHIFT                          0
+#define MT6685_RTC_INT_CNT_H_ADDR                           \
+	MT6685_RTC_INT_CNT_H
+#define MT6685_RTC_INT_CNT_H_MASK                           0x7F
+#define MT6685_RTC_INT_CNT_H_SHIFT                          0
+#define MT6685_RTC_SEC_DAT0_L_ADDR                          \
+	MT6685_RTC_SEC_DAT0_L
+#define MT6685_RTC_SEC_DAT0_L_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT0_L_SHIFT                         0
+#define MT6685_RTC_SEC_DAT0_H_ADDR                          \
+	MT6685_RTC_SEC_DAT0_H
+#define MT6685_RTC_SEC_DAT0_H_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT0_H_SHIFT                         0
+#define MT6685_RTC_SEC_DAT1_L_ADDR                          \
+	MT6685_RTC_SEC_DAT1_L
+#define MT6685_RTC_SEC_DAT1_L_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT1_L_SHIFT                         0
+#define MT6685_RTC_SEC_DAT1_H_ADDR                          \
+	MT6685_RTC_SEC_DAT1_H
+#define MT6685_RTC_SEC_DAT1_H_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT1_H_SHIFT                         0
+#define MT6685_RTC_SEC_DAT2_L_ADDR                          \
+	MT6685_RTC_SEC_DAT2_L
+#define MT6685_RTC_SEC_DAT2_L_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT2_L_SHIFT                         0
+#define MT6685_RTC_SEC_DAT2_H_ADDR                          \
+	MT6685_RTC_SEC_DAT2_H
+#define MT6685_RTC_SEC_DAT2_H_MASK                          0xFF
+#define MT6685_RTC_SEC_DAT2_H_SHIFT                         0
+#define MT6685_RTC_RG_FG0_ADDR                              \
+	MT6685_RTC_RG_FG0
+#define MT6685_RTC_RG_FG0_MASK                              0xFF
+#define MT6685_RTC_RG_FG0_SHIFT                             0
+#define MT6685_RTC_RG_FG1_ADDR                              \
+	MT6685_RTC_RG_FG1
+#define MT6685_RTC_RG_FG1_MASK                              0xFF
+#define MT6685_RTC_RG_FG1_SHIFT                             0
+#define MT6685_RTC_RG_FG2_ADDR                              \
+	MT6685_RTC_RG_FG2
+#define MT6685_RTC_RG_FG2_MASK                              0xFF
+#define MT6685_RTC_RG_FG2_SHIFT                             0
+#define MT6685_RTC_RG_FG3_ADDR                              \
+	MT6685_RTC_RG_FG3
+#define MT6685_RTC_RG_FG3_MASK                              0xFF
+#define MT6685_RTC_RG_FG3_SHIFT                             0
+#define MT6685_RTC_UVLO_WAIT_ADDR                           \
+	MT6685_RTC_SPAR_MACRO
+#define MT6685_RTC_UVLO_WAIT_MASK                           0x3
+#define MT6685_RTC_UVLO_WAIT_SHIFT                          0
+#define MT6685_RTC_SPAR_THRE_SEL_ADDR                       \
+	MT6685_RTC_SPAR_MACRO
+#define MT6685_RTC_SPAR_THRE_SEL_MASK                       0x1
+#define MT6685_RTC_SPAR_THRE_SEL_SHIFT                      2
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_LPD_ADDR               \
+	MT6685_RTC_SPAR_MACRO
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_LPD_MASK               0x1
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_LPD_SHIFT              4
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_ADDR                   \
+	MT6685_RTC_SPAR_MACRO
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_MASK                   0x1
+#define MT6685_RTC_SPAR_PWRKEY_MATCH_SHIFT                  5
+#define MT6685_SPAR_PROT_STAT_ADDR                          \
+	MT6685_RTC_SPAR_MACRO
+#define MT6685_RTC_SPAR_PROT_STAT_MASK                      0x3
+#define MT6685_RTC_SPAR_PROT_STAT_SHIFT                     6
+#define MT6685_RTC_SPAR_CORE_ADDR                           \
+	MT6685_RTC_SPAR_CORE
+#define MT6685_RTC_SPAR_CORE_MASK                           0xFF
+#define MT6685_RTC_SPAR_CORE_SHIFT                          0
+#define MT6685_RTC_RG_EOSC_CALI_ADDR                        \
+	MT6685_RTC_EOSC_CALI
+#define MT6685_RTC_RG_EOSC_CALI_MASK                        0x1F
+#define MT6685_RTC_RG_EOSC_CALI_SHIFT                       0
+#define MT6685_RTC_SEC_ANA_ID_ADDR                          \
+	MT6685_RTC_SEC_ANA_ID
+#define MT6685_RTC_SEC_ANA_ID_MASK                          0xFF
+#define MT6685_RTC_SEC_ANA_ID_SHIFT                         0
+#define MT6685_RTC_SEC_DIG_ID_ADDR                          \
+	MT6685_RTC_SEC_DIG_ID
+#define MT6685_RTC_SEC_DIG_ID_MASK                          0xFF
+#define MT6685_RTC_SEC_DIG_ID_SHIFT                         0
+#define MT6685_RTC_SEC_ANA_MINOR_REV_ADDR                   \
+	MT6685_RTC_SEC_ANA_REV
+#define MT6685_RTC_SEC_ANA_MINOR_REV_MASK                   0xF
+#define MT6685_RTC_SEC_ANA_MINOR_REV_SHIFT                  0
+#define MT6685_RTC_SEC_ANA_MAJOR_REV_ADDR                   \
+	MT6685_RTC_SEC_ANA_REV
+#define MT6685_RTC_SEC_ANA_MAJOR_REV_MASK                   0xF
+#define MT6685_RTC_SEC_ANA_MAJOR_REV_SHIFT                  4
+#define MT6685_RTC_SEC_DIG_MINOR_REV_ADDR                   \
+	MT6685_RTC_SEC_DIG_REV
+#define MT6685_RTC_SEC_DIG_MINOR_REV_MASK                   0xF
+#define MT6685_RTC_SEC_DIG_MINOR_REV_SHIFT                  0
+#define MT6685_RTC_SEC_DIG_MAJOR_REV_ADDR                   \
+	MT6685_RTC_SEC_DIG_REV
+#define MT6685_RTC_SEC_DIG_MAJOR_REV_MASK                   0xF
+#define MT6685_RTC_SEC_DIG_MAJOR_REV_SHIFT                  4
+#define MT6685_RTC_SEC_CBS_ADDR                             \
+	MT6685_RTC_SEC_DBI
+#define MT6685_RTC_SEC_CBS_MASK                             0x3
+#define MT6685_RTC_SEC_CBS_SHIFT                            0
+#define MT6685_RTC_SEC_BIX_ADDR                             \
+	MT6685_RTC_SEC_DBI
+#define MT6685_RTC_SEC_BIX_MASK                             0x3
+#define MT6685_RTC_SEC_BIX_SHIFT                            2
+#define MT6685_RTC_SEC_ESP_ADDR                             \
+	MT6685_RTC_SEC_ESP
+#define MT6685_RTC_SEC_ESP_MASK                             0xFF
+#define MT6685_RTC_SEC_ESP_SHIFT                            0
+#define MT6685_RTC_SEC_FPI_ADDR                             \
+	MT6685_RTC_SEC_FPI
+#define MT6685_RTC_SEC_FPI_MASK                             0xFF
+#define MT6685_RTC_SEC_FPI_SHIFT                            0
+#define MT6685_RTC_SEC_DXI_ADDR                             \
+	MT6685_RTC_SEC_DXI
+#define MT6685_RTC_SEC_DXI_MASK                             0xFF
+#define MT6685_RTC_SEC_DXI_SHIFT                            0
+#define MT6685_TC_SECOND_SEC_ADDR                           \
+	MT6685_RTC_TC_SEC_SEC
+#define MT6685_TC_SECOND_SEC_MASK                           0x3F
+#define MT6685_TC_SECOND_SEC_SHIFT                          0
+#define MT6685_TC_MINUTE_SEC_ADDR                           \
+	MT6685_RTC_TC_MIN_SEC
+#define MT6685_TC_MINUTE_SEC_MASK                           0x3F
+#define MT6685_TC_MINUTE_SEC_SHIFT                          0
+#define MT6685_TC_HOUR_SEC_ADDR                             \
+	MT6685_RTC_TC_HOU_SEC
+#define MT6685_TC_HOUR_SEC_MASK                             0x1F
+#define MT6685_TC_HOUR_SEC_SHIFT                            0
+#define MT6685_TC_DOM_SEC_ADDR                              \
+	MT6685_RTC_TC_DOM_SEC
+#define MT6685_TC_DOM_SEC_MASK                              0x1F
+#define MT6685_TC_DOM_SEC_SHIFT                             0
+#define MT6685_TC_DOW_SEC_ADDR                              \
+	MT6685_RTC_TC_DOW_SEC
+#define MT6685_TC_DOW_SEC_MASK                              0x7
+#define MT6685_TC_DOW_SEC_SHIFT                             0
+#define MT6685_TC_MONTH_SEC_ADDR                            \
+	MT6685_RTC_TC_MTH_SEC
+#define MT6685_TC_MONTH_SEC_MASK                            0xF
+#define MT6685_TC_MONTH_SEC_SHIFT                           0
+#define MT6685_TC_YEAR_SEC_ADDR                             \
+	MT6685_RTC_TC_YEA_SEC
+#define MT6685_TC_YEAR_SEC_MASK                             0x7F
+#define MT6685_TC_YEAR_SEC_SHIFT                            0
+#define MT6685_RTC_SEC_CK_PDN_ADDR                          \
+	MT6685_RTC_SEC_CK_PDN
+#define MT6685_RTC_SEC_CK_PDN_MASK                          0x1
+#define MT6685_RTC_SEC_CK_PDN_SHIFT                         0
+#define MT6685_RTC_SEC_WRTGR_ADDR                           \
+	MT6685_RTC_SEC_WRTGR
+#define MT6685_RTC_SEC_WRTGR_MASK                           0x1
+#define MT6685_RTC_SEC_WRTGR_SHIFT                          0
+#define MT6685_XO_EN32K_MAN_ADDR                            \
+	MT6685_DCXO_DIG_MODE_CW0
+#define MT6685_XO_EN32K_MAN_MASK                            0x1
+#define MT6685_XO_EN32K_MAN_SHIFT                           1
+#define MT6685_RG_INT_EN_RTC_ADDR                           \
+	MT6685_SCK_TOP_INT_CON0
+#define MT6685_RG_INT_EN_RTC_MASK                           0x1
+#define MT6685_RG_INT_EN_RTC_SHIFT                          0
+
+#endif		/* _MT6685_HW_H_ */
diff --git a/include/linux/mfd/mt6685/rtc.h b/include/linux/mfd/mt6685/rtc.h
new file mode 100644
index 000000000000..cb5b62a717d5
--- /dev/null
+++ b/include/linux/mfd/mt6685/rtc.h
@@ -0,0 +1,318 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MT6685_RTC_H__
+#define __MT6685_RTC_H__
+
+#include <linux/mfd/mt6685/registers.h>
+
+/*features*/
+#define SUPPORT_PWR_OFF_ALARM
+
+#define HWID                    MT6685_HWCID_L
+
+/* we map HW YEA 0 (2000) to 1968 not 1970 because 2000 is the leap year */
+#define RTC_MIN_YEAR            1968
+#define RTC_BASE_YEAR           1900
+#define RTC_NUM_YEARS           128
+#define RTC_MIN_YEAR_OFFSET     (RTC_MIN_YEAR - RTC_BASE_YEAR)
+
+#define RTC_TC_SEC                      0x12
+#define RTC_TC_MIN                      0x14
+#define RTC_TC_HOU                      0x16
+#define RTC_TC_DOM                      0x18
+#define RTC_TC_DOW                      0x1A
+#define RTC_TC_MTH                      0x1C
+#define RTC_TC_YEA                      0x1E
+/* Min, Hour, Dom... register offset to RTC_TC_SEC */
+#define RTC_OFFSET_SEC                  0
+#define RTC_OFFSET_MIN                  1
+#define RTC_OFFSET_HOUR                 2
+#define RTC_OFFSET_DOM                  3
+#define RTC_OFFSET_DOW                  4
+#define RTC_OFFSET_MTH                  5
+#define RTC_OFFSET_YEAR                 6
+#define RTC_OFFSET_COUNT                7
+
+#define RTC_DSN_ID                      0x580
+
+#define DCXO_ANA_ID                     0x200
+
+#define RTC_BBPU                        0x8
+#define RTC_WRTGR_MT6685                0x42
+#define RTC_IRQ_STA                     0xa
+#define RTC_IRQ_EN                      0xc
+#define RTC_AL_MASK                     0x10
+
+#define RTC_AL_SEC                      0x20
+#define RTC_AL_MIN                      0x22
+#define RTC_AL_HOU                      0x24
+#define RTC_AL_HOU_H                    0x25
+#define RTC_AL_DOM                      0x26
+#define RTC_AL_DOW                      0x28
+#define RTC_AL_DOW_H                    0x29
+#define RTC_AL_MTH                      0x2a
+#define RTC_AL_MTH_H                    0x2b
+#define RTC_AL_YEA                      0x2c
+#define RTC_AL_YEA_H                    0x2d
+#define RTC_OSC32CON                    0x2e
+#define RTC_POWERKEY1                   0x30
+#define RTC_POWERKEY2                   0x32
+#define RTC_PDN1                        0x34
+#define RTC_PDN1_H                      0x35
+#define RTC_PDN2                        0x36
+#define RTC_SPAR0                       0x38
+#define RTC_SPAR1                       0x3a
+#define RTC_PROT                        0x3c
+#define RTC_WRTGR                       0x42
+#define RTC_CON                         0x44
+#define RTC_INT_CNT_L                   0x48
+#define RTC_SPAR_MACRO                  0x58
+
+#define RTC_TC_SEC_MASK                 0x3f
+#define RTC_TC_MIN_MASK                 0x3f
+#define RTC_TC_HOU_MASK                 0x1f
+#define RTC_TC_DOM_MASK                 0x1f
+#define RTC_TC_DOW_MASK                 0x7
+#define RTC_TC_MTH_MASK                 0xf
+#define RTC_TC_YEA_MASK                 0x7f
+
+#define RTC_AL_SEC_MASK                 0x3f
+#define RTC_AL_MIN_MASK                 0x3f
+#define RTC_AL_HOU_MASK                 0x1f
+#define RTC_AL_DOM_MASK                 0x1f
+#define RTC_AL_DOW_MASK                 0x7
+#define RTC_AL_MTH_MASK                 0xf
+#define RTC_AL_YEA_MASK                 0x7f
+
+#define RTC_PWRON_YEA                   RTC_PDN2
+#define RTC_PWRON_MTH                   RTC_PDN2
+#define RTC_PWRON_SEC                   RTC_SPAR0
+#define RTC_PWRON_MIN                   RTC_SPAR1
+#define RTC_PWRON_HOU                   RTC_SPAR1
+#define RTC_PWRON_DOM                   RTC_SPAR1
+
+#define RTC_PWRON_SEC_SHIFT             0x0
+#define RTC_PWRON_MIN_SHIFT             0x0
+#define RTC_PWRON_HOU_SHIFT             0x6
+#define RTC_PWRON_DOM_SHIFT             0xb
+#define RTC_PWRON_MTH_SHIFT             0x0
+#define RTC_PWRON_YEA_SHIFT             0x8
+
+#define RTC_PWRON_SEC_MASK              (RTC_AL_SEC_MASK << RTC_PWRON_SEC_SHIFT)
+#define RTC_PWRON_MIN_MASK              (RTC_AL_MIN_MASK << RTC_PWRON_MIN_SHIFT)
+#define RTC_PWRON_HOU_MASK              (RTC_AL_HOU_MASK << RTC_PWRON_HOU_SHIFT)
+#define RTC_PWRON_DOM_MASK              (RTC_AL_DOM_MASK << RTC_PWRON_DOM_SHIFT)
+#define RTC_PWRON_MTH_MASK              (RTC_AL_MTH_MASK << RTC_PWRON_MTH_SHIFT)
+#define RTC_PWRON_YEA_MASK              (RTC_AL_YEA_MASK << RTC_PWRON_YEA_SHIFT)
+
+#define RTC_BBPU_KEY                    0x4300
+#define RTC_BBPU_CBUSY                  BIT(6)
+#define RTC_BBPU_RELOAD                 BIT(5)
+#define RTC_BBPU_AUTO                   BIT(3)
+#define RTC_BBPU_CLR                    BIT(1)
+#define RTC_BBPU_PWREN                  BIT(0)
+#define RTC_BBPU_AL_STA                 BIT(7)
+#define RTC_BBPU_RESET_AL               BIT(3)
+#define RTC_BBPU_RESET_SPAR             BIT(2)
+
+#define RTC_AL_MASK_DOW                 BIT(4)
+
+#define RTC_IRQ_EN_LP                   BIT(3)
+#define RTC_IRQ_EN_ONESHOT              BIT(2)
+#define RTC_IRQ_EN_AL                   BIT(0)
+#define RTC_IRQ_EN_ONESHOT_AL           (RTC_IRQ_EN_ONESHOT | RTC_IRQ_EN_AL)
+
+#define RTC_IRQ_STA_LP                  BIT(3)
+#define RTC_IRQ_STA_AL                  BIT(0)
+
+#define RTC_PDN1_PWRON_TIME             BIT(7)
+#define RTC_PDN2_PWRON_LOGO             BIT(15)
+#define RTC_PDN2_PWRON_ALARM            BIT(4)
+
+#define RTC_RG_FG2                      0x54
+#define RTC_RG_FG3                      0x56
+
+#define EOSC_CALI_TD_MT6685				0x29
+#define EOSC_CALI_TD_MASK               0x3
+
+#define HWID_MT6685				        0x8
+
+#define TOP_RTC_EOSC32_CK_PDN           MT6685_SCK_TOP_CKPDN_CON0_L
+#define TOP_RTC_EOSC32_CK_PDN_MASK      (MT6685_RG_RTC_EOSC32_CK_PDN_MASK \
+						<< MT6685_RG_RTC_EOSC32_CK_PDN_SHIFT)
+
+#define TOP_DIG_WPK                     MT6685_TOP_DIG_WPK
+#define DIG_WPK_KEY_MASK        (MT6685_DIG_WPK_KEY_MASK << MT6685_DIG_WPK_KEY_SHIFT)
+
+#define TOP_DIG_WPK_H                   MT6685_TOP_DIG_WPK_H
+#define DIG_WPK_KEY_H_MASK      (MT6685_DIG_WPK_KEY_H_MASK << MT6685_DIG_WPK_KEY_H_SHIFT)
+
+#define RG_RTC_MCLK_PDN                 MT6685_SCK_TOP_CKPDN_CON0_L
+#define RG_RTC_MCLK_PDN_STA_MASK        MT6685_RG_RTC_MCLK_PDN_MASK
+#define RG_RTC_MCLK_PDN_STA_SHIFT       MT6685_RG_RTC_MCLK_PDN_SHIFT
+
+#define RG_RTC_MCLK_PDN_SET             MT6685_SCK_TOP_CKPDN_CON0_L_SET
+#define RG_RTC_MCLK_PDN_CLR             MT6685_SCK_TOP_CKPDN_CON0_L_CLR
+#define RG_RTC_MCLK_PDN_MASK    (MT6685_RG_RTC_MCLK_PDN_MASK << MT6685_RG_RTC_MCLK_PDN_SHIFT)
+
+#define RG_RTC_32K_CK_PDN_SET             MT6685_SCK_TOP_CKPDN_CON0_L_SET
+#define RG_RTC_32K_CK_PDN_CLR             MT6685_SCK_TOP_CKPDN_CON0_L_CLR
+#define RG_RTC_32K_CK_PDN_MASK   (MT6685_RG_RTC_32K_CK_PDN_MASK << MT6685_RG_RTC_32K_CK_PDN_SHIFT)
+
+#define SPAR_PROT_STAT_MASK             MT6685_RTC_SPAR_PROT_STAT_MASK
+#define SPAR_PROT_STAT_SHIFT            MT6685_RTC_SPAR_PROT_STAT_SHIFT
+
+/*SCK_TOP rtc interrupt*/
+#define SCK_TOP_INT_CON0                MT6685_SCK_TOP_INT_CON0
+#define EN_RTC_INTERRUPT                MT6685_RG_INT_EN_RTC_MASK
+#define SCK_TOP_INT_STATUS0             MT6685_SCK_TOP_INT_STATUS0
+
+#define TOP2_ELR1                       MT6685_TOP2_ELR1
+#define TOP2_ELR1_MASK                  BIT(0)
+
+#define MTK_RTC_POLL_DELAY_US            10
+#define MTK_RTC_POLL_TIMEOUT             (jiffies_to_usecs(HZ))
+
+#define RTC_POFF_ALM_SET                 _IOW('p', 0x15, struct rtc_time) /* Set alarm time  */
+
+#define SPARE_REG_WIDTH                  1
+
+enum mtk_rtc_spare_enum {
+	SPARE_FG2,
+	SPARE_FG3,
+	SPARE_SPAR0,
+#ifdef SUPPORT_PWR_OFF_ALARM
+	SPARE_KPOC,
+#endif
+	SPARE_RG_MAX,
+};
+
+enum rtc_irq_sta {
+	RTC_NONE,
+	RTC_ALSTA,
+	RTC_TCSTA,
+	RTC_LPSTA,
+};
+
+enum rtc_reg_set {
+	RTC_REG,
+	RTC_MASK,
+	RTC_SHIFT
+};
+
+enum chip_version {
+	NULL_SERIES,
+	MT6685_SERIES,
+};
+
+#define EOSC_SOL_1      0x5
+#define EOSC_SOL_2      0x7
+
+enum rtc_eosc_cali_td {
+	EOSC_CALI_TD_01_SEC = 0x3,
+	EOSC_CALI_TD_02_SEC,
+	EOSC_CALI_TD_04_SEC,
+	EOSC_CALI_TD_08_SEC,
+	EOSC_CALI_TD_16_SEC,
+};
+
+enum cali_field_enum {
+	EOSC_CALI_TD,
+	CALI_FILED_MAX,
+};
+
+#ifdef SUPPORT_PWR_OFF_ALARM
+struct tag_bootmode {
+	u32 size;
+	u32 tag;
+	u32 bootmode;
+	u32 boottype;
+};
+
+enum boot_mode_t {
+	NORMAL_BOOT = 0,
+	META_BOOT = 1,
+	RECOVERY_BOOT = 2,
+	SW_REBOOT = 3,
+	FACTORY_BOOT = 4,
+	ADVMETA_BOOT = 5,
+	ATE_FACTORY_BOOT = 6,
+	ALARM_BOOT = 7,
+	KERNEL_POWER_OFF_CHARGING_BOOT = 8,
+	LOW_POWER_OFF_CHARGING_BOOT = 9,
+	DONGLE_BOOT = 10,
+	UNKNOWN_BOOT
+};
+#endif
+
+struct mtk_rtc_data {
+	u32         wrtgr;
+	u32         hwid;
+	u32			chip_version;
+	bool        single_read_write_is_supported;
+	const struct reg_field *spare_reg_fields;
+	const struct reg_field *cali_reg_fields;
+};
+
+static const char *rtc_time_reg_name[RTC_OFFSET_COUNT] = {
+	[0] = "SEC",
+	[1] = "MIN",
+	[2] = "HOUR",
+	[3] = "DOM",
+	[4] = "DOW",
+	[5] = "MTH",
+	[6] = "YEAR",
+};
+
+enum rtc_time_mask {
+	SEC_MASK,
+	MIN_MASK,
+	HOU_MASK,
+	DOM_MASK,
+	DOW_MASK,
+	MTH_MASK,
+	YEA_MASK,
+	MASK_COUNT
+
+};
+
+static char rtc_time_mask[MASK_COUNT] = {
+	[SEC_MASK] = 0x3f,
+	[MIN_MASK] = 0x3f,
+	[HOU_MASK] = 0x1f,
+	[DOM_MASK] = 0x1f,
+	[DOW_MASK] = 0x7,
+	[MTH_MASK] = 0xf,
+	[YEA_MASK] = 0x7f
+};
+
+struct mt6685_rtc {
+	struct rtc_device       *rtc_dev;
+
+	/* Protect register access from multiple tasks */
+	struct mutex            lock;
+	/**
+	 * struct mutex - Mutex for controlling access to the clock
+	 *
+	 * This mutex is used to synchronize access to the clock in the RTC driver.
+	 */
+	struct mutex            clk_lock;
+	struct regmap           *regmap;
+	struct regmap           *regmap_spar;
+	int                     irq;
+	u32                     addr_base;
+	const struct mtk_rtc_data *data;
+	bool                    cali_is_supported;
+#ifdef SUPPORT_PWR_OFF_ALARM
+	struct work_struct work;
+	struct completion comp;
+#if IS_ENABLED(CONFIG_PM)
+struct notifier_block pm_nb;
+#endif
+#endif
+};
+
+#endif /* __MT6685_RTC_H__ */
-- 
2.46.0


