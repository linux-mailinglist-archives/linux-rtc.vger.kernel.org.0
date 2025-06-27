Return-Path: <linux-rtc+bounces-4391-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82832AEB9BF
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9215D4A0E2E
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4452E4275;
	Fri, 27 Jun 2025 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bo3+biOD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6542E4240
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034204; cv=none; b=KSBS8AHYQSfTIEs+rg+R8+VJ82o6OR0dlfGDpp15FEFqiG7H0QclX5rrDJx98EcJgQR7dTyK4WksNrRHeCEP1z1bpHj7hJui9rj07R8q5087631HprdXxf8ygEDpWM/ncYCBYc2G8n0Gv89hFJ3ghneoLrCDtsubkoU8vZlVDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034204; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0W8ozErBrl3eBuzwJ446ojuYHdMsCONAaRaL7d1a0m+M1aOuff1gBVelUmIb0/riHUlukNb45VhNGDtFVZO62x9z53PHi82CZ1f6/CQbHaJyo7MDE+5AsCurKVzt1ozmqnq6+MfxHZ/Ae5PAJKkpmK1SuioR7GnNBXLxjMEcAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bo3+biOD; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d3e7503333so251291685a.3
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034201; x=1751639001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=bo3+biODD7LGhBMJw9JZexn307AmIA2AtUnAF5Cjl/lX8LYCg5ZkdIWaU4QrG7VtoU
         kHjewxGKCQ0YfPzX/9YwY0H8HmFsQXGIMcCfgfSYmgubfPoN+1iejl6NxOqQUYQqmY1C
         Y3vqwah+1m/vS9f2ASOFSBkhPJA+x9eAIXCCNaOZH/g8dTxICtfkQ6gwtlqpxW9sTQWs
         PUeugbP9/KDQSKWMxtgfv+8PnONY3zFt+s4QievGN8KAn1IWZNxR1J75wyI5HV/d8sTI
         KHZR4ObeKzMg0bJ6C6U1/6xtcd75TYRLNfQDtYlwR+uUWeTjMVnoHnQ/tNLJUZZCqwN+
         L3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034201; x=1751639001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=LRrEf7n3YX2Pr55Ygjyqf7SajfZkbDc4WS+g3vRfFvvYDbe8/qCMeAcUKFak6QJw/Q
         C7qbMBvHJwPne5R21IpRun0tkg6Aa+p1JQ+GDzEttYPjgqL4L1zAI7LNUGKeDg/dXyFA
         v17wCUWul9/rtKuK3Vyab6L5Zhuhoa3MEJ5UAaemS4gRHjU5OaADIIek2hx3I7IbW9LI
         0KfTXQH5qrn8ut+kki0aBh0C1FZwB7IGhe43FWIh+oO/nKs5/QJHHVcWClVsbA2QCdr3
         Z2GFLlUeiTm4tZaaf3b7yF7ysOO7denm2YOIDa7mN2aUjajWipsdhXbPdHSs+UMP7woe
         FSqA==
X-Forwarded-Encrypted: i=1; AJvYcCWNgc74tE3K6AlOJh7PmVGYu4/ZGTS2OeuxHL1PFUz8/u2JIKCB8ebnNYASXYcWAivH6bvkdIQQgac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybpguk9OMitdxqqHzDHaku9bpDc5xXB2AscpbX/wZi4L8Zc9eX
	EnG9lqVDpW0cmpHPRzln+cZ2bVhyOOjSoydiOU2pviE3/xHdG4313pBEdoxieiWLcl0=
X-Gm-Gg: ASbGnctSXP3poEMvFLipJnEkTWBOyg4558ESESrDS3v0jDU3VbTa7QptTQXyBhuQMTN
	8lp3+OcHcpXvflTgMDLeXmV5ghEuTUElBL5GN4UBovTBbPyvmbdFlrnBPhXe6KTEQhIVNPpzgsp
	QUShaeg8xrb6b5QNKKVR0fIAbGPsYc5Kg8ZpzUTvN6P8EqdnFpK9wU55PHH6XcQfV7KKb0rAwR/
	RE+6IDzjv+qlyDfEDBsauImEmXkkng7Dkyrk/08+qz/0qPIYF5qMUJZnuX6j7a2N5uRJ+Kwipix
	dJcmyQs6tZc1fWgiDwgmudFa7AhDonJZJ+QnS5z89T2K8zPVpMd1WFiRf9ovYv2E0nGskQ0VpFm
	rbtcKa0pRggup2IH1WhpCiQ1AW4u8lRcriPw=
X-Google-Smtp-Source: AGHT+IGbR8LfUszD/aEIdWwkUQ61eynSIqFyVoyDA8206vPOUxXJejP9vRZ618fRX8/VdY8/tjO/YQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:9113:7902 with SMTP id af79cd13be357-7d44397f5e8mr481566285a.38.1751034201091;
        Fri, 27 Jun 2025 07:23:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:20 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 27 Jun 2025 09:23:05 -0500
Message-ID: <20250627142309.1444135-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
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
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
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
index 14097f1f6f447..a85239e8e430b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2


