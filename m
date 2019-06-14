Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E80F45ADC
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 12:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfFNKrv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 06:47:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34804 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfFNKrv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 06:47:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so2035587wrl.1;
        Fri, 14 Jun 2019 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kJkce9QnAQ2uiZZ7WIZ0dOp6754sfSUCWC444c4ZX8=;
        b=s9ovk65wR09SMBZkhl/aHPmD0VGxq9BjXa3YN4IvlDonT4j9AB7svsn6ssnuk6dH1T
         uMIOmzknk7peaKjVah/JWlQDQ7+bnOB9wrBprU9Gc8JatXJmt+xN3s5DqK0YMXSTe4bz
         GOBDgEy0kNT9tpCVmuEtPoP4WVEvkYRu1rCIK9bBFxpL8zmpgA0FBSWgGL6w6Adyb0+R
         EorvOb6sQQe3vZN4F4dUBooR1/u7Ju8Mc/pz+Moh42fFOfzYjdchxky+ah1NK/n5A0O0
         395ikpdlWJUfhvGgMti0G7wofKKqQNqvfUNyDtgxrHT3mCS9IVznIGM/4pybFGKX/oBj
         aVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kJkce9QnAQ2uiZZ7WIZ0dOp6754sfSUCWC444c4ZX8=;
        b=t5LoMTyBQAZkuvEtLX+DlBTQIA6W/Xo9CaGEjN2o0QmqGruy4ZZSlcXS+9Z0xKZ2H6
         dUFpHRMk03wlAtg/mAtrfUaXdR9rx0Tqa1XDY+DVycQ7eYqemJWA9Z2/vmxF0nVHRuTO
         pkRmOI8eBCOQE6OKCOC2uvEm9Jrwpr9wN3OrYWUd/35zeCu2/Nz/Rcc5PHHSFsCc3i6O
         PrM47zstrVii1KEIW/BubgWcEbE+wNm2Ilrk/0+Iq+FUZohaA72XLboFZSw4n4YyExTi
         h0k5fWMAJk+8h8RNmZC9HtO7LGo0CoWmoMzj0qyuNvhURpRiVtN0p1p0hbLHqKeUVner
         Khlw==
X-Gm-Message-State: APjAAAVLKhgjla2Ht6ViAhrkN9LYwHQTSdT/FC3lWSu6IM8u7ixk2t93
        VmBjc2/g+l3ZsE0I4ww4xO4=
X-Google-Smtp-Source: APXvYqxyE04Ux17OdI3cnfl25wz19B8Y9lVATZFL7+lepI3B7xi5/of6zkce+HAIRMo57HhBintKcA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr1009433wrj.37.1560509269308;
        Fri, 14 Jun 2019 03:47:49 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y17sm5200554wrg.18.2019.06.14.03.47.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 03:47:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clocksource: tegra: Use rating when registering clock source
Date:   Fri, 14 Jun 2019 12:47:46 +0200
Message-Id: <20190614104747.19712-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The rating is parameterized depending on SoC generation to make sure it
takes precedence on implementations where the architected timer can't be
used. This rating is already used for the clock event device. Use the
same rating for the clock source to be consistent.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clocksource/timer-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index f6a8eb0d7322..e6608141cccb 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
 
 	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-				    "timer_us", TIMER_1MHz, 300, 32,
+				    "timer_us", TIMER_1MHz, rating, 32,
 				    clocksource_mmio_readl_up);
 	if (ret)
 		pr_err("failed to register clocksource: %d\n", ret);
-- 
2.21.0

