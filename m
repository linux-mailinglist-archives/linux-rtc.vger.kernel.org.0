Return-Path: <linux-rtc+bounces-4361-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4FAE8A28
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 18:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF8D4A2AB9
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D662DAFAC;
	Wed, 25 Jun 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ByZhU4AS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E912D5432
	for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869696; cv=none; b=hRnjsa7Htu/f58q0iex1mlVBaIsIqboLgLYflGxiaWvasaKxI9lsO3r4FSNPndpRZWjD5aH4+Npwee+jO2XJi0VrfI4JrItUU03qV0ji/nCvseeZ3SAGCQ3gshnW2ZhjdIDjfLBX1hOfM+nbUjQ2HGs4HMDgtHnxrq6B/qflzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869696; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpLog6z72HxMIFQ0xKxuHoOLtlx/MOnPl2wgos/8vDt1f/BRIW+o9rh6jGuP8zgu7VHA+5gqU43xaIOWla2CWNGhnXI9sLAb7IiRGpd4ZC2Kht1Qe4ogoU1c0RM2iBdZssDCjTKuJf2J+4EwI/Hy+RoyXERKv5/jQwn3m7ru8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ByZhU4AS; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3f192a64eso4657285a.2
        for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869692; x=1751474492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=ByZhU4ASm4CXKPpovfGRQ1bXfrIbanTBNjGn/9AQW6m3/KAhKbFlMyjeMlharBhSRQ
         FGQWtgHt+Vy3KqoZg6FqaXiwhdaSViEN0sPLTapZqfBzYqc5Mz11SVyef2o+Ou4c2ltE
         M4nFBS+ByV3oenO1Pl4P0D23Nf4hvsaU8e+3t85OA0b+4ZDDCqlRKm3UsDl57KH5ccv3
         0zIrQ2PO9w0Omw+c2y3NqD23J3v9GAhkwXE58zn3bXeKnaBcFxmvA1OAJrRcGFcwwZtn
         uqIl5o2aFpQYxsatuJiU3Wyrs0JzFjLWrYQkSrEgZ5v06OWsqZ3bjDEZoO8vhm7VzoQk
         ZXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869692; x=1751474492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=bDXLY6SeBNKwU0JcXRYQaJuxvaukVhI9TZ3qgqiaxxZxnoYjLMPJemFkm8bo9I77nR
         Ahb0nd0GQaCwD1dC2+j+GsjnrrGQK9qiLmx26aAZ4tBSyDHiTncK/fAoIsvrqo4b2VGf
         OZSc1mQCA8wbTxyC1BI+t3cfMLnWu2NxwuiAy+OXBREczmTvMG9UnZSM21ADGFxzyARY
         VEgx/Ha0Y4TFvSkmYKxTee8J7vGz9rJMXbrWBKbqlz2L2AoKaljQSWM5MuM2d5IQyO6F
         TGG5FMRsLSiT46C6s62iJpiN2J2axgOPncQDPuP8K8Vdj63Md4u9+U3Lsa/cGCboWpMy
         Jzxg==
X-Forwarded-Encrypted: i=1; AJvYcCWyKwffP3SNezxZEyQMdC2w8n3xg2+XN6zIrIZIzi3m0zMdRki2FmtEgZLy5Yso+gDudxB1QFfELjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YymEXhgkNN/bvPk/qeupF73qgufd0AEBgwfzvQkuLXelpByYRZQ
	9Br67ebo3rML4GJCuw5oT1D8IDuOUGnu0gMxNvqxStuqjfTq+BuKzmc4Ana8I3G/bjw=
X-Gm-Gg: ASbGnctAYFoToUtmHwN6xEcFIx6wCJo0N8nACRyXPLricodDwOS/msCFUZWQYG788l3
	xKKRjnPnsrAbipqRVoR+COvcWhuZU7piM/cXdgaiDZuiKkTT8u2xDihebqvSjuIJygvRQ8OWpd8
	HH9sVYxKp6BXkM03gNwdYaj09Zaz/sTmRW/QwU5tfOorFnB6dK/O5nUAiWcoFkGhg8Vt5ZbgcRC
	diaBFfvzlN+aYfZ3hegSb7KveK8y38fOitrz4olgggrke3/KyNQvXFXVfeaAKcY/7jRj1Cqe+Td
	aOfwYYp8thUzTCHzdxlocXU7BZQzEJAUw1buRH1plMfQX7l+Xj+Im1N+kgXyJmr8POf7zaBC4XT
	LpghPLEIUC63S6Pmv2fwSZxvPDe5KbGRcjWc=
X-Google-Smtp-Source: AGHT+IEwItQMBBDI1vzRkKuMV76VC7n5WgZIJe9oGLx0Xn+RTJyLSXPBEu2hmGxf93T+cVf1NqqyAw==
X-Received: by 2002:a05:620a:3186:b0:7d2:26e8:d186 with SMTP id af79cd13be357-7d42971d918mr638041085a.36.1750869692268;
        Wed, 25 Jun 2025 09:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] riscv: dts: spacemit: define fixed regulators
Date: Wed, 25 Jun 2025 11:41:17 -0500
Message-ID: <20250625164119.1068842-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


