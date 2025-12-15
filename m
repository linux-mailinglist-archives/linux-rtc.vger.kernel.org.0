Return-Path: <linux-rtc+bounces-5545-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C23CBD3BA
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA833013542
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E77D32B98D;
	Mon, 15 Dec 2025 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWiv9h5N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12C32AADD
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791546; cv=none; b=fTB5x10pDcpZiFmD8XzOw4MGhgMINrCYgr0ZSKUScOX89LNYI93EzuS4L1UUl3mJTAo1O0y64rIdca3m9PdzCpATZOvtS7arCjzSMxqqSjQFznHj1bzepZ3j6SywZDPQgT2Gaps2bENYTFxUaIYw5lbqEeqM4cEpFynS+G9+6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791546; c=relaxed/simple;
	bh=WBSnoWKU3AENu5sDkwxg1gyjDJ4F54vrwnNIGBo3bkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTOLqKszrHOcUkqKTZvARDAZUeIK5Uf7EdkIfw0Hsn6BCSSWgTNBvqisjoa+4j+kxFdScN8o+c4MvBV0/o8o1lO5xARojkZtXSt6Lb/QdmKCrYO0ontpwSZZU8yfLGaGYxv/fNXG3r6Jz/+pXDaRd5KEjtU1kXM0YflLntHW3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWiv9h5N; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29844c68068so39918805ad.2
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791543; x=1766396343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=LWiv9h5NPkdPTPN/enXqezb8Pq4z+0tLzwCmTFGGHQcM2DL85g3TcFfKKB2l5qkKrd
         jsYcpuGhKGCP8pA05hhNf3IqjVhYvfWiPf0PFMYQh2zXj3mEWI1tRUE0e+KQwPekN/0q
         +9xfu2zSodjdVtrmY3pDqOy3P9Bt8IXQuF04G3McFyJvyW0jjF6ndUDTJSElXY8w3bNj
         InxW3QLJmhNdvB9AeybQXk1zD/3c7yvuZoO0qkjMCocGQuO+pixVloclYFM4R4nIixjx
         D6exkb5lvcDROnLbvD8sb7s7q2VCQ+mAf0NBUcMF8sIK92iUd9KjrSQyxLUqtdIFDqFc
         7b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791543; x=1766396343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=NQhrZoVhKy5xrJhcoJNWJ88OvOjHDhboYgPa1+Khomn5Zqo3bIWgueeV2u03GUkNkb
         uJNJwCwLFxPeF9dA4ux51ucTIUumFJHm9J1bc020IAVXPm5RWgXP18EJXPMYNRAc5HuC
         jU1VesZ9Mr2uNF27zD0HIEbu2MlTLZPQwllsZ94dHWeUmJ0MrUz6oEh2Ix89j+1ghqsK
         xyFbg5skP8hsBMNkXcXFp23LFh6hxYTtf1NQk1l6oooPc5zogu+tJgMUdSiljoikTXbp
         7O1GmCa+7jzJpPGLm3INLH2wNZaDo3p+Xj95HDjuFj3H1xKPUB8WA2xwesxrWoxolSB3
         PUsA==
X-Forwarded-Encrypted: i=1; AJvYcCXtUWUeQPL6mWUTM/GfN/OX6T7qvio7slc0A9aDrqqU8ud0TF1nnkM3VKsDJoRMOwEaglu7vpPuepo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UfesDJkI9274vV1H75fY637VQ0XFHdp3O0sn6s1y1mwvAaAt
	gtXg/M/Ycqo0d0b4deB7GcqsJjmgfF67oArpDI+yZyC0bVPBg9GcGfhU
X-Gm-Gg: AY/fxX6MEwoQgk3WlHDIgLK5yFwNgXlItFUDHxYLd3emXOgIfkjwaC1X476EZNqYbHd
	bnA1QspkwTHZjhk2gmFrohLf+n4KarFgrnkOUM/uSCG8IETIi13YPUq+a951P/l4d7ECmjg/+PI
	Ijp0chQP+MoV06b3tp2ZOOvzI4VnZgTJ5lIwIZTX7vn9lwUVJ/wTShTqXsrB33t0gSNSJy9aPh/
	UYhs34yIyOFXGzcMENzwQ6vSYswqmz5BkYRmblpLC4N9sYIZBND6L9WIMCUbNGVtbmEOiwqbiaG
	qGUTCqt2n74FQgBE4MvZkHItSvrpWimhxYfurjhLAqU5Xu+ZsNsRWeYtqzXR0JmupRahkwzazPa
	1+V51Co/5IDHtyjFRoqBwJ7xuKf47nB6Kz9GEevNr819bXd9+silnw3CqQa+6bQPwpl1Zc1B9wm
	HRlXtrTRcYW5a+Zc9jjD+grTOV6H8kRhHwo0uCRToVqkeFmdELKxXkChlygKyNXeiwAw62rZ4e/
	oT+pR2+Oz1T5aS6jwqQ460Y9dqlADvsQL/YEAw+vSl39EgTjz7UAcNgktrrvSk0ehFT+r+xzFxA
	9ib9OmnTZZcV8ywAokE6TEwml2jxj8/1Rhfmiatlc9fvPl+YH4U=
X-Google-Smtp-Source: AGHT+IE1ONDmMPxkmeJv8Jcwz9fHIvPtzkrv+UtHURTUiSutUD39OJoEqG9ODwNwY90PRcf4H0q9VQ==
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a0b02b21fbmr55998955ad.41.1765791543118;
        Mon, 15 Dec 2025 01:39:03 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:50 +1000
Subject: [PATCH v6 6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-6-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XqyBBwDw5d8mhE2yQoV9/8OYd4bvzgC4hPOX4wfMNZ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211msN8f2hHad0eiKb84X+hTfnyV7VXJHXeN/+YV9g
 su/PGLrmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATHVTHyPD+0CvUyukrZ1/yro1RbnqzLLbn6LQaFjJef3+56CtzwMcGRlmr667zhi
 x8ti05R2ebR0CvAtj48yMnqznmsrQW6/0t4ARAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.52.0


