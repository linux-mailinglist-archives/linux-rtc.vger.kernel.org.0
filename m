Return-Path: <linux-rtc+bounces-5099-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18ABEE1F8
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01620189E368
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C472E427B;
	Sun, 19 Oct 2025 09:21:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E8A2E0410;
	Sun, 19 Oct 2025 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865696; cv=none; b=c54SC6y6U+0h3poITJrsNEbXtaxVaLewMVz0LF08TTnXBky7fvK+pnSOmY0Fyra2lpS1ZObiqQ6PqFS0mk8psvzJCzkLxacSlLdJXmRF9Gbw/VX0Gu5Wtj8j9aKcIDkK+n2UUn58YjwqfIEn84AqOZoNt1IFSExN7vNbsULSP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865696; c=relaxed/simple;
	bh=54d6mW08zCH+ECBeih5e8SDsX2nZbAIG8H3d2EyCXic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwOfwug/SB7YxHLdgIneCtidpd7lHs8e62bvgbetCuCvTYZcrK16Sb1xi7rf8HpNS9wkuHTMT+PcOfXGHRqMCZoPU+vPT68hns5jwMrCEMZp91jkYu5vqXNmGkNf+hyXfG4lXFZiZ+NBrMjSyJHCm6L786Y80eM+FZogyhNu3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 1pFkQ76xQ5W19JC0BO1VNw==
X-CSE-MsgGUID: xcZ7kxPoR+W/2U41fSTucg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:34 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 68DF2416123C;
	Sun, 19 Oct 2025 18:21:29 +0900 (JST)
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
Subject: [PATCH 4/6] rtc: renesas-rtca3: Add support for RZ/V2H SoC
Date: Sun, 19 Oct 2025 09:21:04 +0000
Message-ID: <20251019092106.5737-5-ovidiu.panait.rb@renesas.com>
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

Add a new compatible string for the Renesas RZ/V2H RTC along with the SoC
specific OF data, to account for the different maximum periodic interrupt
frequency (128Hz).

Also, switch from devm_reset_control_get_shared() to
devm_reset_control_array_get_shared() when retrieving resets.
The RZ/V2H SoC requires two resets for the RTC block instead of one,
so this will allow to handle multiple resets without additional changes.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 90dda04fad33..96f5d3734d93 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -738,7 +738,7 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->rstc = devm_reset_control_get_shared(dev, NULL);
+	priv->rstc = devm_reset_control_array_get_shared(dev);
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
@@ -887,11 +887,16 @@ static int rtca3_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rtca3_pm_ops, rtca3_suspend, rtca3_resume);
 
+static const struct rtca3_of_data rtca3_rzv2h_of_data = {
+	.max_periodic_irq_freq = 128,
+};
+
 static const struct rtca3_of_data rtca3_of_data = {
 	.max_periodic_irq_freq = 256,
 };
 
 static const struct of_device_id rtca3_of_match[] = {
+	{ .compatible = "renesas,r9a09g057-rtca3", .data = &rtca3_rzv2h_of_data },
 	{ .compatible = "renesas,rz-rtca3", .data = &rtca3_of_data },
 	{ /* sentinel */ }
 };
-- 
2.51.0


