Return-Path: <linux-rtc+bounces-5862-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLf4E2M2dmmTNgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5862-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:27:31 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9781313
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F2DB30056EE
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D4B27A907;
	Sun, 25 Jan 2026 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcWrduUx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730A28371
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354848; cv=none; b=dDApljLCH90wUJxw6hVGtw4lPd44yUoB9VNTYYcg062JgRgZ2UO9/aZeEDJnWCGojarEI4vaDFHNOid5ibYk32OnFliyPabfvLypNuFWuE5tZpaI7TFJkKgycpw/+YXi5+MRAa+sN4CXGdO62OJWMsTJyPiAAAJNNHY/e2S1DOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354848; c=relaxed/simple;
	bh=SNf2NU+hs+ZIS4XXchD9gc1LEk0khnpy5wXM0ouJBNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhM/J0E6gA0d44OTFPBcAZhEPO0bPhI1tVYTqiFUYVWi02qUonLXsO39HSwgbsZlhJTR2zYNlPPycNrSyERtVRpEVRAJ+r2KlqdxTc6SMZPHmuXeStVuTFz2oTPFHeXm8TyTP2ZqhI8GftwQwBbK2pU87mHLLH6gZjsyYKuTJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcWrduUx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b6c89d302so3667523e87.1
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 07:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354845; x=1769959645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXpwpGUeOVZ6gd5Z9uZtu+VcPr504HYG8KCye/qyxZo=;
        b=fcWrduUxOMe2K/uUDKcInOttzaFrOLpVafR88X8kMTlTU0GO6NcxiTzoSfP2MVwMTS
         A+1ceCahAIkXQ5RGl3GRkVXPBcadQycS7+0jMLbPlrfmLt3fxNXogYeFbNNp+mixVcm9
         F8xmvY/ke9slxyDTFkbKmran+5xoyNxzPxB0aDQNQc6mLMFCsNPViS+66Q1PrhWqIFez
         GVwptbkbPj/3LCOOVDmqWwQKY+p4a6ITKHz9HFB6If06eij4Hr93WNE97ONN/vhodFKU
         jNoFWxLSmk0Nxm2PTHTywCvhNw7z4XO1aUFoOrF3XcqvN4Kqhk/8rImXnkxlGodJeM7r
         xW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354845; x=1769959645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXpwpGUeOVZ6gd5Z9uZtu+VcPr504HYG8KCye/qyxZo=;
        b=BqXt0lX5+jxU12SMhavOpVe7kCJ6Gc32qxKWsOOa/1g2CEm4aBnn8P44Y7Txwsbym2
         CN6Sb5GEfUO4Siq3xqLUmnnUq56iJ9UB7spUf4NG7X8kM/jij9J4Ubl9K8AdmnfOnxok
         PzptRJ9tBwgc6h2g5fZJHFv5B7sE9eX9FifiMvCAaUHBsjaZUZMZ+2HcmutpJCL+E10Q
         MLMYC45i1zNdxoRU97rKHlyHZ8CYVVgO6kcuU3Gx3hlTanUvKws5q9H9KyG8e26SroLZ
         Kx9WRvKL6rBmlk3mrwFTsY1eYcacPLibJgegj5lh2h/r1vJJZK2SJzoL0Wp31peQxzel
         4JWw==
X-Forwarded-Encrypted: i=1; AJvYcCWTJfgQCCtK90GYJDf6b/aBUGW+JyvtIJdJdKLAMQ5aRhsu6VOzg+x5zur+G8bUjcn4QzE0ql3DkMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjBcFcGFnB2dYYLsiKYCnErbJaPiqgYtlo4AHOWl/nzUMQ+3R
	P1BtiZNDeL+Uze2RBb1dfQ7Mm0vmZGieAvbNNFOY1t69fFCb1wOHkbhB49wCVA==
X-Gm-Gg: AZuq6aIUU7BOKfxIQ4bo+nISSIvO2e51u5JQiFMZpSXhcmbVlLzDtxzTjF5EW7ZBZsd
	AvzBusRwbwswj1s1HwK1cu9OtccR0uWv153/dL0cAZnyzYkFZrirDv4k6Z7Tbnr+1yDNhKkSpgX
	o/afX3ChtVXdKoV6clWYQSd4imRisHOVUuyjhXCDnoB+icye4j7a5xdKD/+eqmVAI+ZYVoahljM
	XfBbOJfc8cAE3gHu0M7gTK17pCxChwxj4BommOoc6yKtteUruP2gncCjy2U5rFNQ619MISbaF02
	U1umzLDbwMmrsSES7kFfEU908EPKLyOxMQdhr+gAy3XXIzHEgmVI41xuliJgXJ+j9WDGogs/4xG
	I6kz7j6NJfrkTxQMv/O8NehVZIr777p+U35zi44ocQyo+RK7XBb78vHoktxD6rXjV4XFwrGQRsf
	osbfJ0lAPzVQU=
X-Received: by 2002:a05:6000:2403:b0:430:f97a:6f42 with SMTP id ffacd0b85a97d-435ca39c59bmr3398601f8f.54.1769348598831;
        Sun, 25 Jan 2026 05:43:18 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 06/10] dt-bindings: rtc: cpcap-rtc: convert to schema
Date: Sun, 25 Jan 2026 15:42:58 +0200
Message-ID: <20260125134302.45958-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5862-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FD9781313
X-Rspamd-Action: no action

Convert RTC devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/rtc/cpcap-rtc.txt     | 18 -----------
 .../bindings/rtc/motorola,cpcap-rtc.yaml      | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
deleted file mode 100644
index 45750ff3112d..000000000000
--- a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Motorola CPCAP PMIC RTC
------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should contain "motorola,cpcap-rtc"
-- interrupts: An interrupt specifier for alarm and 1 Hz irq
-
-Example:
-
-&cpcap {
-	cpcap_rtc: rtc {
-		compatible = "motorola,cpcap-rtc";
-		interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml b/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml
new file mode 100644
index 000000000000..bf2efd432a23
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/motorola,cpcap-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC RTC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  RTC is represented as a sub-node of the PMIC node on the device tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-rtc
+
+  interrupts:
+    items:
+      - description: alarm interrupt
+      - description: 1 Hz interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.51.0


