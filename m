Return-Path: <linux-rtc+bounces-1537-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B07933855
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 09:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 213901C229CC
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 07:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D103BB25;
	Wed, 17 Jul 2024 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="08M6MQ2e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698725634;
	Wed, 17 Jul 2024 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202634; cv=none; b=DuP8wUpq1JU70ne9gAhfXq7xm6wlaZrxste4GcWDsxLMMZaBEGztWOg0n83DIoCm9Vi5JnRFypjiKeLY1UQWWholKQdjxehnAPCJhOYAVSKLtNhy3HtWTs54JZvgsDpD8p3jLuJFmLZpxSHxpS82V/cfNmd/l0t4lqOc4R/ps38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202634; c=relaxed/simple;
	bh=4KWv2l4CvgBcU9eNV7vNVYutWXPBBRmGy3UjE3K375M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRL9T5H6jj0Z1NqL67gpWQ/RpttqTqnsurkVyuLEeg5pW3POZE5zmouCcITjaCQZBNOYRBhAAuRizkU3E1qB0OZy3e6/HzOF66hH1HaICEmCZ1RSm5AoDJMVWxqXMWCmjfsOb/FcsuD9n3jvpoYnzQdEGGZNu+luhkOtyLxmiVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=08M6MQ2e; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H5rBvP017894;
	Wed, 17 Jul 2024 09:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7lIvOl7Z+yxiHoXjClcNFTnVUdu50gq7Kge+8tZz4wU=; b=08M6MQ2e4FErg1Dc
	B0SKVPN8THOjMMyUGCDSUlL1LAodibYcr5EC2iVaPe/8ODV+JTauCbg2pvlbdsER
	D8CLF1QuTMROR21a1cGcDDX5iomPRBM3xQx+Oza1Wd5L8yPbomYUS0s+CvHmRR37
	lIGhcD948jow5oBaj9yz+Zuo8S0nq8H6nxh9ElQ1Uv6M4rDrZZuTsnHF0U/uKiR+
	TJAZSEaClNRdPBYKN7ToRM/eHffbpuTwfIJWUznl09lyQRPy+5EL2wrQbhts0Y2R
	66YiDfmyLP1C5hVY+BUTxb8sJ2xCqe8GpfKJ7y5Rt0+ewDXQ8c6wy7ehLYsFsqai
	t+nBkg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40dwfma6ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:49:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1EB1D40046;
	Wed, 17 Jul 2024 09:49:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6690724148C;
	Wed, 17 Jul 2024 09:48:56 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 17 Jul
 2024 09:48:56 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Valentin Caron
	<valentin.caron@foss.st.com>
Subject: [PATCH v2 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
Date: Wed, 17 Jul 2024 09:48:34 +0200
Message-ID: <20240717074835.2210411-4-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240717074835.2210411-1-valentin.caron@foss.st.com>
References: <20240717074835.2210411-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_04,2024-07-16_02,2024-05-17_01

RTC is able to output on a pin the "LSE" internal clock.

STM32 RTC is now registered as a clock provider.
It provides rtc_lsco clock, that means RTC_LSCO is output on either
RTC_OUT1 or RTC_OUT2_RMP, depending on pinmux DT property.
The clock is marked as CLK_IGNORE_UNUSED and CLK_IS_CRITICAL because
RTC_LSCO can be early required by devices needed it to init.

Add LSCO in pinmux functions.

Add "stm32_rtc_clean_outs" to disable LSCO. As RTC is part of "backup"
power domain, it is not reset during shutdown or reboot. So force LSCO
disable at probe.

Co-developed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/Kconfig     |   1 +
 drivers/rtc/rtc-stm32.c | 101 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9c88eb580209..52f5f9ec7e9f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1924,6 +1924,7 @@ config RTC_DRV_STM32
 	select REGMAP_MMIO
 	select PINMUX
 	select GENERIC_PINCONF
+	select COMMON_CLK
 	depends on ARCH_STM32 || COMPILE_TEST
 	help
 	   If you say yes here you get support for the STM32 On-Chip
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 6dfd9dc07e2e..675860a13051 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -7,6 +7,7 @@
 #include <linux/bcd.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/errno.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
@@ -45,6 +46,10 @@
 #define STM32_RTC_CR_FMT		BIT(6)
 #define STM32_RTC_CR_ALRAE		BIT(8)
 #define STM32_RTC_CR_ALRAIE		BIT(12)
+#define STM32_RTC_CR_OSEL		GENMASK(22, 21)
+#define STM32_RTC_CR_COE		BIT(23)
+#define STM32_RTC_CR_TAMPOE		BIT(26)
+#define STM32_RTC_CR_OUT2EN		BIT(31)
 
 /* STM32_RTC_ISR/STM32_RTC_ICSR bit fields */
 #define STM32_RTC_ISR_ALRAWF		BIT(0)
@@ -81,6 +86,12 @@
 /* STM32_RTC_SR/_SCR bit fields */
 #define STM32_RTC_SR_ALRA		BIT(0)
 
+/* STM32_RTC_CFGR bit fields */
+#define STM32_RTC_CFGR_OUT2_RMP		BIT(0)
+#define STM32_RTC_CFGR_LSCOEN		GENMASK(2, 1)
+#define STM32_RTC_CFGR_LSCOEN_OUT1	1
+#define STM32_RTC_CFGR_LSCOEN_OUT2_RMP	2
+
 /* STM32_RTC_VERR bit fields */
 #define STM32_RTC_VERR_MINREV_SHIFT	0
 #define STM32_RTC_VERR_MINREV		GENMASK(3, 0)
@@ -130,6 +141,7 @@ struct stm32_rtc_registers {
 	u16 wpr;
 	u16 sr;
 	u16 scr;
+	u16 cfgr;
 	u16 verr;
 };
 
@@ -145,6 +157,7 @@ struct stm32_rtc_data {
 	bool need_dbp;
 	bool need_accuracy;
 	bool rif_protected;
+	bool has_lsco;
 };
 
 struct stm32_rtc {
@@ -157,6 +170,7 @@ struct stm32_rtc {
 	struct clk *rtc_ck;
 	const struct stm32_rtc_data *data;
 	int irq_alarm;
+	struct clk *clk_lsco;
 };
 
 struct stm32_rtc_rif_resource {
@@ -231,7 +245,68 @@ struct stm32_rtc_pinmux_func {
 	int (*action)(struct pinctrl_dev *pctl_dev, unsigned int pin);
 };
 
+static int stm32_rtc_pinmux_lsco_available(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct stm32_rtc *rtc = pinctrl_dev_get_drvdata(pctldev);
+	struct stm32_rtc_registers regs = rtc->data->regs;
+	unsigned int cr = readl_relaxed(rtc->base + regs.cr);
+	unsigned int cfgr = readl_relaxed(rtc->base + regs.cfgr);
+	unsigned int calib = STM32_RTC_CR_COE;
+	unsigned int tampalrm = STM32_RTC_CR_TAMPOE | STM32_RTC_CR_OSEL;
+
+	switch (pin) {
+	case OUT1:
+		if ((!(cr & STM32_RTC_CR_OUT2EN) &&
+		     ((cr & calib) || cr & tampalrm)) ||
+		     ((cr & calib) && (cr & tampalrm)))
+			return -EBUSY;
+		break;
+	case OUT2_RMP:
+		if ((cr & STM32_RTC_CR_OUT2EN) &&
+		    (cfgr & STM32_RTC_CFGR_OUT2_RMP) &&
+		    ((cr & calib) || (cr & tampalrm)))
+			return -EBUSY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (clk_get_rate(rtc->rtc_ck) != 32768)
+		return -ERANGE;
+
+	return 0;
+}
+
+static int stm32_rtc_pinmux_action_lsco(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct stm32_rtc *rtc = pinctrl_dev_get_drvdata(pctldev);
+	struct stm32_rtc_registers regs = rtc->data->regs;
+	struct device *dev = rtc->rtc_dev->dev.parent;
+	u8 lscoen;
+	int ret;
+
+	if (!rtc->data->has_lsco)
+		return -EPERM;
+
+	ret = stm32_rtc_pinmux_lsco_available(pctldev, pin);
+	if (ret)
+		return ret;
+
+	lscoen = (pin == OUT1) ? STM32_RTC_CFGR_LSCOEN_OUT1 : STM32_RTC_CFGR_LSCOEN_OUT2_RMP;
+
+	rtc->clk_lsco = clk_register_gate(dev, "rtc_lsco", __clk_get_name(rtc->rtc_ck),
+					  CLK_IGNORE_UNUSED | CLK_IS_CRITICAL,
+					  rtc->base + regs.cfgr, lscoen, 0, NULL);
+	if (IS_ERR(rtc->clk_lsco))
+		return PTR_ERR(rtc->clk_lsco);
+
+	of_clk_add_provider(dev->of_node, of_clk_src_simple_get, rtc->clk_lsco);
+
+	return 0;
+}
+
 static const struct stm32_rtc_pinmux_func stm32_rtc_pinmux_functions[] = {
+	STM32_RTC_PINMUX("lsco", &stm32_rtc_pinmux_action_lsco, "out1", "out2_rmp"),
 };
 
 static int stm32_rtc_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
@@ -687,6 +762,7 @@ static const struct stm32_rtc_data stm32_rtc_data = {
 	.need_dbp = true,
 	.need_accuracy = false,
 	.rif_protected = false,
+	.has_lsco = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -697,6 +773,7 @@ static const struct stm32_rtc_data stm32_rtc_data = {
 		.wpr = 0x24,
 		.sr = 0x0C, /* set to ISR offset to ease alarm management */
 		.scr = UNDEF_REG,
+		.cfgr = UNDEF_REG,
 		.verr = UNDEF_REG,
 	},
 	.events = {
@@ -710,6 +787,7 @@ static const struct stm32_rtc_data stm32h7_rtc_data = {
 	.need_dbp = true,
 	.need_accuracy = false,
 	.rif_protected = false,
+	.has_lsco = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -720,6 +798,7 @@ static const struct stm32_rtc_data stm32h7_rtc_data = {
 		.wpr = 0x24,
 		.sr = 0x0C, /* set to ISR offset to ease alarm management */
 		.scr = UNDEF_REG,
+		.cfgr = UNDEF_REG,
 		.verr = UNDEF_REG,
 	},
 	.events = {
@@ -742,6 +821,7 @@ static const struct stm32_rtc_data stm32mp1_data = {
 	.need_dbp = false,
 	.need_accuracy = true,
 	.rif_protected = false,
+	.has_lsco = true,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -752,6 +832,7 @@ static const struct stm32_rtc_data stm32mp1_data = {
 		.wpr = 0x24,
 		.sr = 0x50,
 		.scr = 0x5C,
+		.cfgr = 0x60,
 		.verr = 0x3F4,
 	},
 	.events = {
@@ -765,6 +846,7 @@ static const struct stm32_rtc_data stm32mp25_data = {
 	.need_dbp = false,
 	.need_accuracy = true,
 	.rif_protected = true,
+	.has_lsco = true,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -775,6 +857,7 @@ static const struct stm32_rtc_data stm32mp25_data = {
 		.wpr = 0x24,
 		.sr = 0x50,
 		.scr = 0x5C,
+		.cfgr = 0x60,
 		.verr = 0x3F4,
 	},
 	.events = {
@@ -792,6 +875,19 @@ static const struct of_device_id stm32_rtc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, stm32_rtc_of_match);
 
+static void stm32_rtc_clean_outs(struct stm32_rtc *rtc)
+{
+	struct stm32_rtc_registers regs = rtc->data->regs;
+
+	if (regs.cfgr != UNDEF_REG) {
+		unsigned int cfgr = readl_relaxed(rtc->base + regs.cfgr);
+
+		cfgr &= ~STM32_RTC_CFGR_LSCOEN;
+		cfgr &= ~STM32_RTC_CFGR_OUT2_RMP;
+		writel_relaxed(cfgr, rtc->base + regs.cfgr);
+	}
+}
+
 static int stm32_rtc_check_rif(struct stm32_rtc *stm32_rtc,
 			       struct stm32_rtc_rif_resource res)
 {
@@ -1024,6 +1120,8 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	stm32_rtc_clean_outs(rtc);
+
 	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
@@ -1070,6 +1168,9 @@ static void stm32_rtc_remove(struct platform_device *pdev)
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
 	unsigned int cr;
 
+	if (!IS_ERR_OR_NULL(rtc->clk_lsco))
+		clk_unregister_gate(rtc->clk_lsco);
+
 	/* Disable interrupts */
 	stm32_rtc_wpr_unlock(rtc);
 	cr = readl_relaxed(rtc->base + regs->cr);
-- 
2.25.1


