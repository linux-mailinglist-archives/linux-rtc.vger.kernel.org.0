Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC8317B363
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgCFBCs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:02:48 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59873 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCFBCs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:02:48 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2A547C000C;
        Fri,  6 Mar 2020 01:02:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Guan Xuetao <gxt@pku.edu.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: puv3: set range
Date:   Fri,  6 Mar 2020 02:02:38 +0100
Message-Id: <20200306010240.40056-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This RTC is a 32bit seconds counter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-puv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-puv3.c b/drivers/rtc/rtc-puv3.c
index 89ff713163dd..3029a52a501e 100644
--- a/drivers/rtc/rtc-puv3.c
+++ b/drivers/rtc/rtc-puv3.c
@@ -234,6 +234,7 @@ static int puv3_rtc_probe(struct platform_device *pdev)
 
 	/* register RTC and exit */
 	rtc->ops = &puv3_rtcops;
+	rtc->range_max = U32_MAX;
 	ret = rtc_register_device(rtc);
 	if (ret)
 		goto err_nortc;
-- 
2.24.1

