Return-Path: <linux-rtc+bounces-1715-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554B95D18C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8DF2838AA
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F1189B8E;
	Fri, 23 Aug 2024 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="VJOQ8SI7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7DD1891BA
	for <linux-rtc@vger.kernel.org>; Fri, 23 Aug 2024 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427362; cv=none; b=kQGa1mSwA5o7cUZr6b3GXHnVC3VsQoU4TeYVfaVSwFaOwRuTdjoV3+/H11ubY6WjiFpsflmLuwbZmW7UVN9JIjvQRkC6LV/Eq911jaeT18hL2+oK5icyZlpta0rUnwJAAKGZAHR7J36AFpnGKKCUfs5dOjMmSkJ9cJHznwJkv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427362; c=relaxed/simple;
	bh=ic1UksxX9C3U+zO04YiIE/rAsB50nQjVR88sEiBVK1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Viqn80OE3eJrk4SI4v0i+ZU893DrKLHFwKz2ktyLuio754EqBXPBdIyp/fYdImEkgK8ZSCCXAW5qSWoaQ8hZtIwMVFgA+hrkfvu2iPoCzWe+Ce1U7ErGSFCYVkT/bHbmxPK5G4lhIeNRWveWeOqmK4FOPNRj3FWO4E1u6fnAB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=VJOQ8SI7; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id h53KsIy5BnNFGhWKPsLVt0; Fri, 23 Aug 2024 15:35:53 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hWKNskt3M85uZhWKOs3C2g; Fri, 23 Aug 2024 15:35:53 +0000
X-Authority-Analysis: v=2.4 cv=J6Gs7hnS c=1 sm=1 tr=0 ts=66c8ac59
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=PIVyUoi6X9y6bivDt_YA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HI4wA5946lgKTidFdG+3Mj2M1oic6hs347gXt2MsqwU=; b=VJOQ8SI7zWFzyuDXoLQpIwwRFZ
	I9b+Ml8jOjYnmdAtObuXmj1zNlq6uuXbLPNXHlV8hkLbtnj229NavZX56pqdTeiBojhE0KgI39kF/
	rUC6P0UG0ARVZ/rE01l8CE/6HfAOsR1z4WirP2E8UhEWRJFGRD8d+Cfe4I5w/hfZEWvtfGl1CJybj
	bDhuU1W73xngcpo9kFK/15Sg15jMTzrFZoIgk8mfuKRX7Yt/qUek8FUy3eNz9vrQiw/8cqBdZdHcE
	uR8TBbivAQWFHWjqSH6ChQXbdtU5SvzTMUgz0XBurwgzHnyOOSQ8YVq02XqQ6d/YDeglBMD96Bbqy
	oNKcMaSw==;
Received: from [122.165.245.213] (port=53684 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shWKL-000GB4-37;
	Fri, 23 Aug 2024 21:05:50 +0530
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
Subject: [PATCH 2/8] ARM: dts: rockchip: Add i2s0 node for RV1126
Date: Fri, 23 Aug 2024 21:05:22 +0530
Message-Id: <20240823153528.3863993-3-karthikeyan@linumiz.com>
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
X-Exim-ID: 1shWKL-000GB4-37
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:53684
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 21
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIEMgMIH7HskknauuNuB9lTwFlPIlyHNMSu259uMfu2kOvbtYp5T5Pm9+5ZpDKHCdB9ZZ0W2DjCCIFtiPN+oqXqiPoa6DkBMP6INYF9daxIBnAwcijeF
 CAW/NWOVwiLlSd2i0vcsiNFkUi5JEhWpXAANLkhxl0SguYGqdH9YIE3pWNXIuZjegJGzsluXgSr83/5kDGHF0sExP+fFLsd5UF4=

Add i2s0 node and possible pinctrl for Rockchip RV1126

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 102 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        |  26 +++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index be666b25b830..c83490dfe8f6 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -123,6 +123,108 @@ i2c3m2_xfer: i2c3m2-xfer {
 				<1 RK_PD7 3 &pcfg_pull_none>;
 		};
 	};
+	i2s0 {
+		i2s0m0_sclk_tx: i2s0m0-sclk-tx {
+			rockchip,pins =
+			/* i2s0_sclk_tx_m0 */
+			<3 RK_PD0 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sclk_rx: i2s0m0-sclk-rx {
+			rockchip,pins =
+			/* i2s0_sclk_rx_m0 */
+			<3 RK_PD1 1 &pcfg_pull_none>;
+		};
+		i2s0m0_mclk: i2s0m0-mclk {
+			rockchip,pins =
+			/* i2s0_mclk_m0 */
+			<3 RK_PD2 1 &pcfg_pull_none>;
+		};
+		i2s0m0_lrck_tx: i2s0m0-lrck-tx {
+			rockchip,pins =
+			/* i2s0_lrck_tx_m0 */
+			<3 RK_PD3 1 &pcfg_pull_none>;
+		};
+		i2s0m0_lrck_rx: i2s0m0-lrck-rx {
+			rockchip,pins =
+			/* i2s0_lrck_rx_m0 */
+			<3 RK_PD4 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sdi0: i2s0m0-sdi0 {
+			rockchip,pins =
+			/* i2s0_sdi0_m0 */
+			<3 RK_PD6 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sdo0: i2s0m0-sdo0 {
+			rockchip,pins =
+			/* i2s0_sdo0_m0 */
+			<3 RK_PD5 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sdo1_sdi3: i2s0m0-sdo1_sdi3 {
+			rockchip,pins =
+			/* i2s0_sdo1_sdi3_m0 */
+			<3 RK_PD7 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sdo2_sdi2: i2s0m0-sdo2_sdi2 {
+			rockchip,pins =
+			/* i2s0_sdo2_sdi2_m0 */
+			<4 RK_PA0 1 &pcfg_pull_none>;
+		};
+		i2s0m0_sdo3_sdi1: i2s0m0-sdo3_sdi1 {
+			rockchip,pins =
+			/* i2s0_sdo3_sdi1_m0 */
+			<4 RK_PA1 1 &pcfg_pull_none>;
+		};
+		i2s0m1_sclk_tx: i2s0m1-sclk-tx {
+			rockchip,pins =
+			/* i2s0_sclk_tx_m1 */
+			<3 RK_PA4 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sclk_rx: i2s0m1-sclk-rx {
+			rockchip,pins =
+			/* i2s0_sclk_rx_m1 */
+			<3 RK_PB1 3 &pcfg_pull_none>;
+		};
+		i2s0m1_mclk: i2s0m1-mclk {
+			rockchip,pins =
+			/* i2s0_mclk_m1 */
+			<3 RK_PB0 3 &pcfg_pull_none>;
+		};
+		i2s0m1_lrck_tx: i2s0m1-lrck-tx {
+			rockchip,pins =
+			/* i2s0_lrck_tx_m1 */
+			<3 RK_PA5 3 &pcfg_pull_none>;
+		};
+		i2s0m1_lrck_rx: i2s0m1-lrck-rx {
+			rockchip,pins =
+			/* i2s0_lrck_rx_m1 */
+			<3 RK_PB2 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sdi0: i2s0m1-sdi0 {
+			rockchip,pins =
+			/* i2s0_sdi0_m1 */
+			<3 RK_PA7 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sdo0: i2s0m1-sdo0 {
+			rockchip,pins =
+			/* i2s0_sdo0_m1 */
+			<3 RK_PA6 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sdo1_sdi3: i2s0m1-sdo1_sdi3 {
+			rockchip,pins =
+			/* i2s0_sdo1_sdi3_m1 */
+			<3 RK_PB3 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sdo2_sdi2: i2s0m1-sdo2_sdi2 {
+			rockchip,pins =
+			/* i2s0_sdo2_sdi2_m1 */
+			<3 RK_PB4 3 &pcfg_pull_none>;
+		};
+		i2s0m1_sdo3_sdi1: i2s0m1-sdo3_sdi1 {
+			rockchip,pins =
+			/* i2s0_sdo3_sdi1_m1 */
+			<3 RK_PB5 3 &pcfg_pull_none>;
+		};
+	};
 	pwm2 {
 		/omit-if-no-ref/
 		pwm2m0_pins: pwm2m0-pins {
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 59de848c9a83..09ecde58c553 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -434,6 +434,32 @@ timer0: timer@ff660000 {
 		clock-names = "pclk", "timer";
 	};
 
+	i2s0: i2s@ff800000 {
+		compatible = "rockchip,rv1126-i2s-tdm";
+		reg = <0xff800000 0x1000>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru MCLK_I2S0_TX>, <&cru MCLK_I2S0_RX>, <&cru HCLK_I2S0>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		dmas = <&dmac 20>, <&dmac 19>;
+		dma-names = "tx", "rx";
+		resets = <&cru SRST_I2S0_TX_M>, <&cru SRST_I2S0_RX_M>;
+		reset-names = "tx-m", "rx-m";
+		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s0m0_sclk_tx>,
+			     <&i2s0m0_sclk_rx>,
+			     <&i2s0m0_mclk>,
+			     <&i2s0m0_lrck_tx>,
+			     <&i2s0m0_lrck_rx>,
+			     <&i2s0m0_sdi0>,
+			     <&i2s0m0_sdo0>,
+			     <&i2s0m0_sdo1_sdi3>,
+			     <&i2s0m0_sdo2_sdi2>,
+			     <&i2s0m0_sdo3_sdi1>;
+		status = "disabled";
+	};
+
 	vop: vop@ffb00000 {
 		compatible = "rockchip,rv1126-vop";
 		reg = <0xffb00000 0x200>, <0xffb00a00 0x400>;
-- 
2.39.2


