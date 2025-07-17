Return-Path: <linux-rtc+bounces-4529-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94233B08970
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 11:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BD0F3BF7D2
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 09:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3395528A3EA;
	Thu, 17 Jul 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dY8jlF85"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0573F3208;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745123; cv=none; b=hs2dPUKs1hy8SicO2gFlp9ZQX5qgBzAFOYVkA1k6GKSA2moADN3kXTGONtMIxUUw665FJwEnVKnNrCMJltFH0rYW5FnU4g4WAlC8BktLxoKEo5XEwa4mu3YGwNedS8fb5sDCfUS3UA1iRe5xCikKik62JKlwTHsE/rTWQ0SZ+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745123; c=relaxed/simple;
	bh=T3PS9vZhXd87vxsDAEauzZTimunT7qthZYCWoQ0vQGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WN9Nul6R++m+LzKIZ+y9+AYlJrx3oGWjteJZ4TTx3Msa/ybAJ7OJ44rrAy9rcsKeA62X4f2lyWbneODkSD4Q9KBDKTkq7+d8g8v7uhEBmwwTf+jPfrkr6AlWAB5ckrGiH2+B1z8d5aKYhqbN9NKntknI8mH2B623kjbZ95/rrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dY8jlF85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB6CC4CEEB;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=T3PS9vZhXd87vxsDAEauzZTimunT7qthZYCWoQ0vQGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dY8jlF8589CoOfmQzB1Qb5DmLLYo9zbe3zX/GrkfrYUX3dUWHp2kgnH3gbJVQV9wr
	 5K6IuPyADtelQ8T/13/KizgyS5W8F8DoGwc+YD6dEfIS63pxMw9gQmRS6lrmJdFs9f
	 kncuVm1QY5IvWl9Ch59Sb9y7dj+HIYGUsu+pquDDafkpv9xKNmJQ3/mt/SyiDNw631
	 +FgHU7Zvhyuaf3F1inWSpbjKy7fZjyG/wtC0cZeAzdBo3hoJht+5sGTnuRu57fcaKc
	 lVvEC+ycdc90bzOOV6PansgLGJ6SZYwOGMUkTGOCMnp/LbFCHRtL7nUx6dkAPqJ4xu
	 JaX6IitVq+81g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACB4C83F1B;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:38:38 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: C3: Add RTC controller node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=1224;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=oDscrQnwBWleM1lKXYkem+gVGQrkocRvej4i/VO/Lqk=;
 b=7H03TvHXdNylCWXWrMbEeTI+1PGuh2L1B8KhKOjjIqk3FuLzkDI3KcY81WNs5ECGqlqxiWdfV
 +2Dzk3/7U5AD+mOxUE1rQSUSR9ra0skTfhMbvFoRVyJMmhsKAMqGKaL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the RTC controller node for C3 SoC family.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..b81bffac7732 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -53,6 +53,13 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	xtal_32k: xtal-clk-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xtal_32k";
+		#clock-cells = <0>;
+	};
+
 	sm: secure-monitor {
 		compatible = "amlogic,meson-gxbb-sm";
 
@@ -967,6 +974,15 @@ nand: nand-controller@8d000 {
 				clock-names = "core", "device";
 				status = "disabled";
 			};
+
+			rtc@9a000 {
+				compatible = "amlogic,c3-rtc",
+					     "amlogic,a5-rtc";
+				reg = <0x0 0x9a000 0x0 0x38>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal_32k>, <&clkc_periphs CLKID_SYS_RTC>;
+				clock-names = "osc", "sys";
+			};
 		};
 
 		ethmac: ethernet@fdc00000 {

-- 
2.37.1



