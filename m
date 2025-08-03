Return-Path: <linux-rtc+bounces-4636-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A9B191A8
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 04:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B41D18875EE
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 03:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0D61CEACB;
	Sun,  3 Aug 2025 02:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="y6Qn/Bvm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD701E1E00
	for <linux-rtc@vger.kernel.org>; Sun,  3 Aug 2025 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189911; cv=none; b=Xf439bgOs69KUAamH7VH6GSCBmdpqW2kPeID4EYu8Vw18esIMdajiunsCxBQmMJW9srm23ke/9fbST/mQ4XUrRlLv9UaurrabrWeEXZMrjkTiRoue+PO2Rk01LLDK8ScTdgzw+ZZBTdVzR6XcrDuR0PZbwntXbbgaefKqA0Uiyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189911; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ/Z0IRgm3zK/wZKqL5PHhI7sAqvh+xqikhl5z4yk2k833ngbEJ6cNafL37VZVMyc2+8lHqoxfo2ri/T+src092NfJScvZd1ysWy2PbO+l7CdkiEtV9r1xYwzJwuZid0kegR27bicNX01XWMM6HRHTdF9eOCJC/Fim5VK7sCYeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=y6Qn/Bvm; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e3e4a5715dso8552905ab.3
        for <linux-rtc@vger.kernel.org>; Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189908; x=1754794708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=y6Qn/Bvm7zFtGniKursimz4TE7Pz3fffi44w8VYNvfkJhmW3X3uvkubL8AcwfXTc2w
         2Ivg8hZwL4MaGc1wMpU9Gsj3NeDfsDCJgIbjYzErCWsoZcgRI4R255ioGr/FYn5qfgUR
         QjIHEvqP1X9xERn1WyxAbYY7TqZHb01huH25j7ULTtPKIAPoH2XyMnfdmi8SoJRT1Bkb
         5CydB/XHpyXquG/4rUhduSnftfCmjyvHm2U4mYt8dKBtJgphs2M+gv8ePtDcqXoeE37g
         VqoHJEICYywhyFJwFLoxcS5N5Jsg6/3hu7KmzEKukRvXuPL8Ewr96cCEHxQ9PtGI94fu
         1duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189908; x=1754794708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=KKXb/YtTNdrPTuBRGZITkIpnTQYhNOLFIjmET1OWNpLsFuHI5sP0NNLbInRWKVasl9
         80K0YjfgvtXDTCNXluio5j2sXZa0AqVBffHnwrGunBiKFZF6t9vSVbdkZQDqVfS18cuZ
         eXSvPNIQ4Vly3KqLcgs8b8bSEjGD3umFTtvhbWQcw5UZ7YW7hzScRV+cnsjHs0RpxYL6
         M2zlDXb7nzv8g4iwEUH5Hgj6yWx/rlhnnKJLMrRPlsNpWcKEnOndzCVhKD9aSV5wiRtd
         8XkvF1a9dh/PyM2MKsxK0XcBeun7BZ3KyUDoCuMV1ZtUvHWhUI//8ud614BdtMTbYBuR
         OFrw==
X-Forwarded-Encrypted: i=1; AJvYcCVMLw/H+fkxbLCUJGpdZtM5lEfueKVxgIYQ+LrmPVYxrCqkIg8g/isO+aMeUujYe5837xLI+I4nt5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNZawKr/D9UvPffLZfFqJEn2L99WXjuHOub+lG/OlHk+dG99k
	oLQdF/MRJYi8MaMOmhAWJcIyGD/bOGm1A3AdmcxH8rFFnS2TQKMNiu0D5XxUcvVfzfe4pyJSGR0
	GQJ+X
X-Gm-Gg: ASbGnctj9HvhWJCZXEcNf/i6hVcxmYDpmzibYN8+mBJpIfoUnrKjDCCJytvpLvBoUGF
	dTwcGTedSZ6WJZVfSO1eRW64PLLw4gfCkcVE4uFZBLJT3lGumUajeE+G8Z4DCpgNQoDRHyc5fKl
	XuvP+wFU6W58C9EzRBDuzB3nQcyW6YnbchsuS26/LSlSlq+xk77zOlci1w3XymW+sNIxpKwSLfS
	tJbdKfz6bFEu5x7LOwP+zQrZ50eJRISEJDyOviHyRjOLAuTKZ4kpErPsAOrU9oS5bBpPOQlKxPy
	PQKhtBQE2i1Zm+OoFHkHAWalVgCEwDT/6dV2JIFw64H7DO4PdDqVBWUqHnYecnkkj/QCNIYAFt9
	DhMICOU0nNVCad8sVraQpbodHEDSaRgurkDkZdY4y6bT77ctUULoSepRJKM8RbIn1Fg==
X-Google-Smtp-Source: AGHT+IFa00F5/dr/4CJjlueOFIA5pV3OJea5UsZuFhaXiwjw86cfQMhRrHQfFtqyDPs6JBYJR5sLdg==
X-Received: by 2002:a05:6e02:b:b0:3e2:aafc:a7f with SMTP id e9e14a558f8ab-3e416122d83mr105791125ab.7.1754189908398;
        Sat, 02 Aug 2025 19:58:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
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
Subject: [PATCH v11 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat,  2 Aug 2025 21:58:10 -0500
Message-ID: <20250803025812.373029-7-elder@riscstar.com>
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


