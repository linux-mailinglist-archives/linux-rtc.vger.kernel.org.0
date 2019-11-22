Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD07B1069E9
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKVKZG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:25:06 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49491 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfKVKZD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:25:03 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1E0591BF218;
        Fri, 22 Nov 2019 10:25:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 8/8] rtc: v3020: remove set but unused variable
Date:   Fri, 22 Nov 2019 11:22:12 +0100
Message-Id: <20191122102212.400158-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the following warning:
drivers/rtc/rtc-v3020.c: In function ‘rtc_probe’:
drivers/rtc/rtc-v3020.c:287:6: warning: variable ‘temp’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-v3020.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-v3020.c b/drivers/rtc/rtc-v3020.c
index 63ffba21397b..d2da92187d56 100644
--- a/drivers/rtc/rtc-v3020.c
+++ b/drivers/rtc/rtc-v3020.c
@@ -284,7 +284,6 @@ static int rtc_probe(struct platform_device *pdev)
 	struct v3020 *chip;
 	int retval = -EBUSY;
 	int i;
-	int temp;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -302,7 +301,7 @@ static int rtc_probe(struct platform_device *pdev)
 	/* Make sure the v3020 expects a communication cycle
 	 * by reading 8 times */
 	for (i = 0; i < 8; i++)
-		temp = chip->ops->read_bit(chip);
+		chip->ops->read_bit(chip);
 
 	/* Test chip by doing a write/read sequence
 	 * to the chip ram */
-- 
2.23.0

