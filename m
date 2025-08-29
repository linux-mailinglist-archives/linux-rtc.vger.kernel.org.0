Return-Path: <linux-rtc+bounces-4788-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5DFB3C10C
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 18:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA0D8A6670F
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 16:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D68337690;
	Fri, 29 Aug 2025 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4xOVhID"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E93375D5;
	Fri, 29 Aug 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756485659; cv=none; b=o5wEZ9Hjp2rXoXRiBNNwKmbz4kBs4oNffHCH8b9+FKlSpbeQyST2X7IX16wubx6/AtqeUcc2N5vsd7csgD0lz9kf1KlDjzmZ7ENKLFsQ79J5tX9sgYQJgHg7t8zAtf9sQKDXb7YUh5HU6aCu/vT8IpNO/LMsHI6hlD9n6F9EWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756485659; c=relaxed/simple;
	bh=RQx3k9ICtqz81FINdTuayS6/7Dq2k0lIJ6C2JyMWlIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxrIPCT8OZXEI7p+Xs0S71HyIftjDwaiB7yMcJKj8K79diTjd2RWISHbwUdZNjBLb0N3iWX0PgWu2X3MvQ3R8QIyriuaCvxMailoy9qYz8TkmRI7DWhGdf+KahyaSSSz7Qg2E3uYdJ+eMxun1/zStF7Osr0IlM2WfE3wVdEYIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4xOVhID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8881DC4CEF0;
	Fri, 29 Aug 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485658;
	bh=RQx3k9ICtqz81FINdTuayS6/7Dq2k0lIJ6C2JyMWlIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4xOVhIDRV5duZ1GpPtBu0+6fshz/3NrsQrkdmFaUSY8AOpusTD94aeN2gst44zpd
	 ZhwDpjky2b0/wq9sWQzJkeeVDbSFOsdHfp2C3Y4KVopYG3x5cI4191potu3DGLy7lP
	 Gm7LhA0RQWOborD5EVfMODfkVxs8N35QzduH/DmnookgDoTj+Dtob1Ml2b67igB4Dt
	 6BvhQX7LI5LLUnTdr1paCJMFi2ZdLFFJ2+d5RnXfqmK+KYVnZ8Xr1+ODKCPYkIGmtr
	 stuklWrxlbDep/kyZ4A9Gp5yavNZj6kje2Rr1BxFE9tub+RnlqqLQhw9oNa8vr1FVd
	 k33l4jW/UYRcg==
Date: Fri, 29 Aug 2025 11:40:57 -0500
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <20250829164057.GA976361-robh@kernel.org>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:36PM +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          |  36 +++++++
>  MAINTAINERS                              |   1 +
>  3 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b428088f96240266fa42e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Hardware Monitoring
> +
> +description:
> +  Apple's System Management Controller (SMC) exposes a vast array of
> +  hardware monitoring sensors, including temperature probes, current and
> +  voltage sense, power meters, and fan speeds. It also provides endpoints
> +  to manually control the speed of each fan individually. Each Apple
> +  Silicon device exposes a different set of endpoints via SMC keys. This
> +  is true even when two machines share an SoC. The CPU core temperature
> +  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
> +  Pro, for example.
> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +definitions:

$defs

definitions was convention. $defs is in json-schema spec now.

> +  apple,key-id:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: "^[A-Za-z0-9]{4}$"
> +    description: The SMC FourCC key of the desired sensor.
> +      Must match the node's suffix.
> +
> +  label:
> +    description: Human-readable name for the sensor
> +
> +properties:
> +  compatible:
> +    const: apple,smc-hwmon
> +
> +patternProperties:
> +  "^current-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label

This should be something like this:

"^current-[A-Za-z0-9]{4}$":
  $ref: "#/$defs/sensor"
  unevaluatedProperties: false

With the $defs/sensor being:

$defs:
  sensor:
    type: object
    
    properties:
      apple,key-id:
        $ref: /schemas/types.yaml#/definitions/string
        pattern: "^[A-Za-z0-9]{4}$"
        description: 
          The SMC FourCC key of the desired sensor. Must match the 
          node's suffix.

      label:
        description: Human-readable name for the sensor

    required:
      - apple,key-id
      - label

Though in general, 'label' should never be required being just for human 
convenience.

> +
> +  "^fan-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false

And this one the same as above, but with the additional fan properties 
listed here.

> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      apple,fan-minimum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's minimum speed
> +
> +      apple,fan-maximum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's maximum speed
> +
> +      apple,fan-target:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable endpoint for setting desired fan speed
> +
> +      apple,fan-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable key to enable/disable manual fan control
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^power-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^temperature-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^voltage-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +additionalProperties: false

