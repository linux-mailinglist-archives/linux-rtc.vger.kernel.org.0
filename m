Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 485F21069E7
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKVKZC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:25:02 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49507 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfKVKZC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:25:02 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5741D1BF210;
        Fri, 22 Nov 2019 10:25:00 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 7/8] rtc: tegra: remove set but unused variable
Date:   Fri, 22 Nov 2019 11:22:11 +0100
Message-Id: <20191122102212.400158-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the following warning:
drivers/rtc/rtc-tegra.c: In function ‘tegra_rtc_read_time’:
drivers/rtc/rtc-tegra.c:106:11: warning: variable ‘msec’ set but not used [-Wunused-but-set-variable]

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 0159069bb506..7fbb1741692f 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -103,7 +103,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
 	unsigned long flags;
-	u32 sec, msec;
+	u32 sec;
 
 	/*
 	 * RTC hardware copies seconds to shadow seconds when a read of
@@ -111,7 +111,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	 */
 	spin_lock_irqsave(&info->lock, flags);
 
-	msec = readl(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
+	readl(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
 	sec = readl(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
 
 	spin_unlock_irqrestore(&info->lock, flags);
-- 
2.23.0

