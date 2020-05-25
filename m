Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A061E0479
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2020 03:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbgEYBjx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 24 May 2020 21:39:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53340 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387925AbgEYBjw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 24 May 2020 21:39:52 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9_kIcteX7k4AA--.1106S2;
        Mon, 25 May 2020 09:39:48 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 1/2] rtc: goldfish: Use correct return value for goldfish_rtc_probe()
Date:   Mon, 25 May 2020 09:39:47 +0800
Message-Id: <1590370788-15136-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxn9_kIcteX7k4AA--.1106S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw1xXFykWFyrKw1rWFg_yoW3uFgEk3
        WUur4fAF1kJr1qvw12vw13Cry7G3WFgrs7XFn8Ka9Iv3yUXw17Ga4DZFs7A395Jr4jkFy5
        GFykJFyfur1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6w4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbxhLUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/rtc/rtc-goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index cb6b0ad..2779715 100644
--- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -174,7 +174,7 @@ static int goldfish_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rtcdrv);
 	rtcdrv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtcdrv->base))
-		return -ENODEV;
+		return PTR_ERR(rtcdrv->base);
 
 	rtcdrv->irq = platform_get_irq(pdev, 0);
 	if (rtcdrv->irq < 0)
-- 
2.1.0

