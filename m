Return-Path: <linux-rtc+bounces-1566-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5D93922F
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 18:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732051C203E2
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 16:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A38916EB51;
	Mon, 22 Jul 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="D3kRSHUJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B00B16D9A8;
	Mon, 22 Jul 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664134; cv=none; b=Tzm76c7Q9z/ICG5A+1fAeZgjOAVqm0haf4+cU1NKZwbSDPMZLA/Ikhy8Qzxit21ehEHKLUo3J3OyIcmpqAefrF5djo5oeg8694hN3IZEk44ExcaP795kWW8tBldPftt1cE/OprZ/TKWZ55Ub6b8bO9llug+lAOb00bmVuMt1NGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664134; c=relaxed/simple;
	bh=1ajvxPHWKO0aG0Nz45e4buhB4O3OtMWRJXQ/7dT4JZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZuquvvZ/bg7O3z6mN4xVNdtH+j6WEiMiddhpnK31Hz9cyUbMPnZQQ/BW+PaA79Fxl6svhAINXlwpQIE9G6aVZLc3OBaea39R6lWTZpXGzQDtFbMnVPdq9WUYWhvSjp1NAns9cCdDk34dWfZjHeDnlmd8ioYzT2h70OZMTVNyR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D3kRSHUJ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MB14MI007189;
	Mon, 22 Jul 2024 18:01:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	brzq4K54g8BfkHN2Kn/TwNyyzP9UKp79fVcrIHEFDy8=; b=D3kRSHUJbAjXoMcl
	+9azqrtQCxb6hxwjAlrK7OX4DErZlokEIoNlSBRyeUR1phl+JXdtG2B9qAn9Fg71
	Ve9gQ1h0qUZ2fFB9vSkrsniGQOnc1mECH3Sx/1a6itDnxID4F0j8v3Kr8aw7DmKG
	z/25QT9v8oQ/949WlACdTOcMceu1Zech2Q6Dy/3mjZN9IOMYQDq4Gabod4d6wjTG
	qDNMoxwmDkrKQL0WFvK9M7jVDUEi5VVQ5wTMTJIcVWVZEMED9x0ZgwDQSzCa8LQU
	Q64EJh68Hh2ZoZBuoHGj46UVGbK1afPUnePdGPvuNbZz0UjTGvF600CwNYJceG7P
	ZfVf6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gpt0vu99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 18:01:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9926240045;
	Mon, 22 Jul 2024 18:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8C102786FB;
	Mon, 22 Jul 2024 18:01:00 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 22 Jul
 2024 18:01:00 +0200
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
Subject: [PATCH v3 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
Date: Mon, 22 Jul 2024 18:00:21 +0200
Message-ID: <20240722160022.454226-4-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240722160022.454226-1-valentin.caron@foss.st.com>
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01

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
index 4b1a87027a3d..b3469f6986e9 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1928,6 +1928,7 @@ config RTC_DRV_STM32
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	depends on COMMON_CLK
 	help
 	   If you say yes here you get support for the STM32 On-Chip
 	   Real Time Clock.
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


