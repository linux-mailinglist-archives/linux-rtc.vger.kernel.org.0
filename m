Return-Path: <linux-rtc+bounces-1717-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CA95D1A0
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E519B2765C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BA718BBAA;
	Fri, 23 Aug 2024 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="FuC34qvY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFA189BB7
	for <linux-rtc@vger.kernel.org>; Fri, 23 Aug 2024 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427364; cv=none; b=JA9nbY8FkBHcjzSxGdMC/hZ7B4jop9Ml5C4ygvePLp4kXpbPuertVvCMraAY6SSVs3ze4ydpRTpQNYtHtH74bBcEgTtyDqi98icqpROpcEua/JJE9TzG4wcASlC9vpX3KV39Zl7mwin6vZoeG28ybzpvmFnqdlffwBFnryyNtE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427364; c=relaxed/simple;
	bh=Q9vdVxjehoPmOLGwxddPaob8YDNJO1+46CWjZ/TU1JE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t5h7tAEnZmWpt1Rtr+Wn50Ej6AemHH3F7yuqnQ3+8ge5jhkbGFXHlLborALelKLnpq6BDjSNFA8sayaKqeFlBHpF3Blud6wXl8jQTDgTAKyYtYBRFFyZePp9Zxw6hisDdPSxKPpswxirp9j8lnlGygqI6JIwSQKaXRSzxev3iE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=FuC34qvY; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTPS
	id hTm7s1ZJIg2lzhWKSsOmTz; Fri, 23 Aug 2024 15:35:56 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hWKOsmEKvO7CrhWKQsKYri; Fri, 23 Aug 2024 15:35:55 +0000
X-Authority-Analysis: v=2.4 cv=Pco0hThd c=1 sm=1 tr=0 ts=66c8ac5b
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=3KY-2xoZkWm1R9MF42IA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uRtZIGRZyqIiR/BHXAKQNb5VgHHpJTUQWreXubF99ak=; b=FuC34qvYH8P2Ue8r+HQrsc7sgC
	K6zOwJWbSbEYW53rczYsSjeAsYy7MZlRZ7VGv4fi0bbEVI1Q75caYhFRfsnTybEktAvcZ5v50+Nd3
	kfLG3tIx1vbE8gUUgGOTid/Z4d9GSDSLLED+q8U5we3s4ixU2FX2ehWZX5K1XwAXHkN0o3aLI/0DR
	mXeABY+UiSnsU56vAKFSRdOFZTmxlinQNkfmRoo+VI4RzrTc+tS4B2tTOEaZFRS2xWDFrQa7IpDb/
	/plv7YZkcIzZGykcHYm6FYQrM98ikoQLOjHtTNkum1qmBQaVUGCPTWACQfPbIoWoJchrBkRI8WU3/
	js4/P/Aw==;
Received: from [122.165.245.213] (port=53684 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shWKN-000GB4-1D;
	Fri, 23 Aug 2024 21:05:51 +0530
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
Subject: [PATCH 3/8] ARM: dts: rockchip: Add pwm node for RV1126
Date: Fri, 23 Aug 2024 21:05:23 +0530
Message-Id: <20240823153528.3863993-4-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240823153528.3863993-1-karthikeyan@linumiz.com>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
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
X-Exim-ID: 1shWKN-000GB4-1D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:53684
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 31
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAOZw7nVGk55IKck78QZue/iARqU1ZfxE5TjEo1p9S57ETjJa4jBYI5DuBRV9+jZyMYmnZWdL4R0EL23x2upSuPYAzB2cQ/+ADr1SEGtzydFk9nyV2GR
 beEHmaE5DvjOr5dIL+h6zBwX7Wk+9HUU1OsGwmilvLZOlm+e23Mvc4XJl0jyDYNHaiFMRvpUzZM34eh1WbX4IdkbLZYIRvU86SQ=

Add missing pwm node and possible pinctrl for Rockchip RV1126

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 128 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        | 110 +++++++++++++++
 2 files changed, 238 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index c83490dfe8f6..7d11bf685151 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -225,6 +225,28 @@ i2s0m1_sdo3_sdi1: i2s0m1-sdo3_sdi1 {
 			<3 RK_PB5 3 &pcfg_pull_none>;
 		};
 	};
+	pwm0 {
+		/omit-if-no-ref/
+		pwm0m0_pins: pwm0m0-pins {
+			rockchip,pins =
+				/* pwm0_pin_m0 */
+				<0 RK_PB6 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm0m1_pins: pwm0m1-pins {
+			rockchip,pins =
+				/* pwm0_pin_m1 */
+				<2 RK_PB3 5 &pcfg_pull_none>;
+		};
+	};
+	pwm1 {
+		/omit-if-no-ref/
+		pwm1m0_pins: pwm1m0-pins {
+			rockchip,pins =
+				/* pwm1_pin_m0 */
+				<0 RK_PB7 3 &pcfg_pull_none>;
+		};
+	};
 	pwm2 {
 		/omit-if-no-ref/
 		pwm2m0_pins: pwm2m0-pins {
@@ -232,6 +254,106 @@ pwm2m0_pins: pwm2m0-pins {
 				/* pwm2_pin_m0 */
 				<0 RK_PC0 3 &pcfg_pull_none>;
 		};
+		/omit-if-no-ref/
+		pwm2m1_pins: pwm2m1-pins {
+			rockchip,pins =
+				/* pwm2_pin_m1 */
+				<2 RK_PB1 5 &pcfg_pull_none>;
+		};
+	};
+	pwm3 {
+		/omit-if-no-ref/
+		pwm3m0_pins: pwm3m0-pins {
+			rockchip,pins =
+				/* pwm3_pin_m0 */
+				<0 RK_PC1 3 &pcfg_pull_none>;
+		};
+	};
+	pwm4 {
+		/omit-if-no-ref/
+		pwm4m0_pins: pwm4m0-pins {
+			rockchip,pins =
+				/* pwm4_pin_m0 */
+				<0 RK_PC2 3 &pcfg_pull_none>;
+		};
+	};
+	pwm5 {
+		/omit-if-no-ref/
+		pwm5m0_pins: pwm5m0-pins {
+			rockchip,pins =
+				/* pwm5_pin_m0 */
+				<0 RK_PC3 3 &pcfg_pull_none>;
+		};
+	};
+	pwm6 {
+		/omit-if-no-ref/
+		pwm6m0_pins: pwm6m0-pins {
+			rockchip,pins =
+				/* pwm6_pin_m0 */
+				<0 RK_PB2 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm6m1_pins: pwm6m1-pins {
+			rockchip,pins =
+				/* pwm6_pin_m1 */
+				<2 RK_PD4 5 &pcfg_pull_none>;
+		};
+	};
+	pwm7 {
+		/omit-if-no-ref/
+		pwm7m0_pins: pwm7m0-pins {
+			rockchip,pins =
+				/* pwm7_pin_m0 */
+				<0 RK_PB1 3 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm7m1_pins: pwm7m1-pins {
+			rockchip,pins =
+				/* pwm7_pin_m1 */
+				<3 RK_PA0 5 &pcfg_pull_none>;
+		};
+	};
+	pwm8 {
+		/omit-if-no-ref/
+		pwm8m0_pins: pwm8m0-pins {
+			rockchip,pins =
+				/* pwm8_pin_m0 */
+				<3 RK_PA4 6 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm8m1_pins: pwm8m1-pins {
+			rockchip,pins =
+				/* pwm8_pin_m1 */
+				<2 RK_PD7 5 &pcfg_pull_none>;
+		};
+	};
+	pwm9 {
+		/omit-if-no-ref/
+		pwm9m0_pins: pwm9m0-pins {
+			rockchip,pins =
+				/* pwm9_pin_m0 */
+				<3 RK_PA5 6 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm9m1_pins: pwm9m1-pins {
+			rockchip,pins =
+				/* pwm9_pin_m1 */
+				<2 RK_PD6 5 &pcfg_pull_none>;
+		};
+	};
+	pwm10 {
+		/omit-if-no-ref/
+		pwm10m0_pins: pwm10m0-pins {
+			rockchip,pins =
+				/* pwm10_pin_m0 */
+				<3 RK_PA6 6 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		pwm10m1_pins: pwm10m1-pins {
+			rockchip,pins =
+				/* pwm10_pin_m1 */
+				<2 RK_PD5 5 &pcfg_pull_none>;
+		};
 	};
 	pwm11 {
 		/omit-if-no-ref/
@@ -240,6 +362,12 @@ pwm11m0_pins: pwm11m0-pins {
 				/* pwm11_pin_m0 */
 				<3 RK_PA7 6 &pcfg_pull_none>;
 		};
+		/omit-if-no-ref/
+		pwm11m1_pins: pwm11m1-pins {
+			rockchip,pins =
+				/* pwm11_pin_m1 */
+				<3 RK_PA1 5 &pcfg_pull_none>;
+		};
 	};
 	rgmii {
 		/omit-if-no-ref/
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 09ecde58c553..abf442804d27 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -269,6 +269,28 @@ uart1: serial@ff410000 {
 		status = "disabled";
 	};
 
+	pwm0: pwm@ff430000 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff430000 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm0m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm1: pwm@ff430010 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff430010 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	pwm2: pwm@ff430020 {
 		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
 		reg = <0xff430020 0x10>;
@@ -280,6 +302,61 @@ pwm2: pwm@ff430020 {
 		status = "disabled";
 	};
 
+	pwm3: pwm@ff430030 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff430030 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm3m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm4: pwm@ff440000 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff440000 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM1>, <&pmucru PCLK_PWM1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm4m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm5: pwm@ff440010 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff440010 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM1>, <&pmucru PCLK_PWM1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm6: pwm@ff440020 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff440020 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM1>, <&pmucru PCLK_PWM1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm6m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm7: pwm@ff440030 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff440030 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&pmucru CLK_PWM1>, <&pmucru PCLK_PWM1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm7m0_pins>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	pmucru: clock-controller@ff480000 {
 		compatible = "rockchip,rv1126-pmucru";
 		reg = <0xff480000 0x1000>;
@@ -323,6 +400,39 @@ i2c3: i2c@ff520000 {
 		rockchip,grf = <&pmugrf>;
 	};
 
+	pwm8: pwm@ff550000 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff550000 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+		pinctrl-0 = <&pwm8m0_pins>;
+		pinctrl-names = "default";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm9: pwm@ff550010 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff550010 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+		pinctrl-0 = <&pwm9m0_pins>;
+		pinctrl-names = "default";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm10: pwm@ff550020 {
+		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
+		reg = <0xff550020 0x10>;
+		clock-names = "pwm", "pclk";
+		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+		pinctrl-0 = <&pwm10m0_pins>;
+		pinctrl-names = "default";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	pwm11: pwm@ff550030 {
 		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
 		reg = <0xff550030 0x10>;
-- 
2.39.2


