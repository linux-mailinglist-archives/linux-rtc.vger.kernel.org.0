Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A787D2448B8
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 13:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHNLMk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 07:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgHNLMj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 07:12:39 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Aug 2020 04:12:39 PDT
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBD0C061384
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 04:12:39 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id FP7Y230064C55Sk01P7YZ9; Fri, 14 Aug 2020 13:07:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0003r6-Bz; Fri, 14 Aug 2020 13:07:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0007Z2-Ag; Fri, 14 Aug 2020 13:07:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        kogiidena <kogiidena@eggplant.ddo.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-rtc@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] rtc: rtc-rs5c313: Drop obsolete platform_set_drvdata() call
Date:   Fri, 14 Aug 2020 13:07:29 +0200
Message-Id: <20200814110731.29029-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814110731.29029-1-geert+renesas@glider.be>
References: <20200814110731.29029-1-geert+renesas@glider.be>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Commit 284e2fa1da00a998 ("rtc: rtc-rs5c313: use
devm_rtc_device_register()"), removed the last user of the
driver-specific data.  Hence there is no longer a need to set it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-rs5c313.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c313.c b/drivers/rtc/rtc-rs5c313.c
index 89f38e3e917d3d11..00b5ef753935ec8a 100644
--- a/drivers/rtc/rtc-rs5c313.c
+++ b/drivers/rtc/rtc-rs5c313.c
@@ -369,12 +369,7 @@ static int rs5c313_rtc_probe(struct platform_device *pdev)
 	struct rtc_device *rtc = devm_rtc_device_register(&pdev->dev, "rs5c313",
 				&rs5c313_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
-	platform_set_drvdata(pdev, rtc);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(rtc);
 }
 
 static struct platform_driver rs5c313_rtc_platform_driver = {
-- 
2.17.1

