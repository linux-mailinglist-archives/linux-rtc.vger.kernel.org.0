Return-Path: <linux-rtc+bounces-4597-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF1B12AAA
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8105480A5
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F018A253B7A;
	Sat, 26 Jul 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MIgG3OiW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD71E6DC5
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535426; cv=none; b=CCybgBaS6HeFmJ0swAz5uLK/RVEKAlGrTIhMS+3t8tCbPfgawNdHyAZSXEDFynh34JoWGmEVIWaOXIIaarb4GsYO37cw0TSdxysbN1nQ7LZoBx56KhA27IgEvzV+yBSGtRR/iIiL8fO1iz3M4k3O3V5v4Z78RlRtA5XaTdWn8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535426; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liZDbCTZ7MHkLo78vL649EgS0ZuzwDD3IYq0VB8qKNrXx0FqF+twDAd9df0cm6Z4l0bcEQXvoecBPgOA25NlsXba6mayETqSpBkfO6fqS1+btUvkwPfCzQZfgzshU4j3Hp8ZWLCiH2bzYAa25oo/FImEqMCHatHPAE59Fa25TkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MIgG3OiW; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-879c737bc03so83150139f.0
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535424; x=1754140224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=MIgG3OiWocH0+YrJu0UW2sfZ02Qu5DeqnDLOyS1orbwuxEfznU6OWLHP4tjSVHwNgk
         c3kx5dj7SipUwFbb/6whTDp/sB0SWyTOGesoc6uKcKwXHt6wE+pZuCNy4t+xUeyYlxo8
         6LeDmk2Xk2CXiFP1UJTm2m6LEtX9PRPEyPXp8xNPw7G3FkKcWron/KA72a87pSlwiyPT
         SKSsDTWG0G02DHRlInTT3a+eION9aHpLyIETznKyyaamm1XB6pqFE4Oad9ZqPDkTAn/J
         pGCD09obhs/iBYIXdHGQ43dsDXmwvFkoPl4p09to+rqj+qbmVyn4xNyN+SoqidB3nxa5
         5uyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535424; x=1754140224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=EEHh6K/c41WX/Mgg4qHNNsvuEBQcgKiuddAvYw0BKp/tEe68zJAUvho7WDp/0gr3Hq
         TwSo9tuAcXCsGT/vW/TAu66guSbKXBlXnLt8JVzTS08ySXuZ/zlxvK0phdPuGmBcux4o
         k+5v53zJsjAEvMl3MkO6LPFF9tlg+NCXojvk7l8arSsetDLCy8AUQYrJdz7YbvOyZLbR
         ATFUqdbLVfhMiCon8JXPmBJle6H1+MC+g3UNmKNO+IkR+G3LjzZ61Nbn1OLktC/l9pu+
         qrEJwbQDBPkhsHCwhonDfILKSUukGmRz2MgF+h0jY2SK3IeEQ5BWpzZNQS/sVhMuaXZR
         PkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+9ejc98SgaPuTxGBiFMUKj9oLIuinclcVdGbw1nPB4AEjr88kfI5Za8bAKR4iBxB+vHy2HjIn928=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVmtfY4Tyj2KiRYBsl1CHHWlwgP1PhGG/q416AZ3gXFVPRhnq
	QK5m/xtQpXNOFYGxXPmp0BMD3dcZmBCXdTrPaC7VKezmlJEUh/zrQcszTnEJtlNMz4k=
X-Gm-Gg: ASbGncuTyIGJk+OnpX2FtHPnozbT5N3taGGjKiwvepAGlurEkzE9QKFc6ZmwRytW1o7
	HKjZg8bInpw+kEwOZlJQuYzdfOUiMgkdK7lMbU3HIlYszLjWO++P+wdthks/Zdp/XcNIbn5uRYd
	W5osQafqFgWe9uElumpLc2ZhfXJy1azKLgzdp8WmvNxBB8a0XWdy9tQebkHTH4kGQHck094FuLM
	q29kUq8n4j+RaAOoQTIZeBwynA6XIWl0BW0vehBJw2TNFi8/8LiGbxBcxBO1/RgYvZmZYiJ5FGk
	TaQFrIDhzphJXvd+iS9aIOsS5LZ4B2iR29FNCHYHw99kWUaXKUnYqfYDYKIcoRMfM5PHoShdW81
	DIXmrPwi3IDLCp8jByyaXJ8pB513AhhzMtd+ojbfn/dU5Eovcg1Fk44l7Bp9FQtWs0w==
X-Google-Smtp-Source: AGHT+IHnZ5VxjnvnLu84xJpltA7xsi0CvkodJCb16fAczrWGpj/N0ZZOz3kKEjYSRbp1bBk68OHmvg==
X-Received: by 2002:a05:6602:2dd0:b0:867:6680:cfd with SMTP id ca18e2360f4ac-8800f0e76f4mr1007709139f.1.1753535424237;
        Sat, 26 Jul 2025 06:10:24 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:23 -0700 (PDT)
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
Subject: [PATCH v10 8/8] riscv: dts: spacemit: define regulator constraints
Date: Sat, 26 Jul 2025 08:10:02 -0500
Message-ID: <20250726131003.3137282-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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


