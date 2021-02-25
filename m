Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D803250AD
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Feb 2021 14:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBYNnC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Feb 2021 08:43:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhBYNnB (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 25 Feb 2021 08:43:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A7B564F06;
        Thu, 25 Feb 2021 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614260540;
        bh=dXBwV57U28RH8DcIN+6VJh6bt1T55b5VXT8ftpcR0gM=;
        h=From:To:Cc:Subject:Date:From;
        b=oAsoAyU/unOxr1xGNkVMDWZ7jNEGztMekUF5dmgLVfOencIRVZyWCixVkthcQsxzH
         h8Vtx57qh+h5Mo73PG8VMBwuQSwyccR/ZW+IoJC4tUtYCMD5+U5J2hlkkMNRPujki6
         QgGyuPWgwkwWY4+vVmldZXGU+B/mi8UwkE7Uja4t0SWRjFziQXOM/HQppmbF66JAYR
         Oz5fDn+86vI4+lWy2d3jrHank9EWNbFhKbO81NgyIN3GMysTejsgwmghgJOhllpXsr
         q1oUeyP9+goFk1fHqvm0l2Rymjg351HSdkDSnlNR8LOxEzUIphkLb0o2nmvMLrkynE
         h/U0rL3H1RQfw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: tps65910: include linux/property.h
Date:   Thu, 25 Feb 2021 14:42:04 +0100
Message-Id: <20210225134215.2263694-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The added device_property_present() call causes a build
failure in some configurations because of the missing header:

drivers/rtc/rtc-tps65910.c:422:7: error: implicit declaration of function 'device_property_present' [-Werror,-Wimplicit-function-declaration]

Fixes: 454ba154a62c ("rtc: tps65910: Support wakeup-source property")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/rtc-tps65910.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 288abb1abdb8..bc89c62ccb9b 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -18,6 +18,7 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 #include <linux/math64.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/tps65910.h>
-- 
2.29.2

