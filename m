Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928BA595E34
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Aug 2022 16:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbiHPOSl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Aug 2022 10:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbiHPOSi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Aug 2022 10:18:38 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F4F78204
        for <linux-rtc@vger.kernel.org>; Tue, 16 Aug 2022 07:18:32 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 8EJV280024C55Sk01EJVAL; Tue, 16 Aug 2022 16:18:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oNxOm-001LhP-HE; Tue, 16 Aug 2022 16:18:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oNxOl-00Gv2j-Ey; Tue, 16 Aug 2022 16:18:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: mpfs: Remove printing of stray CR
Date:   Tue, 16 Aug 2022 16:18:25 +0200
Message-Id: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

During boot, the driver prints out a stray carriage return character.
Remove it, together with the preceding space character.

While at it, change prescaler to "unsigned long", as returned by
clk_get_rate(), to avoid truncating very large clock rates, and update
the format specifiers.

Fixes: 0b31d703598dc199 ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Apparently updating the RTC when Debian userspace starts fails, causing
an infinite stream of:

    mpfs_rtc 20124000.rtc: timed out uploading time to rtc

Increasing UPLOAD_TIMEOUT_US from 50 to 50000 doesn't help.
---
 drivers/rtc/rtc-mpfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index f14d1925e0c94dfb..944ad10365164c4d 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -233,7 +233,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 {
 	struct mpfs_rtc_dev *rtcdev;
 	struct clk *clk;
-	u32 prescaler;
+	unsigned long prescaler;
 	int wakeup_irq, ret;
 
 	rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
@@ -275,14 +275,13 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 
 	/* prescaler hardware adds 1 to reg value */
 	prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
-
 	if (prescaler > MAX_PRESCALER_COUNT) {
-		dev_dbg(&pdev->dev, "invalid prescaler %d\n", prescaler);
+		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
 		return -EINVAL;
 	}
 
 	writel(prescaler, rtcdev->base + PRESCALER_REG);
-	dev_info(&pdev->dev, "prescaler set to: 0x%X \r\n", prescaler);
+	dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);
 
 	device_init_wakeup(&pdev->dev, true);
 	ret = dev_pm_set_wake_irq(&pdev->dev, wakeup_irq);
-- 
2.25.1

