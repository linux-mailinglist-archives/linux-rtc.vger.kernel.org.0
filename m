Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1975C3F1E9F
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 19:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhHSRDs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 13:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhHSRDm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 13:03:42 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47869C061575;
        Thu, 19 Aug 2021 10:03:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id l11so10140261wrx.4;
        Thu, 19 Aug 2021 10:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltKmt/JpYcjujKMY1NbAqfQilXNFyNfsoBSQ5TkpJDY=;
        b=P/amnaNkLUwyC3pXp6j8AczBcIkshq69TsmZAvgQVh39ai4JHtuIaDYwunXdcuw0f+
         awk/1w24g9im7d1O8pJwcHIXIj7Up9fTES1/F/Sgrd21GXGFBUrCLT94KpGglsmy7e/N
         cYxmomHIDpYdXYlo+MMexD+fqmi2RYfx6Hm2Gx8o0hfncJRSt9DM/o95vt6FFsEuyma0
         l5Q+TcIdeF6N4s5e+tXbdGESVX5kBgNR6s03/A5E8yN3NW8F1hw29jTb+PUc5lm9seZ2
         0uDr/JGKv7JD+nnMf8V5PByO1xexZJnFJxS/b4OQCMjhddcf79Gg+3uI+KwXysZbFVVm
         fCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltKmt/JpYcjujKMY1NbAqfQilXNFyNfsoBSQ5TkpJDY=;
        b=nVRvHB3k+NAScijPJixTC/fcLc2T2nCPSDE9KkgA9WK9/kj5aeFw6u3bshwRUG5sHX
         2aAkv4650J+FSXytBBHJGJoA+FOWqxZ8ZzA77cJUPWaZOuTS1PEUFxAZqGhFhkv6RaGY
         2e1ELlt16Q1kANypg9Te3yg+xh+Y0MutTcCG5ZwfOKf+IeS3kG2pZXksNdXXysiJEY2+
         VosEx68eH1XIc5vjl2s4nvbsxvU1o5jNSxFggeiWUS5nQ+QDT+x/Lb+KJOlmAowVMHy9
         o1hRlDBhcBJfBasL1XejpDz+FCE/fQCv5Fi48pACp4jKI10CABEUwpD2SslOfehjFIUV
         5bSQ==
X-Gm-Message-State: AOAM531TE/XJCmPVPGc+HeT7IfM/E+OFvP4Ch7ZgY8idabE0EWgbn60R
        cOTyaQWVMelmIUirrPJ2Zb8=
X-Google-Smtp-Source: ABdhPJzIonaES95dPAUO8NRmFzFwzslz1hsk3C/gdCiqnZSpexWCVpesVZ19wiKL4rild/3rWNDr9Q==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr5308542wrr.28.1629392584874;
        Thu, 19 Aug 2021 10:03:04 -0700 (PDT)
Received: from debby ([2a01:cb19:13:7900:ae2b:c45b:3c7c:7e51])
        by smtp.gmail.com with ESMTPSA id w14sm3340773wrt.23.2021.08.19.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:03:04 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add RTC for MStar SoCs
Date:   Thu, 19 Aug 2021 19:02:58 +0200
Message-Id: <20210819170301.10520-1-romain.perier@gmail.com>
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

Changes since v2:
- Added dual-license header to the dt-bindings documentation
- Reordered dts entries, so the rtc device_node is before the watchdog
  device_node (because it has a lower address)
- Updated rtc range_max to U32_MAX
- Leave range_min to 0 (default value when it is not set at all)
- Fixed the CNT_EN_BIT logic, so .read_time will only read the time when
  the RTC has been previously set and has a valid state (which is not
  the case after a POR).

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
 arch/arm/boot/dts/mstar-v7.dtsi               |   8 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-msc313.c                      | 258 ++++++++++++++++++
 6 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
 create mode 100644 drivers/rtc/rtc-msc313.c

-- 
2.30.2

