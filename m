Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C26011F471
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfLNWDJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:09 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:52943 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfLNWDI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:08 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4C62840009;
        Sat, 14 Dec 2019 22:03:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 12/17] rtc: rv3028: remove RTC_VL_CLR handling
Date:   Sat, 14 Dec 2019 23:02:54 +0100
Message-Id: <20191214220259.621996-13-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove RTC_VL_CLR handling because it is a disservice to userspace as it
removes the important information that the RTC data is invalid. This may
lead userspace to set an invalid system time later on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 6b7b3a69601a..d1a2c22861f2 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -438,12 +438,6 @@ static int rv3028_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 
 		return 0;
 
-	case RTC_VL_CLR:
-		ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
-					 RV3028_STATUS_PORF, 0);
-
-		return ret;
-
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.23.0

