Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF05C9F83
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbfJCNd6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:33:58 -0400
Received: from first.geanix.com ([116.203.34.67]:47034 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729919AbfJCNd6 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 3 Oct 2019 09:33:58 -0400
Received: from kamstrup.kamstrup.dk (unknown [185.181.22.4])
        by first.geanix.com (Postfix) with ESMTPSA id 7DE5A506F5;
        Thu,  3 Oct 2019 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1570109571; bh=ynXtdICKBqQj5VK73b7OkVEKh0+y8XzpQnXgOFdV1us=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IbuzFILYXz2K42UkRNTkTd+8rqbM32lY4ZfRWkJy8hV38pYLAT6RKr61U8SWU/qSo
         SeuiFJnybyi2PIcFIkeKVizrvFKT0q1gqe7GrhfkeOckZmK/fcFPi4ZVaPRGnqhdLG
         mpy1Kxk2eFmleKXqdXQowC9BCbjzsLMIPTMd423UnyjsgaVhfN2MfoaJcIgVbZZNGG
         EtMIuLNpelhBCtAKXlSCRUMfJL0bPbzE0DxWniaVBFgQmNTuW6mc6niocp9ldMTd/l
         Deih9Tr9GFrMvZm4CZEIZbu2PNHT+cs6lytFywXxAtxVGhq3TEu1M/5eXexBUapVFL
         /u3y/UQAhEnEA==
From:   =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
Date:   Thu,  3 Oct 2019 15:33:51 +0200
Message-Id: <20191003133351.118538-1-martin@geanix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003124849.117888-1-martin@geanix.com>
References: <20191003124849.117888-1-martin@geanix.com>
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

Change since v1:
 * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()

 drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index cb3472f..4229915 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	u32 wdd_timeout;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-	 * Timer is not started until WD_VAL is loaded with a valid value.
 	 * Note: Countdown timer disabled and not available.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
@@ -478,6 +478,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
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

