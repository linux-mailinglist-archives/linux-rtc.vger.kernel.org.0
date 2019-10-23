Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C84E1941
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2019 13:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390794AbfJWLr1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 07:47:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33932 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390566AbfJWLr0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 07:47:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19so20770860lja.1;
        Wed, 23 Oct 2019 04:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=YAqjCYndjyjb4IlD06dDEpbQdw5J16aymsS3GxVNxno=;
        b=s6LfvdTrZW88BBic7lkqUXRdA8CVEwHhyOqNGQ6d2W2dZC+lYRkl+iWwEt+FummunV
         QwHkermvmkX6wiF/RQ3gcnmTULpiE4lMtkeKx+cB6HMQ8NnTs3ifwRxxzCPDY3rLkw/G
         7LGF1pQkGcpT8uza3wFTf2muo9tZrgjZ9KPzRYbKkcbUlbOMEQSlG4K2vIEs8Pqr6duc
         HAO81uVgmU+MGiwCQ13kO/miy4uBo38TOWaRVAOyUWEOotVRSix1zO60IcvDNNokvN8r
         L008SbRfSww9W52IvrQQCcQYJRCcVpEsCJj/rcf87T00zx9K4qkXmwGgwgaHdtG956XO
         u+SQ==
X-Gm-Message-State: APjAAAXkYfnalcRwVn0ZNzynjmWUqFkB+RBEQuMKjXENl5aH7jvJgBFr
        YhzAefGOWB1LHSg29yhSwlw=
X-Google-Smtp-Source: APXvYqw7dFHxkzDAU3F6Ge+LjB4hsmaP2tq3czgTMDhqkv8Zjs3DByhnLLmQSeqetI83Nh0NS8lXLA==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr22151941ljm.81.1571831244557;
        Wed, 23 Oct 2019 04:47:24 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f16sm9416905lfc.26.2019.10.23.04.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 04:47:23 -0700 (PDT)
Date:   Wed, 23 Oct 2019 14:47:11 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: bd70528: Add MODULE ALIAS to autoload module
Message-ID: <20191023114711.GA13954@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The bd70528 RTC driver is probed by MFD driver. Add MODULE_ALIAS
in order to allow udev to load the module when MFD sub-device cell
for RTC is added.

I'm not sure if this is a bugfix or feature addition but I guess
fixes tag won't harm in this case.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/rtc/rtc-bd70528.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index f9bdd555e1a2..41fd54b622b1 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -498,3 +498,4 @@ module_platform_driver(bd70528_rtc);
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("BD70528 RTC driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platofrm:bd70528-rtc");
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
