Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D66DE5EF
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfJUII6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 04:08:58 -0400
Received: from first.geanix.com ([116.203.34.67]:36966 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfJUII6 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 04:08:58 -0400
Received: from kamstrup.kamstrup.dk (unknown [185.181.22.4])
        by first.geanix.com (Postfix) with ESMTPSA id C4B1289FAF;
        Mon, 21 Oct 2019 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1571645275; bh=Q6lB+31W1GnlSW2lax3wzulC8n8tz1IJXXwKcGxDY/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=et8koHXmDqaGoWbtQU3JMvc7LUxwUdJjVXFSROP+6yyGh+Mr0BvPFYTDzkU/ddVfe
         6N4fa88gQENUoaDv9NaRVwPAF8DqurMau1S6be+KQWLpLawbeJ2idNTJ2jhLKDpMNt
         jqAiz3lCW8zIb3pvzSXaX9NbBbcifkJpc4iYPCZSomvOEK5MBu/D90TBztkZMZRXsK
         tPhDrqx01B2JTgglEWm97rqeSz9Jx2YYR0sOiVhrxSj2x23ICXP4HdCBgPYmsMQ/IT
         ycdQ8iRAFRy1xXwIeKwfVeTObY/F1calcMfkyTkBd9QFPKgA2fr6eETFqHvvempfgp
         vwiUAKTvrl1Sg==
From:   =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCHv3] rtc: pcf2127: handle boot-enabled watchdog feature
Date:   Mon, 21 Oct 2019 10:08:38 +0200
Message-Id: <20191021080838.2789-1-martin@geanix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003133351.118538-1-martin@geanix.com>
References: <20191003133351.118538-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=4.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b0d531b295e6
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Linux should handle when the pcf2127 watchdog feature is enabled by the
bootloader. This is done by checking the watchdog timer value during
init, and set the WDOG_HW_RUNNING flag if the value differs from zero.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Change since v2:
 * remove logging in case of error

Change since v1:
 * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()

 drivers/rtc/rtc-pcf2127.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 02b069c..ba5baac 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -417,6 +417,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	u32 wdd_timeout;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -459,7 +460,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-	 * Timer is not started until WD_VAL is loaded with a valid value.
 	 * Note: Countdown timer disabled and not available.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
@@ -475,6 +475,14 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	/* Test if watchdog timer is started by bootloader */
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
+	if (ret)
+		return ret;
+
+	if (wdd_timeout)
+		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
+
 #ifdef CONFIG_WATCHDOG
 	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
 	if (ret)
-- 
2.7.4

