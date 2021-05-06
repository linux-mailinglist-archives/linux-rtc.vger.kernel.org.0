Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FD33759A2
	for <lists+linux-rtc@lfdr.de>; Thu,  6 May 2021 19:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhEFRql (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 May 2021 13:46:41 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:40791 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbhEFRqk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 May 2021 13:46:40 -0400
Received: by mail-oi1-f177.google.com with SMTP id u16so6239150oiu.7;
        Thu, 06 May 2021 10:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8JstkJRMoUa2rOTYrsovoiLvT3L+r/P+UlSPFpzuQx0=;
        b=bOKWM1gSW0KlOk7kni1vREbiAV3aKYJwtbn5R/481PCrSnALpkl3tB/3VcT3Der6qZ
         xz34HmS9MCx8J8S1ET7D2TW8ttKMPTFW/tg3aivYAaRtZmBucXWqwkPtfYrny+U3InoV
         dXixjiqejvLYVH8IoLDhp+zqvJ+tImnbkmjaxpFh8ZRryGhnwBctYXP8HDOVljs5Mt7+
         KL8cmMty2kuJLINvfeRBUcbAHi/CaksWBtSD0SRSvlRLQ4pSlF6DkCi7jHtk2zykikhG
         9dVPiANnxWi+rW7OQcY4xTsMpwzsqRdhn2EsqBGxJH2L6xXbEjdBEQX1tQ7TAyr/sxpj
         fRlQ==
X-Gm-Message-State: AOAM53225c9mcRh3CNdKuzcSDtozIXYSOpLgoXuNIPZhqY1+UhJp8Bao
        2GG3Vrc99vad86Zmabwokw==
X-Google-Smtp-Source: ABdhPJy0kRine7Bu4k6/BpEtz+3Jkytl50ii+fI5jYKHWg1wSyH0QbWPT8lU41qW8mbrGuNq9WeL2Q==
X-Received: by 2002:aca:ebc1:: with SMTP id j184mr4047236oih.125.1620323141537;
        Thu, 06 May 2021 10:45:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t74sm531884oie.51.2021.05.06.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 10:45:40 -0700 (PDT)
Received: (nullmailer pid 539169 invoked by uid 1000);
        Thu, 06 May 2021 17:45:39 -0000
Date:   Thu, 6 May 2021 12:45:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        linus.walleij@linaro.org, ulli.kroll@googlemail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: convert rtc/faraday,ftrtc01 to yaml
Message-ID: <20210506174539.GA536770@robh.at.kernel.org>
References: <20210503195048.1575007-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503195048.1575007-1-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 03, 2021 at 07:50:47PM +0000, Corentin Labbe wrote:
> Converts rtc/faraday,ftrtc01.txt to yaml.
> This permits to detect some missing properties: reg, resets, interrupts
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/rtc/faraday,ftrtc010.txt         | 28 ---------
>  .../bindings/rtc/faraday,ftrtc010.yaml        | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml


> diff --git a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> new file mode 100644
> index 000000000000..6b318650e79f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/faraday,ftrtc010.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Faraday Technology FTRTC010 Real Time Clock
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  This RTC appears in for example the Storlink Gemini family of SoCs.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: "faraday,ftrtc010"
> +      - items:
> +          - const: "cortina,gemini-rtc"
> +          - const: "faraday,ftrtc010"

Drop quotes.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    description: when present should contain clock references to the
> +                 PCLK and EXTCLK clocks. Faraday calls the later CLK1HZ and
> +                 says the clock should be 1 Hz, but implementers actually seem
> +                 to choose different clocks here, like Cortina who chose
> +                 32768 Hz (a typical low-power clock).

Normal formatting is 2 space indent.

Split to use 'items' like PCI.

> +
> +  clock-names:
> +    items:
> +      - const: "PCLK"
> +      - const: "EXTCLK"
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    rtc@45000000 {
> +      compatible = "cortina,gemini-rtc", "faraday,ftrtc010";
> +      reg = <0x45000000 0x100>;
> +      interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&foo 0>, <&foo 1>;
> +      clock-names = "PCLK", "EXTCLK";
> +    };
> -- 
> 2.26.3
> 
