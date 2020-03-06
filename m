Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D889117B356
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFBAM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:00:12 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:48503 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFBAL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:00:11 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 24C7B20003;
        Fri,  6 Mar 2020 01:00:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: au1xxx: set range
Date:   Fri,  6 Mar 2020 01:59:57 +0100
Message-Id: <20200306005958.39203-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005958.39203-1-alexandre.belloni@bootlin.com>
References: <20200306005958.39203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Alchemy counter0 is a 32bit seconds counter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-au1xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-au1xxx.c b/drivers/rtc/rtc-au1xxx.c
index 73aeb15f9491..e186fb5cfffd 100644
--- a/drivers/rtc/rtc-au1xxx.c
+++ b/drivers/rtc/rtc-au1xxx.c
@@ -100,6 +100,7 @@ static int au1xtoy_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtcdev);
 
 	rtcdev->ops = &au1xtoy_rtc_ops;
+	rtcdev->range_max = U32_MAX;
 
 	platform_set_drvdata(pdev, rtcdev);
 
-- 
2.24.1

