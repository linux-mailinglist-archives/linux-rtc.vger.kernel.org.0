Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F3D4F982E
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Apr 2022 16:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiDHOjs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Apr 2022 10:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbiDHOjr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Apr 2022 10:39:47 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683BE6FF54;
        Fri,  8 Apr 2022 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649428663; x=1680964663;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jo7U3pyaqboWoRpS9duDleK5OsBJt/5r/x0gKendpq0=;
  b=2f1nuhp/yyI5irSO2U3VRf/VD5Hq8UMSt0x7X+oI5TaQ57F+9HcAeZbx
   mXZ/G34WetRQ/ytIrdbLJdJiop56OdIOrKR/nILYGHD46q8DIiZo+jpRf
   6hvQRqBELxnbL73SxoWYHOXW0gn/4Q/PNSdAQ3h8DZ5cJGfZ8Em6+v26e
   ztTjfgNw970DwDXiIw+NgqZY2Nt2Omb28W82MTsTNo6fWSGCHClQut2Kq
   zigrpnNyXtd3PeSXKbPR+4sq+TJ63Hfa/VM5WpHOQVsLrLtCWYWU99R7B
   JIgGyGpIrbLhRIec71nTGvjcQ/hNcXriiTFaGwIdTKdUeAZfYisB9XKWZ
   g==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="152027955"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 07:37:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 07:37:38 -0700
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
Subject: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Date:   Fri, 8 Apr 2022 14:36:40 +0000
Message-ID: <20220408143646.3693104-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hey,
As I mentioned in my fixes for 5.18 [0], found out that the reference
clock for the rtc is actually missing from the clock driver (and the
dt binding). 

Currently the mpfs clock driver uses a reference clock called the
"msspll", set in the device tree, as the parent for the cpu/axi/ahb
(config) clocks. The frequency of the msspll is determined by the FPGA
bitstream & the bootloader configures the clock to match the bitstream.
The real reference is provided by a 100 or 125 MHz off chip oscillator.

However, the msspll clock is not actually the parent of all clocks on
the system - the reference clock for the rtc/mtimer actually has the
off chip oscillator as its parent.

This series enables reading the rate of the msspll clock, converts
the refclock in the device tree to the external reference & adds
the missing rtc reference clock.

I assume it is okay not to add fixes tags for the rtc dt binding?
Since the clock was previously missing, the binding is wrong, but
idk if that qualifies as a fix?

Clock driver changes depend on the fixes I sent in [0].
Please lmk if you want me to respin into a single series w/ the fixes.
Thanks,
Conor.

[0]: https://lore.kernel.org/linux-riscv/20220408133543.3537118-1-conor.dooley@microchip.com/

Conor Dooley (7):
  dt-bindings: clk: mpfs document msspll dri registers
  dt-bindings: clk: mpfs: add defines for two new clocks
  dt-bindings: rtc: add refclk to mpfs-rtc
  clk: microchip: mpfs: re-parent the configurable clocks
  clk: microchip: mpfs: rename sys_base to base
  clk: microchip: mpfs: add RTCREF clock control
  riscv: dts: microchip: reparent mpfs clocks

 .../bindings/clock/microchip,mpfs.yaml        |  11 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  14 +-
 .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    |   8 +-
 drivers/clk/microchip/clk-mpfs.c              | 205 +++++++++++++++---
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
 6 files changed, 199 insertions(+), 46 deletions(-)

-- 
2.35.1

