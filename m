Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4B72B2B4E
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 05:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgKNESe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Nov 2020 23:18:34 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37982 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726228AbgKNESe (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 13 Nov 2020 23:18:34 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtCOWq9fbCEOAA--.21682S2;
        Sat, 14 Nov 2020 12:18:22 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: Fix memleak in sun6i_rtc_clk_init
Date:   Sat, 14 Nov 2020 12:18:21 +0800
Message-Id: <1605327501-15110-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxKtCOWq9fbCEOAA--.21682S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4rCr1rGr4fCr4fuF17ZFb_yoW8XrW8p3
        yrZrWYkrs7Ka1Fg34ktFyUAF15K3Z7GFyI9r15C3Z5WrnavFykGF42ka40kFy5ArWfX3y5
        ZF4jyry5uF4UCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8XwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4SfOUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When rtc->base or rtc->int_osc or rtc->losc or rtc->ext_losc is NULL,
we should free clk_data and rtc before the function returns to prevent
memleak.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 drivers/rtc/rtc-sun6i.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e2b8b15..84ff1e6 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -272,7 +272,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 								300000000);
 	if (IS_ERR(rtc->int_osc)) {
 		pr_crit("Couldn't register the internal oscillator\n");
-		return;
+		goto err;
 	}
 
 	parents[0] = clk_hw_get_name(rtc->int_osc);
@@ -290,7 +290,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	rtc->losc = clk_register(NULL, &rtc->hw);
 	if (IS_ERR(rtc->losc)) {
 		pr_crit("Couldn't register the LOSC clock\n");
-		return;
+		goto err;
 	}
 
 	of_property_read_string_index(node, "clock-output-names", 1,
@@ -301,7 +301,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 					  &rtc->lock);
 	if (IS_ERR(rtc->ext_losc)) {
 		pr_crit("Couldn't register the LOSC external gate\n");
-		return;
+		goto err;
 	}
 
 	clk_data->num = 2;
@@ -316,6 +316,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 
 err:
 	kfree(clk_data);
+	kfree(rtc);
 }
 
 static const struct sun6i_rtc_clk_data sun6i_a31_rtc_data = {
-- 
2.1.0

