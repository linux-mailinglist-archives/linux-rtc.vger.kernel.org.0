Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212D22BC292
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Nov 2020 00:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgKUXGu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Nov 2020 18:06:50 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:42665 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgKUXGu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Nov 2020 18:06:50 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0A881200005;
        Sat, 21 Nov 2020 23:06:48 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: test: remove debug message
Date:   Sun, 22 Nov 2020 00:06:44 +0100
Message-Id: <20201121230644.572419-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove leftover debug message

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index b092a1648513..7e0d8fb26465 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -50,7 +50,6 @@ static int test_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (expires > U32_MAX)
 		expires = U32_MAX;
 
-	pr_err("ABE: %s +%d %s\n", __FILE__, __LINE__, __func__);
 	rtd->alarm.expires = expires;
 
 	if (alrm->enabled)
-- 
2.28.0

