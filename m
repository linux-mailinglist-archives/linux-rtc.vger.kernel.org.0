Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEC52448AC
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 13:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgHNLHj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 07:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgHNLHi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 07:07:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C80C061385
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 04:07:37 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id FP7Y230064C55Sk06P7Y3w; Fri, 14 Aug 2020 13:07:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0003rB-DJ; Fri, 14 Aug 2020 13:07:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0007Z8-CL; Fri, 14 Aug 2020 13:07:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        kogiidena <kogiidena@eggplant.ddo.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-rtc@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] rtc: rtc-rs5c313: Convert to module_platform_driver()
Date:   Fri, 14 Aug 2020 13:07:31 +0200
Message-Id: <20200814110731.29029-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814110731.29029-1-geert+renesas@glider.be>
References: <20200814110731.29029-1-geert+renesas@glider.be>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Reduce boilerplate by using the module_platform_driver() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-rs5c313.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c313.c b/drivers/rtc/rtc-rs5c313.c
index af72e428b218173e..e98f85f34206f16c 100644
--- a/drivers/rtc/rtc-rs5c313.c
+++ b/drivers/rtc/rtc-rs5c313.c
@@ -384,18 +384,7 @@ static struct platform_driver rs5c313_rtc_platform_driver = {
 	.probe	= rs5c313_rtc_probe,
 };
 
-static int __init rs5c313_rtc_init(void)
-{
-	return platform_driver_register(&rs5c313_rtc_platform_driver);
-}
-
-static void __exit rs5c313_rtc_exit(void)
-{
-	platform_driver_unregister(&rs5c313_rtc_platform_driver);
-}
-
-module_init(rs5c313_rtc_init);
-module_exit(rs5c313_rtc_exit);
+module_platform_driver(rs5c313_rtc_platform_driver);
 
 MODULE_AUTHOR("kogiidena , Nobuhiro Iwamatsu <iwamatsu@nigauri.org>");
 MODULE_DESCRIPTION("Ricoh RS5C313 RTC device driver");
-- 
2.17.1

