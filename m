Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD752D050
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfE1UbF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:31:05 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57715 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1UbE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:31:04 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C10F2200019;
        Tue, 28 May 2019 20:31:00 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 06/11] rtc: sun6i: Add R40 compatible
Date:   Tue, 28 May 2019 22:30:36 +0200
Message-Id: <8f5e4f8c504bebc9572e33cbaa1a8a3c045cf21d.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The R40 has a quite different RTC, with only a single interrupt line, but
two clock outputs. Let's add a compatible.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 11f56de52179..9fab8ed856f4 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -681,6 +681,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
+	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
 	{ /* sentinel */ },
-- 
git-series 0.9.1
