Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C6138BC7A
	for <lists+linux-rtc@lfdr.de>; Fri, 21 May 2021 04:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhEUCmW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 May 2021 22:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhEUCmW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 May 2021 22:42:22 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC571C061574;
        Thu, 20 May 2021 19:40:58 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y15so2454577pfn.13;
        Thu, 20 May 2021 19:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHpQOqyUWs2SR2xgKoUhI9yaLxE0nRI3mQRRH6qiBjA=;
        b=po5OLpR8QFpnsPBudiC/w99K0SQG8bvjcJjOA3esPV8JWZka7yUs5RUV2T9xsVwdAL
         msW0U3gAwXgh95++SNiQWkzcz6IprLLMTzTCNi6emGQmlnt6OoAbB9rRajQgix3Nwddo
         N/WpGghxR8ehSvpipGKBfwRIUzwZ/sfuMIGLu+xV6ZsObM0jKFa/tv9QYYXjCOU1dAbF
         ysE4LsBw8e6I2VM4l9patmy9ggIASd0fH32hjYWumFX/7O9qh7jOHesFihl3Fib4vWcv
         mzUeWC2xfNo2hba+3m2iFwflUvg/m4TJpoAP3JsLVXbXSbgv7JvdcIPq1SzzHuNo6Os9
         DDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHpQOqyUWs2SR2xgKoUhI9yaLxE0nRI3mQRRH6qiBjA=;
        b=dCQxvQtC8W2dFMx3JrUxq8BwhsHg2OVhFa0Y+MYJY6UgYb4R5+e6LMEbW2bTS284Nj
         bGIyyPT5z349v0uqOHaWo2BB/rG99344u/KfF/LcTQtzojZTAdC4UBbuDP0riuINnolr
         mlmT98TVTDt02IwMuQ7VGNxcQtxwOR5VcNIl+C3nYNKIIxAjRKTyM//qTxDLRQyCDI7d
         CmViosCEJDSMZfnzuvzGJP9uh5WGR27ZyeF669XGLaHwJFxCfsg+6v+kSHzlYDExRch3
         7G0TAzGsRsTUeu7ryZR6Vcm7u6lIe0IcKnLiVHxpKCEm+BklzviiuiBExnQT90puX4ZA
         BHYg==
X-Gm-Message-State: AOAM533s9WNLYgfg8kGX2Kkx2rYfyawiYmYbSuGi8mOWljlgL/TyK/hm
        W5RXdetZ6jpJLMR0Q3qqOEAh0k6HvNxS9rha
X-Google-Smtp-Source: ABdhPJw1DhV4lGWNVZcmA4gvBqaYBT71SxMH6Nv+34O39YrAhquTmSA0mdyFj0w+Io/z5i5dikQ4FA==
X-Received: by 2002:aa7:8809:0:b029:2de:3b94:487e with SMTP id c9-20020aa788090000b02902de3b94487emr7606623pfo.33.1621564858532;
        Thu, 20 May 2021 19:40:58 -0700 (PDT)
Received: from localhost.localdomain ([203.90.233.36])
        by smtp.gmail.com with ESMTPSA id o6sm3095037pfb.126.2021.05.20.19.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 19:40:58 -0700 (PDT)
From:   qxj511mail@gmail.com
To:     alexandre.belloni@bootlin.com, a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiuxiaojin@cvte.com
Subject: [PATCH] rtc: rs5c372:  Fix read the time from RTC is illegal When reading time from an uninitialized RTC chip, The value may be illegal
Date:   Fri, 21 May 2021 10:40:26 +0800
Message-Id: <20210521024026.28472-1-qxj511mail@gmail.com>
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
index 3bd6eaa0dcf6..39b123497807 100644
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
+		tm->tm_mon = 0;
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

