Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABAE98973A
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 08:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfHLGgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 02:36:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46944 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLGgV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 02:36:21 -0400
Received: by mail-lj1-f195.google.com with SMTP id h13so1815835ljc.13;
        Sun, 11 Aug 2019 23:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/vpEUEVLjdkCAlhcb55giL/kGOPY848dG61+iEK0NcA=;
        b=XLXSXK0eiWbPF91T+8JDR58rVmLlb8u0BgOX5DPFiAtsWkGBqBBmz0l8PeZwmEoBeD
         5ZbtGFHbgI+o+dCiTo4xazI6NQm/H6/6nZd31LMshSrIr1g09NbRomTwwCdaChDO1mi5
         joz8djPaWrX/UYz+uZ2DB3U2iuVCJ60iMZh6Ot1J50DCe+jFqZ1uyR7/tTkDnQSLnksD
         kEfn+1EcKEIbZwsXDcHlMQvNUDoGS/urLURXEkO3AQqKtFyJhHbOM4MEdxvM+ekEkRSF
         Xu8BvZJNA0S2AoHxPcgS5da1pScgJBRsFCfZs54OKyJBQMbjoKg/9yRIYr/9w+DfXVN0
         NJaA==
X-Gm-Message-State: APjAAAUkK+jBZCL5P1UvvUCY0m9Z2FcliyB9pG0vnPf0F0/Xxl9xgvDQ
        j+IVQ6JZkMxg4MZ208sGgIQ=
X-Google-Smtp-Source: APXvYqz7QZCYabUZI+UmwtalsRYtNXtt4fpUnUVFgWSM/ShRImkuc7OeZsTD25D/fcpxoVq69pHj0Q==
X-Received: by 2002:a2e:7c14:: with SMTP id x20mr4166039ljc.36.1565591779144;
        Sun, 11 Aug 2019 23:36:19 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b2sm1741182lje.98.2019.08.11.23.36.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Aug 2019 23:36:18 -0700 (PDT)
Date:   Mon, 12 Aug 2019 09:36:11 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>
Subject: [PATCH] rtc: bd70528: fix driver dependencies
Message-ID: <84462e01e43d39024948a3bdd24087ff87dc2255.1565591387.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

With CONFIG_BD70528_WATCHDOG=m, a built-in rtc driver cannot call
into the low-level functions that are part of the watchdog module:

drivers/rtc/rtc-bd70528.o: In function `bd70528_set_time':
rtc-bd70528.c:(.text+0x22c): undefined reference to `bd70528_wdt_lock'
rtc-bd70528.c:(.text+0x2a8): undefined reference to `bd70528_wdt_unlock'
drivers/rtc/rtc-bd70528.o: In function `bd70528_set_rtc_based_timers':
rtc-bd70528.c:(.text+0x50c): undefined reference to `bd70528_wdt_set'

Add a Kconfig dependency which forces RTC to be a module if watchdog is a
module. If watchdog is not compiled at all the stub functions for watchdog
control are used. compiling the RTC without watchdog is fine.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 Issue was found by kbuildbot from linux-next. Issue was addressed by
 Arnd and Randy - but those solutions disallowed compiling the RTC
 without watchdog. This patch is a result of discussion with Arnd and it
 was created on top of Linus' tree (tag v5.3-rc4).
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..add43c337489 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -500,6 +500,7 @@ config RTC_DRV_M41T80_WDT
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528 PMIC RTC"
+	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
 	  on ROHM BD70528 Power Management IC.
-- 
2.17.2


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
