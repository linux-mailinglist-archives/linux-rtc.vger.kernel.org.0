Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D86D2FC34B
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbhASWWn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:22:43 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:53081 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbhASWIH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 03C401C0003;
        Tue, 19 Jan 2021 22:06:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] rtc: ds1305: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:41 +0100
Message-Id: <20210119220653.677750-3-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds1305.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index 8c2ab29c3d91..9ef107b99b65 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -435,13 +435,12 @@ static const struct rtc_class_ops ds1305_ops = {
 static void ds1305_work(struct work_struct *work)
 {
 	struct ds1305	*ds1305 = container_of(work, struct ds1305, work);
-	struct mutex	*lock = &ds1305->rtc->ops_lock;
 	struct spi_device *spi = ds1305->spi;
 	u8		buf[3];
 	int		status;
 
 	/* lock to protect ds1305->ctrl */
-	mutex_lock(lock);
+	rtc_lock(ds1305->rtc);
 
 	/* Disable the IRQ, and clear its status ... for now, we "know"
 	 * that if more than one alarm is active, they're in sync.
@@ -459,7 +458,7 @@ static void ds1305_work(struct work_struct *work)
 	if (status < 0)
 		dev_dbg(&spi->dev, "clear irq --> %d\n", status);
 
-	mutex_unlock(lock);
+	rtc_unlock(ds1305->rtc);
 
 	if (!test_bit(FLAG_EXITING, &ds1305->flags))
 		enable_irq(spi->irq);
-- 
2.29.2

