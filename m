Return-Path: <linux-rtc+bounces-4683-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC1B23E68
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 04:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28FC01B641BC
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 02:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D25A1F2382;
	Wed, 13 Aug 2025 02:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MyKWcV3Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F0215767
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053129; cv=none; b=Au1Au9e5nuJOOKOuIHgnBQWNNEo5r45Gomkh/j77HbcnYOtQdkyO8SplWXo2zcxjLMiOZcKV3ulCFFGtODQIyFYqfXOR1+F53mbDZuqMNyWjc+5QVnigFxO+dv4nTgui9I5zcotlbvMAFsWd3TibZJV/gaBjvdOJFEKMv7lG16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053129; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYy6ts6pKMku0Uusvsb9Dwws+K+UyiuVbW3r+2eUI3pWgvEHYx/yZGUKbhjN/HRFP/7mkCxpCLxEKvbbHIGNX8Tn8EEDJrunBeaMuk7aaYoJUdjp/U2L+xFIjD64J4KgpQ7JYT6RTAgZuGTj2iM3f1RYgJoAhSoVAXRpIMG45GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MyKWcV3Z; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3e3f152700fso31014975ab.0
        for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053127; x=1755657927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=MyKWcV3Z0g4HxbJYAQ796VKO0GuPmAXSO0Cjt4wEzjCOhkePS31NTCLtaVsvMqfrgz
         6pCXJMBTjtN1+TkyFgt8yDEK5jLOQ8fcw7lMoVaFYWAAAKsO1JloKJB5nNcza2JR97HD
         sTF0WKz0Nu6rltjPPhVlWhOKqF4pcqgzyrN8J8cx9ZMQiq3BcUi6KDdM5EtbCx/clucM
         eaSjyJdUHygYpvrIfcnVhE4PkpaZP51X90kVxkGm5qHeG7vE+BqqsCgmaVIqizq7N8Tw
         Faj8gSIu/Ju6rmQLxqA+g+ENh5UQwjcs53exVYiixG6m0YA1k0/aaw7+Y5lBzZK1nOXZ
         0OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053127; x=1755657927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=Fm2164kQ1BUInvpvAudsdIa5Hth+b5tYnRNayHTX4Sk7IOd4DohjpUS4sdzEiAKKs9
         kOqhGXEf8T2y85Yks2a9KTAk7Jy915BT+w28lIsD5u0xFp+cR9ZqGXb62ULFO2oe06dM
         aJTEOxWjTDl/IUsCYK295qHrcWx4Sux1O1S09uF/ZCNBol4X6Zx2+gwBWnhwSEcTY4NV
         15kUyiA+gBSMK9qgyeIUGQlXeDEg+03VMmZkG+4HCXLuD/PHvxYfby/dceNMODxqlvVl
         E4J8i/1WI9K5B7GtqlPftCUw2V//+sBLMZPclXgoDUobGBrEPmneXu5no0x2mzlUmNeT
         HqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgLrAivci9XpeKrmlZLw6DY2mVEvqQLuGqSRs5rTDd4GPae7egm58gws3RvusI/GhydMQV4Ebvj8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3RV+FQxflwqZYNNlnMqWvd6PcNshy6BnJe8sXVEuQDqRSLJf
	t8JpWy02V26xxph94r7Iw/X4DJ6UShiJlihWvz0clfivvLmXa4fwhrSIdjs61IYUfKo=
X-Gm-Gg: ASbGnctJku8ibvKA9+0Zb4X/6WYScQjFJe/Dxd9n5RJmuTNY6t82yMrtfwx6IB1TpWH
	VGJsotywzhSZLHUq+CxLmv8H45E2j0JtXzYNTvXTCSnrSn0HloTE0ykmvWXOl/l18n4gvUHMLm1
	/e9tGg4FULCivyj6N+dcRyn15vKg/plq4AabJwCJpWS33YvV9lR/CqD04ta48GsMt09BlTmue8C
	gPXl9vXOW3U4c4zR/3ic/iE+Xv9AsHtlv4bNN0EA67DnwVE+vZGWMPZL7ORctf8vXu1oOGqLyNJ
	MUvB4jNDG2hTJkA0RtKcg/BlriH4A1qaM43bipFGh/BwNeMHb+LLZiPmyoY3afKNyH+G4r6bQcw
	nEKNxHLlvusWNYc3tSqyYnLBiCJlVubD36yvEAJSix2sagm7otfSy2Nx8cKfB7S+Kdg==
X-Google-Smtp-Source: AGHT+IFoJ7UdDYgWZatV5u4GKDu3Y3U3FYyZUg9TQH+UAQsNUabAIk5nOGAMecrX5f7XD0yGFSpmTg==
X-Received: by 2002:a05:6e02:170b:b0:3e5:504b:420c with SMTP id e9e14a558f8ab-3e5674a2d6amr25649635ab.18.1755053126723;
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
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
Subject: [PATCH v12 7/7] riscv: dts: spacemit: define regulator constraints
Date: Tue, 12 Aug 2025 21:45:08 -0500
Message-ID: <20250813024509.2325988-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
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
2.48.1


