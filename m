Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6178217B360
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFBCB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:02:01 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60929 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgCFBCA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:02:00 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4606FC000C;
        Fri,  6 Mar 2020 01:01:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: sa1100: set range
Date:   Fri,  6 Mar 2020 02:01:45 +0100
Message-Id: <20200306010146.39762-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306010146.39762-1-alexandre.belloni@bootlin.com>
References: <20200306010146.39762-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The SA1100 RTC is a 32bit seconds counter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sa1100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 97c352594033..82a9d4ab368f 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -212,6 +212,7 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 
 	info->rtc->ops = &sa1100_rtc_ops;
 	info->rtc->max_user_freq = RTC_FREQ;
+	info->rtc->range_max = U32_MAX;
 
 	ret = rtc_register_device(info->rtc);
 	if (ret) {
-- 
2.24.1

