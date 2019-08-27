Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BB49EB2D
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2019 16:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfH0OhJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Aug 2019 10:37:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50190 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfH0OhF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 27 Aug 2019 10:37:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so3386364wml.0;
        Tue, 27 Aug 2019 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeM1To4kzuWWFQY0hurRC3bVq9JC5GR4RCbNZs8RzZc=;
        b=ti+QgyZe92tbpaxS01GBziY1cQaCpuy3GgvXFPj1lIwEixWgdwSYSn6hWnaWzJgPmQ
         cbxNhKIW0yuGKLhizEQY6AKW6eSdgsePvAZMAIEQ0/tYISqfOHrSlVKbcg+g4Hk6gBR8
         w+OnFj04Y3aIBDy2d5FsfrYcumKXAIC67dtRyuw8YU9ezulwdKVfRlg9ItuE2mXiWEdx
         5GpmRp+Dg9Dyfv+sfzy9eYFntbSrDsdNtcNWXNGVuUG5P4cBgBgNxZGa4ukEg5PGh5V/
         mT5t9MOe6z3YDp07mbjV2egMIYuWpQN2Ui2vImJJ4uiBFkHdD1UDd+c2+oEwddJlY+0d
         feug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeM1To4kzuWWFQY0hurRC3bVq9JC5GR4RCbNZs8RzZc=;
        b=kZBpekwkIf9dyrfsvl+45XzTe9Wb4gJkauVJBWwQYopsokIU9ohxKjexPJAa1gz2rG
         3ykhL0Hh2GXRb8Iltcg4RF1sZQz9K5dtykT8Y03ZDlQDDQVLOdTNJxU1q3KEydmlYVTD
         FI9mvizy+4Oo7gJWOxis2c1/ikMWDXUhWJHrG8unsbJ9loNp5J9QMURrrWZAuMs83xd9
         dVJf9FIOrqJgVsk7kvDpxA48+5S0wOmFyjFpYLQjFi+t9pVzpUYYGL95hCZRO6XuQ/vy
         hzlVUXwsUY4qqPte3KytMtlwQ2L0R16f0c4VFUEnbVL81z1a59GsAQouKAMLCVwezmUS
         il/g==
X-Gm-Message-State: APjAAAViOi+hJ2hxAy9G8cq6FZi7W2CA3KA2FCfAzX/iyJ209mQ+Gi0H
        yIT6YS4YG+AFRe82dpyTTcI=
X-Google-Smtp-Source: APXvYqzeNJHZh+dvqBYieROvuqZ8FKrs6sHJabcQR0T3U7dIQlO3JQsRUxHL5j5iSRzI+0bE6SYMbg==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr29242445wmi.48.1566916623501;
        Tue, 27 Aug 2019 07:37:03 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id k6sm4008309wrg.0.2019.08.27.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 07:37:02 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     alexandre.belloni@bootlin.com, linux@roeck-us.net,
        yuehaibing@huawei.com
Cc:     a.zummo@towertech.it, bruno.thomsen@gmail.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] rtc: pcf2127: bugfix: watchdog build dependency
Date:   Tue, 27 Aug 2019 16:36:56 +0200
Message-Id: <20190827143656.4734-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Disable watchdog registation when kernel is build without
watchdog functionality, and enable watchdog core otherwise.
This removes compile errors like the one below:

drivers/rtc/rtc-pcf2127.o: in function `pcf2127_probe.constprop.3':
rtc-pcf2127.c:(.text.unlikely+0x2c8): undefined reference to
`devm_watchdog_register_device'

Watchdog feature in chip will always be configured as
this is safe to do in both cases and minimize code churn.

Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: YueHaibing <yuehaibing@huawei.com>
Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/Kconfig       | 1 +
 drivers/rtc/rtc-pcf2127.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a3bb58a08879..ab0ccf4a3247 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -874,6 +874,7 @@ config RTC_DRV_DS3232_HWMON
 config RTC_DRV_PCF2127
 	tristate "NXP PCF2127"
 	depends on RTC_I2C_AND_SPI
+	select WATCHDOG_CORE if WATCHDOG
 	help
 	  If you say yes here you get support for the NXP PCF2127/29 RTC
 	  chips with integrated quartz crystal for industrial applications.
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 3ec87d320766..02b069caffd5 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -475,9 +475,11 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+#ifdef CONFIG_WATCHDOG
 	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
 	if (ret)
 		return ret;
+#endif /* CONFIG_WATCHDOG */
 
 	/*
 	 * Disable battery low/switch-over timestamp and interrupts.
-- 
2.21.0

