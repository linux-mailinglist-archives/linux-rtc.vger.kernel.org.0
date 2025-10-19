Return-Path: <linux-rtc+bounces-5096-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D6BEE1C2
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0446E3BFECA
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20BC2E1C6B;
	Sun, 19 Oct 2025 09:21:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13DC2E1758;
	Sun, 19 Oct 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865687; cv=none; b=NcxxDw0KSxF/t3LdVO5MrTPMlvE+EnpD2JDwo4MVvGBD0dQCP67CC6VV/0dalnbQ7AT/Ukpglewp5vJ10OxbojgX1uFatjpD9PBfBAFhm5I7XDqPy+QFzJrWDlP1mR3GErP+y+IWVAVCGn07hDdlgxOE5+ulfVvbqF06FmlEKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865687; c=relaxed/simple;
	bh=ZJ8J/vC3cADxPyE1txKIQl0FLVRW1yDOQd1VecaW6PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNxjVHXJ5M8DqPnwAISoixhVgz8q8JR7BfqzusgUuGSOutYkZGwYUKKv2vCrkHTlRmJNveYHU5b0bF3mPO1Opk5IqFGEnBM5UqeFB6cxx5N8sF1Uwv3H8vXPwjzG/d2DRRSFe+mEWHpN0e17xUYY+BkoXWEuGXG8wE2PQ9lGNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 6zgvx57ATemuihGNR93/oQ==
X-CSE-MsgGUID: GqCo1ju1TeqAcruSU0ahlg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:18 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9E30B416123C;
	Sun, 19 Oct 2025 18:21:13 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: renesas: r9a09g057: Add clock and reset entries for RTC
Date: Sun, 19 Oct 2025 09:21:01 +0000
Message-ID: <20251019092106.5737-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add module clock and reset entries for the RTC module on the Renesas RZ/V2H
(R9A09G057) SoC.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index c9c117c6782c..100cd56c323e 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -241,6 +241,8 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rtc_0_clk_rtc",		CLK_PLLCM33_DIV16, 5, 3, 2, 19,
+						BUS_MSTOP(3, BIT(11) | BIT(12))),
 	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
 						BUS_MSTOP(11, BIT(0))),
 	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
@@ -411,6 +413,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
+	DEF_RST(7, 9, 3, 10),		/* RTC_0_RST_RTC */
+	DEF_RST(7, 10, 3, 11),		/* RTC_0_RST_RTC_V */
 	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
 	DEF_RST(7, 12, 3, 13),		/* RSPI_0_TRESETN */
 	DEF_RST(7, 13, 3, 14),		/* RSPI_1_PRESETN */
-- 
2.51.0


