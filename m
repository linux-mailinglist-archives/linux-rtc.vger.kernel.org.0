Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AE721F1C0
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2020 14:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgGNMqD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Jul 2020 08:46:03 -0400
Received: from foss.arm.com ([217.140.110.172]:51060 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgGNMqD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 14 Jul 2020 08:46:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6F8A1FB;
        Tue, 14 Jul 2020 05:46:02 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86643F73D;
        Tue, 14 Jul 2020 05:46:01 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-rtc@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: pl031: fix set_alarm by adding back call to alarm_irq_enable
Date:   Tue, 14 Jul 2020 13:45:56 +0100
Message-Id: <20200714124556.20294-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Commit c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
seemed to have accidentally removed the call to pl031_alarm_irq_enable
from pl031_set_alarm while switching to 64-bit apis.

Let us add back the same to get the set alarm functionality back.

Fixes: c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/rtc/rtc-pl031.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 40d7450a1ce4..c6b89273feba 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -275,6 +275,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	struct pl031_local *ldata = dev_get_drvdata(dev);
 
 	writel(rtc_tm_to_time64(&alarm->time), ldata->base + RTC_MR);
+	pl031_alarm_irq_enable(dev, alarm->enabled);
 
 	return 0;
 }
-- 
2.17.1

