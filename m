Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E23EF919CD
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Aug 2019 23:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfHRVwf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 18 Aug 2019 17:52:35 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49265 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfHRVwf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 18 Aug 2019 17:52:35 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C317040002;
        Sun, 18 Aug 2019 21:52:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: ds1672: remove unnecessary check
Date:   Sun, 18 Aug 2019 23:52:32 +0200
Message-Id: <20190818215232.17320-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc pointer is already checked earlier, it is not necessary to check it
again.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1672.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
index e9e8d02743ee..9da84df9f152 100644
--- a/drivers/rtc/rtc-ds1672.c
+++ b/drivers/rtc/rtc-ds1672.c
@@ -128,9 +128,6 @@ static int ds1672_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
 	i2c_set_clientdata(client, rtc);
 
 	return 0;
-- 
2.21.0

