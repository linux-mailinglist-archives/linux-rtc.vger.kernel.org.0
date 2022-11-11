Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EC8625D8F
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Nov 2022 15:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbiKKOzp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Nov 2022 09:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbiKKOzj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Nov 2022 09:55:39 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D23D5D6AA
        for <linux-rtc@vger.kernel.org>; Fri, 11 Nov 2022 06:55:33 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b9so4784189ljr.5
        for <linux-rtc@vger.kernel.org>; Fri, 11 Nov 2022 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUK6bHkDVdgLCEUSVhwc07h/pDswnVflCYbBO9SRoQ8=;
        b=I+9q+K5wP3Pg3adbS6tbXjkABMa3d9i1Ii8llyfS4/d7Cwh81N5w8wU1qplOhidRl/
         ySwP2YF4QuSViOpxNI9PV5ZOP48kSuiFUC85t98fXGc1XJBI8wY+yPWEf0i7PPECvvYc
         WMiBYuXpuyBjJZj3XtOzsa9NTvFqxdtZ+88uI5hT9Y6v8KLWeCMBmuFhf1rx6wYaXeY0
         BSIDXJzh6DJtM+WxF2nXm6ihXRFia07tTwWMGsX/WS4HhEPirqLE8TXhCXHBlIoYyh+a
         WrYTXK9BSKpZEJy62iL/P9Y3WWBuUI8dytHGjy5LIODcEpFkBKBlVfnBq73gFM5r2SAJ
         in5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUK6bHkDVdgLCEUSVhwc07h/pDswnVflCYbBO9SRoQ8=;
        b=7BipOjTseCNgWog0x6dNhoWD0tgDLjdl4i9iL/J0rwUTMvyY2j4yZgvvkGh6REs9iW
         9ucKeKCTlMH9boB0T474T+K5uETImL4u8Gn83E6aodNWUH0XvVIiZL6NtafO0ISbrZuY
         s5uDz4K5+d5ma523J5Tgb4kfJ0O5uqa3Clb1spo9kyYpaXcJKZ4jE0Qg6Nw3jMnqXIfp
         m9hWZ43xBLlJVLH3pbYlW8ruBXLTl/S1/auCF/GFTEYPfjtjdchbm66Vns5wEy3iIUS6
         DWKFwWkn/4XCE5MjvVxU1UyxqTXwvekpi+85hyJdDxVa7sERIuAH3FA0AXGa8mgc6Pkw
         PEgQ==
X-Gm-Message-State: ANoB5pm6Xhp03IY9bh4CcVTPohXoh8ZUmOzkYQ7LBVSvnjyBIjTB29Dh
        xXhsBHHEXJCR1QK7JxtRqVhZDA==
X-Google-Smtp-Source: AA0mqf7UZzo3L76bpD0k3WtR+JJCEm2TdMGbPxlpzZwHGeV4G32oR+aSTROWib5J0YRsTSids6iUaw==
X-Received: by 2002:a2e:5703:0:b0:26f:a35a:8459 with SMTP id l3-20020a2e5703000000b0026fa35a8459mr767985ljb.205.1668178531525;
        Fri, 11 Nov 2022 06:55:31 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id j6-20020a056512344600b004978e51b691sm356437lfr.266.2022.11.11.06.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:55:30 -0800 (PST)
Message-ID: <931bbdec-5155-9b26-0cfd-b29a5406d20b@linaro.org>
Date:   Fri, 11 Nov 2022 15:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2022 19:43, Alexandre Mergnat wrote:
> - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
> - MT8365 SoC has 2 additional clock items and a yaml schema for its PMIC
> - Remove pwrap.txt file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |   2 +-
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 158 +++++++++++++++++++++
>  .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 ----------
>  4 files changed, 160 insertions(+), 77 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> index 45bf9f7d85f3..73353692efa1 100644
> --- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> @@ -9,7 +9,7 @@ MT6323 PMIC hardware.
>  For MT6323 MFD bindings see:
>  Documentation/devicetree/bindings/mfd/mt6397.txt
>  For MediaTek PMIC wrapper bindings see:
> -Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
>  
>  Required properties:
>  - compatible : Must be "mediatek,mt6323-led"
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 79aaf21af8e9..3bee4a42555d 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -13,7 +13,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>  See the following for pwarp node definitions:
> -../soc/mediatek/pwrap.txt
> +../soc/mediatek/mediatek,pwrap.yaml
>  
>  This document describes the binding for MFD device and its sub module.
>  
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> new file mode 100644
> index 000000000000..fe83458b801a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek PMIC Wrapper
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  On MediaTek SoCs the PMIC is connected via SPI. The SPI master interface
> +  is not directly visible to the CPU, but only through the PMIC wrapper
> +  inside the SoC. The communication between the SoC and the PMIC can
> +  optionally be encrypted. Also a non standard Dual IO SPI mode can be
> +  used to increase speed.
> +
> +  IP Pairing
> +
> +  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
> +  The signals of these pins are routed over the SPI bus using the pwrap
> +  bridge. In the binding description below the properties needed for bridging
> +  are marked with "IP Pairing". These are optional on SoCs which do not support
> +  IP Pairing
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-pwrap
> +              - mediatek,mt6765-pwrap
> +              - mediatek,mt6779-pwrap
> +              - mediatek,mt6797-pwrap
> +              - mediatek,mt6873-pwrap
> +              - mediatek,mt7622-pwrap
> +              - mediatek,mt8135-pwrap
> +              - mediatek,mt8173-pwrap
> +              - mediatek,mt8183-pwrap
> +              - mediatek,mt8188-pwrap

Why no mt8195?

> +              - mediatek,mt8365-pwrap
> +              - mediatek,mt8516-pwrap
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-pwrap
> +              - mediatek,mt8195-pwrap
> +          - const: syscon
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: PMIC wrapper registers (mandatory)

Drop "(mandatory)"

> +      - description: IP pairing registers
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: pwrap
> +      - const: pwrap-bridge
> +
> +  interrupts:
> +    maxItems: 1
> +    description: IRQ for pwrap in SOC

Drop description.

> +
> +  clocks: true

minItems:2
maxItems: 4

> +
> +  clock-names: true

Ditto

> +
> +  resets:
> +    minItems: 1
> +    items:
> +      - description: PMIC wrapper reset
> +      - description: IP pairing reset
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: pwrap
> +      - const: pwrap-bridge
> +
> +  pmic:
> +    type: object
> +

Required properties go here.

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-pwrap
> +    then:
> +      properties:
> +        pmic:
> +          $ref: /schemas/mfd/mediatek,mt6357.yaml#
> +
> +        clocks:
> +          items:
> +            - description: SPI bus clock
> +            - description: Main module clock
> +            - description: System module clock
> +            - description: Timer module clock
> +        clock-names:
> +          items:
> +            - const: spi
> +            - const: wrap
> +            - const: sys
> +            - const: tmr
> +    else:
> +      properties:
> +        pmic:
> +          description: |
> +            List of child nodes that specify the regulators.

This is not correct description.

> +            See ../../mfd/mt6397.txt for more details.
> +
> +        clocks:
> +          items:
> +            - description: SPI bus clock
> +            - description: Main module clock
> +        clock-names:
> +          items:
> +            - const: spi
> +            - const: wrap
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: true

This must be false.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/mt8135-resets.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      pwrap@1000f000 {
> +          compatible = "mediatek,mt8135-pwrap";
> +          reg = <0 0x1000f000 0 0x1000>, <0 0x11017000 0 0x1000>;
> +          reg-names = "pwrap", "pwrap-bridge";
> +          interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> +          resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
> +              <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;

Align.

> +          reset-names = "pwrap", "pwrap-bridge";
> +          clocks = <&clk26m>, <&clk26m>;
> +          clock-names = "spi", "wrap";
> +
> +          pmic {
> +            compatible = "mediatek,mt6397";

Messed up indentation.

> +          };

Best regards,
Krzysztof

