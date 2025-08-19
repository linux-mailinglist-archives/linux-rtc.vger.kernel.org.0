Return-Path: <linux-rtc+bounces-4721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C33B2C22D
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD984587657
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622CE3375C1;
	Tue, 19 Aug 2025 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJHeoJGy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D803375AA;
	Tue, 19 Aug 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604132; cv=none; b=Z/SUujqL06l0b3pDIDRMNMEQWb0bIc0sOApgxunsxkS1VVujPgKBZMq79Tfu98MK415roW0Aj8yA0+DzIOE85PoRZyjTX9iopyrwo0Dr8m1cc5cZHLMkluvjrzToZy0hNJdOxmBDANcm9WkcioCxOoHBTEurfcHqNwASkH+kmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604132; c=relaxed/simple;
	bh=age/ppvC8S2VtISNKcoiQ4BjiQxWW/W33qt1sPYP8U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBlDTrGrT6Co5lpeSiRggCvU5t6wSEt0dHMbDzHqXnAFqos+G1XQLb6sh7GWyXj2vnkT4s/LPQGZIMHv7hGvYSr38J/nM61M0ZOJ0xITqOJCerV/zg2N3Y3fr5o9fr3mabYBQIq+aUTTeK9TWFSM320uPrJZkN+KTrUce33d27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJHeoJGy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so4518665b3a.3;
        Tue, 19 Aug 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604130; x=1756208930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=dJHeoJGyoKGs8fhI1cxYOViMGDWTvsvEbhXZlhCg8ibYdXBhv8YH7y23f+4p+sGVBt
         2Jyt78F0myg51yfU0Cr+udUHfyQkKcfmXuh6G51cKP3wjefNtBtdFDKi5yJ5DqUuLt4J
         sOwG4+o0A14BEYpIDx1dnXeRpP6VeSIXwzz+QKQ7C4NNDgSrcgzTeUA6jIZQNZhz3ibY
         SXqag30j0lEpVp7YGLvdbD46MmpoXlBEcsWiF9J/AuVaXXjVN6aPMlJCax4AUZBrd99C
         E98h9LOKXYXO3u/kD2Ok3msmnAusI8idrQOp//P8TFdxpFeh2PyCalt0AJLKUQu3VDcl
         p4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604130; x=1756208930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=mdHQ+tzqrIUPgXtthajF9slewHf0rBie2x6kriD2ta30zpUFAYGrBi2RQwxqgVsFO5
         QDGcXpsT+DIaYem5eylDx9oKax4AENmCc8r6bKyUN3TIh2F4NvGWC1xG/WbL//ZEsApV
         YwLfYMjTZx4gBIG0P02aNUltc57Z2Dlo6BQDgQNBC1w7qcktvu0bDVBDINfGshab3qeb
         ZTagwIhUNzXYDRSlVqBWLXbJqj7mwcW69KrsdZO9NUYIagbg8CW3Vr0yf5+QzSL9IKqY
         XQjT8kE7vx/z39xp3fMSSerSAEOa/RbYFs9NA4oEiJp9L0OSR0azmINIn1Ys45NqyVcK
         Nlig==
X-Forwarded-Encrypted: i=1; AJvYcCU9x6ryPVSXeYgAH2ZKod6AWRF9IG+YckrfkE3/ISJntHPJtdYF5sHVrg10DeGgBvzID3mMG4M3qCYcN7y4@vger.kernel.org, AJvYcCV1gqb+F0hN0YCukh/NeHWOuAPTqLB6HAJEe3z7d+Kq/c6A7iDHS6VgA/MSDoJhPf1N5dfrXLZoCqxGhO4=@vger.kernel.org, AJvYcCVdFDvaAP0PRPWutxzSn6F/fRX4faD2OjcYl0FqfaEsemjnsJVrrhUtybo7ybjuX/pMyx5xQFmW9UKl/M8=@vger.kernel.org, AJvYcCVhYNwGr9H/m41Q/2lMK34ut1lMNlKPrCDrIFlY2RIKPWEnQ/VV7RbLEaDRzuFWFjwUSeIFdSVs+HW+@vger.kernel.org, AJvYcCVtLR7w5TNG5uzyc287St4yjPYLwh/XF98wXANjkKhcqOj5gsHmcaxz/gAvQ5hPRxYA6TAsVN/ZXVTG@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVw2Bz/5t8dxIBGIBO+jZzij3sP2gpL0ogyaX7iAvtTQabCGA
	hAEkQqP7tcSBi6PmBYnVU/0R+xpxvbuxjBEG1AjYvL9u6mLaah01j88swIncX7OQ
X-Gm-Gg: ASbGnct6tPgCM0C8ub7UOjL8rXtKZKsXobEOEjxZ4+jowHArF9niCMInJcHjJcfXaKc
	qJCdWoDfWJqYOqN91idxpiNINrhLUbtUt50dF80u341m3s6JAjAYXpCqG/7MB7ojVNxoPw1zKh8
	hwZmvhiEDSk1BcnOxxChKeammS74MYHL8AFa+uPKrV5njQ8RfITW4d3GIW9qbviPfYWFkJLCl4x
	JdoHvG2pQI4HfnHX0EMWgOQUTDX5I3oiAo0AKD66sXWhdg5niataasy8Vncc/HcbmGgRrnkwDCt
	s/0zGvTAMVEdDodOn9iE2CnNdTw1B46Gp79BBBmtTUXtfHYilwKfHEFUXEjWwyoUDuJ+sm6j54W
	kEpDpyW17i4ha0CT3zmg/j1eiA9m1v5pQ94pBtnzujX910cL2+Irnc/wuIilFYPxUvqQmKk/3Ws
	I2zDaFbhdVazP4y6bnvjYAzyKIhw==
X-Google-Smtp-Source: AGHT+IFQNdCrZjHseP8SjURS8RzkWDQljSWopIJBsCZNBWk9P/4UAE6BKrcOCRHnIvQBOQaytEz7Kg==
X-Received: by 2002:a05:6a21:6da5:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-2430d36f5f3mr3185360637.13.1755604129897;
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:58 +1000
Subject: [PATCH 6/8] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-6-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t1iXcsQQKpcvwP43mtFXoSktvnFhTteQzSXrmNnJ3bo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvL3rGR+/Crup/Hxy3uNklbMV1z7xmOFF5duxUpzH
 +7d7BotHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk0TyG/5FfJxbnH5z95bbm
 PS2F8nP/G+oOyu1+0rrsr7mOe1eavh7DX4Hw7YGiK+Ju3fir9Wqa7Y3O5HSBG4c6RQt/hz5d7/p
 anxUA
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
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
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
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
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
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
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
2.50.1


