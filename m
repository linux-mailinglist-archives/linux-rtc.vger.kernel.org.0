Return-Path: <linux-rtc+bounces-5142-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C7C051D9
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 959664232EA
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A46307496;
	Fri, 24 Oct 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eSABCDEC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E92306D26;
	Fri, 24 Oct 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294812; cv=none; b=NxF+VzY817oxEjEPvKOn/ytOT2poZE3TpZvbH7PrrEsbLP2t6XHUEZc3UwWfydOftmhKMQWVv3okFPc3pT6B3KwmhRNQPYwFUxZibioi5Xlq4vMzseWY7ZVbLuCDsra4RoV9CjDPP6rrf/iPSDjavonMSPX+AXGofql6G6qPKf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294812; c=relaxed/simple;
	bh=Y2h/i9vmXSirUwONakbB3cZIqXs0dK3R7Y5HuTICkCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBeyeVOOt6m7Ejen8vJlAqjXvR66gOrQGaMtBPQYm7Y4mpQLgmMMazAKfyBsIainXyUDRFd1YiTvNeFRMso4d/r4lcYNueqPt/UtL48zplZnNJAiXf+Ss7AabA2zkA/H3GQe80fkWDAhjfxT0Q83WPfdF/yrjJCTzJEAjGY4rhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eSABCDEC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294808;
	bh=Y2h/i9vmXSirUwONakbB3cZIqXs0dK3R7Y5HuTICkCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eSABCDECYKxjUgcslxlJlrkXeS3ccq5ZkiZkx8zOuZraGoCRwG0vDQuihD9u91g0u
	 Pu+Q2/UnHXXBU00UvYzjETNeW37ZoYVl3g+49/6BfMBhfdXZOp/pxPn9J6Nbg2cJU2
	 kzSWG5A6PoCBYh+tYw6klmyiXpBhLoY2Rs7xdy8r3qfmrH6Q/953VqavOJAS+lIObw
	 0EvcCLEyN8EkHGeOBXidAaHWjILbWmpPuISATGj6mJiT9YRTtKMJ/rGbi77cRtUgYH
	 KhKwWJ0/Y2ksfhmx2sNyydD0mIsY7UPXgkCNBVWXl6nAFzr1lT7mA8gABPdxRiluSk
	 rJ7pvoSDl+qfA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C7F717E1310;
	Fri, 24 Oct 2025 10:33:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC Real Time Clock
Date: Fri, 24 Oct 2025 10:33:17 +0200
Message-ID: <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT6685 PM / Clock IC contains various SPMI sub
devices, of which two are Real Time Clock IPs, one usually
reserved for the secure world and one for the unsecured one,
reachable at different SPMI addresses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

NOTE: This does not contain any example because the MT6685 RTC
      will be added to the mfd binding for MediaTek SPMI PMICs
      and examples will be there.

** For reviewing purposes, this is how the example will look like: **

  - |
    #include <dt-bindings/interrupt-controller/irq.h>
    #include <dt-bindings/spmi/spmi.h>

    spmi {
      #address-cells = <2>;
      #size-cells = <0>;

      pmic@9 {
        compatible = "mediatek,mt6363";
        reg = <0x9 SPMI_USID>;
        interrupts = <9 1 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        #address-cells = <1>;
        #interrupt-cells = <3>;
        #size-cells = <0>;

        clock-controller@514 {
          compatible = "mediatek,mt6685-sck-top";
          reg = <0x514>;
          #clock-cells = <1>;
        };

        rtc@580 {
          compatible = "mediatek,mt6685-rtc";
          reg = <0x580>;
          interrupts = <9 0 IRQ_TYPE_LEVEL_HIGH>;
        };
      };
    };

 .../bindings/rtc/mediatek,mt6685-rtc.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
new file mode 100644
index 000000000000..1aec163b251a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt6685-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6685 PM/Clock IC Real Time Clock
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt6685-rtc
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
+
+unevaluatedProperties: false
-- 
2.51.1


