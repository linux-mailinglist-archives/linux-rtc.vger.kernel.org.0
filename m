Return-Path: <linux-rtc+bounces-1484-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5992EA64
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6D9283CDE
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C51316C6B7;
	Thu, 11 Jul 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PDG0Qnay"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C81649BF;
	Thu, 11 Jul 2024 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707023; cv=none; b=Q+T2A7Vh8jTApApNJbReU+JpREcyR8112HVQ6n8slBA3JFRSa/xHkT5H85FsiWNwt6ED3YEXdJhQFUgOoDSTJfG40K9nlfauC0T8FVNgBgheGNB48WLA4nFBvEmrVuBwcELFtPnBIhM9rLwhl0ekReWCD5zhReOYmuYshvJ5ipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707023; c=relaxed/simple;
	bh=R4nIpHZp89Qq6I/se9BnopNnte6tWa/fgvS0mIL9Y6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbQ7tZv9m6QpdPBgP/iqiHYY44QZ5xPSFW9MMxlyy1GL/VCPzQ2TtTfYF89LxRX+LIZajfoDxNXS2WVTQdld9ajNgNQV394P80UdMiUxni0Cyqn468p3B9dvwS3vwxFhC7d0v4hR5IzUQaJux1TVGrMIgWv+uWvrmX4qgyMxIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PDG0Qnay; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BCJiJT009460;
	Thu, 11 Jul 2024 16:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BodjeJFYAeqDy9ChUXJpb7YKu0MWhQ8xxq+EECISGAQ=; b=PDG0QnayG8jk5AB+
	ECJDWGbCaJwF2ffGHFm4JZFVeTsZQeIOb5H2qkZFsSBEGbCBUnGeN5/UcwcixD1O
	lOIOyssg8Kxr4Y8Sl9Mp1Ly4zeCpLk/TN2kRG/wazrIibyp7dfPFO1ewSM1jV6xi
	kR3T4t1esPK0wCJrsMaEQKpNrC2EHwgCtZ1NUWQAsUi7jLmFo0IjBT8bgOwZOQsj
	9SCRCkptuokPITW/N3HIp4P7LuuM9xsT2ekHPI+X7Ag/RMlmHVTgcJr84fJftVXF
	meTyfpvNl0jYyMQ0sMekY5Enh25mrui9xxGdXsoHL/D7HhDrT2zZVzR9/lh9fWu2
	C443iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406wqtnjus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 16:09:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C156740045;
	Thu, 11 Jul 2024 16:09:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12D9B23D40A;
	Thu, 11 Jul 2024 16:09:00 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jul
 2024 16:08:59 +0200
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
Subject: [PATCH 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
Date: Thu, 11 Jul 2024 16:08:42 +0200
Message-ID: <20240711140843.3201530-4-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711140843.3201530-1-valentin.caron@foss.st.com>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_10,2024-07-11_01,2024-05-17_01

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
index 2a95b05982ad..9ee51cd67b22 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1922,6 +1922,7 @@ config RTC_DRV_R7301
 config RTC_DRV_STM32
 	tristate "STM32 RTC"
 	select REGMAP_MMIO
+	depends on COMMON_CLK
 	depends on ARCH_STM32 || COMPILE_TEST
 	help
 	   If you say yes here you get support for the STM32 On-Chip
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index c1e69c5b27bd..a57d494b229c 100644
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


