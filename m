Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BB730BCE7
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhBBLXy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:23:54 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:33673 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhBBLXa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:23:30 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 86C4E10000A;
        Tue,  2 Feb 2021 11:22:43 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 18/21] rtc: rx8010: quiet maybe-unused variable warning
Date:   Tue,  2 Feb 2021 12:22:15 +0100
Message-Id: <20210202112219.3610853-19-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When CONFIG_OF is disabled then the matching table is not referenced.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 95e751c8048e..d09056570739 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -55,7 +55,7 @@ static const struct i2c_device_id rx8010_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rx8010_id);
 
-static const struct of_device_id rx8010_of_match[] = {
+static const __maybe_unused struct of_device_id rx8010_of_match[] = {
 	{ .compatible = "epson,rx8010" },
 	{ }
 };
-- 
2.29.2

