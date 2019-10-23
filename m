Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0F7E1943
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2019 13:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732149AbfJWLsC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 07:48:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42164 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404768AbfJWLsC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 07:48:02 -0400
Received: by mail-lj1-f194.google.com with SMTP id u4so6626548ljj.9;
        Wed, 23 Oct 2019 04:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1RZOqy8olQ0Z21PCLjnAyMEjEa/GxrB/WLwasx5fjjM=;
        b=aFslU6vi7+LbiZdoPAgw9VUNbICoNpMmf2U2o05c+U/1qnsMQaZMBu1zLe0bBaWraZ
         AWEFnfm48Mog9DoBV5Jx2oJtXCYN/Pp7EtWINiWRo79w4YbA77bixZfkeRiQ0l8CKMcB
         a9iduecJCOF4eYWwBMLg202FWfZfBUTO5DGPQJQwmkObFqpcGVc+59a8Gl5sWj3tJPMu
         yyg5UMNHotFVtWe0B+RUARJxDUJDdQfLwRtwNDH1uhK52SP2LM2zzBaMYfB90v/xVFBC
         kg6q2N+WpWz9mTVBqO9Dp5MhAs7EdA6sz68JI9gLZc2S/aeZwpOvWeA5SfFJZcnWwg+t
         FcRA==
X-Gm-Message-State: APjAAAX1a1Y3eoyXPxClioaVPHhHTXO4ZClNKRIWNLwsHVq3DCDg/MDV
        aiD0y1qvBzGFQJoyctA486UZbEM8yXA=
X-Google-Smtp-Source: APXvYqy1SqKAElfOHH63lhJITfsORJftrngeSfin5Y+K+PYLnh3mvMcDa29qVpOlPhUMprZ4Murbig==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr21558662ljj.43.1571831279878;
        Wed, 23 Oct 2019 04:47:59 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id e29sm9493170ljb.105.2019.10.23.04.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 04:47:59 -0700 (PDT)
Date:   Wed, 23 Oct 2019 14:47:51 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Message-ID: <20191023114751.GA14100@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When RTC is used in 24H mode (and it is by this driver) the maximum
hour value is 24 in BCD. This occupies bits [5:0] - which means
correct mask for HOUR register is 0x3f not 0x1f. Fix the mask

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 include/linux/mfd/rohm-bd70528.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 1013e60c5b25..b0109ee6dae2 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -317,7 +317,7 @@ enum {
 #define BD70528_MASK_RTC_MINUTE		0x7f
 #define BD70528_MASK_RTC_HOUR_24H	0x80
 #define BD70528_MASK_RTC_HOUR_PM	0x20
-#define BD70528_MASK_RTC_HOUR		0x1f
+#define BD70528_MASK_RTC_HOUR		0x3f
 #define BD70528_MASK_RTC_DAY		0x3f
 #define BD70528_MASK_RTC_WEEK		0x07
 #define BD70528_MASK_RTC_MONTH		0x1f
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
