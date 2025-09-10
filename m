Return-Path: <linux-rtc+bounces-4857-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D8B51869
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B371C80745
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F3021C9E3;
	Wed, 10 Sep 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="B0jOdHF3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D574218592
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512476; cv=none; b=CwPpsSQRnIZnqH+qCiVE0TJdJltuy9RF9CEIyvbg3g+wAhSgaZHqRohOAjsdB3M93QrWG5NS074K1heBIfWyY6gcl+M4aknIQlwL9VPSNwh4cUxX8Oh6YJ0V8+wbU9WlXVI8r85C2RALud+Ad97ZPElP+TPJm63lD1U9nNFOYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512476; c=relaxed/simple;
	bh=75dnq/x2Xe2jz/phguwseZd02GXcLMv0t5oaqRIdMow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDQdq0RLs3HDkPJJ9UFn+h/l0Vtzvdlki6GpcaCzGdLzdFc5prC4PeuR6uHvNx6OZA52hcbrFOSiieu21enNRIgEB7bQCZLUwte+vO76zRn8NvjWzEYi0QxDhRCDrfhDDQ+syS5aM34Y6xqBnHOcyCs4sMAktuOS1miOS6mfohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=B0jOdHF3; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 7D8981016230
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:24:31 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 7D8981016230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512471; bh=75dnq/x2Xe2jz/phguwseZd02GXcLMv0t5oaqRIdMow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0jOdHF3Sdr5BgETad/iwKaJwG0kZT9SLqd++rnMYcwq93H5rQw+n5hG+UbO53DQ8
	 yNxZO3gKfy+dYwrwsFoOJRyEAAhUt5LEYCTa+3EY5vF8c9LUp5V+u31sZ4Z2+kCMpL
	 AqKtcqRPjwHVH9oQdfEmlUhU4wgldoqzJSAajkzo=
Received: (qmail 32607 invoked by uid 510); 10 Sep 2025 19:24:31 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.55595 secs; 10 Sep 2025 19:24:31 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 10 Sep 2025 19:24:27 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 65708360036;
	Wed, 10 Sep 2025 19:24:27 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 4AF5A1E813E1;
	Wed, 10 Sep 2025 19:24:27 +0530 (IST)
Date: Wed, 10 Sep 2025 19:24:22 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 5/6] rtc: m41t93: Add square wave clock provider support
Message-ID: <b6d98137a9a2977b2d2e9f5a7b8b0f7eea857721.1757510157.git.akhilesh@ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>

Implement support to configure square wave output (SQW) of m41t93 rtc
via common clock framework clock provider api. Add clock provider
callbacks to control output frequency ranging from 1Hz to 32KHz as
supported by this rtc chip.

Use clock framework debugfs interface or clock consumer DT node to test.
Tested by measuring various frequencies on pull-up connected SWQ(7) pin
of m41t93 rtc chip using logic analyzer.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 156 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 911852820853..4efd05b47597 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -13,6 +13,7 @@
 #include <linux/rtc.h>
 #include <linux/spi/spi.h>
 #include <linux/regmap.h>
+#include <linux/clk-provider.h>
 
 #define M41T93_REG_SSEC			0
 #define M41T93_REG_ST_SEC		1
@@ -30,7 +31,11 @@
 #define M41T93_BIT_A1IE                 BIT(7)
 #define M41T93_BIT_ABE			BIT(5)
 #define M41T93_FLAG_AF1                 BIT(6)
-
+#define M41T93_SRAM_BASE		0x19
+#define M41T93_REG_SQW			0x13
+#define M41T93_SQW_RS_MASK		0xf0
+#define M41T93_SQW_RS_SHIFT		4
+#define M41T93_BIT_SQWE			BIT(6)
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
 #define M41T93_REG_FLAGS		0xf
@@ -43,6 +48,9 @@
 struct m41t93_data {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw clks;
+#endif
 };
 
 static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
@@ -264,6 +272,146 @@ static const struct rtc_class_ops m41t93_rtc_ops = {
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
+			   M41T93_BIT_SQWE, 0);
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
@@ -312,6 +460,12 @@ static int m41t93_probe(struct spi_device *spi)
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


