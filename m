Return-Path: <linux-rtc+bounces-3385-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EECA4E83D
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17F17ABE0F
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320DC204692;
	Tue,  4 Mar 2025 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="nai7Wcce"
X-Original-To: linux-rtc@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE329C324
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107075; cv=fail; b=ffeDGDar3FhYfTrAQyKOshGzEbW6UNNw9nj8Aq2+5z81yd7fAs4iWp2FKYYVst4tELOLxQNbAEfhX8bXf9qz0O7xxHKqwuymFdBs3CTXCKbGWPHQZFuqaDM2ZmM1YS+9ebIKlbhOUNkULzdTpNY+CPZdvLrdA05/yYHjbBrZQoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107075; c=relaxed/simple;
	bh=YMx7qLuWP6vg/7a5/BEOE9nZt/RJpQmS9nMIn5RykNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pWUvaFyBE/b0znYMqylt5/6+cPghC6/3ECyVLocj8FV27Js/+yNNbsi3/MqP0T8R0qhBwPjZjsGwfdPb+ucTIsSXBp6qCSvyXUK2h0q/n2UlUpAwuhMRJdifNfIV7krsYZgOQ3QVYq6hhnGhRT4YVeodT48hfdlP7zo3vwZXs64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nai7Wcce reason="signature verification failed"; arc=none smtp.client-ip=83.149.199.84; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; arc=fail smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 318E44089284
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 19:51:10 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=nai7Wcce
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dhC15pHzFxDy
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:42:51 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id AC2EC41898; Tue,  4 Mar 2025 17:42:41 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nai7Wcce
X-Envelope-From: <linux-kernel+bounces-541868-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nai7Wcce
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 2C04442195
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:03:31 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 6DA442DCE1
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:03:30 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 800A77A5B0D
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340FE2139C4;
	Mon,  3 Mar 2025 14:02:59 +0000 (UTC)
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
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dhC15pHzFxDy
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711743.89575@R6qlUkythFR9ILaBGHUmow
X-ITU-MailScanner-SpamCheck: not spam

If rtc->sclk was enabled in at91_rtc_probe(), it must be disabled in
all error paths to ensure proper cleanup. However, if
devm_rtc_register_device() returns an error in at91_rtc_probe(), the
rtc->sclk clock will not be disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for rtc->sclk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: a975f47f6e9a ("rtc: at91sam9: use clk API instead of relying on AT=
91_SLOW_CLOCK")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/rtc/rtc-at91sam9.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 38991cca5930..f4b7cf37397f 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -375,21 +375,16 @@ static int at91_rtc_probe(struct platform_device *p=
dev)
 		return -ENOMEM;
 	}
=20
-	rtc->sclk =3D devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rtc->sclk))
+	rtc->sclk =3D devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(rtc->sclk)) {
+		dev_err(&pdev->dev, "Could not get and enable slow clock\n");
 		return PTR_ERR(rtc->sclk);
-
-	ret =3D clk_prepare_enable(rtc->sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
 	}
=20
 	sclk_rate =3D clk_get_rate(rtc->sclk);
 	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
 		dev_err(&pdev->dev, "Invalid slow clock rate\n");
-		ret =3D -EINVAL;
-		goto err_clk;
+		return -EINVAL;
 	}
=20
 	mr =3D rtt_readl(rtc, MR);
@@ -405,10 +400,8 @@ static int at91_rtc_probe(struct platform_device *pd=
ev)
 	rtt_writel(rtc, MR, mr);
=20
 	rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtcdev)) {
-		ret =3D PTR_ERR(rtc->rtcdev);
-		goto err_clk;
-	}
+	if (IS_ERR(rtc->rtcdev))
+		return PTR_ERR(rtc->rtcdev);
=20
 	rtc->rtcdev->ops =3D &at91_rtc_ops;
 	rtc->rtcdev->range_max =3D U32_MAX;
@@ -419,7 +412,7 @@ static int at91_rtc_probe(struct platform_device *pde=
v)
 			       dev_name(&rtc->rtcdev->dev), rtc);
 	if (ret) {
 		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
-		goto err_clk;
+		return ret;
 	}
=20
 	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
@@ -433,11 +426,6 @@ static int at91_rtc_probe(struct platform_device *pd=
ev)
 			 dev_name(&rtc->rtcdev->dev));
=20
 	return devm_rtc_register_device(rtc->rtcdev);
-
-err_clk:
-	clk_disable_unprepare(rtc->sclk);
-
-	return ret;
 }
=20
 /*
@@ -450,8 +438,6 @@ static void at91_rtc_remove(struct platform_device *p=
dev)
=20
 	/* disable all interrupts */
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
-
-	clk_disable_unprepare(rtc->sclk);
 }
=20
 static void at91_rtc_shutdown(struct platform_device *pdev)
--=20
2.25.1



