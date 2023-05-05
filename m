Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C566F8788
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 19:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjEERZk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 13:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjEERZj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 13:25:39 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8582415EE8;
        Fri,  5 May 2023 10:25:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,252,1677510000"; 
   d="scan'208";a="161757907"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 May 2023 02:25:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 20D0C4072B3D;
        Sat,  6 May 2023 02:25:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 0/5] Add Renesas PMIC RAA215300 and built-in RTC support
Date:   Fri,  5 May 2023 18:25:25 +0100
Message-Id: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch series aims to add support for Renesas PMIC RAA215300 and
built-in RTC found on this PMIC device.

The details of PMIC can be found here[1].

The built-in RTC is same as ISL-1208. Enabling of the
RTC is done by the PMIC module. Also the external osciallator bit is
inverted on PMIC version 0x12 and later. The PMIC version is shared
between PMIC driver and RTC driver.

RAA215300PMIC driver has MFD cell entry for RTC platform driver and it
instantiates the RTC platform driver. RTC platform creates rtc device by
using i2c_new_ancillary_device() and register the rtc device by
calling the helper function provided by rtc-isl2108 driver.

[1]
https://www.renesas.com/in/en/products/power-power-management/multi-channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-memory-built-charger-and-rtc

[2]
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230505091720.115675-1-biju.das.jz@bp.renesas.com/

RFC->v2:
 * Dropped the cross-links from bindings and used a single compatible
   with separate i2c addresses for pmic main and rtc device.
 * Dropped patch#4 and split patch#3 from this series and send as
   separate patch to ML [2].
 * Added RTC platform driver and mfd cell entry to the PMIC driver.RTC
   platform driver creates rtc device by using i2c_new_ancillary_device()
   and register the rtc device by calling the helper function provided
   by rtc-isl2108 driver.
 * Updated reg property in bindings.
 * Added optional reg-names, interrupts and renesas,rtc-enabled
   properties.
 * Fixed the node name in the binding example
 * Dropped the cross link property renesas,raa215300-rtc.
 * Updated the binding example
 * Dropped MODULE_SOFTDEP from the driver as it is added in RTC platform
   driver.
 * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
 * Updated the comment polarity->bit for External Oscillator.
 * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
   added the helper function isl1208_probe_helper() to share the code.
 * Updated pmic device node on the SoM dtsi based on the bindings.

Logs:
[   15.055110] dummy 3-006f: registered as rtc0
[   15.189869] dummy 3-006f: setting system clock to 2023-04-27T19:32:41 UTC (1682623961)

root@smarc-rzg2l:~# hwclock -r
2023-04-27 19:43:09.802884+00:00
root@smarc-rzg2l:~# hwclock -r
2023-04-27 19:43:10.996184+00:00
root@smarc-rzg2l:~#

Biju Das (5):
  dt-bindings: mfd: Add Renesas RAA215300 PMIC bindings
  mfd: Add Renesas PMIC RAA215300 driver
  rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
  mfd: Add Renesas PMIC RAA215300 RTC driver
  arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC

 .../bindings/mfd/renesas,raa215300.yaml       |  68 +++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  10 ++
 drivers/mfd/Kconfig                           |  14 +++
 drivers/mfd/Makefile                          |   3 +
 drivers/mfd/raa215300-rtc.c                   |  52 +++++++++
 drivers/mfd/raa215300.c                       | 106 ++++++++++++++++++
 drivers/rtc/rtc-isl1208.c                     |  61 ++++++++--
 include/linux/rtc/isl1208.h                   |   9 ++
 8 files changed, 312 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
 create mode 100644 drivers/mfd/raa215300-rtc.c
 create mode 100644 drivers/mfd/raa215300.c
 create mode 100644 include/linux/rtc/isl1208.h

-- 
2.25.1

