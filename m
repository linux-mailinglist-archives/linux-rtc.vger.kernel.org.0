Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF192B16BB
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Nov 2020 08:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgKMHvt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Nov 2020 02:51:49 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:33016 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbgKMHvt (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:51:49 -0500
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Nov 2020 02:51:48 EST
Received: from localhost.localdomain (unknown [124.16.141.242])
        by APP-05 (Coremail) with SMTP id zQCowAC3ypylOa5fu3bMAA--.60550S2;
        Fri, 13 Nov 2020 15:45:42 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: brcmstb-waketimer: Remove redundant null check before clk_disable_unprepare
Date:   Fri, 13 Nov 2020 07:45:38 +0000
Message-Id: <20201113074538.65028-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAC3ypylOa5fu3bMAA--.60550S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFy8Aw43Ary8uFyUJrb_yoW3urb_CF
        1UWa1fGa1Durs2kw15Cwsxur92q3WxZr4kXFy0ga93AasFqrs8u3y8tr4SkFWkX3y5tFn8
        AF1UKrySyrnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8YhF7UUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAsTA18J9x6ybQABsy
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Because clk_disable_unprepare() already checked NULL clock parameter,
so the additional check is unnecessary, just remove it.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-brcmstb-waketimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 4fee57c51280..375a9987a1d6 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -264,8 +264,7 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
 	unregister_reboot_notifier(&timer->reboot_notifier);
 
 err_clk:
-	if (timer->clk)
-		clk_disable_unprepare(timer->clk);
+	clk_disable_unprepare(timer->clk);
 
 	return ret;
 }
-- 
2.17.1

