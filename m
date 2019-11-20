Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E939103C07
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2019 14:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfKTNjp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Nov 2019 08:39:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:47510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728748AbfKTNjo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 Nov 2019 08:39:44 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97F5222506;
        Wed, 20 Nov 2019 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257183;
        bh=sUts0cXMAdfrDXI+3vnyBTJ7WISQ2WDFOrVCG2tEg2M=;
        h=From:To:Cc:Subject:Date:From;
        b=relpmhSwilqmYbKwdHb20YfbjA1pbkoimU73eM9vr6yNJO/kUk16a1t+hhVmf3e3P
         h19joR/n6+AVqnhVbLiBE0rav20o/KXGtOKdCZXgs/WgHhPIfzZ+YYe6xcKrb/t2Qy
         6F3uGHm0xqsAxOSHTcJyAmhdGMkH6GTDKmm0YYII=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:39:40 +0800
Message-Id: <20191120133940.13881-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index c3c271c7431d..d77515d8382c 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1509,9 +1509,9 @@ config RTC_DRV_PXA
 	depends on ARCH_PXA
 	select RTC_DRV_SA1100
 	help
-         If you say Y here you will get access to the real time clock
-         built into your PXA27x or PXA3xx CPU. This RTC is actually 2 RTCs
-         consisting of an SA1100 compatible RTC and the extended PXA RTC.
+	 If you say Y here you will get access to the real time clock
+	 built into your PXA27x or PXA3xx CPU. This RTC is actually 2 RTCs
+	 consisting of an SA1100 compatible RTC and the extended PXA RTC.
 
 	 This RTC driver uses PXA RTC registers available since pxa27x
 	 series (RDxR, RYxR) instead of legacy RCNR, RTAR.
-- 
2.17.1

