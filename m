Return-Path: <linux-rtc+bounces-6245-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNNzCqWhw2lBsQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6245-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 09:49:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F23219E1
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 09:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D7AB30091C0
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10FA39A04B;
	Wed, 25 Mar 2026 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPb/eT5Y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209232FA14
	for <linux-rtc@vger.kernel.org>; Wed, 25 Mar 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428445; cv=none; b=DyzKX3SQjbFCpiTUzCqCTXKXuJ1dciwjF+hdY9kRBWtyBhIaYXpT3PTYgH4SaZ7e60ZCOm6AbAAwNVinl7dlp6i5k3fwkfXzpdus4XGJMfJSgWdxTeuGnszyCYZCBfVE1X7Rm6Av1GzNpdLTQAIg/5sWPh+fyE109///lJP1Mw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428445; c=relaxed/simple;
	bh=ztL5qrDQmt+89+QpvFC3jkjAmOts+inzbS/It1L6Fjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qCnpHDzdVXUM/JNHQubQWN2/REExq9qmOE3b9/I+mD3VZovyZa/O8JiAg6T/i1zSDiN1oRWhavQkjIOWE+pw4V8wgzuH4s/4IaE5pPl1x2JOpomc/GoQPYNyCWMrnTZ+wtLFVN0UWwvWVlHTIE1oCkKl4Vm6Qv1FGpbNJ+c950g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPb/eT5Y; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so256781a91.1
        for <linux-rtc@vger.kernel.org>; Wed, 25 Mar 2026 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774428444; x=1775033244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OxEr38MnvqVqZ2J+GW/5gCOfjo4fanfd7DqD8+2VV5U=;
        b=HPb/eT5YmLRHBcFT1ADW6dSnVUPKYZOmZ/jx5vRRFNvbiEhw/aqnllBJdR4Z26ZVbs
         nLYiQweCsrxPuZRjClswqmi/MzRRkst//rg/Z161stdWV9lIsJO3i6hvkNRnknp8I/Rs
         hZyIz6HCyyYC7hNRSl3teBEOQqJjZg3NHS4A4GZZ8Z6F+tUS3HFQzcac/nm76xMNiXry
         0gjMI+xjzKyEflJ5m0/2I/xXjMgU/Di4JpzJaQFmx5XzqJU52fZ7YXSjddpwYBepx/Lq
         gTzit2MvZjJcZYx7lg4JGJUlqaDUtycV80ZBAc14HlQy2lgvl9qlRq1hjuom9eYW1t/3
         1mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428444; x=1775033244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxEr38MnvqVqZ2J+GW/5gCOfjo4fanfd7DqD8+2VV5U=;
        b=HMnRWCEWmrFWjErDQK/sIyf5KjWbICSWKijDzTJkoLURhIrP08a/hIS22DEwDkld+j
         S/jcZHdWmk6niibJuCe02FijXq5LixGhtD0a6MNSw9HyRmmO1G/nMa86HH2VmUukAstf
         iQcQQkaXpZXgXDbFVDTVpFayGLGzStNKe1ZGH8ciOxVxMsvStD14D2u6JDxBaxBlYW2w
         HmIcDQq3ZA30GhUZLzo541k264O1ilWGf0+kLyWHRgyefBnniR8EsudAAsQ5gQUJ7RA/
         kmFSIzOXjIq3SFs/x8W73jc3w2C/vFCTjDGo3K3+ijPcmAMZ3umcoyuA7x1dxOTl1Lwx
         G8hA==
X-Forwarded-Encrypted: i=1; AJvYcCVXoI5jE/QzF1vEJqUEKpYArEyoZjQcms7UCP/YKr3jIWWvMapY8Pj1FqJUoEwMZQAI58JjllrX0V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNAlrINCvhz65NGQZdqEE5bKHZ4g9H16RRVpz10Asdxv4y2unn
	hZV1FHqjQ0hPWIdrR7aDfTIAY0nk0DQb4hIV21BRWC7edjZtVm+nIGM2
X-Gm-Gg: ATEYQzxI4h0d7f/jNrJAzmykDirfVrvpkEK4WKgAFvs02nbtmjgyT+sdEDSrZpcAtIH
	zpO655EP/B0MATFdC8aw9Ig0hKO9YHARyc3v5yPSkOkqg6icTFKjVhwLJLtxqeg/Q+mtzoaEMAA
	mH6Atqty8v6uF5dlL78MmFxbO5xDujP09PbX1wdetCQVPIjwifDx8llH02kh5Ck/63+qkAUIbXL
	P+A5OBipq77q6moxL5u/PlHbNL7U07GNorfisGVBNa8P9EPDx/tPKTJoxjBofYISThXJlq8Cgyq
	EaJzay/uGfOpKPr0Y1qYB9KKzgmjbnDIYDsYXA5GeZhMpiVK/RGIdamsbHp/4AdTz13Lz4tYy5m
	FvL9UtSEvIeMjKenX36W67GkAUAVkq3dpLf5x+F+SFtlltX0jtvdb4nWI1Dfs/y7kBzaOaCRD7X
	kQJXDzEDBC3CwnbbKrbmIeg6o=
X-Received: by 2002:a17:902:d50c:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0b09cf4edmr33792755ad.15.1774428444074;
        Wed, 25 Mar 2026 01:47:24 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm231009545ad.47.2026.03.25.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 01:47:23 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dsd@laptop.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] dt-bindings: rtc: Convert olpc,xo1-rtc to DT schema
Date: Wed, 25 Mar 2026 14:17:08 +0530
Message-ID: <20260325084708.40629-1-anushkabadhe@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,laptop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6245-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2E2F23219E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the OLPC XO-1 RTC device tree binding to DT schema format.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---

Note:
* This patch is part of the GSoC2026 application process for device tree 
bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../devicetree/bindings/rtc/olpc-xo1-rtc.txt  |  5 ----
 .../devicetree/bindings/rtc/olpc-xo1-rtc.yaml | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
deleted file mode 100644
index a2891ceb6344..000000000000
--- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-OLPC XO-1 RTC
-~~~~~~~~~~~~~
-
-Required properties:
- - compatible : "olpc,xo1-rtc"
diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
new file mode 100644
index 000000000000..a5f029a4de92
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/olpc-xo1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OLPC XO-1 RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - olpc,xo1-rtc
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+       compatible = "olpc,xo1-rtc";
+    };
-- 
2.43.0


