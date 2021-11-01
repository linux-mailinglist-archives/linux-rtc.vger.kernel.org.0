Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033B1441CA2
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Nov 2021 15:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhKAOdK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Nov 2021 10:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhKAOdJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Nov 2021 10:33:09 -0400
X-Greylist: delayed 309 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 01 Nov 2021 07:30:35 PDT
Received: from forward106j.mail.yandex.net (forward106j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E95FC061714;
        Mon,  1 Nov 2021 07:30:35 -0700 (PDT)
Received: from iva8-013f64745ff9.qloud-c.yandex.net (iva8-013f64745ff9.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:9886:0:640:13f:6474])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 72789136B660;
        Mon,  1 Nov 2021 17:25:23 +0300 (MSK)
Received: from iva8-a4a480c9f089.qloud-c.yandex.net (2a02:6b8:c0c:da5:0:640:a4a4:80c9 [2a02:6b8:c0c:da5:0:640:a4a4:80c9])
        by iva8-013f64745ff9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id PwIdtPB7jw-PNDirYaW;
        Mon, 01 Nov 2021 17:25:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1635776723;
        bh=VAVrk5AtcZPdThMqvCtu4lfkZK3ioKc2UOuIMebKmOw=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=LhhGBafhXrZklHEV29eiv/C1r12YG5wUnh7itPCYtgw0oH7LfpOu/xdmIL1LHK8Bj
         mfxfxBLbo6er5xGqMzr4h3BRYKd0/yeJX0DgupWDBpkD1iC/PtkNZxJxKJH1e0XNHt
         Wp0aVPBp99NKPg9pizqWeQdzTBE2Z2OaeiCQCpPc=
Authentication-Results: iva8-013f64745ff9.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva8-a4a480c9f089.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id KnxnNr0c1a-PMuadSjH;
        Mon, 01 Nov 2021 17:25:22 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: da9063: add as wakeup source
Date:   Mon,  1 Nov 2021 17:25:04 +0300
Message-Id: <20211101142504.23706-1-nikita.shubin@maquefel.me>
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

