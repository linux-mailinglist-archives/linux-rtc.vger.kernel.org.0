Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2D0C9ECA
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 14:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfJCMs4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 08:48:56 -0400
Received: from first.geanix.com ([116.203.34.67]:46094 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfJCMs4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 3 Oct 2019 08:48:56 -0400
Received: from kamstrup.kamstrup.dk (unknown [185.181.22.4])
        by first.geanix.com (Postfix) with ESMTPSA id 02B9B50693;
        Thu,  3 Oct 2019 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1570106870; bh=BD0t9dV3wNxTRF4IoQzToMWlEBrcknTaXpcq1CtUmSY=;
        h=From:To:Cc:Subject:Date;
        b=HeDkqbdYmAqclwdMA8C4A8fhROvpWwnxc2rsOmPWg9H2HHsWGOK1IkxnuUpC8k862
         49M3I38g5ORblaR/rwMeyAEF+5OeWvK1vn3veVDFdx7S+Sax7lHXvqDByBR6+RzxYx
         zZyBwys/ithxhsHsunuBwC/Nf9L9J8e6uLk90VQ8dqNCrELMO4zl112/V8jXorMvzc
         0Tv9oZblcraHXULLJyyka1uiic1x0Sj8k4zXN3waRKQRUzfOISdSjhN8JrEx8qRFFi
         fEWS6ZVSSqiZdchHwGJU/fU2gXqQZBpXS0zozmZqj7g7pLzqWU1XwhAKqp8IW9EHKq
         Yp0HeZlZPgAJg==
From:   =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: handle boot-enabled watchdog feature
Date:   Thu,  3 Oct 2019 14:48:49 +0200
Message-Id: <20191003124849.117888-1-martin@geanix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=4.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,UNPARSEABLE_RELAY
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b8b5098bc1bc
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Linux should handle when the pcf2127 watchdog feature is enabled by the
bootloader. This is done by checking the watchdog timer value during
init, and set the WDOG_HW_RUNNING flag if the value differs from zero.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 drivers/rtc/rtc-pcf2127.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index cb3472f..0fd3f3e 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -290,6 +290,8 @@ static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
 
 static int pcf2127_wdt_start(struct watchdog_device *wdd)
 {
+	set_bit(WDOG_HW_RUNNING, &wdd->status);
+
 	return pcf2127_wdt_ping(wdd);
 }
 
@@ -420,6 +422,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	u32 wdd_timeout;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -462,7 +465,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-	 * Timer is not started until WD_VAL is loaded with a valid value.
 	 * Note: Countdown timer disabled and not available.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
@@ -478,6 +480,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	/* Test if watchdog timer is started by bootloader */
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
+	if (ret) {
+		dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);
+		return ret;
+	}
+
+	if (wdd_timeout)
+		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
+
 	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
 	if (ret)
 		return ret;
-- 
2.7.4

