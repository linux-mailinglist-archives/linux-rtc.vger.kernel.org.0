Return-Path: <linux-rtc+bounces-4332-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D038AE2E35
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ED951749F8
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647A183CA6;
	Sun, 22 Jun 2025 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o0/fpa5B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173A0149DE8
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562996; cv=none; b=AuCz+oCQEnSblBGM6WfYwz4lC17Vh6MylaKobnYaPWZvXveJKqD+Q+wa6t2Nm8jRcqL3AjO5sZIPr7Hb2yo2+crz/v5PgaaLLM19w69E6ulKfdBHGnaBTt1kBmSw7D3s/ZXSRIJHVuTYpCkq/msJsjvT/P7c0R+m4FN/+Ve3Jig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562996; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcqTqmYI9dQuUUeGx7YB2Qu/+dw7f1AO+Kn4YB2gtZA8dKWly6ZGljWyPhQsJZTI1HUHdZ//h8vI7Lc0iPWCZyVaciCjMRnpKabfSgmob1oTL849FpKdv6wx/GK8BgzXJwCyqIAu9JpvtLdSTobElToxjafzmsAS4Gbq4IGA4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o0/fpa5B; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fb3bba0730so36398456d6.0
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562994; x=1751167794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=o0/fpa5BgbaGZTiZLjE3iww3xG6/TJyz/TW/RCsbN0owQLb0MVsja+BleejVA6C0V/
         3DnO81f4hWaqFBSvpOUw+ldXg2BRdxkP4vP8qwCkq3ElXYMe7SYXFRinpZhiXLWhOQAi
         qI00pGbXlC6P4hPFfFL3cW08BdZhI5+C03JhuGBguSKrj/LuqbLc352RJaUMo4R1zKgZ
         W1K06iTD3abiQ9NBemY2j47iPEOfXB3ujqQ3es2YsCCQIkJkEm9Kzv2vGmr4WQkr9/4K
         FajuhXZNTq88kEl6oflHzT5JTOuxpy2mAi8Laua32wcwJHCuu9U4aBqQIIHEWoYMNJbX
         zWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562994; x=1751167794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=X9GkjryENMaZDYgv9YuRLWA2BChKL1mByVFWq6gHQHwmn+SadsqCYCErQPTQtgx3bx
         C+ewWTGpCn2wQk2LO7LlDJYRzVsiUH3DDDrappEWLnnfpyjRBgOCFQ5SV0tjx7o+z3nk
         kYP7Wecp8kbpCoBuE4ANQY1N2P7mr2EbqoDNDb/NnfqUeA1SCntpJIa7CdHkx/cxytyp
         TF/y/ObVw9hqp/ZDb/F3937sWiOMvoZQJBGtkiXpBC6ckNr0lLivH+LT4ACOUPsNDKs5
         TOSvLLEkVjugKsKJ0bDuVJyjhgyijQobIxd3i3YN/gCr6ehiGaIDEDUBUlIBStBusCSp
         B04Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0m0BQxM0MYaONb8gv303LAOoaWz27xFu0i7KvH7lKRkygDLBsR/BJvEBFPr/9PwgST+C933ZPyYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/K1bJbGNWyUWAsax4gAX6fvUqPraod0Z5Husdn37EU3GpZbPa
	OCCJYl8AC2uSg51mdZ0Ul70Rcte/xCrM/3GiH38EryjYz22JZ+nuUXus4/qonEPPdiM=
X-Gm-Gg: ASbGncuFKj5MrUmqUzjdFdGO9daTdkfFIQ1tQncz7DA+fk3h1aOK7KLshdApNTamObd
	7dObVc1dHDABtbIdG9aHgbzWURR19n+EAKFXENzQhQjtNAeltBffNbINYeMIF4iiPfRYS/nl1fb
	2msRNLZSE5E2qq5MpCkMAWHLxBGkE9YaV0QXKTYjZVZ+wx2fKKQDwUFbEt30G82bwWVcwh4PhJ6
	zDlAex7eYRJwcqtjUZ/Uy8/Z1/IL3yNgMYiJ5KyItsAqIACzMvDdbHMf6y7V71o9MG3R2rJZojo
	C4eCV02/XHyFGcNvFSXTlKnfGRR8kCCl1lPzwlIaiDl8RZRFmkAmlowMqS0JKQytT2GbKSJqk+U
	33bl/BMdYWB5O4V44CutzteRB2US1mGSGKqs=
X-Google-Smtp-Source: AGHT+IFx7soANp4iyxPjh25Qy4p98v7iDm54ya/OEbJv3+HBB/XlyEpTgKQt20ORZjbaNTVgNKCyAQ==
X-Received: by 2002:a05:6214:3385:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fd0c87da04mr119950596d6.5.1750562994099;
        Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
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
Subject: [PATCH v3 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat, 21 Jun 2025 22:29:38 -0500
Message-ID: <20250622032941.3768912-7-elder@riscstar.com>
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


