Return-Path: <linux-rtc+bounces-12-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD797ABB00
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 23:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 7D72BB207D1
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 21:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D25E4736E;
	Fri, 22 Sep 2023 21:19:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693247357;
	Fri, 22 Sep 2023 21:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E53C433C7;
	Fri, 22 Sep 2023 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695417570;
	bh=rlDmIZ16lCpt/RCUsrwNzelnSuUjNw1aayg6Ca0iX/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjwt6R7Zg0+Y8WSXMblHwFseA7oLIsphColkTz7gQt1TQ2jyG4XCwYioBzVJLa/0a
	 avNkf6z6JX2k4rxFdyEmW2+spvc3EOO7IPATHekJ/+IEJuf2d2JMJUw3hvXUElWTzF
	 1+H68lplj5ZGPdIWWP72YXPVHl91cDU5cL6pWFCR2/5hV3vACKQjcZ9DhzgwmrWr+E
	 J5yMwYH4lQ6WFjmN0D2mENeV1xLxNITa2aSwRhrjwK7BGg1aPjc7GPywXjN23LWy8Z
	 2WHi/IRbajloY9Ac0mjnpjUQ0oGOhZRsZklQLCtmmqxmda7qj3cvVex5R8Emzzw530
	 EtaPLqTL3H4Dg==
Received: (nullmailer pid 3635363 invoked by uid 1000);
	Fri, 22 Sep 2023 21:19:27 -0000
Date: Fri, 22 Sep 2023 16:19:27 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Jose Vasconcellos <jvasco@verizon.net>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: rtc7301: Rewrite bindings in schema
Message-ID: <20230922211927.GA3633496-robh@kernel.org>
References: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
 <20230921-rtc-7301-regwidth-v1-1-1900556181bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921-rtc-7301-regwidth-v1-1-1900556181bf@linaro.org>

On Thu, Sep 21, 2023 at 10:27:42PM +0200, Linus Walleij wrote:
> This rewrites the Epson RTC7301 bindings to use YAML schema,
> and adds a property for "reg-io-width" as used in several
> other bindings to account for different register strides.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
>  .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 49 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt b/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
> deleted file mode 100644
> index 5f9df3f1467c..000000000000
> --- a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -EPSON TOYOCOM RTC-7301SF/DG
> -
> -Required properties:
> -
> -- compatible: Should be "epson,rtc7301sf" or "epson,rtc7301dg"
> -- reg: Specifies base physical address and size of the registers.
> -- interrupts: A single interrupt specifier.
> -
> -Example:
> -
> -rtc: rtc@44a00000 {
> -	compatible = "epson,rtc7301dg";
> -	reg = <0x44a00000 0x10000>;
> -	interrupt-parent = <&axi_intc_0>;
> -	interrupts = <3 2>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
> new file mode 100644
> index 000000000000..4bcf1716cab6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/epson,rtc7301.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Epson Toyocom RTC-7301SF/DG
> +
> +description: The only difference between the two variants is the
> +  packaging. The DG variant is a DIL package, and the SF variant
> +  is a flat package.
> +
> +maintainers:
> +  - Akinobu Mita <akinobu.mita@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - epson,rtc7301dg
> +      - epson,rtc7301sf
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description:
> +      The size (in bytes) of the IO accesses that should be performed
> +      on the device.
> +    enum: [1, 4]

What's the default?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    rtc: rtc@44a00000 {
> +        compatible = "epson,rtc7301dg";
> +        reg = <0x44a00000 0x10000>;
> +        reg-io-width = <4>;
> +        interrupt-parent = <&axi_intc_0>;
> +        interrupts = <3 2>;
> +    };
> 
> -- 
> 2.41.0
> 

