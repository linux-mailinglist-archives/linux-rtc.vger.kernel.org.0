Return-Path: <linux-rtc+bounces-6267-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMw3JolzyWmcyAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6267-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 20:46:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C1353A4E
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B75B301BCF5
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 18:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DB93859DE;
	Sun, 29 Mar 2026 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFyqRICL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945640DFD1
	for <linux-rtc@vger.kernel.org>; Sun, 29 Mar 2026 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809981; cv=none; b=fjudopLtyLRh/5+GgO6ecVKWqvD4+CABuiiTwCMiisgHI10qrIA2gy8S+Tbh7DVCncFTZpz/a+wr1dLwiGsIji6f9GnEpxHZzJ6kAuKMWvMqtOFtsqDcMuwMaQu2K+Hnzj3BDPS+FZr87DZu9EZX18YRDt2erRqy+Ps7xZQF50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809981; c=relaxed/simple;
	bh=SjQizlVvoQlwYx7WQTarbRGMK4rgnbozJXcZZjxmjDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+P//cngZ/NJZzPCKrNc9Pu6gDkjeHQiz0e0aWHuZaoNT+AGuxG2Mk0t7rKqeb1X/ChM2HvU6IimlRr1Us+OWomSN9GnFkHcgh2NhJyFfIUQk6ni9zH+s0Sqpv9tiQvHGL/rncOUM1OKaZHCrndqtyfg9AOFZXVx/jXL+kiZPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFyqRICL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3697398f8f.2
        for <linux-rtc@vger.kernel.org>; Sun, 29 Mar 2026 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809977; x=1775414777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsRmU/z4QacokfzYWB3dzaQ/5a9aPH0r69IbOen0x0Y=;
        b=eFyqRICL2RR6+ZBIdYiQzPQr7+b9lS4liImcwnxBQTw9Jdis7Aja/JXyYlyumc3Qfr
         N2elW/EhcdCUxNTeKOPMQudtHfvMxQxbi2dIpOCxGSGDyFR/QYN9dqKejq7onEKk+Zq3
         0aAMUOp4gK5/2bempGvdX9whghMs/Vvs2w2okAII5RwO+Ej28/LSZgRy65jZ4U8Niz0w
         FeG8L3qD/1A4XNXfU2pmrM/BK2tAR8A7gK4uVnkqX5mzyFoVN838bJissHPgIU11ruUn
         gBq16t9RGMMd6nASF5AWLRd7cFkJ90SS7Ar4GKi8kkH266gtcVYHFJHUxjIBTU7y3QDa
         QTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809977; x=1775414777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsRmU/z4QacokfzYWB3dzaQ/5a9aPH0r69IbOen0x0Y=;
        b=Zy0+QLLd4EU2vvxbUK+ocoXtO+L//rBWjggcAkkJpmhxOhL+cm8jQvLtaBCo+QFDP2
         oSO5c+5yR8dG4MEaYzIcobxPqTlZIR7F8dLakLFprzruN+wH/mnH/MHOBsPIq9JGjKzq
         MAvaXQVyDnEnHd58Gsr59fXESF4eP3APGFyZTV37zPVSSE2ZJGkchPxgUl9OY8oiwy3f
         VK2GfM3rwJGC7xmPdc0YI0vDAaJRW2DddfXzw4HFUvgQvK7MZW/+a+Z5b71Agt/SgjfY
         qeujsla5Lx8ndN+Gt7bKhTKOJ6NfbVGm8+tRbs5sabArvhesfWtZzELeaXCk82V26Fkn
         BW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/j3C6g4i/Ez7SipiyYTqO1EIlzkPmqBkO5qnQU8xSE0aPKnJQMUp+yYedPTq9yXypMwCwsSrpmTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11JWFqG5nsIRnbEin/46z8yengfSjbrleZhj0Y2ShP+D0kM3h
	PVPfxeyfjmFbFbXObgE0k99OqOxc/0M+bkhmCrfD4I5NJOb8JFdQpjpZ
X-Gm-Gg: ATEYQzwEq8/PjW2Iw6rfcpgIeZZKqid29iHdpCUTlImoQ64QSlDN1+4VtL6TE2q8C3B
	/03gWVCmZM22/axCsCgGOjJDyua0DrZFYm+GcA7ZPG714iIalBYEQBF7MqBJBaYsvsrkurl4Q1W
	tJUwgqcf8Fz/GEEzQDwoSf9YS/5kd4JAVBBCbZT0vOjIdH8QUmBwvzD+7SAmArN9sK1YqSwKQeB
	KnqrpUTyLLJGythW8MWr/TrfXhA6uvZxLAo7HFGJqWJd1Y7vAvibCTtp034ndq0bjNtvK+vvmoC
	fQKW96WFCxsViK0Uy9HZ3rMlBOFZBsIVVISv+nO07Kd0/HkCajDJ3eJwfd9shts+GMXAb1W8rwU
	vmbD43/TCjyJf8c9E0t5ZbZ9wrJPeT1AAf7aYuS67PVTBLPMrHWtkCnen8mo/b4XMEwiP7O4pWB
	+ZbGKXMub8Ympe3kv+O+jV5k+s06LVXVst9jVCKUHjUyG0OurcfQg=
X-Received: by 2002:a05:6000:420b:b0:43b:3d80:b0b9 with SMTP id ffacd0b85a97d-43b9e99734dmr16186904f8f.12.1774809977231;
        Sun, 29 Mar 2026 11:46:17 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm13108290f8f.35.2026.03.29.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:46:16 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to json-schema
Date: Sun, 29 Mar 2026 21:46:15 +0300
Message-ID: <20260329184615.454887-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6267-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 670C1353A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the MOXA ART real-time clock text binding to DT schema.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 .../bindings/rtc/moxa,moxart-rtc.txt          | 17 --------
 .../bindings/rtc/moxa,moxart-rtc.yaml         | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
deleted file mode 100644
index 1374df7bf9d6..000000000000
--- a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-MOXA ART real-time clock
-
-Required properties:
-
-- compatible : Should be "moxa,moxart-rtc"
-- rtc-sclk-gpios : RTC sclk gpio, with zero flags
-- rtc-data-gpios : RTC data gpio, with zero flags
-- rtc-reset-gpios : RTC reset gpio, with zero flags
-
-Example:
-
-	rtc: rtc {
-		compatible = "moxa,moxart-rtc";
-		rtc-sclk-gpios = <&gpio 5 0>;
-		rtc-data-gpios = <&gpio 6 0>;
-		rtc-reset-gpios = <&gpio 7 0>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
new file mode 100644
index 000000000000..6b8f6e5f99e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Real-time Clock
+
+maintainers:
+  - Serban-Pascu Robert <robyserbanpascu06@gmail.com>
+
+properties:
+  compatible:
+    const: moxa,moxart-rtc
+
+  rtc-sclk-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC clock signal.
+
+  rtc-data-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC data signal.
+
+  rtc-reset-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC reset signal.
+
+required:
+  - compatible
+  - rtc-sclk-gpios
+  - rtc-data-gpios
+  - rtc-reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "moxa,moxart-rtc";
+        rtc-sclk-gpios = <&gpio 5 0>;
+        rtc-data-gpios = <&gpio 6 0>;
+        rtc-reset-gpios = <&gpio 7 0>;
+    };
-- 
2.43.0


