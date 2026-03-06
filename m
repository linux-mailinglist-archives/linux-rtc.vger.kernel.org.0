Return-Path: <linux-rtc+bounces-6141-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFi9CvbXqmnmXgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6141-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:34:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0859221C1C
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C648D301671C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FEB30AD0A;
	Fri,  6 Mar 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgXNISbF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00C3016E0
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804060; cv=none; b=u1LJZgF096YGsP8sDTEprjJf+HBS0kNvRjHNUbWr7AJ9SCF5mXjosV+RPTdP70fnA+OAyCTbUgxAOWtfUBwdAiA3a3mzLR4g+wd8ise0zLPOVItmTXIm/QwFDjrJ3MNZRhgxQgD6Prlo63iAZss1CmciWWNwMUB6+eY5huAfN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804060; c=relaxed/simple;
	bh=hIwaVNY63BTTBq9X+Fl95oFfSfz7quQ71GvgE8hGl8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSWcQ6NZ8iZL+IiJzt34eSukh+in37FVsWax2oBy0aUHJJwlDMvA0W26r+ysbSygGGfvhj60BppbAdoVA/hDJS3eoDAkvgBsDjwvp+W6thOWT4p+u61ik2tE4vWfoD3cDfsGe8T7azcX3kGiVKTpZqX+hq5Gnw/1XqWjm5giK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgXNISbF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48529c325f0so1705255e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2026 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804057; x=1773408857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6xzGFA+B9jNT4audLsSR5XvefLJ8EAoTN/auQX0Deg=;
        b=hgXNISbF68OZksKQOn7P5meLaQiTe6E5kdg2wjxkXY+y3uKbDI5F93yr7ViZ/EkxWB
         8Q4PwBrfkQAM8KZ4r3TDmURvu6TMjDJLJBojml+zppn/3HuiBk3zYuny1Altlgdg4smg
         zgr84xiL/P+gniK3Blr9ExrlFmZGSQ/26QDK9uUb/7kHrZ+BdlTlyEhoDORlZHo0ouf7
         607PDF17DnAZUmxd8oTJ4eLTN4DoJSgugvzQ2yW6qXNi32uGW3QoRxN6BJwEo5kHFirx
         I3g59MQGJpbDo965OUTd5gti1PtEDWaHGhe+c3vE7PgkJUoXN6K2JVE1ZR27fojY4yek
         TuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804057; x=1773408857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6xzGFA+B9jNT4audLsSR5XvefLJ8EAoTN/auQX0Deg=;
        b=uJugy752KEOLzFiz0MZ/Gm5tcgBt9JA/okZihhsGNpEo+rcNaux50BCz/Bo4WWWdPX
         4edSpEzZkR1btDztuqnrovYRsCouQLlRvg0whfA+aFRwFTVczBWXstTPw3Qxh5dhf56a
         EPI/s+opQZufNud9/h2vKehW5Gy90FKlucJwRdyq0u8wm+HozW9ibI5+qtM2EermO+KZ
         bJXdVpBGy6HJab/At/4fHtOmjJnf0HImFtn7NrFtpkQaVpql0JcjH/BsIHlmdg+Z3H7V
         OVlwMqzB+1jDWDYfrCUpM0ieO/4R/5cKuz8Rr/QkrGiZrYuOvCWnxedX6Y8rGRI5C4JX
         TgVA==
X-Forwarded-Encrypted: i=1; AJvYcCWeh10u/MenjvwwAOU6nZxaQGCMl7NccFBKh7UHRfJrCCe+oIY/GJJc7x7DpPrEgmpt7zgoKGWYA8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFUV8Ycz2V+GLdrZ3ccVTRFH5M53yW5j1OP1d7HqF71dx5cCs
	WTcuW0Aj93crHGtkTS+vmp858297h4FgcPe1xOJbiY8kqE9nvdyOszDY
X-Gm-Gg: ATEYQzwQHhOPGm+UmcOhIkyJ+O7kxiQ+nJdpzA1wZr/mkwdt27Apu2jjrdae6EFpLvD
	fHVE+D9C7dG0PYFi0WZ5iIF7H9Ypk3Fjrypqwv3JUB70ZOihw0Zi0S7sZyKBkpj7rP24ZJjNlUm
	spGwNoAvRfVayQoLgYwsZH2fLLqZ9O7s27z+pRvzSazDt+6GNLfh/ak7vY0vRUHPgNcdTnk/wsm
	Na/Sj9kDAr1dw4sGIPUXsDGvqtqnO9fBdoElp5YOuYvGz7b1uTwNH/E2iID3/yrUjXIHEiQN86L
	LcDuhEQDXHWNNB1pMZ2UcN1yo832vRE5Y2xsrRME6tONRzSHY2tfdGsvE1s81SeEysmYxsiE6wZ
	AOq6TIlxkRKDzPB+o9QmtahIv0i8Rd5MtT8fdgTPCLHby6sE7oEgZYFN82RrmpouhpxArfKmao+
	8hEKhVXmljCuF3
X-Received: by 2002:a05:600c:1908:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-4852695943emr36730255e9.19.1772804056908;
        Fri, 06 Mar 2026 05:34:16 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm80856735e9.4.2026.03.06.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:34:16 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to DT schema
Date: Fri,  6 Mar 2026 15:33:47 +0200
Message-ID: <20260306133351.31589-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306133351.31589-1-clamor95@gmail.com>
References: <20260306133351.31589-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E0859221C1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6141-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,3c:email,0.0.0.0:email]
X-Rspamd-Action: no action

Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
 2 files changed, 97 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
new file mode 100644
index 000000000000..7364a8bdd7d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinmux controller function for Maxim MAX77620 Power management IC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Device has 8 GPIO pins which can be configured as GPIO as well as the
+  special IO functions.
+
+allOf:
+  - $ref: /schemas/pinctrl/pincfg-node.yaml
+  - $ref: /schemas/pinctrl/pinmux-node.yaml
+
+patternProperties:
+  "^(pin_gpio|gpio)[0-7_]+$":
+    type: object
+
+    properties:
+      pins:
+        enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
+        minItems: 1
+        maxItems: 8
+
+      function:
+        enum: [ gpio, lpm-control-in, fps-out, 32k-out1, sd0-dvs-in, sd1-dvs-in,
+                reference-out ]
+
+      drive-push-pull: true
+      drive-open-drain: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      maxim,active-fps-source:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          FPS source for the GPIOs to get enabled/disabled when system is in
+          active state. Valid values are:
+          - MAX77620_FPS_SRC_0: FPS source is FPS0.
+          - MAX77620_FPS_SRC_1: FPS source is FPS1
+          - MAX77620_FPS_SRC_2: FPS source is FPS2
+          - MAX77620_FPS_SRC_NONE: GPIO is not controlled by FPS events and
+                                   it gets enabled/disabled by register access.
+          Absence of this property will leave the FPS configuration register
+          for that GPIO to default configuration.
+
+      maxim,active-fps-power-up-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Sequencing event slot number on which the GPIO get enabled when
+          master FPS input event set to HIGH. This is applicable if FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,active-fps-power-down-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Sequencing event slot number on which the GPIO get disabled when
+          master FPS input event set to LOW. This is applicable if FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,suspend-fps-source:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-source" but value get
+          configured when system enters in to suspend state.
+
+      maxim,suspend-fps-power-up-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-power-up-slot" but this
+          value get configured into FPS configuration register when system
+          enters into suspend. This is applicable if suspend state FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,suspend-fps-power-down-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-power-down-slot" but this
+          value get configured into FPS configuration register when system
+          enters into suspend. This is applicable if suspend state FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+    required:
+      - pins
+
+additionalProperties: false
+
+# see maxim,max77620.yaml for an example
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
deleted file mode 100644
index 28fbca180068..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-Pincontrol driver for MAX77620 Power management IC from Maxim Semiconductor.
-
-Device has 8 GPIO pins which can be configured as GPIO as well as the
-special IO functions.
-
-Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
-for details of the common pinctrl bindings used by client devices,
-including the meaning of the phrase "pin configuration node".
-
-Optional Pinmux properties:
---------------------------
-Following properties are required if default setting of pins are required
-at boot.
-- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
-- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
-		<pinctrl-bindings.txt>.
-
-The pin configurations are defined as child of the pinctrl states node. Each
-sub-node have following properties:
-
-Required properties:
-------------------
-- pins: List of pins. Valid values of pins properties are:
-		      gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7.
-
-Optional properties:
--------------------
-Following are optional properties defined as pinmux DT binding document
-<pinctrl-bindings.txt>. Absence of properties will leave the configuration
-on default.
-	function,
-	drive-push-pull,
-	drive-open-drain,
-	bias-pull-up,
-	bias-pull-down.
-
-Valid values for function properties are:
-	gpio, lpm-control-in, fps-out, 32k-out, sd0-dvs-in, sd1-dvs-in,
-	reference-out
-
-There are also customised properties for the GPIO1, GPIO2 and GPIO3. These
-customised properties are required to configure FPS configuration parameters
-of these GPIOs. Please refer <devicetree/bindings/mfd/max77620.txt> for more
-detail of Flexible Power Sequence (FPS).
-
-- maxim,active-fps-source:		FPS source for the GPIOs to get
-					enabled/disabled when system is in
-					active state.  Valid values are:
-					- MAX77620_FPS_SRC_0,
-						FPS source is FPS0.
-					- MAX77620_FPS_SRC_1,
-						FPS source is FPS1
-					- MAX77620_FPS_SRC_2 and
-						FPS source is FPS2
-					- MAX77620_FPS_SRC_NONE.
-						GPIO is not controlled
-						by FPS events and it gets
-						enabled/disabled by register
-						access.
-					Absence of this property will leave
-					the FPS configuration register for that
-					GPIO to default configuration.
-
-- maxim,active-fps-power-up-slot:	Sequencing event slot number on which
-					the GPIO get enabled when
-					master FPS input event set to HIGH.
-					Valid values are 0 to 7.
-					This is applicable if FPS source is
-					selected as FPS0, FPS1 or FPS2.
-
-- maxim,active-fps-power-down-slot:	Sequencing event slot number on which
-					the GPIO get disabled when master
-					FPS input event set to LOW.
-					Valid values are 0 to 7.
-					This is applicable if FPS source is
-					selected as FPS0, FPS1 or FPS2.
-
-- maxim,suspend-fps-source:		This is same as property
-					"maxim,active-fps-source" but value
-					get configured when system enters in
-					to suspend state.
-
-- maxim,suspend-fps-power-up-slot:	This is same as property
-					"maxim,active-fps-power-up-slot" but
-					this value get configured into FPS
-					configuration register when system
-					enters into suspend.
-					This is applicable if suspend state
-					FPS source is selected as FPS0, FPS1 or
-
-- maxim,suspend-fps-power-down-slot:	This is same as property
-					"maxim,active-fps-power-down-slot" but
-					this value get configured into FPS
-					configuration register when system
-					enters into suspend.
-					This is applicable if suspend state
-					FPS source is selected as FPS0, FPS1 or
-					FPS2.
-
-Example:
---------
-#include <dt-bindings/mfd/max77620.h>
-...
-max77620@3c {
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&spmic_default>;
-
-	spmic_default: pinmux@0 {
-		pin_gpio0 {
-			pins = "gpio0";
-			function = "gpio";
-		};
-
-		pin_gpio1 {
-			pins = "gpio1";
-			function = "fps-out";
-			maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-		};
-
-		pin_gpio2 {
-			pins = "gpio2";
-			function = "fps-out";
-			maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
-		};
-	};
-};
-- 
2.51.0


