Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA2F11CB0A
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2019 11:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfLLKhR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Dec 2019 05:37:17 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53903 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbfLLKhK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Dec 2019 05:37:10 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6AB551BF21A;
        Thu, 12 Dec 2019 10:37:08 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/2] rtc: hym8563: Return -EINVAL if the time is known to be invalid
Date:   Thu, 12 Dec 2019 11:36:58 +0100
Message-Id: <20191212103658.937528-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212103658.937528-1-paul.kocialkowski@bootlin.com>
References: <20191212103658.937528-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current code returns -EPERM when the voltage loss bit is set.
Since the bit indicates that the time value is not valid, return
-EINVAL instead, which is the appropriate error code for this
situation.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/rtc/rtc-hym8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 584a7815f246..e547a892b692 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -101,7 +101,7 @@ static int hym8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	if (ret & HYM8563_SEC_VL) {
 		dev_warn(&client->dev,
 			 "no valid clock/calendar values available\n");
-		return -EPERM;
+		return -EINVAL;
 	}
 
 	tm->tm_sec = bcd2bin(buf[0] & HYM8563_SEC_MASK);
-- 
2.24.0

