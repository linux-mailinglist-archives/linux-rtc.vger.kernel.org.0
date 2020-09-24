Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D4B276F0C
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 12:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgIXKxE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 06:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgIXKxD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Sep 2020 06:53:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821E0C0613D3
        for <linux-rtc@vger.kernel.org>; Thu, 24 Sep 2020 03:53:03 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOs0-00062S-SC; Thu, 24 Sep 2020 12:53:00 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOrz-0005Ch-6e; Thu, 24 Sep 2020 12:52:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] [RFC] rtc: pcf2127: only use watchdog when explicitly available
Date:   Thu, 24 Sep 2020 12:52:56 +0200
Message-Id: <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Most boards using the pcf2127 chip (in my bubble) don't make use of the
watchdog functionality and the respective output is not connected. The
effect on such a board is that there is a watchdog device provided that
doesn't work.

So only register the watchdog if the device tree has a "has-watchdog"
property.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-pcf2127.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 5b1f1949b5e5..8bd89d641578 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 	u32 wdd_timeout;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_WATCHDOG))
+	if (!IS_ENABLED(CONFIG_WATCHDOG) ||
+	    !device_property_read_bool(dev, "has-watchdog"))
 		return 0;
 
 	pcf2127->wdd.parent = dev;
-- 
2.28.0

