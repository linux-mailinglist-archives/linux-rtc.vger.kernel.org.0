Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CBD357A7C
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 04:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDHCky (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 22:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhDHCkw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Apr 2021 22:40:52 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33093C061763
        for <linux-rtc@vger.kernel.org>; Wed,  7 Apr 2021 19:40:41 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id o5so859583qkb.0
        for <linux-rtc@vger.kernel.org>; Wed, 07 Apr 2021 19:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VUFebjQxbI/iJvtepGmyWqsiQ7fkgzG2SEQ9jV39Iro=;
        b=ZehiU5qmLIhL2dvgjl7uqEb5IP2yhpROzk4+iMcI6ug/wjGojgUR97n6DdPsiouTXn
         Sy/MopWa4NArq2qP0zwqF5ZQnKQiRHjNDvOCpnBkOo2naRlE5JoLkFtpTW2WYk6Ngo78
         t7fousLwS0Y8GzMcewBL6JS/7Oe8WUemOFoFvIjrK2lFc+doIMQZC8yeAsVab/hAfLry
         JlGBwbbGc6SRPvzppxAk9tqtriBpbrUFACtICoZzudNDL57Ynu3L7+v3X/4Xe0JgOgnK
         1FYg4sD+z3UBgOSuulXC/gPrATFRCFIiel7cND6aAo0BfPqWHA+yEFoZfoaXpSasIR76
         X7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VUFebjQxbI/iJvtepGmyWqsiQ7fkgzG2SEQ9jV39Iro=;
        b=ibBp3tKa0AQrCk62ZQ1fAr+LlPVxOuv1f9i6Ilm+fADt5J+VS353a2H5BHem/6Hkii
         d7L4V8v2PvDe5+PL/wcPH+EBKS0yHXGm/nm3s/PSIpMYWf9/y+Fawri1/4H2v5hlEapd
         HDQ5Pcm5/EmgZ9+qVZ32dMAZnXCN9WzqbNFSrrRd4VNfxtsjSSpYvEXxljQBC9pzGteX
         334wnyBsl1RrhKUQhISQ2L6yEJSxmO0Qz0VmT2rOTD94jfdQhFaQOL6+HilgV/nuf4oK
         oCBxBaP7PDOQQUAHtWQIIcECKHQxM6Ikps5fIdn/vEQN3/84CEWFBT5OxYMsjmtdox2m
         8Piw==
X-Gm-Message-State: AOAM530vcTcQSQB9hD8w5irgViIJgeIT5z4gyC3qmZIr+xkmXFots8e1
        KgicXwDpaKjDFSwi0WK8igo=
X-Google-Smtp-Source: ABdhPJyWna4MVmXS+KEQr2w6btnSOeWqJoh0yKD6+QkuMb2oC6NhZf4QW/8SlssCQf4s3EzeA6QaCA==
X-Received: by 2002:ae9:e817:: with SMTP id a23mr6565365qkg.124.1617849640506;
        Wed, 07 Apr 2021 19:40:40 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id v128sm20102383qkc.127.2021.04.07.19.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:40:40 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v2 3/3] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
Date:   Wed,  7 Apr 2021 22:40:28 -0400
Message-Id: <20210408024028.3526564-4-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210408024028.3526564-1-liambeguin@gmail.com>
References: <20210408024028.3526564-1-liambeguin@gmail.com>
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
index 7dc96fabc76f..a9b355510cd4 100644
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

