Return-Path: <linux-rtc+bounces-6614-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM4YC2+dHmq5CgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6614-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:07:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF962B102
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 302DE301C68F
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 09:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5C33CAA51;
	Tue,  2 Jun 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="EI0Za1s5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E68E3CAA48;
	Tue,  2 Jun 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391047; cv=none; b=LJZXazI6SDU9dU49pRoR43B6JOqsKK2akquoKOq1pfooPXNpUEWuTgLAIsunucO3PovG6b5ZXvDTljJ8ninZAMI9qBnZgn7qOi/hnhkp+UDZ4NlV9aV+tmDuk5wEqsLPL67d3JaM0yfSEgC7F6ydAx4XT2O3COttyqtlPrE422I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391047; c=relaxed/simple;
	bh=TmwNvRU5JGmuk7QhxlzVsKnPW8fkOD3xhGVhBTM2hrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIaBERD2iNmSj6Zr4/lmRKZIUmSiFp5vrP3lw+vIOH1g4NgP28MTeQfJCRNvpiN49XAoe0q9tAn0uOke9upJMNbRqDf4rcj4EbKJHvM8l6WR17Lll2msIwhGcISLmbl6jGCuBLwxE3uHb4gKumx3yfYOC2F5ZNjJuUWyUlG4618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=EI0Za1s5; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8382C58307D;
	Tue,  2 Jun 2026 08:36:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BACF53E9F5;
	Tue,  2 Jun 2026 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780389397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2StCb0XxuWRTxii1OsJ7SwSKkwi3VYbBfMK9IvuOBs8=;
	b=EI0Za1s539XXcbzJBV91lODyBEe427IGklIpvTyJBmiT6Xpuq8gGFmwRbNaQpFmN30t64E
	l0WROorbefEcDtSLiZmpBz1a0HY8pddHrkFDuZCgci7xdXJSqFRZVyrQaWngumJbD3yquc
	h748jn7nxk2gtxhqC7rpH9aYnYY4EKYEG1rtFwTlEdx2JrKQTFLzBueHyYEjZf7MRNWxrI
	jdKNiY2y+yveyJgeVva+HKSaIqH9bmCI7b3AHXQt8O0D/dmkRbbHFlpFVEsj3cCimat49b
	QtewVgfxXfM/2QQaz16k+0SFitKl4MuXpWLEIzJftlR5WEDkn3kY5le9fS+Ujg==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Tue, 02 Jun 2026 10:36:18 +0200
Subject: [PATCH 2/2] m68k: coldfire/m5441x: register the on-chip RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-jmh-upstream-coldfire-rtc-v1-2-1e129a177d2f@yoseli.org>
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
In-Reply-To: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780389394; l=1672;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=TmwNvRU5JGmuk7QhxlzVsKnPW8fkOD3xhGVhBTM2hrQ=;
 b=+ZMktkeaBEl4mUAlWw8z2OCWI9g1nhRUCzhSy/1Bg1zdW3dXlHeA+j9FtM6/IradO5loOavKJ
 FHYu7r7xqywCYq8uqeZ9N2l5pJpN0PBv8e+Ha40GkRs1C5YG5OVGCz6
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEsnfONNs296jSZuB3SroO9mv8NDw0zsJVF00UexSuwOsMW85G0//OCxbGa+0b/Pc7F4frE2obwOtkyy7cUUtBCoxR+DtZRV3KYgq2nWJ61fO6JvHVMcGwfQQlPQ61H1g2ybjvkwfHtAbn4BFLjC2BgSkmClKA1Rq4RPH2qUXuAxpvXhVzQ8X0e9oPyFovYzOvj/+M/CUiboM+bPWlKwEgSHrSG5ifeFVfOSPTUEBE7yKrZPV62zERrnZUgX1kb3rWcYUP1GNs/AC9rz/7bUsBd0iZyWWDYLCqLCx2e9wi6/iDBJjPZnhyGnVKh3l/A3uf7s4roGFRW068pQYd2jgHbs26YItc8h1n4gzSRAKtxinCFFaR8slG+4ei8dlxyz6M28mR8zso+Mmi3thRxX/IbnFVUbVjfWHl0QezXlJsCM207nqPiIRo7aqaV7Mzm963Z4rwTeUeBMIxbYPQRAXNedsGxWDRTvSY7VEEwtJ3fMDwkPmNxKvEZOWkIQsJAEBm35ybfUJbLzC4qYSMwqlGclONU2XJjM58FshqrmRPv0YIVz2QlWUVoqwsduYkVKL+I3yOwvToWYF8wvaOy/rqM/NFhg+nIIrLVvGNb24Wp+BdA7se2Ss5yXGDgttDm0OWm4yTJHwM+enc2NiwGVMYI0tdJdflMGCFgvzU3jq33CA
X-Rspamd-Queue-Id: 41EF962B102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[yoseli.org:+];
	TAGGED_FROM(0.00)[bounces-6614-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yoseli.org:mid,yoseli.org:dkim,yoseli.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Register the MCF5441x on-chip RTC platform device from the SoC code so
every MCF5441x board gets the rtc-m5441x driver (time/calendar plus the
battery-backed standby RAM via nvmem) without a per-board file.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/coldfire/m5441x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 7a25cfc7ac07..b79aebdfd567 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -10,6 +10,7 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
@@ -239,6 +240,34 @@ static void __init m5441x_fec_init(void)
 	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
 }
 
+/*
+ * On-chip "robust" RTC. Exposes the time/calendar and the 2KB
+ * battery-backed standby RAM (rtc-m5441x driver).
+ */
+static struct resource m5441x_rtc_resource[] = {
+	{
+		.start	= MCFRTC_BASE,
+		.end	= MCFRTC_BASE + MCFRTC_SIZE - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	{
+		.start	= MCF_IRQ_RTC,
+		.end	= MCF_IRQ_RTC,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static int __init m5441x_rtc_init(void)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_simple("rtc-m5441x", -1,
+					       m5441x_rtc_resource,
+					       ARRAY_SIZE(m5441x_rtc_resource));
+	return PTR_ERR_OR_ZERO(pdev);
+}
+arch_initcall(m5441x_rtc_init);
+
 void __init config_BSP(char *commandp, int size)
 {
 	m5441x_clk_init();

-- 
2.39.5


