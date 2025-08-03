Return-Path: <linux-rtc+bounces-4637-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C54B191A9
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 05:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9C2177E98
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 03:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DC71F2B88;
	Sun,  3 Aug 2025 02:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sFD5XxsF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30511EDA1A
	for <linux-rtc@vger.kernel.org>; Sun,  3 Aug 2025 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189913; cv=none; b=MFpl2FExGZ4y5CobRCutSALbzXYsesd+hnq/PtomK0R6+1TuQfRblx29F5HEVsWp48XA+1CACLH14MEzFMfJiyDotxniHjEucBiXb4rCrE42sKrQ446TwfuCFJ3DSUuC9jPlvNSaQRiUlL8NBQINYMbiUOh/ho5/Wygo2XFSGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189913; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jm18DjFj9by4IEKEeKzM/z5FfS4ZjtTSsoFHfr1B3Xotl0WLCoWAtEG/y1Dxium4OVKy5wi9s6OxWo/OOj9MYHuiSC2pRBsd2ULNk6NyYcOId7VvtLIS+kTYAd/bezsWGW0cQOXagV1Am+Jo9b7/3evNimxZjXcLT+Q4P+UEegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sFD5XxsF; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21106865ab.1
        for <linux-rtc@vger.kernel.org>; Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189910; x=1754794710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=sFD5XxsFKxmWjE+uyL6WNh/FBqGg2Rga1WnnDeMjvZvQ87Qz0jn1S3UScBbBGGP6m4
         lVet5W1vZKghiHySyX84g7nXeesBdwTi3xVWihz1kBOTPUfVZ3fmZYIxR0ixqqz4mAng
         oAcCi/U0juxHyHuYn/2i+gzNRdp5Lj6bcIfMgYsVLImWsx63N7M4gsFlcbxXALZ/hXpR
         /XHtxvDAh7OTZjzI4KcWQ+keg67ZNH/ATSNOoRZSrU9X1TvFEKdBB/mgVtC+m7BoZGz5
         6Ny2I+Gjg97LM0jHcVUGJDOa6yfXQhLKLBcIhIPcysJOEoD7QGFCNcFhXjHa1JYfi+7Y
         d1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189910; x=1754794710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=iHoZJDIpgfxcnVJM6zgEdOjSJ4yiFY3gqu1sUPi5hVN5faonkIDb3Qpeoy3w9RaNkw
         vjZxve3IQCDeTgyonF1w+S8ARuF9Ns4w4yQ1JgMdoFDqKpb14plIhRjbgy1Ae+Jw5neE
         FFU6rN0Agk/qGs7tkXqr1fh8zYyi/mYnAXKR0ZHFiQh6/4FL4reRxBUafJUKE2FkD7QO
         n+kk/TN3mODjzEnClJHBt8lVNKJoq+HPpSvdjZhvqeI4r0Eyf4sjAZFKd58b6FzMhIeQ
         D0B58T+v9fxpv6t8auWbLMkIGMrNSPajQnWWWEXOetsyNktZLRigXvzpmNXNDqgCVTZe
         hf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLHzSp7F9ZgMYEdDJMB0jUT8AuaWT1RIh2w70vQt7YABtOSM+zAHyMPp/JdVtmjm9GeqtWXi83iKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfzro3HaZYLbNvmzjKht2UV00VTw88y4LcL44TRH1QgMPMPGm
	K20Rb/MoHm6ymyUnELVvAQ8d7eRB65wTRoI1U9iMRdyHGdEXy8zSZSXrN8GWTrRdppU=
X-Gm-Gg: ASbGncvszyn0WN1KiPRSzmiqSf3ThSotAynR6bOAGRDkkLcAsSNODNYw8JGxMDMnNTQ
	BxWGfbtBS1mp0EoXgZWKz+TNIITproiHEnBt6RmTYSCnxU1iGf9+kNoun+fanrg5KILBb9q6Vix
	E/6fWetsuVm3C0MchorpXKXCnXMQ9CtFFU0KgJyslDZcDNrvVda3dpols6lAgLIs/K5oIXc08GU
	MzaqcfqvxvLhNnLlGYt8z13EvsV+4s1VjOpFhJ5vMKVQB45CFSpcsPEKWMzXpC1noTaJqGstQwl
	ZAYRRI/k8HaQ1k6T2BrK/9vYherFJB/yXBW4OdcnDlfuqAM7WhTR+ftrQH6kd/SENoha/0K8Kdz
	CQN419FZFhX0byBranjsel7Wb8O6wgTuShBu2l/ZDL30Ta/eig1t8FHgTfqY7Ls8YBg==
X-Google-Smtp-Source: AGHT+IF+PU1Ww8JQGqYmDAP1BywlMvxMvsGkL0JMtzACHATEhfoG3q29UZAUTYQ4U26WEgaiO5kgRg==
X-Received: by 2002:a05:6e02:32c1:b0:3e2:a749:252e with SMTP id e9e14a558f8ab-3e416109acdmr88472255ab.4.1754189910159;
        Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
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
Subject: [PATCH v11 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat,  2 Aug 2025 21:58:11 -0500
Message-ID: <20250803025812.373029-8-elder@riscstar.com>
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


