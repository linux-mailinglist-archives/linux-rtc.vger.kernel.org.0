Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628FA457F4A
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Nov 2021 17:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237634AbhKTQDz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Nov 2021 11:03:55 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:45446 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231523AbhKTQDy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Nov 2021 11:03:54 -0500
Received: from [77.244.183.192] (port=64374 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1moSnJ-000Dxh-Hz; Sat, 20 Nov 2021 17:00:49 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 8/9] watchdog: max77620: add comment to clarify set_timeout procedure
Date:   Sat, 20 Nov 2021 16:57:06 +0100
Message-Id: <20211120155707.4019487-9-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120155707.4019487-1-luca@lucaceresoli.net>
References: <20211120155707.4019487-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clarify why we need to ping the watchdog before changing the timeout by
quoting the MAX77714 datasheet.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

This patch is new in v4. It adds a clarification comment to the max77620
driver taken from v3 patch 7.
---
 drivers/watchdog/max77620_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
index 06b48295fab6..f082a4ea2c03 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -132,6 +132,11 @@ static int max77620_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		break;
 	}
 
+	/*
+	 * "If the value of TWD needs to be changed, clear the system
+	 * watchdog timer first [...], then change the value of TWD."
+	 * (MAX77714 datasheet)
+	 */
 	ret = regmap_update_bits(wdt->rmap, wdt->drv_data->reg_cnfg_glbl3,
 				 wdt->drv_data->wdtc_mask, 0x1);
 	if (ret < 0)
-- 
2.25.1

