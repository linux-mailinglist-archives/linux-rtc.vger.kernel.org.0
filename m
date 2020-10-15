Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0365228F942
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 21:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730617AbgJOTLn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 15:11:43 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59331 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbgJOTLn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 15:11:43 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2941160002;
        Thu, 15 Oct 2020 19:11:41 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] rtc: r9701: remove leftover comment
Date:   Thu, 15 Oct 2020 21:11:30 +0200
Message-Id: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Commit 22652ba72453 ("rtc: stop validating rtc_time in .read_time") removed
the code but not the associated comment.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-r9701.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-r9701.c b/drivers/rtc/rtc-r9701.c
index 84f0d25259ae..eb00879f7c9a 100644
--- a/drivers/rtc/rtc-r9701.c
+++ b/drivers/rtc/rtc-r9701.c
@@ -85,10 +85,6 @@ static int r9701_get_datetime(struct device *dev, struct rtc_time *dt)
 	dt->tm_mon = bcd2bin(buf[4]) - 1; /* RMONCNT */
 	dt->tm_year = bcd2bin(buf[5]) + 100; /* RYRCNT */
 
-	/* the rtc device may contain illegal values on power up
-	 * according to the data sheet. make sure they are valid.
-	 */
-
 	return 0;
 }
 
-- 
2.26.2

