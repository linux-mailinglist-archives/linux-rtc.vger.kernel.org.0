Return-Path: <linux-rtc+bounces-3369-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89680A4C2B0
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 15:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E2A97A276B
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 14:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3934B212B17;
	Mon,  3 Mar 2025 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="nai7Wcce"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BF1F4167;
	Mon,  3 Mar 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010576; cv=none; b=ocSCzbdzChZFOjmwAzWMUEbbIJvE76tKUKqNp4ssxEiOGIemvQ/CeEBqIPVUIypx/VP7zMOUXxeiN3LVNAo+Qx9iZ82Mo8dI6IQ63VZ6P5al8qedhl+3kQShBFRF843DlRwAoHjklQ4cBDFfCVfb+5xyU2csXteWmMJbY6fmo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010576; c=relaxed/simple;
	bh=un//m18e0EyZu6pJVZ/eIwmeKA7wLXFC7L5MaYP//fo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dqG/N64ukZ7Mt8pQsyOjVoMm6sPa7UzB7BwfL2HiVUZaJ0CSJwOJHPmACnAIZpx1aul4TirJugN2bGd2WiY9OYIW2v3xCBcOyk4IA9VQffa7A8/zcxu/zqbqQXHN4fEo/MR1XiLQEkk+H16A0BBhCqMIYy3NrZ8mGZ/tZZ4LY/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nai7Wcce; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 02E6340CE182;
	Mon,  3 Mar 2025 14:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 02E6340CE182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741010564;
	bh=vqgSkFlCQVJ4CaUUmVwPWsAun4vxgHbAxdBt/2bRvcU=;
	h=From:To:Cc:Subject:Date:From;
	b=nai7WcceMGUZcGUxKsLVw+ByZ0zB426L99V6BXimgqOYhZ0gpVanAUZ6qjH6bN2NQ
	 JPdn355SI9GJztXnYg9j9JJcOl8euBD3CbkJPzwu8husGgSvIqsokUvUxf07nI7x8M
	 QOwFvGitGwy4NiKVWp8R2jIDFXoYzmRY26HJDwZA=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: at91sam9: fix call balance of rtc->sclk handling routines
Date: Mon,  3 Mar 2025 17:02:29 +0300
Message-Id: <20250303140229.642959-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If rtc->sclk was enabled in at91_rtc_probe(), it must be disabled in
all error paths to ensure proper cleanup. However, if
devm_rtc_register_device() returns an error in at91_rtc_probe(), the
rtc->sclk clock will not be disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for rtc->sclk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: a975f47f6e9a ("rtc: at91sam9: use clk API instead of relying on AT91_SLOW_CLOCK")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/rtc/rtc-at91sam9.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 38991cca5930..f4b7cf37397f 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -375,21 +375,16 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rtc->sclk))
+	rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(rtc->sclk)) {
+		dev_err(&pdev->dev, "Could not get and enable slow clock\n");
 		return PTR_ERR(rtc->sclk);
-
-	ret = clk_prepare_enable(rtc->sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
 	}
 
 	sclk_rate = clk_get_rate(rtc->sclk);
 	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
 		dev_err(&pdev->dev, "Invalid slow clock rate\n");
-		ret = -EINVAL;
-		goto err_clk;
+		return -EINVAL;
 	}
 
 	mr = rtt_readl(rtc, MR);
@@ -405,10 +400,8 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	rtt_writel(rtc, MR, mr);
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtcdev)) {
-		ret = PTR_ERR(rtc->rtcdev);
-		goto err_clk;
-	}
+	if (IS_ERR(rtc->rtcdev))
+		return PTR_ERR(rtc->rtcdev);
 
 	rtc->rtcdev->ops = &at91_rtc_ops;
 	rtc->rtcdev->range_max = U32_MAX;
@@ -419,7 +412,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			       dev_name(&rtc->rtcdev->dev), rtc);
 	if (ret) {
 		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
@@ -433,11 +426,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			 dev_name(&rtc->rtcdev->dev));
 
 	return devm_rtc_register_device(rtc->rtcdev);
-
-err_clk:
-	clk_disable_unprepare(rtc->sclk);
-
-	return ret;
 }
 
 /*
@@ -450,8 +438,6 @@ static void at91_rtc_remove(struct platform_device *pdev)
 
 	/* disable all interrupts */
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
-
-	clk_disable_unprepare(rtc->sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


