Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9894FB6CD
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 11:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344093AbiDKJDV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 05:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344111AbiDKJDD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 05:03:03 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DC53ED2F;
        Mon, 11 Apr 2022 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649667649; x=1681203649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dPt81KGByL2JT3h91dRTMfPIeeyxRYvMJGbksSYGCkQ=;
  b=lwG3my8wtILXVpW3tuPue1yGyrx8cjcs72RR8pcXvHvVtsfY5VbZWzyY
   C2zFiJlXmLEQm6QgFXghREVuyKtqmZPjrd2JylXT7YLjPCPAZEa6bume6
   EVs4exKcMQHoUofqVzJIRHQClCj8GXe9JEd91B3uNLUf7Ec+CfSqorOYX
   LjSeml1leEZOMzICocrLRg0xP7wfE2DHt0Oxq7eqffk+/4kVFe6WqN36B
   hGsddOAwefXTE8d7dwMn1CXV4MmK+W6bM/2YiWrmj8C+X3+W3bLhz3+Ap
   bBFlpqlSYp8D+L6bAvqrBVAtDrIx9ReoOKC+h5qojePR2qTF+XChhB/RS
   w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="155113068"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 02:00:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 02:00:44 -0700
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
Subject: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Date:   Mon, 11 Apr 2022 09:59:17 +0100
Message-ID: <20220411085916.941433-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
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

The 600M clock in the fabric is not the real reference, replace it with
a 125M clock which is the correct value for the icicle kit. Rename the
msspllclk node to mssrefclk since this is now the input to, not the
output of, the msspll clock. Control of the msspll clock has been moved
into the clock configurator, so add the register range for it to the clk
configurator. Finally, add a new output of the clock config block which
will provide the 1M reference clock for the MTIMER and the rtc.

Fixes: feeb38685523 ("Update the Icicle Kit device tree")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts      | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index cd2fe80fa81a..3392153dd0f1 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -45,7 +45,7 @@ ddrc_cache_hi: memory@1000000000 {
 };
 
 &refclk {
-	clock-frequency = <600000000>;
+	clock-frequency = <125000000>;
 };
 
 &mmuart1 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 3b48b7f35410..746c4d4e7686 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -141,7 +141,7 @@ cpu4_intc: interrupt-controller {
 		};
 	};
 
-	refclk: msspllclk {
+	refclk: mssrefclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 	};
@@ -190,7 +190,7 @@ plic: interrupt-controller@c000000 {
 
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
-			reg = <0x0 0x20002000 0x0 0x1000>;
+			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
 		};
@@ -393,8 +393,8 @@ rtc: rtc@20124000 {
 			reg = <0x0 0x20124000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <80>, <81>;
-			clocks = <&clkcfg CLK_RTC>;
-			clock-names = "rtc";
+			clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
+			clock-names = "rtc", "rtcref";
 			status = "disabled";
 		};
 
-- 
2.35.1

