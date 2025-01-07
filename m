Return-Path: <linux-rtc+bounces-2846-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B713AA04099
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jan 2025 14:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94D0B3A20D6
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jan 2025 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E1C1F0E47;
	Tue,  7 Jan 2025 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9xPuIdH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12601F0E32
	for <linux-rtc@vger.kernel.org>; Tue,  7 Jan 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255705; cv=none; b=TQXTbOk+YtU4kWNus0ecEF8R2/0eQjyrRSC15IHty+vUMZ+pdqQ9nni1A560GhQMqyV8ERjVfdTUjXHzrYar1AwHloOsh6NzrwGSDI7weyze5HWM9fRVFTky1QowC63jPx+2oO2EotLPman4ln5Xzp99jwIwaM3h2K1PObtgZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255705; c=relaxed/simple;
	bh=E9E0DvPOE030dCNYjqf+omLPs/32wSlIKbP96tUH/5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OL02SwdjY1Xf8rZQeTGoUIYYTcC8FK1mrm2RkS/lLt1YtI70ZdoR9UXknfvdfkWpNd4719nwKPGA+ELDKPwR4Pbp8QKV0lwt3ql49TR59bbmbhDSogpd51ZeW/OwHeI36WnQXADE5IuTuOSWCmlbCYkIZ1SX8vYg1cI074feRF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9xPuIdH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f09be37so23988025e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 07 Jan 2025 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255700; x=1736860500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnnEl8EFhk+kSr4vNvhHov1IR6FEcQ+/MJXSpeLz448=;
        b=n9xPuIdHpa4FTDiT9z4t2ogZ46hPnozapwaZ6lkBCyzy9r4UarvS3X70IQBAsOIUqw
         c57g0F0eMkp93VQvwmzd38fT9QZ4sZI3lH28Jj272sOi5T4BaxeWi9t9SecM3f50XJe0
         rHqYJElriEbbjumQ4utB64wmSOKDkn6RwkK01Uo+ipehf6mOx0x3BE1Mxf1+IMZQPavB
         A9/mWORdlb5QGj/yEtSTiNM8ueDjuFivQI/K7wagwmLFBl8ASDZ13TfxMUwr+peDpG1d
         VkX+N5PH2LjDzw92iss5QlwZmjucAOLfX/2PdUKqg6eWfst6uyik26ZwsvkWwk73MjQl
         3KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255700; x=1736860500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnnEl8EFhk+kSr4vNvhHov1IR6FEcQ+/MJXSpeLz448=;
        b=PXXk2cdoxOuf7x9AUN8Q/OcqXdhdZnwCbl9k0V9Y8vPbBlGaRgeJxtwyatPo0NkgtD
         R/HLdMYFDf6VVb4VNA1x9Wg4aKQnwb6LFMed4Ddr0NXfRFd2sFguRxv/bMQED/SBhzIe
         iLh8EyEUJH9j3xbMkbvo/tpxrd0nMfTVcPZnzc/pYd/nNfk9qSuvKg6C+1lCnpTiEIeT
         I06gNx1YqVf2aKT7hC9tGC31Odiq+BCKgFzYit565yOl8yQxJzRY/p5MQwRumH1kP58G
         G/4EcKSGWesJxQaNwClqvOjTGc5FEYH7BR/G1g0Zr239ilZHxvyxrgwTDCnhCA0tsme4
         bXKw==
X-Forwarded-Encrypted: i=1; AJvYcCW+CU2AgOGQ5WFTM67poX2QbNp4HukJifuLDpl+5ZPwjD9JET17w6nVA6PVNvE4DYIQGy9eX8dvy4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RmFUvlGVNEhFQbhXmmP8sPEN0HWTlnDyOY6NcnRaZU/p/Wfh
	BywAQm8djAzR02HAQaqx+cd9/Wf4E7slkzFiTz63dTnDY3EzUnuMMejD3kE4a4E=
X-Gm-Gg: ASbGncuynxgTRO5UAQkDhgb2bdKRuw1FpIxvD0TReQ+zYkOkRqcvfEDKcyHrJG40o8b
	LDbM3lD8ALsYgl0hgkAkkwQPm+fXiH6uZa5lE2zWACyUjVFKWmiNX41w80G8GM3kag2X3/8dRxc
	4M/ydmupKZA8jER6Tvh1MG01MA1SyaqDfVqsHjqjwgLb/KPUuYn6QSwpGL3WEXigkx2/qsNfreL
	u11epX7baqGzq/jvTUuD3NUaaHhWfAOSGTTif0zI2IB00OB/8pBBj0vW0Ha+GpNVngt9C0=
X-Google-Smtp-Source: AGHT+IFmjki3oFnjAyCBLyIc05a62I6+0V+hk2IQ1LFmQ5ZQ2t1jw+6F37eLTtpahiEBT3Qbd+ygkQ==
X-Received: by 2002:a05:600c:3ba8:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-43668b8fd2amr200124085e9.7.1736255699772;
        Tue, 07 Jan 2025 05:14:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm49603728f8f.65.2025.01.07.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:14:59 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:14:56 +0100
Message-ID: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This applies cleanly on v6.13-rc6 and on next-20250107, so I expect no
conflicts between Rob's tree and other maintainers' trees.

Rob,
Can you apply it to DT tree?
---
 .../arm/arm,trace-buffer-extension.yaml       |  10 +-
 .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
 ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
 .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
 .../bindings/interconnect/qcom,rpmh.yaml      |  28 +--
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
 20 files changed, 357 insertions(+), 357 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index 1b9164dc162f..dad3ad2fd93b 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -127,19 +127,19 @@ unevaluatedProperties: false
 
 examples:
   - |
-      #include <dt-bindings/interconnect/qcom,sdm845.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
 
-      mem_noc: interconnect@1380000 {
-             compatible = "qcom,sdm845-mem-noc";
-             reg = <0x01380000 0x27200>;
-             #interconnect-cells = <1>;
-             qcom,bcm-voters = <&apps_bcm_voter>;
-      };
+    interconnect@1380000 {
+        compatible = "qcom,sdm845-mem-noc";
+        reg = <0x01380000 0x27200>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
 
-      mmss_noc: interconnect@1740000 {
-             compatible = "qcom,sdm845-mmss-noc";
-             reg = <0x01740000 0x1c1000>;
-             #interconnect-cells = <1>;
-             qcom,bcm-voter-names = "apps", "disp";
-             qcom,bcm-voters = <&apps_bcm_voter>, <&disp_bcm_voter>;
-      };
+    interconnect@1740000 {
+        compatible = "qcom,sdm845-mmss-noc";
+        reg = <0x01740000 0x1c1000>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voter-names = "apps", "disp";
+        qcom,bcm-voters = <&apps_bcm_voter>, <&disp_bcm_voter>;
+    };
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
index af378b9ff3f4..b2df1e26ceef 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -227,49 +227,49 @@ examples:
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
index f6e0c613af67..7d60ce00ce24 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -57,14 +57,14 @@ examples:
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
index c6bce40946d4..123937a5fb2e 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -172,22 +172,22 @@ examples:
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
2.43.0


