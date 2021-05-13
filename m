Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBEF37F141
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 04:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhEMCYC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 22:24:02 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:41941 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhEMCYB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 22:24:01 -0400
Received: by mail-oo1-f43.google.com with SMTP id e7-20020a4ad2470000b02902088d0512ceso2546502oos.8;
        Wed, 12 May 2021 19:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bjbsKbExJtqqkUx1FT2hl9g6O34xQvhxKjFsG5FoPFQ=;
        b=kUiXU/GWinaocDjZ645EhMqEVVn58BxOQos1qz/PmfWj80H1SJGNK4VnmCNeRrPvuU
         U7LSa5WsFLsfxmSNmvXhv/KjUBI9UoYeTP2z2CsgG+GDF0hs6okBIQUURI7RJAC+UnJf
         oVKoYrhWjO3f9sK+lgbVY/veXSrSUUtsE+1z0fZMaLSmJOqkB0Uwf6ozt2ZGQ/ulfXDw
         zpq9CGjbDEuuxxW6siYpLpclkLb1vM98URoX9UNQ1MlfUWhDc5cAQaAgTDQHuVWyqbYh
         xoWRn8CRMI55uvfwT4WazcBTC7daOHBFVAkuavlLjK6qBUfSKofF+Ph+M8t3X8AcYkzH
         D2mg==
X-Gm-Message-State: AOAM531FrX3VK91B0V55JPuu8/UNtQ7ebGK9eDzxyPKOZztzNEnwvoDP
        XelllSx4MwhD3Yr2096MJJFff638Pg==
X-Google-Smtp-Source: ABdhPJwXoMiahwvEN4+Fn78L/YNhAbFffO00UELQ9/ukJIag3rZoN0sWlcAkCjNiqZ/tH5uZycETDg==
X-Received: by 2002:a4a:5242:: with SMTP id d63mr30053006oob.93.1620872571068;
        Wed, 12 May 2021 19:22:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm378806otk.42.2021.05.12.19.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 19:22:50 -0700 (PDT)
Received: (nullmailer pid 898636 invoked by uid 1000);
        Thu, 13 May 2021 02:22:49 -0000
Date:   Wed, 12 May 2021 21:22:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        palmer@dabbelt.com, cyril.jean@microchip.com,
        padmarao.begari@microchip.com, lewis.hanly@microchip.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com
Subject: Re: [PATCH v1 1/2] dt-bindings: rtc: microchip: Add Microchip
 PolarFire host binding
Message-ID: <20210513022249.GA896078@robh.at.kernel.org>
References: <20210512111133.1650740-1-daire.mcnamara@microchip.com>
 <20210512111133.1650740-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512111133.1650740-2-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 12, 2021 at 12:11:32PM +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire real-time
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..c82b3e7351e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  prescaler:
> +    maxItems: 1

An array?

Needs a type, constraints, and vendor prefix.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc

Kind of a pointless name. You don't need *-names when there is only 1.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        rtc@20124000 {
> +            compatible = "microchip,mpfs-rtc";
> +            reg = <0 0x20124000 0 0x1000>;
> +            clocks = <&clkcfg CLK_RTC>;
> +            clock-names = "rtc";
> +            interrupts = <80>;
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
