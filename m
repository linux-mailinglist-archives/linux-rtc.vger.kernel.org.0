Return-Path: <linux-rtc+bounces-1973-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B71976C0D
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4820C1F286BB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5141BCA0F;
	Thu, 12 Sep 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="VXuxiNxK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA41B375F
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151188; cv=none; b=WqWcwlyrmUzY1TnPAo2VUQW+dhNxq17oiXNLdYE/o5OhzyI73scb6NQGRqqySooyMgs9zASz4DS+K0p3jH/zMOy99K9do5d2rLW1JTqdulrVD3GKxMsarFT+kVf8bk55NkpGT5flvwSuD0Ce4PfAJBo38C8ieySFgCpLY8OKz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151188; c=relaxed/simple;
	bh=LfrAnhXADC0062RNdKl8qS+6gyErYopT8jQyNclhwEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMe6CA1u4YIxvQnTa+uesN/qIxrmB611zqAVBuzQLpt3BVS19XhY+sUQmajcqeuV4HQ/2eEYNmnjdKVADCMJ0d2+UO8kIPm+4vlcgyQbiyhT0kc3tAx2hpx/E8sPdkHt/U8CY/GwTReA94vCErdYbv2KtDa5TA0iHw6iiBHPa+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=VXuxiNxK; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id okdZs5o561zuHokmAspDpd; Thu, 12 Sep 2024 14:26:26 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id okm7sMIrZr1Juokm8sQdKw; Thu, 12 Sep 2024 14:26:25 +0000
X-Authority-Analysis: v=2.4 cv=VPjbncPX c=1 sm=1 tr=0 ts=66e2fa11
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=xgDJ2ItN4DbTUy_rRyQA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I88Cfjzdme7FAFSLbyWAXyA3YYoq4ffeVCbtr93i2EM=; b=VXuxiNxKt02vunwxmfAhkXP9Jm
	agl8tnz26KJljeLKVS853x04eJHd8Hq28xkOpTFyIeB5asg3ZYBJjA102VAmj9Q+It7BwnnHMJiqK
	pcSX1WsyFE8ab4QSqRKQG93HIzDApEheoeKXP/x/yqSGz3Png5zKldN+AXrzL+yky1N26IQSRKWjX
	ty3DdCt8Q47d+EqjLATvpIXLfzhVmWFyROGJPlnskTn5h/o+3fpH++QSumnNdA+HY4mOwsECc0wvw
	GKZfcBzn8Zma/VicTq2ljaYwpIYlLssDkYKGdniF174UygRVf07fKyVva4lLGiTu1PhWdvEf3J82T
	we6D31Uw==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sokm5-003n4z-14;
	Thu, 12 Sep 2024 19:56:21 +0530
From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject: [PATCH v3 6/6] ARM: dts: rockchip: Add Relfor Saib board
Date: Thu, 12 Sep 2024 19:54:51 +0530
Message-Id: <20240912142451.2952633-7-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912142451.2952633-1-karthikeyan@linumiz.com>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1sokm5-003n4z-14
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 66
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOsmsAnW8FzrLTkLvDbgJr0Fl15VHG1FSRC5kc+rpRsxSiGI7rZMANvUb96YrVwbusI6NdUQZnzMD7ipA7glWhxVFM91qwv1fp29ar0W4KmjCeM9uvRT
 2yQseJ3b+qjufchWQmem3VrNmYs86LD/kMoSs6E8it/HBdfSGNKKal2e0K9vBlPC2gHjZp8gcsXjrrcKdM+Yuw5XmrDxtmDYtrw=

Saib is an consumer electronics board from Relfor labs
Features:
    - Rockchip RV1109
    - 1GB DDR4
    - 4GB eMMC
    - Realtek RTL8821CS Wi-Fi/BT
    - IR transmitter/receiver
    - RV3028 RTC
    - Switch
    - User leds

Add support for it.

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v3:
    - sort nodes in aplhabetical order
    
    v2:
    - Drop status=okay in new nodes

 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 .../boot/dts/rockchip/rv1109-relfor-saib.dts  | 422 ++++++++++++++++++
 2 files changed, 423 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index ab4cd9aab722..716f5540e438 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
+	rv1109-relfor-saib.dtb \
 	rv1109-sonoff-ihost.dtb \
 	rv1126-edgeble-neu2-io.dtb \
 	rv1126-sonoff-ihost.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
new file mode 100644
index 000000000000..a63356ade3b7
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Relfor Labs Pvt. Ltd.
+ */
+
+
+/dts-v1/;
+#include "rv1109.dtsi"
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Rockchip RV1109 Relfor Saib Board";
+	compatible = "relfor,saib", "rockchip,rv1109";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button {
+			gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_DATA>;
+			label = "GPIO User Switch";
+			linux,input-type = <1>;
+		};
+	};
+
+	ir_receiver: ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio3  RK_PB4 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_rx>;
+	};
+
+	ir_transmitter: ir-transmitter {
+		compatible = "pwm-ir-tx";
+		pwms = <&pwm11 0 10000000 1>;
+	};
+
+	led-controller {
+		compatible = "pwm-leds-multicolor";
+
+		multi-led {
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			max-brightness = <65535>;
+
+			led-0 {
+				active-low;
+				color = <LED_COLOR_ID_BLUE>;
+				pwms = <&pwm9 0 50000 0>;
+			};
+
+			led-1 {
+				active-low;
+				color = <LED_COLOR_ID_GREEN>;
+				pwms = <&pwm6 0 50000 0>;
+			};
+
+			led-2 {
+				active-low;
+				color = <LED_COLOR_ID_RED>;
+				pwms = <&pwm10 0 50000 0>;
+			};
+		};
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-0 {
+			pwms = <&pwm2 0 50000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "none";
+		};
+
+		led-1 {
+			pwms = <&pwm8 0 50000 0>;
+			max-brightness = <0>;
+			linux,default-trigger = "none";
+		};
+
+		led-2 {
+			pwms = <&pwm5 0 50000 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "none";
+		};
+	};
+
+	sdio_pwrseq: pwrseq-sdio {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc0>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		reset-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_LOW>;
+	};
+
+	thermal_sensor1: thermal-sensor1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&saradc 1>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <(-40000) 826
+					     85000 609>;
+	};
+
+	thermal_sensor2: thermal-sensor2 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&saradc 2>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <(-40000) 826
+					     85000 609>;
+	};
+
+	vcc_0v8: vcc-0v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_0v8";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		startup-delay-us = <150>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v2_ddr: vcc-1v2-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v2_ddr";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		startup-delay-us = <75000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		startup-delay-us = <51000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc1v8_ir: vcc1v8-ir {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8_ir";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_2v5_ddr: vcc-2v5-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v5_ddr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
+	vcc3v3_sys: vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		startup-delay-us = <75000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_arm: vdd-arm {
+		compatible = "pwm-regulator";
+		pwms = <&pwm0 0 5000 1>;
+		regulator-name = "vdd_arm";
+		regulator-min-microvolt = <720000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-settling-time-up-us = <18000>;
+		regulator-always-on;
+		regulator-boot-on;
+		pwm-supply = <&vcc3v3_sys>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_npu_vepu: vdd-npu-vepu {
+		compatible = "pwm-regulator";
+		pwms = <&pwm1 0 5000 1>;
+		regulator-name = "vdd_npu_vepu";
+		regulator-min-microvolt = <650000>;
+		regulator-max-microvolt = <950000>;
+		regulator-settling-time-up-us = <18000>;
+		regulator-always-on;
+		regulator-boot-on;
+		pwm-supply = <&vcc3v3_sys>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&emmc {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&emmc_bus8 &emmc_cmd &emmc_clk>;
+	pinctrl-names = "default";
+	rockchip,default-sample-phase = <90>;
+	vmmc-supply = <&vcc3v3_sys>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc0: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+		#clock-cells = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&rtc_int>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2s0 {
+	/delete-property/ pinctrl-0;
+	rockchip,trcm-sync-rx-only;
+	pinctrl-0 =  <&i2s0m0_sclk_rx>,
+		     <&i2s0m0_lrck_rx>,
+		     <&i2s0m0_sdi0>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth-pins {
+		bt_reset: bt-reset {
+			rockchip,pins =
+			<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		bt_wake_dev: bt-wake-dev {
+			rockchip,pins =
+			<1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		bt_wake_host: bt-wake-host {
+			rockchip,pins =
+			<1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	buttons {
+		switch: switch {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	ir {
+		ir_rx: ir-rx {
+			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pwm {
+		pwm0m0_pins_pull_up: pwm0m0-pins-pull-up {
+			rockchip,pins =
+			/* pwm0_pin_m0 */
+			<0 RK_PB6 3 &pcfg_pull_up>;
+		};
+		pwm1m0_pins_pull_up: pwm1m0-pins-pull-up {
+			rockchip,pins =
+			/* pwm1_pin_m0 */
+			<0 RK_PB7 3 &pcfg_pull_up>;
+		};
+	};
+
+	rtc {
+		rtc_int: rtc-int {
+			rockchip,pins = <2 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio0-supply = <&vcc3v3_sys>;
+	pmuio1-supply = <&vcc3v3_sys>;
+	vccio4-supply = <&vcc3v3_sys>;
+	vccio5-supply = <&vcc3v3_sys>;
+	vccio6-supply = <&vcc3v3_sys>;
+	vccio7-supply = <&vcc3v3_sys>;
+	status = "okay";
+};
+
+&pwm0 {
+	/delete-property/ pinctrl-0;
+	pinctrl-0 = <&pwm0m0_pins_pull_up>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm1 {
+	/delete-property/ pinctrl-0;
+	pinctrl-0 = <&pwm1m0_pins_pull_up>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	/delete-property/ pinctrl-0;
+	pinctrl-0 = <&pwm2m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm5 {
+	pinctrl-0 = <&pwm5m0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm6 {
+	pinctrl-0 = <&pwm6m0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm8 {
+	pinctrl-0 = <&pwm8m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm9 {
+	pinctrl-0 = <&pwm9m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm10 {
+	pinctrl-0 = <&pwm10m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm11 {
+	/delete-property/ pinctrl-0;
+	pinctrl-0 = <&pwm11m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	max-frequency = <100000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sys>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_xfer &uart0_ctsn &uart0_rtsn>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		device-wake-gpios = <&gpio1 RK_PC5 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&bt_reset>, <&bt_wake_dev>, <&bt_wake_host>;
+		pinctrl-names = "default";
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m1_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.39.2


