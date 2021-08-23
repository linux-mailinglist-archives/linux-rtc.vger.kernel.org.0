Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697953F4F46
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Aug 2021 19:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhHWRRF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Aug 2021 13:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhHWRRF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Aug 2021 13:17:05 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC08C061757;
        Mon, 23 Aug 2021 10:16:21 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso482758wmi.5;
        Mon, 23 Aug 2021 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5frDiRTsJrV766/ONrUvn6vJsIh8+sTTXit1HYJcI0c=;
        b=Poq2RSV0QqSo3VxKAvWAFtGGgT4qwaUCWKLcMPfnSk80bWz4jI+Z/lONu2X7P50hGp
         nRdvxgpVbyaVqs6eECLZhRjIsmCoHczCUt16CZeHRiHNsTRa/8EkCk9htdvlFfPGnpyu
         7lkUvNNqc1C8/71iWnWSPN/0P8zE4kDwO/cRINWnL3E9JTniVdsftPYzDOpdJZ7Z70wi
         /8yfrJFRUIBW1T8AP2a3xJYmcVi6tfax4IG860+CZx2WhjfZJvA0B3MS7Ppedt6GejCZ
         hp6yQcatiEXA8RRYN/SUsilv0ZqLGbSSRn3VcRzGpbMCmC+YiKEbxFRx7F3WpsbFvNgX
         p8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5frDiRTsJrV766/ONrUvn6vJsIh8+sTTXit1HYJcI0c=;
        b=fJepkRBp8XCaRjZyAQ31R6voWqgH1N0hniJyPbc916PgyXafVnxBeqK/y+isrI+ixo
         rTBkKb5AUIODbn5oj5/BpNEDKZr/M1t8n5ZF1XU/eHPcrsBsyY3QnSaiKgiaSptcK1JX
         TT36F02RqjQhCji5aCF2XGF2rKfKIdVHgDDAHGBiyDb/8R++21IX9fpi7WaQf5ypZ/E4
         gs0DWlyod4f55sdPc3IxzRpzI//rfMEsze8GycBCu7OsdujWnxdKPqDFLdubNX2+RzdN
         dArZEebxjC1Vo288+Fq7ZRspXDTNwZeL4eX5AxBzVyEm06RB0llL9RcGzKfMOxX4YWmd
         aapQ==
X-Gm-Message-State: AOAM531syLPfdPXn689Pa0Yqq3UnOWE9LrHPBjbN+Q30nnrW9bTtFYJz
        oG7iqjGH1BW+jrr7cTm5op0=
X-Google-Smtp-Source: ABdhPJx2OZaPIIu7DU5azwW/rCUXxC0gf7IWwdOF2iLGYO7Sc2ZCe8cxkIwuhh3PVu0m+4X25MXUMQ==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr8961644wme.16.1629738980218;
        Mon, 23 Aug 2021 10:16:20 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id z5sm19077020wmp.26.2021.08.23.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:16:19 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add RTC for MStar SoCs
Date:   Mon, 23 Aug 2021 19:16:10 +0200
Message-Id: <20210823171613.18941-1-romain.perier@gmail.com>
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

Changes since v3:
- Fixed bad device table in MODULE_DEVICE_TABLE()
- Use reverse christmas tree ordering for local variables in the probe()
  function
- Removed the "clk" field from the msc313_rtc data structure (not
  required, only used in the probe function)

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

