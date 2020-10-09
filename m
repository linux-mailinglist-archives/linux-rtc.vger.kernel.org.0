Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6AD288CB9
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Oct 2020 17:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389352AbgJIPbK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Oct 2020 11:31:10 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39501 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389144AbgJIPbJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Oct 2020 11:31:09 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 164D51BF208;
        Fri,  9 Oct 2020 15:31:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] rtc: rv3028: fix clock output support
Date:   Fri,  9 Oct 2020 17:30:58 +0200
Message-Id: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3028_clkout_set_rate unconditionally sets RV3028_CLKOUT_CLKOE but
clk_set_rate may be called with the clock disabled. Ensure the clock is
kept disabled if it was not yet enabled.

Also, the actual rate was overwritten when enabling the clock, properly
write to the register only once.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index ec84db0b3d7a..fcc21b1b07b4 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -619,24 +619,23 @@ static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long parent_rate)
 {
 	int i, ret;
+	u32 enabled;
 	struct rv3028_data *rv3028 = clkout_hw_to_rv3028(hw);
 
+	ret = regmap_read(rv3028->regmap, RV3028_CLKOUT, &enabled);
+	if (ret < 0)
+		return ret;
+
 	ret = regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++) {
-		if (clkout_rates[i] == rate) {
-			ret = regmap_update_bits(rv3028->regmap,
-						 RV3028_CLKOUT,
-						 RV3028_CLKOUT_FD_MASK, i);
-			if (ret < 0)
-				return ret;
+	enabled &= RV3028_CLKOUT_CLKOE;
 
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] == rate)
 			return regmap_write(rv3028->regmap, RV3028_CLKOUT,
-				RV3028_CLKOUT_CLKSY | RV3028_CLKOUT_CLKOE);
-		}
-	}
+					    RV3028_CLKOUT_CLKSY | enabled | i);
 
 	return -EINVAL;
 }
-- 
2.26.2

