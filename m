Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7183B455741
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Nov 2021 09:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244723AbhKRItH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Nov 2021 03:49:07 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:50548 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244776AbhKRIsy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 Nov 2021 03:48:54 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Nov 2021 03:48:53 EST
Received: from sas2-5b46325ecb6a.qloud-c.yandex.net (sas2-5b46325ecb6a.qloud-c.yandex.net [IPv6:2a02:6b8:c14:251e:0:640:5b46:325e])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 0991265D4536;
        Thu, 18 Nov 2021 11:40:33 +0300 (MSK)
Received: from sas1-37da021029ee.qloud-c.yandex.net (sas1-37da021029ee.qloud-c.yandex.net [2a02:6b8:c08:1612:0:640:37da:210])
        by sas2-5b46325ecb6a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id FtLNllXEUi-eWDiUBtw;
        Thu, 18 Nov 2021 11:40:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1637224833;
        bh=VAVrk5AtcZPdThMqvCtu4lfkZK3ioKc2UOuIMebKmOw=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=JLZrlVtk1yIFaFT7DmA9KmBr7uvWqQOjQ75+Qg71PJrL9lJqxBbDQkuu9h+jjCa5L
         tVYR+KwNzkV6UmRsKc/HUISBvxnSTjULLiqpIo1PmaecL0B9v4lJOiY27lHlCZztHH
         ZzFO4Gs3RqYxxYuejG2zFyvbwapO+NKTYOTEWzpc=
Authentication-Results: sas2-5b46325ecb6a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-37da021029ee.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id 2UL3WBMzNA-eVx4iPp5;
        Thu, 18 Nov 2021 11:40:31 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] rtc: da9063: add as wakeup source
Date:   Thu, 18 Nov 2021 11:40:08 +0300
Message-Id: <20211118084008.30327-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

in case if threaded irq registered successfully - add da9063
as a wakeup source if "wakeup-source" node present in device tree,
set as wakeup capable otherwise.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/rtc/rtc-da9063.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index d4b72a9fa2ba..1aceb5ba6992 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -490,7 +490,15 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 					da9063_alarm_event,
 					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 					"ALARM", rtc);
-	if (ret)
+	if (!ret) {
+		if (device_property_present(&pdev->dev, "wakeup-source")) {
+			device_init_wakeup(&pdev->dev, true);
+			dev_info(&pdev->dev, "registered as wakeup source.\n");
+		} else {
+			device_set_wakeup_capable(&pdev->dev, true);
+			dev_info(&pdev->dev, "marked as wakeup capable.\n");
+		}
+	} else
 		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
 			irq_alarm, ret);
 
-- 
2.31.1

