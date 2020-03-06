Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17CC217B78A
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgCFHiK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:38:10 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49839 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgCFHiJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:38:09 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0B0802000B;
        Fri,  6 Mar 2020 07:38:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rtc: pm8xxx: set range
Date:   Fri,  6 Mar 2020 08:37:56 +0100
Message-Id: <20200306073758.58050-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306073758.58050-1-alexandre.belloni@bootlin.com>
References: <20200306073758.58050-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pm8xxx are 32bit seconds counter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index b97333c95e53..71bd56d32c90 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -491,6 +491,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc_dd->rtc);
 
 	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
+	rtc_dd->rtc->range_max = U32_MAX;
 
 	/* Request the alarm IRQ */
 	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->rtc_alarm_irq,
-- 
2.24.1

