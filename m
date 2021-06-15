Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6B33A8C9E
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 01:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFOXhM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Jun 2021 19:37:12 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:46709 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhFOXhM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Jun 2021 19:37:12 -0400
Received: by mail-il1-f174.google.com with SMTP id i12so649795ila.13;
        Tue, 15 Jun 2021 16:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M7mtpARxZOramxjxaW7DY3FJniUk5KYYeFWsUiBQS4s=;
        b=fjSNvdgiXnv7cpBQKSKkpBLyU1Kf1efASmKSxyNAOglchJMiHmVRLTlboUUT5ZMPoU
         SH7Ub5stQoCQs2WJjzSgs9qFpJeyvbGLyKhFXK0DwiAAX7Id2crkxnWvY6p2mB5FFm5P
         UlleEbzgA0IrEReVhoOnbz3JLPDY1hrExIUx9QBt5kUu4khTXryKy5J+LopZsxwIUfX5
         Zb2m+dLMtvcIUreHz6WtV8i5eHrcZk+Nv1vFZ8bi3w4JYdKk04me0Tx/o57ibg0TpH+d
         YLXLVQbxYAQ2hZYH/XP2z6c4zgH9KKyDZ8rtogr6fQBUTI86FTEF9XGzs7RJ948w2VkE
         4IKg==
X-Gm-Message-State: AOAM532rJs6SWxWBm2rdMoNXO6ASBlon8VorYtdNixXNmZ2kDFiurDgs
        7xQw3IpAO7UvnFpj3f/dDA==
X-Google-Smtp-Source: ABdhPJzZpda2GZV56qSibl8HTwsctfk6cpz/tUqIyo+rWfUorW+b8tZ2HGW4F0404Loq2ti7RNgU4Q==
X-Received: by 2002:a05:6e02:1d82:: with SMTP id h2mr1452459ila.180.1623800105906;
        Tue, 15 Jun 2021 16:35:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a17sm263693ilb.57.2021.06.15.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:35:05 -0700 (PDT)
Received: (nullmailer pid 1649131 invoked by uid 1000);
        Tue, 15 Jun 2021 23:35:02 -0000
Date:   Tue, 15 Jun 2021 17:35:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 03/19] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210615233502.GA1630203@robh.at.kernel.org>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615110636.23403-4-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jun 15, 2021 at 12:06:20PM +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> Also the clock part is quite different, as there is no external 32K LOSC
> oscillator input.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index b1b0ee769b71..2c3fd72e17ee 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - const: allwinner,sun50i-h616-rtc
>  
>    reg:
>      maxItems: 1
> @@ -105,6 +106,20 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun50i-h616-rtc
> +
> +    then:
> +      properties:
> +        clock-output-names:
> +          minItems: 3
> +          maxItems: 3
> +        clocks:
> +          maxItems: 0

clocks: false

if forbidding clocks is what you want.

> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.17.5
