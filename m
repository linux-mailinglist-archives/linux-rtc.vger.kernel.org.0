Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED0811F470
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfLNWDY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:24 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42819 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfLNWDK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:10 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1E37C4000A;
        Sat, 14 Dec 2019 22:03:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 14/17] rtc: rv8803: avoid clearing RV8803_FLAG_V2F in RTC_VL_CLR
Date:   Sat, 14 Dec 2019 23:02:56 +0100
Message-Id: <20191214220259.621996-15-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Stop clearing RV8803_FLAG_V2F in RTC_VL_CLR because it is a disservice to
userspace as it removes the important information that the RTC data is
invalid. This may lead userspace to set an invalid system time later on.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv8803.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 4960f0a2b249..ed92116bdfa0 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -440,7 +440,7 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 			return flags;
 		}
 
-		flags &= ~(RV8803_FLAG_V1F | RV8803_FLAG_V2F);
+		flags &= ~RV8803_FLAG_V1F;
 		ret = rv8803_write_reg(client, RV8803_FLAG, flags);
 		mutex_unlock(&rv8803->flags_lock);
 		if (ret)
-- 
2.23.0

