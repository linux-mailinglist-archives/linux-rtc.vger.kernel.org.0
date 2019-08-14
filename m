Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A298D6EE
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 17:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfHNPK0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 11:10:26 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36651 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbfHNPKP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 11:10:15 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4BE60200002;
        Wed, 14 Aug 2019 15:10:13 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 7/9] rtc; pcf2123: fix possible alarm race condition
Date:   Wed, 14 Aug 2019 17:10:00 +0200
Message-Id: <20190814151002.7324-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
References: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
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
index 175aa8779623..26f43b619b48 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -272,13 +272,13 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 	dev_dbg(dev, "%s: alm is %ptR\n", __func__, &alm->time);
 
-	/* Ensure alarm flag is clear */
-	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
+	/* Disable alarm interrupt */
+	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
 	if (ret)
 		return ret;
 
-	/* Disable alarm interrupt */
-	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
+	/* Ensure alarm flag is clear */
+	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
 	if (ret)
 		return ret;
 
-- 
2.21.0

