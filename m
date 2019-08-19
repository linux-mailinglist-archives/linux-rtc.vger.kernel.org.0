Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59BE94CCE
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfHSS1A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:00 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52521 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfHSS1A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:00 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8B78060005;
        Mon, 19 Aug 2019 18:26:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 2/9] rtc; pcf2123: fix possible alarm race condition
Date:   Mon, 19 Aug 2019 20:26:49 +0200
Message-Id: <20190819182656.29744-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
References: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clear the flag after disabling the alarm to ensure the alarm doesn't fire
between clearing the flag and disabling the alarm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 5f604d83289c..829d7a2dd950 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -274,13 +274,13 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 	dev_dbg(dev, "%s: alm is %ptR\n", __func__, &alm->time);
 
-	/* Ensure alarm flag is clear */
-	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
+	/* Disable alarm interrupt */
+	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
 	if (ret)
 		return ret;
 
-	/* Disable alarm interrupt */
-	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
+	/* Ensure alarm flag is clear */
+	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
 	if (ret)
 		return ret;
 
-- 
2.21.0

