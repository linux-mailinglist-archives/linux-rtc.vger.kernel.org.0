Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1F094CCF
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfHSS1A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:00 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54769 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfHSS1A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:00 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1AFD1200003;
        Mon, 19 Aug 2019 18:26:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 1/9] rtc: pcf2123: don't use weekday alarm
Date:   Mon, 19 Aug 2019 20:26:48 +0200
Message-Id: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The week day may not be set properly by userspace. This would result is
missed alarms. Disable alarm matching on weekday.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index fb542a930bf0..5f604d83289c 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -82,7 +82,7 @@
 #define OSC_HAS_STOPPED		BIT(7)	/* Clock has been stopped */
 
 /* PCF2123_REG_ALRM_XX BITS */
-#define ALRM_ENABLE		BIT(7)	/* MN, HR, DM, or DW alarm enable */
+#define ALRM_DISABLE		BIT(7)	/* MN, HR, DM, or DW alarm matching */
 
 /* PCF2123_REG_TMR_CLKOUT BITS */
 #define CD_TMR_4096KHZ		(0)	/* 4096 KHz countdown timer */
@@ -288,7 +288,7 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	txbuf[0] = bin2bcd(alm->time.tm_min & 0x7F);
 	txbuf[1] = bin2bcd(alm->time.tm_hour & 0x3F);
 	txbuf[2] = bin2bcd(alm->time.tm_mday & 0x3F);
-	txbuf[3] = bin2bcd(alm->time.tm_wday & 0x07);
+	txbuf[3] = ALRM_DISABLE;
 
 	ret = regmap_bulk_write(pdata->map, PCF2123_REG_ALRM_MN, txbuf,
 				sizeof(txbuf));
-- 
2.21.0

