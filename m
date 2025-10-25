Return-Path: <linux-rtc+bounces-5158-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22DC08725
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 02:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84CF95663DB
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 00:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E924C1EF39F;
	Sat, 25 Oct 2025 00:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcQvV3mY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F751CAA85
	for <linux-rtc@vger.kernel.org>; Sat, 25 Oct 2025 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351972; cv=none; b=Kamyfp89sGnlQISDe6OySKNDmUAyQRlkw4gqBPFovHMvix1rPsqkZG9mbG0TIJDogGENB2PUMobGSCxgjovLUfL/d7PGvjbjrQ+GBTHX20L6ypVTgKhHK6bbnmmsozpM7DYm9MSVA41byCSUGrBEZ912RBh6DqPOiJ+jsbzfaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351972; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEULTv8hU8ubW+VvNL1yXioE1imumogShHzEQnjaYV5DTCiXr+CP/M4to8SjFDtbaS7lF+gGs11Q012b8fkqnQOvfRqLP2dMAmNOUbBq7CkU+6ClrVKI/w1B+bfdhQ6F/KFQ0JSc5ehLZVtFLMvk0O1t6xaMGu/ZuFLG4Qdq1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcQvV3mY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290ac2ef203so25042155ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351970; x=1761956770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=GcQvV3mYF7B79ax1rkdHGufwtMG6W9dGQzFord+OUpGkacoQg0jN7nfbKNXE521E6U
         R5nRPNDkFT1U8CwHl45pZVVxU9AEmeZs2pUQitf1SGSqtPuIsXFCxHUxV5cLuPnHPG2l
         hxQW9UzQIymVogSH8cJYMpz1MWDxqjby8jQZwwu7DAt4q942BqC0BHm12mK6S7G9jvYo
         0SHhBkyGWjCTg227X5bAcMd9reMmYnXaWxpgohsE7iseuWWzyiOa6haUiZUCa3eIaZFP
         7QijLqNcSpB7KcRnOP9weLpKxCpm799XtiTbJj3APAUW28RMXlBn2SR1RmemD0BHDQCm
         0BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351970; x=1761956770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=pZUZn8quMQ83BmzUPcNsBA/FRnzkAFfy/+Z/1cVPJI54MHNtHyBRTB4uFGuXL/BhpC
         PoKzP9vw2kV9prb50dOI0kbkIHgLrWob6vtn03xidC0tVAlsih4n6cUmxXJ0XjNRU+8d
         Ah3iKp8Gguiadgi/vuCc5Lz1wlsGXkLqzDT8c48hl28PMCOkyF9WnyMLu3WSeHC7v+uN
         CHZvyTgLvOL8ynfrfRTPZFja6tEUAx6dY/TeAcxzUmmS0n+5r09akuoq9J3pziT/Cc5C
         z2dTgO9/Q6ypwpGuhpe9LRagx3OwKT6YP6KTaw9c325rWEmzFUnU4VQweN6o89ro/Wv2
         73SA==
X-Forwarded-Encrypted: i=1; AJvYcCXAvSiN3q7ENO/eR7JVYyM7Fa8b2tlwwTwbLNHdhKz8wXC3PZJ/n6LKPCmzGfAf6wScQvOmxg4eTj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tkFOtzUSzFSOi0Noapnt2wnwcKlLwBJSSBk1y/eumDlRAz6o
	a3gps7PcTabcPa6mAtYqZMntrlHpFgvhZTeZtwjJN5Es+2Oy2MUpAyAi
X-Gm-Gg: ASbGnctK2SsRhDMG2tr+75Y9bA1TmW0RbS6oIG0iDoqkq8L+i7UX9kzx34T0A/2euqd
	L7zSQmmlgsHwPFWpbdreBnLlgL1TqgUHbdJ1v8dohANoRCOs7amWEgud4Zvb3zbV2ZaEW6ZIkYZ
	kUAoFRioXl2ygheLmSn0Yg+HgQPmuOm7aAOl9M2e+pEruB7tkmNJCw1q4zU2OJbrJmZcWqWnTFa
	FPCDAsAR3iZKOp8fbZEFMG94/Nq7HiDVWj++fVt22dWOKeuHHdHH5BFzQeTiVhcVm7iAoTMOfsy
	JwfYXfGboN3yzpqjLI+2VpCVG8a6Zd+046nrTw9HG9Ty4OQev5r021RFi5nb68cOEuB3CzwomlB
	0PyQYOUxd6KMVd0sNyxaymHQ1V3ZrQuqMBqnp7KYNgXQgPhi4ZMCG+m2hr5WCBvAmY39tRB7mMP
	WwFSMVjCvT2DnFAaHFF3fbhoXdFJiNs47y2cQECE/SWQ919nhpRcEuMhm8pml+aaiMhN5r8OlDA
	r1ukDNQ3aL/0T15pbSikhK6FNsS/oflj68sNJiKPc3fpnegvxbBmw==
X-Google-Smtp-Source: AGHT+IE8KakcB5GHMGG8ECARmltmRt3k8h0a0+JIbETOJrnh8ND1oGT/dCjWnKYo35ORe4+xL9/X1A==
X-Received: by 2002:a17:902:db05:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2948ba5b73cmr48845065ad.53.1761351970277;
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:41 +1000
Subject: [PATCH v4 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-10-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 bh=2GQnZlbwDgkFgLSJTTlkgGVtMUC2q8Y46wlmJNb88ZA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM59fOHE8XGD1q5TTvfe1J0p3i1UNPndGn9/d7OLU
 d1ZTR9rOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNteIiRYdmlmbkMnxU871/kSnOszjRcPnf5/0tbq3w+nJg8l2vSeQ1Ghlvlif/
 yF+yz+2l6ZbLx3N8bhLcfEPusO+nlav2A3Ss3neQHAA==
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
2.51.0


