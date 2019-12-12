Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4706D11D9C4
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Dec 2019 00:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbfLLXCs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Dec 2019 18:02:48 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32873 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730847AbfLLXCs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Dec 2019 18:02:48 -0500
X-Originating-IP: 195.39.63.77
Received: from localhost (unknown [195.39.63.77])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 41520C0005;
        Thu, 12 Dec 2019 23:02:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: rv3029: drop deprecated compatbiles
Date:   Fri, 13 Dec 2019 00:02:39 +0100
Message-Id: <20191212230239.65784-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The compatibles have been marked obsolete for more that 2 years, drop them
now. Note that this doesn't currently prevent the driver from probing
because the i2c core will still match using the i2c_device_id table.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4cdf6588e1d9..90a004c6398e 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -873,10 +873,6 @@ MODULE_DEVICE_TABLE(i2c, rv3029_id);
 
 static const struct of_device_id rv3029_of_match[] = {
 	{ .compatible = "microcrystal,rv3029" },
-	/* Backward compatibility only, do not use compatibles below: */
-	{ .compatible = "rv3029" },
-	{ .compatible = "rv3029c2" },
-	{ .compatible = "mc,rv3029c2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rv3029_of_match);
-- 
2.23.0

