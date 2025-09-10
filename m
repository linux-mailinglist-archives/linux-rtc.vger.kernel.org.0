Return-Path: <linux-rtc+bounces-4858-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5FB51870
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69EC93AAD5A
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48433090D1;
	Wed, 10 Sep 2025 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="izdHwn6/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A421D3F5
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512504; cv=none; b=h7x71JU7Zw2sGg0/SE5qYEqWeJ9i8JHv6OKokHk5f6DFQQMkm2ORh+CwZ54rI+N+181WCCg+W716o3BX/7564tCOr+C3oGj37USiRJ9Wcf1OQis3QTX0PeWhHHgEzektCvVwhc7wCDRIvw6u4k6/e2UgZdiDq9/x3Wto32miqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512504; c=relaxed/simple;
	bh=XKJTkCcBqyrwlNF/MqSEBlHj1Y695/fum/SuU/qztTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnAGA700v+SwMSG9tC1bta/oNL4nY8VANZn9dem4x9CuX9hlQH26vTga0zHzgBd6v1jCrIBdpsziurpPMblNvemKaGd0gM2R6f/FdHOBPEDiLvNkKEIGf+Nu0+SQz6xzMkr2qvmfYO2lpvHPAXGc2vn0aW2DRvxDY/W02NpZn5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=izdHwn6/; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 05551101403B
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:25:00 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 05551101403B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512500; bh=XKJTkCcBqyrwlNF/MqSEBlHj1Y695/fum/SuU/qztTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izdHwn6/Ofi/O1W6dy61ivYQ7k0nB3hpo+JcJdfq2bVuj5xXV6wUsHP2/b8h9Jl6b
	 OC9i+XARlrnGvLtspDA+U0djkkcL1X2YBA2cmIL5UZihlb0HUbctPmPfD9Vt928xBc
	 DCrZtzVe2IiWxZJG3RPStFwKYRr8Br8e1J8+MtdA=
Received: (qmail 8145 invoked by uid 510); 10 Sep 2025 19:24:59 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.8/7.0):. Processed in 5.605799 secs; 10 Sep 2025 19:24:59 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 10 Sep 2025 19:24:54 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id BDED63414DD;
	Wed, 10 Sep 2025 19:24:53 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 575F11E813E1;
	Wed, 10 Sep 2025 19:24:53 +0530 (IST)
Date: Wed, 10 Sep 2025 19:24:48 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 6/6] rtc: m41t93: Add watchdog support
Message-ID: <e7a8d4fd0b9789ad890a2c92662a3a3051a0fba3.1757510157.git.akhilesh@ee.iitb.ac.in>
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

Implement watchdog feature for m41t93 rtc with 1s resolution.
Implement alarm only support (WDIOF_ALARMONLY) in this commit.
Define start, stop, ping, and set_timeout callbacks as needed
by the watchdog framework.

Use selftests/watchdog/watchdog-test kselftest for testing.
Observed IRQ pin(12) of rtc chip going low after late pinging
the watchdog.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 99 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 4efd05b47597..d0eb069adb34 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -14,6 +14,7 @@
 #include <linux/spi/spi.h>
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
+#include <linux/watchdog.h>
 
 #define M41T93_REG_SSEC			0
 #define M41T93_REG_ST_SEC		1
@@ -36,6 +37,10 @@
 #define M41T93_SQW_RS_MASK		0xf0
 #define M41T93_SQW_RS_SHIFT		4
 #define M41T93_BIT_SQWE			BIT(6)
+#define M41T93_REG_WATCHDOG		0x9
+#define M41T93_WDT_RB_MASK		0x3
+#define M41T93_WDT_BMB_MASK		0x7c
+#define M41T93_WDT_BMB_SHIFT		2
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
 #define M41T93_REG_FLAGS		0xf
@@ -51,6 +56,9 @@ struct m41t93_data {
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw clks;
 #endif
+#ifdef CONFIG_WATCHDOG
+	struct watchdog_device wdd;
+#endif
 };
 
 static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
@@ -412,6 +420,92 @@ static int rtc_m41t93_clks_register(struct device *dev, struct m41t93_data *m41t
 }
 #endif
 
+#ifdef CONFIG_WATCHDOG
+static int m41t93_wdt_ping(struct watchdog_device *wdd)
+{
+	u8 resolution, mult;
+	u8 val = 0;
+	int ret;
+	struct m41t93_data *m41t93 = watchdog_get_drvdata(wdd);
+
+	/*  Resolution supported by hardware
+	 *  0b00 : 1/16 seconds
+	 *  0b01 : 1/4 second
+	 *  0b10 : 1 second
+	 *  0b11 : 4 seconds
+	 */
+	resolution = 0x2; /* hardcode resolution to 1s */
+	mult = wdd->timeout;
+	val = resolution | (mult << M41T93_WDT_BMB_SHIFT &  M41T93_WDT_BMB_MASK);
+
+	ret = regmap_write_bits(m41t93->regmap, M41T93_REG_WATCHDOG,
+				 M41T93_WDT_RB_MASK | M41T93_WDT_BMB_MASK, val);
+
+	return ret;
+}
+
+static int m41t93_wdt_start(struct watchdog_device *wdd)
+{
+	return m41t93_wdt_ping(wdd);
+}
+
+static int m41t93_wdt_stop(struct watchdog_device *wdd)
+{
+	struct m41t93_data *m41t93 = watchdog_get_drvdata(wdd);
+
+	/* Write 0 to watchdog register */
+	return regmap_write_bits(m41t93->regmap, M41T93_REG_WATCHDOG,
+				  M41T93_WDT_RB_MASK | M41T93_WDT_BMB_MASK, 0);
+}
+
+static int m41t93_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int new_timeout)
+{
+	wdd->timeout = new_timeout;
+
+	return 0;
+}
+
+static const struct watchdog_info m41t93_wdt_info = {
+	.identity = "m41t93 rtc Watchdog",
+	.options = WDIOF_ALARMONLY | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+};
+
+static const struct watchdog_ops m41t93_watchdog_ops = {
+	.owner = THIS_MODULE,
+	.start = m41t93_wdt_start,
+	.stop = m41t93_wdt_stop,
+	.ping = m41t93_wdt_ping,
+	.set_timeout = m41t93_wdt_set_timeout,
+};
+
+static int m41t93_watchdog_register(struct device *dev, struct m41t93_data *m41t93)
+{
+	int ret;
+
+	m41t93->wdd.parent = dev;
+	m41t93->wdd.info = &m41t93_wdt_info;
+	m41t93->wdd.ops = &m41t93_watchdog_ops;
+	m41t93->wdd.min_timeout = 0;
+	m41t93->wdd.max_timeout = 10;
+	m41t93->wdd.timeout = 3; /* Default timeout is 3 sec */
+	m41t93->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
+
+	watchdog_set_drvdata(&m41t93->wdd, m41t93);
+
+	ret = devm_watchdog_register_device(dev, &m41t93->wdd);
+	if (ret) {
+		dev_warn(dev, "Failed to register watchdog\n");
+		return ret;
+	}
+
+	/* Disable watchdog at start */
+	ret = m41t93_wdt_stop(&m41t93->wdd);
+
+	return ret;
+}
+#endif
+
 static struct spi_driver m41t93_driver;
 
 static const struct regmap_config regmap_config = {
@@ -465,6 +559,11 @@ static int m41t93_probe(struct spi_device *spi)
 	if (ret)
 		dev_warn(&spi->dev, "Unable to register clock\n");
 #endif
+#ifdef CONFIG_WATCHDOG
+	ret = m41t93_watchdog_register(&spi->dev, m41t93);
+	if (ret)
+		dev_warn(&spi->dev, "Unable to register watchdog\n");
+#endif
 
 	return 0;
 }
-- 
2.34.1


