Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58376919D6
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 00:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfHRWAp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 18 Aug 2019 18:00:45 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45359 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfHRWAp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 18 Aug 2019 18:00:45 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA0EE0008;
        Sun, 18 Aug 2019 22:00:43 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: class: add debug message when registration fails
Date:   Mon, 19 Aug 2019 00:00:40 +0200
Message-Id: <20190818220041.17833-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add a message when __rtc_register_device fails because rtc->ops is NULL.
This may only happen when developing a new driver so use dev_dbg to avoid
compiling it in by default.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 0f492b0940b3..9458e6d6686a 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -346,8 +346,10 @@ int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
 	struct rtc_wkalrm alrm;
 	int err;
 
-	if (!rtc->ops)
+	if (!rtc->ops) {
+		dev_dbg(&rtc->dev, "no ops set\n");
 		return -EINVAL;
+	}
 
 	rtc->owner = owner;
 	rtc_device_get_offset(rtc);
-- 
2.21.0

