Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B57161EA9
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 14:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730907AbfGHMmx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 08:42:53 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37055 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbfGHMmx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 08:42:53 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MGQaz-1hj2Ju1bB7-00GoDc; Mon, 08 Jul 2019 14:42:39 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: bd70528: fix link error
Date:   Mon,  8 Jul 2019 14:41:52 +0200
Message-Id: <20190708124227.3422311-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AT4kSiu1GuoNhaMh/p6YSO1mWFYkzf7RIkG03qsJ4WUI3nACoEo
 WTHbGPQCW6RVE+5Do3TjDRP2XayI85hGYaT1QLtgks6UsyIW/6Q3HOhs2Tvv13TOEYD7EEV
 KzRvEVkXkIk2ih2YiY8S3YbBU7LcjgY0h5jTlJHjhLBf5dPVd3fimuJZzM05rV/IC7jsBep
 z1KAMvNjca/vZ2+1Xct4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uCD7Stf7FRY=:2FhKI7nHtA11ApwTuVKGYN
 HS1o2tvRQBas6TzToqaxoxHTccNa2V0BhEFakHQj/mNimYJI/Fb01isXruI/nGPZ4DchpJ8P4
 UqsdBXcRIswrgdPGfgO8zTAEPJNAT3UYBRBYiXN7lQG/BMJeK02QjjorBYjtIjsvyBlGtFmPY
 KHpJzbti0oSzR+TUISyaR1SN8iUVv5S7MI7vnmh0ooGYBk4+AbDnGl3zdJQFBOIEfJyAh3bs7
 oEE5/91TnDZ9MktkS4yc+bSiU6nofNmznPi8wbZuH+7Afv4XIC3BEV12k7qGGEPtJ22ukZ7nG
 r8ZRMvNwdDLbDm4gbgCiBiFoPvpCbNvAMz+qQQa89voNw9p3a8MMLdR5RpcUTnmn4MABW3Aaw
 T7yomtzbRNHBbwipCfZQRJPNVIA+i73ws8Am9SnWZiNtHTvBgAc5I9U33EEdg8mNIZN3u5Wsd
 Zq6+Pa/H7zwjgS8Dd2+DcvFrI0EfDC6bKjN8Hm3M2dfrBC3qKQzn1QfCEvvmS7CiUyQVB+aDO
 VyxBdnG7vSUIRO/OGLQ7gmYtoo5ndJ5mSVbl9WouAhrqf8qTP3UPhyWbwNFlHWks0OJFV6e8f
 QacdkplH7pvG094Cf6jsYtRW22BG3t3t32gZ9eoV+CkOiJahKtBlWeAA985+13lLtdsiPgtOQ
 Qj1oOJg3+3jeqAACG5PX+FveYA4HPWQjND/u//DRgU/jQe+RTRpB/jWTzID6cxjWilp78Xy74
 /M7ZGCG+tJZdMdCx/HmOjMvFcnAf1a0ato3Qlw==
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

Add a Kconfig dependency on this driver, but still allow compile-testing
without it.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3bfc04a86529..7b071cc74422 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -498,8 +498,10 @@ config RTC_DRV_M41T80_WDT
 	help
 	  If you say Y here you will get support for the
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
+
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528 PMIC RTC"
+	depends on BD70528_WATCHDOG || (COMPILE_TEST && !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
 	  on ROHM BD70528 Power Management IC.
-- 
2.20.0

