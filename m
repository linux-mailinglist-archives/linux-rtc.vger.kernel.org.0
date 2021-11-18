Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71CC455360
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Nov 2021 04:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241615AbhKRD2u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Nov 2021 22:28:50 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:42397 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241600AbhKRD2t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Nov 2021 22:28:49 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Ux6f13A_1637205946;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Ux6f13A_1637205946)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 18 Nov 2021 11:25:47 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     patrice.chotard@foss.st.com
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] rtc: st-lpc: Use div64_ul instead of do_div
Date:   Thu, 18 Nov 2021 11:25:41 +0800
Message-Id: <1637205941-26223-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

do_div() does a 64-by-32 division. Here the divisor is an
unsigned long which on some platforms is 64 bit wide. So use
div64_ul instead of do_div to avoid a possible truncation.

Eliminate the following coccicheck warnings:

./drivers/rtc/rtc-st-lpc.c:96:1-7: WARNING: do_div() does a 64-by-32
division, please consider using div64_ul instead.
./drivers/rtc/rtc-st-lpc.c:251:1-7: WARNING: do_div() does a 64-by-32
division, please consider using div64_ul instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/rtc/rtc-st-lpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index bdb20f6..b6e169b 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -93,7 +93,7 @@ static int st_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	spin_unlock_irqrestore(&rtc->lock, flags);
 
 	lpt = ((unsigned long long)lpt_msb << 32) | lpt_lsb;
-	do_div(lpt, rtc->clkrate);
+	lpt = div64_ul(lpt, rtc->clkrate);
 	rtc_time64_to_tm(lpt, tm);
 
 	return 0;
@@ -248,7 +248,8 @@ static int st_rtc_probe(struct platform_device *pdev)
 
 	rtc->rtc_dev->ops = &st_rtc_ops;
 	rtc->rtc_dev->range_max = U64_MAX;
-	do_div(rtc->rtc_dev->range_max, rtc->clkrate);
+	rtc->rtc_dev->range_max = div64_ul(rtc->rtc_dev->range_max,
+					rtc->clkrate);
 
 	ret = devm_rtc_register_device(rtc->rtc_dev);
 	if (ret) {
-- 
1.8.3.1

