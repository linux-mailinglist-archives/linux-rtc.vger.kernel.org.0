Return-Path: <linux-rtc+bounces-4478-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E505B00AD7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 19:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A795B1C8405A
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14A32F6F86;
	Thu, 10 Jul 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ozX2/iuD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136712F5C30
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169885; cv=none; b=rPo8T4SQXlH1E4N/ZrhsTyRcUHzMRNLt9cxVoCRqnnknhu3l3UFjt+Btz+RX5J/pPAaA7yUyclygfbdS3iUrxIWGaeflldn8G4ACPhjmDbYb1bFgBEUjJMiKmWI3mivgfGQwNyfNnWZpv3yU/x/LtsSLbcor+IqKMtLt/byvPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169885; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOlaa1aHTpqDKCjI+6Bc9t2oGxD68P7bC7Uyx0M0iiZ6dgWxjqaHGNwdxaAoxi7ryAolfLHRau9+jTFE1L0dbQNLjyfLZ5R+K1u5QCdX5z43stNxPZJwcTbkRdM1bZT7UC//mtoNdSAvA7b+QoOTbJI4piLAf6QUt3u82fKZbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ozX2/iuD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d9eac11358so132009585a.3
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169883; x=1752774683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=ozX2/iuDyCuB+v5l0BCwyVlnRu8gv9qCQxXNMGRIDSUoMrml+KZdeGKPq8F67fCQMe
         3Ojk/yKCAZFLNmj9f0P4tHDkiAHfxRhryI9pzUDoC2j7aCaPXHg14Raphd6ixY2kSREY
         moRSkncj14rpddVXYBFcsro+77BmwC9OkbRDB5fVSwQWOtKmmoYL6BgH6pi2k8b4TSSe
         0AQOh0Jfx2yFyQ8RXLOqznejjMyHZAD9S8uW2fW9DmQuBGLoCyrEOORiaSMVHTtPupnB
         XwAT4T+EweeDSfLdMCaa+HInmgVMhVIJZgoTrOMCurST/ge8Yvs8P3IVIMcjvU1ENJOe
         A/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169883; x=1752774683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=Pd3ELRhVioIClGymPydBa/yZjLBY8+gIY1StN8yutBaMO8NUqBVLaMvzs7i47ShnGI
         9VK4UvoWKeczoSxi6JrJI1MHSIMMWeyfZLdYwAV6Pn7yItoO6HqPAE7/f0obL5WlD8Rw
         I1LASrtlv+5f39Dl0O5fK94d8OPIO6J3adKLdPjjphdOWUAWXz+zP704dhHxy6Jtbna+
         bIA4EXwrQjQlOWWZltiMUE/9gD90WG8hJsj2+sICklkR4fXaD25i8nqPVcPtMI5JIBEb
         +uNqHYzUF7zGNlVY8CDAYYShVF3GF/lHJ/0W7KTduu+R/Wuuj04nS32Fv61DgqurJR82
         oynA==
X-Forwarded-Encrypted: i=1; AJvYcCUNfv1d0AdGHW3vfkXRFY3JilznOqY8MagI4n7Fdr+1tlEsSBBGGOaSMi0zNb2LE3zHo6lp4Ec/TXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUbshVCmcZY10pVjJVYeE4ucDs2xZIL5p6+B7a+nDW4I/aSYrL
	+byrKY8J0dyR/uBUb6kDK6GS2SBR0TqH6nlpR9jyuXZA/3G9IAuNuYdMbqaOugNxdWA=
X-Gm-Gg: ASbGncujFHA9H65rwq5dahbrWtfjtPu95icHde4SssRKxoDe3exW+lFje2ApzA3iXK8
	78Oyl3eOwleW3WANOo8SHk9ME0twAbjMYq8SAi1e7Be45xzXzZy4gwxVGXcZNV+/Qt0O0oO1QsR
	MqxxwYO2ueX1aSZNd3c7MXK0ujwk5pi+1DC9AOD98/EXReqYFKaOvlhpCd0xpippaKfvjziE/32
	PeXh92woeCEoiN7jfXQjuKy+tkKyIh0jwN0wxA9UZpLq4qEsMgVAF4X1Q75TBA20S/Dt0cG+3Gu
	pB80CHEdz3FGPYwg58g+ne40TXIoKBhx23ROjFr22OEPN3stWLL1YS3pQ15gbdEsX+ifYU7Tz+v
	6oGV7VR60naemFVlT1KaRu3uvxHiLg/+tZlsD2WczqOwwyA==
X-Google-Smtp-Source: AGHT+IEoaJ/MKPD+CK7o2MydxVCmaO05jGvY7/XoDfctFPCiw8+3wLCGeJ2afHZxnC3BYh2lChbupQ==
X-Received: by 2002:a05:620a:4450:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7dde9b5ef8amr61941285a.2.1752169882818;
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
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
Subject: [PATCH v8 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 10 Jul 2025 12:51:06 -0500
Message-ID: <20250710175107.1280221-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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
2.45.2


