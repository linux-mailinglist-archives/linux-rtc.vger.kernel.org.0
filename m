Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D2D1A4872
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgDJQ1r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:47 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:32844 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDJQ1r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536067; x=1618072067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=js0FbCmxEhjJKEduX+K6uBUvUMXaYmimYj7qA6nb3f8=;
  b=VBY6t6bWebIuYzkb36RpDqayJeLixAiuKqWekHnQtjVC1pT8BtexbnQq
   kIoCtKI9xI82L6J2haAaH+UVyfBOR/ysXI3Le2WgJP+2fydy0wUkW5a4Z
   RGQKsEjvjgyQUWHOP3ycTsdJe0kzaqfwHP497UFz8z5wAIaqG7c8WwzZt
   1m83hyFqbHmDQfargXz9lv+9ZQMohjfVenVRk+BsMCdoIY7Qwri6Qim4/
   46L+5pw7QOeigRtEuFugk7X/9kPPOhkKz9Q39Tspnjy/S6sIqnGxjlgAl
   Jysj1ZY+uokAFMzSyuNaVJKrikQCP4U3Lx1YCgnFUQEUMCtxTDBBwu7kq
   w==;
IronPort-SDR: sVe3P91x0uf4YCbN8jYnZ34Zv2l0xLcA0W9UcwgbqYBPyJUEw3w51NmDWz/gP1MkjQKzq5o75L
 ZpCo+ifBM9mD7TsSIc11+x+prct/yUbBxuAMkL7rk5gzVlca5U/P3R54mZd3Tz5/E4IEnyVQ7M
 baW85UdaHo5JrevESOMwfaMiWFMNdHHMUY+TZmVm/3L/FrovjmBzqDThMmU9zXrDJymtTe3ryn
 x2XRyP4MQz9+xcZ9/+B7zrUGKM4abSHcx2kJNLT3bVOJa7vAsI0O/+6hDiljOdun6tJKDGbmwC
 M5g=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="71870960"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:46 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:37 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Date:   Fri, 10 Apr 2020 19:26:58 +0300
Message-ID: <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add RTT.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 5 +++++
 arch/arm/boot/dts/sam9x60.dtsi       | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index ab3d2d9a420a..4020e79a958e 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -617,6 +617,11 @@
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
index 326b39328b58..e1d8e3a4cb0b 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -661,6 +661,13 @@
 				status = "disabled";
 			};
 
+			rtt: rtt@fffffe20 {
+				compatible = "microchip,sam9x60-rtt";
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

