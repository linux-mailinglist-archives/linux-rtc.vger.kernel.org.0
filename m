Return-Path: <linux-rtc+bounces-4581-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 980AAB1124A
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770B8AC3534
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1474271477;
	Thu, 24 Jul 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e6qNgGpk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972B26C3A3
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388733; cv=none; b=A4jVeOSh2PJCul9OwWjyKwNUmjK4LIqz9F+XszqioaIglOTNxqCgf36rI1Qdg2D0y+CdOqVNZlMSdJp70L/lnPIGVlMHe23Ec1fORbUvvbBF2LgcqKtS3OTOYqJjKgfrzLd6GacITCl5NceA7Sjx44esdbL1VcBwx2gP9E202wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388733; c=relaxed/simple;
	bh=gQgnEu46nXffeDK/T2EsMnfRsMV5amrAJvwckiMVDxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNjfCu3JKcLv7EpKHRnK+XiLnVCR6bMpkQ8w9Lf6kpdvhZ1nAc70B/WJVu7YwC88Y7hwt8/XyQNolI7EuI1eWtPalsQKbWUXOsUqkPVySXJw65qLyCFmZtenwL1zIR2uH/KLzTJRSNzCoPqRRrWXTWTCSXFa0uM3hZNqJGzqIo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e6qNgGpk; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-879c7464843so30258539f.2
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388731; x=1753993531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=e6qNgGpk/Zvo72makg5Wbl7ZUFGc6Ee4S2kr8+Y/9brDu/BZaE5rGekaJDZ800mz33
         BXTI/vuQdDnsA7KZ76Xm7KPH0rh/DyjIs3E4Xy2cJlPohAFU30e+GmRjmbO+XdL9biZy
         2LKmLedSx+fvSU05sX3jYIjlckztJW95WeAMrBxFxBh9UbJ7Gwbirf1zEQR1dz2ENlWf
         L/3bWhizGGq8fcgG49ytVFKrUzhWphcbO/Lhtr8Bm+DWBF0BHEPb4km3iGLluo5FdD6Q
         eyNMv7JUi2TtHwyy3m1eOsgZH7Gz5+cuzDkhDWlRV8GAv/7HRZyc/OKgntJJSdoabkoW
         ++zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388731; x=1753993531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=kn8x0mkvekQ5FcC8lP/W877xTOtb9kcSqplWYZsN1KvBISR4pcxxb8rc2gVIfPyDgx
         6inyTxLyQ1mb0xGWOR3YCMPyFHFftpw2O4I/srQaTagVnrvxYlXvcUbnZk4Aa1iockwN
         3Bz5GZWYZbO5YAtCEShgD2onHowykWiAb58w3fEbDgaXJTGJrF8Ru1dlKErtSUI6w7rR
         OhjHK3FhWjwv9Z78aLDFYNEkN4SiQNnwQEX2BOpofB6kcud6qGgozakeJjXQzxIx93S9
         PbCjtTUSodUNZoA4jx69uPJoBewIKYT1rmplW/5K49sqA9mrijgKWRNUSxJqdyIhWdMS
         uh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxQxPTn56mTNiPlKScize1gUUCac1WXBdH6SUy0AoLKTRIRnr8i2vl4jPLxUdO3lPMcQv9IoTKWzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUQCaKN5sZoVPo1iKITNaM9o5VgSOg/KhwL3A7cv051f32m+S
	NKiW7rhizok3OheLvTI11+I+WV+Ll7I8GNXOYrQQHrOPwG31ijhU66BwxUSXFLfpavY=
X-Gm-Gg: ASbGncti8CbMlAb2GC0fxHBXwDvolCWmk6+mRtEnHC4SOGoY8bluUxr8wqAnwqVwvof
	cmYs0gVTEiOSsu+IQ+H6m3yjNb3yT2wq213Hmeqo3U/m3TR+Dbspg9lyO1N1dHfTZNnQuwokSlx
	Ybs4+0JFPC3r7/y0gYHCIj6T1V/zgMTN13QHYWs8r2Q4QRpG9/lMJSxEDccIjwU/kIB89OX4oDT
	8Nyo6bcj8La5p2VUsYOjQJ+yv5NIkwdxFuiDURmYpUgujrgWp4fUuSwld0d4CkEzxeDsOZ2CbNQ
	GvLVqUV1LqTuz/8RP2qLdp9sl3+4TCC/8nIN1BNJy1hgKAOff+Pr0HcrQkTjmA+r19zpkKk4Yvi
	p1yTz4Pu35awqaGu0uzunY7JUHhlmbBozQSBqmev6
X-Google-Smtp-Source: AGHT+IEOCPJEmS++a59jxbnEfzm6BGBxv4jrcgvVSaZ5cgZIE4C2TYD/gzvOZX8xyz7qYVEph48/fQ==
X-Received: by 2002:a05:6602:3421:b0:87c:4496:329d with SMTP id ca18e2360f4ac-87c64f64aafmr1508845939f.5.1753388730846;
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
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
Subject: [PATCH v9 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 24 Jul 2025 15:25:09 -0500
Message-ID: <20250724202511.499288-9-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.43.0


