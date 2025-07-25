Return-Path: <linux-rtc+bounces-4585-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24FB11B7E
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 12:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ABBC7BCA47
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D72D63E2;
	Fri, 25 Jul 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQlhA1ns"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234A2D5A18
	for <linux-rtc@vger.kernel.org>; Fri, 25 Jul 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753437773; cv=none; b=u68DM4G5irD37deIUeBlusaWiHR5oRGCHPrEjFcU5sdAnYP3ONFWwT5dfMVVF3GPrEKZHUE8gp2FIF2cNKSXnGPgmlaiUScW/yszmRvYSny4JbxK+d+8D2tXTgRg3g7as4BhdRt7+SUMhTIGmliAdWWGm1ZaE9nW+aYW0Ohm2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753437773; c=relaxed/simple;
	bh=UrxzcDP0J0GUK2aMRwvYPnrrXPp3f2UnJaUqP7Op3pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2VD+Cl9aQRsJTAgcD6nBvYVpKpPXxAdgppPVcG1qR3lktQIOKMLkUh84qGSxwDNIODy5EtGd1cXonMFkPhMl4tl1M41GglfAJ4xQSRyXTZSi8uyTMqxXpN+/R2qvIVb6OFKFuhfXh+DO5RUYxkPjWcE7FuAYgKsGl5vu+prPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQlhA1ns; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b778841c4cso690f8f.3
        for <linux-rtc@vger.kernel.org>; Fri, 25 Jul 2025 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753437767; x=1754042567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNv9b123i3EbVhUDdsqpr2h+3+o6HjY6c7DftKN/zZI=;
        b=vQlhA1nsL/7QqxmlZ7t6gQL3rsXf0cWQlTH0qu2ZA1ji9K8fxbANx1jO8OGWrMKdzU
         BaRDIboGL2v1mcDOh4hN3wWAfmSrlSGq0u3Pp1cJtSZQuVNp3RMFWN/B8k+OyiQDHKOR
         lvNkPMNIMFjFhhsRMIPNvTXRJ2rPDKROF8Q9cHvmeOZfdtT70CNIGYS9n4ZiuCNR16MK
         tJxwmGzG1BPZ/ZDa+2YTi+lrzM1wxX/naR/v0wZS7WzhFeOg3Pmu/Z0zBzhMLFHKJhcP
         Vy47WClUopmBMDkOfXI2UZiOHH1ZT0TKbiN4qXxMVV/5j91vFkQyMTldOfXpxNXpA3Wa
         2yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753437767; x=1754042567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNv9b123i3EbVhUDdsqpr2h+3+o6HjY6c7DftKN/zZI=;
        b=bBgspBm0Zc0wO/rTq+5xNfkZAdNY7JpokOcxcoi8Sg5xDYNMYxEsTcj9IwdFBemOqB
         mZHhEpmXDb8+9hOtwviYPwUZWfQe8qlL5t8P4+aZTWvoCE2gV5MhU2Nt3mMDWzxFxk+N
         Qo+YEIGoZQdhYHBWkMhty61fRLjouKwZTNjA/Ob5XY02SzC3+9I6BYAjGxdG33ZbF6+S
         qnoGzG+F4FpmD0bclb5O78rkHIhDT6jkJk5H84e0liuhauGCF4iEKORYdG2FZkhV6AMz
         Yn8yzUqetrV1VUzMX64NuDkpGSAcOPpOiX4I61MYgt1EFtMpjNgzBYYjkCJfOKr6zfJe
         cbUA==
X-Forwarded-Encrypted: i=1; AJvYcCWL+67W85wFfomaNK57E3pBZwoyTYB5QFVloPO4xS1O6DuHQIN+TDLYddfur2C+660LWb3i9SDX4hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3OLJ8tY8RsD2emcQsYpCIGywSXSwl7DXv7fqa09d8nFTQT80
	pEWvQFyeK7fAA9zCMwOhzDtohToNvXHlidoL1bwzhwzeq8eAyeFnnoEWeKUi/f3NZrQ=
X-Gm-Gg: ASbGnctlApnE1TTSZJwSfcoMfkbANYuMHcHBsWGty1Cn+lYHgZPiF51XUWJvkvTrlLh
	Uu4pUL2SG2ZFcQViGanN7BFEkdGADNod5661NVV2tNiW5E0KzqjUbij8dY1+72UIfAawx0f+1sG
	GP3NcAo68x1nkW0V9FB5yMdNezc+tIn+eXJzonQ3oYZLaUp5X39Grv6KcsJq/SCWt7EmZx5Nkyy
	wCzwfHkJF8W+4v8HuR5mBnentSOcas/f5WTqaM7w4RIWJhV/U3WE5Y4fcqOdxQiNigDbWDDraeT
	kcPUS4qgHnfTN7W0RFee8FaJq8ubYZQv5hhFSd2XjGDVWohY5gDSqJvR6Qrf9b56jNGmzJQ7Fca
	LMwxC1y5u0FzjEevuiuwTzf0ilHfHA0ny
X-Google-Smtp-Source: AGHT+IHmxLA48JJqA+E5+xFuyPS9uYc+ZSINlWsUJ/LetdBxRU58L3ltzRlSKKIp95CGp1QuEQHy9g==
X-Received: by 2002:adf:a111:0:b0:3b7:76c4:5d0e with SMTP id ffacd0b85a97d-3b776c45f2fmr305327f8f.14.1753437766904;
        Fri, 25 Jul 2025 03:02:46 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcb83c5sm4586171f8f.60.2025.07.25.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:02:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: Correct indentation and style in DTS example
Date: Fri, 25 Jul 2025 12:02:42 +0200
Message-ID: <20250725100241.120106-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=37180; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=UrxzcDP0J0GUK2aMRwvYPnrrXPp3f2UnJaUqP7Op3pE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBog1ZBXe7wl7mkQsC9CTbzs2JbA+TUmKhLJs76p
 fLaIourZkWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaINWQQAKCRDBN2bmhouD
 12QSEACJp8AeQjO6KUO+dlpDhoSfykIrH1q5zpz+M7vLF8FI0LX3+GctY+gZjN8SYSoU//TLm1D
 YKHa7lfJwb+jsAY5cMSV2L3b9RSjw0+ET7b4Y3hZ+HSPzINhsmxR3n6Bl2hh96/56a6AocQ7Wib
 zUp2PCCRr3MNNnAG8QytYPcK0s9Bu2ht0G/t8asZEPJi3MzEvMaiGwucUV97PCnJ6N2O3LmXWrN
 fnuJCZX2+XyoZNZayGwRIwKlOcXNFybbq2FKHmOZBabNiCi1xo63QXM2gGweMxtjV4eVmvIFYez
 qsV7mPpg700wfZQm245/oJnep1lNy0N+FgdU+aVl2Mw9atAlsOZe1+PdZPDZndZ4e9Q2VPP5tok
 e2EDTsOSguLh/RDd9odoDsVdRvAM39M3IiMK5bnzbhWiugpL8jM+rEUOzFXH5m9f03pl+X5weA9
 G/kDhGBYhLmpXbdAO8SbXggI7clWSoOpe5Btof+aq12+7xPvrpp3Rdb31Mvkj2o0WuPtwihvfk4
 k34tcCaFug0EiOQ5A+k7RRmh51KGbw/rellBc92d4ji0HvMCW5LLWiwsDZCgk7f3qCH0ZH3sZpU
 Cu0Q2Dn49LFy3HvlOlMOqMweoyUQAFK8QdsxjJ0rZhdIUoFXQX13oCyEHGNnUylPrpez5soHqLj ecV8FORzwvLIE4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
Acked-by: Lee Jones <lee@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Link: https://lore.kernel.org/r/20250107131456.247610-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rebase on latest Rob's for-next tree, collect tags.
2. Patch also applies cleanly on next, so there are no cross tree
   conflicts expected.
---
 .../arm/arm,trace-buffer-extension.yaml       |  10 +-
 .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
 ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
 .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
 .../bindings/iommu/riscv,iommu.yaml           |   6 +-
 .../devicetree/bindings/leds/leds-mt6360.yaml | 195 +++++++++---------
 .../devicetree/bindings/mips/brcm/soc.yaml    |  42 ++--
 .../misc/intel,ixp4xx-ahb-queue-manager.yaml  |   6 +-
 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
 .../bindings/mtd/technologic,nand.yaml        |   2 +-
 .../bindings/nvmem/amlogic,meson6-efuse.yaml  |   2 +-
 .../bindings/pci/ti,j721e-pci-ep.yaml         |  34 +--
 .../bindings/power/reset/qcom,pon.yaml        |  62 +++---
 .../nvidia,tegra264-bpmp-shmem.yaml           |  15 +-
 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-
 .../amlogic/amlogic,meson-gx-hhi-sysctrl.yaml |  26 +--
 .../bindings/soc/qcom/qcom,eud.yaml           |  38 ++--
 .../bindings/soc/ti/wkup-m3-ipc.yaml          |  32 +--
 19 files changed, 343 insertions(+), 343 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,trace-buffer-extension.yaml b/Documentation/devicetree/bindings/arm/arm,trace-buffer-extension.yaml
index 87128e7b7d28..f5b54b4fc55d 100644
--- a/Documentation/devicetree/bindings/arm/arm,trace-buffer-extension.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,trace-buffer-extension.yaml
@@ -41,10 +41,10 @@ additionalProperties: false
 examples:
 
   - |
-   #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-   trbe {
-     compatible = "arm,trace-buffer-extension";
-     interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
-   };
+    trbe {
+        compatible = "arm,trace-buffer-extension";
+        interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
+    };
 ...
diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
index 3e996346b264..4970b9167d1c 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
@@ -55,17 +55,17 @@ unevaluatedProperties: false
 examples:
   - |
     ahb {
-      compatible = "st,mlahb", "simple-bus";
-      #address-cells = <1>;
-      #size-cells = <1>;
-      ranges;
-      dma-ranges = <0x00000000 0x38000000 0x10000>,
-                   <0x10000000 0x10000000 0x60000>,
-                   <0x30000000 0x30000000 0x60000>;
+        compatible = "st,mlahb", "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        dma-ranges = <0x00000000 0x38000000 0x10000>,
+                     <0x10000000 0x10000000 0x60000>,
+                     <0x30000000 0x30000000 0x60000>;
 
-      m4_rproc: m4@10000000 {
-       reg = <0x10000000 0x40000>;
-      };
+        m4_rproc: m4@10000000 {
+            reg = <0x10000000 0x40000>;
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index ca8d8661f872..abc52978be7a 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -81,25 +81,25 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     dsp@10803000 {
-       compatible =  "mediatek,mt8195-dsp";
-       reg = <0x10803000  0x1000>,
-             <0x10840000  0x40000>;
-       reg-names = "cfg", "sram";
-       clocks = <&topckgen 10>, //CLK_TOP_ADSP
-                <&clk26m>,
-                <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
-                <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
-                <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
-                <&topckgen 34>; //CLK_TOP_AUDIO_H
-       clock-names = "adsp_sel",
-                     "clk26m_ck",
-                     "audio_local_bus",
-                     "mainpll_d7_d2",
-                     "scp_adsp_audiodsp",
-                     "audio_h";
-       memory-region = <&adsp_dma_mem_reserved>,
-                       <&adsp_mem_reserved>;
-       power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
-       mbox-names = "rx", "tx";
-       mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+        compatible =  "mediatek,mt8195-dsp";
+        reg = <0x10803000 0x1000>,
+              <0x10840000 0x40000>;
+        reg-names = "cfg", "sram";
+        clocks = <&topckgen 10>, //CLK_TOP_ADSP
+                 <&clk26m>,
+                 <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
+                 <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
+                 <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
+                 <&topckgen 34>; //CLK_TOP_AUDIO_H
+        clock-names = "adsp_sel",
+                      "clk26m_ck",
+                      "audio_local_bus",
+                      "mainpll_d7_d2",
+                      "scp_adsp_audiodsp",
+                      "audio_h";
+        memory-region = <&adsp_dma_mem_reserved>,
+                        <&adsp_mem_reserved>;
+        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
+        mbox-names = "rx", "tx";
+        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
     };
diff --git a/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
index e6bed7d93e2d..50f1f08744a1 100644
--- a/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
@@ -62,33 +62,33 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     npe: npe@c8006000 {
-         compatible = "intel,ixp4xx-network-processing-engine";
-         reg = <0xc8006000 0x1000>, <0xc8007000 0x1000>, <0xc8008000 0x1000>;
-         #address-cells = <1>;
-         #size-cells = <0>;
+        compatible = "intel,ixp4xx-network-processing-engine";
+        reg = <0xc8006000 0x1000>, <0xc8007000 0x1000>, <0xc8008000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-         hss@0 {
-             compatible = "intel,ixp4xx-hss";
-             reg = <0>;
-             intel,npe-handle = <&npe 0>;
-             intel,queue-chl-rxtrig = <&qmgr 12>;
-             intel,queue-chl-txready = <&qmgr 34>;
-             intel,queue-pkt-rx = <&qmgr 13>;
-             intel,queue-pkt-tx = <&qmgr 14>, <&qmgr 15>, <&qmgr 16>, <&qmgr 17>;
-             intel,queue-pkt-rxfree = <&qmgr 18>, <&qmgr 19>, <&qmgr 20>, <&qmgr 21>;
-             intel,queue-pkt-txdone = <&qmgr 22>;
-             cts-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
-             rts-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
-             dcd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
-             dtr-gpios = <&gpio_74 2 GPIO_ACTIVE_LOW>;
-             clk-internal-gpios = <&gpio_74 0 GPIO_ACTIVE_HIGH>;
-         };
+        hss@0 {
+            compatible = "intel,ixp4xx-hss";
+            reg = <0>;
+            intel,npe-handle = <&npe 0>;
+            intel,queue-chl-rxtrig = <&qmgr 12>;
+            intel,queue-chl-txready = <&qmgr 34>;
+            intel,queue-pkt-rx = <&qmgr 13>;
+            intel,queue-pkt-tx = <&qmgr 14>, <&qmgr 15>, <&qmgr 16>, <&qmgr 17>;
+            intel,queue-pkt-rxfree = <&qmgr 18>, <&qmgr 19>, <&qmgr 20>, <&qmgr 21>;
+            intel,queue-pkt-txdone = <&qmgr 22>;
+            cts-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+            rts-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
+            dcd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
+            dtr-gpios = <&gpio_74 2 GPIO_ACTIVE_LOW>;
+            clk-internal-gpios = <&gpio_74 0 GPIO_ACTIVE_HIGH>;
+        };
 
-         crypto {
-             compatible = "intel,ixp4xx-crypto";
-             intel,npe-handle = <&npe 2>;
-             queue-rx = <&qmgr 30>;
-             queue-txready = <&qmgr 29>;
-         };
+        crypto {
+            compatible = "intel,ixp4xx-crypto";
+            intel,npe-handle = <&npe 2>;
+            queue-rx = <&qmgr 30>;
+            queue-txready = <&qmgr 29>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
index 80833462f620..41b368d54557 100644
--- a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
+++ b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
@@ -27,7 +27,7 @@ additionalProperties: false
 examples:
   - |
     versal_fpga: versal-fpga {
-         compatible = "xlnx,versal-fpga";
+        compatible = "xlnx,versal-fpga";
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index 5d015eeb06d0..d4838c3b3741 100644
--- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -139,9 +139,9 @@ examples:
 
             /* The IOMMU programming interface uses slot 00:01.0 */
             iommu0: iommu@1,0 {
-               compatible = "pci1efd,edf1", "riscv,pci-iommu";
-               reg = <0x800 0 0 0 0>;
-               #iommu-cells = <1>;
+                compatible = "pci1efd,edf1", "riscv,pci-iommu";
+                reg = <0x800 0 0 0 0>;
+                #iommu-cells = <1>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index d84e28e616d7..d2e1d8afc302 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -87,106 +87,105 @@ additionalProperties: false
 
 examples:
   - |
-   #include <dt-bindings/leds/common.h>
-   led-controller {
-     compatible = "mediatek,mt6360-led";
-     #address-cells = <1>;
-     #size-cells = <0>;
+    #include <dt-bindings/leds/common.h>
+    led-controller {
+        compatible = "mediatek,mt6360-led";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-     multi-led@0 {
-       reg = <0>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_RGB>;
-       led-max-microamp = <24000>;
-       #address-cells = <1>;
-       #size-cells = <0>;
-       led@0 {
-         reg = <0>;
-         color = <LED_COLOR_ID_RED>;
-       };
-       led@1 {
-         reg = <1>;
-         color = <LED_COLOR_ID_GREEN>;
-       };
-       led@2 {
-         reg = <2>;
-         color = <LED_COLOR_ID_BLUE>;
-       };
-     };
-     led@3 {
-       reg = <3>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_WHITE>;
-       led-max-microamp = <150000>;
-     };
-     led@4 {
-       reg = <4>;
-       function = LED_FUNCTION_FLASH;
-       color = <LED_COLOR_ID_WHITE>;
-       function-enumerator = <1>;
-       led-max-microamp = <200000>;
-       flash-max-microamp = <500000>;
-       flash-max-timeout-us = <1024000>;
-     };
-     led@5 {
-       reg = <5>;
-       function = LED_FUNCTION_FLASH;
-       color = <LED_COLOR_ID_WHITE>;
-       function-enumerator = <2>;
-       led-max-microamp = <200000>;
-       flash-max-microamp = <500000>;
-       flash-max-timeout-us = <1024000>;
-     };
-   };
+        multi-led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_RGB>;
+            led-max-microamp = <24000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RED>;
+            };
+            led@1 {
+                reg = <1>;
+                color = <LED_COLOR_ID_GREEN>;
+            };
+            led@2 {
+                reg = <2>;
+                color = <LED_COLOR_ID_BLUE>;
+            };
+        };
+        led@3 {
+            reg = <3>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <150000>;
+        };
+        led@4 {
+            reg = <4>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+        };
+        led@5 {
+            reg = <5>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+        };
+    };
 
   - |
+    led-controller {
+        compatible = "mediatek,mt6360-led";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-   led-controller {
-     compatible = "mediatek,mt6360-led";
-     #address-cells = <1>;
-     #size-cells = <0>;
-
-     led@0 {
-       reg = <0>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_RED>;
-       led-max-microamp = <24000>;
-     };
-     led@1 {
-       reg = <1>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_GREEN>;
-       led-max-microamp = <24000>;
-     };
-     led@2 {
-       reg = <2>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_BLUE>;
-       led-max-microamp = <24000>;
-     };
-     led@3 {
-       reg = <3>;
-       function = LED_FUNCTION_INDICATOR;
-       color = <LED_COLOR_ID_WHITE>;
-       led-max-microamp = <150000>;
-     };
-     led@4 {
-       reg = <4>;
-       function = LED_FUNCTION_FLASH;
-       color = <LED_COLOR_ID_WHITE>;
-       function-enumerator = <1>;
-       led-max-microamp = <200000>;
-       flash-max-microamp = <500000>;
-       flash-max-timeout-us = <1024000>;
-     };
-     led@5 {
-       reg = <5>;
-       function = LED_FUNCTION_FLASH;
-       color = <LED_COLOR_ID_WHITE>;
-       function-enumerator = <2>;
-       led-max-microamp = <200000>;
-       flash-max-microamp = <500000>;
-       flash-max-timeout-us = <1024000>;
-     };
-   };
+        led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_RED>;
+            led-max-microamp = <24000>;
+        };
+        led@1 {
+            reg = <1>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_GREEN>;
+            led-max-microamp = <24000>;
+        };
+        led@2 {
+            reg = <2>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_BLUE>;
+            led-max-microamp = <24000>;
+        };
+        led@3 {
+            reg = <3>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <150000>;
+        };
+        led@4 {
+            reg = <4>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+        };
+        led@5 {
+            reg = <5>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
index 0cc634482a6a..461a8c063313 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -92,29 +92,29 @@ additionalProperties: true
 
 examples:
   - |
-     / {
-         compatible = "brcm,bcm3368";
-         #address-cells = <1>;
-         #size-cells = <1>;
-         model = "Broadcom 3368";
+    / {
+        compatible = "brcm,bcm3368";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        model = "Broadcom 3368";
 
-         cpus {
-           #address-cells = <1>;
-           #size-cells = <0>;
+        cpus {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-           mips-hpt-frequency = <150000000>;
+            mips-hpt-frequency = <150000000>;
 
-           cpu@0 {
-             compatible = "brcm,bmips4350";
-             device_type = "cpu";
-             reg = <0>;
-           };
+            cpu@0 {
+                compatible = "brcm,bmips4350";
+                device_type = "cpu";
+                reg = <0>;
+            };
 
-           cpu@1 {
-             compatible = "brcm,bmips4350";
-             device_type = "cpu";
-             reg = <1>;
-           };
-         };
-       };
+            cpu@1 {
+                compatible = "brcm,bmips4350";
+                device_type = "cpu";
+                reg = <1>;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml b/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
index 36a9dbdf3f03..aab89946b04f 100644
--- a/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
+++ b/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
@@ -45,7 +45,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     qmgr: queue-manager@60000000 {
-         compatible = "intel,ixp4xx-ahb-queue-manager";
-         reg = <0x60000000 0x4000>;
-         interrupts = <3 IRQ_TYPE_LEVEL_HIGH>, <4 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "intel,ixp4xx-ahb-queue-manager";
+        reg = <0x60000000 0x4000>;
+        interrupts = <3 IRQ_TYPE_LEVEL_HIGH>, <4 IRQ_TYPE_LEVEL_HIGH>;
     };
diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index ba15ccbda61a..c754ea71f51f 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -266,49 +266,49 @@ examples:
     #include <dt-bindings/power/r8a7790-sysc.h>
 
     sdhi0: mmc@ee100000 {
-            compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
-            reg = <0xee100000 0x328>;
-            interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 314>;
-            dmas = <&dmac0 0xcd>, <&dmac0 0xce>, <&dmac1 0xcd>, <&dmac1 0xce>;
-            dma-names = "tx", "rx", "tx", "rx";
-            max-frequency = <195000000>;
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 314>;
+        compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
+        reg = <0xee100000 0x328>;
+        interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 314>;
+        dmas = <&dmac0 0xcd>, <&dmac0 0xce>, <&dmac1 0xcd>, <&dmac1 0xce>;
+        dma-names = "tx", "rx", "tx", "rx";
+        max-frequency = <195000000>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 314>;
     };
 
     sdhi1: mmc@ee120000 {
-             compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
-             reg = <0xee120000 0x328>;
-             interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-             clocks = <&cpg CPG_MOD 313>;
-             dmas = <&dmac0 0xc9>, <&dmac0 0xca>, <&dmac1 0xc9>, <&dmac1 0xca>;
-             dma-names = "tx", "rx", "tx", "rx";
-             max-frequency = <195000000>;
-             power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-             resets = <&cpg 313>;
+        compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
+        reg = <0xee120000 0x328>;
+        interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 313>;
+        dmas = <&dmac0 0xc9>, <&dmac0 0xca>, <&dmac1 0xc9>, <&dmac1 0xca>;
+        dma-names = "tx", "rx", "tx", "rx";
+        max-frequency = <195000000>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 313>;
     };
 
     sdhi2: mmc@ee140000 {
-             compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
-             reg = <0xee140000 0x100>;
-             interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
-             clocks = <&cpg CPG_MOD 312>;
-             dmas = <&dmac0 0xc1>, <&dmac0 0xc2>, <&dmac1 0xc1>, <&dmac1 0xc2>;
-             dma-names = "tx", "rx", "tx", "rx";
-             max-frequency = <97500000>;
-             power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-             resets = <&cpg 312>;
-     };
-
-     sdhi3: mmc@ee160000 {
-              compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
-              reg = <0xee160000 0x100>;
-              interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
-              clocks = <&cpg CPG_MOD 311>;
-              dmas = <&dmac0 0xd3>, <&dmac0 0xd4>, <&dmac1 0xd3>, <&dmac1 0xd4>;
-              dma-names = "tx", "rx", "tx", "rx";
-              max-frequency = <97500000>;
-              power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-              resets = <&cpg 311>;
+        compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
+        reg = <0xee140000 0x100>;
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 312>;
+        dmas = <&dmac0 0xc1>, <&dmac0 0xc2>, <&dmac1 0xc1>, <&dmac1 0xc2>;
+        dma-names = "tx", "rx", "tx", "rx";
+        max-frequency = <97500000>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 312>;
+    };
+
+    sdhi3: mmc@ee160000 {
+        compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
+        reg = <0xee160000 0x100>;
+        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 311>;
+        dmas = <&dmac0 0xd3>, <&dmac0 0xd4>, <&dmac1 0xd3>, <&dmac1 0xd4>;
+        dma-names = "tx", "rx", "tx", "rx";
+        max-frequency = <97500000>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 311>;
     };
diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
index f9d87c46094b..a3c316436317 100644
--- a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
@@ -40,6 +40,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         nand@0 {
-           reg = <0>;
+            reg = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
index b5cf740f96fa..9879d521842e 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
@@ -53,6 +53,6 @@ examples:
         };
 
         temperature_calib: calib@1f4 {
-             reg = <0x1f4 0x4>;
+            reg = <0x1f4 0x4>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
index 97f2579ea908..29580cbd1767 100644
--- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
@@ -123,21 +123,21 @@ examples:
         #size-cells = <2>;
 
         pcie0_ep: pcie-ep@d000000 {
-           compatible = "ti,j721e-pcie-ep";
-           reg = <0x00 0x02900000 0x00 0x1000>,
-                 <0x00 0x02907000 0x00 0x400>,
-                 <0x00 0x0d000000 0x00 0x00800000>,
-                 <0x00 0x10000000 0x00 0x08000000>;
-           reg-names = "intd_cfg", "user_cfg", "reg", "mem";
-           ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x4070>;
-           max-link-speed = <3>;
-           num-lanes = <2>;
-           power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
-           clocks = <&k3_clks 239 1>;
-           clock-names = "fck";
-           max-functions = /bits/ 8 <6>;
-           dma-coherent;
-           phys = <&serdes0_pcie_link>;
-           phy-names = "pcie-phy";
-       };
+            compatible = "ti,j721e-pcie-ep";
+            reg = <0x00 0x02900000 0x00 0x1000>,
+                  <0x00 0x02907000 0x00 0x400>,
+                  <0x00 0x0d000000 0x00 0x00800000>,
+                  <0x00 0x10000000 0x00 0x08000000>;
+            reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+            ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x4070>;
+            max-link-speed = <3>;
+            num-lanes = <2>;
+            power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
+            clocks = <&k3_clks 239 1>;
+            clock-names = "fck";
+            max-functions = /bits/ 8 <6>;
+            dma-coherent;
+            phys = <&serdes0_pcie_link>;
+            phy-names = "pcie-phy";
+        };
     };
diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 3da3d02a6690..979a377cb4ff 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -115,40 +115,40 @@ allOf:
 
 examples:
   - |
-   #include <dt-bindings/interrupt-controller/irq.h>
-   #include <dt-bindings/input/linux-event-codes.h>
-   #include <dt-bindings/spmi/spmi.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+    #include <dt-bindings/spmi/spmi.h>
 
-   spmi@c440000 {
-     reg = <0x0c440000 0x1100>;
-     #address-cells = <2>;
-     #size-cells = <0>;
+    spmi@c440000 {
+        reg = <0x0c440000 0x1100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
 
-     pmic@0 {
-       reg = <0x0 SPMI_USID>;
-       #address-cells = <1>;
-       #size-cells = <0>;
+        pmic@0 {
+            reg = <0x0 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-       pon@800 {
-         compatible = "qcom,pm8998-pon";
-         reg = <0x800>;
+            pon@800 {
+                compatible = "qcom,pm8998-pon";
+                reg = <0x800>;
 
-         pwrkey {
-            compatible = "qcom,pm8941-pwrkey";
-            interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-            debounce = <15625>;
-            bias-pull-up;
-            linux,code = <KEY_POWER>;
-         };
+                pwrkey {
+                    compatible = "qcom,pm8941-pwrkey";
+                    interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+                    debounce = <15625>;
+                    bias-pull-up;
+                    linux,code = <KEY_POWER>;
+                };
 
-         resin {
-            compatible = "qcom,pm8941-resin";
-            interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-            debounce = <15625>;
-            bias-pull-up;
-            linux,code = <KEY_VOLUMEDOWN>;
-         };
-       };
-     };
-   };
+                resin {
+                    compatible = "qcom,pm8941-resin";
+                    interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+                    debounce = <15625>;
+                    bias-pull-up;
+                    linux,code = <KEY_VOLUMEDOWN>;
+                };
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
index f9b2f0fdc282..4380f622f9a9 100644
--- a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
@@ -36,12 +36,13 @@ required:
 examples:
   - |
     reserved-memory {
-       #address-cells = <2>;
-       #size-cells = <2>;
-       dram_cpu_bpmp_mail: shmem@f1be0000 {
-           compatible = "nvidia,tegra264-bpmp-shmem";
-           reg = <0x0 0xf1be0000 0x0 0x2000>;
-           no-map;
-       };
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        shmem@f1be0000 {
+            compatible = "nvidia,tegra264-bpmp-shmem";
+            reg = <0x0 0xf1be0000 0x0 0x2000>;
+            no-map;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index f6fdcc7090b6..1860f0e4c31a 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -61,14 +61,14 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/r9a06g032-sysctrl.h>
     rtc@40006000 {
-       compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
-       reg = <0x40006000 0x1000>;
-       interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
-                    <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
-                    <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
-       interrupt-names = "alarm", "timer", "pps";
-       clocks = <&sysctrl R9A06G032_HCLK_RTC>;
-       clock-names = "hclk";
-       power-domains = <&sysctrl>;
-       start-year = <2000>;
-     };
+        compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+        reg = <0x40006000 0x1000>;
+        interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "alarm", "timer", "pps";
+        clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+        clock-names = "hclk";
+        power-domains = <&sysctrl>;
+        start-year = <2000>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 3dc66f1de023..f3a85c67ce8a 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -186,22 +186,22 @@ examples:
         };
 
         power-controller {
-           compatible = "amlogic,meson-axg-pwrc";
-           #power-domain-cells = <1>;
-           amlogic,ao-sysctrl = <&sysctrl_AO>;
+            compatible = "amlogic,meson-axg-pwrc";
+            #power-domain-cells = <1>;
+            amlogic,ao-sysctrl = <&sysctrl_AO>;
 
-           resets = <&reset_viu>,
-                    <&reset_venc>,
-                    <&reset_vcbus>,
-                    <&reset_vencl>,
-                    <&reset_vid_lock>;
-           reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
-           clocks = <&clk_vpu>, <&clk_vapb>;
-           clock-names = "vpu", "vapb";
+            resets = <&reset_viu>,
+                     <&reset_venc>,
+                     <&reset_vcbus>,
+                     <&reset_vencl>,
+                     <&reset_vid_lock>;
+            reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
+            clocks = <&clk_vpu>, <&clk_vapb>;
+            clock-names = "vpu", "vapb";
         };
 
         phy {
-           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-           #phy-cells = <0>;
+            compatible = "amlogic,axg-mipi-pcie-analog-phy";
+            #phy-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..84218636c0d8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -55,25 +55,25 @@ additionalProperties: false
 examples:
   - |
     eud@88e0000 {
-           compatible = "qcom,sc7280-eud", "qcom,eud";
-           reg = <0x88e0000 0x2000>,
-                 <0x88e2000 0x1000>;
+        compatible = "qcom,sc7280-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
 
-           ports {
-                   #address-cells = <1>;
-                   #size-cells = <0>;
-                   port@0 {
-                           reg = <0>;
-                           eud_ep: endpoint {
-                                   remote-endpoint = <&usb2_role_switch>;
-                           };
-                   };
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                eud_ep: endpoint {
+                    remote-endpoint = <&usb2_role_switch>;
+                };
+            };
 
-                   port@1 {
-                           reg = <1>;
-                           eud_con: endpoint {
-                                   remote-endpoint = <&con_eud>;
-                           };
-                   };
-           };
+            port@1 {
+                reg = <1>;
+                eud_con: endpoint {
+                    remote-endpoint = <&con_eud>;
+                };
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/soc/ti/wkup-m3-ipc.yaml b/Documentation/devicetree/bindings/soc/ti/wkup-m3-ipc.yaml
index 0df41c4f60c1..56b16183c885 100644
--- a/Documentation/devicetree/bindings/soc/ti/wkup-m3-ipc.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/wkup-m3-ipc.yaml
@@ -121,13 +121,13 @@ examples:
         };
 
         wkup_m3_ipc@1324 {
-           compatible = "ti,am3352-wkup-m3-ipc";
-           reg = <0x1324 0x24>;
-           interrupts = <78>;
-           ti,rproc = <&wkup_m3>;
-           mboxes = <&am335x_mailbox &mbox_wkupm3>;
-           ti,vtt-gpio-pin = <7>;
-           firmware-name = "am335x-evm-scale-data.bin";
+            compatible = "ti,am3352-wkup-m3-ipc";
+            reg = <0x1324 0x24>;
+            interrupts = <78>;
+            ti,rproc = <&wkup_m3>;
+            mboxes = <&am335x_mailbox &mbox_wkupm3>;
+            ti,vtt-gpio-pin = <7>;
+            firmware-name = "am335x-evm-scale-data.bin";
         };
     };
 
@@ -155,20 +155,20 @@ examples:
             pinctrl-0 = <&ddr3_vtt_toggle_default>;
 
             ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
-                 pinctrl-single,pins = <
+                pinctrl-single,pins = <
                     0x25C (DS0_PULL_UP_DOWN_EN | PIN_OUTPUT_PULLUP | DS0_FORCE_OFF_MODE | MUX_MODE7)
-                 >;
+                >;
             };
         };
 
         wkup_m3_ipc@1324 {
-           compatible = "ti,am4372-wkup-m3-ipc";
-           reg = <0x1324 0x24>;
-           interrupts = <78>;
-           ti,rproc = <&wkup_m3>;
-           mboxes = <&am437x_mailbox &mbox_wkupm3>;
-           ti,set-io-isolation;
-           firmware-name = "am43x-evm-scale-data.bin";
+            compatible = "ti,am4372-wkup-m3-ipc";
+            reg = <0x1324 0x24>;
+            interrupts = <78>;
+            ti,rproc = <&wkup_m3>;
+            mboxes = <&am437x_mailbox &mbox_wkupm3>;
+            ti,set-io-isolation;
+            firmware-name = "am43x-evm-scale-data.bin";
         };
     };
 
-- 
2.48.1


