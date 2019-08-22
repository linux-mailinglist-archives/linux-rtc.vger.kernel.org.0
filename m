Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A4F994BF
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbfHVNTv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:19:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51764 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbfHVNTv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:19:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id k1so5626645wmi.1;
        Thu, 22 Aug 2019 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddD9APKRjXleO36Xs3naLTEd/IAvAOuyDBxcB3/l6RE=;
        b=KW7054+XQ7ewqXyjahG/huCwZ5HAssdkIt/hab63CWZoC89MOHcnpHYU0X6yODmlp2
         N380G9NR9JjrEVP1ZgimWq4Q0rRsGqorTbhC8dvY4qDfIN51DzOaSOhYII3sL7E2de0T
         obwNVydsqICf5LBE5EFU4kwA9GrUK+BRYBJJuKJmzteXtGYwKSma1n2JCTNicJNIg8pk
         8pDY5R6VtLcx1kp4RCjZ8x00qflilBvrs4OEXBzpN2xr7yG60Y0GLo4hgbtIO/API7PU
         iDJXMaKAt6LfI7rNtS/RAp61B00gemAcyDPfelr/4q15SCpiTUSAq/0bmfOBKXrg/ji7
         V1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddD9APKRjXleO36Xs3naLTEd/IAvAOuyDBxcB3/l6RE=;
        b=Gc033YMTfIrukOQ2kqkdblva1igAA9lBhk5vmnSfLUKpc/oZtIKj5ykhuxD7rvzWQ/
         1+UCFo+zzOUXMJtnMQAggoWeTOmgYgAktiRa2xrvXRbhhUKYG/rv0pMyEv7OIQlkYI70
         TlcVUQiOOESgmtuiv2UYW4ifXDs6/OXcw8nGt/wsndAdG5UqNLN3j1g+dGLZNm4ygcvk
         7sPWIbLpqq7Ex/qxj12s3zL6ZjnT30VyCvK0P0t1ip6769tajm4UEZ0sb5y66sdg6CWj
         5a0qa1ofAn23No4RH6KvZVnp1mnnegQUjn1n8LyIII1S9qRBoXC2suCBlY2xIQshQYzy
         rAEw==
X-Gm-Message-State: APjAAAWynQ5nnca31zCNLIQpdMP5VA0ZYZQPt0AF9RgBOANEvJG0CU8G
        Ftznmnc6G2fBx9YvgP6VcIP+n5JghrV76w==
X-Google-Smtp-Source: APXvYqxZL7YUSunqPC7/AS91BwMbMyqOjmZhe4tKxkizMwfLl2FJD+RCl/trAs1BIYNzqeHrD8BP8A==
X-Received: by 2002:a1c:9a95:: with SMTP id c143mr6364700wme.2.1566479989188;
        Thu, 22 Aug 2019 06:19:49 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id d19sm34644045wrb.7.2019.08.22.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:19:48 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        bruno.thomsen@gmail.com
Subject: [PATCH v3 1/5] rtc: pcf2127: convert to devm_rtc_allocate_device
Date:   Thu, 22 Aug 2019 15:19:32 +0200
Message-Id: <20190822131936.18772-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v3: no change.
v2: no change.

 drivers/rtc/rtc-pcf2127.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 8632f58fed43..58eb96506e4b 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -237,11 +237,12 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, pcf2127);
 
-	pcf2127->rtc = devm_rtc_device_register(dev, name, &pcf2127_rtc_ops,
-						THIS_MODULE);
+	pcf2127->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(pcf2127->rtc))
 		return PTR_ERR(pcf2127->rtc);
 
+	pcf2127->rtc->ops = &pcf2127_rtc_ops;
+
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -253,7 +254,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
-	return ret;
+	return rtc_register_device(pcf2127->rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.21.0

