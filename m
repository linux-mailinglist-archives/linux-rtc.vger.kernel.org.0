Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213661F50CA
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 11:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgFJJGB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 05:06:01 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:10213 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJGA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 05:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591779959; x=1623315959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qtiUArQA4p5apTipUrkfZICOBUdYloVo/SZ9mlHt4CE=;
  b=Y6F1J1An8+MnuPpMHZhvmT1JdVyrl09Cz8qduE3vT+b+XiRvVxmeDbPf
   UTAukGSM/9YJo/BY2ZU5mA4A/WjeH4Ss6FnRECgOscViJEQz2e0GlDZOF
   RiTkGvmsqc8Gi2n4kDj6uf9m7s7Yg7M+fbzcJTumdZS5Dz7O5+vA8ZIpK
   8dPsq8zul+IwmYmEFQ44Ef28l6yBU1sUrQmFezB5W99oGRmvoE2jv2wtr
   tzW85NvnFA/V533E06vnTFKM7mw8od7171HWC04yncmzKW3S7eKx/5KxU
   /qrdnKyNqt4dBBhVy43ZMSYUeX+hGmKYyxBmkEVM2/35KMMuu7pQcbk/j
   g==;
IronPort-SDR: M4p3KWa4v3dCbOqfupbupyIlgMFVn+ggBBOGIuGBUL4gm84DSrObBOzSMfdhoI6a+u5rPBMcsM
 xG66W88fqLYD/xhoxvF7RqmDw/zuMemtZnxO7J+vqySlRTI/TZ1KuwRM8QYwwrcHsHY+3illSj
 AYELCK8PhZ5CN2ILWoTYlez7/lgWnmtsWcfIyYZ1/5XU88b1OUMGwMhiymbyFn6nkK6H57h3Rf
 AbzfBK9xSMsfYGrI3RpFzFivBTqCNEi872FDud0vctBZMZzLP/lNdvA5waJMq9EoT5AgCkyzyc
 nSs=
X-IronPort-AV: E=Sophos;i="5.73,495,1583218800"; 
   d="scan'208";a="82953284"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2020 02:05:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 10 Jun 2020 02:05:57 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Wed, 10 Jun 2020 02:05:53 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <ludovic.desroches@microchip.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 3/3] ARM: dts: sam9x60: add rtt
Date:   Wed, 10 Jun 2020 12:05:36 +0300
Message-ID: <1591779936-18577-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
References: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add RTT. Allong with it enable GBPR as it is requested by RTT.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 9 +++++++++
 arch/arm/boot/dts/sam9x60.dtsi       | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index b484745bf2d4..39d946e0a47c 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -309,6 +309,10 @@
 	};
 };
 
+&gpbr {
+	status = "okay";
+};
+
 &i2s {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2s_default>;
@@ -613,6 +617,11 @@
 	};
 };
 
+&rtt {
+	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
+	status = "okay";
+};
+
 &shutdown_controller {
 	atmel,shdwc-debouncer = <976>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index 6763423d64b8..d10843da4a85 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -661,6 +661,13 @@
 				status = "disabled";
 			};
 
+			rtt: rtt@fffffe20 {
+				compatible = "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt";
+				reg = <0xfffffe20 0x20>;
+				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&clk32k 0>;
+			};
+
 			pit: timer@fffffe40 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe40 0x10>;
-- 
2.7.4

