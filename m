Return-Path: <linux-rtc+bounces-5296-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCBC41C27
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 22:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F08B050088E
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 21:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD2334DB75;
	Fri,  7 Nov 2025 21:07:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1A734D4F8;
	Fri,  7 Nov 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549649; cv=none; b=BLOf8Rp5KrWfOQw/AIv7Gp/QMO0DilFJcmwjU2pAtqalcK177DTQf/SDeN6zSfjsLcibHAdRylG7KN+uPKtsXplC6n1kP5+yuiO57pKJ66ksFqsWw1beUf0pyGe8XFj4U6ASQ2MMSZ/I2IfqkaiaFzdymw6zLz4CvDYCktJdCjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549649; c=relaxed/simple;
	bh=3N8gIO/Y4gG4k9D1S3MyWA/zSzgWm6SqqO6yp+Jsvr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeoB49pOanQAvaRAkff9/0WS6MSOvwQ4pvXkb5bs3QYzo3dYOASlvnDCA72VxHDZtVO9mJ7uyZCz52puMbyjsgb/kCM76sbbqlFstn2HV0FJBT7FY/cjFW4f5AsjRCp2dOTEyC9RazzENHBUcFwB871avHwxCy+YFHfstO2Bk00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 0TFrevXxTHa6J+c+2TrDug==
X-CSE-MsgGUID: xCV7I5+ZR1WK0fstiXgNJA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2025 06:07:20 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A8A414007D1A;
	Sat,  8 Nov 2025 06:07:16 +0900 (JST)
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
Subject: [PATCH v4 2/4] rtc: renesas-rtca3: Add support for multiple reset lines
Date: Fri,  7 Nov 2025 21:07:04 +0000
Message-ID: <20251107210706.45044-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
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


