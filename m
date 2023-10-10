Return-Path: <linux-rtc+bounces-82-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F47BFF18
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 16:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9217B1C20B3C
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 14:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC6D24C99;
	Tue, 10 Oct 2023 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKPmAKAI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3024C84;
	Tue, 10 Oct 2023 14:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0802C433C8;
	Tue, 10 Oct 2023 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696947830;
	bh=vV9MY3qCxHZdei9v7PhzyU5viqA4w/zBGC96MDe7auE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKPmAKAIr3qzwmaeOewpGCJ/TH5dH3HmvOiayuYwA9AHvfBxmtTCpeOiC8RE9f/J8
	 GL4NnFxK95V8SdLQprgoZMzf7sTJgQBppCqRiJltxMFrqvuCqDjPZeok3GK+fuUwx+
	 LGsKftUFSFwVAA6um6dOyIErINfs9MZXgqkpvJBJYwRwU4vE7t+rcpOBQWKZbBnrCW
	 0Tz8FTL4tFWET2LninODU+8E5nnXG6q5lxrwMPDz0XybI19CRLCV/i2Be2xOv8jP+0
	 ad4lZvphNf6MMgkpe+eEl7+C2QPWqTOs2Tntzs5FYzGDOOE+lew83RmGF5WhQiNdIO
	 2neqEhpnAE8Dw==
Received: (nullmailer pid 836844 invoked by uid 1000);
	Tue, 10 Oct 2023 14:23:48 -0000
Date: Tue, 10 Oct 2023 09:23:48 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Howard Harte <hharte@magicandroidapps.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: rtc7301: Rewrite bindings in schema
Message-ID: <20231010142348.GA833404-robh@kernel.org>
References: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
 <20231007-rtc-7301-regwidth-v2-1-c913aa95f666@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007-rtc-7301-regwidth-v2-1-c913aa95f666@linaro.org>

On Sat, Oct 07, 2023 at 02:30:49PM +0200, Linus Walleij wrote:
> This rewrites the Epson RTC7301 bindings to use YAML schema,
> and adds a property for "reg-io-width" as used in several
> other bindings to account for different register strides.
> 
> The USRobotics USR8200 uses the byte IO width.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
>  .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 50 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 16 deletions(-)
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
> index 000000000000..0937b094821d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/epson,rtc7301.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Epson Toyocom RTC-7301SF/DG
> +
> +description:
> +  The only difference between the two variants is the packaging.
> +  The DG variant is a DIL package, and the SF variant is a flat
> +  package.
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
> +      on the device. If not specified, the default is 4.

No prose for what can be a constraint:

       default: 4

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    enum: [1, 4]


