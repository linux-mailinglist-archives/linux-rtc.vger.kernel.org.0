Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141832B3D8
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfE0MBA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:01:00 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37865 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfE0MBA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:01:00 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 79200200016;
        Mon, 27 May 2019 12:00:57 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 06/10] rtc: sun6i: Add R40 compatible
Date:   Mon, 27 May 2019 14:00:38 +0200
Message-Id: <00f6de1a4e012d5ad9a4eef054d0e19d534f067d.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The R40 has a quite different RTC, with only a single interrupt line, but
two clock outputs. Let's add a compatible.

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
