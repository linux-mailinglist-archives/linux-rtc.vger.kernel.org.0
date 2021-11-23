Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266E445A464
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Nov 2021 15:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhKWOKj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Nov 2021 09:10:39 -0500
Received: from forward108o.mail.yandex.net ([37.140.190.206]:44272 "EHLO
        forward108o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229895AbhKWOKi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Nov 2021 09:10:38 -0500
Received: from myt6-f96510cd1fe5.qloud-c.yandex.net (myt6-f96510cd1fe5.qloud-c.yandex.net [IPv6:2a02:6b8:c12:4e12:0:640:f965:10cd])
        by forward108o.mail.yandex.net (Yandex) with ESMTP id 721B05DD3578;
        Tue, 23 Nov 2021 17:07:25 +0300 (MSK)
Received: from myt5-89cdf5c4a3a5.qloud-c.yandex.net (myt5-89cdf5c4a3a5.qloud-c.yandex.net [2a02:6b8:c12:289b:0:640:89cd:f5c4])
        by myt6-f96510cd1fe5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id EAARN659cs-7PCujBt4;
        Tue, 23 Nov 2021 17:07:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1637676445;
        bh=zukpakYo/v9A9p+z3C+BYBBdaGVg0clOkde3xk807jI=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=p2i+Fqpuuu2qmhjtrMphSS4mUBUejnAcgFfVWxge5wNE6Focxjzmx9rl1NmwKsLUU
         F04d6bJux6Nf3ZOTZTPuuo2nNxd4qUHmCXNU2CmqrKYS87p0cHNR2Cgwj0CYkhSPg9
         6fpRv4Kt49obpZcvrpbtEMznGbl4OCRDwg9sFiik=
Authentication-Results: myt6-f96510cd1fe5.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-89cdf5c4a3a5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id LKuEaJWePI-7OwqACT4;
        Tue, 23 Nov 2021 17:07:24 +0300
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
Subject: [PATCH v2] rtc: da9063: add as wakeup source
Date:   Tue, 23 Nov 2021 17:06:04 +0300
Message-Id: <20211123140604.21655-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As da9063 driver refuses to load without irq, we simply add it as a wakeup
source before registering rtc device.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
v1->v2:
Alexandre Belloni:

Dropped everything except device_init_wakeup, as driver refuses to load
without irq specified, we can always set it as a wakeup source, before
calling devm_rtc_register_device.
---
 drivers/rtc/rtc-da9063.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index d4b72a9fa2ba..b9a73356bace 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -494,6 +494,8 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
 			irq_alarm, ret);
 
+	device_init_wakeup(&pdev->dev, true);
+
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
-- 
2.31.1

