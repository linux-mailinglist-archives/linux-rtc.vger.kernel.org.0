Return-Path: <linux-rtc+bounces-4393-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C2AEB9C8
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2DA1C61D5C
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3540D2E54BE;
	Fri, 27 Jun 2025 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dT+kvDuq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472A2E4266
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034207; cv=none; b=lI7qhzmuRU690PqSgipqChO9oo/Ab2gUspqv0tXPK7CoLOPmVzvq7HH6hYStBgOCziT+zP5GqD3s5UkUzBhQOSQxs4kt8WpJ2UJ2RdKsKCkBXfR2xR5AOYoAeglzgcGm5b5+RM3vWSYjwJnTykKITqV38AEJXqoTR/3BM+OQ7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034207; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoZLogxGJxwvar8AAW7ethsV3wm32QxlVvt/nBykRJFeVhGclfbHLaWa8nQOosg7sjCcCP1Q6YuX9+V/66BZoVCjQQTOGycEVgvhpnQ+VIRavcFQgTiBMz21D+cBJVsKehXVlZEtwYeHVORYUU42e3eIouz2sq7+t+g84S++ZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dT+kvDuq; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d09ab17244so198531585a.0
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034204; x=1751639004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=dT+kvDuqF1kfPGWN6JwDW+vev/qmOzlGa9RfYmZOsbIb38Eqfan9QVXZMZTveDhzzP
         yW4aJz9PcxsS0YdWHrkpomTRATIBHe3QqvgoSnyN5bbvokUnb/gvx4NhN6a0gma3yxJr
         6PIWbgCPszfeiLbki+XzYge16kwuUedMT1ii3hYJw6VUw8w0ILq3tcqnRKR/dkKqz3GU
         wH0zpxPCXkbCOPKr4IKTEtE4MjzuHkwj7PHnOQPLv1ulWVbaOP9Re78XD+GgIHHW4LjY
         1dQ1Si/RisDnIejzyuto2VC72ojx//yJ5V0BFbgWMrUI/uvufnYedKIBjqJFIcrtpZ9D
         eCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034204; x=1751639004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=R2dYzgaqaWcoC7hTbDPlI3JhV5oABn38VXgWP0BkBl5sOUl8Tgd9ZIrXe+Y7Zxfq2e
         3vsCGqPdewLLUWG4GPPMu8Fi1USQCdhZVqAcvC4n3P0xuPPLjvBJ4EcZrgJBehyJxQQB
         vGqF56ot4WLnqxqc7XuwsvpHfGxjUVzVfi4S+nk3rQOep7QkaLtsj0Ymd0+02yOqfxrm
         qm83j+VrQB2fSejEoC1HoN9en+6YinrU8PivLUUm7mzBEeFJL3HqvTNe/YNZuP3I4o4A
         C8O8cauVjYhTYsAh1InWHKcbwCFOyj2cG6a5DDopEDi8iOTv7XI8JoD1t8/8IJmasOI1
         nDww==
X-Forwarded-Encrypted: i=1; AJvYcCVivkK6smBV7se+iRkYIPktVIB4EerrjM3kDUjs4K69Z/L/TE+A2Jo2LDe/jp8ARRPjNooY9Vb2Y7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrk3vqMbnx32Z6ATir8xYXnpUnk3j9H9NcNOD82cpKl+fWp70e
	l3c0xse45jV+/DuOCRJ8WyWD8Z01LvmAuEW7Yynd59QmexWsg7qR9t9Rd6kGGFlNXAk=
X-Gm-Gg: ASbGncuUhCv8pt3gZnkeOrUNrke26f3/PsdrclDXY3beWQdhjOOsPDvMFgbNDfYsjVu
	m4GyAyT+ZG+fk7SABEM1hc8wkNzLMbMAHNvWfkkwZ3v7CPg1r2qQ575xg8Djxb/JVRdzCogHtz5
	6e9eS0nQbiBk8KCfGxjv+ThUDpIbN4m3IShyfuNh7NVvCIsUwL1Hj/L1hEIeeMyeKUIR7zDRYVH
	QImkFG4cJh5GiF05SQwcf4K5IwEzlF/2yJd07tKMPTaJfnk1H13ClI7vqNdLOi/+AEen8bXms5V
	jORwioozFFuEvduMqsYQoVpkFNChgiv1ZseHMJUp4gZuUi/fITzV7EJnOiaFjGsbPS6v8sK5xx7
	iWKcP1DmUF1rQk8jcVci0Qe++fsq6lZwDmgPGbl5Mu9APIA==
X-Google-Smtp-Source: AGHT+IEOMLIfoVtqd+xrDcmHNR6PL3WFi16wi4PjfJ1dVACxbcBTOICTcDqGxxibtiWpz5q9BS7ImA==
X-Received: by 2002:a05:620a:288c:b0:7d4:3d40:4a with SMTP id af79cd13be357-7d4439b8e6fmr452165885a.51.1751034204384;
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
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
Subject: [PATCH v6 8/8] riscv: dts: spacemit: define regulator constraints
Date: Fri, 27 Jun 2025 09:23:07 -0500
Message-ID: <20250627142309.1444135-9-elder@riscstar.com>
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


