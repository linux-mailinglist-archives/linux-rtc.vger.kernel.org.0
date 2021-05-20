Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E5A389BE4
	for <lists+linux-rtc@lfdr.de>; Thu, 20 May 2021 05:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbhETDde (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 May 2021 23:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhETDde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 May 2021 23:33:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD633C061574;
        Wed, 19 May 2021 20:32:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id kr9so329160pjb.5;
        Wed, 19 May 2021 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=27vMgcBoK9ejwXq1ePHAeG7jlHZcEPcZzjaJh1mmpP4=;
        b=ep+qZMIPjndRE5CAdoC1tDXeOD+YCgiv+YD6b1xhiyU1Nfe59KlBBR9+tPrf/z4omf
         pzSegEIlaQ44L4/wKMzt+MW6FScOtdgMEv+yHKqoSvfpzJqSKV5EP5zuplCOVsTqWQKh
         cG0wWTWkoMjuhM1b3OkqsQpn0FPDgYUQpz1VMnGWx0f86trw4N0iSliFmMkKg5asBUpS
         aYEXmiS/tKZlYo7cm03HLIaBtTBjfEk5WbB7BoXGzMexK2ud5eBPUHhc/S0OuHS4ajz+
         CdSC78R5uY7yQLXrYv7e8+BqWIsNlEVdacMrhKWyBUb7UMRTy05Rgzn7jdW8dr2Ze2nN
         Z78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=27vMgcBoK9ejwXq1ePHAeG7jlHZcEPcZzjaJh1mmpP4=;
        b=k6XLFforaHoNFiiI7uvrUW7IkuA+f+pVxaue+C2zwwVa4QqwktSyQSngFFnZL1W8k8
         o2bcRHgm2SNIcR4QKTsGjTM+w3rD9ok9oU6pFVnygbVR+7jNcoX2756gB9VvUzLqSQcq
         3rlhVJa4adZxQ6VXG109BqwQdCZZCK/LXm+zYAF9cxE8fUFiecvdCf6Y5u05iiQcbDTA
         4kGOKVZxEwHKfDg0H70Fba72Nm3a8z1N1CFLUMMNFmI1dwBNw7PekZHNpucdz8gtaxhg
         1+vX8BlUSA5h2OmgfbbdHJucKK5KQKwPDLqMuOdKUQWxEbKNiR2p5+utkAyF0WqwZ2J4
         7eQQ==
X-Gm-Message-State: AOAM532rOiqCY2wVJTTJpeXaMs0m54yxifFvXi8fWKwZ7nKI9Pw5TMex
        Z06JK9aiqWTS0OpLnvRY0H0=
X-Google-Smtp-Source: ABdhPJwOFctzlfOT8MQ0V2PMhrbrfjr3TSufidZF7N6mtN0ewSE756Yl9s6NK9LTECVuUUiYBc2oMw==
X-Received: by 2002:a17:90b:180b:: with SMTP id lw11mr2484356pjb.141.1621481532376;
        Wed, 19 May 2021 20:32:12 -0700 (PDT)
Received: from localhost.localdomain ([203.90.233.36])
        by smtp.gmail.com with ESMTPSA id 4sm632912pgn.31.2021.05.19.20.32.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 May 2021 20:32:11 -0700 (PDT)
From:   qxj511mail@gmail.com
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qiuxiaojin@cvte.com
Subject: [PATCH] rtc: rs5c372:  Fix read the time from RTC is illegal When reading time from an uninitialized RTC chip, The value may be illegal
Date:   Thu, 20 May 2021 11:31:56 +0800
Message-Id: <20210520033156.23209-1-qxj511mail@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: qiuxiaojin <qiuxiaojin@cvte.com>

Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>
---
 drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 3bd6eaa0dcf6..ce61e15d5f3a 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -212,6 +212,7 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct rs5c372	*rs5c = i2c_get_clientdata(client);
 	int		status = rs5c_get_regs(rs5c);
 	unsigned char ctrl2 = rs5c->regs[RS5C_REG_CTRL2];
+	int flags_utime = 0;
 
 	if (status < 0)
 		return status;
@@ -239,12 +240,27 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_wday = bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
 	tm->tm_mday = bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
 
+	if (tm->tm_mday < 1) {
+		// The value read from the register may be zero, which is an illegal value
+		flags_utime = flags_utime + 1;
+		tm->tm_mday = 1;
+	}
+
 	/* tm->tm_mon is zero-based */
 	tm->tm_mon = bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
 
+	if (tm->tm_mon < 0) {
+		flags_utime = flags_utime + 1;
+		tm->tm_mday = 0;
+	}
+
 	/* year is 1900 + tm->tm_year */
 	tm->tm_year = bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
 
+	if (flags_utime > 0) {
+		rs5c372_rtc_set_time(dev, tm);
+	}
+
 	dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
-- 
2.29.0

