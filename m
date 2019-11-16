Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E1AFF583
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Nov 2019 21:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfKPUiQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Nov 2019 15:38:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36567 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfKPUiQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Nov 2019 15:38:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id k15so14399723lja.3;
        Sat, 16 Nov 2019 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vZoawIQu9fQdv2F8DgBrFiwwMivpluKQlR8XtCqwWOg=;
        b=PtSbp9ZJWwSC+wjNSePRv9GI7jAfw8kDmMBJGlr4ADzccYP34JAiAiQ6ZrwDH1C/bb
         pABHFprVS4C2FJi3qyBWc36tw2+yAaPN9EI1pj02rIUrM0jmR8LM6gPSX8CD3BvE/j4z
         OrP0Apl++8eJWUFd3J7HwmciEt9wWB+GdS+ODf4kgPqpUV7eejeeGzq4rHIOq55aBFau
         6NNrdgtMlYDydjthh2dR4Zi/IK6OE1MjxiwOe+dk4z04aKuXFRfVfpSNuFMsUVDkzIQf
         uKKIEkEMKM4sLevuBhzA91ae/n8vEbqPj0O1+EKy7Vl6Al/fdZPafCDh2dfuVejCYeFl
         znCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZoawIQu9fQdv2F8DgBrFiwwMivpluKQlR8XtCqwWOg=;
        b=eLKQdFPyh3EqZM7Hfs+C6hO+pKZ8pR2V87eM4RLdft7CaKv1kG+AQiB4kRG6A+QWsF
         3fQIhkhanZDnoMzft3XepspHqs8Dh4/k0CK7bbB77DZIeYdRBX50pgpHJYQXnEJYFtvm
         OKpSR2abyYwaEc1GS85+XNLrOZfTulaM00pzZM7J2sAUpOhzBUFFba5BffITwMJ2EEwS
         6hqQANFT78l+GJ59NsvLgpB318k0Y0GjJRBk4ll2MJG9FKJdlt+Tza2ge4ZBo9RrZHIK
         lsQzqIXGWQeAP9DqoP3ymEOR8DQ6+Lu37HGHmaqR5dwPVB4P5c7jWUYGl56E9gcQGCRs
         o30w==
X-Gm-Message-State: APjAAAXM6G+7w7neinJN+wSXb4MV4BZAmNEyHrqBE4H8CX28YCbqrx8i
        tU5MXkfAaifEk2IPsxnipkk=
X-Google-Smtp-Source: APXvYqypFHJrn4/xGyUPdkcs4yzFi3rhkKg2NCvpICbd7I6J/Px9jXg9xHIdJshRPGc1/tEPv6O6ZA==
X-Received: by 2002:a2e:b0d9:: with SMTP id g25mr14985018ljl.176.1573936692723;
        Sat, 16 Nov 2019 12:38:12 -0800 (PST)
Received: from localhost.localdomain ([188.243.226.168])
        by smtp.gmail.com with ESMTPSA id o4sm6610054lfb.89.2019.11.16.12.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 12:38:11 -0800 (PST)
From:   Andrey Skvortsov <andrej.skvortzov@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCHv2] rtc: tps65910: allow using RTC without alarm interrupt
Date:   Sat, 16 Nov 2019 23:37:48 +0300
Message-Id: <20191116203748.27166-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114195941.GL3572@piout.net>
References: <20191114195941.GL3572@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If tps65910 INT1 pin (IRQ output) is not wired to any IRQ controller,
then it can't be used as system wakeup/alarm source,
but it is still possible to read/write time from/to RTC.

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---

v1 -> v2:
 - add detailed commit description
 - remove error message about failed IRQ request

 drivers/rtc/rtc-tps65910.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 2c0467a9e717..e3840386f430 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -361,6 +361,13 @@ static const struct rtc_class_ops tps65910_rtc_ops = {
 	.set_offset	= tps65910_set_offset,
 };
 
+static const struct rtc_class_ops tps65910_rtc_ops_noirq = {
+	.read_time	= tps65910_rtc_read_time,
+	.set_time	= tps65910_rtc_set_time,
+	.read_offset	= tps65910_read_offset,
+	.set_offset	= tps65910_set_offset,
+};
+
 static int tps65910_rtc_probe(struct platform_device *pdev)
 {
 	struct tps65910 *tps65910 = NULL;
@@ -414,14 +421,16 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
 		dev_name(&pdev->dev), &pdev->dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "IRQ is not free.\n");
-		return ret;
-	}
+	if (ret < 0)
+		irq = -1;
+
 	tps_rtc->irq = irq;
-	device_set_wakeup_capable(&pdev->dev, 1);
+	if (irq != -1) {
+		device_set_wakeup_capable(&pdev->dev, 1);
+		tps_rtc->rtc->ops = &tps65910_rtc_ops;
+	} else
+		tps_rtc->rtc->ops = &tps65910_rtc_ops_noirq;
 
-	tps_rtc->rtc->ops = &tps65910_rtc_ops;
 	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-- 
2.20.1

