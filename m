Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF9CD9B3D
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394704AbfJPUOS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:14:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51165 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfJPUOS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:14:18 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 79131240004;
        Wed, 16 Oct 2019 20:14:16 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: cros-ec: remove superfluous error message
Date:   Wed, 16 Oct 2019 22:14:13 +0200
Message-Id: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC core now has error messages in case of registration failure, there
is no need to have other messages in the drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cros-ec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 6909e01936d9..da209d00731e 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -351,11 +351,8 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 	cros_ec_rtc->rtc = devm_rtc_device_register(&pdev->dev, DRV_NAME,
 						    &cros_ec_rtc_ops,
 						    THIS_MODULE);
-	if (IS_ERR(cros_ec_rtc->rtc)) {
-		ret = PTR_ERR(cros_ec_rtc->rtc);
-		dev_err(&pdev->dev, "failed to register rtc device\n");
-		return ret;
-	}
+	if (IS_ERR(cros_ec_rtc->rtc))
+		return PTR_ERR(cros_ec_rtc->rtc);
 
 	/* Get RTC events from the EC. */
 	cros_ec_rtc->notifier.notifier_call = cros_ec_rtc_event;
-- 
2.21.0

