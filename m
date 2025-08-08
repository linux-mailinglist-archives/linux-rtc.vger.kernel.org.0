Return-Path: <linux-rtc+bounces-4654-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9477B1EECF
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 21:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EF7A1895B26
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 19:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90B22154B;
	Fri,  8 Aug 2025 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plzMRfoK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD61B35948;
	Fri,  8 Aug 2025 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754681016; cv=none; b=q+4WZixG3/KmjwgpVRj1r1726U/Hcl76AyKeJlfO5rNuX+CbVogwYhOkNIb7rbvA+GaacBE+IyLONfX0Pai3+6DSOybi87KSBy1EcQs7Q1NME0UmeQmW21l2K6WvpkWtKIOuETL6mrwtwoWtZec1XV0JIka3Kg0udyJ7f/w0LAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754681016; c=relaxed/simple;
	bh=6Ofhmtq8iEsDzcVOKThUvKTpA7BPiY9F0Z4vOfmDs2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERExv9z7O6cRMp8lFGZFD8CY43y9MWTSBIeoXD7F+LMdf4QfN+GjUvBk4RJMDn9teNRIpgHddE5+P+V2DLsUdmJtPq1C6hG0WjQGhNAe5giWVFdBdoBSzoCZDhAutUQHj+1AIm525NafxYspMk6vEAeyVoXAIikpEGP0aBtV/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plzMRfoK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD915C4CEED;
	Fri,  8 Aug 2025 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754681016;
	bh=6Ofhmtq8iEsDzcVOKThUvKTpA7BPiY9F0Z4vOfmDs2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plzMRfoKKj00EHCjizTYsC0QXluoZRkzypvA7ufuitDfDkZ6MGRkC7gOi3AXjBoas
	 eEApQWJjhzAioABwm7WoQlqDhXwbDQQ7ryUBVmTrq2UamZ5gJtf1ohYIh2Il8qxTyU
	 114plSjiThETFJqoN2ERa/x2v/Yj5q3M1eRMq9PHqZQ7Rof/JUrprBsngnGCBBadq5
	 qNtu1kdm26HoxIRJ99herUmnwGqx4T+WQNFiKRdTNwmPrYcacXydZSGwgdOOoQN/24
	 HxVzdeXhtZsUZ/4xJLOmzkU5+/LUO85ym4ChIRfyGXMh0t9UIkJhXnenugWniH4l26
	 qgP3FhvwPNayA==
Date: Fri, 8 Aug 2025 14:23:34 -0500
From: Rob Herring <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH 1/2] rtc: pcf85363: add support for timestamp and watchdog
Message-ID: <20250808152900.GA125413-robh@kernel.org>
References: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808112246.4169280-1-lakshay.piplani@nxp.com>

On Fri, Aug 08, 2025 at 04:52:45PM +0530, Lakshay Piplani wrote:
> Extend the device tree binding for NXP PCF85263/PCF85363 RTC with:
> - Timestamp mode configuration
> - Watchdog timer configuration

The subject should match the subsystem. So:

"dt-bindings: rtc: nxp,pcf85363: ..."

> 
> Also introduce a new header 'pcf85363-tsr.h' to expose
> macros for timestamp mode fields, improving readability
> of device tree file.
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85363.yaml | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363-tsr.h        | 28 ++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363-tsr.h
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
> index 52aa3e2091e9..2d2b52f7a9ba 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/rtc/nxp,pcf85363.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Philips PCF85263/PCF85363 Real Time Clock
> +title: NXP PCF85263/PCF85363 Real Time Clock
>  
>  maintainers:
>    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> @@ -39,6 +39,41 @@ properties:
>    start-year: true
>    wakeup-source: true
>  
> +  nxp,timestamp-mode:
> +    description: |
> +      Defines timestamp modes for TSR1, TSR2, and TSR3.

You need to define what timestamp mode is.

> +      Use macros from `dt-bindings/rtc/pcf85363-tsr.h`.
> +    items:
> +      - description: TSR1 mode (e.g., PCF85363_TSR1_FE)
> +      - description: TSR2 mode (e.g., PCF85363_TSR2_LB)
> +      - description: TSR3 mode (e.g., PCF85363_TSR3_LV)
> +
> +  nxp,enable-watchdog:
> +    type: boolean
> +    description: |
> +      If present, the RTC watchdog timer is enabled and integrated with Linux watchdog subsystem.

This is OS policy and doesn't belong in DT. If it did, nothing NXP 
specific about it.

You don't need '|' when there is no formatting to preserve, and lines 
should wrap at 80 char.

> +
> +  nxp,watchdog-timeout:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 31
> +    default: 10
> +    description: |
> +      Watchdog timeout value in seconds. Allowed values range from 1 to 31.

There's already a standard property for this.

> +
> +  nxp,watchdog-stepsize:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +    description: |
> +      Watchdog step size select: 0=0.25Hz, 1=1Hz, 2=4Hz, 3=16Hz.

What's step size? This is counter resolution. Shouldn't this just be the 
best value based on the timeout period.

> +
> +  nxp,watchdog-repeat:
> +    type: boolean
> +    description: |
> +      If present, sets the watchdog to repeat mode. If omitted, watchdog runs in one-shot mode.

Also seems like OS policy.

> +
>  required:
>    - compatible
>    - reg
> @@ -47,6 +82,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/rtc/pcf85363-tsr.h>
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> @@ -56,5 +92,11 @@ examples:
>              reg = <0x51>;
>              #clock-cells = <0>;
>              quartz-load-femtofarads = <12500>;
> +            wakeup-source;
> +            nxp,timestamp-mode = <PCF85363_TSR1_FE PCF85363_TSR2_LB PCF85363_TSR3_LV>;
> +            nxp,enable-watchdog;
> +            nxp,watchdog-timeout = <10>;
> +            nxp,watchdog-stepsize = <0>;
> +            nxp,watchdog-repeat;
>          };
>      };
> diff --git a/include/dt-bindings/rtc/pcf85363-tsr.h b/include/dt-bindings/rtc/pcf85363-tsr.h
> new file mode 100644
> index 000000000000..1fb5b9b3601e
> --- /dev/null
> +++ b/include/dt-bindings/rtc/pcf85363-tsr.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef _DT_BINDINGS_RTC_PCF85363_TSR_H
> +#define _DT_BINDINGS_RTC_PCF85363_TSR_H
> +
> +/* TSR1 modes */
> +#define PCF85363_TSR1_NONE 0x00
> +#define PCF85363_TSR1_FE 0x01
> +#define PCF85363_TSR1_LE 0x02
> +
> +/* TSR2 modes */
> +#define PCF85363_TSR2_NONE 0x00
> +#define PCF85363_TSR2_FB 0x01
> +#define PCF85363_TSR2_LB 0x02
> +#define PCF85363_TSR2_LV 0x03
> +#define PCF85363_TSR2_FE 0x04
> +#define PCF85363_TSR2_LE 0x05
> +
> +/* TSR3 modes */
> +#define PCF85363_TSR3_NONE 0x00
> +#define PCF85363_TSR3_FB 0x01
> +#define PCF85363_TSR3_LB 0x02
> +#define PCF85363_TSR3_LV 0x03
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_TSR_H */
> -- 
> 2.25.1
> 

