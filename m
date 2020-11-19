Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17662B91D3
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgKSLsG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbgKSLmR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:17 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C84C061A4C
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:16 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so6877747wmd.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bImbyYB8qzW4p1cID+RGGk1MVuQVt4Z7IhIhWf50lvw=;
        b=J0vxQQUkQUOcCl8t2M9frs0x7hg4WjvKPBU/f3GfAMfOMRbyVaZeIfx0vxcybs5dgx
         dxi5qm2zOmAx0z6V/XHSnKsMT5bDQvJo7YlBCf89aBgZV8xms3JhcX65ivL48Fjg53Ao
         pFYq4d2KeACz5YpSeUNVxrtGhg2IrdyVrAfL+zlC68hjuEwMbxALlM1xnHbqgMofKUvS
         aOS53Mk8zbO2EWuMEQwms/nR2dqIxI1VMNQy/2ToIBXFTODnHCDra5O5oFC/aAVK0PmH
         zpkaZJJbTeHs6bRGCkSnju3fMcE5QdSpA9nsRtDHQy/6D2IKuVbnPjbtEWJkwyKfT4Q8
         S01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bImbyYB8qzW4p1cID+RGGk1MVuQVt4Z7IhIhWf50lvw=;
        b=b5xxhqw3iz3xKH6rfMmV/U/Us04UUTlS7IGagK8HCn0rVT6hgnaVqxOON75BkNo3RL
         5XW2ekEmDGmY5dzpLV7JQutbZEeAKM1SUos1y1GxiGsoj31whDLKuN4tVrivZMuVld4p
         r+t25CaFGRH/oHnEfEYiQ15gQZuHVrTnMSV2ImEQefHB1YMQSXsmfMImWtf+X3KYPEtS
         7iH3bMa1vFXgf7Jj66zdNJysrRDg4tBeqzdDRq4QKd0oGn6/DOZWbJyp0bgBvzzs4+ax
         7IO8u62IqrAGGPSsP91gmXeVu/3ZYUWly0qPBhD+ooDFrmXZS1tmD33vis0qyzFEuyvA
         Nf2g==
X-Gm-Message-State: AOAM533wJiN0KmOt+mN6m4j/TNhUq6DueMnEwEiU+szCuuVhwP7x+IbQ
        z0P44CgKuE5BKFU3l+cTbwrlZg==
X-Google-Smtp-Source: ABdhPJzmu0z7oXSpqtPwa+cn9pwXnOilsl0dGRJGoktC+LJ47TfUQZ/lZhbP+J5QMSUFdzvfvZLg8w==
X-Received: by 2002:a1c:5f08:: with SMTP id t8mr4032646wmb.84.1605786135357;
        Thu, 19 Nov 2020 03:42:15 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 10/59] rtc: pcf8583: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:00 +0100
Message-Id: <20201119114149.4117-11-brgl@bgdev.pl>
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
 drivers/rtc/rtc-pcf8583.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index c80ca20e5d8d..93c7bb52bb78 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -290,11 +290,13 @@ static int pcf8583_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, pcf8583);
 
-	pcf8583->rtc = devm_rtc_device_register(&client->dev,
-				pcf8583_driver.driver.name,
-				&pcf8583_rtc_ops, THIS_MODULE);
+	pcf8583->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(pcf8583->rtc))
+		return PTR_ERR(pcf8583->rtc);
 
-	return PTR_ERR_OR_ZERO(pcf8583->rtc);
+	pcf8583->rtc->ops = &pcf8583_rtc_ops;
+
+	return devm_rtc_register_device(pcf8583->rtc);
 }
 
 static const struct i2c_device_id pcf8583_id[] = {
-- 
2.29.1

