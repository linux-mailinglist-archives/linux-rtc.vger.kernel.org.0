Return-Path: <linux-rtc+bounces-5115-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2CBF52DD
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 10:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC6B466739
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 08:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC5F2EBDCA;
	Tue, 21 Oct 2025 08:07:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447492EBDC0;
	Tue, 21 Oct 2025 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034056; cv=none; b=YHTKcE4HMiEYbz6AvPnHrSfW23SyucF0gMeDuzNH5jFnKzI7ZZsh+9OqAcsgPT2q7dP4pvSd+rIw+eynQH/k4EBMcu1eGpWhP6DmjenS+rKA9UYO0klqrN6KuGQBNrUltY8JCBW8txuoYv/4j28pSJgPuVk2UwO5VtTK/WUvmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034056; c=relaxed/simple;
	bh=hxNEhQejS4epPIbloiZct/hDW/klgzkaMUaPPjdvkHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4E7dXFZOPl3MF8a8xBtwx0l9YXPtiWcf5wHA0s325VE5qVLV9lB4ns6oSsDuQVOqD5lPmlFaUCKK9/aXmxJuCgapX0sdZB8F2ZhDlcC8QQEtNsdOZZySxqiZZrGQBqafuBuLiinST81Z7aMOVJtXBPvBEAIoQr+GZYc/HV5Hyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: gX5LGRUMS3S1O53l7HKzEg==
X-CSE-MsgGUID: tPm+ToqcQxaQG9Snc1KJYw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Oct 2025 17:07:33 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 889E64141C94;
	Tue, 21 Oct 2025 17:07:28 +0900 (JST)
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
Subject: [PATCH v2 4/6] rtc: renesas-rtca3: Add support for RZ/V2H SoC
Date: Tue, 21 Oct 2025 08:07:03 +0000
Message-ID: <20251021080705.18116-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
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
v2 changes: none

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


