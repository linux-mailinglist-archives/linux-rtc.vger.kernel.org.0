Return-Path: <linux-rtc+bounces-5244-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A602EC2B9E4
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 13:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE57C188EE7F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 12:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9493E30CDA8;
	Mon,  3 Nov 2025 12:19:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424B130C35D;
	Mon,  3 Nov 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172350; cv=none; b=ZTdWQdZ+KOnF6qcQzuH/3YoHqK2tqw3VvvqMqFAoddhKTc0sRBD9yTYlngPwmy5zQu+jx11DE70EGcG2m4jvHXe6zklRxhdGgJbZh6Baoj3eGHTHOBBPZPKaqd5Q6HNtakAU2GqyvX/DOVUPx5BDdccNx93aOVO4DZMsLAhX6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172350; c=relaxed/simple;
	bh=3N8gIO/Y4gG4k9D1S3MyWA/zSzgWm6SqqO6yp+Jsvr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLMzHpUOKTlOik7dFrZPiAg/tk5n04IZI6YVrD/N8qCUdlB8WmC+LSKLdUcVi6S71yEtr8X/ksME81QKyRKtj4aOkyteW9k9MYoDOs26kI8DTq2H2LXrSdTPWsoImEFiZ8GPzhGMfNlNTaT3AV2YJIlaBWsz5osmEVQug+8ZHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: dbX8V8riQ0amEsKqVFItpA==
X-CSE-MsgGUID: pG33qdE+TpW6d0fUKH5QlA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Nov 2025 21:19:03 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.152])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 602DA40065BE;
	Mon,  3 Nov 2025 21:18:59 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] rtc: renesas-rtca3: Add support for multiple reset lines
Date: Mon,  3 Nov 2025 12:18:46 +0000
Message-ID: <20251103121848.6539-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from devm_reset_control_get_shared() to
devm_reset_control_array_get_shared() when retrieving resets.

The RZ/V2H SoC requires two resets for the RTC block instead of one,
so this will allow to handle multiple resets without additional changes.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index ab816bdf0d77..3524053269ef 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -726,7 +726,7 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->rstc = devm_reset_control_get_shared(dev, NULL);
+	priv->rstc = devm_reset_control_array_get_shared(dev);
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
-- 
2.51.0


