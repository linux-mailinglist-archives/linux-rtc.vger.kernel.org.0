Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CDD1820A6
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 19:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730691AbgCKSXa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 14:23:30 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51318 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgCKSXa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 14:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583951008; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=XuegH4/ESXmv9jvimvm+jo54TN7v2f2NupKchkt4G/Q=;
        b=RHy36I5iuPJ6cjDS84GmovAHo35bj/Bvg40l/1D3tqI4JBajMOtAL+cYajC58JOCoX62Io
        aNfLcG7d5Io/lHuC/mDcDvMa2q23640p0ZhJ33oMOvALicknhLvlb6ivPK0SaGVmOVawAN
        DFE5ARZSLsVRCCoTI488mtDM2vkG33k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/3] rtc: jz4740: Add support for JZ4760 SoC
Date:   Wed, 11 Mar 2020 19:23:16 +0100
Message-Id: <20200311182318.22154-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The WENR feature (set a magic value to enable RTC registers read-write)
first appeared on the JZ4760; the JZ4780 came much later.

Since it would be dangerous to specify a newer SoC's compatible string as
the fallback of an older SoC's compatible string, we add support for the
"ingenic,jz4760-rtc" compatible string in the driver.

This will permit to support the JZ4770 by having:
compatible = "ingenic,jz4770-rtc", "ingenic,jz4760-rtc";

Instead of doing:
compatible = "ingenic,jz4770-rtc", "ingenic,jz4780-rtc";

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 18023e472cbc..d764cd525c9a 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -46,6 +46,7 @@
 
 enum jz4740_rtc_type {
 	ID_JZ4740,
+	ID_JZ4760,
 	ID_JZ4780,
 };
 
@@ -106,7 +107,7 @@ static inline int jz4740_rtc_reg_write(struct jz4740_rtc *rtc, size_t reg,
 {
 	int ret = 0;
 
-	if (rtc->type >= ID_JZ4780)
+	if (rtc->type >= ID_JZ4760)
 		ret = jz4780_rtc_enable_write(rtc);
 	if (ret == 0)
 		ret = jz4740_rtc_wait_write_ready(rtc);
@@ -298,6 +299,7 @@ static void jz4740_rtc_power_off(void)
 
 static const struct of_device_id jz4740_rtc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-rtc", .data = (void *)ID_JZ4740 },
+	{ .compatible = "ingenic,jz4760-rtc", .data = (void *)ID_JZ4760 },
 	{ .compatible = "ingenic,jz4780-rtc", .data = (void *)ID_JZ4780 },
 	{},
 };
-- 
2.25.1

