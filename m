Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2DB218878E
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 15:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgCQOec (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 10:34:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47153 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQOec (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Mar 2020 10:34:32 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C5F1324000A;
        Tue, 17 Mar 2020 14:34:28 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: mt2712: fix build without PM_SLEEP
Date:   Tue, 17 Mar 2020 15:34:21 +0100
Message-Id: <20200317143421.9551-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix this build error when PM_SLEEP is not selected:

drivers/rtc/rtc-mt2712.c:412:10: error: ‘mt2712_pm_ops’ undeclared here (not in a function); did you mean ‘mt2712_rtc_ops’?
  412 |   .pm = &mt2712_pm_ops,
      |          ^~~~~~~~~~~~~

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 62c20241426d..581b8731fb8a 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -409,7 +409,9 @@ static struct platform_driver mt2712_rtc_driver = {
 	.driver = {
 		.name = "mt2712-rtc",
 		.of_match_table = mt2712_rtc_of_match,
+#ifdef CONFIG_PM_SLEEP
 		.pm = &mt2712_pm_ops,
+#endif
 	},
 	.probe  = mt2712_rtc_probe,
 };
-- 
2.24.1

