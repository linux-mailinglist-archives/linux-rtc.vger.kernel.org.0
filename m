Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EDF1AB233
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 22:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436786AbgDOUAp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 16:00:45 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:42851 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406322AbgDOUAo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 16:00:44 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id ABAFC200009;
        Wed, 15 Apr 2020 20:00:41 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: mt2712: remove unnecessary error string
Date:   Wed, 15 Apr 2020 22:00:20 +0200
Message-Id: <20200415200021.157118-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove the unnecessary error string as the core will already display error
messages when registration fails (i.e. never).

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index f6bdbabd7202..9868d98f397c 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -354,13 +354,7 @@ static int mt2712_rtc_probe(struct platform_device *pdev)
 	mt2712_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	mt2712_rtc->rtc->range_max = MT2712_RTC_TIMESTAMP_END_2127;
 
-	ret = rtc_register_device(mt2712_rtc->rtc);
-	if (ret) {
-		dev_err(&pdev->dev, "register rtc device failed\n");
-		return ret;
-	}
-
-	return 0;
+	return rtc_register_device(mt2712_rtc->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.2

