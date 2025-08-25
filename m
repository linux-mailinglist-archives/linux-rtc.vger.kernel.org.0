Return-Path: <linux-rtc+bounces-4762-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C078B34890
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 19:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142671A87D74
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 17:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C34308F2E;
	Mon, 25 Aug 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EHkqQjkm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F298307AD1
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142477; cv=none; b=XL3O/G7Jn5B0tjNunKPvcBZQqsB2s4jROY8W1OLKhWujetJK2T1Nbp/9LWpmNq5SpS1TGOU9TUJcJekIYr3jOmAlpWlmwY0UVWWJdZeLgKjxWFutDZ8jFZQpr/1u0Zuttg4NViA9OIr8ApfBZrKBC5fnkiCKPIZF9ISN07kaPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142477; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEDcrm7yYH6fgjVPaH33WHwWrX1xDRjIv1aWK3sdGonV1H3T6lUtbYSPR8OfoXWPnPbqRnFRr+tpSeIqnFF61Fz1n3B+HQkUj4DNFbJyLB7cQkr23tK9M97Owq4bIJnAlxr9KQMl3RdcaDhynsVDZMd5DBFqpyb4Mkrs17gDXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EHkqQjkm; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-88432e29adcso106472439f.2
        for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142475; x=1756747275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=EHkqQjkmXHu8VAQtdYG8cdjzazIyFYR6KVsULolaId2YSJb8tec/DZ6WAMe5Yv9hmj
         B3oEm1VKK/Tfk4ZS1ycwWT4jJutHBsgHPkusAFl7oDkJ5jAh4fCAAtNl8U3wAq/qAGiZ
         bR4tohcCEaC7zBiCd0p+HGeVmmpgOobMmVN7XnB7ANGMhrS0lJ69c7Ep7dl72G0yvfwc
         QPjkpeedfzoObWjwUewS15eGBPtFFWWUTcBTZnXsxdflFBswU/Ddm1E2uAZumVpY9fMC
         e290i9mzQjWOh6rbPBwkgyjXTjqbtj/Fw+3p77BW87k/BxX/ofv4Mi3XmKlmA3OesvF5
         BNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142475; x=1756747275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=CbKaxceh/jk4MAI58N8xG/FgFJcGTksSDvLZmzP4yMuaDEV3b930MwV6IMVVBC6PPi
         gjt7lj2FWwCOON1lgMTENldQwYjkEubEgNFXjacZ+7nuRmsrIHO/JkF0Slx6GjcVCphs
         HuUZ/o8sN1WOwjOJx84/ofFcFS0M9Ai13xnjyyybHA6og/QH/Zn/urVeZJF2UpBUJpwx
         07LODYkT9S073gcqDxE7YexHY9Uzh6J+FUTEciBAro3fTVJJwozc+A8AfQcjLI3SS00A
         V8CmsMLoW1WO7uv6G0hYu8GgLbLPAaAgxyNTUum+eAt+gypkbc3avO/JH7lhu0wU7A9E
         861g==
X-Forwarded-Encrypted: i=1; AJvYcCV5JJuFV6kiYerKercazBptWXlWtbM8367mE4ZUD+N+rNvP86indzoQoja+llzOpVzOE8MUXrKMLtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY55R/W5ytKgh5J/Jpu7CgB0ChVz/T0Wjwy8Ex0PY7qi/lBTFm
	9w+FTTsDxUoyboM+CukGJ3R6t9+M/hvHvQSK3IqQZ8aJn4aNlQouZEeBb7mbAD3ITBk=
X-Gm-Gg: ASbGnctOujKiZlKRFQSWadJnjdsNA3JjnOHkCvfcZ/T6pdPYiymg+8nFlbTv3TA7Grs
	DRTo48XgD2YJPi5XGg25VN8O3aqT7ueSpsFdPMD6vY7oB+qjBeO0O/oim55eWtn6n4yWld04VV7
	wwnQkBo1QhTHv7Relo/ekzH1VYzRFiiT1WplHirLwK8Gt0ucMjrk6NagEyLRzRe8IEV+/aawXbq
	ivUMOTGkZBeFbabDfn/MX8fd65aGevrREa8fqKu66tINIbTPHB06dkMPlwu1Az/YWz1Oz65aGcM
	lZZf02VQqcrUuGDHHXP6DzIAaQ2lnffPQAJtn6C9q7i4zaYMfckXRAKi9nHYB199XDKArypGiui
	omFQbYt6v4+GQ+RhbV9ifkiT1ipjzIfQf67EDAJDIYEylC/SwNl99evu6NZkSbaze6Q==
X-Google-Smtp-Source: AGHT+IFaVPmcRIepO8mSzmP9PzGXjZwSc4TayWxRM79v7g/HByE5zJt50D0eHv9Uu2pV8a3THcTTMA==
X-Received: by 2002:a05:6602:3a84:b0:881:6cf9:b8df with SMTP id ca18e2360f4ac-886bd1baf78mr1747744339f.10.1756142475231;
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
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
Subject: [PATCH v13 7/7] riscv: dts: spacemit: define regulator constraints
Date: Mon, 25 Aug 2025 12:20:56 -0500
Message-ID: <20250825172057.163883-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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


