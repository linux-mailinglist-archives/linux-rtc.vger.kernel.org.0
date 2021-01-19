Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461F22FC31F
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729515AbhASWIQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:16 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:40277 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbhASWIN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:13 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1082F1C0007;
        Tue, 19 Jan 2021 22:07:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] rtc: stm32: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:52 +0100
Message-Id: <20210119220653.677750-14-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
References: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Avoid accessing directly rtc->ops_lock and use the RTC core helpers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d774aa18f57a..75a8924ba12b 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -209,7 +209,7 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 	const struct stm32_rtc_events *evts = &rtc->data->events;
 	unsigned int status, cr;
 
-	mutex_lock(&rtc->rtc_dev->ops_lock);
+	rtc_lock(rtc->rtc_dev);
 
 	status = readl_relaxed(rtc->base + regs->sr);
 	cr = readl_relaxed(rtc->base + regs->cr);
@@ -226,7 +226,7 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 		stm32_rtc_clear_event_flags(rtc, evts->alra);
 	}
 
-	mutex_unlock(&rtc->rtc_dev->ops_lock);
+	rtc_unlock(rtc->rtc_dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

