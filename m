Return-Path: <linux-rtc+bounces-4580-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BAB11246
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C67B1CE7C91
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6939726E70F;
	Thu, 24 Jul 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lcHSB8N0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA6E26C39D
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388731; cv=none; b=LLVnmt949IhIyANy+vQ+Oh+lQFJ9/JAehAPmtvdyjvx/N86v19uDnE19iH5lgrH9WxnqmQ/biKfz6iwnLhqdxttWo23B39Pw2OgSHkacyJAj2T/mrzGkHQRItDG8uG+Jn45C12SwfzRka+isCA3UEGlZeYiITngHlZs897zIi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388731; c=relaxed/simple;
	bh=jwtN0xCvslGhNw0OABByaDpfspJTfiR2J4AISKnWXAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN+idoxv5BKn/VJuAnbQJwG/P7HNFKiw1SMIV9UkKQKSitGWh2rBggyR0igUK2YuNQTv2Ypzf+DhX/D//9OdBWOr+cXB4AAduVsP6qRdzcQmaNfnvS+c5hevlJQg3IlH8WLUHYCPNTXD3oWOddd/MefifCdePF360qZg5zcCdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lcHSB8N0; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-87c32f46253so48542939f.1
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388729; x=1753993529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=lcHSB8N0Vxdjg91au7/sOHy9D+49+ZlQPEUteDYPOKjumUkpz+3ctegZDYkmk8HHJT
         6xEerDisLjs8GDMZSaz05a1kUmjp89YroNWO9EdzXN8L1atWwF2rrvkQKg6vh+L3Pkqc
         85AZ3LwuzbTFuPFwJ/rVIBzenhzsyQBuYNG3e+Np3MWdlSoq9760xeUxmuYQ150QG8rC
         B8euYxpgQ2mhKCWBG6RHoHceG10UN4CiyvZh/EvJOUua9Wwx6lvOTRD6bchcN+dokjYP
         zgm37niX67vpk/XxjY7QjX3In5UVOrvOFbUdfc5vRrUKyeJKUf/awauJ+kXmfBEE81pK
         uoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388729; x=1753993529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=hpBzgHqEHoI9vzp4alzEvyRr2LGeBIwx7uzlp2sqyFGTa8NBJhao8jHBnTl2zYMDuX
         mfJnjWbrkMlAdYOnsuHnUvPgWn/s7euNCbifPybymwZsv/z3uFRsvtlGth2fnXrVeliy
         HxSbe9qmicrgr3xLDmWeC9CFJ5jlzuy+DBV9FZ+GDEqgX3hLRWDVd0oe6h/GUDrML8SP
         Ss9/yzWmboREWn7ZtwIPskZQUlRvbQ/bDcBz3Bg/TY84Ho7Q5PRJIvq09r8E1ZbYdad1
         5f0R9/iq0MDwTVS8fUZVQg9NIsc3G7hcN4YYXb1lEeOvFeZ+dXth5rpMye1NhVh1x8AR
         38eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaJU7LDLpVsyq5F1s1dSa/20gUABps0rziPSyj2eyGx1pErH2frVvzZq5ZsMXCgKwx7jmhI8OMbi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPrYbKBK1eCyvPb9hMyvq7cifw0shMTObntzAz6LA8T//Fpvh
	L/R7szSv4N4GNo/kAxmEvMlKToWJztP6wC4UccDjRZlazTyGsgugmeWjwsfnffg6IXs=
X-Gm-Gg: ASbGnctlumy/JDSGn2RbgnGfAaml9ePuFD01KOrHq+4pD8MkhxduhHp1ScORUoopoPi
	RGCF8hGVcvBKpdtJpvnQ3y11+q7L2BiioVq39/Yjk3gZ3nkynnn8PRcYBaGEvYLbau5IrKpY9RR
	AZWdrZ41szRJOdER0vliTseUsnWQp2gMG2PeS3/SigBpOmk/kUqzhkMRuJ0pQlNdb6vMyOgdmZ3
	2cwoI37R88L0mSmmemcH92ZOxmCgIl0jlFtVv39/VDUPG2pmBF+hV7MtzsvMnzbLqbq3hbNZAxh
	s21iCLyViBvnZ+5z7oeOL2GgGTzaK1OIIAu7mA3BI+QjLbFg1R7zVtde/6I48Eyuy7nQkAOwWJh
	FTAlVrsBqo06RGvqxeX/qm5W8krwIJe9VnFDFcrmS
X-Google-Smtp-Source: AGHT+IFA8t+gyzjGKf5ISSrexvmdiq2MvEH9qXOnl6ziXQ6Yu+XepclK9trDk+vKuFcx+/4K7eM8jA==
X-Received: by 2002:a05:6602:6d04:b0:87c:3495:41b3 with SMTP id ca18e2360f4ac-87c64f2f532mr1543017839f.1.1753388728685;
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
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
Subject: [PATCH v9 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 24 Jul 2025 15:25:08 -0500
Message-ID: <20250724202511.499288-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
2.43.0


