Return-Path: <linux-rtc+bounces-4477-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10ECB00AD3
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 19:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11FA13BBDB2
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CE42F2372;
	Thu, 10 Jul 2025 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yowRgb65"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B632F5486
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169884; cv=none; b=gNU3wm+eQBMce92TAcZcpBFlNrfTEQqDF3vAHTgvxz0u/d6UwiRPHl3J/HbK3AQV6yGgc7JwrzjfrDIXgqGVjBMF40r/JvC65rqlj3r6SetG6/wHZBHjhiwswBPc7e4/zI0lH4Xy51jq7QlrQykPMJwVmVYRSat5BpUf7Q8gjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169884; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHpOq+N2B5CxLGlW8JOk/K8VXmiN20a+XTKZmOD3GFS5Rx9uZbs0/AabAYY+1c1rKs/h+hq+Ku9joJfSKZ4ne62Ztw9+1QZTfEedjgF6dhUJHg4UE4lVVuoWzh4Q+M4A9CfBkOO1zR/UK0hB3j4lOIiTIQFuM2f9LV/btsB5gyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yowRgb65; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a44b9b2af8so8711281cf.3
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169881; x=1752774681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=yowRgb65dlYl1UwLNtYu5kyk7CABjg+hzIqxKhirf90/AmCf0nUnWdEler/8E4QQfJ
         hlRbR93GHuILIsm49sGSiWTAKJ9KxMwwCzwiOzjED4xTbS2TCN2q221S7ZLOz+nUAvia
         9YNxSFYm9fCxIYy/Prpnj5Wm84vHI/cvsdMyV98iilEazXOfugHf4rg5uCrf1fCqBV96
         lg+fZZU0Ls1TZAtZ1amP7vP4t5XqtkqOKAa3I00ed1I29CbACFaot8XDyHokUxKeAUS/
         g8LkCorvKRLPtfTPMZgJODf5UgQORHjWgsAP/tWD/nmUQUNUlUtCXvRhtMM7n7x3pTli
         iQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169881; x=1752774681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=PDbOyOTPs9JZlIH3Xvw8jMDkYZZkNedMeYnVomH19zEzeBZgw85c5ZZhds356yvGC2
         N6nSmj1ILMIL6dAyN69jl9Bznk/t+EPTjLVNLbNJoL9km0mBIPdQ8BgyxbnjHHwVJ3HG
         yQeQz5OBXpTeaBdCe6CQCuWq2QghLPmwtfLfwLI1o43DNOKJ6nZnvxRwCXW9k/uKSjF7
         Z4+M4ntdYZfyiwa2BZM5ydm2OwtMq3PCeoK4cusYq8raSYy2HGK8/cuIX42jaEZG8mMv
         pq8FzGnuPo5jnhrZVVENkrlgIjGKaxI1Mbh/TZaB3u8BkG5udOLqbrp9fk8lHvMm9jGI
         tJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamWRdfOZaUQ7fPlfjZuw7MTuYnPl8sp8vcybkIg90WjG5h+78pyKxHUszujtKwLna+jNiHTCsgRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/upz+9leLHwuyEymsmLDxP/ubYw38bZNjv4jQXAi8byEJL5Uj
	HjUPoYHOsyu02HQKAz39dWN81J6QnCHXWIrABN/oMX8DZuOT2NlTP2BVdAbmks/D4vo=
X-Gm-Gg: ASbGnctXwgyQFlGndR1xHdShwhm5PFPgsUqeWQyY/zpk+IWYz+DQhmUEsCSqofYGT0w
	g7f36W3b/tVB270HsMzSeJOTeMmUguS96hB/g4e9eVSjyfTU/8PrVFDIrFm8jUHE4zVTc3t5CEx
	vaRULWWnH3o9VAo1gk0TdhZpC3CWhcEcY67pfdFg6qHy7Uqvg3m+PDssadY6sDC6uw1ieL+OxNI
	PLqxfy4X7OgeYb11Gw/LD8cwPCGCiINebGTaUjgxfzzXK55igaCMfPCGlQE8UqZUMMBnI3lm7Lo
	wk+Y+sV/e6iu/LwYz31uei5vcBouadaIqqLV9Zn5+YrY4lDgQUsuEafVr+R+jI+8cxuPVLg3Jxy
	bSfUnpTvxvFQv/87Zipfi9gg5ndnRMSeI1WM=
X-Google-Smtp-Source: AGHT+IHBaLoGy+mXI82bk9r9JVDCOAUDtCda2f1J3UcRVBL1tXN88/2gwPEvHSrFuX0VVuYTud0GuA==
X-Received: by 2002:ac8:4e07:0:b0:4a7:7b5c:90a5 with SMTP id d75a77b69052e-4a9fba23006mr2458881cf.7.1752169881236;
        Thu, 10 Jul 2025 10:51:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:20 -0700 (PDT)
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
Subject: [PATCH v8 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 10 Jul 2025 12:51:05 -0500
Message-ID: <20250710175107.1280221-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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


