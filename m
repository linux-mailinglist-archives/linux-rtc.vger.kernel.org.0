Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AF62B1ED
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 12:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE0KOO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 06:14:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50652 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfE0KOO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 06:14:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id f204so15593631wme.0;
        Mon, 27 May 2019 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9AMH17m9bkd9xBQ84jMqHVsdu+Aw8uZOs+xLuI44dKQ=;
        b=cW7Gw5RcInassntx8h6jvpum6B+yvq3UlkoBex9Hl4yNw/UDWBwzH7TylzvsNNebg2
         TtjCIQBMku/Vvdyh/foFH5j1VpNXiWMF04+Xw1Qtmul/QEqSvpabvLlfonFAApymsHJt
         zDeiThcgUEGKXGKxlAPCuCpbYzrbsKacI3OrisSs9QURSkqzwcpgoLnFbRvPKDkVCu5m
         YbGsNU1ysOrXgmEPN/PWa28HrRb4bbtD8T4tqGGuL4xted9F0e6P+yxRClZzMaJQSSAZ
         mcvW9shC1krtHL0bPRMBmhWTwKbM4v1E/u0MRJG7fn9EPYd85sw40hJmvOEx8aDTcVsb
         rdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9AMH17m9bkd9xBQ84jMqHVsdu+Aw8uZOs+xLuI44dKQ=;
        b=k8gXAymNQWEePS/g9XoLXUhyRk3It8rIzh5aP3ZRAfV4Ou+7cLP/dhTOjKW/kBUDY8
         iTFcei19n9TTmAP6fg0NAN1bTvzI31u0LdU5OPEwtW1rTPqtMEOXb/U/VutdW9CvDAUi
         Z+tGc0OfFCFYyMuBZzqscMSacGgFJr9iujDhoHCbh0CZaztMXtXGKyCV/fy0UhrlQ1jZ
         8CuS9JFAlimo8/9shO+JIijmvkdKUWagGRV4wuqjhNnhFDAY3G6mlO85fVJVfT2G+aHW
         tCY+ZR9TleLJlmy9dFw0VodmzxG4D3/+jJigAJwPAClsJjKvRyAzXYh7QPSV/tWUvCCY
         N+zw==
X-Gm-Message-State: APjAAAU0CdseM0DCTIbE/JEJtjuoqWSXFaMGwxloA0kG/w35td0O/PYc
        GosG3EWScdZ+h7HBuVNsoEs=
X-Google-Smtp-Source: APXvYqxuoXNjr/uGKKOy7i1mJ0Nz9tk6F+28rnvwa+15KVE/sz4/ERJv6r7vIngVOb064HlBR7uZxg==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr16376378wmj.41.1558952051534;
        Mon, 27 May 2019 03:14:11 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id u11sm9327783wrn.1.2019.05.27.03.14.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:14:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: tegra: Turn into regular driver
Date:   Mon, 27 May 2019 12:13:59 +0200
Message-Id: <20190527101359.5898-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527101359.5898-1-thierry.reding@gmail.com>
References: <20190527101359.5898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Drivers registered with module_platform_driver_probe() are considered
non-hotpluggable, which among other things means that they don't support
deferred probe. However, recent changes in how the ARM SMMU works have
required the BPMP (which is the clock provider on Tegra186 and later) be
bound to the SMMU, which in turn means that the BPMP driver can defer
probe and hence clocks become available much later than they used to.
For most other drivers this is not a problem because they already
properly support deferred probe, but rtc-tegra is the odd one out that
now fails to probe and will therefore never be registered.

Fix this by making the driver a regular driver that supports unloading
and deferred probe.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index b68ba2dd1d36..8bbaea24926e 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -2,7 +2,7 @@
 /*
  * An RTC driver for the NVIDIA Tegra 200 series internal RTC.
  *
- * Copyright (c) 2010, NVIDIA Corporation.
+ * Copyright (c) 2010-2019, NVIDIA Corporation.
  */
 
 #include <linux/clk.h>
@@ -274,7 +274,7 @@ static const struct of_device_id tegra_rtc_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
 
-static int __init tegra_rtc_probe(struct platform_device *pdev)
+static int tegra_rtc_probe(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info;
 	struct resource *res;
@@ -406,6 +406,7 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver tegra_rtc_driver = {
+	.probe = tegra_rtc_probe,
 	.remove = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
@@ -414,8 +415,7 @@ static struct platform_driver tegra_rtc_driver = {
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-
-module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);
+module_platform_driver(tegra_rtc_driver);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
-- 
2.21.0

