Return-Path: <linux-rtc+bounces-3189-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9BDA34DF5
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 19:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD61188F7B9
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 18:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02D424A066;
	Thu, 13 Feb 2025 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3Vhb4BF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334624A044;
	Thu, 13 Feb 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472390; cv=none; b=Hj0aEg8QsW9xsEmB7KCnITuJR5cIcIAKfRz/t2gAOWvhwWBKrq33rsPJS+B73WMASecHnYWX1JBq3MUbGQ5at4nLDF1l2cvRuwpGt1UTt/8IntkCRUbbRiDmCOyDUOCaKEi5HbMlbjRdGx7O2NnsVkom8mJLMtCIDFKY2V8UMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472390; c=relaxed/simple;
	bh=EcaW/xsVIzx/Y8EaGBnW0qa+FROa5JbgJtCUwY+OtGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsKl64uNW75lsZ1D9nKufCcoVrMQ3ng9eNfUDZpp9GpGkv6pb7OWx8SX+w/lNFepexu0gfIcZlObhUEqqEt60FYnZ4BdI7AQqw0AxRUf0byP2B1FRH1RQCQesSwGI6n9cVy6KjU9Q02KGn9Z++UKth6Zka4ynqFtdmJvI355LvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3Vhb4BF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so840929a12.1;
        Thu, 13 Feb 2025 10:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739472386; x=1740077186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=d3Vhb4BFbWcy5qDVdsSxbtSxX80bbqClUyqd73yKCaOWFv/oN4jtlkPkyeyugzs/Jp
         dnsbVFi+shAKJE085m6GOi0VnmZyiByOa1FGGCPCPj3FmMbuhAee1IDC1lAA58ccIvuH
         0PG1gR8KTzcdiga4IGWBg/0EvaiwLScRU3sMoQkMMHeHpMmCpUveq1fE/eciz9ulvxVI
         IjXFg8XyU3Ywe3TSTHHTlkhtQ/CsFEctO+xdAWUkcrXW55yxXDmxK5lUuRFSDDdmSLGR
         eyq12Ro3F1u5yoqbZNic8gN5Aa1u4gwN6Z3HQXxGx8nEXAMp1Fo9YKXXYtczkZ/XaDGG
         uK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739472386; x=1740077186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=jobO58o1LNOfG4xjx9bC7+K3LPV7q6091/VdAaxRWb91tGpEnr5yNsv14nHroKMeZT
         qNZkc44lM/SzkUK/XMjJTtqisFwUxzYfS6VoDhpuN26A8P/p18SXphOXw756o/UcPJ18
         OlGyqtxIVGajPumAk88OCrLthomrEl3rmYpkwaJb5sleuGHrYDpn+L20F9JGnU1X/ZBr
         yswEmrt21C/IdpBmIztfsJuRBX2VmpEgbRI8hJjeLlw03zmRr64bjwgA4/HzGl9fohMR
         g+92GdhshQPfnEwsWkQLBcmn2jS74TkeMP4HqTyTPvQUnVjwOHVPEIvV7JwU9j7Y5CWo
         N27g==
X-Forwarded-Encrypted: i=1; AJvYcCXRdqhppHzzbOf8MQhJmlkrDVzLIaYI4YBMqZj91Na38oLMiWBll8qNy+L50Y3Z5AUPUdPRuXL6329yJnQ=@vger.kernel.org, AJvYcCXlxibnI2VW1Y183VKHFanXtz6CZ7beS774S1oHNLv/GIcnLEI1CQKTi6TssywZ3Mrt3bHnhafh3U5R@vger.kernel.org
X-Gm-Message-State: AOJu0YwiE5kJEkTPYt74M+7A31t9RPa2qtCPn+J3LzrpLYSrun90kwRy
	hPbWYUns29TEw8QgU3frItHktSd26Jw/evIUn4E8VR9vExRwoSdba5NycJse
X-Gm-Gg: ASbGncsSlZqV34NqAYs45k3N39rflnfnIGGOYGqTFFKw8tHz/D/S8CtfPOA3rjZrdOn
	2jR/8SiDy1XeK1P0X99e2dz5K/P3EBz8r02HTMniANjYu6V2obocUJ6toTGvdewyeVm8BmopBFL
	mmvPZU2lR7+cB8vIHrYDVdE1z5OH6eoWijjGKo4sD36Jz7dQn3UXaVPhVqG4DPt+dpNJ04Z+I4x
	FoYF1+sjI6Sqa4FpA6nRD5dIqGggg+TJVKnVuO7p0oNd10H61fMSWR5PouQOmtFmgDBlZYXVc9F
	oXiafL68VA2d421Fq5SWooFuxsL4
X-Google-Smtp-Source: AGHT+IFbOtRzeOCQ06GmMjbJRsv9zpsGZKNOgatw0C8hFYhEdBQ55E0H38YVmlbZVJyjoft+DGsobQ==
X-Received: by 2002:a05:6402:5202:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5dec9e99913mr9052563a12.22.1739472386351;
        Thu, 13 Feb 2025 10:46:26 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533998e2sm181360466b.134.2025.02.13.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:46:26 -0800 (PST)
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
Subject: [PATCH v10 1/2] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Thu, 13 Feb 2025 19:46:14 +0100
Message-ID: <20250213184622.2099324-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
References: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
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


