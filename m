Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BBB30BD1B
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBBLXI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:23:08 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52041 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBBLXH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:23:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B4E146000F;
        Tue,  2 Feb 2021 11:22:24 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] rtc: armada38x: depend on OF
Date:   Tue,  2 Feb 2021 12:21:59 +0100
Message-Id: <20210202112219.3610853-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver will compile with warning without OF because armada38x_data and
armada8k_data will be defined but not used. It would be possible to move
then in the #ifdef CONFIG_OF section but then their members will be defined
but not used. Instead of moving most of the driver in the #ifdef, simply
depend on OF.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e1576754a50f..68ae202e0716 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1594,6 +1594,7 @@ config RTC_DRV_MV
 config RTC_DRV_ARMADA38X
 	tristate "Armada 38x Marvell SoC RTC"
 	depends on ARCH_MVEBU || COMPILE_TEST
+	depends on OF
 	help
 	  If you say yes here you will get support for the in-chip RTC
 	  that can be found in the Armada 38x Marvell's SoC device
-- 
2.29.2

