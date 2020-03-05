Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0920B17AA18
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 17:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCEQFP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 11:05:15 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:44721 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgCEQFP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 11:05:15 -0500
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E37DE240005;
        Thu,  5 Mar 2020 16:05:03 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Barry Song <baohua@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: sirfsoc: set range
Date:   Thu,  5 Mar 2020 17:04:51 +0100
Message-Id: <20200305160452.27808-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305160452.27808-1-alexandre.belloni@bootlin.com>
References: <20200305160452.27808-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This RTC is a 32bit counter running at 16Hz. This overflows every eight
years and a half. However, the driver uses the SW_VALUE register to store
the overflow, extending the counter to 64bit as long as the update happens
before the overflow.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sirfsoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
index b2e72597eee8..8b3c88fb9793 100644
--- a/drivers/rtc/rtc-sirfsoc.c
+++ b/drivers/rtc/rtc-sirfsoc.c
@@ -346,6 +346,7 @@ static int sirfsoc_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtcdrv->rtc);
 
 	rtcdrv->rtc->ops = &sirfsoc_rtc_ops;
+	rtcdrv->rtc->range_max = (1ULL << 60) - 1;
 
 	rtcdrv->irq = platform_get_irq(pdev, 0);
 	err = devm_request_irq(&pdev->dev, rtcdrv->irq, sirfsoc_rtc_irq_handler,
-- 
2.24.1

