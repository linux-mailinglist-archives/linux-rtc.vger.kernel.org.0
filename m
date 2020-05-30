Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B091C1E9130
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgE3MaR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 08:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgE3MaR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 08:30:17 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C929C03E969
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 05:30:16 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jf0cv-0003hW-4Q; Sat, 30 May 2020 08:30:13 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     linux-rtc@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] rtc: abx80x: Provide debug feedback for invalid dt properties
Date:   Sat, 30 May 2020 08:29:56 -0400
Message-Id: <20200530122956.360689-1-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When the user provides an invalid value for tc-diode or
tc-resistor generate a debug message instead of silently
ignoring it.

Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org

---
v2: Removed extraneous parameter for abx80x_dt_trickle_cfg.
v2: Changed dev_err() to dev_dbg() as requested.

 drivers/rtc/rtc-abx80x.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 3521d8e8dc38..ef76e111415c 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -554,8 +554,9 @@ static const struct rtc_class_ops abx80x_rtc_ops = {
 	.ioctl		= abx80x_ioctl,
 };
 
-static int abx80x_dt_trickle_cfg(struct device_node *np)
+static int abx80x_dt_trickle_cfg(struct i2c_client *client)
 {
+	struct device_node *np = client->dev.of_node;
 	const char *diode;
 	int trickle_cfg = 0;
 	int i, ret;
@@ -565,12 +566,14 @@ static int abx80x_dt_trickle_cfg(struct device_node *np)
 	if (ret)
 		return ret;
 
-	if (!strcmp(diode, "standard"))
+	if (!strcmp(diode, "standard")) {
 		trickle_cfg |= ABX8XX_TRICKLE_STANDARD_DIODE;
-	else if (!strcmp(diode, "schottky"))
+	} else if (!strcmp(diode, "schottky")) {
 		trickle_cfg |= ABX8XX_TRICKLE_SCHOTTKY_DIODE;
-	else
+	} else {
+		dev_dbg(&client->dev, "Invalid tc-diode value: %s\n", diode);
 		return -EINVAL;
+	}
 
 	ret = of_property_read_u32(np, "abracon,tc-resistor", &tmp);
 	if (ret)
@@ -580,8 +583,10 @@ static int abx80x_dt_trickle_cfg(struct device_node *np)
 		if (trickle_resistors[i] == tmp)
 			break;
 
-	if (i == sizeof(trickle_resistors))
+	if (i == sizeof(trickle_resistors)) {
+		dev_dbg(&client->dev, "Invalid tc-resistor value: %u\n", tmp);
 		return -EINVAL;
+	}
 
 	return (trickle_cfg | i);
 }
@@ -793,7 +798,7 @@ static int abx80x_probe(struct i2c_client *client,
 	}
 
 	if (np && abx80x_caps[part].has_tc)
-		trickle_cfg = abx80x_dt_trickle_cfg(np);
+		trickle_cfg = abx80x_dt_trickle_cfg(client);
 
 	if (trickle_cfg > 0) {
 		dev_info(&client->dev, "Enabling trickle charger: %02x\n",
-- 
2.26.2

