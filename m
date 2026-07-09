Return-Path: <linux-rtc+bounces-6963-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fW2zJJ0eUGpFtgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6963-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 00:20:13 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC0735FC7
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 00:20:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GsqfNhR7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6963-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6963-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6192303879B
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 22:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184683D88FA;
	Thu,  9 Jul 2026 22:20:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C34499AA
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jul 2026 22:19:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635601; cv=none; b=eRejmMvKpOsaY3JJ12SEeqCVPTbx2rFS0UWi5NS3Xp+gatcn2Y1r5312ZvvB9Y+Ass8tAz8cdNqBtaouC+eC1AV+vAJex1qM2Sj2VRd6GfdaaMLex0+VRX/77JdHgCVEECTcQHA0HYNtMmYZTRDwmm4G0I0nnjdtsMFV6wT2ylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635601; c=relaxed/simple;
	bh=sAFKHWV8KqUTu6gDLevnzZbNxKSuMUchGXfFTpt8S2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQC3W15O8AMbAKtVidd35rR61XGhDyL8AMyi6ZpjiPk+YusKTNwpz3bWiY1Q5fm8UKKdqJf6jFl/4DQafrcqanLzLxG5vMqeh8KFigxEpENxlexA9xWJZ94Ga3RejROP6SQGhkgOSwdOyQy3HWddScaM6SyheFGoisBBcWlC8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsqfNhR7; arc=none smtp.client-ip=74.125.227.130
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-37fb1883f59so126062a91.1
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783635599; x=1784240399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YejLbZfi82rKmzwOXcCMxrUXNra0A0pYfoVXCBwn/ps=;
        b=GsqfNhR7kXaDYsknr6tZMaFOaZ9pbRDG0aK2QCPB7bF3xG0fmTjZhczTPWOW2JUmPF
         8ZN/zd0TtSoW7kncNgCNw6ix4cIXsxtOmCQIbW2KT1xWHasLngTLJvr8+67dZDlygaNW
         j8aQtQr/doSFlzoE+FSeFMnRQHx5LuEUovFtpbP2BI8KooifkQjqLaA7EJ0gJnyQ5EgT
         1+UQjzTQBzNHUYRcuT3uFJQwhBluhIR+jLt1FpgXmBoQene2baVKgQAMTrCOwBoWfJaF
         zrHoGueTDzPncqFhrO+8waiNnmGg0l9ahbRHKw5fOfIEeSH0z0JbxUNO/l0fDgQRcBpO
         jJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635599; x=1784240399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YejLbZfi82rKmzwOXcCMxrUXNra0A0pYfoVXCBwn/ps=;
        b=Hur3j51ylyHGEf496WQCWnc1QrrDAQkCo00gDhZX2UhuhhjLDP8+Oev+13tjcMrphz
         MGhopWwAXjRVkY8g6F/KPxFDi/YKg/5a5BfyUQeCzBVR9gq2CA29dgwGjM+L+v6oJv2C
         y7eOTTE4SrQtBtnpzDrkipFZv9bKwkph9zESD0N1yIF8CfUiHODtETtQih3Mf5f8J/Fw
         MIqn2+QM2hPOrTzCDg2+FjjmH3xxbCQecNFbxKyY4Q5W6vziv3ihp0J8gCWJlr/qKKjR
         4hLCOWgQ5F1ny2gaUNuvvafByD6Y4iw3+BHA+BaM9tMYwuojv1cnXpQpUhxmviM42N8Z
         PBfA==
X-Gm-Message-State: AOJu0YwAOmaC/RN8WAbBnb5aXIWfQuklfHy4ggBP02OXPnEBhIZLJf8t
	Z/dneWROkg6y3S+UNwO5cac/Rua5Je4XqI675NF8yKyXxWTSiyI+OEHR
X-Gm-Gg: AfdE7ckhm3+dwrPoCbHUrhHDlxivdkXlp8RTTHRM1Y/tT4mjSrH+2p//K+HZA716Ycv
	6SuIZ6MO9Ih0pCpFkvtjpbSjDG9A/6M1IYs0eWQ12FltCc+jFft0ZrO0RbyW2RI1HJmKzTHgznj
	bwD3fJyKDvjqQiiX87VZhrv2cBYzXxWw9C8lIg/5L+gsWyD3PXLpTQsNT3uaw5+IqpCLQ+0mUh9
	A1Dj3WLGCrmfJ4oVOb0Awh+j+Ya+ky6S2k9oDuDYQFe2kk/xXkBL5g61Dg4kNjF4WX/r/ppY7t9
	7dGoDnunJE+P1PXjLI7IsUTerMV5D1enXqtrWX/nQh2v8aZ7235cVT362wmkyJlsfQXkbJfwvYs
	zjYgbdG2gqT8FJ5BrJ06KcxSl47vYmfc/AH3WhE/UIsBtSxT3BAXux2BlgPe6vWmy8upLARM/lY
	OB5pUb/TPHlIoU+cnehnp/eyn70zkkI48YSNYE2wakDNP/EqONHaJXfUxAXSrvxiPcdXCF6pAot
	Npbbyxw2luPgleX
X-Received: by 2002:a05:6a20:12d2:b0:3bf:a941:8932 with SMTP id adf61e73a8af0-3c0bcec17cfmr11767969637.19.1783635598702;
        Thu, 09 Jul 2026 15:19:58 -0700 (PDT)
Received: from Tejas-Legion-7-16IRX9.am.students.amrita.edu ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm40380498c88.8.2026.07.09.15.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:19:58 -0700 (PDT)
From: Teja Sai Charan B <tejaasaye@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
Subject: [PATCH v3] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Date: Fri, 10 Jul 2026 03:49:44 +0530
Message-ID: <20260709221944.159244-1-tejaasaye@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6963-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tejaasaye@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tejaasaye@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tejaasaye@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01FC0735FC7

From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

Convert the rtc-cmos devicetree bindings to dt schema.

The original text binding documents only the motorola,mc146818
compatible. Existing in-tree Devicetree sources also use the
intel,ce4100-rtc compatible together with the motorola,mc146818
fallback, but this was not documented. Document the Intel variant in the
schema so that these existing configurations are accepted during schema
validation.

Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

---

Changes in v2:
- Allow intel,ce4100-rtc compatible used by existing DTS files

Changes in v3:
- Drop accidentally added result.txt
- Fix example unit-address to match reg property
---
 .../devicetree/bindings/rtc/rtc-cmos.txt      | 27 --------
 .../devicetree/bindings/rtc/rtc-cmos.yaml     | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt b/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
deleted file mode 100644
index 7d7b5f6bda65..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
+++ /dev/null
@@ -1,27 +0,0 @@
- Motorola mc146818 compatible RTC
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Required properties:
-  - compatible : "motorola,mc146818"
-  - reg : should contain registers location and length.
-
-Optional properties:
-  - interrupts : should contain interrupt.
-  - ctrl-reg : Contains the initial value of the control register also
-    called "Register B".
-  - freq-reg : Contains the initial value of the frequency register also
-    called "Register A".
-
-"Register A" and "B" are usually initialized by the firmware (BIOS for
-instance). If this is not done, it can be performed by the driver.
-
-ISA Example:
-
-	rtc@70 {
-	         compatible = "motorola,mc146818";
-	         interrupts = <8 3>;
-	         interrupt-parent = <&ioapic1>;
-	         ctrl-reg = <2>;
-	         freq-reg = <0x26>;
-	         reg = <1 0x70 2>;
-	 };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
new file mode 100644
index 000000000000..e37927e9916c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-cmos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola mc146818 compatible RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: motorola,mc146818
+
+      - items:
+          - const: intel,ce4100-rtc
+          - const: motorola,mc146818
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ctrl-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the control register
+      (also known as Register B).
+
+  freq-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the frequency register
+      (also known as Register A).
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        rtc@1,70 {
+            compatible = "motorola,mc146818";
+            reg = <0x1 0x70 0x2>;
+
+            interrupts = <8 3>;
+
+            ctrl-reg = <2>;
+            freq-reg = <0x26>;
+        };
+    };
-- 
2.43.0


