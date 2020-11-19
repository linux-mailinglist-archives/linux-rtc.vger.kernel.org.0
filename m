Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ACE2B914E
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgKSLm0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgKSLmN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:13 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A23BC0613D4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:13 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p19so6106660wmg.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tH1fdfjHU+hECAdu4BcTEE/qJGmgiJo85TGXC7ORmu4=;
        b=cUo8eemoEzdEADg0YAILHp/Ouy/li5o+PJx1PCcdxRZBghWdPAOliVpOq6uwgAfug5
         O2A9MFIjLg8BXO1LV2EaQ8eyi5Vs9buWVkjaqoV+cLnS5iV/+WVN/M6MzpZozB2bLYDs
         CWqOoSLdpAdy/gwitleU0ehB2q8V1RZYCjbshcsSRB41RYWZ4YmKp1M8/Mqy34Z9/Hke
         AYpq7HIKbVJzxOkwY3JgYq5xAFyZTvx4orwyk0H4mXqZbdODrj4zovYiwqdci/iY+WzF
         zEsFV7zgtKEo+x7WBAcgiHhzPkAO8b68lZXl67SadHcplug52UyIRNrefxgM+A2BsgXT
         1efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tH1fdfjHU+hECAdu4BcTEE/qJGmgiJo85TGXC7ORmu4=;
        b=TT7IvdHemBQlSZ46Jx5IdIkg7DKhVL8pwpzs04XASvPJ6NAWru0VKCjR3DOopNy8a7
         aj3E2whB8rT6q7hmQ+3CyDgKZkAa4wa8x7UGmIOdz0fF4G2KqbRbz7re2W2ahKznwhC+
         d8tjsFXR1pvtEopNokQkQpZnhdmvfYgvRugJZho+EDtOOEaaNd/Ad3s/6/3W7aVvpWhN
         FKaR6v2H8djDzACDy2bEy6QHdBZfKJeObh1b3rAN7CzEln/E7xWofC6ybwjxlU4xehz3
         bBCJBJ93rXUIOhf998r1arQ/OBeM0AbZRjJyX+iLKoHX1rd7wa1TMWiWHgeB17TVVC/6
         rZyw==
X-Gm-Message-State: AOAM531uDTHIJBMlWvhwxqrTujZO7OvtTcF8I0gXhr0T+JHF/jpAIlVM
        rSPIjtJokIbKDEN0f//BUfaR8w==
X-Google-Smtp-Source: ABdhPJyzIJLNpWILeKoAmZfWPKCOpjXdNgLaBCYXnFC4xHXl+AzRClSmnG2/n/t1iKhxekWRNUUv0Q==
X-Received: by 2002:a1c:6787:: with SMTP id b129mr3935493wmc.57.1605786131961;
        Thu, 19 Nov 2020 03:42:11 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:11 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/59] rtc: bq32k: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:57 +0100
Message-Id: <20201119114149.4117-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-bq32k.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 933e4237237d..75ac0697160e 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -280,11 +280,12 @@ static int bq32k_probe(struct i2c_client *client,
 	if (client->dev.of_node)
 		trickle_charger_of_init(dev, client->dev.of_node);
 
-	rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
-						&bq32k_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &bq32k_rtc_ops;
+
 	error = bq32k_sysfs_register(&client->dev);
 	if (error) {
 		dev_err(&client->dev,
@@ -292,10 +293,9 @@ static int bq32k_probe(struct i2c_client *client,
 		return error;
 	}
 
-
 	i2c_set_clientdata(client, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static int bq32k_remove(struct i2c_client *client)
-- 
2.29.1

