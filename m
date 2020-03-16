Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 380C118695C
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 11:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbgCPKsa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 06:48:30 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46165 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730478AbgCPKsa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Mar 2020 06:48:30 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 227A9240024;
        Mon, 16 Mar 2020 10:47:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
Date:   Mon, 16 Mar 2020 11:47:00 +0100
Message-Id: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move SIMPLE_DEV_PM_OPS out of #ifdef to fix build issues when PM_SLEEP is
not selected.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 432df9b0a3ac..c2709c1602f0 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -394,10 +394,10 @@ static int mt2712_rtc_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
 			 mt2712_rtc_resume);
-#endif
 
 static const struct of_device_id mt2712_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt2712-rtc", },
-- 
2.24.1

