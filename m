Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0309130BF4
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jan 2020 02:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgAFB4k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Jan 2020 20:56:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40229 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgAFB4k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 5 Jan 2020 20:56:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so49318763ljk.7;
        Sun, 05 Jan 2020 17:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4rvRIWvPPO3rgIXN9Qu/ANljbCFEmjfGVoQUvS+BrRQ=;
        b=ARoVldjpnELYLXAJ7cCzkdlqzT4ncLTMjGveBhivQrZqSIbI2lWMrmOM0u7JorPLGA
         CCSiNRIm0tRvFfvQLOqa18QhhjYinnWB+nUrwvQ3NKJa+n0C2h8eWhOeK7a2T9CnCDB/
         Hoav1uW6/qqp0DdPR90DmPqTzc5LVbln4HxCjqNNnOAnuROWIshCYuEFUlqY6JGhY26G
         TIGZ1JeWVCLMhM5AgREoleB0JlSUimr0BYLEgL1pcYVfa2J5c553xq2i08Y2ao4oN6V2
         bWmEV+ua+YDPdUN8jHoCoRJvRLA1wysccMpweeWfoEvHufdQwUzOHfmrTfzGsV0QOox/
         HYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4rvRIWvPPO3rgIXN9Qu/ANljbCFEmjfGVoQUvS+BrRQ=;
        b=TXTaluoQhcY53CLa2ovpMjtp51tJ24tn3A8mAWAwjurMkbArWkOYU734B7jvrB0jIE
         dfPEDFKxfGbHbw02msTxtJ7iqO/RZHOsPYG5cWKc7OXQKMxvPSmgqTnrxsarusUP2cXt
         kfMr3MgA9yW7c0NFgCXX8NaLY3dn1pFqAJy80QvRJHqV57GEbiZe8L/+HI53qnTyQNbR
         dsggl6vLabkutBWEQRB0lE9uEBmlhRflHV0bw6PPv737yKQL2fqz8sWTxKOtvj0C9iun
         OP977S0V1ibS9SOO2iMTgSQ3BYo/W91/yM608xbCLvQPAauWm/qeopiQvnAACOSACMMs
         A7ug==
X-Gm-Message-State: APjAAAXupfPK1pO3s3u4d8lBvg54qg+1AElS3mNp83dMEZEZ9OInoIj4
        68tconS7DYr36yuhd5lH+tI=
X-Google-Smtp-Source: APXvYqw4+wDYspdBn20/FIYRd/Zx8SwBF9egqxCzltwle7cFRuRQvj82k0BUzA7kePdHTqZkSWlPXw==
X-Received: by 2002:a2e:7518:: with SMTP id q24mr59460256ljc.119.1578275798191;
        Sun, 05 Jan 2020 17:56:38 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d1sm27433458ljl.18.2020.01.05.17.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:56:37 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] rtc: tps6586x: Use IRQ_NOAUTOEN flag
Date:   Mon,  6 Jan 2020 04:56:15 +0300
Message-Id: <20200106015615.12602-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The IRQ_NOAUTOEN flag tells interrupt core that interrupt shall not be
auto-enabled at the time of requesting interrupt. This is a minor clean-up
change that doesn't fix any problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tps6586x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 859d901fa6cb..e39af2d67051 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -23,6 +23,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/tps6586x.h>
 #include <linux/module.h>
@@ -267,6 +268,8 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->start_secs = mktime64(2009, 1, 1, 0, 0, 0);
 	rtc->rtc->set_start_time = true;
 
+	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
+
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,
@@ -276,7 +279,6 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 				rtc->irq, ret);
 		goto fail_rtc_register;
 	}
-	disable_irq(rtc->irq);
 
 	ret = rtc_register_device(rtc->rtc);
 	if (ret)
-- 
2.24.0

