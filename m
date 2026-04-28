Return-Path: <linux-rtc+bounces-6443-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GHZKN5O8GncRQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6443-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 08:08:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4D47DE54
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 08:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CFCC303DAB6
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 06:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FAD3290C2;
	Tue, 28 Apr 2026 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjJk8EXv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9262E5B21;
	Tue, 28 Apr 2026 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356082; cv=none; b=RO9l0TBoDmOR9jeXXzVf6Nt7rjlO/wQEjDuohLX+0dyuMNIfXoJLx9hiTWce9cgiR22SXeQrKJo7tX2ZQyeCa4ueUQoqUuKY/fTtcjJES9SAgwr8aiREug9QoX3JMxcFUM++o3Pj4YGr1BZLgc7XjNxMiY6ctKaAHnEwfuJbfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356082; c=relaxed/simple;
	bh=v+Mvyg673DGKe6yZoQGc06NZvj6FBFDVdJZxb9VZvp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unyFJco+KWlUHGTAOqb3V8qQHUdH2UbRq9K3DzYtacbObtUOEx3z2TJOqiRcFjAqZ0/DyxQAPzfHDx7eFHrzxbSvzVR4uNLUZrjUeMwQlSoHS7iiYgWiOsHpEYZ6xW0soJyTfgLi3kcGzCRAQnP/EsYiuIQ+7Ki6mZ+tjHbg8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjJk8EXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD5DC2BCB3;
	Tue, 28 Apr 2026 06:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777356082;
	bh=v+Mvyg673DGKe6yZoQGc06NZvj6FBFDVdJZxb9VZvp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjJk8EXvGr0ICYCP8O6OFJfrzepw9yAcxWFLWskVCg/oNHJx9yvw/DLeByg00NCMq
	 U4PZ/9+TriUhRn9ckLUTSIdjnzHtwRoGuA4cyTfQWGbVKcsKg6IAXy0F5rMcD7wPSN
	 xJRcD9TDIYIOoFYY86Hns8WR7XMuIykpYTnl/iStYxceB8Mb4+8QylicX2cY60ZbGy
	 Nyzk6tOMMtXD/Z681cQDlnT5QYDoWJhnCZdJlWcsG3nJJrenIA8Hrgg1LsDia3c1fR
	 b2Y97E62vhS+UYUHD4xdxouGAwghIxcFEoZxe175QhITtpwZdoU37pk4Fiq5TvdvNj
	 rgot+0K/xlujA==
Date: Tue, 28 Apr 2026 08:01:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Nam Tran <trannamatk@gmail.com>, =?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/11] dt-bindings: mfd: add documentation for S2MU005
 PMIC
Message-ID: <20260428-fortunate-olive-asp-fe4f53@quoll>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-3-fcbc9da5a004@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-s2mu005-pmic-v5-3-fcbc9da5a004@disroot.org>
X-Rspamd-Queue-Id: F2D4D47DE54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6443-lists,linux-rtc=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.271];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email,3d:email]

On Fri, Apr 24, 2026 at 01:09:02AM +0530, Kaustabh Chakraborty wrote:
> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
> USB Interface Controller), and flash and RGB LED controllers.
> 
> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
> example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, and
> RGB LEDs. Charger sub-device uses the node of the parent.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
\r> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> new file mode 100644
> index 0000000000000..0e6afb7d2017b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MU005 Power Management IC
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +description: |
> +  The S2MU005 is a companion power management IC which includes subdevices for
> +  a charger controller, an MUIC (Micro USB Interface Controller), and flash and
> +  RGB LED controllers.
> +
> +allOf:
> +  - $ref: /schemas/power/supply/power-supply.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s2mu005-pmic
> +
> +  flash:
> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
> +    description:
> +      Child node describing flash LEDs.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  muic:
> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
> +    description:
> +      Child node describing MUIC device.
> +
> +  multi-led:
> +    type: object
> +
> +    allOf:
> +      - $ref: /schemas/leds/leds-class-multicolor.yaml#
> +
> +    properties:
> +      compatible:
> +        const: samsung,s2mu005-rgb
> +
> +    required:
> +      - compatible
> +
> +    unevaluatedProperties: false
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@3d {
> +            compatible = "samsung,s2mu005-pmic";
> +            reg = <0x3d>;
> +            interrupt-parent = <&gpa2>;
> +            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +
> +            monitored-battery = <&battery>;
> +
> +            flash {
> +                compatible = "samsung,s2mu005-flash";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                led@0 {
> +                    reg = <0>;
> +                    color = <LED_COLOR_ID_WHITE>;
> +                    function = LED_FUNCTION_FLASH;
> +                };
> +
> +                led@1 {
> +                    reg = <1>;
> +                    color = <LED_COLOR_ID_WHITE>;
> +                    function = LED_FUNCTION_FLASH;
> +                    function-enumerator = <1>;
> +                };
> +            };
> +
> +            muic {
> +                compatible = "samsung,s2mu005-muic";
> +
> +                connector {
> +                    compatible = "usb-b-connector";
> +                    label = "micro-USB";
> +                    type = "micro";
> +                };
> +
> +                port {
> +                    muic_to_usb: endpoint {
> +                        remote-endpoint = <&usb_to_muic>;
> +                    };
> +                };
> +            };
> +
> +            multi-led {
> +                compatible = "samsung,s2mu005-rgb";
> +                color = <LED_COLOR_ID_RGB>;
> +                function = LED_FUNCTION_INDICATOR;
> +                linux,default-trigger = "pattern";
> +            };
> +        };
> +    };
> 
> -- 
> 2.53.0
> 

