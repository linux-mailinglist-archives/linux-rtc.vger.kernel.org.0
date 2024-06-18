Return-Path: <linux-rtc+bounces-1356-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2490D73D
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 17:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB44C1C23F0E
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 15:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1F823777;
	Tue, 18 Jun 2024 15:26:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B656200B7;
	Tue, 18 Jun 2024 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724413; cv=none; b=D8CNhLpSGk14FCjxFQppdnArfbHNejFr2LYuvqYaPnH5VPFKRY683PzbFxpvsUio17xqIufzLGKMIBTB07hHEiSNlFUPUS0Y0+2KtsMnRy6SmB2wLVCbfpCDPWDKswM+315DPz8+bHhlGP6zmP+wgncAKr5Vhg1Az9h6yAN2mXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724413; c=relaxed/simple;
	bh=wC1F57KiEMRBwimtAXPqU6OCnb10sX4cGliwg7ktSpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mk88twJVOg9p66EiQ2A47fFHQGCBFVK42IZ4wVZ2BXl0onlpSG8bJWpN6LhqqKE97htDcZUeZSYTB5SmL1ccj0ZRnv5nC4zur4ZOz4wI42kn74UX8c/EBdI0BTrK87t+PtJxmHIJdebqxPTwBuFvXeTh+W14mxI5NYe3464ASvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,247,1712588400"; 
   d="scan'208";a="208427472"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jun 2024 00:26:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 004924006A90;
	Wed, 19 Jun 2024 00:26:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] rtc: isl1208: Add a delay for clearing alarm
Date: Tue, 18 Jun 2024 16:26:30 +0100
Message-ID: <20240618152635.48956-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
References: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the latest HW manual[1], the INT# output is pulled low after the
alarm is triggered. After the INT# output is pulled low, it is low for at
least 250ms, even if the correct action is taken to clear it. It is
impossible to clear ALM if it is still active. The host must wait for the
RTC to progress past the alarm time plus the 250ms delay before clearing
ALM.

[1]https://www.renesas.com/us/en/document/dst/raa215300-datasheet?r=1506351

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index e50c23ee1646..c58063d917d6 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -7,6 +7,7 @@
 
 #include <linux/bcd.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -628,6 +629,18 @@ isl1208_rtc_interrupt(int irq, void *data)
 	struct isl1208_state *isl1208 = i2c_get_clientdata(client);
 	int handled = 0, sr, err;
 
+	if (!isl1208->config->has_tamper) {
+		/*
+		 * The INT# output is pulled low 250ms after the alarm is
+		 * triggered. After the INT# output is pulled low, it is low for
+		 * at least 250ms, even if the correct action is taken to clear
+		 * it. It is impossible to clear ALM if it is still active. The
+		 * host must wait for the RTC to progress past the alarm time
+		 * plus the 250ms delay before clearing ALM.
+		 */
+		msleep(250);
+	}
+
 	/*
 	 * I2C reads get NAK'ed if we read straight away after an interrupt?
 	 * Using a mdelay/msleep didn't seem to help either, so we work around
-- 
2.43.0


