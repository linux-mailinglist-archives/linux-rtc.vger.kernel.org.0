Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7149429349A
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Oct 2020 08:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391952AbgJTGMs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Oct 2020 02:12:48 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:56354 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391951AbgJTGMs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Oct 2020 02:12:48 -0400
Received: from localhost.localdomain (unknown [210.32.148.79])
        by mail-app3 (Coremail) with SMTP id cC_KCgCXOZjLf45ft7M5AA--.20850S4;
        Tue, 20 Oct 2020 14:12:31 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
Date:   Tue, 20 Oct 2020 14:12:26 +0800
Message-Id: <20201020061226.6572-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCXOZjLf45ft7M5AA--.20850S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1rGw18Kr47uFW7Jw1UJrb_yoW8AFWrp3
        4rJ3y5Krs7tan7u3yktFyUAF98G3WxKFWxury5Cwna9rn5CFyrGr47Ga40yF1UZr4xZ3ya
        vF40y3y5uF4UZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv21xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
        ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7VUjHUDJUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgATBlZdtQf4pwABsw
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When clk_hw_register_fixed_rate_with_accuracy() fails,
clk_data should be freed. It's the same for the subsequent
two error paths, but we should also unregister the already
registered clocks in them.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Unregister the already registered clocks on failure.

v3: - Add a new label 'err_register' to unify code style.
---
 drivers/rtc/rtc-sun6i.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e2b8b150bcb4..f2818cdd11d8 100644
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
+		goto err_register;
 	}
 
 	of_property_read_string_index(node, "clock-output-names", 1,
@@ -301,7 +301,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 					  &rtc->lock);
 	if (IS_ERR(rtc->ext_losc)) {
 		pr_crit("Couldn't register the LOSC external gate\n");
-		return;
+		goto err_register;
 	}
 
 	clk_data->num = 2;
@@ -314,6 +314,8 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	return;
 
+err_register:
+	clk_hw_unregister_fixed_rate(rtc->int_osc);
 err:
 	kfree(clk_data);
 }
-- 
2.17.1

