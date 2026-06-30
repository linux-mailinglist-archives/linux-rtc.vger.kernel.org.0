Return-Path: <linux-rtc+bounces-6794-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nejxGT0YRGq0oQoAu9opvQ
	(envelope-from <linux-rtc+bounces-6794-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:25:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DB6E78A8
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:25:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=oOLgsgIZ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6794-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6794-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09A8730D13B9
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABCD3B4EAC;
	Tue, 30 Jun 2026 19:22:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294753955D2
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 19:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847344; cv=none; b=VRg7qy7fCNuYCTH3Iia3KVVKwEuyLqMcJFB3/Yt1rLzahVR1toiy53oN0p3/Xow9jTqGy4yqQwYBd498jXT4vGsRg76ERDsj6tRguP4/81P1xYqAMSyCb4bBv5V2t56j55TilZgA8ISEfvDcZhZA5CLsSGwk2rIV2EUC49erTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847344; c=relaxed/simple;
	bh=iaAF+yS936aMUd2uo2ERhF4xGvZqCHabIEA/vQVk0Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gag2f1N8R6IX6Msay0ChgZOuCP7H1KQH0Q+oqbzIRkDqcuV7cQqTjjHzCS9sbkqwy+2qQudZvlM+emUtvVh7bGj5/5q+ZDVfb5iumcMBuB4Lr6qPZX+u1gID0EIQxHMbX72KH3v6t8btDcNcuo4awtIqcOrDgnNst90p+xZxtqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=oOLgsgIZ; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B30A9240103
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 21:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782847341; bh=rgjwVdw/2f/R8g0IOrUVxokMD0ga5Bc0eQVVG555Fmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=oOLgsgIZi4IdjAzkjhQn3nyAV3HAEp2jGBReD+IYW3eSJwmGTE+IBLE3MU8nxdH7/
	 YMLo0Q2akfmUAxydla6meQ/CZufxZE93RFpKED7B27CJq+QXoU7iy8TFPJPtQVs4D9
	 VsyofZEiX6cCKXeAJPBMnLdCR3bcD9lH31HL1W6tVJQiyxas0zq5nnCYvq4uGE4877
	 nkpFTjVkKV45twcEKtSXrBaVetrKtuQvW0mao9tbF44jCfyYscZdWPPnTHp+wVL7iG
	 QU5n/LyNWnf1fHN5XJ2bmUgw54wLlBZpi8mkW/vmDMvTVK7xDuo6QPE/X5SZL+jIpT
	 jGA/vvQtvqaUg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gqY1m1MnVz9rxD;
	Tue, 30 Jun 2026 21:22:20 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Tue, 30 Jun 2026 19:22:21 +0000
Subject: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
In-Reply-To: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=iaAF+yS936aMUd2uo2ERhF4xGvZqCHabIEA/vQVk0Kw=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqRBdqXhgSYQ1G0bopxHbsIuyeWtyg/MBsZTTdf
 45ajFXDTO2JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakQXahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Iv/xAAtmzNsqZ4vd/U9yb6fnuvE0OUx2FSk6q
 JXb2Vxdyfz7KcUoszlul4uvlrhilvBkGE8KK354Sgf8Chpbe8YpBdtgQ4X1P8IgSh68ZKNw+a/8
 z6Fu4qUhm3hhUDC1jY2qy9ytPR3Y+FFHZfxxMtuwi4sHF3F6FwwCHXEVhAAe+oJWAq/1mbGNvQ0
 tRWFtVuGIomUo/iRtVJHi04FOxZXQ0CNZBBTGLdH0pl31t52hITTss5gvXU9PYCpY2YM8TDXSHn
 +e6WBfYpYXJjX14L8svGmx1dpfhghclfK7xvCalzzm7lrbtRrH69QoVpYq3zCc9BqKzbxziOth8
 xNkNPuNjARR/Oz19IFE+ud14gLdXQWBZpICXzmcueFzH2ioQUSWDzs/HazTA6lENe73mk2jd2LL
 N08cRMrafMkD+LGcuX4q1UFFB7CXI24jhnhiJnn3rB8cFQZV6ULS+X8TLKDuQfwBJjL7aeCUW8D
 iNC3gwtLt8VhqGKcFTAXrjkugysHs/MnYOvHQhxZbDbFsn0uh04X6CWPhzraGZDfgkhGhnNdnHR
 gG0moiXumuCnOH3v9exAVMaVsHUYItMpD37BOIgmPEz5Sj5UHgsot63dI3TtcudoDxLkOI/JLMa
 UtLSCdeX2n0dxO/hCSw2nTtWc1VQhyjWrJrp6fs7rYcedsBvaG5A=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6794-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,kleine-koenig.org,lunn.ch,gmail.com];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.probst@posteo.de,m:krzk@kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:email,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B73DB6E78A8

Synology NAS devices use the output pin for interrupt signal 1 to wake up
the system.

Move devicetree bindings for sii,s35390a into its own file.
Add sii,wakealarm-output-pin property to enable the use of the output
pin for interrupt signal 1 for the wake alarm, which makes it possible to
set an wake alarm on Synology NAS devices.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
 MAINTAINERS                                        |  1 +
 include/dt-bindings/rtc/s35390a.h                  |  9 ++++
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
new file mode 100644
index 000000000000..31a578673870
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: S-35390A 2-WIRE REAL-TIME CLOCK
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
+  very low current consumption in the wide range of operation voltage.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: sii,s35390a
+
+  reg:
+    maxItems: 1
+
+  sii,wakealarm-output-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    description: |
+      The output pin to wake up the system.
+      Default will use the output pin for interrupt signal 2.
+        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
+        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/rtc/s35390a.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc: rtc@30 {
+            compatible = "sii,s35390a";
+            reg = <0x30>;
+            sii,wakealarm-output-pin = <S35390A_OUTPUT_PIN_INT2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index f4d0eed98a08..7b3f682ef4d5 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -81,8 +81,6 @@ properties:
       - ricoh,rv5c386
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,rv5c387a
-      # 2-wire CMOS real-time clock
-      - sii,s35390a
       # ST SPEAr Real-time Clock
       - st,spear600-rtc
       # VIA/Wondermedia VT8500 Real-time Clock
@@ -105,5 +103,4 @@ required:
   - reg
 
 additionalProperties: false
-
 ...
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..46a19a0873e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22690,6 +22690,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
 F:	Documentation/admin-guide/rtc.rst
 F:	Documentation/devicetree/bindings/rtc/
 F:	drivers/rtc/
+F:	include/dt-bindings/rtc/
 F:	include/linux/rtc.h
 F:	include/linux/rtc/
 F:	include/uapi/linux/rtc.h
diff --git a/include/dt-bindings/rtc/s35390a.h b/include/dt-bindings/rtc/s35390a.h
new file mode 100644
index 000000000000..bd99db118d31
--- /dev/null
+++ b/include/dt-bindings/rtc/s35390a.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_RTC_S35390A_H
+#define __DT_BINDINGS_RTC_S35390A_H
+
+#define S35390A_OUTPUT_PIN_INT1	1
+#define S35390A_OUTPUT_PIN_INT2	2
+
+#endif /* __DT_BINDINGS_RTC_S35390A_H */

-- 
2.54.0


