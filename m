Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942804FF13E
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiDMIE0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbiDMIET (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:19 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66D44E391;
        Wed, 13 Apr 2022 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836918; x=1681372918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9mN7tnwERo/cEVPyPzj2pzfxIMFtqlOYcaSwSE8vo64=;
  b=vE7RqAN1/FmxXimEJYxAESxN5ACHjvVDHJqtd8it1/6+Gm28q0K6sSZj
   tKssCFy1eMggkJACEkmmN0bL/XPfYbK8RiB5MFw8Ta8jb9wahXeF2kfO5
   0jjHCEP7LNWDLWsaJatHumwILxNGioaq/FRqnDTZpgmOR1L4e5qRN5zKw
   3/QTDNrqcI+hu43UxR21HbYYn23Y9y+9sKHSOUH2CU83RDxUm+zE6KxvZ
   oljLRpVH0G8qXKXc+0SwQ1hgbsQ7j6MzXYoee0OYkyfR3DhI1x16U9oTi
   gppslE0ugAFd9SBQrj/A1KWv7D13IwXmTqghUtaThU2RaoEHVgn+D0OdQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="152488361"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:01:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:01:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:01:53 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
Date:   Wed, 13 Apr 2022 08:58:27 +0100
Message-ID: <20220413075835.3354193-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hey all,
After the clock driver for the PolarFire SoC was accepted I started work
on the onboard RTC & found out that the reference clock for the rtc was
actually missing from the clock driver.

While restructuring the clock driver to add support for the rtc
reference, I also noticed that there were some problems with how the FIC
clocks were being used. The FIC clocks are the cpu side inputs to the
AXI fabric interconnections & are not the clocks for any peripherals.

This first three patches in this series fixes the problems with the FICs:
- the fic clocks incorrectly had the AHB clock as their parents
- the last fic, named differently to the others, had not been set as
  a critical clock
- some peripherals on the fabric side were incorrectly using the cpu
  side fic clocks, resulting in incorrect rates.

The second part of the series fixes the missing rtc reference clock.
There are three main changes:
- Changing the reference clock in the dt to the external 125 MHz
  oscillator rather than using the output of an internal pll. This has
  the added benefit of not requiring changes to the device tree if this
  part of the bitstream changes.
- Adding a new clock into the driver that sits above the existing
  configurable clocks & has the external reference as a parent. The new
  clock provides the parent for the AHB/AXI clocks which formerly came
  from the device tree.
- Adding the rtc reference clock to the dt bindings, device tree and
  clock driver at the configurable clock level, alongside AXI and AHB.

I kept series separate from [0] since that's tied to the CONFIG_PM stuff
& fixes a specific problem.

Changes since v1:
After speaking with Krzysztof, I have merged the rtc reference changes
[1] with these fixes for 5.18. This was done since the relevant drivers
and bindings only arrived in v5.18 & there'll now be no issue with
breaking the ABI.
Backwards compatiblity with the device tree from before 5.18 will be
broken by these changes, but the board did not boot then anyway... If
that is not okay, please lmk.

The patch renaming sys_base was dropped since that's not a fix.

Version 1 would not apply without [0] & that should be fixed too.

Thanks,
Conor.

Changes since v2:
- Wrapped text in dt-binding changes at 80 cols
- Ordered the clock defines numerically in the binding header
- Fixed the Fixes tag on the last patch and added the second tag

[0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
[1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com

Conor Dooley (9):
  clk: microchip: mpfs: fix parents for FIC clocks
  clk: microchip: mpfs: mark CLK_ATHENA as critical
  riscv: dts: microchip: fix usage of fic clocks on mpfs
  dt-bindings: clk: mpfs document msspll dri registers
  dt-bindings: clk: mpfs: add defines for two new clocks
  dt-bindings: rtc: add refclk to mpfs-rtc
  clk: microchip: mpfs: re-parent the configurable clocks
  clk: microchip: mpfs: add RTCREF clock control
  riscv: dts: microchip: reparent mpfs clocks

 .../bindings/clock/microchip,mpfs.yaml        |  13 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
 .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
 drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
 7 files changed, 211 insertions(+), 41 deletions(-)

-- 
2.35.1

