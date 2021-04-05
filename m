Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5277C3542A5
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 16:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237431AbhDEOOX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237330AbhDEOOX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 10:14:23 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA2BC061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 07:14:17 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id c4so11585587qkg.3
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eATbR4ZufxK4Jv11wDifMFoa7dGKiOQTzpwmLwl9rok=;
        b=ORy7YFmnk8E5IPH2KDA8Fm/gJKHUCfM6aJjnzA0FRM8Ej/R419nr/vlCFzgagOnnR8
         eT1J6bET9Dau6YbXmZOmWTqR7f1qZLhNnBWXTHu6IBY+AEZNol0Xb34tKXg1/XjiyQMa
         d2gg2Sd0TywIJq9BifGC8IxhICI6fZafGilKUVc4nQT2gNELwfJMf8cuBg1LzZU8T80I
         p8icxnOLXPlBHSRRzYtUTA7eMeWjPpisCOhriAuR7oPJWugdrggxWumvep/2ryXwAJ3h
         Y0W+GJuhczQ6RVpLMe0C5KRW5FocYeNBFRBxxtAfA8kBcsnvyeDy5ipPLb6w/Zd6REZc
         LdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eATbR4ZufxK4Jv11wDifMFoa7dGKiOQTzpwmLwl9rok=;
        b=uXZT4D+pavtMNejfCL4inMIySDWzdnrxIXzaOTE6uh1QgV4n0SZD2mH6TsGSZP3Ef6
         g+4tHPjoUOGKo+4VCXeSOuOrZNmJoQzGmtHj7dIkB60AycOSq1oxzMY1CPEuYyHsza/j
         sU6HFpniNJ4RrQETx6lULkx9jcqotYFsMuiz4RHN1bEZ/zAiNIgP9obS3L3A4xBzPl9i
         gxHUicVSLzkPcAze2TcjyanD+N3agBHb6lLVLbdhvqwLZfqq9vn4scpUOQDmao5NFG3t
         Aff3WrsuGQ3MoU0h+TCJgn60b6qC/aZ9SSofaBtNCZ8x1R5wgzw6s6i+IsFJGB60WWYD
         j6ZA==
X-Gm-Message-State: AOAM531DfdHI9fiqwMQxC6gJGEtskWPWd3OPGkyg1BPOMoIi4KCAlquA
        27NdzpFhPmcnG7GLIt9gtvQ=
X-Google-Smtp-Source: ABdhPJwWS+i8prnkZiX49MXuODG5cu6VJZD2bKUSWXl+cqQZOJctOzel1wtP4j0Mjjna2SMxHaI2mg==
X-Received: by 2002:a05:620a:2914:: with SMTP id m20mr5589203qkp.223.1617632056519;
        Mon, 05 Apr 2021 07:14:16 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id h14sm11970633qtx.64.2021.04.05.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:14:16 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v1 4/4] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
Date:   Mon,  5 Apr 2021 10:13:34 -0400
Message-Id: <20210405141334.3884528-5-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210405141334.3884528-1-liambeguin@gmail.com>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Move the alarm callbacks in rtc_ops and use RTC_FEATURE_ALARM to notify
the core whether alarm capabilities are available or not.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 4c8ba62fb1c6..a8256747d95d 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -368,11 +368,6 @@ static int abeoz9_rtc_setup(struct device *dev, struct device_node *node)
 }
 
 static const struct rtc_class_ops rtc_ops = {
-	.read_time = abeoz9_rtc_get_time,
-	.set_time  = abeoz9_rtc_set_time,
-};
-
-static const struct rtc_class_ops rtc_alarm_ops = {
 	.read_time = abeoz9_rtc_get_time,
 	.set_time = abeoz9_rtc_set_time,
 	.read_alarm = abeoz9_rtc_read_alarm,
@@ -540,6 +535,7 @@ static int abeoz9_probe(struct i2c_client *client,
 	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	data->rtc->uie_unsupported = 1;
+	clear_bit(RTC_FEATURE_ALARM, data->rtc->features);
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
@@ -554,7 +550,7 @@ static int abeoz9_probe(struct i2c_client *client,
 
 	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
 		ret = device_init_wakeup(dev, true);
-		data->rtc->ops = &rtc_alarm_ops;
+		set_bit(RTC_FEATURE_ALARM, data->rtc->features);
 	}
 
 	ret = devm_rtc_register_device(data->rtc);
-- 
2.30.1.489.g328c10930387

