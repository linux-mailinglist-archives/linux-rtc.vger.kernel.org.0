Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4073635CD3
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2019 14:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFEM3D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Jun 2019 08:29:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44119 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfFEM3D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Jun 2019 08:29:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so18912520lfm.11;
        Wed, 05 Jun 2019 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HVlknpI+BmHQFC/piG0dRX/l8wTKMARAJ5WDZfkyic=;
        b=Ms2rYs0QFqMMCLu3YyyLF5yBWqj+Bpee1W+md7KV21p2AXZ3bbf/lvJA+pCrBEFiyx
         o+homoHfmpbb9DJ9fBxqDt/Ulc9PmWNmFyuW0qIHuDpT2UgePwuuSBZq9+MaaLvBaxgR
         Vv3y97dNDm9/OG6FjLG1NFWtj9d44S8QTQaWh+Pn62HoX8yka1RznREopJOgRgS7JKwV
         b2e73K3hfizwgYJr81tFRDM+sqrBTjiboQ05/nWM3wbRfF9jNVVlvRsyDxJZaoUkyWGt
         3PK0mSjaoaxIAHjXSGpwzrntQya9c9s8UcIUve80+oHcBQXxOrIGuWkt2mCM+hGX/Oxj
         n6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HVlknpI+BmHQFC/piG0dRX/l8wTKMARAJ5WDZfkyic=;
        b=it7KJ5B0WmLD3wdqaDXXK6Se3Ttd7CdnKhXBzzXletbkj51oJE5EW0zehwDAULV5Oe
         jgFnQ31YqgTkDfSymgNvygd8QR8i93DSECl6kJYZEfSl4pSRJzP0jyGm2BCnlZ3C2L8h
         rDwNqurO91zzquVWJKe39gniimz8/L4V5ckX/eJkAz38ow6x3ugdyvxqOf5XlsTCy1wG
         E3dFcnoiMghnLOsf6ZgZt3E0NHddHC7d9Oc80ZOPy0NKunzmypbK43H7mqd4giIPfRLc
         6kPNKXJiWf3BuMtfcQxmW6OfeM0QOSw9bIF3DTmGF6VofTVwsMqAFSV+n1PxZwB2CIF9
         YFvQ==
X-Gm-Message-State: APjAAAUIcCEPEoqK5BdxlACl9G1vTJvjsWne8J95Is389Fyoj+Eklmn8
        Z2+lxguw5JewSsFHWHq4WfM=
X-Google-Smtp-Source: APXvYqwax0TiKlVgZKW45dW7mssIGKZdV/et3rVrkRpwCOQ/zRog6pHZ2QRxpfApp+D29cc4/5nKFw==
X-Received: by 2002:a19:6a07:: with SMTP id u7mr16808990lfu.74.1559737741231;
        Wed, 05 Jun 2019 05:29:01 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id f1sm901969ljf.48.2019.06.05.05.28.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 05:29:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Date:   Wed,  5 Jun 2019 15:26:13 +0300
Message-Id: <20190605122613.21303-1-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
macro has no effect for the OF drivers since the alias is overridden by
the drivers core to follow the OF naming convention of the driver's alias,
which is based on the device-tree matching name.

$ cat /sys/devices/soc0/7000e000.rtc/modalias
of:NrtcT(null)Cnvidia,tegra20-rtc

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 8bbaea24926e..8fa1b3febf69 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -419,5 +419,4 @@ module_platform_driver(tegra_rtc_driver);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
-MODULE_ALIAS("platform:tegra_rtc");
 MODULE_LICENSE("GPL");
-- 
2.21.0

