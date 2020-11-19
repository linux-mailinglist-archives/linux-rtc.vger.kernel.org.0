Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7192B918A
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgKSLoh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgKSLmu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:50 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1F2C061A55
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:50 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p19so6107626wmg.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wL9syi02XlJ3GWCQJKLTumIYsNdWAYrm2zoALsAmVoA=;
        b=MRcL2GEpA7P1OJGsT+O+VGGpupV1x/w/eER/h9nC2txDvDpmWat0HMhYVP4InNejQI
         Pckdb2HhB0F0+m9r1hOid4PAPjCGIDxVqaY5/o1mJ9JgOboD/znlRA4gGmw/30CyLtsw
         e0B2j/vLXpK+zqUyzoxLuAmP/qbUvbMOdWt3wWHG0bQXL4zsRNh+eNtNI7eLXKcEoJem
         ITGPASWcH5/zSF1gXN2AeBU5ePm1mdIlFhVDjXZvPS9KaZO0i8cp92LqcXRRiMXZrTsW
         qpBMD6vH/CxDQ3AYiFbS6ZHuEAXdO9uXsImW0m9t8/qET89M+GXhU1CA877zXG+/Omuu
         cgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wL9syi02XlJ3GWCQJKLTumIYsNdWAYrm2zoALsAmVoA=;
        b=OF44PKQ2w2/k1xN2iKj5UFOh1M0CaeJfABCelCSvvi1pqMbOZy4rfNZhAVbAK/AesJ
         mKgOewWotjnPW8y7SXjmYUjVPSTiwyWHA72HdohcID299Ymw4y4Nx5fVe1EN2fRJyx7R
         4PsmRKZUkh1pjaL+LhLqRYvxubnRChZ44VEKTRuF4wM41LW/zC6FSWabaiMgvLC/5A0u
         h5+qKHMOAQ3eFy8ssL3fg6eluL7TkoSKw/PXHNcllyx4diAbuklJEx4lmdtW2OR05Amc
         sVj6PJU5jzLO6jKqPXMAB15aqHKsuPA1koj6hgzpUc75M1HVSpPvFk2AxQHHmfS7wEx/
         Nrew==
X-Gm-Message-State: AOAM532NUWbYNfuuu6kLRPdOooS4OfOkV+cBtwj0Ntolj7TL5FKFE7nB
        GHhKe4GQslnpkZbtaDG9cj8IWw==
X-Google-Smtp-Source: ABdhPJyyPjD4PZs354yw/Otgs2vUHCQDblsvx1KOxHfRwqqu3HL1nCXJehVC1EDT84GCDFCQXEUisQ==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr3902474wmb.141.1605786169209;
        Thu, 19 Nov 2020 03:42:49 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 42/59] rtc: isl12022: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:32 +0100
Message-Id: <20201119114149.4117-43-brgl@bgdev.pl>
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
 drivers/rtc/rtc-isl12022.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 961bd5d1d109..d45a1128823d 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -247,10 +247,13 @@ static int isl12022_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, isl12022);
 
-	isl12022->rtc = devm_rtc_device_register(&client->dev,
-					isl12022_driver.driver.name,
-					&isl12022_rtc_ops, THIS_MODULE);
-	return PTR_ERR_OR_ZERO(isl12022->rtc);
+	isl12022->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(isl12022->rtc))
+		return PTR_ERR(isl12022->rtc);
+
+	isl12022->rtc->ops = &isl12022_rtc_ops;
+
+	return devm_rtc_register_device(isl12022->rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.29.1

