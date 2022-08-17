Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A51596BB0
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Aug 2022 10:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiHQIx4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Aug 2022 04:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbiHQIxz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Aug 2022 04:53:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C55E77E9A
        for <linux-rtc@vger.kernel.org>; Wed, 17 Aug 2022 01:53:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo4-0004bT-Cp; Wed, 17 Aug 2022 10:53:44 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo3-000HM1-9E; Wed, 17 Aug 2022 10:53:43 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo2-0054uo-5L; Wed, 17 Aug 2022 10:53:42 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 2/2] rtc: rv8803: invalidate date/time if alarm time is invalid
Date:   Wed, 17 Aug 2022 10:53:30 +0200
Message-Id: <20220817085330.1050492-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817085330.1050492-1-s.hauer@pengutronix.de>
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RTC core never calls rv8803_set_alarm with an invalid alarm time,
so if an invalid alarm time > 0 is set, external factors must have
corrupted the RTC's alarm time and possibly other registers.

Play it safe by marking the date/time invalid, so all registers are
reinitialized on a ->set_time.

This may cause existing setups to lose time if they so far set only
date/time, but ignored that the alarm registers had an invalid date
value, e.g.:

  rtc rtc0: invalid alarm value: 2020-3-27 7:82:0

These systems will have their ->get_time return -EINVAL till
->set_time initializes the alarm value (and sets a new time).

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

Notes:
    Changes since v1:
    - set alarm_invalid directly when one of the alarmvals has invalid BCD
    - cast to (unsigned int) rather than (unsigned)

 drivers/rtc/rtc-rv8803.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 3527a0521e9b2..4875728014bed 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -70,6 +70,7 @@ struct rv8803_data {
 	struct mutex flags_lock;
 	u8 ctrl;
 	u8 backup;
+	u8 alarm_invalid:1;
 	enum rv8803_type type;
 };
 
@@ -165,13 +166,13 @@ static int rv8803_regs_init(struct rv8803_data *rv8803)
 
 static int rv8803_regs_configure(struct rv8803_data *rv8803);
 
-static int rv8803_regs_reset(struct rv8803_data *rv8803)
+static int rv8803_regs_reset(struct rv8803_data *rv8803, bool full)
 {
 	/*
 	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
 	 * the Epson RTCs don't, so we manually reset the remainder here.
 	 */
-	if (rv8803->type == rx_8803 || rv8803->type == rx_8900) {
+	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900) {
 		int ret = rv8803_regs_init(rv8803);
 		if (ret)
 			return ret;
@@ -238,6 +239,11 @@ static int rv8803_get_time(struct device *dev, struct rtc_time *tm)
 	u8 *date = date1;
 	int ret, flags;
 
+	if (rv8803->alarm_invalid) {
+		dev_warn(dev, "Corruption detected, data may be invalid.\n");
+		return -EINVAL;
+	}
+
 	flags = rv8803_read_reg(rv8803->client, RV8803_FLAG);
 	if (flags < 0)
 		return flags;
@@ -313,12 +319,19 @@ static int rv8803_set_time(struct device *dev, struct rtc_time *tm)
 		return flags;
 	}
 
-	if (flags & RV8803_FLAG_V2F) {
-		ret = rv8803_regs_reset(rv8803);
+	if ((flags & RV8803_FLAG_V2F) || rv8803->alarm_invalid) {
+		/*
+		 * If we sense corruption in the alarm registers, but see no
+		 * voltage loss flag, we can't rely on other registers having
+		 * sensible values. Reset them fully.
+		 */
+		ret = rv8803_regs_reset(rv8803, rv8803->alarm_invalid);
 		if (ret) {
 			mutex_unlock(&rv8803->flags_lock);
 			return ret;
 		}
+
+		rv8803->alarm_invalid = false;
 	}
 
 	ret = rv8803_write_reg(rv8803->client, RV8803_FLAG,
@@ -344,15 +357,33 @@ static int rv8803_get_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (flags < 0)
 		return flags;
 
+	alarmvals[0] &= 0x7f;
+	alarmvals[1] &= 0x3f;
+	alarmvals[2] &= 0x3f;
+
+	if (!bcd_is_valid(alarmvals[0]) ||
+	    !bcd_is_valid(alarmvals[1]) ||
+	    !bcd_is_valid(alarmvals[2]))
+		goto err_invalid;
+
 	alrm->time.tm_sec  = 0;
-	alrm->time.tm_min  = bcd2bin(alarmvals[0] & 0x7f);
-	alrm->time.tm_hour = bcd2bin(alarmvals[1] & 0x3f);
-	alrm->time.tm_mday = bcd2bin(alarmvals[2] & 0x3f);
+	alrm->time.tm_min  = bcd2bin(alarmvals[0]);
+	alrm->time.tm_hour = bcd2bin(alarmvals[1]);
+	alrm->time.tm_mday = bcd2bin(alarmvals[2]);
 
 	alrm->enabled = !!(rv8803->ctrl & RV8803_CTRL_AIE);
 	alrm->pending = (flags & RV8803_FLAG_AF) && alrm->enabled;
 
+	if ((unsigned int)alrm->time.tm_mday > 31 ||
+	    (unsigned int)alrm->time.tm_hour >= 24 ||
+	    (unsigned int)alrm->time.tm_min >= 60)
+		goto err_invalid;
+
 	return 0;
+
+err_invalid:
+	rv8803->alarm_invalid = true;
+	return -EINVAL;
 }
 
 static int rv8803_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-- 
2.30.2

