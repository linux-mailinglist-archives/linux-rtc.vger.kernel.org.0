Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F28B30BCDC
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhBBLX0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:23:26 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41163 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhBBLXU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:23:20 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D0E5EFF80E;
        Tue,  2 Feb 2021 11:22:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/21] rtc: digicolor: quiet maybe-unused variable warning
Date:   Tue,  2 Feb 2021 12:22:02 +0100
Message-Id: <20210202112219.3610853-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When CONFIG_OF is disabled then the matching table is not referenced.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-digicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
index 4fdfa5b6feb2..218a6de19247 100644
--- a/drivers/rtc/rtc-digicolor.c
+++ b/drivers/rtc/rtc-digicolor.c
@@ -205,7 +205,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
-static const struct of_device_id dc_dt_ids[] = {
+static const __maybe_unused struct of_device_id dc_dt_ids[] = {
 	{ .compatible = "cnxt,cx92755-rtc" },
 	{ /* sentinel */ }
 };
-- 
2.29.2

