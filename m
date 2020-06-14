Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545A91F867B
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2020 06:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgFNEEZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 14 Jun 2020 00:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgFNEEZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 14 Jun 2020 00:04:25 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF17C08C5C2
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:25 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id u17so10218775qtq.1
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bCgUa/CKad1+hwecpT7BSTJ3Ng4aQ8lS5YKt0H7/VhE=;
        b=hCGjnEy9inw8B9m/p9op0VEBKNjDocy1RUxo7oekD3Ewbo34U7HWgtglqW7z8uIIUc
         s+J9fGbFWItyyPOgSFMEv6JqsCChajgdLo1MwNDxAZQbX1vckapoGrcwZKBnekjeuasC
         PvI0kr9eua4HBTOmpvxUWcaekQfQV0FO0+fCecFqvGXWiNEWAAchnugRgPkUWyy/rS/C
         1tLTZ8Ze9r/48o4SepF0XXDgxkg8TkZBU3EHVWXKcVjNHQx5HCVMc9sE9AbvFBLZR0kV
         mpDXzRe8xCrlBQKUislH8xvjPQo6fDUIPKxZdFXyAfot2V1qsjSn+vTVhijFqo7lt0Xr
         Q2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bCgUa/CKad1+hwecpT7BSTJ3Ng4aQ8lS5YKt0H7/VhE=;
        b=f6hpEvmWVWGvMau7NenjU1IAvx4P4/EJe/623zYBSS/n/xqBQnMrF+O/HaYa+eAmjS
         mLRps00erZaY+J0x9qeLAiA3Etlzg/X9jh1kODnOqFZADa7qktSdnZ6Xn/Zo6gx4LHTm
         ZLK5lr2CMRWvXYzvUyDV68jspW8L7kBnZ3wpgfa45DgShpOycc+tzKKVFw1a4IDakukY
         9XbSq0Ho/fJbV4KYbWEo+TiJARdIErZVYxxwNEFbttzGMSUWGYGIJcsBqWKiJIGIDvxW
         wpdqXYsx5lKLl+/iJNJaN9nNudaxwVz2+dDCcu+1o73tccrd2TLCD5OmLJ3noFvFINKY
         gNgw==
X-Gm-Message-State: AOAM533cQ245esjOsrl0n97e5kw4lrQ9xJobFaPELJm7YcZzyQnFsj1C
        4EiTaxEKPtI7qMyjePUOvwM8gt2V
X-Google-Smtp-Source: ABdhPJyz7Q9tRQ5U75dPmxgC2cY/6msuMNz6Iz5s6COakJH42G+sFAhLpb6tp+FnKpntrVaE0A0KqA==
X-Received: by 2002:ac8:7252:: with SMTP id l18mr9993796qtp.71.1592107464568;
        Sat, 13 Jun 2020 21:04:24 -0700 (PDT)
Received: from atris.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id a1sm8094870qkn.87.2020.06.13.21.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 21:04:23 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Subject: [PATCH v2 1/2] rtc: pcf2127: add pca2129 device id
Date:   Sun, 14 Jun 2020 00:04:08 -0400
Message-Id: <20200614040409.30302-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614040409.30302-1-liambeguin@gmail.com>
References: <20200614040409.30302-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

The PCA2129 is the automotive grade version of the PCF2129.
add it to the list of compatibles.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
Changes since v1:
- Document new compatible string for the pca2129

 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 drivers/rtc/rtc-pcf2127.c                              | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 18cb456752f6..c7d14de214c4 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -52,6 +52,8 @@ properties:
       - nxp,pcf2127
       # Real-time clock
       - nxp,pcf2129
+      # Real-time clock
+      - nxp,pca2129
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4e50d6768f13..396a1144a213 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -546,6 +546,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 static const struct of_device_id pcf2127_of_match[] = {
 	{ .compatible = "nxp,pcf2127" },
 	{ .compatible = "nxp,pcf2129" },
+	{ .compatible = "nxp,pca2129" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf2127_of_match);
@@ -656,6 +657,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 static const struct i2c_device_id pcf2127_i2c_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
@@ -720,6 +722,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 static const struct spi_device_id pcf2127_spi_id[] = {
 	{ "pcf2127", 1 },
 	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
-- 
2.27.0

