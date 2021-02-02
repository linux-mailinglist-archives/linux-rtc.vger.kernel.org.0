Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9A130BCF3
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhBBLZN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:25:13 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59605 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBBLXX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:23:23 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CBE1EFF80C;
        Tue,  2 Feb 2021 11:22:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 08/21] rtc: isl1208: quiet maybe-unused variable warning
Date:   Tue,  2 Feb 2021 12:22:05 +0100
Message-Id: <20210202112219.3610853-9-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-isl1208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 563a6d9c9fcf..182dfa605515 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -99,7 +99,7 @@ static const struct i2c_device_id isl1208_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
 
-static const struct of_device_id isl1208_of_match[] = {
+static const __maybe_unused struct of_device_id isl1208_of_match[] = {
 	{ .compatible = "isil,isl1208", .data = &isl1208_configs[TYPE_ISL1208] },
 	{ .compatible = "isil,isl1209", .data = &isl1208_configs[TYPE_ISL1209] },
 	{ .compatible = "isil,isl1218", .data = &isl1208_configs[TYPE_ISL1218] },
-- 
2.29.2

