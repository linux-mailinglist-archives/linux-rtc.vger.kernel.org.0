Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97763DFF79
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Aug 2021 12:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237541AbhHDKmv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 06:42:51 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60173 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbhHDKme (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Aug 2021 06:42:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 65AB42000D;
        Wed,  4 Aug 2021 10:42:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/4] rtc: s5m: enable wakeup only when available
Date:   Wed,  4 Aug 2021 12:41:31 +0200
Message-Id: <20210804104133.5158-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call device_init_wakeup() only when alarms are available and the RTC is
actually able to wake up the system.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-s5m.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index ee195697e6c6..87df797758fc 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -786,8 +786,6 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	device_init_wakeup(&pdev->dev, 1);
-
 	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc_dev))
 		return PTR_ERR(info->rtc_dev);
@@ -805,6 +803,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 				info->irq, ret);
 			return ret;
 		}
+		device_init_wakeup(&pdev->dev, 1);
 	}
 
 	return devm_rtc_register_device(info->rtc_dev);
-- 
2.31.1

