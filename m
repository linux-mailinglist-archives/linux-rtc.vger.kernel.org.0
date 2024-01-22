Return-Path: <linux-rtc+bounces-570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F38363AE
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jan 2024 13:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CD828F6DC
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jan 2024 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84913BB24;
	Mon, 22 Jan 2024 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCsMg8NO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239C3A1A5;
	Mon, 22 Jan 2024 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705927800; cv=none; b=HcGrbVSYyGDtFrxMt3WHcx+EDwh0rrpbeJC57B3mJ3vUGd/N/WNAvrdCexQNBVHpVSDLIvs26hmdzHj5oiU49oNb1n3qwEbvZwUIFEvmJz1u1saQopD/JvHoWt6qbn8HSvpVuVYsokCOoDTrKiqhTY5G6HSpJ77cpZWia8fpw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705927800; c=relaxed/simple;
	bh=znXpPawD5w5l+ZHHYe5GbnDusfFCdx9H/EgMVxkOcWA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=REl0eB2OcnXgmLaFFRRx0GfsW6v0oNfC43j3b7YBcduUKbQxrcF3pzr/DiSz3ASWgEYPYpyFzYqKzUGv6m0lUCRpLNFfLOlP7FDJBgyXXj74I9FEydHks8p0xQdt8d1LUK3XoLBu0E4c7sI35JshZOpLLYttHE7y8MlIwRJaP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCsMg8NO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2c179aa5c4so323167766b.0;
        Mon, 22 Jan 2024 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705927797; x=1706532597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCsG1qVHqedwjqFrj900rKt8IpNXtxQ6hDjxWvk8LME=;
        b=cCsMg8NOFJrUqrPfDU0lX03kqT+JB/kmR8Ls41LAUOwaAbkljO4YktoqxVVN7wiWZQ
         P3K4VyEHy+iYUjHxaSYH04L9ep8YsZ4YvuSbP4G0fqt0hevBRckrxi26StnHs/1X6EQq
         Lip82THsk4KCMZDlirG/24vMqDE6cczM5WZzlHnGBjHVJuEXpJzaDVbyjxAmktYuBwGR
         2XP5v+quV+VDcs/UEbrhc7xZzpeWi0/FfzKmFxoOPmCn2/KsVKcmxjmhzpsWIwXm+rQk
         N83vWiuyyHXOVNxv4gvxGWw73mSwTLp1M+mUMbBQzq5Z1Tgg9gFiAlrlD1GyBbioQSPa
         UItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705927797; x=1706532597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCsG1qVHqedwjqFrj900rKt8IpNXtxQ6hDjxWvk8LME=;
        b=QozkDYUS/DpXQehuMyy7kIXyQm3uH5VdsaEN1rdzYAr3Hz3U6q/tRFO9c8SwFcAWqK
         s68xfXZlSnhkazboa3v+pFyqPK+mjtQZKRBOiNuPYMhr5+YmqAe8P/3FmYLrmlu6LE2V
         Bykjs+xrGO7YKm27CFALNYhehvzrR5mKaLF4d0tLCjewHZZDu8m6c7cRZPO5C/kBDjxb
         1l9cczkUtFiBp4rZ1SgnEoowJTa/RoxqPpJy3tnp6jxjRVJp6R8B43ItAgEU2X0V4y3W
         AZct/P0XFbG18r1CzAn8rcFNi5UQPOYPP+o9I/2OpFoAc/Bnzp6/WoW5zMWhPwIeW+FS
         Y+Yg==
X-Gm-Message-State: AOJu0Yz2tt82XksditQD8kVc3MpwReRnKPAfQUirZIL1Jkgzf2H2PZE9
	jHevIvv7m41CVyvMtrHokRViedE/Yc4SWweGEj4lMiL6VbZHta3q
X-Google-Smtp-Source: AGHT+IE5avahwyww21Ka3m0n0aKAE/n/woz1/5tmBlr1BHE2s3vfE8YTfgSRU/TVkOtb92hxNdpMQw==
X-Received: by 2002:a17:906:6a1f:b0:a30:721d:d21f with SMTP id qw31-20020a1709066a1f00b00a30721dd21fmr574844ejc.143.1705927796956;
        Mon, 22 Jan 2024 04:49:56 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id kw7-20020a170907770700b00a29dcbe1e72sm13250229ejc.56.2024.01.22.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:49:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ran Bi <ran.bi@mediatek.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Date: Mon, 22 Jan 2024 13:49:49 +0100
Message-Id: <20240122124949.29577-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. Introduced changes:
1. Reworded title
2. Dropper redundant properties descriptions
3. Added required #include and adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
 2 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
new file mode 100644
index 000000000000..75624ddf6d4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt2712-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2712 on-SoC RTC
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Ran Bi <ran.bi@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt2712-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rtc@10011000 {
+        compatible = "mediatek,mt2712-rtc";
+        reg = <0x10011000 0x1000>;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
deleted file mode 100644
index c33d87e5e753..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Device-Tree bindings for MediaTek SoC based RTC
-
-Required properties:
-- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
-- reg 		    : Specifies base physical address and size of the registers;
-- interrupts	    : Should contain the interrupt for RTC alarm;
-
-Example:
-
-rtc: rtc@10011000 {
-	compatible = "mediatek,mt2712-rtc";
-	reg = <0 0x10011000 0 0x1000>;
-	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
-};
-- 
2.35.3


