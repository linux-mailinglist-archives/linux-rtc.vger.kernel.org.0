Return-Path: <linux-rtc+bounces-3194-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C27A350C2
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 22:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7846116CE89
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 21:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EAF269833;
	Thu, 13 Feb 2025 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzFAvcGp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C035241673;
	Thu, 13 Feb 2025 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483826; cv=none; b=pdbxK3cKK2ik8cj7WqxEBMox3T8nc8gf7rKjUYzLzbqCuSb2JjRe7ezA244J2e7df23ELjsESyF5ezfPI/4hM3+W7P0eAUuSJJf0/CWpN0cGldKLUz4H3nM7337cfo6kgPAFNL73bO2kOVy+merL6BT+CI8xlr5JokxRnruuiKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483826; c=relaxed/simple;
	bh=EcaW/xsVIzx/Y8EaGBnW0qa+FROa5JbgJtCUwY+OtGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh+5Sjsg6WXz+SA1hebTbrGAXYRVMSahRewH6SQfAoNw+x/7Exht/amkgb9MaVRLm4advMKpnyn9moN9Zo8EU67QuHn1tAc2TjcmyskFZjgMqHtzZrfVF5LsD5irrFCZiGLkHBompsq+x1NmrZsBxk4sdbwXUlNMP07HFNs9zC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzFAvcGp; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5deb0ea1129so2185092a12.3;
        Thu, 13 Feb 2025 13:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483823; x=1740088623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=LzFAvcGpRW5vo3B8f/RGGFG5EJUmiEgDtI6/lCjszNYEwRxv1P+jtEePpqQNscbQq8
         nuNGv+O7XMThcgzZLaxF49BdYY/17RcxBDbfHt2PFH8gV89DgctPMnEWh06Ec2X9ij1p
         lsQzYoY1VBXxYQHWEsQrEXPnE8uLiE4Z2UVjiu2SUME67wMJS07n79dx8Dp5zBrCDAnZ
         U561wzxREIeVD2bAEgn3Hmtsa2YyAPZG4z9Osl459kq40ZE5nyKF8nKzLgkK2z0SJTlH
         4chki3M8+cvuXDH61K4/Zy6/KPbaZ+GfB16v29esAWODXu4auz+SywI/r79+IvRMD7ir
         l7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483823; x=1740088623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=A3mlS5TtNdJW9QZaQyTISp5PDfqfUNO0+mITdO95ygIuIh9qpaIn2i5Bk62xOEPgJw
         RmClj2yVstU/QPMbc/VXsHiB/JZnVeh0Akwwzc/IDutT1reXYU64XhL3/M45p4J6yYKB
         cHFIhF6bgc8l5bdlzRbHCgUZu+9llSdsNHU+l0siNy/Qxal1/W1BhavxMGWtydfjTHq6
         DC6n+IP1wKNsNcWgRvnhWfy/0nYeMTeqW2aio57Y0mz6GgsLO8Yg09hib0ZtlffgIpSr
         XIWxb2hchAtCrHrBjK5m6KHswJYzMcadxdSDJHMcXzLERIecCsQ0txQ1soAB+2qixgUN
         7ABA==
X-Forwarded-Encrypted: i=1; AJvYcCXKmzqr0WOcCqJ+BDQy34AlcWoFKHD+CvmSeyVL2BX4qqPlycxUUNJrOBRyGs55levNOF+lIJjeqWJV@vger.kernel.org, AJvYcCXpNqs7hT5XQqnc3auL6V28pQhFsmjKcvSCmNw94ynKB6PX2UtGCwwHtwwShLiI+z2Ie8M6/HzIBEBkck4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS7Eb1Ht7NhVvPv7WcY9OKlqnbInCHLlaLIvH2GMsebEQZQIq1
	IisPpn3iysUALuDWk0M3wGGl2gZPFZE6iugnLFH3A3pzGE6OWyHGl6b1PyBL
X-Gm-Gg: ASbGncsbVhR8dTHh2Oqo9VZPu8b8RvrvkN/ed/U5g6Fi5Y0AmS6KXcInqahMk12C5cb
	KuUG7E8SXnzLW7RjImAj+WZjWiuSgyEbP88SFialxU7/ahe6l9KQSGZ84CbdRINQ4yLx4e+Q1Rg
	ogocYqadjk0s+L46dMyj75uwjAwAp9zUWejpYMlIEjsH8bqQsgwD1mVJSulKqwclypvDnZO2+lP
	ENosqq7uUINKDKiTFXbY21dSuCvl5T46bEej1P5eY5dl3vYudZuexW3JcDqE8XTpQl3AEMiupqZ
	E0piVl2amYFXELlF0uOHVINi+rf0
X-Google-Smtp-Source: AGHT+IHRAtCVWNq8XpVzN2rzWEH+RsMalBJZKuJ/XEshW4YbV21Zyi2VxFzWNvpxpGYTpMRSyYy/gQ==
X-Received: by 2002:a17:907:9451:b0:ab7:b390:5c67 with SMTP id a640c23a62f3a-ab7f33c1715mr947209466b.18.1739483823072;
        Thu, 13 Feb 2025 13:57:03 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:02 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Thu, 13 Feb 2025 22:56:45 +0100
Message-ID: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
new file mode 100644
index 000000000000..b36b51a69166
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
+
+description:
+  Real Time Clock (RTC) is an independently powered module
+  within the chip, which includes a 32KHz oscillator and a
+  Power On Reset/POR submodule. It can be used for time display
+  and timed alarm generation. In addition, the hardware state
+  machine provides triggering and timing control for chip
+  power on, off, and reset.
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800-rtc";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc>;
+    };
-- 
2.48.1


