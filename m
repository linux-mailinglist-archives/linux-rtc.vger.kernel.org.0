Return-Path: <linux-rtc+bounces-379-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33611800959
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 12:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C4F1C209C4
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD454210EB;
	Fri,  1 Dec 2023 11:08:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 396091B2;
	Fri,  1 Dec 2023 03:08:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="188861547"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2023 20:08:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7D69440108F2;
	Fri,  1 Dec 2023 20:08:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/6] rtc: da9063: Use device_get_match_data()
Date: Fri,  1 Dec 2023 11:08:36 +0000
Message-Id: <20231201110840.37408-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_match_node()->device_get_match_data() for
the data associated with device match.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-da9063.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 613ba2c5d757..a1ee0705ca88 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -377,7 +377,6 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 {
 	struct da9063_compatible_rtc *rtc;
 	const struct da9063_compatible_rtc_regmap *config;
-	const struct of_device_id *match;
 	int irq_alarm;
 	u8 data[RTC_DATA_LEN];
 	int ret;
@@ -385,14 +384,11 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENXIO;
 
-	match = of_match_node(da9063_compatible_reg_id_table,
-			      pdev->dev.of_node);
-
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->config = match->data;
+	rtc->config = device_get_match_data(&pdev->dev);
 	if (of_device_is_compatible(pdev->dev.of_node, "dlg,da9063-rtc")) {
 		struct da9063 *chip = dev_get_drvdata(pdev->dev.parent);
 
-- 
2.25.1


