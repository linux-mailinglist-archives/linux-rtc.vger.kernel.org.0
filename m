Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10DCF2DD
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfD3J3C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:29:02 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56427 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfD3J2a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:28:30 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1DA5F1BF20F;
        Tue, 30 Apr 2019 09:28:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 4/7] rtc: jz4740: use .set_time
Date:   Tue, 30 Apr 2019 11:28:18 +0200
Message-Id: <20190430092821.27963-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
References: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use .set_time instead of the deprecated .set_mmss.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-jz4740.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index f2b8d6541c9e..077670ffde01 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -176,11 +176,11 @@ static int jz4740_rtc_read_time(struct device *dev, struct rtc_time *time)
 	return 0;
 }
 
-static int jz4740_rtc_set_mmss(struct device *dev, unsigned long secs)
+static int jz4740_rtc_set_time(struct device *dev, struct rtc_time *time)
 {
 	struct jz4740_rtc *rtc = dev_get_drvdata(dev);
 
-	return jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SEC, secs);
+	return jz4740_rtc_reg_write(rtc, JZ_REG_RTC_SEC, rtc_tm_to_time64(time));
 }
 
 static int jz4740_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
@@ -223,7 +223,7 @@ static int jz4740_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 
 static const struct rtc_class_ops jz4740_rtc_ops = {
 	.read_time	= jz4740_rtc_read_time,
-	.set_mmss	= jz4740_rtc_set_mmss,
+	.set_time	= jz4740_rtc_set_time,
 	.read_alarm	= jz4740_rtc_read_alarm,
 	.set_alarm	= jz4740_rtc_set_alarm,
 	.alarm_irq_enable = jz4740_rtc_alarm_irq_enable,
-- 
2.20.1

