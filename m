Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA69DDB04
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfJSUts (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:48 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45275 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfJSUtr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:47 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 997351C0002;
        Sat, 19 Oct 2019 20:49:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/9] rtc: ds1343: use regmap_update_bits for glitch filter
Date:   Sat, 19 Oct 2019 22:49:37 +0200
Message-Id: <20191019204941.6203-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use regmap_update_bits to update DS1343_CONTROL_REG in a race free manner
when setting the glitch filter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ec8d1e82d7ac..7532a2e8407e 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -108,20 +108,18 @@ static ssize_t ds1343_store_glitchfilter(struct device *dev,
 					const char *buf, size_t count)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
-	int data;
-
-	regmap_read(priv->map, DS1343_CONTROL_REG, &data);
+	int data = 0;
+	int res;
 
 	if (strncmp(buf, "enabled", 7) == 0)
-		data |= DS1343_EGFIL;
-
-	else if (strncmp(buf, "disabled", 8) == 0)
-		data &= ~(DS1343_EGFIL);
-
-	else
+		data = DS1343_EGFIL;
+	else if (strncmp(buf, "disabled", 8))
 		return -EINVAL;
 
-	regmap_write(priv->map, DS1343_CONTROL_REG, data);
+	res = regmap_update_bits(priv->map, DS1343_CONTROL_REG,
+				 DS1343_EGFIL, data);
+	if (res)
+		return res;
 
 	return count;
 }
-- 
2.21.0

