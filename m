Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA2A965F2F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2019 19:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbfGKR4V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Jul 2019 13:56:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39553 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbfGKR4V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Jul 2019 13:56:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id b7so3416128pls.6;
        Thu, 11 Jul 2019 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xHJTxAeN+1DHjRmeQFcfiA2JAPbl1+ahBCADP6reZQ0=;
        b=cFW7hCLLVUIvtCgyXqRQzoPJcg5Iex8WEX1KGJRimu0ab3YzyAKpzUK9DnV21MhAjU
         QIkPc5ZXsO9hD21ubOTgs2NXtdLaq95AYjwfhEPaVKEdD3RsGytBzxMjOu/JaMwMIuXN
         Qr/MVhwqA8RbQbfzzC2o5ovmGS4sx4YzGoLWt2HWWfTqBongbVj45WFU9Y0/+Zj9j3FI
         Y0AHigRgCUAmlfneCvWgwTbQOYlYe3iUQ732mm8mgxl4nt6PrFlpMm8yLm5ZVXOBxdYT
         Rp7NAhrKCftLprkPKv9F/qMX774K3+MFOVy0pTKZOOL+8jbmC0K6a5EEYdziXSJdtAkJ
         sqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xHJTxAeN+1DHjRmeQFcfiA2JAPbl1+ahBCADP6reZQ0=;
        b=AMOkEoLWeMstjSGO/fsqtLCel4IZgTfABj7s1dBQ9zUHuI47LYiU4yUlWSegaoqDLj
         Wfp/V1VnmKLDvR47odVITEMiljlW67lppnyvxQXAAOh6ghTdT2f/BbZv6V/8i81BcGVH
         QCYVuHsQM7TVW12b84Z++YHVmLu/NuU4Jp/yP3AHGq+v3a3i2CqBGfcQONLi4639O2hY
         BdJCyxPJu91BhEVkI8jb8lraHWBYIBbfRBf1n4qcouZWP2I7rVLZ4/QeXjArJXZkeBen
         JyM5scDtgCuiRrQpHy0Gl+P/oBgcZUjnrvFMfX41m9hZIx+mOpI9lllySJsmJ9xgI876
         +9Uw==
X-Gm-Message-State: APjAAAWHgt+JSTwxptSsAeYfdOlzKklfHc24jWvlIhPXzcs0FcVsqa0G
        xfOeAd1NgeMI2nblIKYz+ZmUhD0M
X-Google-Smtp-Source: APXvYqxHOHxvgrAU+bn2EGLCozMw7p2mS2jTI0ziAkSW9JaWO7ZazBexsPNjH5j0vLjwoCtPRb/dNA==
X-Received: by 2002:a17:902:9f81:: with SMTP id g1mr5932032plq.17.1562867780488;
        Thu, 11 Jul 2019 10:56:20 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
        by smtp.gmail.com with ESMTPSA id u69sm11029659pgu.77.2019.07.11.10.56.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 10:56:19 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:26:15 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        patches@opensource.cirrus.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: rtc: rtc-wm831x: Add IRQF_ONESHOT flag
Message-ID: <20190711175615.GA13651@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

fix below issue reported by coccicheck
drivers//rtc/rtc-wm831x.c:436:7-32: ERROR: Threaded IRQ with no primary
handler requested without IRQF_ONESHOT

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/rtc/rtc-wm831x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
index d2e8b21..ccef887 100644
--- a/drivers/rtc/rtc-wm831x.c
+++ b/drivers/rtc/rtc-wm831x.c
@@ -435,7 +435,8 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, alm_irq, NULL,
 				wm831x_alm_irq,
-				IRQF_TRIGGER_RISING, "RTC alarm",
+				IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+				"RTC alarm",
 				wm831x_rtc);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ %d: %d\n",
-- 
2.7.4

