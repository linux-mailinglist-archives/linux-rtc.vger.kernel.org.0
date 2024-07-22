Return-Path: <linux-rtc+bounces-1568-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121E939235
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 18:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4D73B2170E
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3433E16EB7C;
	Mon, 22 Jul 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RSQlqKz8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E2134B6;
	Mon, 22 Jul 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664135; cv=none; b=MkJ8kOkUbI+N2Zipc0uXjy3oKzTyAuEq/hdSEcFJzGj6AnAGLpoH940XojlxEtBN103ADCW6DODedhKLYQXH4/VizMamNZQi7ilkJTZBIKk1l08GZRVcMblnK65D3/1ccDOUDsZnd/xIepDOrJiYhdBc+UIi8nk1bCPhljYtPS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664135; c=relaxed/simple;
	bh=9mQcLsfp3RUgy7fHL6HjTiodcf9zZ4kxa1u836/0ayg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Us5Rn4hHBrjAKBXLGneLSXFlQ0dzZPeAm9WBmlQQCLZPpygzrQOSrfEX4x/ftdy5Uyy/mnokkaD+NpPoCXS7L7YgS94jDcLt4XlmlWKYiZRDT+gJxOQtcES50Mhs+GKNhTxYztsHiX1yVnN0CwY4+odFBYlZ2InVsBap69N7zx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RSQlqKz8; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MBC73n025795;
	Mon, 22 Jul 2024 18:01:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pN824+sN3jJSGLHShL6fS6am5Zo+VpsXl0/7hBvpo/A=; b=RSQlqKz8QXebfwtD
	P9Tov1hJhelMINC9rbtsfqVj+jNaJ6+4c7mmzGFLFr7WPVZIZ1GqWXhLSIn5s8Jc
	jDvtKpf542aUxKucZ0RyulqPQ7IkMHzmsD7hU9aWue5YLP9ZYymophspptVf79Pi
	hz31X1tgauhjBWA6p+LafhugGaCM4DmsNBL2IdO4kAXRjgST9nC+gHoYlE1uEr74
	9LDjkkSuRXRhPJQSoc47fehhZR6Y9hjVPU2FRh2BZAjDRyqrPLopqR6zn7rcQK8j
	Y9N0zTwpXglJRCqNzRzMFAB/Z7u+3Ep1dAZHwzQivi8RnO+T7mviXgKwcLZbLyxn
	An60Bg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gr6hvjuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 18:01:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D7A2840046;
	Mon, 22 Jul 2024 18:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 257C02786F7;
	Mon, 22 Jul 2024 18:01:00 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 22 Jul
 2024 18:00:59 +0200
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
Subject: [PATCH v3 2/4] rtc: stm32: add pinctrl and pinmux interfaces
Date: Mon, 22 Jul 2024 18:00:20 +0200
Message-ID: <20240722160022.454226-3-valentin.caron@foss.st.com>
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

STM32 RTC is capable to handle 3 specific pins of the soc.
"out1, out2 and out2_rmp". To handle this, we use pinctrl framework.
There is a single pin per group.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/Kconfig     |   5 ++
 drivers/rtc/rtc-stm32.c | 120 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..4b1a87027a3d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1923,6 +1923,11 @@ config RTC_DRV_STM32
 	tristate "STM32 RTC"
 	select REGMAP_MMIO
 	depends on ARCH_STM32 || COMPILE_TEST
+	depends on OF
+	depends on PINCTRL
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
 	help
 	   If you say yes here you get support for the STM32 On-Chip
 	   Real Time Clock.
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 98b07969609d..6dfd9dc07e2e 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -13,6 +13,9 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
@@ -107,6 +110,14 @@
 /* STM32 RTC driver time helpers */
 #define SEC_PER_DAY		(24 * 60 * 60)
 
+/* STM32 RTC pinctrl helpers */
+#define STM32_RTC_PINMUX(_name, _action, ...) { \
+	.name = (_name), \
+	.action = (_action), \
+	.groups = ((const char *[]){ __VA_ARGS__ }), \
+	.num_groups = ARRAY_SIZE(((const char *[]){ __VA_ARGS__ })), \
+}
+
 struct stm32_rtc;
 
 struct stm32_rtc_registers {
@@ -171,6 +182,106 @@ static void stm32_rtc_wpr_lock(struct stm32_rtc *rtc)
 	writel_relaxed(RTC_WPR_WRONG_KEY, rtc->base + regs->wpr);
 }
 
+enum stm32_rtc_pin_name {
+	NONE,
+	OUT1,
+	OUT2,
+	OUT2_RMP
+};
+
+static const struct pinctrl_pin_desc stm32_rtc_pinctrl_pins[] = {
+	PINCTRL_PIN(OUT1, "out1"),
+	PINCTRL_PIN(OUT2, "out2"),
+	PINCTRL_PIN(OUT2_RMP, "out2_rmp"),
+};
+
+static int stm32_rtc_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_rtc_pinctrl_pins);
+}
+
+static const char *stm32_rtc_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						    unsigned int selector)
+{
+	return stm32_rtc_pinctrl_pins[selector].name;
+}
+
+static int stm32_rtc_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					    unsigned int selector,
+					    const unsigned int **pins,
+					    unsigned int *num_pins)
+{
+	*pins = &stm32_rtc_pinctrl_pins[selector].number;
+	*num_pins = 1;
+	return 0;
+}
+
+static const struct pinctrl_ops stm32_rtc_pinctrl_ops = {
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+	.get_groups_count	= stm32_rtc_pinctrl_get_groups_count,
+	.get_group_name		= stm32_rtc_pinctrl_get_group_name,
+	.get_group_pins		= stm32_rtc_pinctrl_get_group_pins,
+};
+
+struct stm32_rtc_pinmux_func {
+	const char *name;
+	const char * const *groups;
+	const unsigned int num_groups;
+	int (*action)(struct pinctrl_dev *pctl_dev, unsigned int pin);
+};
+
+static const struct stm32_rtc_pinmux_func stm32_rtc_pinmux_functions[] = {
+};
+
+static int stm32_rtc_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_rtc_pinmux_functions);
+}
+
+static const char *stm32_rtc_pinmux_get_fname(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return stm32_rtc_pinmux_functions[selector].name;
+}
+
+static int stm32_rtc_pinmux_get_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+				       const char * const **groups, unsigned int * const num_groups)
+{
+	*groups = stm32_rtc_pinmux_functions[selector].groups;
+	*num_groups = stm32_rtc_pinmux_functions[selector].num_groups;
+	return 0;
+}
+
+static int stm32_rtc_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
+				    unsigned int group)
+{
+	struct stm32_rtc_pinmux_func selected_func = stm32_rtc_pinmux_functions[selector];
+	struct pinctrl_pin_desc pin = stm32_rtc_pinctrl_pins[group];
+
+	/* Call action */
+	if (selected_func.action)
+		return selected_func.action(pctldev, pin.number);
+
+	return -EINVAL;
+}
+
+static const struct pinmux_ops stm32_rtc_pinmux_ops = {
+	.get_functions_count	= stm32_rtc_pinmux_get_functions_count,
+	.get_function_name	= stm32_rtc_pinmux_get_fname,
+	.get_function_groups	= stm32_rtc_pinmux_get_groups,
+	.set_mux		= stm32_rtc_pinmux_set_mux,
+	.strict			= true,
+};
+
+static struct pinctrl_desc stm32_rtc_pdesc = {
+	.name = DRIVER_NAME,
+	.pins = stm32_rtc_pinctrl_pins,
+	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),
+	.owner = THIS_MODULE,
+	.pctlops = &stm32_rtc_pinctrl_ops,
+	.pmxops = &stm32_rtc_pinmux_ops,
+};
+
 static int stm32_rtc_enter_init_mode(struct stm32_rtc *rtc)
 {
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
@@ -791,6 +902,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 {
 	struct stm32_rtc *rtc;
 	const struct stm32_rtc_registers *regs;
+	struct pinctrl_dev *pctl;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -912,6 +1024,14 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+
+	ret = pinctrl_enable(pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
 	 * must be initialized
-- 
2.25.1


