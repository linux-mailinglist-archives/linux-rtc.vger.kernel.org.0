Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0E317B777
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCFHfD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:35:03 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:33303 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgCFHfD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:35:03 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4542820000C;
        Fri,  6 Mar 2020 07:35:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: ds1305: set range
Date:   Fri,  6 Mar 2020 08:34:58 +0100
Message-Id: <20200306073459.57197-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ds1305 is a BCD rtc valid from 2000 to 2099.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1305.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index 4420fbf2f8fe..ca55ebab24fb 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -694,6 +694,8 @@ static int ds1305_probe(struct spi_device *spi)
 		return PTR_ERR(ds1305->rtc);
 
 	ds1305->rtc->ops = &ds1305_ops;
+	ds1305->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	ds1305->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ds1305_nvmem_cfg.priv = ds1305;
 	ds1305->rtc->nvram_old_abi = true;
-- 
2.24.1

