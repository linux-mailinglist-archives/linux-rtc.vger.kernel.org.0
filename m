Return-Path: <linux-rtc+bounces-4333-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487DAE2E37
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7C41749A7
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5A01482F2;
	Sun, 22 Jun 2025 03:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0L9HA/Sg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9441684B0
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562999; cv=none; b=RI2RL59XCJkGLdPsIvhBmWK9eEzLAK5xku6jFT1UXdR9WhOQXytxW92RF9Thucfz66tYqa/fs4Jb0hV3HyxAA8lG9/M2Mq/+S0hRP+R0ScF0DXBmqzHWr5qQiScucK3gCopV5mhUp95uxfMLcvix0lkl0Tuhn0IHZnWvoSXiLBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562999; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceCOxBNhxpoc3SOI2eiOzUw0d53IBlffcmuHAk6L+U+KG6j+lp39mXofoQMZKSZ3fEUcOZ2evb/qBJi5qwQWdWLdke5ufVbZuzJvoiIxUojJf5W+wI0sU1Qot+2FrJWgVVtKYl1sodmz7uGMETG0EiRgtao/GaHAb6c5Qf3Y1qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0L9HA/Sg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a4323fe8caso18317611cf.2
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562995; x=1751167795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=0L9HA/Sgi1R7Uge9B0xCOBTHvlm+f4IrgpAgCiRUJLMhkHehI8vad+iSN4qqNXBFKt
         OMTsVV/t/P+J1zXJhsX9cxq4wTf4eTtLcgCcUMy5mdSKxmGgCQTe6YMMJgvn4ZXAAJ/i
         AMwhAWsQ5mjyLqjeSntb9qyu538RoXakvn6PJTN3gbW6iCMlg2zwFct9b/51XHKeuauL
         of04uH9wSnvF5rfb6Eamgpw01rI0Sik0l/K03oxKiYJfpCrEYeX8txEQHVFoDyvzdiyO
         TcAEaqVmNzenA9E+7IiXfGRJFnJ9O8XlT7CF6TwzDv1Tml1cC3yEUo5BZO9yQSB5oWiD
         ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562995; x=1751167795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=DF0aZmjgmGliatZtDKfl3NgOAHEs9dZy/LF3tSVtYJ7LCXSIflk3maDzNa+2fX7bQF
         nGfAqWrps6yPG843WFo0y0hQkXBg+/tgdisTZE8uRLPF/B4i+tttwen8FEv8Z5dBNR3T
         p8iIzcNLoy1i/aQA8q9YPk6GUL7aM3YLk78tZmEwDPU6LB/MdFpsn7xkkraG0fNt4snh
         gO6H4vHZwcSR7XyzkvPdd+8WFw+5ul9vyKs3x3EmxpnIrumRxBj68gL8k8n69habUSay
         3mhV9PsNv1vZ/pHtXoo2cdp7N74S+hgGnsVlva/Jo2KqQGRzygm1i7cpTd775vDuUrzA
         E3rg==
X-Forwarded-Encrypted: i=1; AJvYcCXVl4eqvpSdeQ61/FFUU//2ood/185Sr0ZWt7rbGkr6ojYmcdwZ3prPliqq2PYjS3ZBhAQ/UH4CxtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UNCFVLVKzh7+45GjYH1dhKrqwM/H5ae+K9tFaffk7+i2/VF0
	+5sG0AzP+XAhInkNxQ86/nouovBAtJR+n9jPJ9UkQkKeVUW1epJnBB+os/y9bVgXrAw=
X-Gm-Gg: ASbGncseOp4NJHK9BQsztgaXzyAvuvmJjwCP9xYtqPfTsR0xzsK3hmQosJhDOOIZuSj
	uJ+ct33dVsslgSCvF/SB7tz3NaGNau+0orbLkJBnYsFpj28qsSzFVIHRk47HZ9vxFN24ml1l6dM
	Ke7Q8j6Adwfd97ah04AShXTNsmJni7ASJAidsOWeD4BbovKeup32PE4+gbkpzOydDSN1Grvf38W
	bzh6O7q6gKLkkEiom6VV1ZaAFPuhdbXUwoiNREsmxSdpzAs1t7u/62o+am9OzQewAj2L9soCeum
	5HT0zTLZyYxjKbm0frp3JUV1fZi3bXDXsXk5LaeIu9ISOqGxOIektdRqlNOU/CrKAa3Jk81gtk6
	g49LeoribCn6a3iXGyopXPC/Aaw4rcLYzrWvhaqByaCGkqg==
X-Google-Smtp-Source: AGHT+IECbHxini7Bpk4pSil8XqWCldpFqGPbjiNx6S6FZjM9RIZ/M0w9L9+hwhK6KfptNTvkIzyZsA==
X-Received: by 2002:a05:6214:1c4d:b0:6fb:16a:da41 with SMTP id 6a1803df08f44-6fd0a31cd2fmr142653846d6.0.1750562995562;
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat, 21 Jun 2025 22:29:39 -0500
Message-ID: <20250622032941.3768912-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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


