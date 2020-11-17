Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124472B63A3
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 14:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732469AbgKQNkH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 08:40:07 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60119 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732816AbgKQNkD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 08:40:03 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7225C240012;
        Tue, 17 Nov 2020 13:39:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: at91rm9200: Add sam9x60 compatible
Date:   Tue, 17 Nov 2020 14:39:20 +0100
Message-Id: <20201117133920.1229679-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Handle the sam9x60 RTC. While it can work with the at91sam9x5 fallback, it
has crystal correction support and doesn't need to shadow IMR.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-at91rm9200.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 1eea187d9850..da24e68adcca 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -437,6 +437,9 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
 	}, {
 		.compatible = "atmel,sama5d2-rtc",
 		.data = &sama5d4_config,
+	}, {
+		.compatible = "microchip,sam9x60-rtc",
+		.data = &sama5d4_config,
 	}, {
 		/* sentinel */
 	}
-- 
2.28.0

