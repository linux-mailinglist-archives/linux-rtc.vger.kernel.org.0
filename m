Return-Path: <linux-rtc+bounces-4372-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E8AEA04F
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 16:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B2A5A2DB9
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6552EAB7D;
	Thu, 26 Jun 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jcRmwtpR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D1328BA9D
	for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947525; cv=none; b=PSi55XYubdgNEs0NoW0ECO6vq0J/OV3ll3VzEDWWZKoaRPqgVR5AXwG/4083uyX3yaRdgJ3cw+aXh7KxQSoSy1deNbzDegMihPhyo/k4WFrzT+5SN93GQYspLlO/znEXHnu6sEdId3lDDgZfI5toweMcRiUtjr6b7Lnx5ugQW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947525; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kszUhYqw+SVLrQRPvwvaaYH5QEkl9Ucq9c6w4M89YvdGjm1lD0v671gPR8D6XkKFHaf7F36UvbFiOfFC4Z5OKPbEnFqVA6FTgVoW2Rb/rYr9eNN9dGpyQpd9KPEa2kP7f5dRKVM2uhs7LVYcKtcNqtKoOEqaqK+WQgudx4EaVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jcRmwtpR; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a5851764e1so20479841cf.2
        for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947523; x=1751552323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=jcRmwtpRQYvRBdaWSI6AUZX0Sp3QQ5KS5wTfL0rIPXNv7ruckBNK5y4uG1Mgw7QVb1
         VhkRvJIHEBiqUl7BEBCUXhQGhM52HAg3sCqO1ocnZkt3hnW0+7v90wPz41V+P1K7GnY/
         oSseaNWvJaM+/tGsUwvuAlxXCLFYw9eWImniEGGZ9qE6STTd6j8QHqQOJmVKVycSOsjs
         I8hd/2IcGBUIvbbPUYjCqiLxDTAtLFHmXJBobplBdO7nBDabRo1MFVtYeuQMmuUXqQTM
         coDwKYOwm7lzDqMPaO1XzPyjnkGHKZd4+/K56K6MX6QPRTO/8/h06iI38XYkPzAzbzw/
         tnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947523; x=1751552323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=mh+fegH2RgTJHZ5bEbWVSL6pBYfmf2SLjepxoonLytdiaxJHXw5Rm4w4QhPVd7yqZs
         8PneqKwDroHW9Spwy+okEDYxF6Sq9TiYGF25VJHg3bcyXY6P5/mxJLHZ0Bor8UWyZEDW
         pW8x5MZPIu40DdWcpyhmX+g6b4GDy0+vVrQ4KJhmmuskkZJnq7u3ANcU2okzkzJFY7ub
         +QJPM7Odr1Awrcgy6paZtO0Zlt+piHsWvlwTS6KPov9YIQ73JAcBSboH8myxidk6SgxH
         RX6xi3UIc/RM4E9u0uyj+e4AmVEy3LgMvEhaa6tbIWCnSaMh4b429KKY1m4olHjWcMSF
         00Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVfmVXAJEByxiTcnYooqO20n3hlzXKa84+RcjTbrJqG1GKtsOtyxsSTUc3iuEh2f3/QH8qdda3tffo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5UL0DjP6JLq8wL86qY3B9YnwVYvbMYF0JMgOpYUY26bUoCpST
	NxjRARQ7uDfCZvekePCLlm2DybAQSOJBiWSJd4Cl/OQUax6kvJm9U3FQ/twlpnrqa/8=
X-Gm-Gg: ASbGncvMjH79IPuI4mUZguBsfCqRfWAxn6/roOLx58/797X/zR6FPdRpK9TUqmgeNqP
	jlbGfmCX0Tm0gOz7BXcmAH3W931eN07ueRUqHrfEJR8GYmCQKWQYFWgd7ysfzZPfea8tIGQDjhp
	zvOkL6fEGyLl3XqmPx7tHy/vNgy6Yc9G6VqqhPN2rJ9YrJnq52NbGGInZUYBHgfXg5M0CkjiYfS
	6DwTT9CTnc2rVmte6SvNSo3laykXhUL0Vuprcboyjo9G6cOaPbiY/QJsBUhrXVo+emOZVlVROus
	IAlyUhht2gCyS+FR4YaYdL47PAsKqSAxRCYLHbnP3mECPZEbtfpT0Iqh1v+UYmFLE+Ies1NkljZ
	CCz4RZLn7ikKth+RlJ4Kj73JFBgSWgBQZe9E=
X-Google-Smtp-Source: AGHT+IG0Rk7kT5PaDL3EOhOatM4r51p1IXWy9NzWq0w2KHZQHF1mWKjHXAOtLVKooNvRWcbRmq/RBg==
X-Received: by 2002:a05:622a:4015:b0:476:8cad:72e0 with SMTP id d75a77b69052e-4a7c067c552mr130102131cf.15.1750947522631;
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
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
Subject: [PATCH v5 7/7] riscv: dts: spacemit: define regulator constraints
Date: Thu, 26 Jun 2025 09:18:26 -0500
Message-ID: <20250626141827.1140403-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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


