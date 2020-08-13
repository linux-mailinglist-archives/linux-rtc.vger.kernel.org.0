Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC57243935
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 13:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgHMLQk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Aug 2020 07:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMLQk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Aug 2020 07:16:40 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF52C061757
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 04:16:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so2470797plk.13
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LyVunrfnEItB+vDQ3FaJOfAC5LEvc4r9beaYcx2gG0w=;
        b=ey719sZnGwm8SdppzE8aE97WOqSouKD+bRw9ir4kW5jLHESXaV7x2WLVyWfK/FCMnl
         I6elWCfkxvwddWk14nJz867E/uNi5tPtNJZzHNW3g8MYrL2mVN5n9RuJtq2rsTgjOm5r
         uGdxSoDRNz325gCC7+rYLCfHo2d9XbR2whFISvfONTeX3ij7c9kzGOuEcBsvbV7rXUt6
         NvfEZLkyYglTlJ46gJVmJLW2vBKzAF+rlnSH/udd5/7pyS4iJP1HJ+s/OOrKaKRUZQwN
         jm1fpTYEXqZWoSKtNHH0p3XTYVK+3P+QsyZqtgjQfLEJtJxiOEdonsFdIhrEOzep7ixo
         51cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LyVunrfnEItB+vDQ3FaJOfAC5LEvc4r9beaYcx2gG0w=;
        b=tuNqmKal3dNZRwjdFdOVU91ep0knK1Bt5bYwTaDiR6lCZ2b3WRKUHzpzORwx+uhTPk
         proB/Th9e9Kt0uzps4jEVKgDf0cf+i02bIT8z93gzOazLUxR1rCTFhZWSg8K5KnQ/SbY
         kIoC0xXYijx4aVXaTciRqL8edxF3U2G8T9A9wNfnkqSCuVEOU0b/0vRWY1ArNxjy2mpA
         gFH5QUZbZo/H+lPgdZSTu2g6rpYrP4O27IoEkL7FItmD9yb8IsWi7Ra8cc7k2OdDH+S+
         ZiRaZO653BI+7yReS1VqJ+VjW85swmvrdRCWeppqJ2b9am7OcBA7IVqaEzrpnyS4aNG+
         RTYA==
X-Gm-Message-State: AOAM533N/ZmHBB7nvXP4xItpG9g/lMV0s1YNyokt/mUA//P6qIW8Dd/E
        SNNiT68OR7qwdWcNSIURodY=
X-Google-Smtp-Source: ABdhPJycmYirrdd958Nwtaow7mof0XVqcJK9vnmdCnc4T5qUHFlDLRq/LCyi5moVn7e3Gkx3oRELiw==
X-Received: by 2002:a17:90a:8589:: with SMTP id m9mr4664652pjn.109.1597317399003;
        Thu, 13 Aug 2020 04:16:39 -0700 (PDT)
Received: from localhost.localdomain ([223.190.42.244])
        by smtp.gmail.com with ESMTPSA id e29sm5689965pfj.92.2020.08.13.04.16.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 04:16:38 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, linus.walleij@linaro.org,
        alexandre.belloni@bootlin.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH] rtc: pl031: enable rtc alarm interrupt again
Date:   Thu, 13 Aug 2020 16:44:28 +0530
Message-Id: <1597317268-19537-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

After commit c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/
rtc_tm_to_time64"), it has been observed the rtc alarm interrupt is
no more registered, and due to this waking up the system
(using rtc alarm interrupt) from suspend state is no longer possible.

Besides this, we get broken output from "hwclock".

root@localhost:~# hwclock
hwclock: select() to /dev/rtc to wait for clock tick timed out: No such file or directory

This is due to the fact that call to pl031_alarm_irq_enable(dev, alarm->enabled)
is removed (from pl031_set_alarm()) in commit c8ff5841a90b, and alarm interrupt
never gets enabled.

This commit fixes it by re-introduces the missing
pl031_alarm_irq_enable(dev, alarm->enabled).

Fixes: c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
This patch is tested on QEMU ARM64 TCG guest

Without this patch:
root@localhost:~# echo +10 > /sys/class/rtc/rtc0/wakealarm && sleep 10 && cat /proc/interrupts | grep pl031
39:          0          0     GICv2  34 Level     rtc-pl031

With this patch:
root@localhost:~# echo +10 > /sys/class/rtc/rtc0/wakealarm && sleep 10 && cat /proc/interrupts | grep pl031
39:          1          0     GICv2  34 Level     rtc-pl031

root@localhost:~# hwclock 
Thu Aug 13 11:00:06 2020  -1.009351 seconds

root@localhost:~# echo +30 > /sys/class/rtc/rtc0/wakealarm
root@localhost:~# echo -n mem > /sys/power/state
root@localhost:~# hwclock -r
Thu Aug 13 08:59:14 2020  -1.010357 seconds

---
 drivers/rtc/rtc-pl031.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 40d7450a1ce4..c6b89273feba 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -275,6 +275,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	struct pl031_local *ldata = dev_get_drvdata(dev);
 
 	writel(rtc_tm_to_time64(&alarm->time), ldata->base + RTC_MR);
+	pl031_alarm_irq_enable(dev, alarm->enabled);
 
 	return 0;
 }
-- 
2.7.4

