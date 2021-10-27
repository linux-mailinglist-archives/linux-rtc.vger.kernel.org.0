Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D726443C0B6
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 05:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237796AbhJ0DUA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Oct 2021 23:20:00 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:46914 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhJ0DT7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Oct 2021 23:19:59 -0400
Received: by mail-ot1-f53.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so1621993ote.13;
        Tue, 26 Oct 2021 20:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e47/W2ZU87sE2bFyI7GCMhtZCn17zwsf8pfY7GIiMUA=;
        b=dbfotZ0BN4E+43R9r3kcQlFfI4ghAUGr3PLFJmjSv6ouDkc24ydK1TGdBht+x8nLFl
         Cxn+qM1L5IrdOIX9VyPj540p4aOqm3Fb/SfimQg+E5ZC1hwOQUUBqqkO8t4MbEZ3q2S7
         LN5AjZkr4yu/GLgl+36MuniUXgN+WlLhxXKhqaiKPSPJtbJMnK46zPXxLsheiV5s/8nQ
         C3Edye1Eh1VdfNtrxb6r0ZQjuyDVCgVWE0ufolEdP/BPNwvQ1C0Gv2Js+m6ATdCfh0m5
         5vQVrZ4s8OGfrTGLrBemIq9+VfZbZwUzcuV9/el0e77aKmNWhT6bVeWZVgERw10G2vbN
         fNRA==
X-Gm-Message-State: AOAM531X9HpYnj7GqAjiQaORonyqT+O8S8R16ONiaWMJcSM/cGq3vqPr
        S1nR5DMJ7EhsZK1ydAEaMo/YjglScQ==
X-Google-Smtp-Source: ABdhPJz7Nci388Hv8c1l1WPsuv6HsXGr83VouK8Gda4GMje9gSPkPC+gQuP5zamjmF2w4/vuOiiUXg==
X-Received: by 2002:a05:6830:31b9:: with SMTP id q25mr23907664ots.222.1635304654808;
        Tue, 26 Oct 2021 20:17:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i15sm5108585otu.67.2021.10.26.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 20:17:33 -0700 (PDT)
Received: (nullmailer pid 3954575 invoked by uid 1000);
        Wed, 27 Oct 2021 03:17:32 -0000
Date:   Tue, 26 Oct 2021 22:17:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: mfd: add Maxim MAX77714 PMIC
Message-ID: <YXjEzMYd9iYbodxo@robh.at.kernel.org>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-6-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019145919.7327-6-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Oct 19, 2021 at 04:59:15PM +0200, Luca Ceresoli wrote:
> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes in v2: none
> ---
>  .../bindings/mfd/maxim,max77714.yaml          | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> new file mode 100644
> index 000000000000..2b0ce3b9bc92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/maxim,max77714.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MAX77714 PMIC with GPIO, RTC and watchdog from Maxim Integrated.
> +
> +maintainers:
> +  - Luca Ceresoli <luca@lucaceresoli.net>
> +
> +description: |
> +  MAX77714 is a Power Management IC with 4 buck regulators, 9
> +  low-dropout regulators, 8 GPIOs, RTC and watchdog.

Where's the regulators nodes and binding?

> +
> +properties:
> +  compatible:
> +    const: maxim,max77714
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell is the trigger type.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@1c {
> +            compatible = "maxim,max77714";
> +            reg = <0x1c>;
> +            interrupt-parent = <&gpio2>;
> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d118d7957d2..514ff4a735e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11386,6 +11386,11 @@ F:	drivers/power/supply/max77650-charger.c
>  F:	drivers/regulator/max77650-regulator.c
>  F:	include/linux/mfd/max77650.h
>  
> +MAXIM MAX77714 PMIC MFD DRIVER
> +M:	Luca Ceresoli <luca@lucaceresoli.net>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> +
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>  M:	Javier Martinez Canillas <javier@dowhile0.org>
>  L:	linux-kernel@vger.kernel.org
> -- 
> 2.25.1
> 
> 
