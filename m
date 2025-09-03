Return-Path: <linux-rtc+bounces-4808-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D428B423AC
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416271BC1F89
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A233126C7;
	Wed,  3 Sep 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="pCQMjQNM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADCE31065C
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909706; cv=none; b=Y1UPcnJ1HGHsEYZzbH6V8a7I1zf5vYF4COqsJVSD0aVgL6/HPAMiLP43eeeS56XTxhA2ZrdGi3p9ozbSl6Rz4sYGVOgs5fTkUSez0I5mcc85HL2R9CKByZpsmu4RNW+flEhHuQIaQAD5avwctaQP/McKjGUGBSc2Aj9lBhfdrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909706; c=relaxed/simple;
	bh=01fhlad7Sny1+XuY2/4ETk3iQQ94e+mlkjWPm0k07Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTYdkU4iMIf7EecLeje/SuhbOMRgCp1AGilUVkhRi22SFZaLwzO/4ZkpeFC7menexQZ6kdaUEMUI5FymVglA0lxN1bwrJo9hAOk/mhnLf47y51XyWhgJEn+PKVgqV5cdJx/oC0+FJ5H+njcXKWZdYi0D+MRGn6TtumhiGOUw9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=pCQMjQNM; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 64A8E1015C6C
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:58:21 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 64A8E1015C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909701; bh=01fhlad7Sny1+XuY2/4ETk3iQQ94e+mlkjWPm0k07Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCQMjQNMs1JXU/yElscJEHgWtFni9y5lBozutFrQ55H65Z9snI6UvY51ywN6UqQum
	 J+0g8suZBXBHl9S6CwoMMHr7WmR5F84G875DSg0PxMaixg25Kb6itu7frp/3nbjSNr
	 RhbTMvUG6aBChVkzKqojebZUclIDOF299+nC38Fc=
Received: (qmail 741 invoked by uid 510); 3 Sep 2025 19:58:21 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.8/7.0):. Processed in 3.493614 secs; 03 Sep 2025 19:58:21 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 3 Sep 2025 19:58:17 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 30DDB3414F0;
	Wed,  3 Sep 2025 19:58:17 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id BFFCD1E8143E;
	Wed,  3 Sep 2025 19:58:16 +0530 (IST)
Date: Wed, 3 Sep 2025 19:58:11 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 7/7] rtc: m41t93: Add watchdog support
Message-ID: <694706ad8577a36ef8948e0d9ca7ea561900fbc2.1756908788.git.akhilesh@ee.iitb.ac.in>
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

Implement watchdog feature driver for m41t93 rtc with 1s resolution and
alarm only mode. Define start, stop, ping, and set_timeout callbacks
as needed by watchdog framework.

Tested by observing IRQ pin(12) going low after intentionally not pinging
watchdog.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 93 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 83cc34c4baae..e549c5f1e11a 100644
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
@@ -52,6 +57,7 @@ struct m41t93_data {
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw clks;
 #endif
+	struct watchdog_device wdd;
 };
 
 static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
@@ -409,6 +415,90 @@ static int rtc_m41t93_clks_register(struct device *dev, struct m41t93_data *m41t
 }
 #endif
 
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
+	.options = WDIOF_ALARMONLY,
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
+
 static struct spi_driver m41t93_driver;
 
 static const struct regmap_config regmap_config = {
@@ -470,6 +560,9 @@ static int m41t93_probe(struct spi_device *spi)
 	if (ret)
 		dev_warn(&spi->dev, "Unable to register clock\n");
 #endif
+	ret = m41t93_watchdog_register(&spi->dev, m41t93);
+	if (ret)
+		dev_warn(&spi->dev, "Unable to register watchdog\n");
 
 	return 0;
 }
-- 
2.34.1


