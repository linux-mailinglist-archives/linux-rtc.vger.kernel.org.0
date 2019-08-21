Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B308B98627
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2019 23:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbfHUVB1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Aug 2019 17:01:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40877 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfHUVB0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Aug 2019 17:01:26 -0400
Received: by mail-wm1-f68.google.com with SMTP id c5so3333397wmb.5;
        Wed, 21 Aug 2019 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UhcZQ4lA9u+37V2YEzYCZa77qAOCxfCX3xooq/2fuug=;
        b=N05pmviJKP8bZU9VEbj3bzBOI+RzcCRMM2dZ3p3uhStr2Ox7nFeWLi4EyX4HE4pZJT
         bw1DduTzfE6m23jKKjUdFaBg3NWijOh/bKx+mwrgvd1VWnsIaDNDh9zsmF0G0PYWFH0Q
         iNLjEq1Qgk40H9b6C2DHuAcHe1fsu0cvP1CVur/kYviJ0VVf5Bl3dOc954c5ro9tW1vE
         xsZl6ysXTtixVNZ4g+tiqAb9kfnDrYf7FlhsHQ/n+pzeuORRQ9CR2Y4ysFFE9lMWlxxI
         hw2C276SX5C0XPKuyxNVeEVF6XhIuUiEmeHapD0K2O4UxMh6l0w4ZcnitXzQYsBM3yDF
         npNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UhcZQ4lA9u+37V2YEzYCZa77qAOCxfCX3xooq/2fuug=;
        b=VKL83rFiR0lCXVIR+GVpu5s/urhQ62Y9farFqNoknr8sNUa0C29PzuDclOlwuebuUB
         axcHAzCh0x94ymacJrOOReu5bYHQZVfIAgz/UyQJJN06Jh8UvAKuglReiLR3oDnMkXB+
         LdRiaS3YBbqDmpUYBSM4hHYAtzE48yAR9oJ5f4eUIWAZIZvCJvJki0yIXSZc8/owmrnP
         BVPXx/oWonciQJCiJ7GLZWStm99KMt0O5kfF0C2tMnTpcGoPs3+VDbZ0CzPkOU+dyvP+
         3P0I/8OPvEqicwrc7brqrgeTYK6U003IHSlXsY6SjoUZEc0+XA838A32rlLGk+5wqReD
         j3Ig==
X-Gm-Message-State: APjAAAVqXjz717UUwzpiMCmZAEnqE7CekiGnpLbQuBxm5Fgy5gXiav2u
        xWnKc8Vi0AsL5HD+DSBGxyc=
X-Google-Smtp-Source: APXvYqxcY255zvfu7hHpFXkZjptvve/MnSI69viqZPleaXoRDa/TDCYIO3349YjnWOHfqVxFA1KTEw==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr2240221wmk.114.1566421284357;
        Wed, 21 Aug 2019 14:01:24 -0700 (PDT)
Received: from alejandro-pc.mundo-R.com (57.166.117.91.dynamic.reverse-mundo-r.com. [91.117.166.57])
        by smtp.gmail.com with ESMTPSA id f6sm49972599wrh.30.2019.08.21.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 14:01:23 -0700 (PDT)
From:   =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= 
        <alejandro.gonzalez.correo@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        maxime.ripard@bootlin.com, wens@csie.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     linux-sunxi@googlegroups.com,
        =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= 
        <alejandro.gonzalez.correo@gmail.com>
Subject: [RESEND PATCH 1/1] rtc: sun6i: Allow using as wakeup source from suspend
Date:   Wed, 21 Aug 2019 23:00:56 +0200
Message-Id: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch allows userspace to set up wakeup alarms on any RTC handled by the
sun6i driver, and adds the necessary PM operations to allow resuming from
suspend when the configured wakeup alarm fires a IRQ. Of course, that the
device actually resumes depends on the suspend state and how a particular
hardware reacts to it, but that is out of scope for this patch.

I've tested these changes on a Pine H64 model B, which contains a
Allwinner H6 SoC, with the help of CONFIG_PM_TEST_SUSPEND kernel option.
These are the interesting outputs from the kernel and commands which
show that it works. As every RTC handled by this driver is largely the
same, I think that it shouldn't introduce any regression on other SoCs,
but I may be wrong.

[    1.092705] PM: test RTC wakeup from 'freeze' suspend
[    1.098230] PM: suspend entry (s2idle)
[    1.212907] PM: suspend devices took 0.080 seconds
(The SoC freezes for some seconds)
[    3.197604] PM: resume devices took 0.104 seconds
[    3.215937] PM: suspend exit

[    1.092812] PM: test RTC wakeup from 'mem' suspend
[    1.098089] PM: suspend entry (deep)
[    1.102033] PM: suspend exit
[    1.105205] PM: suspend test failed, error -22

In any case, the RTC alarm interrupt gets fired as exptected:

$ echo +5 > /sys/class/rtc/rtc0/wakealarm && sleep 5 && grep rtc /proc/interrupts
 29:          1          0          0          0     GICv2 133 Level     7000000.rtc

Signed-off-by: Alejandro González <alejandro.gonzalez.correo@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index c0e75c373605..b7611e5dea3f 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -598,6 +598,33 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
 	.alarm_irq_enable	= sun6i_rtc_alarm_irq_enable
 };
 
+#ifdef CONFIG_PM_SLEEP
+/* Enable IRQ wake on suspend, to wake up from RTC. */
+static int sun6i_rtc_suspend(struct device *dev)
+{
+	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(chip->irq);
+
+	return 0;
+}
+
+/* Disable IRQ wake on resume. */
+static int sun6i_rtc_resume(struct device *dev)
+{
+	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(chip->irq);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(sun6i_rtc_pm_ops,
+	sun6i_rtc_suspend, sun6i_rtc_resume);
+
 static int sun6i_rtc_probe(struct platform_device *pdev)
 {
 	struct sun6i_rtc_dev *chip = sun6i_rtc;
@@ -650,6 +677,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 
 	clk_prepare_enable(chip->losc);
 
+	device_init_wakeup(&pdev->dev, 1);
+
 	chip->rtc = devm_rtc_device_register(&pdev->dev, "rtc-sun6i",
 					     &sun6i_rtc_ops, THIS_MODULE);
 	if (IS_ERR(chip->rtc)) {
@@ -684,6 +713,7 @@ static struct platform_driver sun6i_rtc_driver = {
 	.driver		= {
 		.name		= "sun6i-rtc",
 		.of_match_table = sun6i_rtc_dt_ids,
+		.pm = &sun6i_rtc_pm_ops,
 	},
 };
 builtin_platform_driver(sun6i_rtc_driver);
-- 
2.20.1

