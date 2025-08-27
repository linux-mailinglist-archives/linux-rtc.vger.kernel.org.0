Return-Path: <linux-rtc+bounces-4776-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED7B380F1
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB181B6080A
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345A33568F3;
	Wed, 27 Aug 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmtj8fUq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0734F490;
	Wed, 27 Aug 2025 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293835; cv=none; b=uHsrXqj5Cs1NUVHaemBUoZ3DYtyUB/6pMbp+Ff+s6vC4L/tYYORlIPRqphVR3M1CuIpgr9q3B1Mv07DkDHKEY4QRWpCijoDOhXYOQZIUilijUMn6JE0faNl9iLUhAfaVSJ4xx4WMBNxbIGk8IJ41x3pYaOSo96zr8XHURSSN8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293835; c=relaxed/simple;
	bh=AMId3i8H8OBZdoaStosH/aFpEZPyxqzEbX2+87IwfLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5/dHhLHOAOd5FZrAAsH8pq/p6NEZrWtDyUGalYxVpcHXsJsi2OXwnNGmDuEV8nLR1lfYCSjZyWJzGqgbMDJAXfvQ/v609T4/MEHzl6EOdu1p3pwjvJxNhu8j+jbaHLQ/481jDnWH9lLwQT1e5BBiJGzVmD3jhQVaRt27c9JPy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmtj8fUq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so6245711b3a.0;
        Wed, 27 Aug 2025 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293833; x=1756898633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=Tmtj8fUqF6Q6ytlrdqC7TgvjUv0EB8PvpUNJRlX7OKR4N1dUnr+fS2Eq8XfoUtPDwY
         X505vrRAu42Szv7o5SIyE1HMudhUO2Engvs+aRGp3Y28HXW2mqINRbmampCAdTtO8dEe
         14ogUjZ/7AxFtE+2MccZN8sHOyr+OKAA1mfSwWkBvMzDRLXRuVQ1OMLHwClfRj5fSNCB
         qg5ql/pzc19N3O1d5duuWoQKuohMw8f3nl1Duo2ZQpi/8Ba2M1Ds0cuT8+1K39t9k1hO
         kCEHdUJP/x2qD56d+MzSvIXXafJB+r/aje7LQ2Ca0GRV1gbtUEZjS36bFXuVbwq9xfTe
         y5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293833; x=1756898633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=XCRNJDU7dT4rRCgqsHs0FALRz+J4PNFXPhqrCxDbo+lXFOxJNnIGVYzUJDH1PCw8cl
         Csqo02QHaJJp8uAkaeGLguBSkMBs9APY11PWBx56S10HD8rCpHhqD/AM5W3kKkLRdhqY
         bRfwG6VOYsmr99vvkujIAVv5Ye868YLyKQKIJEwQWWd+eDohgCLJZFLvhw7e3XRKqDK2
         Wez/j8+WjIGqAyFGEwTK5y3kUEA8f0+s7n7EBBgL3AdGet94qiW2TSVw7qU0hhP1oySL
         NTg1d/rOhpdELQs6Zgkz0Tjudovi48QG0QssmmvhtuerTIB/qcbMR1ilQVf36xB6g0ck
         WrtA==
X-Forwarded-Encrypted: i=1; AJvYcCUkTJgt8xo1MwGchE4qKLtkDn56i5g1E8MObiX5DpINdYZB2jr1jQjEaExUoRHJAM8sKWRaXc8WFiv0Fuz1@vger.kernel.org, AJvYcCUp7J0EYUjWs9GEMZUvrLg6H+wck04jTr068XUYOAoc0/RaWpTolbPCsN0Ssyaja4Fs66pMoQq+aZ+yxRs=@vger.kernel.org, AJvYcCWS3OLP3cabpXy8Ten+No7LeuDyrk1p5iXH1MuSh5EAA08/Mu7nzyMUusDEG0CAqGfuCwhkWAJxQzJE@vger.kernel.org, AJvYcCWV/dSoNia+et+75rhZ4j24rq+mhgLbXdLnV5qtm3flnalG11736NuVwohn9zvjlmeyrQ2Oi9wexY32@vger.kernel.org, AJvYcCWnRb84fJUyO4RVXXshKAAoAlwlwqVozgXn/K8eK7LT1yxCRUkSk2YLeO3GmyA7mNpG3xpLVe+T3OFeGvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHA0yn60HX//rH7Kw0FmmpkjzHM9ZxMwsXjrgZGxl8HuCtwWx
	dZ2I+NLvRQ9+LEoSzNzlG5t4RwVaZPamHiYOuYmhcTwD86yZQkzwofRd
X-Gm-Gg: ASbGncsZKWxG8AtVhBm7IsH5Nv3t57/MoajSUTwtFktRFFftKvEJL0p/tndWUGE8W+V
	veWK5pOxIC+CSydQYQYAB8KFLjDBBDnUg2G1J8DurFMBMsLv69NlK1cCuPJAHuxzNT+NNpl+UWF
	ZfatFi6+nkaNMdBn42OLHwQVRvKirLr3hgNf/35302bewgZsOJbyQTKSiQZF0n4MrIXkZG9LajE
	v0V9vR6q8poPhy6U1KVsF6c4bN+JpxOVIdjqKVIsSdo56Y3us+u/R9q9CpUvJnd9RVgmJYFG28k
	pSE0b5YeDrqjNHn8P2QCU54+qVfuQ35uKIKx8k9dDT5NUj601FsDQyrGgmDQ0QSL2SCbwsf7KzY
	kIK2LNq43mVeXNEGsKT0xnqpnDGzxoQCMzagbCss1BLz60vX1zYwnJCiFB1/fejULBU7CDF9/m7
	u9dcQ20irASbrQVDuL
X-Google-Smtp-Source: AGHT+IHfA23MVka1pim5iO9MIi/hUTPNfKxTfEhzgcBOMzsCRxhk5FUuT41RoiPAGs19Y4m9Q2CLXw==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-24340e06848mr28004504637.43.1756293832695;
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:43 +1000
Subject: [PATCH v2 09/11] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-9-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
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
 bh=EiTtOkgByvBW2d6W0dQC39cvCK54i0Vicx+v7DF1xC0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUfqK9yNp7KPavVUfxa7HWRk22b5T/YBDZPkz4gs
 WH+q0WdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzEM4Lhf2nCvY7aB58Uv4v6
 T3+7ce3SvVZX7+sWrFhSG/9s4Z76PbYMfzjfembO15MyPnt89Y6Q3f37jqjL8hRx+joxb9V9lPh
 sMzcA
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
2.51.0


