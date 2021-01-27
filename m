Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA313052EE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 07:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhA0GBt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Jan 2021 01:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237418AbhA0Dw5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 22:52:57 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF86DC061574
        for <linux-rtc@vger.kernel.org>; Tue, 26 Jan 2021 19:52:16 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id v190so514936qkc.15
        for <linux-rtc@vger.kernel.org>; Tue, 26 Jan 2021 19:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=5VPUeByKd/x9PZw0CSCTNgL+h32Hi7mgbgca394+vo0=;
        b=JxB+HvBGYuQqW6HIGlYpTJ4RO/MLHRodFVPXzQmPP1wZKnUZ5txgtWQM4S7+/MeoBr
         80GFHSro0RVzltbpf671RXyUxdCVdBUDCJxLYIADUsWS8TX1QBbtExU0tQdjDpfEcSqk
         bZn9q2pyQygyBZiiFJtarfDdEmRGmn+HUu1y6L3k2It5wXfle/rvFD9M2R8O1gvjqIKW
         7i+ir4S2OMTUoc4Yh+eXNnSLGhvsdhDsbHpR4hYg16xtdNGSD3mT5+bpGjpF6eouMErn
         AsmTIVIVAQKSkqQQOLckPTP9etYcB+KG4G9A8+mowKctH6nAB5UhmctvhmttUVV+2c7V
         aG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=5VPUeByKd/x9PZw0CSCTNgL+h32Hi7mgbgca394+vo0=;
        b=WeCWcVxnw74ktirvQtYVJkTfAb1+XCTl+2LH8BRH+3su1t4OOmnPmSpjPPicOWzKFC
         OcYS/oDfalNAOMBqM9+Tqvgihmyvc415x8zj8IsADzcpDG/ZPJ0VQvrs6KM/YPzBP1Rm
         fQInMB1D1EB7+5JUem+QctR4RDslwAePGqR+zPYYmEj5HP5Z7MXgRCRr0428hYpHd4Kt
         oSi/abQxtuTIYOpad40fUvXRELUrjuHzzU8UpVEMhNBXgB9rKiOfsqAdvxjMPcRr8O7W
         gLaM4/oezp40uudC6/tx50EoFNA+pBaevgYP1+v3nV28KWP6nCBF7Lj8Qg8bX7uBZg0q
         Jmlg==
X-Gm-Message-State: AOAM533XWqTTKazH+c16PxpaV8tDd3Rxqvn/z9VXAw2FHb1fmv4XNw9N
        szDhDfe92irr+eEVGCEigcuYwFe7e2RjLA==
X-Google-Smtp-Source: ABdhPJzs3mW0fP0yOL0zl7e2jbCHBKc8t1d39J1OXYWMBuUg6hRuKy5Jv1UtE/6otLrY0pHAhmNV26Afd489DQ==
Sender: "davidgow via sendgmr" <davidgow@spirogrip.svl.corp.google.com>
X-Received: from spirogrip.svl.corp.google.com ([2620:15c:2cb:201:7000:2f04:a262:7158])
 (user=davidgow job=sendgmr) by 2002:a05:6214:1348:: with SMTP id
 b8mr1991075qvw.26.1611719535980; Tue, 26 Jan 2021 19:52:15 -0800 (PST)
Date:   Tue, 26 Jan 2021 19:51:47 -0800
Message-Id: <20210127035146.1523286-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] drivers: rtc: Make xilinx zynqmp driver depend on HAS_IOMEM
From:   David Gow <davidgow@google.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        YueHaibing <yuehaibing@huawei.com>
Cc:     David Gow <davidgow@google.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Xilinx zynqmp RTC driver makes use of IOMEM functions like
devm_platform_ioremap_resource(), which are only available if
CONFIG_HAS_IOMEM is defined.

This causes the driver not to be enable under make ARCH=um allyesconfig,
even though it won't build.

By adding a dependency on HAS_IOMEM, the driver will not be enabled on
architectures which don't support it.

Fixes: 09ef18bcd5ac ("rtc: use devm_platform_ioremap_resource() to simplify code")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6123f9f4fbc9..474d95184f20 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1300,7 +1300,7 @@ config RTC_DRV_OPAL
 
 config RTC_DRV_ZYNQMP
 	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
-	depends on OF
+	depends on OF && HAS_IOMEM
 	help
 	  If you say yes here you get support for the RTC controller found on
 	  Xilinx Zynq Ultrascale+ MPSoC.
-- 
2.30.0.280.ga3ce27912f-goog

