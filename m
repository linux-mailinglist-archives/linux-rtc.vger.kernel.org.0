Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38F53DCC98
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Aug 2021 18:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhHAQJt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 12:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhHAQJs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Aug 2021 12:09:48 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB5EC06175F;
        Sun,  1 Aug 2021 09:09:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so9839637wmd.0;
        Sun, 01 Aug 2021 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/UTQa4zt36thXiOuOdpLGy6sVJQ/GEiwMyfa9IyL5Y=;
        b=OLsxF0o7gj+epV4zaUFCFkv22espHpNo4Kp9fthy9GrtF2HcYirlP1XucQnEiTMpQy
         fqXjCtrXsTQAGGrOks2ZwOM+KbzMGH+doAEDytrSDs0X6iQPtoCAUr8vsRdQdm5sE2Lc
         ioYyWgXYg5BlvHlNyiEsXpAVdRpyPN1JbwsHeCEjDft/84aSjj1dFK8Il0u0a426LmqP
         yvE75m9HRlqINcX+Hp/wcjFSGz3SDIS2ceE00+JkL/eE1d6Ced54jErQUiK1Y80cJJ/c
         2XKt1mQFSkGBcKXCqRPJqg2goXeH27rUQKjfwh4Q8zLpHwy4lIVY5+Jf4UOZm5boPHh8
         k/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/UTQa4zt36thXiOuOdpLGy6sVJQ/GEiwMyfa9IyL5Y=;
        b=CTV7wDzhcF0tbDKhsdO+pxw/k100uL4grQ0UcHqIcPZmI6tz59IOgDfAC0aw/JgZNn
         d7KFsd9kJ0YA7HWDShmx4FiF0rdHICbjEUp5LtVY5ZIBunS/Fr+wE8LAIZW1NML63mUs
         ot3Bvtn0uYXaOGCLK8SQBIpT2Z2BFRTzCCfHYgwqMp/4PjZVGcWWwwSQEMFq5ql/4a3g
         ju0tkKc/8pI30fDYHmxHJ7/aJI+zFHY4ZavklErORgu0SCitxur4gPpV19jMTcFhQ7w+
         Gpxwutn6iYsxwCAUbGjXi2onWNBxbmVgj/3g7laP3Xf/aVOUuorjc1YK0wkVpWJb6qtT
         4STw==
X-Gm-Message-State: AOAM530b/SNI/GLqsBfSUSC+c4dAjndeGnDBAa50p5dSI7WeWkgE465D
        LNyElZzkqL9MTDrznVxqXg9gMMJHFso=
X-Google-Smtp-Source: ABdhPJym/91+S5eiTdwzNhDwb/YcpbUmEaBPUhi79G14S/ksod7sHwNKC0wp5W2dMDumtFmS3XB9MQ==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr12621844wma.87.1627834178138;
        Sun, 01 Aug 2021 09:09:38 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id p4sm7979656wre.83.2021.08.01.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 09:09:37 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add RTC for MStar SoCs
Date:   Sun,  1 Aug 2021 18:09:18 +0200
Message-Id: <20210801160921.233081-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patches series adds a new driver for the RTC found in the Mstar
MSC313e SoCs and newer. It adds a basic rtc driver, the corresponding
devicetree bindings and its documentation.

The rtctest (from selftests) has been passed on this driver, with the
following output:
$ rtctest 
TAP version 13
1..7
# Starting 7 tests from 2 test cases.
#  RUN           rtc.date_read ...
# rtctest.c:47:date_read:Current RTC date/time is 01/01/1970 00:02:03.
#            OK  rtc.date_read
ok 1 rtc.date_read
#  RUN           rtc.uie_read ...
#            OK  rtc.uie_read
ok 2 rtc.uie_read
#  RUN           rtc.uie_select ...
#            OK  rtc.uie_select
ok 3 rtc.uie_select
#  RUN           rtc.alarm_alm_set ...
# rtctest.c:136:alarm_alm_set:Alarm time now set to 00:02:12.
# rtctest.c:156:alarm_alm_set:data: 1a0
#            OK  rtc.alarm_alm_set
ok 4 rtc.alarm_alm_set
#  RUN           rtc.alarm_wkalm_set ...
# rtctest.c:192:alarm_wkalm_set:Alarm time now set to 01/01/1970 00:02:15.
#            OK  rtc.alarm_wkalm_set
ok 5 rtc.alarm_wkalm_set
#  RUN           rtc.alarm_alm_set_minute ...
# rtctest.c:238:alarm_alm_set_minute:Alarm time now set to 00:03:00.
# rtctest.c:258:alarm_alm_set_minute:data: 1a0
#            OK  rtc.alarm_alm_set_minute
ok 6 [  180.545015] random: fast init done
rtc.alarm_alm_set_minute
#  RUN           rtc.alarm_wkalm_set_minute ...
# rtctest.c:294:alarm_wkalm_set_minute:Alarm time now set to 01/01/1970 00:04:00.
#            OK  rtc.alarm_wkalm_set_minute
ok 7 rtc.alarm_wkalm_set_minute
# PASSED: 7 / 7 tests passed.
# Totals: pass:7 fail:0 xfail:0 xpass:0 skip:0 error:0


Changes since v1:
- Fixed the DT bindings documentation and fixed dt_binding_check (an
  include was missing)
- Added || COMPILE_TEST to kconfig
- Removed rtc_valid_tm from msc313_rtc_read_time()
- Removed the last write of the msc313_rtc_set_time() function (not
  required) and improved comments
- Replaced the relaxed io by normal io in msc313_rtc_interrupt()
- Added checks to be sure that the alarm fired in msc313_rtc_interrupt()
- Removed msc313_rtc_remove() (replaced by devm_add_action_or_reset)
- Removed unnecessary software reset of the IP in the probe function
  (the soft reset is never executed, it is a mistake from the initial
  refactoring)
- Switched to devm_rtc_allocate_device() and devm_rtc_register_device(),
  and dropped the error message related to the rtc device allocation
- Added an RTC range by setting .range_min and .range_max
- Added the "start-year" property to the DT bindings documentation


Daniel Palmer (1):
  rtc: Add support for the MSTAR MSC313 RTC

Romain Perier (2):
  dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings
    documentation
  ARM: dts: mstar: Add rtc device node

 .../bindings/rtc/mstar,msc313-rtc.yaml        |  49 ++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |   7 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-msc313.c                      | 246 ++++++++++++++++++
 6 files changed, 314 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
 create mode 100644 drivers/rtc/rtc-msc313.c

-- 
2.30.2

