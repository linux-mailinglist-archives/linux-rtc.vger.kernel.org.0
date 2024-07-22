Return-Path: <linux-rtc+bounces-1565-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4393922D
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 18:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC9B1F22449
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 16:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560BD16E897;
	Mon, 22 Jul 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7rtboh3r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC716D9A2;
	Mon, 22 Jul 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664134; cv=none; b=N8zqxP34Ry4U+sz5FAGgThu/mL38YqB4CyiOsow1O4TZQ959F/oqBqaLZ3oBi9xB0ov6uUHXKfFASURewLHn8UKgsifvJq1y5XGnP7Is32a65dT04irfoWWFu22iV1Tb3+tz81n7UEEgdQeqZelyQsDezUxS8jgWbLpBhr/fkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664134; c=relaxed/simple;
	bh=SLUV51RvtIWgXuM7MBTSJv2TYkDWKXLtsIRRZESaCLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RD96wZAl3AgjMpKp1poF69RfDnnnYnZ/axRak8SGWrSjnaVRaedT4dZUHczHHgX4K+94zn9R6nKH5Xuvn82FwYuNyKKzbmj3zIXT9KkwNO6LK9DXjgsA43FHKsj7tQ2zOCSI76Olsti/f9IKAEau7UGhy0DGOctPDmK/aaLy1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=7rtboh3r; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MB5Uue032426;
	Mon, 22 Jul 2024 18:01:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1DknkizxVV/IH/bP7HOHWWENUi7tH+dKqef25hsU4VU=; b=7rtboh3rEWrmFhUU
	x7NpEUsDEaMU0zWdmAkPE8S1MYb/OWFhbW3nfFVnVcOc6eiVTKi1HQpopTFVpxv6
	Ad+tv36PtUE6d6AH/wm9akxNi9NX+esB3KmPctOcLjBXQYFsQHoc4QhJN07gNrbB
	RR1ENU0lDytz0KTg1SgnA9RlzfMkMiSDdU5ee0mdDj6itCOINwnKi6oSBk/Rus1D
	OdJrhWOQNHgWqJtOdaGmfWQDeblnXTS0OR1IUEjcjS3SFaINpEp9jTqGeo10Fa8I
	Lw4RKtz5OXflA9yLeg470hA4rUeisttZx/3z8Z1Q/6jhvuLgjKlYR00Z9BuBzebx
	tXfZUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g4jxee6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 18:01:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FBAF40048;
	Mon, 22 Jul 2024 18:01:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFE372786FD;
	Mon, 22 Jul 2024 18:01:01 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 22 Jul
 2024 18:01:01 +0200
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
Subject: [PATCH v3 4/4] rtc: stm32: add alarm A out feature
Date: Mon, 22 Jul 2024 18:00:22 +0200
Message-ID: <20240722160022.454226-5-valentin.caron@foss.st.com>
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

STM32 RTC can pulse some SOC pins when an RTC alarm expires.
This patch adds this functionality for alarm A. The pulse can out on three
pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP (PC13, PB2, PI8 on stm32mp15)
(PC13, PB2, PI1 on stm32mp13) (PC13, PF4/PF6, PI8 on stm32mp25).

This patch only adds the functionality for devices which are using
st,stm32mp1-rtc and st,stm32mp25-rtc compatible.

Add "alarm-a" in pinmux functions.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 675860a13051..3e4f2ee22b0b 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -47,8 +47,10 @@
 #define STM32_RTC_CR_ALRAE		BIT(8)
 #define STM32_RTC_CR_ALRAIE		BIT(12)
 #define STM32_RTC_CR_OSEL		GENMASK(22, 21)
+#define STM32_RTC_CR_OSEL_ALARM_A	FIELD_PREP(STM32_RTC_CR_OSEL, 0x01)
 #define STM32_RTC_CR_COE		BIT(23)
 #define STM32_RTC_CR_TAMPOE		BIT(26)
+#define STM32_RTC_CR_TAMPALRM_TYPE	BIT(30)
 #define STM32_RTC_CR_OUT2EN		BIT(31)
 
 /* STM32_RTC_ISR/STM32_RTC_ICSR bit fields */
@@ -158,6 +160,7 @@ struct stm32_rtc_data {
 	bool need_accuracy;
 	bool rif_protected;
 	bool has_lsco;
+	bool has_alarm_out;
 };
 
 struct stm32_rtc {
@@ -245,6 +248,47 @@ struct stm32_rtc_pinmux_func {
 	int (*action)(struct pinctrl_dev *pctl_dev, unsigned int pin);
 };
 
+static int stm32_rtc_pinmux_action_alarm(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct stm32_rtc *rtc = pinctrl_dev_get_drvdata(pctldev);
+	struct stm32_rtc_registers regs = rtc->data->regs;
+	unsigned int cr = readl_relaxed(rtc->base + regs.cr);
+	unsigned int cfgr = readl_relaxed(rtc->base + regs.cfgr);
+
+	if (!rtc->data->has_alarm_out)
+		return -EPERM;
+
+	cr &= ~STM32_RTC_CR_OSEL;
+	cr |= STM32_RTC_CR_OSEL_ALARM_A;
+	cr &= ~STM32_RTC_CR_TAMPOE;
+	cr &= ~STM32_RTC_CR_COE;
+	cr &= ~STM32_RTC_CR_TAMPALRM_TYPE;
+
+	switch (pin) {
+	case OUT1:
+		cr &= ~STM32_RTC_CR_OUT2EN;
+		cfgr &= ~STM32_RTC_CFGR_OUT2_RMP;
+		break;
+	case OUT2:
+		cr |= STM32_RTC_CR_OUT2EN;
+		cfgr &= ~STM32_RTC_CFGR_OUT2_RMP;
+		break;
+	case OUT2_RMP:
+		cr |= STM32_RTC_CR_OUT2EN;
+		cfgr |= STM32_RTC_CFGR_OUT2_RMP;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	stm32_rtc_wpr_unlock(rtc);
+	writel_relaxed(cr, rtc->base + regs.cr);
+	writel_relaxed(cfgr, rtc->base + regs.cfgr);
+	stm32_rtc_wpr_lock(rtc);
+
+	return 0;
+}
+
 static int stm32_rtc_pinmux_lsco_available(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct stm32_rtc *rtc = pinctrl_dev_get_drvdata(pctldev);
@@ -307,6 +351,7 @@ static int stm32_rtc_pinmux_action_lsco(struct pinctrl_dev *pctldev, unsigned in
 
 static const struct stm32_rtc_pinmux_func stm32_rtc_pinmux_functions[] = {
 	STM32_RTC_PINMUX("lsco", &stm32_rtc_pinmux_action_lsco, "out1", "out2_rmp"),
+	STM32_RTC_PINMUX("alarm-a", &stm32_rtc_pinmux_action_alarm, "out1", "out2", "out2_rmp"),
 };
 
 static int stm32_rtc_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
@@ -763,6 +808,7 @@ static const struct stm32_rtc_data stm32_rtc_data = {
 	.need_accuracy = false,
 	.rif_protected = false,
 	.has_lsco = false,
+	.has_alarm_out = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -788,6 +834,7 @@ static const struct stm32_rtc_data stm32h7_rtc_data = {
 	.need_accuracy = false,
 	.rif_protected = false,
 	.has_lsco = false,
+	.has_alarm_out = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -822,6 +869,7 @@ static const struct stm32_rtc_data stm32mp1_data = {
 	.need_accuracy = true,
 	.rif_protected = false,
 	.has_lsco = true,
+	.has_alarm_out = true,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -847,6 +895,7 @@ static const struct stm32_rtc_data stm32mp25_data = {
 	.need_accuracy = true,
 	.rif_protected = true,
 	.has_lsco = true,
+	.has_alarm_out = true,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -878,6 +927,17 @@ MODULE_DEVICE_TABLE(of, stm32_rtc_of_match);
 static void stm32_rtc_clean_outs(struct stm32_rtc *rtc)
 {
 	struct stm32_rtc_registers regs = rtc->data->regs;
+	unsigned int cr = readl_relaxed(rtc->base + regs.cr);
+
+	cr &= ~STM32_RTC_CR_OSEL;
+	cr &= ~STM32_RTC_CR_TAMPOE;
+	cr &= ~STM32_RTC_CR_COE;
+	cr &= ~STM32_RTC_CR_TAMPALRM_TYPE;
+	cr &= ~STM32_RTC_CR_OUT2EN;
+
+	stm32_rtc_wpr_unlock(rtc);
+	writel_relaxed(cr, rtc->base + regs.cr);
+	stm32_rtc_wpr_lock(rtc);
 
 	if (regs.cfgr != UNDEF_REG) {
 		unsigned int cfgr = readl_relaxed(rtc->base + regs.cfgr);
-- 
2.25.1


