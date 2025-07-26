Return-Path: <linux-rtc+bounces-4596-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02875B12AA7
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2683B547FAA
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4592528FC;
	Sat, 26 Jul 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FQG1gclc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D624EF90
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535424; cv=none; b=M9jZnyQ/xDlg7afYmnTHZ/hGABPyWGG4z6HZq1xRwMLOQTqRF92tphcut0p5kSNSloOUfNko/cbdilut/4LhVTHSn5OKHUXboc1AsbNPc3wBTMK2SBwhFflXMkxvi/O8AEVJQd4ZXLraRna2Fd+GPPTpfoKN1WLdSxLFA8TUcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535424; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GolXjW+AjNAJf2ICLmMaYAZLnQ1y60H1NLaXY0UDoqrdYU/CHZEAbsPzvyNGSptiEigBZb6dJsgyiBVes+FOeSub75FnKlgtct46XGjx2QkyPVsOHlM77OLbCVBQDqtZtJHyIGc7iCEA1meFOxKWGw0mB4NpS+nge+88pAYXN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FQG1gclc; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-875acfc133dso122701339f.1
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535422; x=1754140222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=FQG1gclcMfJrpj4/g/oaNZtD5RlK4KFDPTm2TXy9p+Vi0tHwXqst19q4CcGlSm7Lcc
         Ty7YrnNLlznsBhlq1FV972i7ylEr/5TGjSRxuZT+MksNmAvhADipy5cwPLE/uVehq6zs
         UsDL2lLT2DevxM1U4fdgwNY5yREVEtCNJRGWo8n6pNjR1IQt+YtzKVjIfPpFojA9im5J
         LuaDNjbRa35Qr3/AFTWx3l8X22qcaFQjRzyEDNH3oIa9UEp6KYxNQwOva6AscUxVtaM2
         ckPywOskiH7anEmgTt/Q5isK/kLuuecEtfemBWB+yNM10b1QOtdi9slj2NJb42pXdyd3
         dKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535422; x=1754140222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=jcovj+VSolYMhlztTm/tCc9pwp+tJN2EuCoh5XVE0V3c8auTwtpIJJqdhQGliIUrfo
         eHnDOlikeFRDmkWOFSOOEFNq52vEWtumep6o7t1W2MutzeEj/yhIlY/YQiWZ+EDjwNzr
         XOZ0CWI/NQTWm2VKQuKeMJLI0spfpkOfNN26tZdrpR+I/3WVMl2jlHc28juYvKtJ5l1K
         63uzGe18B+jHvRbStEYvZqH+b5tSjgTP0BgAhs7tEPpQaVW4XBbS7Pg4ApbvHgSoxhwv
         6bxVaiJTHWg3urZB5GUzOJw7ybul7u0GiXpAiY/fiiPrOKh9RUaoL/+plNp2+5nvc42M
         Gouw==
X-Forwarded-Encrypted: i=1; AJvYcCWAvzgh2HZjUtJ+DnKpDeSUzvcPR3SOFeV0sh46QGO5UMGpRpUE4COZ8X0grCSo88BFvVfvrdsGJ1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZEvawTCsXyqZB88DXlvWf1NfofivBsoJV38j+Fosore0oiG4
	mBhwQLSub2DSVD4mAlw3/OGaqq9q5uhu9MTFd/MvTChm67nISeymgVNFCXPyVi9xuSwFQ4+kARD
	ot8hp
X-Gm-Gg: ASbGncscJtUUVB+FWe4YXXPb7jgaO8hewYCKhY/XC5gO13z0aPduprmYrvzrat2mfB1
	OrVw7496xcTr6/an1HwoL9OdhrB5S4fHXyjLjigHjQAPhSLS5hTfGM4fnCG8i76AqqpJxqTOZO2
	3AbB8ab/cM5rSBiB4PfpB01O7qN9h4rY3P3YrUYzlREqg106XDkUNumWtnjZ64WT2+EwlKyeMPG
	IsnaKRXPJNF1sHeTNCgmWnHILF8F0M230ihUu5DDa70fNN2KL4Uprz2YYCBUvuBt3YEL1K5KPLd
	jBPiHvmfv8IB4YZ2FWOhHy6/9qB2lTHYmK5lJtNm19q/DV/5LU+3N5cbbU24596cNULrRVMoH7x
	0WQt1VKLp01vnHs6n/DSRZtk8Je6WGQy+3mAVl3H7bavTKmOPWZ45+EwihMkhN+Z1wQ==
X-Google-Smtp-Source: AGHT+IEpZQvcDQ2Fiuw6rkA+hiigtzBH5kJa9koi+D0lRnfSJ/J4FDcv2OYkyFVUHNTZGcQVha87bQ==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr913033239f.13.1753535422246;
        Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
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
Subject: [PATCH v10 7/8] riscv: dts: spacemit: define fixed regulators
Date: Sat, 26 Jul 2025 08:10:01 -0500
Message-ID: <20250726131003.3137282-8-elder@riscstar.com>
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index ae9409fe398b2..a11a60b9f369b 100644
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
2.48.1


