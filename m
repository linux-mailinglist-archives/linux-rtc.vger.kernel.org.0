Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A47537AB97
	for <lists+linux-rtc@lfdr.de>; Tue, 11 May 2021 18:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhEKQPS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 May 2021 12:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbhEKQPR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 May 2021 12:15:17 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF85CC061574;
        Tue, 11 May 2021 09:14:09 -0700 (PDT)
Received: from dslb-094-219-032-254.094.219.pools.vodafone-ip.de ([94.219.32.254] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lgV1B-0002rQ-EN; Tue, 11 May 2021 18:13:57 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v3] rtc: imxdi: add wakeup support
Date:   Tue, 11 May 2021 18:12:44 +0200
Message-Id: <20210511161244.16111-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430093210.7034-1-martin@kaiser.cx>
References: <20210430093210.7034-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The DryIce-based RTC supports alarms that trigger an interrupt.

Configure this interrupt as a wakeup source that wakes the system up
from standby mode.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v3:
 - fix the commit message, the interrupt is always a wakeup source

v2:
 - unconditionally declare rtc-imxdi as wakeup source
 - use dev_pm_set_wake_irq instead of manually coding suspend and resume

 drivers/rtc/rtc-imxdi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index c1806f4d68e7..4b712e5ab08a 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/rtc.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
@@ -811,6 +812,9 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxdi);
 
+	device_init_wakeup(&pdev->dev, true);
+	dev_pm_set_wake_irq(&pdev->dev, norm_irq);
+
 	imxdi->rtc->ops = &dryice_rtc_ops;
 	imxdi->rtc->range_max = U32_MAX;
 
-- 
2.20.1

