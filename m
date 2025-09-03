Return-Path: <linux-rtc+bounces-4807-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C1B423A3
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4EE169020
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420D6311953;
	Wed,  3 Sep 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="C3CC7LsV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71030AAB8
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909680; cv=none; b=YlX/PhfNRh3Mdw8MsINIM4nu8tD7F4HBiN0aJP3qNOTM6T0vAhnryzAeP38BSebnkTNl/P6e158L7AgRMMeEzvvl5Y33ZDEiEJjSlym+uBCclAC3MseRZW4rqVDb/7Ag9IgOfeuaMzwy2g756Tbf7fVMJBSOEsXOgEJOLbsWH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909680; c=relaxed/simple;
	bh=FNNYFnrFZfW3cu4lOIdFx7ZZciLmz4zTGxC7KX+Ise0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COYmwFeQdVvqgLc0FJFGC1EwNgwpSi63yUXqN82nYA5wRbBQbnTr0+J2OYDlJjlYpGpIARXjwNpfCm0d/lV6jqFZGICiQbSXBRZSPNF29/gM+wuJep7p9UmsU/EcbXva/9JEvxgnuaGLB51XJhVHBC3uXsP6fp5PgOPyiTl+1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=C3CC7LsV; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id E53FD1010F83
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:57:54 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in E53FD1010F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909674; bh=FNNYFnrFZfW3cu4lOIdFx7ZZciLmz4zTGxC7KX+Ise0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3CC7LsVkbOM/oxyU9Q9d9zXtmMO3FXy6KWh7PEvF7HDBKmo4LGPYn8Xq/EPkQMcx
	 hKc3GfF3iX/YNtxbYxa5iglC939OUliZB/r+UPOPXgJVCxcWJQluYkvwYq+nLSHt4b
	 QJ2ndTnHQyZL8GQgZAFlcBu4R6ew8HS6wb1iLs3k=
Received: (qmail 559 invoked by uid 510); 3 Sep 2025 19:57:54 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.557683 secs; 03 Sep 2025 19:57:54 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 3 Sep 2025 19:57:51 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id AD9363414E2;
	Wed,  3 Sep 2025 19:57:50 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 7A8441E8143E;
	Wed,  3 Sep 2025 19:57:50 +0530 (IST)
Date: Wed, 3 Sep 2025 19:57:45 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 6/7] rtc: m41t93: Add square wave clock provider support
Message-ID: <c53cdf7c2af95160e05cb4db343bb172a88ae7c9.1756908788.git.akhilesh@ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>

Implement support to configure square wave output (SQW) of m41t93 rtc
via common clock framework clock provider api. Add clock provider
callbacks to control output frequency ranging from 1Hz to 32KHz as
supported by this rtc chip.

Tested by measuring various frequencies on pull-up connected SWQ(7) pin
of m41t93 rtc chip using logic analyzer.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 154 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 902797070246..83cc34c4baae 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -13,6 +13,7 @@
 #include <linux/rtc.h>
 #include <linux/spi/spi.h>
 #include <linux/regmap.h>
+#include <linux/clk-provider.h>
 
 #define M41T93_REG_SSEC			0
 #define M41T93_REG_ST_SEC		1
@@ -31,6 +32,10 @@
 #define M41T93_BIT_ABE			BIT(5)
 #define M41T93_FLAG_AF1                 BIT(6)
 #define M41T93_SRAM_BASE		0x19
+#define M41T93_REG_SQW			0x13
+#define M41T93_SQW_RS_MASK		0xf0
+#define M41T93_SQW_RS_SHIFT		4
+#define M41T93_BIT_SQWE			BIT(6)
 
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
@@ -44,6 +49,9 @@
 struct m41t93_data {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw clks;
+#endif
 };
 
 static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
@@ -261,6 +269,146 @@ static const struct rtc_class_ops m41t93_rtc_ops = {
 	.alarm_irq_enable = m41t93_alarm_irq_enable,
 };
 
+#ifdef CONFIG_COMMON_CLK
+#define clk_sqw_to_m41t93_data(clk)	\
+	container_of(clk, struct m41t93_data, clks)
+
+/* m41t93 RTC clock output support */
+static unsigned long m41t93_clk_rates[] = {
+	0,
+	32768, /* RS3:RS0 = 0b0001 */
+	8192,
+	4096,
+	2048,
+	1024,
+	512,
+	256,
+	128,
+	64,
+	32,
+	16,
+	8,
+	4,
+	2,
+	1, /* RS3:RS0 = 0b1111 */
+};
+
+static unsigned long m41t93_clk_sqw_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	int ret;
+	unsigned int rate_id;
+	struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
+
+	ret = regmap_read(m41t93->regmap, M41T93_REG_SQW, &rate_id);
+	if (ret)
+		return ret;
+
+	rate_id &= M41T93_SQW_RS_MASK;
+	rate_id >>= M41T93_SQW_RS_SHIFT;
+
+	return m41t93_clk_rates[rate_id];
+}
+
+static int m41t93_clk_sqw_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(m41t93_clk_rates); i++) {
+		if (req->rate >= m41t93_clk_rates[i]) {
+			req->rate = m41t93_clk_rates[i];
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
+static int m41t93_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	int id, ret;
+	struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
+
+	for (id = 0; id < ARRAY_SIZE(m41t93_clk_rates); id++) {
+		if (m41t93_clk_rates[id] == rate)
+			break;
+	}
+
+	if (id >= ARRAY_SIZE(m41t93_clk_rates))
+		return -EINVAL;
+
+	ret = regmap_update_bits(m41t93->regmap, M41T93_REG_SQW,
+				 M41T93_SQW_RS_MASK, id << M41T93_SQW_RS_SHIFT);
+
+	return ret;
+}
+
+static int m41t93_clk_sqw_prepare(struct clk_hw *hw)
+{
+	int ret;
+	struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
+
+	ret = regmap_update_bits(m41t93->regmap, M41T93_REG_AL1_MONTH,
+				 M41T93_BIT_SQWE, M41T93_BIT_SQWE);
+
+	return ret;
+}
+
+static void m41t93_clk_sqw_unprepare(struct clk_hw *hw)
+{
+	struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
+
+	regmap_update_bits(m41t93->regmap, M41T93_REG_AL1_MONTH,
+			   M41T93_BIT_SQWE, ~M41T93_BIT_SQWE);
+}
+
+static int m41t93_clk_sqw_is_prepared(struct clk_hw *hw)
+{
+	int ret;
+	struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
+	unsigned int status;
+
+	ret = regmap_read(m41t93->regmap, M41T93_REG_AL1_MONTH, &status);
+	if (ret)
+		return ret;
+
+	return !!(status & M41T93_BIT_SQWE);
+}
+
+static const struct clk_ops m41t93_clk_sqw_ops = {
+	.prepare = m41t93_clk_sqw_prepare,
+	.unprepare = m41t93_clk_sqw_unprepare,
+	.is_prepared = m41t93_clk_sqw_is_prepared,
+	.recalc_rate = m41t93_clk_sqw_recalc_rate,
+	.set_rate = m41t93_clk_sqw_set_rate,
+	.determine_rate = m41t93_clk_sqw_determine_rate,
+};
+
+static int rtc_m41t93_clks_register(struct device *dev, struct m41t93_data *m41t93)
+{
+	struct device_node *node = dev->of_node;
+	struct clk *clk;
+	struct clk_init_data init = {0};
+
+	init.name = "m41t93_clk_sqw";
+	init.ops = &m41t93_clk_sqw_ops;
+
+	m41t93->clks.init = &init;
+
+	/* Register the clock with CCF */
+	clk = devm_clk_register(dev, &m41t93->clks);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	if (node)
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return 0;
+}
+#endif
+
 static struct spi_driver m41t93_driver;
 
 static const struct regmap_config regmap_config = {
@@ -317,6 +465,12 @@ static int m41t93_probe(struct spi_device *spi)
 	if (IS_ERR(m41t93->rtc))
 		return PTR_ERR(m41t93->rtc);
 
+#ifdef CONFIG_COMMON_CLK
+	ret = rtc_m41t93_clks_register(&spi->dev, m41t93);
+	if (ret)
+		dev_warn(&spi->dev, "Unable to register clock\n");
+#endif
+
 	return 0;
 }
 
-- 
2.34.1


