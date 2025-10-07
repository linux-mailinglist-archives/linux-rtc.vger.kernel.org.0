Return-Path: <linux-rtc+bounces-5065-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54CBC12F7
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 13:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBAF3E1D18
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 11:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E0F2DF131;
	Tue,  7 Oct 2025 11:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYlzwupD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4DD2DC78F
	for <linux-rtc@vger.kernel.org>; Tue,  7 Oct 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835918; cv=none; b=n2TQ8v18ouTIRd6khxUXoBdunt/i+3FD1HUo87+07vNmkkyi+G1ws1m6bnTpTs5joi6FDKwW4CrqwSIrYo/DF9APqg6BvTlZ5zMOueXdyBSz2rR38dw3ktMp5tpI1wgxk39i31OHG2w8SJ5fQb4OjryIQtXx4QUqdHPcHdK0BDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835918; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayDFUhaxc0muBunDeVE22ZoVoYsX73rJyeQxJ2OygYaiLL+MGWqoZfOsaRGWvE7nQXmKcE3WUYRnQCawwE1yKhzYe+WKImw2LuWCjXtRXkePlVRU+QlLdyeRXOHscAjSJyKW3SacdaVl2oo+JKYfVe+jZscE2104/G/w6SaCCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYlzwupD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b553412a19bso4390603a12.1
        for <linux-rtc@vger.kernel.org>; Tue, 07 Oct 2025 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835914; x=1760440714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=NYlzwupDGThZRHDRSJ0IzlInDTU1jpda9LFB651lWtvVtPAmrq9fftwnNnj+eRDorM
         yZwrHpLjr8nVBFhbVu1UVS5auim9ijYrlm4hcdA78VZoNgKhI4uIlFB0phQVp58Jj5C2
         zgt9sCwdwgvkKKvG+7yUChG1Ly4xMkVkma0XaicEwAk+otAZOmJ8idSRDPlmVLjHQCf/
         Sj1tWu7xB0vQFPCOeLQWHVKazaL1Tz2+HoAQvLoyRe4wpYwZy7EfWq4mwIunnc9KD5QU
         eihl6r8dH+xJqOGRbNpLgU9lX460sC79OTbF8dT+T5Z0geQgPwYwRybBpA0DZ5tEF+fJ
         cyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835914; x=1760440714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=D3GmpUyQVzM8yFfXVS/MzqHO+yDZDuFVdF1sQhB+qHihHapX852OxZUDNsonG58SSR
         1uWHGdPZ847vd582qylDpMq/kNHQtC4PVPa14KCBxGkptJEEqqiJUSSDrN83hTEcdT2f
         CAFtXPZOLcU5R8BtAS4lIY1bLwrZ0UU5JaTRliedTVhBw1dBqFp81NpRki624F/nhUYm
         v8UvBWDIV68So57BVTdy4FGet84J6xCM4p93389ITN2AqimATO8CPC/o9DZ5q+l00A9/
         B+DG0dQP9sWT6Cgfd0vj7qCxqIsD2dFh4UiWTcJk0QtOFhazoncc59OfJBcw/w2s+sgI
         y5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXzol+mbeDTHuvZj3hm19QswYi4kLqPEk7xX1I4vfYv3iXuw0tj4Rvqz/qxcq9WgI8dEw6duv/JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFk4EjyOSQs9li3Y2JR+0tsNKFRgzohKH7QiRtyA68YxlA4olB
	Gvxi+/Vw8jCRt119pJ+aQ6Wltt+sLsUr5Ann28Ax8qFOZwVXoJphSGOt
X-Gm-Gg: ASbGnct4Tn6B8e+MunsFMYIAdFn/n4k/XULS+udhZ0MhKjqomXSaYuT/Bdw43yItXOJ
	Xd0oE1tMmMLhK0F4/17yIxQYTSExvk6Mgp3gMJljBizk3RCflGyBLLuevayHv+xU5UoTD1/qTdQ
	UvHyDBvyqr4FyT6JyLdAnh0vr5j+dsmB7ax37T3Ay6amtg1GCCxChpRAfq7uLIimj1NIn4CmLJ+
	PavUgQNez6CbTeroTB6HEoe/9fbo8EcOPVgtO0XMhR2w9Fxjr3TSLWchUu8ZaXqlZWqDubeoSn/
	pkJB//jI3eZJKxaaNkyf6IGZ14WYubQqy5oMHxi9Rxd2QXznbFbOAxUtT/gxff5ej9iUOC46AP5
	RCU07SZtW+WGs4F3aVXH6qtO3m1Lm3axmGfXZD7N+WBoN2evoKj7vfGUH/vPjQ4+c5poiGxgnkh
	6vf+hUcKWTbNZNy6vA+FY83ptXJ6pCu8wgFJdwRdEb2gxYfkf5wrEr
X-Google-Smtp-Source: AGHT+IHuJHgjXCw9R80/D5o7z6w5Ge8vVPTT5vKpu+uAH8PzOw9lXkX16l4ogNuFgD8KvHrVNOpLCw==
X-Received: by 2002:a17:902:f60b:b0:269:ed31:6c50 with SMTP id d9443c01a7336-28e9a54efd7mr198564635ad.10.1759835914522;
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:51 +1000
Subject: [PATCH v3 10/13] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-10-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3z/bogMmDmvGmNrrUnyxbdOaX5PtCls+l3jMPhz
 6cmtr+Z3lHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEym8zMsxcaGsZebPXWOLh
 Jk2m5un3M9certhx625ak2LGK/uJp9UYGbZ/4zg+d7f2xsAVRRMqPC6XTBVXf9Vx57Yo4/bqpe0
 89gwA
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


