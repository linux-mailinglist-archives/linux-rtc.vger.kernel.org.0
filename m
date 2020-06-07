Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C921F0D44
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2020 19:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgFGRGu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 13:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgFGRGt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jun 2020 13:06:49 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EADC08C5C3
        for <linux-rtc@vger.kernel.org>; Sun,  7 Jun 2020 10:06:49 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id er17so7259002qvb.8
        for <linux-rtc@vger.kernel.org>; Sun, 07 Jun 2020 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bHXAlBXMSdx3fDWVYnkXQL71B2YWcXCF9NobvgMiyYc=;
        b=qE+1EmJctJ7sLScYTqt57GdqsvU4aX/qqjY8KJ9G5Zf9JPnLyfCazbxOWfYI2gs/tK
         ltSxK7QYAL9ciKEMfKCmrH50tCz26inbMn0+FvER7F0cbw+g5hYr8b7Y6+AA9El/BiUD
         Uqeg7DXJn+TFVuDqZG2DS2qARbNRtNeR58NHW2XtRnUd9mm635wei1+V4jMaG/DRQIZd
         yrdoNLK3GASjJdkLdtiX2nebCNolGfy36rgxjqEXLbNaYK/dZdWO4SfKrZGTzxqndWeu
         OZWQhcGJFT9v9q7GBiA0erGdfjv5XVbJnxJ98vEJZFHHWwjRkRxOAGHvB2SrFvSumxj+
         sCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHXAlBXMSdx3fDWVYnkXQL71B2YWcXCF9NobvgMiyYc=;
        b=TkwN7ODyM/81S/gkVp9+f5VHo0emehVL5kzuGqZgK1Way6eNA9hCQG3SANi12UiLbc
         Dw9uAt0cB4qRokXymD9Pk2RuAAOBRdrn7Vf9nQbGw7a03KnrVHJdWKTkBZCKD3XDJ/pz
         ufmCDe07HXR0XA+3qh2yZ0rjVwaqQMytZeXmhq+S4rkPXH47KH8Y/tiGfw02U4b7pMeh
         Z3ogMsXKmKIKcMEq/Rcp3rP8AnVMn3P+A7pyAwGXnpVdcdSmc8XmLtzbmK0OeWNCF1kq
         iOE0wNhcMaQS9RCnJADBu2jA58QMJyWknr3vh9EjELhA6TArO1RimeYv+oBAkiVgKDRF
         sluQ==
X-Gm-Message-State: AOAM5314tZg8UXeaI160m9NuyG4U9iKS4lgIbZ+sDSFAwkrjclXsUbbE
        QL7mTJs6a4m1G9atWBuxJBc=
X-Google-Smtp-Source: ABdhPJyLpi+toyazvPf5pUVqflDKPC/WKrTVKSGqwzu2S78uWCPtdlayI4/XqZ2w8ivtoXEvYi899w==
X-Received: by 2002:ad4:44e9:: with SMTP id p9mr13375835qvt.180.1591549608652;
        Sun, 07 Jun 2020 10:06:48 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p203sm5047088qke.132.2020.06.07.10.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 10:06:48 -0700 (PDT)
From:   liambeguin@gmail.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH 3/3] rtc: pcf2127: reset alarm interrupt at power on
Date:   Sun,  7 Jun 2020 13:06:10 -0400
Message-Id: <20200607170610.24534-4-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200607170610.24534-1-liambeguin@gmail.com>
References: <20200607170610.24534-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

From: Liam Beguin <lvb@xiphos.com>

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-pcf2127.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 3eeb085a7c72..f004a4030970 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -546,6 +546,14 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
 
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AIE, 0);
+	if (ret) {
+		dev_err(dev, "%s: failed to clear interrupt enable bit (%d)",
+			__func__, ret);
+		return ret;
+	}
+
 	device_init_wakeup(dev, true);
 
 	pcf2127->wdd.parent = dev;
-- 
2.27.0

