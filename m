Return-Path: <linux-rtc+bounces-5859-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBd0OyUzdmneNQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5859-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:13:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 037DB81213
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3D0A3001187
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 15:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A66E27FD71;
	Sun, 25 Jan 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKGnrud9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929A1DE8B5
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354016; cv=none; b=kpVJW7gfRIq2+4qMJU2vUrvJgjGyPxn5qcl/tF/+PVJ/AN7LvTlwV04FJo3+Ki0PpLIQ4/Wh9EY3zu36FWrdh7vI/QKMg1d+J0P8HkjA2jSYZKdAI2TD7SfXn4WRIoouTI5sOnl3HTfVl+fsoyEXZL3A4DcvKyG/a76vUVUycWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354016; c=relaxed/simple;
	bh=E7A9c27yUqkUqACBSnmKRI2cuBoHgawSFZnfB30gBd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhH+5wwguboXntiJvCVwaSAhKn/pPJ6udjlCSZe8U/NJ3gjDPed4AQSJhreK13qzkHW50otfQjMO/Hfrse2/NtB6avhHaVnYNU1B7TobPuECCWo5Ekcj4fAsHMgH6mMCzv9zkNLu7fa2n4sAAHjQ8nmFU4RktiDe0r9BqxvufV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKGnrud9; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8876d1a39bso222930766b.1
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 07:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354013; x=1769958813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opwAzXZXGpL/t9kjdWql8KWUaKqEP4kujq0iT4W20S8=;
        b=lKGnrud9fKf8wQ4oh/i39V142E2ll088X7A/01u3ufBFGCRUDv31Vn/lKb7NP4x8pq
         wwDt5y4D5FKpdRYFgcS7uZtHvFyJhPP3HfJYzfuiS9KOAuY26aQK5Vjh8+G/Q/5HxnlJ
         TT6yTOUOaGbWRjTpZj5QlPJH6BCHQH+p9WmcwTdoqAPFzmmRchi8ISXRvcJkipyJa2QB
         Tq/dGmrk8I1kMA9muLFjAgGVpiXxmj56IiDek7XShIFHNAhiSe/4eTanOmNyW2YHNQso
         KqoAcaCdrilQgcR49JJPQyVsspNMZwttrgGesPEu7LQJVrf+gFJEgvhwtlOLVnV/Bj7H
         Tn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354013; x=1769958813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opwAzXZXGpL/t9kjdWql8KWUaKqEP4kujq0iT4W20S8=;
        b=vrekGdYL13Of3R3Zi9NqRpmvEJSgiyuMYlCjnWlgNJiEC2QsJRZZGZ2hAc+6gbdtBl
         oosZPiguccXG8LGTqhpOZU1AyBK0+9qH9yQifTGDIopzprRJMKi40nLv8vRl/cI62/gS
         C6lA4G25hW9cuxToaGRyiC9Dp/fCfSnYvSEGnnhCspWNW0mPoY0UupdCPXhtxdX2hPvE
         5CSMqCVIQ38LpuzxFBP2HvM/pGVfkYAOFEx16w8o+8DYotgJdMqlSs7i5uHZOaUoAO/L
         O8Uk+xETYz5ySWHC5RuciEJDF0bm4K+Ur7rIyAYX74S7x7YkwCRCeNmXf2JXWOWcx8tr
         c0wg==
X-Forwarded-Encrypted: i=1; AJvYcCUSLCgwJoqbkdkuJS0wFKK+iWo49AQVBRqLO8sbFOoW9cSqw2Ey6Rk0a7DnM3ZPVjslEhJaI7JwLgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3A3xfThRA5KubNosY2uhg6IUzxGCtdVWZ0SynU8W+n2r2T33+
	107eWjSjySdurL+H2C+ECJHrh/9+up5OGK0+5vEPtXWCOgbT1EmTZq1ct5p6K+zX
X-Gm-Gg: AZuq6aI1dJYe76tXUGUdvygzJZjuFQBnSFdsUqZQNLZpFcEEpGRnEEvsoPyqIE9j1hr
	p/YtkWlfCNBWMUrBke7iXiDJXn40Z5T3w+p8Cv9Xpsikn3yKzTCZJb06W7NAQKhASYzCi4EAtOk
	Fnm+jt4El1NdCBcL58CypHL0/nGbNSjtubTgiSuMyBhBIJahpYlqQ7pI+cZ4vn102O2Ij0hVBdk
	mdOf5w/4JCe0l1fctZNxTGNZNKUu/5II+Rq9sx2a7/cXqTJUSTEHCGKnIMwXHH3wRhhYckHtk91
	ejc6OqSnZuas/cwj+FF7MYktOU27IC1p+QzFQVs6YfWk4+gwIN+54Jz4/yRVeqJZPjAmVDz8lRK
	pJdiAAia5luUrEGhBa/9WCLBxMTDXFqWiN4jWfu6v/QTJJXXU2pUJxfgdCLeb+0zbushnSlehKr
	1cLyLh3qzP3pc=
X-Received: by 2002:a05:6000:2483:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435ca1ab666mr2383866f8f.55.1769348600123;
        Sun, 25 Jan 2026 05:43:20 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:19 -0800 (PST)
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
Subject: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to schema
Date: Sun, 25 Jan 2026 15:42:59 +0200
Message-ID: <20260125134302.45958-8-clamor95@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5859-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 037DB81213
X-Rspamd-Action: no action

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 000000000000..643f6b2b1f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    minItems: 1
+    description: CPCAP's ON interrupt
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


