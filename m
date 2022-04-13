Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B823A4FF143
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbiDMIEa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbiDMIE2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:28 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BC8205F8;
        Wed, 13 Apr 2022 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836927; x=1681372927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WqzRPC7S8FgWbVe1N2Ss8o565KjZHWpG+6XZV54ABig=;
  b=Y1Y1Ac0mGeO25t7HxPmMx2FoskjBtKv23Sm+E3XJt9zaFSxSPNYPjz7Y
   DmJgPgDWeYVU7tTzRMJpJwgOHY43msPhXV0rnyTwl/LRIc/UAotV1Juws
   iCWZZYfAswRRRUFbuQueviUpwi4XniAqcDmHud4ZKkcFMjYkTjw+mewWV
   YINpDRUsBCrPp/YEBq93Z2UUyAIazMda4a5EHJ0akeQ0b0S7Pwo1q+LzH
   AIRS6ZWEIfDofTCK5UcvNZtPYQK+mkti2wyc4/Noy51/2qCS35taDDvGL
   RzNt0Wi/Rs/+Yl5jM8e5f7NAEdATiHeHOm6Wy7AVo1wdtxTO9NeW8yFND
   w==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="92231056"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:02:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:02:03 -0700
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
Subject: [PATCH v3 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
Date:   Wed, 13 Apr 2022 08:58:30 +0100
Message-ID: <20220413075835.3354193-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
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

The fic clocks passed to the pcie controller and other peripherals in
the device tree are not the clocks they actually run on. The fics are
actually clock domain crossers & the clock config blocks output is the
mss/cpu side input to the interconnect. The peripherals are actually
clocked by fixed frequency clocks embedded in the fpga fabric.

Fix the device tree so that these peripherals use the correct clocks.
The fabric side FIC0 & FIC1 inputs both use the same 125 MHz, so only
one clock is created for them.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/microchip-mpfs-fabric.dtsi     | 16 ++++++++++++++--
 .../riscv/boot/dts/microchip/microchip-mpfs.dtsi |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
index 854320e17b28..ccaac3371cf9 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -7,7 +7,7 @@ core_pwm0: pwm@41000000 {
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
 		#pwm-cells = <2>;
-		clocks = <&clkcfg CLK_FIC3>;
+		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
 
@@ -16,10 +16,22 @@ i2c2: i2c@44000000 {
 		reg = <0x0 0x44000000 0x0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&clkcfg CLK_FIC3>;
+		clocks = <&fabric_clk3>;
 		interrupt-parent = <&plic>;
 		interrupts = <122>;
 		clock-frequency = <100000>;
 		status = "disabled";
 	};
+
+	fabric_clk3: fabric-clk3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <62500000>;
+	};
+
+	fabric_clk1: fabric-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c5c9d1360de0..3b48b7f35410 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -424,7 +424,7 @@ pcie: pcie@2000000000 {
 					<0 0 0 3 &pcie_intc 2>,
 					<0 0 0 4 &pcie_intc 3>;
 			interrupt-map-mask = <0 0 0 7>;
-			clocks = <&clkcfg CLK_FIC0>, <&clkcfg CLK_FIC1>, <&clkcfg CLK_FIC3>;
+			clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
 			clock-names = "fic0", "fic1", "fic3";
 			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 			msi-parent = <&pcie>;
-- 
2.35.1

