Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB72FC549
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 01:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731394AbhATACl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 19:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731299AbhATACf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 19:02:35 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BD0C0613D6;
        Tue, 19 Jan 2021 16:01:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h205so31621295lfd.5;
        Tue, 19 Jan 2021 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPHp1gyEWkrgtVqboUUCFGeKWlhOr+lbmjaTbVJNaHY=;
        b=YNvFLyOAusQ8xPj7TCPsO3bqdjpIAasi0a073vS7ro5JYdNA4U1pQwfWnGkOMR/p/z
         yhdqVNT8f91g+hSBYYJSceeF9t2FCdpwyppt8JrLyIGWJoXzqlTFPCIeNk//p3yf6BCd
         muxZaYVZhI0qA8XO2RGV21aw1G++us7cHCWiR07V9wiyLc7HR5Xg+cZv/9G3zb1UDn5Q
         fl02WZsOf+foEDr1ohikPdYQAfO03r5jcdwue4ybUjy4DaTJEUJYEKBEFhHSXWXckeaW
         +RAMcvjPd55vJ9MyOoiPQWDTVxYR7zabE2bUtxMSrcg6XFIg9hZcZ+M8FsgWKUbgJb1Q
         LVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPHp1gyEWkrgtVqboUUCFGeKWlhOr+lbmjaTbVJNaHY=;
        b=C83WwPxZOu/08irqAyi9JzhSj+KuPNgxGyJL0Pz3efadMQcS82o5JK/GfL5j40sJe9
         Z1fQTVgIFYL06bJCSDafbhd5AtExdPmAkyagqSLP0WTF8gSWHXX0QXzO0pCvFYf7yH/4
         9wSihoGe6LcF03TSfT4Or+Kbu35EUEdtt8cH8t46fF6AAkFHdIp7Oo7nzfUksY220eAn
         sDhvVkhcNOea5Amla22TfU779nBQjLWJZLvwFpRaoWgbwvjZcMWqTu3ZTe0eAxFvMRhj
         XGNw+AkMLe2/lsEo8+oGg0hk8yi31dIL5JcbuK+hOfuZzg4IQLueRBvQxM4RKLqVFycw
         ML+w==
X-Gm-Message-State: AOAM533YoFeEP4Zuhp47np6uUJL7iRO/TObeF093nL0pnsI+CXBRGo21
        wfBxomtulZJzg/Gkkr/XExc=
X-Google-Smtp-Source: ABdhPJxpmVVGV+7HsafbLo7U6IUfPpQz5hdw6pjiVqYxV0miEXIbAnQZRIQeDMZRVndk+uBE5YM8Pw==
X-Received: by 2002:a05:6512:910:: with SMTP id e16mr2809899lft.506.1611100896702;
        Tue, 19 Jan 2021 16:01:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id t30sm33128lft.266.2021.01.19.16.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:01:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] rtc: tps65910: Support wakeup-source property
Date:   Wed, 20 Jan 2021 02:59:48 +0300
Message-Id: <20210119235949.15601-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TPS65910 is a PMIC MFD device and RTC is one of its functions. The
wakeup-source DT property is specified for the parent MFD device and we
need to use this property for the RTC in order to allow to use RTC alarm
for waking up system from suspend by default, instead of requiring user
to enable wakeup manually via sysfs.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tps65910.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 2d87b62826a8..f94899d2d5b3 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -426,7 +426,11 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 
 	tps_rtc->irq = irq;
 	if (irq != -1) {
-		device_set_wakeup_capable(&pdev->dev, 1);
+		if (device_property_present(tps65910->dev, "wakeup-source"))
+			device_init_wakeup(&pdev->dev, 1);
+		else
+			device_set_wakeup_capable(&pdev->dev, 1);
+
 		tps_rtc->rtc->ops = &tps65910_rtc_ops;
 	} else
 		tps_rtc->rtc->ops = &tps65910_rtc_ops_noirq;
-- 
2.29.2

