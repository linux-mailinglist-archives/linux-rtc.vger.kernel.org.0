Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8284B987
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2019 15:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfFSNSC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Jun 2019 09:18:02 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59597 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfFSNSC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Jun 2019 09:18:02 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A09081C0009;
        Wed, 19 Jun 2019 13:17:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Dylan Howey <Dylan.Howey@tennantco.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: pcf2123: fix negative offset rounding
Date:   Wed, 19 Jun 2019 15:17:53 +0200
Message-Id: <20190619131753.14802-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Using result = (value + divisor/2) / divisor is rounding values up and only
works well for positive values. Instead use DIV_ROUND_CLOSEST which does
the correct thing.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 39da8b214275..80a53d2dc813 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -244,7 +244,7 @@ static int pcf2123_set_offset(struct device *dev, long offset)
 	else if (offset < OFFSET_STEP * -128)
 		reg = -128;
 	else
-		reg = (s8)((offset + (OFFSET_STEP >> 1)) / OFFSET_STEP);
+		reg = DIV_ROUND_CLOSEST(offset, OFFSET_STEP);
 
 	/* choose fine offset only for odd values in the normal range */
 	if (reg & 1 && reg <= 63 && reg >= -64) {
-- 
2.21.0

