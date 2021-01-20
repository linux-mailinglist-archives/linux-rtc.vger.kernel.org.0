Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABF2FDBEB
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 22:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbhATV1L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 16:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730345AbhATVRY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Jan 2021 16:17:24 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E5AC0613D3;
        Wed, 20 Jan 2021 13:16:44 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u21so149652lja.0;
        Wed, 20 Jan 2021 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=puoT3PhMHA4aUtA+KKIL7CM1ZheEhQL1zDFA6Af983A=;
        b=rBCjBhNRn1eq0A1fZkIO9qIeGW/poiL1ah83D2As5xWlSgqnC+E70le9eZBJlOSP0s
         Ns1sGSaUBghjBzzGAp6qSSn+D3AuMXjjIXh/sKd0JuFP5y/0JWysQqyYwqNuTPCMEBIW
         v4Q50R6OyB7qyW4TogNezTFyZWQkCWT46pjlDRwWazfINTI7H/4dCMaUZcwKy35tOIZj
         yQ9hQ1VMLIpqX4Pal87SMYfs9KUS2tCcuK3OpBo1CQY5VGaXtMyBNMZzngudPEZSY/cd
         Nwy9t1crwgf+GfisLxuQTsc/sVzDPFinr2M/hymQ45eb42IZmygNCcoSl+57qEGXNTP/
         zbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=puoT3PhMHA4aUtA+KKIL7CM1ZheEhQL1zDFA6Af983A=;
        b=N3QyMyupS+lvylLIPYIflpBpOlgtkVOKADk3YNgoTaPgjtSPyZaPXrfkfgAJpWUAYn
         v94Ngvfl48oGW7astA/23o+YAeBbpcoGGT8L8Xyq259V+GNgnilIOMBUuxNg0fadna/J
         JMalT6Z/rW90EtzoS9gn/DxZdUrbJ0h9/Yy9OQFKYgdtpVVyjXtC2fiX6dOUD2XzWQLq
         CxHkKn9Wwm/5x7qaOGL5mDV5gjXhE2eMnX0q/o+pR8f1O44bJZoz1b/g/qf3XnR3km7q
         6wGbk2YF4PIA+O/m3apL1BnMikrEfF/DzMCMVrLqM7/RA6yk6NlqWV0Wtu9IjJeTUFsu
         briA==
X-Gm-Message-State: AOAM533yHRLXPkiI8H+E90c8gG7sdKkNX8N7luQLnCcP2rPW52hfLuAS
        cRExOHtzZKmWLiFCpf/vA3ALtmi86x0=
X-Google-Smtp-Source: ABdhPJwTeQxlgRM61Qq/WtkbJG3vqp4LqCU/ZugFczD50cOzjWqjt5YtEZbw0vwdqB4Um9uTcYOJjQ==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr5067681lji.48.1611177402589;
        Wed, 20 Jan 2021 13:16:42 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id e20sm341986lja.123.2021.01.20.13.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:16:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rtc: tps65910: Support wakeup-source property
Date:   Thu, 21 Jan 2021 00:16:02 +0300
Message-Id: <20210120211603.18555-1-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Rebased on a recent linux-next, fixed merge conflict.

 drivers/rtc/rtc-tps65910.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index e1415a49f4ee..288abb1abdb8 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -418,10 +418,14 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 		irq = -1;
 
 	tps_rtc->irq = irq;
-	if (irq != -1)
-		device_set_wakeup_capable(&pdev->dev, 1);
-	else
+	if (irq != -1) {
+		if (device_property_present(tps65910->dev, "wakeup-source"))
+			device_init_wakeup(&pdev->dev, 1);
+		else
+			device_set_wakeup_capable(&pdev->dev, 1);
+	} else {
 		clear_bit(RTC_FEATURE_ALARM, tps_rtc->rtc->features);
+	}
 
 	tps_rtc->rtc->ops = &tps65910_rtc_ops;
 	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.29.2

