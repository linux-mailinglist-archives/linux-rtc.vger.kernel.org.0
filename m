Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00D0DFEBB8
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Nov 2019 12:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfKPLGK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Nov 2019 06:06:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37046 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfKPLGK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Nov 2019 06:06:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so13144878wmj.2;
        Sat, 16 Nov 2019 03:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SAKzgkjytwm8hN2lJNxnWydLki58aMZU8LB9qwJ1q/g=;
        b=jN+ETyka3ASMMyeIRVvfQiknNiDQ3oomqT10wxq3I7A9ULEXPtGuR3RDsCBsOPK+Bt
         vHpy8ex9k7VNRkrTX9egM8EnS0vIjB5jHyrEK4NIaq35AqUAAgDkOSmcyJTUyVnZ9OwW
         pOQrjDKDMmmApdFwTgoY3uAdGxQyzSWJVaGblzg5BbpZZJ9TSUwG5MD7QbdYPA6lK2xH
         P8qeiGqvafGbDUDL7lXPFqQMqynY4U6NVixwQuzIhWh0dH6sy1paykyAxmGUx771ON+c
         Ib1Wwq/fl7FWfTN7kd5PawkqLDwAUZYO3toSduNik/ZtqGfr8TSVROiY5IEASwEbXu/v
         YSEA==
X-Gm-Message-State: APjAAAVGwRxbL2pyYYOgkT7O/RvTJjEpWLAdfrgbqth1q13Ra1c8odL1
        Xa1oFT7w0t/1P/mK3WrD9nhTD9BJZhY=
X-Google-Smtp-Source: APXvYqxGGd8FZ36i/R6RBYqfiFWg1jBhqu0Gh3VNpXg1M7IpNKPmXrrAQ9rLNKlbCV8Jb2YD3RvVlA==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr18336347wmm.35.1573902367886;
        Sat, 16 Nov 2019 03:06:07 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-18c6-e000-2463-1bcb-8fa3-05f8.cable.dynamic.v6.ziggo.nl. [2001:1c06:18c6:e000:2463:1bcb:8fa3:5f8])
        by smtp.gmail.com with ESMTPSA id y6sm15000802wrw.6.2019.11.16.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 03:06:07 -0800 (PST)
From:   Kars de Jong <jongk@linux-m68k.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kars de Jong <jongk@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] rtc: msm6242: Fix reading of 10-hour digit
Date:   Sat, 16 Nov 2019 12:05:48 +0100
Message-Id: <20191116110548.8562-1-jongk@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver was reading the wrong register as the 10-hour digit due to
a misplaced ')'. It was in fact reading the 1-second digit register due
to this bug.

Also remove the use of a magic number for the hour mask and use the define
for it which was already present.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Kars de Jong <jongk@linux-m68k.org>
Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
---
 drivers/rtc/rtc-msm6242.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-msm6242.c b/drivers/rtc/rtc-msm6242.c
index 1c2d3c4a4963..b1f2bedee77e 100644
--- a/drivers/rtc/rtc-msm6242.c
+++ b/drivers/rtc/rtc-msm6242.c
@@ -133,7 +133,8 @@ static int msm6242_read_time(struct device *dev, struct rtc_time *tm)
 		      msm6242_read(priv, MSM6242_SECOND1);
 	tm->tm_min  = msm6242_read(priv, MSM6242_MINUTE10) * 10 +
 		      msm6242_read(priv, MSM6242_MINUTE1);
-	tm->tm_hour = (msm6242_read(priv, MSM6242_HOUR10 & 3)) * 10 +
+	tm->tm_hour = (msm6242_read(priv, MSM6242_HOUR10) &
+		       MSM6242_HOUR10_HR_MASK) * 10 +
 		      msm6242_read(priv, MSM6242_HOUR1);
 	tm->tm_mday = msm6242_read(priv, MSM6242_DAY10) * 10 +
 		      msm6242_read(priv, MSM6242_DAY1);
-- 
2.17.1

