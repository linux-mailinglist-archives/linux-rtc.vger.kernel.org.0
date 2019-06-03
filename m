Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E0E3341A
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Jun 2019 17:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbfFCPvr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Jun 2019 11:51:47 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53852 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729375AbfFCPvr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 3 Jun 2019 11:51:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D424915AB;
        Mon,  3 Jun 2019 08:51:46 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 720923F246;
        Mon,  3 Jun 2019 08:51:45 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [RFC PATCH 31/57] drivers: rtc: Use class_find_device_by_name() helper
Date:   Mon,  3 Jun 2019 16:49:57 +0100
Message-Id: <1559577023-558-32-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use the new class_find_device_by_name() helper.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/rtc/interface.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 4124f4d..307dbc6 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -663,21 +663,12 @@ void rtc_update_irq(struct rtc_device *rtc,
 }
 EXPORT_SYMBOL_GPL(rtc_update_irq);
 
-static int __rtc_match(struct device *dev, const void *data)
-{
-	const char *name = data;
-
-	if (strcmp(dev_name(dev), name) == 0)
-		return 1;
-	return 0;
-}
-
 struct rtc_device *rtc_class_open(const char *name)
 {
 	struct device *dev;
 	struct rtc_device *rtc = NULL;
 
-	dev = class_find_device(rtc_class, NULL, name, __rtc_match);
+	dev = class_find_device_by_name(rtc_class, NULL, name);
 	if (dev)
 		rtc = to_rtc_device(dev);
 
-- 
2.7.4

