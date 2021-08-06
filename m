Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BB63E3133
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Aug 2021 23:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241063AbhHFVhc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Aug 2021 17:37:32 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:37861 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240808AbhHFVhb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Aug 2021 17:37:31 -0400
Received: by mail-io1-f44.google.com with SMTP id l20so11987443iom.4;
        Fri, 06 Aug 2021 14:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O/ZVuXX1p8CqDOt58VogWKvsIhRU1cmOHYxxfCm/Ft4=;
        b=VF2SHMH10iIa9g6vqDjroLOHNrHohpCG4Svkwn3HnaLQZCBocKf3NJZbSy0MLJygoN
         qWbJyDe0E0bc0dwsXE9P7l7lBpoXzBk5zCpWasOqSfLuBlpuDk+xu54omoI3+uwvJRzy
         eRy6pZMVKpwCArB6z57siDn41lPRUUWtnQd98HlY7MVpGLmji7ij5E5J02PxPHZrKhLm
         RKCUTQupf7E1Y/JmJDOIpSem8ztQsGpZHUYjGtJUy+6RbgZOKpMTllubWlTD79qyMnwW
         R8T4E+Dlipx3BZm3iqDlimpE/rAExF3E2Mj92HQDekeZKFxWSZAda+12oh1Z71ff6eOz
         Atqw==
X-Gm-Message-State: AOAM532adoBARD+oNN/wKBbaFOyy6FEwzeP+07ruAYgsT//vcKv1Ro43
        8dP0G3lE4+kHZVtL4GtZXg==
X-Google-Smtp-Source: ABdhPJwc6r7sl/xJRV/BUpj6QYZkJef2zlWA1o733Pbor7wK9pSThcU+QzmCWAl1PKdug0lGD4SmYQ==
X-Received: by 2002:a92:4b0a:: with SMTP id m10mr29839ilg.163.1628285835172;
        Fri, 06 Aug 2021 14:37:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d20sm5033656iow.33.2021.08.06.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:37:14 -0700 (PDT)
Received: (nullmailer pid 1845465 invoked by uid 1000);
        Fri, 06 Aug 2021 21:37:13 -0000
Date:   Fri, 6 Aug 2021 15:37:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC
 devicetree bindings documentation
Message-ID: <YQ2riRW1hZmn6x4B@robh.at.kernel.org>
References: <20210801160921.233081-1-romain.perier@gmail.com>
 <20210801160921.233081-2-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801160921.233081-2-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Aug 01, 2021 at 06:09:19PM +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e RTC driver, found from MSC313e SoCs and newer.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  .../bindings/rtc/mstar,msc313-rtc.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> new file mode 100644
> index 000000000000..62bc12b1feb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0

As checkpatch.pl will tell you, should be dual licensed.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mstar,msc313-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mstar MSC313e RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +maintainers:
> +  - Daniel Palmer <daniel@0x0f.com>
> +  - Romain Perier <romain.perier@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mstar,msc313-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  start-year: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    rtc@2400 {
> +        compatible = "mstar,msc313-rtc";
> +        reg = <0x2400 0x40>;
> +        clocks = <&xtal_div2>;
> +        interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
> -- 
> 2.30.2
> 
> 
