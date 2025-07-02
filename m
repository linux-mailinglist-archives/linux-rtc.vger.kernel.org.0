Return-Path: <linux-rtc+bounces-4421-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8464AF6437
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 23:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33664E4386
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 21:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57872FC3AB;
	Wed,  2 Jul 2025 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="C1vUAt5b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA12F7CE5
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492239; cv=none; b=cUpF/eVnmsct81+VAD3OuOV+VHQhcG/ax/S4R8UhRN2MQDNUgCEncy/q8Hfv0yXq34UIl10A38lUaQJtn7NeLI6azqnPC8Dx3dQ0/q4GTd6mbkpGJ/5htDaKAR3yvnYmRHjIkGtMtPEbJAQrbcadodmnthtHlLkIXvLugiKTfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492239; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emCLfl29XFr5D/58mz3JZWwymZTqD4qGC3tUR2Y1iusscRsNLvcPhYKCHWxKmDejarup7tpWSv8R08arNDB7NQntE+VHRVRu8G3QS2XM53akF2JN3soW9w47clFW6ETT3K/borqMRcYjgvE9e2iS9hGvxuLlZeLCkvEMBEuKBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=C1vUAt5b; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-700fee04941so39698816d6.1
        for <linux-rtc@vger.kernel.org>; Wed, 02 Jul 2025 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492236; x=1752097036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=C1vUAt5bv5ZHUHJDkCGlMOohr9JhS+7K12GTsoPqYO0ZRBjcZqhQbBfdYdOfxifVoI
         53BmBnwz/nvKLUx+g6VtgXtN9gkiqXaKg+vDY4vvlQq1PLWQxLSzxSSkLzBe1TPlNeFY
         azN/gekSac7uCuholHY7Ss5F/iW2lyA24u4D71BuXI7ZWZhWMKE3EOSmrXjn/6fgGgb0
         tPA6ZGZJ2pLicfKZ5ShvlKVKIOPFKaK+zAmeArEfo0cZYgIk5TD7eiITpTHan6r09UHx
         4AAgIxlMshaiObV/bWPEN0Uog11HsXvAVq/VY/bOhIFF0LMWyS04ryXd8xEpCYdKHsZa
         HdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492236; x=1752097036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=XO+IacJWs3nqVJkxwPvegJgIZA97f8ly4ruu7lXeJNahqQ66IW2er04lo7oRcWWPIl
         5RXEbg0Ar528RYc4hL9y6ME1K8ujUdVUcDNzRZK4trCPklZhJO4Au6GTBXZ4aXpAtB0a
         9aOEu9q6IxI4nIf0cvsSNGh6M8bKul7cEQWsigAGBm3FVOSvrf8xHfxuL5eSgB+c9zKP
         OVNwccYDxhN09gkbLFdz//lEZS4uzbqOLvjwFhSSmN0nnfRYU/FczXG8EJ35qxGuUWH5
         Zz9HO5PBicFlRb2NMZblpmMnid0gBa5YyFtzCINsmSAekl5G/V1voDowtQB2tXXYL/3u
         JuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSGvtcdSY7n1P7U5qhAq9VFCbqS0NfwG5M8WFRKl6J9pMrECI85Z5dlpUhzelFstmwdV3lD238Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHuPL+CUO/y52WMnZp43kp/6VPBBL2bN7iZ/MNqABbBswb2fB
	tflBHx4w9m8evQciH9o3wpoDr/YWi+Y9K+/j/HnvDDwB3IL316e2497YKUmcxNGvqEn+WxjSijb
	NQsnf
X-Gm-Gg: ASbGncsZuHXUlxR/9y8544t/+B+/zMM07QRKjDE4Iuufk8FC0mNqAKPGKeWLpuL+2iJ
	NNtYap3OJBZErS/0MB7z+jRx4q0SEjD80o+F7bZLpNQwIWaQWk9+wNnUYm9ZgulypGoklTFNDsZ
	x7GA3rWFiFTDq5wthEFLzxZWrto9GeO0UEt1tMv/5GKOl6nqd8aNB5RCVhJtBzF7Uvjhj7gDXNS
	w12J036PyQMJAMyxwqM3G/Fbc3GUzmRjW6z696DH6QJ3ZvijbwmOiMB85zsH6Dusl8/JPLNVFwF
	wyURk7l2kNOwYQNkBz0GEDTY3eRoN+W+qbRfIYHtfmy42fg4Be5gLN4Ee+gwNxFSksqqDOxzNyi
	zb5/qGol33F9hqezLNOb7B4UfjxhhIpuWEY4=
X-Google-Smtp-Source: AGHT+IFxV9+ZN7uJ4WMWxTezGcNNpASYTQcL8SVuNk4Fu4L3dpgWRu5GuHXUlmrOxNtWzLXL7lsjgg==
X-Received: by 2002:a05:6214:3da1:b0:6fa:c31a:af20 with SMTP id 6a1803df08f44-702b1a53271mr61275056d6.5.1751492236287;
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
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
Subject: [PATCH v7 8/8] riscv: dts: spacemit: define regulator constraints
Date: Wed,  2 Jul 2025 16:36:57 -0500
Message-ID: <20250702213658.545163-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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


