Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6228EFEB
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 18:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbfHOQAY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 12:00:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729603AbfHOQAY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 12:00:24 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA7E21721;
        Thu, 15 Aug 2019 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565884823;
        bh=jhLe5vckYppF9TruqTI2eUqweArAAMsxS2OiscqnHNI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxmYTfa+Uov2w+URSRdFeyfWLhIeASvrCuS9pp75G/3Q/+oZDEvbVbkPneXLOxD5z
         41byxi6mBnZG0QOd8yFrdHepi4Dh/BIgTSfGOGDAQZUfWq6Y0+yTH1t/cw/KooUmJw
         DY2yjvHobhcjU/vLjzCI+DA6LXoFz3Pqd32WCIyw=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/4] rtc: sun6i: Don't reference clk_init_data after registration
Date:   Thu, 15 Aug 2019 09:00:19 -0700
Message-Id: <20190815160020.183334-4-sboyd@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190815160020.183334-1-sboyd@kernel.org>
References: <20190815160020.183334-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

A future patch is going to change semantics of clk_register() so that
clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
referencing this member here so that we don't run into NULL pointer
exceptions.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---

Please ack so I can take this through clk tree.

 drivers/rtc/rtc-sun6i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index c0e75c373605..d50ee023b559 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -279,7 +279,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 
 	of_property_read_string_index(node, "clock-output-names", 1,
 				      &clkout_name);
-	rtc->ext_losc = clk_register_gate(NULL, clkout_name, rtc->hw.init->name,
+	rtc->ext_losc = clk_register_gate(NULL, clkout_name, init.name,
 					  0, rtc->base + SUN6I_LOSC_OUT_GATING,
 					  SUN6I_LOSC_OUT_GATING_EN_OFFSET, 0,
 					  &rtc->lock);
-- 
Sent by a computer through tubes

