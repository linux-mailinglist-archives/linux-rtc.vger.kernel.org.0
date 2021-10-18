Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD8432308
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhJRPjM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:39:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48447 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbhJRPjM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:39:12 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 28705C0010;
        Mon, 18 Oct 2021 15:36:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] rtc: pcf8523: remove unecessary ifdefery
Date:   Mon, 18 Oct 2021 17:36:48 +0200
Message-Id: <20211018153651.82069-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
References: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If CONFIG_OF is not defined, of_property_read_bool will return false which
is our default value

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 103557f48409..79a571db803b 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -376,9 +376,7 @@ static int pcf8523_probe(struct i2c_client *client,
 		dev_pm_set_wake_irq(&client->dev, client->irq);
 	}
 
-#ifdef CONFIG_OF
 	wakeup_source = of_property_read_bool(client->dev.of_node, "wakeup-source");
-#endif
 	if (client->irq > 0 || wakeup_source)
 		device_init_wakeup(&client->dev, true);
 
-- 
2.31.1

