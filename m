Return-Path: <linux-rtc+bounces-3282-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF81A48003
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82C1117CDF0
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02946231C9C;
	Thu, 27 Feb 2025 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gX8Dsmg7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4C7233158
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663821; cv=none; b=Msv+/BpUw5uhJhFrs5MTiuvzXL+h6Ow4B+uBcaxRhP46PT91tibcNcYIZ0i5VXV93j0kgHcIg2YnOL+KQJrx9od9E+R9H3pWp8O96CEe+/uOrp6JBZK4o1G9XW5cf9cLoktrPPB3kfdnkC71kfBXD4jxcVxeNnkllNtoo7Jqzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663821; c=relaxed/simple;
	bh=U01MmYcykOio02hH5Iam3dBQe4D52OjWeMXxSQipVgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+lMvMwczWdXqe+kHbO5lwa5aG9WgR9gqQjMdX5thNXWX09L+cy4AxfusR7utE22xYUHWRtWjdRWsVlAzONFQm/d/V3SPH1dcDdnrP2Og/rUeiuIoi0Ury9HQvGBtl4EMPMbydc4KehdWNjKUT7MmoB+9kZFVmiLXg5PuvKCBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gX8Dsmg7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bEUxNHlKC6W56Uy15CrG0xWxKg+OIhIXHlA/sYPS2xg=; b=gX8Dsm
	g7ff2qBjAFU6KtfC1vwxELAR6mPvG0kqlWe93qDPtsjYioa0lcaSS5VXuChukvoC
	KuQAkoLLE395tUJ3pl+2vLgHRMmB00Jq6fl4m0Soc0GYVQBZQgNfPLLfTIQqNugO
	7m/MOBrivr9COST35uauBFVkFqxE0yet3HpFczsb8HAN6N+GXYSJeJbZhh12/V+H
	DyqZnAw0Qp+gsEbXdP2AdmjH8dihaeIux/ZJzRyfsnavtppZrqgA+2/qvs9cVADh
	TKN1gDIFdTp/77iLV9OhS2mxDv+L1BztYZdR0tXj2JoE4K57Fhp039EazDK6Rsev
	yx1iUfSXHzqwQmrw==
Received: (qmail 962485 invoked from network); 27 Feb 2025 14:43:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:37 +0100
X-UD-Smtp-Session: l3s3148p1@mil44B8vbDVtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 8/8] rtc: sh: minor fixes to adhere to coding style
Date: Thu, 27 Feb 2025 14:43:03 +0100
Message-ID: <20250227134256.9167-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the BIT macro, use curly braces for else-blocks, don't split strings
over multiple lines, annotate the lock, update copyright.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 3bafb2a0659d..f15ef3aa82a0 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2006 - 2009  Paul Mundt
  * Copyright (C) 2006  Jamie Lenehan
  * Copyright (C) 2008  Angelo Castello
+ * Copyright (C) 2025  Wolfram Sang, Renesas Electronics Corporation
  *
  * Based on the old arch/sh/kernel/cpu/rtc.c by:
  *
@@ -31,7 +32,7 @@
 /* Default values for RZ/A RTC */
 #define rtc_reg_size		sizeof(u16)
 #define RTC_BIT_INVERTED        0	/* no chip bugs */
-#define RTC_CAP_4_DIGIT_YEAR    (1 << 0)
+#define RTC_CAP_4_DIGIT_YEAR    BIT(0)
 #define RTC_DEF_CAPABILITIES    RTC_CAP_4_DIGIT_YEAR
 #endif
 
@@ -70,26 +71,26 @@
  */
 
 /* ALARM Bits - or with BCD encoded value */
-#define AR_ENB		0x80	/* Enable for alarm cmp   */
+#define AR_ENB		BIT(7)	/* Enable for alarm cmp   */
 
 /* RCR1 Bits */
-#define RCR1_CF		0x80	/* Carry Flag             */
-#define RCR1_CIE	0x10	/* Carry Interrupt Enable */
-#define RCR1_AIE	0x08	/* Alarm Interrupt Enable */
-#define RCR1_AF		0x01	/* Alarm Flag             */
+#define RCR1_CF		BIT(7)	/* Carry Flag             */
+#define RCR1_CIE	BIT(4)	/* Carry Interrupt Enable */
+#define RCR1_AIE	BIT(3)	/* Alarm Interrupt Enable */
+#define RCR1_AF		BIT(0)	/* Alarm Flag             */
 
 /* RCR2 Bits */
-#define RCR2_RTCEN	0x08	/* ENable RTC              */
-#define RCR2_ADJ	0x04	/* ADJustment (30-second)  */
-#define RCR2_RESET	0x02	/* Reset bit               */
-#define RCR2_START	0x01	/* Start bit               */
+#define RCR2_RTCEN	BIT(3)	/* ENable RTC              */
+#define RCR2_ADJ	BIT(2)	/* ADJustment (30-second)  */
+#define RCR2_RESET	BIT(1)	/* Reset bit               */
+#define RCR2_START	BIT(0)	/* Start bit               */
 
 struct sh_rtc {
 	void __iomem		*regbase;
 	int			alarm_irq;
 	struct clk		*clk;
 	struct rtc_device	*rtc_dev;
-	spinlock_t		lock;
+	spinlock_t		lock;		/* protecting register access */
 	unsigned long		capabilities;	/* See asm/rtc.h for cap bits */
 };
 
@@ -183,10 +184,8 @@ static int sh_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		tm->tm_sec--;
 #endif
 
-	dev_dbg(dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
-		"mday=%d, mon=%d, year=%d, wday=%d\n",
-		__func__,
-		tm->tm_sec, tm->tm_min, tm->tm_hour,
+	dev_dbg(dev, "%s: tm is secs=%d, mins=%d, hours=%d, mday=%d, mon=%d, year=%d, wday=%d\n",
+		__func__, tm->tm_sec, tm->tm_min, tm->tm_hour,
 		tm->tm_mday, tm->tm_mon + 1, tm->tm_year, tm->tm_wday);
 
 	return 0;
@@ -373,8 +372,9 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 			clk_id = 0;
 
 		snprintf(clk_name, sizeof(clk_name), "rtc%d", clk_id);
-	} else
+	} else {
 		snprintf(clk_name, sizeof(clk_name), "fck");
+	}
 
 	rtc->clk = devm_clk_get(&pdev->dev, clk_name);
 	if (IS_ERR(rtc->clk)) {
@@ -501,8 +501,8 @@ static struct platform_driver sh_rtc_platform_driver __refdata = {
 module_platform_driver_probe(sh_rtc_platform_driver, sh_rtc_probe);
 
 MODULE_DESCRIPTION("SuperH on-chip RTC driver");
-MODULE_AUTHOR("Paul Mundt <lethal@linux-sh.org>, "
-	      "Jamie Lenehan <lenehan@twibble.org>, "
-	      "Angelo Castello <angelo.castello@st.com>");
+MODULE_AUTHOR("Paul Mundt <lethal@linux-sh.org>");
+MODULE_AUTHOR("Jamie Lenehan <lenehan@twibble.org>");
+MODULE_AUTHOR("Angelo Castello <angelo.castello@st.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.45.2


