Return-Path: <linux-rtc+bounces-1950-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC38975FAA
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 05:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B83C283828
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 03:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB371126C0F;
	Thu, 12 Sep 2024 03:28:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1809524D7
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 03:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726111703; cv=none; b=IFeebS60M2kEOJzcUV3HmMTuXawz+tk/1ToTkzvA+K0UXT4nzl4L+JmUNl8GSVMOixrb3lKLGiRZMYjorKwX21cs0LD3dQF/w68HYZNE3cqJHqFS00E+jwWdrxAOFTaMLeQSN519EbpH4PeIAVrVs0KqIEa97nTOGchvdU0xm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726111703; c=relaxed/simple;
	bh=5xhQse/oV7xIWj6GsS6Wlv9y7st1HmtCZO05W6xnT1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G9/A/lk0vb4gk9yxUSM5OeyxezNX0yvzndK0kuo5Lu63sdv8tHiQ3u55ZFbzd9LdcoZyJ1WeXtI+/WrHGkZjxZ+CbaYh2UQWji9UtNBYXP7gny6IFP7o3Zx2kBEGBhPArVtvxRcrco/T21j3i4+L8JKRQAMU0jL6HbAzQ11b1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X42tR1tBKzyRSm;
	Thu, 12 Sep 2024 11:27:11 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FAD81400E3;
	Thu, 12 Sep 2024 11:28:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 11:28:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <patrice.chotard@foss.st.com>, <alexandre.belloni@bootlin.com>,
	<lee@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 11:37:27 +0800
Message-ID: <20240912033727.3013951-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

If request_irq() fails in st_rtc_probe(), there is no need to enable
the irq, and if it succeeds, disable_irq() after request_irq() still has
a time gap in which interrupts can come.

request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enable when
request IRQ.

Fixes: b5b2bdfc2893 ("rtc: st: Add new driver for ST's LPC RTC")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/rtc/rtc-st-lpc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index d492a2d26600..c6d4522411b3 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -218,15 +218,14 @@ static int st_rtc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler, 0,
-			       pdev->name, rtc);
+	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
+			       IRQF_NO_AUTOEN, pdev->name, rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", rtc->irq);
 		return ret;
 	}
 
 	enable_irq_wake(rtc->irq);
-	disable_irq(rtc->irq);
 
 	rtc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(rtc->clk))
-- 
2.34.1


