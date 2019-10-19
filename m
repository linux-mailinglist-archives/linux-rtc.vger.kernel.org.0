Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF367DDB06
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJSUtr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:47 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42437 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfJSUtr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:47 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0F1A1240004;
        Sat, 19 Oct 2019 20:49:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 6/9] rtc: ds1343: check regmap_read return value
Date:   Sat, 19 Oct 2019 22:49:38 +0200
Message-Id: <20191019204941.6203-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Check whether regmap_read fails before continuing in the sysfs .show
callbacks.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 7532a2e8407e..c96a505972e6 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -92,8 +92,11 @@ static ssize_t ds1343_show_glitchfilter(struct device *dev,
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int glitch_filt_status, data;
+	int res;
 
-	regmap_read(priv->map, DS1343_CONTROL_REG, &data);
+	res = regmap_read(priv->map, DS1343_CONTROL_REG, &data);
+	if (res)
+		return res;
 
 	glitch_filt_status = !!(data & DS1343_EGFIL);
 
@@ -147,10 +150,12 @@ static ssize_t ds1343_show_tricklecharger(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
-	int data;
+	int res, data;
 	char *diodes = "disabled", *resistors = " ";
 
-	regmap_read(priv->map, DS1343_TRICKLE_REG, &data);
+	res = regmap_read(priv->map, DS1343_TRICKLE_REG, &data);
+	if (res)
+		return res;
 
 	if ((data & 0xf0) == DS1343_TRICKLE_MAGIC) {
 		switch (data & 0x0c) {
-- 
2.21.0

