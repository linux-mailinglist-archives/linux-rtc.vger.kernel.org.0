Return-Path: <linux-rtc+bounces-4635-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B94B191A4
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 04:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B0F177E8A
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 02:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0808F1E2853;
	Sun,  3 Aug 2025 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0qNHBJLM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DB1B532F
	for <linux-rtc@vger.kernel.org>; Sun,  3 Aug 2025 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189909; cv=none; b=R46xjF3v2eiPXevBkpitmyzOyJbs4zEMGuKXBc7yM/tLZqi2rSNdsa0+SxLIODSEIwQnYKy9Imka5GTJ4pyxyitqlBaY4O3iKAlLn9gGJzLrGRy9cd7fD92+kfpnaHLoMZackD/btpj9A45ZRAYA8nc8ntNHnyuHK7vNdOk/Uwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189909; c=relaxed/simple;
	bh=ooFOOV2isYxwgZ2SmK13jgjsTx8sBuH2wENU5XY8MgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxV6//S3I7W6eF6iKFjvy7joBDujTkq2CvLGhLsWpGqFw+pwlUxNMKe16wExsmHKkQa6N1USvuRD9oQDFPLado4Cf0yfHrNRvofKH5hYMzURv1iwSMvTkz+EDNEvax3/cIQd4Srnd08dvlM/ttDiI76T808tJIguBlD1X2/3Rks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0qNHBJLM; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8811ab2b559so240822039f.3
        for <linux-rtc@vger.kernel.org>; Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189906; x=1754794706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=0qNHBJLMqvDK1q+DvVM4mUsGTSGyvJfmWZXO4YzTA2S2tbfxXR9j4Ld0UKibKkoXlu
         gGx4NSCAYdJq7BvULnWbybUOy4Z88DT1P9veTyNOavF4mYyQpzORIgG3qLh2+SAxrt+g
         2aPEwV7JUJ2Bx6Vt4pNYoryy7QI9VUFMfkUpuHB3BWuy/yu16chTKpIsn9qhWb2Ai70w
         WU2K50j3P95BVpQFtTnM4h+1wekVuzjVCZOCrZaFBBX+mYQxLUl0D+9wKc2dNQpTz1pg
         kYoYErpRcC0xOuX8wrMvxyb/dqsWwB39AUIDmk6VySFT5BY2/9fhztkTzS9ZqoGKNlaD
         /mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189906; x=1754794706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=JdOKytnWlV4VrjJaXyRdWmD3J5SXAHPGeGVf8Sxc5y8QfOlM94PMdjScbwuZ7bg4w+
         DTVf5bVAgzEN5EKNIycBuIWQomtOEIquuRPET1W7Omjw7Np2sY+KlZH97QSdINg06i/B
         oK0VWvDVqnSMV6YDjsFX4sZ4P96QvkMuQ+1U3kMAFngqzaCHGlHXlb2/iuGc2uk6urlJ
         2Bdfo6XeqQ8NsHpruACGUhlLWRAbKvoMiE3zJ8gHpcTUwvbgj/tKQD7Malpmqezg2xHI
         BxAFytu4Hnnc0+2XWxFI25kyNTScucS4xFukOibuZcKPV3hfkjAQIBEBSZ9myd8lzcOk
         TXzw==
X-Forwarded-Encrypted: i=1; AJvYcCUmiNj2/yh3yriOQi39MctWRhxFYTLIif//uF90+hzYrSV7uIsPo6l672ra9rCr+DFKI9H9m7PNJQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOeWTjvoOswtPyNfRHDF0791ssR/Qqf9RTO7L44EJ86L/2NJF
	4MXpLUaZPy/HE4EyuNEXlqpxrDhzGErRctgH14tBu4lBb1NC2Rpn00R0XjNIE/HNADE=
X-Gm-Gg: ASbGncvfnT8FWLXGuy5jfbvPnCnnl8n1RFxBpN+xn9CxFXLM7A8ngwX2kjwpjmb5LFR
	exuq75/ovZEddkSe/0nG0E0vMuimJbbt3Vr8HC4FKaec56vpkyK3tNqlIcQ1zkuKAOrc8bcubzb
	csMdiA8PTDjiH8eBddJeWTj1zTSZpvveqKB4P1FKVP3Aa7fycQY9t3OauvH0jVodArWQFDC2s2e
	y9jIYTa96rn7Z7Fs9mPCW6lhwAVsetAnZfVUs7oedwrN2nUQ0lWBSyMokFncaUmaQG6Qwo50Cdh
	oBR2A45dC/et22+5ED1tfWgP8p4kgW20xLI0Sp237BmUCoqVWQzNDjiutxyzF0fiyU2OEkaIsdu
	dmycFRQEpIRDcJe2ytrkTuNFVT19LP7OExbtYyTQGb5rAUU1dWROflmZfXrPEkSa12A==
X-Google-Smtp-Source: AGHT+IG1jDuM19c32X7FZiZX2Nxo89FAdD6zwv+Hp+DkMIntJ+DFbyz02dTcR3RcFe7s1nLk4iRizg==
X-Received: by 2002:a05:6602:2292:b0:880:f66f:b896 with SMTP id ca18e2360f4ac-8816839db98mr738100639f.11.1754189906348;
        Sat, 02 Aug 2025 19:58:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat,  2 Aug 2025 21:58:09 -0500
Message-ID: <20250803025812.373029-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 13 +++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..ae9409fe398b2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,18 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..96d7a46d4bf77 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c..580f77b5e838a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,19 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			interrupts = <19>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.48.1


