Return-Path: <linux-rtc+bounces-6564-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PxEG8D6D2qCSAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6564-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2026 08:42:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA205AF9C4
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2026 08:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1E92301F78C
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2026 06:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282A371049;
	Fri, 22 May 2026 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2W661O6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81F3EA66;
	Fri, 22 May 2026 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432125; cv=none; b=M8VkPLwm0WiW+8QIploLwJ0EwS1mtd30RBcRD1t6xWq4cmr6BsxPw3U8amvQoUshsvu3Lro/kCm7CoWYoDN/ujzHQtSSw8XH5MqXysjFaCM8H5ko6oCJypaWy1qgVGwo3FfLNEz2iDXCSigu4POx+/ikWnx/o1RU5rNsf2odZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432125; c=relaxed/simple;
	bh=2KjPLd/oqgveZd9jBvNDAZqGC3uA6jKr6iMhAecbRi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du1n0GYNCk8a/v3H5C6yedDSg3K3g+swQtfqnlTRciyxTAj/+LFD2HxbwSGhkHyiz3gVn2nUyWq/iDCAr7XGKpximR4VE+4RUkR92ZxTVESw1YRWaP7ODwmV6UbfSuAvVumxw9j78T2vGcJYxzvAJSrD+j8d3UMXXhvYW3x7hkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2W661O6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816CD1F000E9;
	Fri, 22 May 2026 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432124;
	bh=l0CexUZkQ2nonkzf2YIbC7mbJTdht2vfw3dm5wq1r8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A2W661O6jRgCniiU7+OacQ10ukbpQScMuYCOGD1TFsXS0v21bc36MW5QCDCSVCqco
	 spEET8m+Xf11VfOTOxv61TsAsS25DPD7V6r9CNne/y9FJxwnFhdqa4splXZtH5psUI
	 36CP0+VyA8YobSZy5TzNwqbkT14CNhdV2YQNKXxhJGe+e7+BNtn7e+lqaV35IU9zu5
	 V+5Pgv698zd7ScHQpo3wOQFMjP02gHq/zDRxzXBFt/hJ7yx4/aD16EOjfpEmeOkPEI
	 CAExfSXOKKa7kFSp7CgFkgRU9Q8igPHqBUdL0vEbNhMuLZevgPPiHCKUHroPR5waCC
	 jyIs1DTdGYRhA==
Date: Fri, 22 May 2026 08:42:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: via,vt8500: Convert to DT Schema
Message-ID: <20260522-passionate-fair-jellyfish-73b2ee@quoll>
References: <20260521170810.19702-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521170810.19702-1-challauday369@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6564-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email,0.0.0.200:email]
X-Rspamd-Queue-Id: DAA205AF9C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:37:28PM +0530, Udaya Kiran Challa wrote:
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> controller binding from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v1:
> - Add default value for divisor-mask
> - Add required properties compatible and model
> - Fix example node name
> - Update example size cells and reg value
> 
> Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
> ---
>  .../bindings/clock/via,vt8500-clock.yaml      | 126 ++++++++++++++++++
>  .../devicetree/bindings/clock/vt8500.txt      |  74 ----------
>  2 files changed, 126 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> new file mode 100644
> index 000000000000..9e19103866bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Clock Controller
> +
> +maintainers:
> +  - Michael Turquette <mturquette@baylibre.com>
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
> +  series SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - via,vt8500-pll-clock
> +      - wm,wm8650-pll-clock
> +      - wm,wm8750-pll-clock
> +      - wm,wm8850-pll-clock
> +      - via,vt8500-device-clock
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Offset of the PLL register within the PMC register space.
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Parent reference clock.

Drop description

> +
> +  "#clock-cells":
> +    const: 0
> +
> +  enable-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset of the clock enable register within the PMC register space.
> +
> +  enable-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 31
> +    description:
> +      Bit index controlling clock enable.
> +
> +  divisor-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset of the clock divisor register within the PMC register space.
> +
> +  divisor-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x1f
> +    description:
> +      Bitmask describing the divisor field inside divisor-reg.
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - via,vt8500-pll-clock
> +            - wm,wm8650-pll-clock
> +            - wm,wm8750-pll-clock
> +            - wm,wm8850-pll-clock
> +    then:
> +      required:
> +        - reg
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: via,vt8500-device-clock
> +    then:
> +      required:
> +        - clocks
> +      anyOf:
> +        - required:
> +            - enable-reg
> +            - enable-bit
> +        - required:
> +            - divisor-reg

reg: false, no?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    / {
> +        compatible = "via,wm8650";
> +        model = "Wondermedia WM8650";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ref25: clock-25000000 {
> +            compatible = "fixed-clock";
> +            #clock-cells = <0>;
> +            clock-frequency = <25000000>;
> +        };

Drop everything above

> +
> +        plla: clock@200 {
> +            compatible = "wm,wm8650-pll-clock";
> +            reg = <0x200 0x04>;
> +            clocks = <&ref25>;
> +            #clock-cells = <0>;
> +        };
> +
> +        clksdhc: clock {

Entire binding is for part of other device, so where is the rest? This
should not be done separately from the parent. And then example goes
only to one place.

Best regards,
Krzysztof


