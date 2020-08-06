Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C1623E00D
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Aug 2020 19:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgHFR7V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Aug 2020 13:59:21 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3127 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgHFR7V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Aug 2020 13:59:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2bfd290001>; Thu, 06 Aug 2020 05:52:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 05:54:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 05:54:37 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 12:54:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Aug 2020 12:54:36 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.183]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2bfd890000>; Thu, 06 Aug 2020 05:54:35 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] rtc: max77686: Fix wake-ups for max77620
Date:   Thu, 6 Aug 2020 13:54:31 +0100
Message-ID: <20200806125431.699339-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596718377; bh=HvOnCueSYaWkbR/lK4/JjyTNelcuLb3sqOohz8d9Wgk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=iZKuG+9V2GSEnYBHLIuTX7/GI49h/PYN0JI+D19w3Am19SRs+06evOrkm2BwvJTmB
         63QhahVCwdlvttes8rLWKGxClzNgn1p4i7ERyhRkPEhC2otKCwhf5LgtaTrI6FxQJJ
         Mt7Ks9g0zVfCwYaSP7HdlEHc4YH5thy3JZYInIMw3uLEnDeIkxtBCxYPS8ZT4j+LUI
         Qv6Iwu3/QiPhcYYuiDhxFrg4PNAD4CUSjpcTU+W0VX6BQWKHVBJDT5NxLqjWdUnCbN
         zoIW0LVGJ0rfQPun9qoBJxIz9dMwXrYYWSkhzPBqAkzLJvq1LocSJpwqx+dqeXMKEE
         Q8bA+ypgsh4wg==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Following commit d8f090dbeafd ("rtc: max77686: Do not allow interrupt to
fire before system resume"), RTC wake-ups stopped working on Jetson TX2
and Jetson Xavier platforms. The Jetson TX2 uses the max77620 PMIC and
the Jetson Xavier uses max20024 PMIC. Both of these PMICs have the same
max77620 RTC controller.

For the max77620 RTC, the variable 'rtc_irq_from_platform' is defined as
true in the max77686 driver and because of this the IRQ passed to the
max77686 driver for RTC is the PMIC IRQ and not the parent. Hence,
following commit d8f090dbeafd ("rtc: max77686: Do not allow interrupt to
fire before system resume"), for the max77620 the RTC IRQ within the
PMIC is now getting disabled on entry to suspend and unable to wake the
system up. Fix this by only disabling interrupts on entry to suspend
in the max77686 RTC driver, if the interrupt is the parent interrupt.

Fixes: d8f090dbeafd ("rtc: max77686: Do not allow interrupt to fire before =
system resume")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/rtc/rtc-max77686.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 645de5af707b..d51cc12114cb 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -815,13 +815,15 @@ static int max77686_rtc_suspend(struct device *dev)
 	}
=20
 	/*
-	 * Main IRQ (not virtual) must be disabled during suspend because if it
-	 * happens while suspended it will be handled before resuming I2C.
+	 * If the main IRQ (not virtual) is the parent IRQ, then it must be
+	 * disabled during suspend because if it happens while suspended it
+	 * will be handled before resuming I2C.
 	 *
 	 * Since Main IRQ is shared, all its users should disable it to be sure
 	 * it won't fire while one of them is still suspended.
 	 */
-	disable_irq(info->rtc_irq);
+	if (!info->drv_data->rtc_irq_from_platform)
+		disable_irq(info->rtc_irq);
=20
 	return ret;
 }
@@ -830,7 +832,8 @@ static int max77686_rtc_resume(struct device *dev)
 {
 	struct max77686_rtc_info *info =3D dev_get_drvdata(dev);
=20
-	enable_irq(info->rtc_irq);
+	if (!info->drv_data->rtc_irq_from_platform)
+		enable_irq(info->rtc_irq);
=20
 	if (device_may_wakeup(dev)) {
 		struct max77686_rtc_info *info =3D dev_get_drvdata(dev);
--=20
2.25.1

