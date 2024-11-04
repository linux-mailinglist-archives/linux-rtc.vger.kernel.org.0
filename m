Return-Path: <linux-rtc+bounces-2456-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D71279BBF12
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 21:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5421F225AC
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2291F708B;
	Mon,  4 Nov 2024 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FHBWxwic"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FD1E3DC4;
	Mon,  4 Nov 2024 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730753683; cv=none; b=MVxWJ6JRdTqvFRrJquiiWLa7hxLLmLaw5p36OLfQhbzUHdAO0wHI5PeQAyrPNCPTO1iZoRrC/U24T8svXcpMwgSxhuzaA0vulV50OBAoGNVs+9f8va7IYEmE6ADt6akDotuhLLZorkPs7+UVSG5NdJ2Vpu6DwnRaSWxuRLTUvU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730753683; c=relaxed/simple;
	bh=ZgeNd1bfUF12nDGkJYPjV9nUIu9hYIHX0uPzkkN2XeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3QZSE/3L07s6/zXbUWiORKj1TB7w0iahfYxcdEEXSzkfHFbejy5tmBD21FGb+jYqSkjZuDcRw09XBVemZyHzStXedLTcRBQ0IVjmYvA8kSd1jqb86uShXH7PIv2YWB0Lczr3piWbI4tbLSYvX3yGmaLzaRrB8lM/o0ECJw6hcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FHBWxwic; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 194B9C0C5B;
	Mon,  4 Nov 2024 20:50:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F2FB240005;
	Mon,  4 Nov 2024 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730753441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Av38HQLIY4y7fKHlkHPls4j0u9OzeVAPPLDifWMIiEg=;
	b=FHBWxwictm6bRzRsy2mGAWYYMx27D0RNHtw/tyZaw8BmDO1+aSSTIgFONc+SX+7gePJsvT
	t4Qz81MJ1UHPyTBlHiI/uJ4enb0QpGsMWkX1Y05W+lMMUFOCInYXFENVMg4EDfMN3DIXK/
	l2a28vHAdlxhYw1wF71DVh3URmvFNjYKmgIEo8hAA6PE83xqe9MaSPpcXMT7LfCAfFWAl4
	bvP5ILe+H4emHqOqQu3zSTc86DBEKg9nyfZbpgDCudz/+RuhVKsYj6zFDmjARvA4MTbIiA
	yjTdh+C7IrmmcyDb2liKMJKT+AeJtK0Q3AGDmofn5tSj1sd7xVnPZDwZCx4o3g==
Date: Mon, 4 Nov 2024 21:50:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: CL Wang <cl634@andestech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH V3 1/1] dt-bindings: rtc: add atcrtc100 Real Time Clock
Message-ID: <20241104205040adb479a7@mail.local>
References: <20241104144053.1136083-1-cl634@andestech.com>
 <20241104144053.1136083-2-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104144053.1136083-2-cl634@andestech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/11/2024 22:40:53+0800, CL Wang wrote:
> Document devicetree bindings for the Andes atcrtc100 Real Time Clock.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
>  .../bindings/rtc/andestech,atcrtc100.yaml     | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
> new file mode 100644
> index 000000000000..cf99cff76734
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/andestech,atcrtc100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes ATCRTC100 Real-Time Clock
> +
> +maintainers:
> +  - CL Wang <cl634@andestech.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - andestech,atcrtc100
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Periodic timekeeping interrupt
> +      - description: RTC alarm interrupt
> +
> +  wakeup-source: true

The driver misuses this property. wakeup-source is mutually exclusive
with the alarm interrupt. The driver requires both interrupts to be
present so the property is useless (which is expected as the interrupt
lines are always connected to the CPU)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    rtc@f0300000 {
> +        compatible = "andestech,atcrtc100";
> +        reg = <0xf0300000 0x100>;
> +        interrupts = <1>, <2>;
> +        wakeup-source;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10342c0fa599..372d7ea53c98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3357,6 +3357,7 @@ F:	include/linux/mfd/atc260x/*
>  ATCRTC100 RTC DRIVER
>  M:	CL Wang <cl634@andestech.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
>  F:	drivers/rtc/rtc-atcrtc100.c
>  
>  ATHEROS 71XX/9XXX GPIO DRIVER
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

