Return-Path: <linux-rtc+bounces-1847-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86D969AE4
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 12:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F251F21F94
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 10:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64A31DA117;
	Tue,  3 Sep 2024 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="EAkRSFQe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C151D0962
	for <linux-rtc@vger.kernel.org>; Tue,  3 Sep 2024 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360789; cv=none; b=oX+rJm9IxY6BEb/56M196N0N1tRBdhduS5tGwUaNx68Eke6tS9G3gxhXPCkpRscwUQLx8gM02p57vRgHTpbKKhjtHugOKGGUdSYFmPLQbofxGSEXUXTUCrZXTsgC2HrwBvvYib2FPwCsECXxBT20sL/bNUboaDtwZ5YAhkpkE0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360789; c=relaxed/simple;
	bh=kjSSUho6FNpKD6d9oWqK/49eyjhobQf3ir+naWpXI2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l0Nwrbid4zJEeZqOgURgCrnDtaz4NzIA+i0JC+h9aOFrUOQAB36+eDUd5FTHwwGBPUe40/FXA79PSSGQ0EGchU+QfqwaLe7CPpgfHWzYHE04Viv7W6PqK2Mf6IzRLihFKHeGW0rtJGnVHK8LR/hCblDGEGjbZ5AIqE+wfKeso1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=EAkRSFQe; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id lOros1vVWVpzplR9msn2Ki; Tue, 03 Sep 2024 10:53:06 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id lR9jsJ7F52GFYlR9lsRlwn; Tue, 03 Sep 2024 10:53:06 +0000
X-Authority-Analysis: v=2.4 cv=GKAOEPNK c=1 sm=1 tr=0 ts=66d6ea92
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=3KY-2xoZkWm1R9MF42IA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BB7BCR3IrZVjn5A7a28pahM3Ou0lCzEKg+FXu9n6lXo=; b=EAkRSFQe8p1cZevQko3KUfpKRs
	oluuzlUXUx7GuXbrDOarfc2rFCAZKLTp/ujyQ8YUL3HmhJLOt/YK524RKQOdBoafo3yfojYenn59F
	fB8ihYrJ7Y2opaw5sU1eGc+YqyZhLHb45Nz15kSzcAAi0J6zyj+W7utybz3MubbPc1FiE+wN0qyOk
	FAq1sbHlDE3VIrMozx2n0ZFKD8dQG7Ig6NSXrtWXh965e7bnmtUgL9t6sjEjUa+tF1tKaW7mSnz5w
	R78kyNfI9kJNjMe0DyjPX4Tw7rNssUYH08tOEgImjlI0AiavCr5d4tMoWgFsGNrYr+/00FE+JXvuk
	06dXCVgA==;
Received: from [122.165.245.213] (port=41440 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1slR9h-000Elu-24;
	Tue, 03 Sep 2024 16:23:01 +0530
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
Subject: [PATCH v2 3/8] ARM: dts: rockchip: Add pwm node for RV1126
Date: Tue,  3 Sep 2024 16:22:40 +0530
Message-Id: <20240903105245.715899-4-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903105245.715899-1-karthikeyan@linumiz.com>
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
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
X-Exim-ID: 1slR9h-000Elu-24
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41440
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 32
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJNrWuQbMJUyXGRSiKQpLDOLIcu4igVsAsrPAUgZ5MQbYDk6SghsHdaIL4a+/fKOo9hSqlVH0n5kbA76vK/84PT4RgKSCC1WOnIVEAY8Dc1n6TwlnlFc
 aB3W6vwYmiEMh04270UaMOp/qyDhyMAqrtcpS+QjUKUxQ6vcZM6y8nOEAXkKVAU91bTdkg8kGC03++to1UuuBF55XtGFsk+UMbE=

Add missing pwm node and possible pinctrl for Rockchip RV1126

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v2:
    - No change

 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 128 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        | 110 +++++++++++++++
 2 files changed, 238 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index a3714ab0af32..9db93b495448 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -225,6 +225,28 @@ i2s0m1_sdo3_sdi1: i2s0m1-sdo3-sdi1 {
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


