Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32C218251C
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 23:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731376AbgCKWkN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 18:40:13 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52043 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731338AbgCKWkC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 18:40:02 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1C3AF200003;
        Wed, 11 Mar 2020 22:40:00 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] rtc: 88pm860x: set range
Date:   Wed, 11 Mar 2020 23:39:54 +0100
Message-Id: <20200311223956.51352-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
References: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The 88pm860x RTC is a 32bit read only seconds counter with a 32bit offset.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 0abf2b194938..f5933a08454c 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -353,6 +353,7 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 	pm860x_rtc_dt_init(pdev, info);
 
 	info->rtc_dev->ops = &pm860x_rtc_ops;
+	info->rtc_dev->range_max = U32_MAX;
 
 	ret = rtc_register_device(info->rtc_dev);
 	if (ret)
-- 
2.24.1

