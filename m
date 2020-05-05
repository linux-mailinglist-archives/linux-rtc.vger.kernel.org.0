Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A4A1C63C2
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgEEWOX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:14:23 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33510 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWOX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588716825; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DZr2qyanWof7OFJ+7I65Z234p0IkAXqLs+dJPFsk2PE=;
        b=ufQFXK8dE+aMVWL4QkQS8GlaZUsWhQ5JGiL8fVONDob6+z9dj+xX7UM6ZVUQUMhHZQSqmj
        VVMX9lAWbFpIJd7tTaKVceR67nlZLbfIO7zzmQNn/1DYrDT1aGxLk6BCJU7pueX7fbi4C7
        TpV+H84R6SLA3GfQF7q/oO6QI2leKrY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/7] rtc: ingenic: Fix masking of error code
Date:   Wed,  6 May 2020 00:13:35 +0200
Message-Id: <20200505221336.222313-6-paul@crapouillou.net>
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The code was returning -ENOENT on any error of platform_get_irq(), even
if it returned a different error.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 3193eb8bd131..65e130726fc6 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -323,7 +323,7 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENOENT;
+		return irq;
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-- 
2.26.2

