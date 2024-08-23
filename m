Return-Path: <linux-rtc+bounces-1714-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D7C95D186
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5281C2133C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B94188CDA;
	Fri, 23 Aug 2024 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="k70Ai4kV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD321189501
	for <linux-rtc@vger.kernel.org>; Fri, 23 Aug 2024 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427361; cv=none; b=JISvG0lj59NTOzhI9aLYO8O5F4fnQ2PJdpQOwyZ5PKQ1LjKehTghXshA24pP9IZC+JK6e1dV0npH88XrPTdZQlKO5RgxJ83ZHeQhjp0hhf3S8trHOWNUVgfrX7LBWAwe7P0n8OA/52Z+c/nMEobSFhHZPW2PfH6CyyMX/PlCctU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427361; c=relaxed/simple;
	bh=WYrsJ9l1T2QO1pB8ewNoGKkl88qY3DP2MUtmVJySsvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A5x0UUyHeLj3VyAtwV9kml8nq7Fa3Gdy0KL8gl46kYRgchz+b9wbqM/Fp25DarjY1XIQYc/VoZmizui4tq1toiaPw87UqjRhsXQrtR+mq+SYxbCu6UJXqeZPrU00hsMcm7EC4ZsxEnHJk4mFEX5IKbicFgBacGeU7w6a41dcY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=k70Ai4kV; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTPS
	id hTWjsOBM8nNFGhWKPsLVso; Fri, 23 Aug 2024 15:35:53 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hWKMsTHrr02uChWKNsYJaL; Fri, 23 Aug 2024 15:35:52 +0000
X-Authority-Analysis: v=2.4 cv=a88291SF c=1 sm=1 tr=0 ts=66c8ac58
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=IUsOfeiScPouXSuZ-WoA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lGv/wy08x/B7bLYOWqbVbMhnaUihX+YE7qSWjC5RYsw=; b=k70Ai4kVIEJb6oHR6G6An729wJ
	g26+STN0j9O8wB/eAMURdF7H7FY5idtC20iPFBq9ZSIDNwG64oolqrzElmHuvUklK11ER1bwel0Cu
	GpKQdW4D+ABvJvHFNUioL4Yx5wmSOwpKKtWL/6OOR89Sromr+M8AuOZryp6L38mtcQrCFR0QuHfwU
	5DmsNmFI7oKTnbDpqk5uUVVMCuLWRw+IPIWkQfg+jpj6dOSzKjZfAVtukeZzedKcjhdpWxZsK16yS
	J4XjrnThYJisgxr8UHfVumBHwZd6HaC1gCWrs4dJVRIPmgJh4671msMX9tPhe8yQPdosQ0vewLeuF
	xrE4yuvw==;
Received: from [122.165.245.213] (port=53684 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shWKK-000GB4-1i;
	Fri, 23 Aug 2024 21:05:48 +0530
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
Subject: [PATCH 1/8] ARM: dts: rockchip: Add i2c3 node for RV1126
Date: Fri, 23 Aug 2024 21:05:21 +0530
Message-Id: <20240823153528.3863993-2-karthikeyan@linumiz.com>
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
X-Exim-ID: 1shWKK-000GB4-1i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:53684
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 11
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLAI1oWJJmlqxXfNXcmUXUYi7GlN0+/AWsxxJ+05LeiCiQOvqpq1bz6ehpUw+7rOGWYawoKJrs+7xR2fC8V91MnYdJCd67Mra5iLglrb1MgJjKZ0Y7+Y
 3xqgcZAvl+6xNuQfSIUDIb55DeXsMLSYdReyf0phn3ZhHlJoPIiy+CjmikoAzZA1FVVSrRcBGShrr6bIXOjoABr/L7uGDgHG5Vg=

Add i2c3 node and possible pinctrl for Rockchip RV1126

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 26 +++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        | 15 +++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index 06b1d7f2d858..be666b25b830 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -97,6 +97,32 @@ i2c2_xfer: i2c2-xfer {
 				<0 RK_PC3 1 &pcfg_pull_none_drv_level_0_smt>;
 		};
 	};
+	i2c3 {
+		/omit-if-no-ref/
+		i2c3m0_xfer: i2c3m0-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m0 */
+				<3 RK_PA4 5 &pcfg_pull_none>,
+				/* i2c3_sda_m0 */
+				<3 RK_PA5 5 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		i2c3m1_xfer: i2c3m1-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m1 */
+				<2 RK_PD4 7 &pcfg_pull_none>,
+				/* i2c3_sda_m1 */
+				<2 RK_PD5 7 &pcfg_pull_none>;
+		};
+		/omit-if-no-ref/
+		i2c3m2_xfer: i2c3m2-xfer {
+			rockchip,pins =
+				/* i2c3_scl_m2 */
+				<1 RK_PD6 3 &pcfg_pull_none>,
+				/* i2c3_sda_m2 */
+				<1 RK_PD7 3 &pcfg_pull_none>;
+		};
+	};
 	pwm2 {
 		/omit-if-no-ref/
 		pwm2m0_pins: pwm2m0-pins {
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index bb603cae13df..59de848c9a83 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -22,6 +22,7 @@ / {
 	aliases {
 		i2c0 = &i2c0;
 		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -308,6 +309,20 @@ dmac: dma-controller@ff4e0000 {
 		clock-names = "apb_pclk";
 	};
 
+	i2c3: i2c@ff520000 {
+		compatible = "rockchip,rv1126-i2c", "rockchip,rk3399-i2c";
+		reg = <0xff520000 0x1000>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
+		clock-names = "i2c", "pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c3m0_xfer>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+		rockchip,grf = <&pmugrf>;
+	};
+
 	pwm11: pwm@ff550030 {
 		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
 		reg = <0xff550030 0x10>;
-- 
2.39.2


