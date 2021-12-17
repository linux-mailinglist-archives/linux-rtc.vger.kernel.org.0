Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D77479273
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Dec 2021 18:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239666AbhLQRHh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Dec 2021 12:07:37 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53777 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235922AbhLQRHh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Dec 2021 12:07:37 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8871BFF80E;
        Fri, 17 Dec 2021 17:07:35 +0000 (UTC)
Date:   Fri, 17 Dec 2021 18:07:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: Add EM Microelectronic EM3027
 bindings
Message-ID: <YbzD199oQobS6ZaD@piout.net>
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
 <20211217170311.2796798-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170311.2796798-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 17/12/2021 18:03:11+0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the bindings for the EM Microelectronic EM3027 RTC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/rtc/emmicro,em3027.yaml          | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml b/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml
> new file mode 100644
> index 000000000000..abed14c4fcd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/emmicro,em3027.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EM Microelectronic EM3027 RTC Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: emmicro,em3027
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +additionalProperties: false
> +

If there are no further properties, maybe trivial-rtc.yaml?

> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      rtc@56 {
> +        compatible = "emmicro,em3027";
> +        reg = <0x56>;
> +      };
> +    };
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
