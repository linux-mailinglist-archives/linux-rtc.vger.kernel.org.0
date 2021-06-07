Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE0A39E84B
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jun 2021 22:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhFGUWm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Jun 2021 16:22:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35475 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhFGUWl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Jun 2021 16:22:41 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6130320002;
        Mon,  7 Jun 2021 20:20:48 +0000 (UTC)
Date:   Mon, 7 Jun 2021 22:20:48 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Add Arm PL031 schema
Message-ID: <YL5/oHCfQMqYzoK1@piout.net>
References: <20210607193718.3090202-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607193718.3090202-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Rob,

On 07/06/2021 14:37:18-0500, Rob Herring wrote:
> The PL031 RTC binding has been in use for a long time, but never got
> documented. Fortunately, it's simple and existing users are consistent.
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/arm,pl031.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/arm,pl031.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/arm,pl031.yaml b/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
> new file mode 100644
> index 000000000000..77452c9e9b63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/arm,pl031.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Primecell PL031 Real Time Clock
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: arm,pl031
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,pl031
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +

As the driver sets the range, it also supports start-date from rtc.yaml
With that added:
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
