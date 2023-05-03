Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C976F538B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjECIqU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 04:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjECIqS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 04:46:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 992583C29;
        Wed,  3 May 2023 01:46:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,246,1677510000"; 
   d="scan'208";a="161494686"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 May 2023 17:46:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.153])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4D9E641C667B;
        Wed,  3 May 2023 17:46:12 +0900 (JST)
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
Subject: [PATCH RFC 0/6] Add Renesas PMIC RAA215300 and built-in RTC support
Date:   Wed,  3 May 2023 09:46:02 +0100
Message-Id: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
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

The built-in RTC is the same as ISL-1208. Enabling of the
RTC is done by the PMIC module. The RAA215300 exposes two devices via I2C,
one for the RTC IP, and one for everything else. The RTC IP has to be
enabled by the other I2C device.

Also, the polarity of the external oscillator is different between PMIC
versions. So the PMIC version is shared between the PMIC driver and the
RTC driver.

Please share your thoughts on this patch series.

[1]
https://www.renesas.com/in/en/products/power-power-management/multi-channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-memory-built-charger-and-rtc

Biju Das (6):
  dt-bindings: mfd: Add Renesas RAA215300 PMIC bindings
  mfd: Add Renesas PMIC RAA215300 driver
  dt-bindings: rtc: isl1208: Convert to json-schema
  dt-bindings: rtc: isl1208: Document built-in RTC device on PMIC
    RAA215300
  rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
  arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC

 .../bindings/mfd/renesas,raa215300.yaml       | 57 ++++++++++++
 .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 --------
 .../devicetree/bindings/rtc/isil,isl1208.yaml | 87 ++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 16 ++++
 drivers/mfd/Kconfig                           |  8 ++
 drivers/mfd/Makefile                          |  2 +
 drivers/mfd/raa215300.c                       | 91 +++++++++++++++++++
 drivers/rtc/rtc-isl1208.c                     | 50 ++++++++++
 8 files changed, 311 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
 create mode 100644 drivers/mfd/raa215300.c

-- 
2.25.1

