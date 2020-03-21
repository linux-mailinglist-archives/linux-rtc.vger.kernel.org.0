Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1123E18E47F
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Mar 2020 21:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgCUUho (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Mar 2020 16:37:44 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:58676 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgCUUho (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Mar 2020 16:37:44 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 7A7A1939DA9; Sat, 21 Mar 2020 21:37:42 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: omap: drop unused dt-bindings header
Date:   Sat, 21 Mar 2020 21:37:37 +0100
Message-Id: <20200321203737.29850-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The definitons in the dt-binding's gpio header only contains some
constants to be used in device trees. It is not relevant for rtc-omap
(as the gpio API hides the details) and in fact unused so it can just be
dropped.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/rtc/rtc-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index d4ed20fb3194..c20fc7937dfa 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2014 Johan Hovold <johan@kernel.org>
  */
 
-#include <dt-bindings/gpio/gpio.h>
 #include <linux/bcd.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-- 
2.25.0

