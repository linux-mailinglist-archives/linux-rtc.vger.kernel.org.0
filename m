Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFE9124174
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 09:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLRITW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 03:19:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33009 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRITW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 03:19:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so879679pgk.0
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 00:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YakRGDG7BdU5uX9703yufhAIOXA3WRlt9xH663dLRw=;
        b=t7kWRkzXO8Akl9EN8Bgna+z6muHQ/lJncIQe3V04KyWHQxkWmBvfA43BOAEWGfT9Ts
         WpLwd3p+I8p26N3p3eCKVqzT/USp1rFE+IYbOB7pd3k8hkicS99TBXLGzXqn7gCQYD/D
         DanWDTL9NVI0YNe4LI+bksS5tMN+PK68YrQlGG1Hyh5vhlQma0iclMXQylgwacVAfR84
         qsu83dtzEDIwFt2gQPzPov92fQt5F0WixGuC15sMhdYzKQFS9U19F9bmCPF6bjtvzrud
         5onpL4Ryn3FpitMDxmrV+bBkYe7o8rJd6vsE/0j/iiY9iMuTRy/ah8j2cn7Y8zkW8TX0
         TrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YakRGDG7BdU5uX9703yufhAIOXA3WRlt9xH663dLRw=;
        b=JnDhx5R0uJMSMUZgNF+wPmpuM1Q7Afl/Hz3//ZgWLBHgo+Dh790KQgiV5bbFtSX292
         ul60x9VL6SUfzVAxqC7FIVLbNlm28gtFm8XmHOhZUHuqU6OtBD9N/GxyBDyFkPIXD/f3
         xW7HgPcbo5mRbgcCVohsNZRDdTnw5uB4vjEJlDaWkbtOs9H3A11ZeC6xctMhn3ZWxzad
         sLhKTOgIWFswpqirTZDLEhmqfHix08rGwWyqqZm9i86ICGSsiyYbMfOE02ONSridMrcR
         YEX9bMbn17pUoIcU9la/SsR4p3vnh9NqcJG5MivySnfMmH0tboBjB8tH1dJtNxnFqQMd
         Sayw==
X-Gm-Message-State: APjAAAUGUEE0IMG5YIRNAU+x89jaICA+mn9hvzA/afSWO4AQNep7i/L4
        tI++IAOsBt+KDMQROw5H8PgVWOsUZQ==
X-Google-Smtp-Source: APXvYqwrE5MyRYwh+wX2GwDkO5UWlWnmY4xrkBnsKnzfeZ2V8CcCCGXsodLwbR56YKUFIHSH4NHbQQ==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr1697181pfq.198.1576657161872;
        Wed, 18 Dec 2019 00:19:21 -0800 (PST)
Received: from localhost (om126208136186.22.openmobile.ne.jp. [126.208.136.186])
        by smtp.gmail.com with ESMTPSA id z16sm1426086pff.125.2019.12.18.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:19:21 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Raghavendra Chandra Ganiga <ravi23ganiga@gmail.com>,
        Ankur Srivastava <sankurece@gmail.com>
Subject: [PATCH] rtc: ds1343: Remove unused struct spi_device in struct ds1343_priv
Date:   Wed, 18 Dec 2019 17:19:17 +0900
Message-Id: <20191218081917.3308211-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

struct spi_device in struct ds1343_priv is not used, remove it.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Raghavendra Chandra Ganiga <ravi23ganiga@gmail.com>
CC: Ankur Srivastava <sankurece@gmail.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-ds1343.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 530e64442b920..ba143423875b9 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -75,7 +75,6 @@ static const struct spi_device_id ds1343_id[] = {
 MODULE_DEVICE_TABLE(spi, ds1343_id);
 
 struct ds1343_priv {
-	struct spi_device *spi;
 	struct rtc_device *rtc;
 	struct regmap *map;
 	int irq;
@@ -362,8 +361,6 @@ static int ds1343_probe(struct spi_device *spi)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->spi = spi;
-
 	/* RTC DS1347 works in spi mode 3 and
 	 * its chip select is active high. Active high should be defined as
 	 * "inverse polarity" as GPIO-based chip selects can be logically
-- 
2.24.0

