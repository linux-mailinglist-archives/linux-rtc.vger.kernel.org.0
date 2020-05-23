Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844961DF67A
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 11:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387776AbgEWJ4l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 05:56:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60720 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387775AbgEWJ4l (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 23 May 2020 05:56:41 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2lG88hecSk4AA--.531S3;
        Sat, 23 May 2020 17:56:24 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/2] rtc: mpc5121: Fix return value of mpc5121_rtc_probe()
Date:   Sat, 23 May 2020 17:56:22 +0800
Message-Id: <1590227782-32249-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
References: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_2lG88hecSk4AA--.531S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw1xXFykWFyxCF45ZFb_yoWfJrg_Cr
        WavFn3Jw1kCF4vq3WFyay3uryIkanY9FWxW3WUK39aka43Jry7GrykArs5t3yUJw47CF98
        CFZruryxAryfKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbh8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0YFCUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Fixes: d53d4ae981d0 ("rtc: mpc5121: simplify probe")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/rtc/rtc-mpc5121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 3040844..5c2ce71 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -316,7 +316,7 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 	rtc->regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(rtc->regs)) {
 		dev_err(&op->dev, "%s: couldn't map io space\n", __func__);
-		return -ENOSYS;
+		return PTR_ERR(rtc->regs);
 	}
 
 	device_init_wakeup(&op->dev, 1);
-- 
2.1.0

