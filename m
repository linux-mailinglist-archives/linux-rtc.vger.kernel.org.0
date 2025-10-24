Return-Path: <linux-rtc+bounces-5143-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C698C0524A
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BA3242375E
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E0D30E839;
	Fri, 24 Oct 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G0USCoXg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984130507B;
	Fri, 24 Oct 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294813; cv=none; b=nGYDOWt05N7xqDAOmwH/ShtqrTh0ajZVdLKNZX65GuRkosl5zn8shD56LjBi028Qi/WrhCqT+OTZIXloK/vwUPVycqcaC6fW3nqzHWngU9/nBpHSNbp1/GVyKLTa+JA9xLTyftHg+PVUWAbuqJofKkY2IXDAPWtUF4NAi1/kaws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294813; c=relaxed/simple;
	bh=tka2SvgXGZkC1/tSrX0XrtcfbAkqAvDWRfldZUFzQmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqA89ew1PtkTRFl8tZ+yrmtReoaq9Gnwd31k9CbG/pI2Zf8EDXTA3Uu8wu9GhhfUHTa+9Jxn3fYgBHczCprda3uuIhlJmlmS3ATvpe+2WrgB+dQc3bSA+rFiFowkxmWjYRy3oOIOr8tBiLzHw0rL1UzHs1AbPPfYO3Tr45csZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G0USCoXg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294809;
	bh=tka2SvgXGZkC1/tSrX0XrtcfbAkqAvDWRfldZUFzQmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0USCoXgMdScDG3b2URfaBBOtrb8u17Vt9f8h0WcnyU8WSmdNChb06Iz/KpOhTB5n
	 1+Yn3yBiIL6Ap+Ch1L5ZzLrQqUKZIoqJETr/eqRz/IUej2Eyn9QHgkkNjBk9rOd5FL
	 Jo3bEro+uNJi+c9jinWhMKCKS8hQnjW1y+VWEHSaEPfZtUxu1tHvBxIjJfBaogsSko
	 s0giOlvqb/2ISHR4sp9b0hjsvIkydb8J8PUrL9N7MM473FXVLcxZPG5YaffS2/Nlbe
	 XjB08VtktoFKC1qq1yF/Ju2gbdbB/GxOkbvXjOQxuv6ID1hZm2WYRLKLIyYo9qkNu0
	 Rcm+x/3mOhsBw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 156AF17E1315;
	Fri, 24 Oct 2025 10:33:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over SPMI
Date: Fri, 24 Oct 2025 10:33:18 +0200
Message-ID: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6685 Clock IC is connected over the SPMI bus and includes a
Real Time Clock (RTC) IP.

Like the IP found in the MT6323/57/58/97 PMICs, this RTC ranges
from year 1900 to 2027: for this reason, in this driver the start
date is set to 2/1/1968 instead, matching the intepretation that
is found in most MediaTek bootloaders (which, in too many cases,
cannot be replaced due to OEM signing) and in downstream drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rtc/Kconfig      |  12 +
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-mt6685.c | 472 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 485 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt6685.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c8..5d14948b3abc 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1937,6 +1937,18 @@ config RTC_DRV_MT6397
 
 	  If you want to use MediaTek(R) RTC interface, select Y or M here.
 
+config RTC_DRV_MT6685
+	tristate "MediaTek MT6685 Clock IC based RTC"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on SPMI
+	select IRQ_DOMAIN
+	help
+	  Say yes here to enable support for the Real Time Clock found
+	  in the MediaTek MT6685 Clock IC communicating over SPMI.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-mt6685.
+
 config RTC_DRV_MT7622
 	tristate "MediaTek SoC based RTC"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8221bda6e6dc..5ccfb1e02e51 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_RTC_DRV_SSD202D)	+= rtc-ssd202d.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
 obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
+obj-$(CONFIG_RTC_DRV_MT6685)	+= rtc-mt6685.o
 obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
 obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
diff --git a/drivers/rtc/rtc-mt6685.c b/drivers/rtc/rtc-mt6685.c
new file mode 100644
index 000000000000..3e632a3edbb6
--- /dev/null
+++ b/drivers/rtc/rtc-mt6685.c
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek MT6685 Clock IC - Real Time Clock IP driver
+ *
+ * Copyright (C) 2020 MediaTek Inc.
+ * Copyright (C) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/spmi.h>
+
+#define RTC_REG_BBPU			0x8
+#define  RTC_BBPU_PWREN			BIT(0)
+#define  RTC_BBPU_CLR			BIT(1)
+#define  RTC_BBPU_RESET_AL		BIT(3)
+#define  RTC_BBPU_RELOAD		BIT(5)
+#define  RTC_BBPU_CBUSY			BIT(6)
+#define  RTC_BBPU_WR_UNLOCK_KEY		0x4300
+
+#define RTC_REG_IRQ_STA			0xa
+#define RTC_REG_IRQ_EN			0xc
+#define  RTC_IRQ_AL			BIT(0)
+#define  RTC_IRQ_ONESHOT		BIT(2)
+#define  RTC_IRQ_LP			BIT(3)
+
+#define RTC_REG_AL_MASK			0x10
+#define  RTC_AL_MASK_DOW		BIT(4)
+
+#define RTC_REG_TC_SEC			0x12
+#define RTC_REG_AL_SEC			0x20
+#define  RTC_AL_TC_YEAR			GENMASK(6, 0)
+#define  RTC_AL_TC_SEC_MIN		GENMASK(5, 0)
+#define  RTC_AL_TC_HOUR_DOM		GENMASK(4, 0)
+#define  RTC_AL_TC_MON			GENMASK(3, 0)
+#define  RTC_AL_TC_DOW			GENMASK(2, 0)
+
+#define RTC_REG_PDN2			0x36
+#define  RTC_PDN2_PWRON_ALARM		BIT(4)
+
+#define MT6685_RTC_REG_WRTGR		0x42
+
+#define MT6685_RTC_POLL_DELAY_US	10
+#define MT6685_RTC_POLL_TIMEOUT_US	2500
+
+/**
+ * struct mt6885_rtc - Main driver structure
+ * @rdev:     Pointer to RTC device
+ * @regmap:   Regmap (SPMI) Handle
+ * @mclk:     RTC MCLK clock for register write
+ * @irq:      Alarm interrupt number
+ */
+struct mt6685_rtc {
+	struct rtc_device *rdev;
+	struct regmap *regmap;
+	struct clk *mclk;
+	int irq;
+};
+
+/* HW time registers index - please do *not* add or remove indices! */
+enum mt6685_timereg_index {
+	RTC_AL_TC_REGIDX_SEC,
+	RTC_AL_TC_REGIDX_MIN,
+	RTC_AL_TC_REGIDX_HOUR,
+	RTC_AL_TC_REGIDX_DOM,
+	RTC_AL_TC_REGIDX_DOW,
+	RTC_AL_TC_REGIDX_MON,
+	RTC_AL_TC_REGIDX_YEAR,
+	RTC_AL_TC_REGIDX_MAX
+};
+
+/**
+ * rtc_mt6685_write_trigger() - Synchronize registers to the HW
+ * @rtc: Main driver structure
+ *
+ * Writes to the Write Trigger (WRTGR) RTC register to start synchronizing
+ * all of the previous register writes to the hardware.
+ * This is done in order to avoid race conditions in case an alarm fires
+ * during the writing of time registers.
+ *
+ * Context: Mutex lock must be held before calling this function.
+ *          Apart from interrupt handlers inside of this driver, that is
+ *          already taken care of by the RTC API's ops_lock.
+ * Return:  Zero for success or negative error number.
+ */
+static int rtc_mt6685_write_trigger(struct mt6685_rtc *rtc)
+{
+	const u16 val = 1;
+	u32 data;
+	int ret;
+
+	ret = regmap_bulk_write(rtc->regmap, MT6685_RTC_REG_WRTGR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* The RTC usually takes 7-9uS to update: wait a bit before reading */
+	usleep_range(MT6685_RTC_POLL_DELAY_US, MT6685_RTC_POLL_DELAY_US + 10);
+
+	return regmap_read_poll_timeout(rtc->regmap, RTC_REG_BBPU, data,
+					!(data & RTC_BBPU_CBUSY),
+					MT6685_RTC_POLL_DELAY_US,
+					MT6685_RTC_POLL_TIMEOUT_US);
+}
+
+static irqreturn_t rtc_mt6685_irq_handler_thread(int irq, void *data)
+{
+	u16 irqsta, irqen = 0, bbpu = RTC_BBPU_WR_UNLOCK_KEY | RTC_BBPU_PWREN;
+	struct mt6685_rtc *rtc = data;
+	struct device *dev = &rtc->rdev->dev;
+	int ret;
+
+	ret = clk_prepare_enable(rtc->mclk);
+	if (ret)
+		return IRQ_NONE;
+
+	ret = regmap_bulk_read(rtc->regmap, RTC_REG_IRQ_STA, &irqsta, sizeof(irqsta));
+	if (ret)
+		goto end;
+
+	/* Only alarm interrupts are supported for now */
+	if (!(irqsta & RTC_IRQ_AL)) {
+		ret = -EINVAL;
+		goto end;
+	}
+
+	rtc_lock(rtc->rdev);
+
+	/* Enable BBPU power and clear the interrupt */
+	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
+	if (ret)
+		goto end;
+
+	ret = regmap_bulk_write(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
+	if (ret)
+		goto end;
+
+	/* Trigger reset of the RTC BBPU Alarm */
+	bbpu |= RTC_BBPU_RESET_AL;
+	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
+	if (ret) {
+		dev_err(dev, "Cannot reset alarm: %d\n", ret);
+		goto end;
+	}
+
+	/* Trigger write synchronization */
+	ret = rtc_mt6685_write_trigger(rtc);
+	if (ret) {
+		dev_err(dev, "Cannot synchronize write to RTC: %d\n", ret);
+		goto end;
+	}
+	rtc_update_irq(rtc->rdev, 1, RTC_IRQF | RTC_AF);
+end:
+	rtc_unlock(rtc->rdev);
+	clk_disable_unprepare(rtc->mclk);
+	return ret ? IRQ_NONE : IRQ_HANDLED;
+}
+
+static void rtc_mt6685_reload_bbpu(struct mt6685_rtc *rtc)
+{
+	u16 reload;
+
+	regmap_bulk_read(rtc->regmap, RTC_REG_BBPU, &reload, sizeof(reload));
+	reload |= RTC_BBPU_WR_UNLOCK_KEY | RTC_BBPU_RELOAD;
+	regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &reload, sizeof(reload));
+
+	rtc_mt6685_write_trigger(rtc);
+}
+
+static int rtc_mt6685_read_time_regs(struct mt6685_rtc *rtc, struct rtc_time *tm, u16 reg)
+{
+	u16 data[RTC_AL_TC_REGIDX_MAX];
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, reg, &data,
+			       RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
+	if (ret) {
+		dev_err(&rtc->rdev->dev, "Cannot read time regs\n");
+		return ret;
+	}
+
+	tm->tm_sec  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_SEC]);
+	tm->tm_min  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_MIN]);
+	tm->tm_hour = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_HOUR]);
+	tm->tm_mday = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_DOM]);
+	tm->tm_wday = FIELD_GET(RTC_AL_TC_DOW, data[RTC_AL_TC_REGIDX_DOW]);
+	tm->tm_mon  = FIELD_GET(RTC_AL_TC_MON, data[RTC_AL_TC_REGIDX_MON]);
+	tm->tm_year = FIELD_GET(RTC_AL_TC_YEAR, data[RTC_AL_TC_REGIDX_YEAR]);
+
+	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
+	tm->tm_mon--;
+	tm->tm_wday--;
+
+	return 0;
+}
+
+static int rtc_mt6685_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	u16 sec;
+	int ret;
+
+	ret = clk_prepare_enable(rtc->mclk);
+	if (ret)
+		return ret;
+
+	do {
+		rtc_mt6685_reload_bbpu(rtc);
+
+		ret = rtc_mt6685_read_time_regs(rtc, tm, RTC_REG_TC_SEC);
+		if (ret)
+			goto end;
+
+		ret = regmap_bulk_read(rtc->regmap, RTC_REG_TC_SEC, &sec, sizeof(sec));
+		if (ret)
+			goto end;
+	} while ((sec & RTC_AL_TC_SEC_MIN) < tm->tm_sec);
+
+end:
+	clk_disable_unprepare(rtc->mclk);
+	return ret;
+}
+
+static int rtc_mt6685_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	u16 data[RTC_AL_TC_REGIDX_MAX];
+	int ret;
+
+	ret = clk_prepare_enable(rtc->mclk);
+	if (ret)
+		return ret;
+
+	tm->tm_mon++;
+	tm->tm_wday++;
+
+	data[RTC_AL_TC_REGIDX_SEC] = FIELD_PREP(RTC_AL_TC_SEC_MIN, tm->tm_sec);
+	data[RTC_AL_TC_REGIDX_MIN] = FIELD_PREP(RTC_AL_TC_SEC_MIN, tm->tm_min);
+	data[RTC_AL_TC_REGIDX_HOUR] = FIELD_PREP(RTC_AL_TC_HOUR_DOM, tm->tm_hour);
+	data[RTC_AL_TC_REGIDX_DOM] = FIELD_PREP(RTC_AL_TC_HOUR_DOM, tm->tm_mday);
+	data[RTC_AL_TC_REGIDX_DOW] = FIELD_PREP(RTC_AL_TC_DOW, tm->tm_wday);
+	data[RTC_AL_TC_REGIDX_MON] = FIELD_PREP(RTC_AL_TC_MON, tm->tm_mon);
+	data[RTC_AL_TC_REGIDX_YEAR] = FIELD_PREP(RTC_AL_TC_YEAR, tm->tm_year);
+
+	ret = regmap_bulk_write(rtc->regmap, RTC_REG_TC_SEC, data,
+				RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
+	if (ret)
+		goto end;
+
+	/* Wait until write is synchronized (means time was set in HW) */
+	ret = rtc_mt6685_write_trigger(rtc);
+end:
+	clk_disable_unprepare(rtc->mclk);
+	return ret;
+}
+
+static int rtc_mt6685_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen, pdn2;
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(rtc->regmap, RTC_REG_PDN2, &pdn2, sizeof(pdn2));
+	if (ret)
+		return ret;
+
+	ret = rtc_mt6685_read_time_regs(rtc, tm, RTC_REG_AL_SEC);
+	if (ret)
+		return ret;
+
+	alm->enabled = FIELD_GET(RTC_IRQ_AL, irqen);
+	alm->pending = FIELD_GET(RTC_PDN2_PWRON_ALARM, pdn2);
+	return 0;
+}
+
+static int rtc_mt6685_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 data[RTC_AL_TC_REGIDX_MAX];
+	u16 irqen;
+	int ret;
+
+	/*
+	 * Clocks must be enabled when writing and, if that cannot be done,
+	 * reading fields is pointless as the alarm cannot finally be set.
+	 */
+	ret = clk_prepare_enable(rtc->mclk);
+	if (ret)
+		return ret;
+
+	tm->tm_mon++;
+	tm->tm_wday++;
+
+	ret = regmap_bulk_read(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
+	if (ret)
+		goto end;
+
+	ret = regmap_bulk_read(rtc->regmap, RTC_REG_AL_SEC, data,
+			       RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
+	if (ret)
+		goto end;
+
+	FIELD_MODIFY(RTC_IRQ_AL, &irqen, alm->enabled);
+	FIELD_MODIFY(RTC_AL_TC_SEC_MIN, &data[RTC_AL_TC_REGIDX_SEC], tm->tm_sec);
+	FIELD_MODIFY(RTC_AL_TC_SEC_MIN, &data[RTC_AL_TC_REGIDX_MIN], tm->tm_min);
+	FIELD_MODIFY(RTC_AL_TC_HOUR_DOM, &data[RTC_AL_TC_REGIDX_HOUR], tm->tm_hour);
+	FIELD_MODIFY(RTC_AL_TC_HOUR_DOM, &data[RTC_AL_TC_REGIDX_DOM], tm->tm_mday);
+	FIELD_MODIFY(RTC_AL_TC_DOW, &data[RTC_AL_TC_REGIDX_DOW], tm->tm_wday);
+	FIELD_MODIFY(RTC_AL_TC_MON, &data[RTC_AL_TC_REGIDX_MON], tm->tm_mon);
+	FIELD_MODIFY(RTC_AL_TC_YEAR, &data[RTC_AL_TC_REGIDX_YEAR], tm->tm_year);
+
+	if (alm->enabled) {
+		u16 val = RTC_AL_MASK_DOW;
+
+		ret = regmap_bulk_write(rtc->regmap, RTC_REG_AL_SEC, data,
+					RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
+		if (ret)
+			goto end;
+
+		ret = regmap_bulk_write(rtc->regmap,
+					RTC_REG_AL_MASK, &val, sizeof(val));
+		if (ret)
+			goto end;
+	}
+
+	ret = regmap_bulk_write(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
+	if (ret)
+		goto end;
+
+	ret = rtc_mt6685_write_trigger(rtc);
+end:
+	clk_disable_unprepare(rtc->mclk);
+	return ret;
+}
+
+static const struct rtc_class_ops rtc_mt6685_ops = {
+	.read_time  = rtc_mt6685_read_time,
+	.set_time   = rtc_mt6685_set_time,
+	.read_alarm = rtc_mt6685_read_alarm,
+	.set_alarm  = rtc_mt6685_set_alarm,
+};
+
+static int rtc_mt6685_probe(struct platform_device *pdev)
+{
+	struct regmap_config mt6685_rtc_regmap_config = {
+		.reg_bits = 16,
+		.val_bits = 8,
+		.max_register = 0x60,
+		.fast_io = true,
+		.use_single_read = true,
+		.use_single_write = true,
+	};
+	struct device *dev = &pdev->dev;
+	struct spmi_subdevice *sub_sdev;
+	struct spmi_device *sparent;
+	struct mt6685_rtc *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	sparent = to_spmi_device(dev->parent);
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
+
+	ret = of_property_read_u32(pdev->dev.of_node, "reg",
+				   &mt6685_rtc_regmap_config.reg_base);
+	if (ret)
+		return ret;
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->mclk = devm_clk_get(dev, 0);
+	if (IS_ERR(rtc->mclk))
+		return PTR_ERR(rtc->mclk);
+
+	rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
+	if (IS_ERR(rtc->regmap))
+		return PTR_ERR(rtc->regmap);
+
+	rtc->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rdev))
+		return PTR_ERR(rtc->rdev);
+
+	platform_set_drvdata(pdev, rtc);
+
+	/* Clock is required to auto-synchronize IRQ enable to RTC */
+	ret = clk_prepare_enable(rtc->mclk);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
+					rtc_mt6685_irq_handler_thread,
+					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+					"mt6685-rtc", rtc);
+	clk_disable_unprepare(rtc->mclk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot request alarm IRQ");
+
+	device_init_wakeup(&pdev->dev, true);
+
+	rtc->rdev->ops = &rtc_mt6685_ops;
+	rtc->rdev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc->rdev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
+	rtc->rdev->start_secs = mktime64(1968, 1, 1, 0, 0, 0);
+	rtc->rdev->set_start_time = true;
+
+	return devm_rtc_register_device(rtc->rdev);
+}
+
+static int __maybe_unused rtc_mt6685_suspend(struct device *dev)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static int __maybe_unused rtc_mt6685_resume(struct device *dev)
+{
+	struct mt6685_rtc *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(rtc_mt6685_pm_ops, rtc_mt6685_suspend, rtc_mt6685_resume);
+
+static const struct of_device_id rtc_mt6685_of_match[] = {
+	{ .compatible = "mediatek,mt6685-rtc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rtc_mt6685_of_match);
+
+static struct platform_driver rtc_mt6685_driver = {
+	.driver = {
+		.name = "rtc-mt6685",
+		.of_match_table = rtc_mt6685_of_match,
+		.pm = &rtc_mt6685_pm_ops,
+	},
+	.probe	= rtc_mt6685_probe,
+};
+module_platform_driver(rtc_mt6685_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6685 Clock IC RTC driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SPMI");
-- 
2.51.1


