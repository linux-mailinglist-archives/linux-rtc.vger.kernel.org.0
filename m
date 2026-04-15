Return-Path: <linux-rtc+bounces-6335-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y+XkEXo732ldQwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6335-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:17:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADD401444
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FBDA301D6BD
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 07:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0A73A16AC;
	Wed, 15 Apr 2026 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4J6Veg5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1F31328E;
	Wed, 15 Apr 2026 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237431; cv=none; b=DFhVJpMRjtllWcTfykdF1toE0z9qJ4xVfNshd+2C/nK0xL9EYoXjoN68Pb4iYkq2NSIrLkgUFuXjzOAJLwkp77KzHz8F302JnxL14TL2FvTtS6wRvsPnBucPrjVYSmT4avKmyYBaaacvzBxLQWfLI0ZGAw2OvOkEaMPnnAfyUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237431; c=relaxed/simple;
	bh=bykFpr8kKL0KUiE5ut+6uzeRN863t6CApjvZn+J1jhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYYRrOcRBVRqSGWbryi8apYff4ZK14mK9b8rf+p6jL7l211tfTVaINiBuqcRnh+CZMubIreRZN5Hu4cgOX7xTqSDAxticVucJMeXCoXl8qEhrnGLo53hM7l3reApEa/VSLf85wYz56FVbyzv0jUsBKJeKFzDzNaKnf5mmSVLsJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4J6Veg5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5772FC19424;
	Wed, 15 Apr 2026 07:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776237430;
	bh=bykFpr8kKL0KUiE5ut+6uzeRN863t6CApjvZn+J1jhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4J6Veg5TT877gFljTbmDugKyzpSmgLY0RI1SWRbRpuBrqGoLpe9/Uohbo1XNMfbn
	 Qdkiaye7Qn2CpOLyaZOSv0swCrgfySbYdfOovGaq1yLioet3xR26Z99Nj4DQA8Dewy
	 2B7wPRPc7gKmgqGNNCK+avKo5iR8eKtJfHEVrAhPpNkqsHy6Ye1wyBm1a50I9Shotp
	 AdLn1jgH7Q4GzE17Wjpwtx4q7bBi8oWZeOS/IbiQ3I7I9WnvgXKBpbFN8x9TOnE0DB
	 F7RKcA23D4a5pueAggJFBxjZNLfI27yynum/E/IPG12nxf3lTFIHnawe7VZFI3n05r
	 Kq0IOuO/ec+BA==
Date: Wed, 15 Apr 2026 09:17:08 +0200
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
Subject: Re: [PATCH v4 05/13] dt-bindings: mfd: s2mps11: add documentation
 for S2MU005 PMIC
Message-ID: <20260415-notorious-dainty-starfish-58a13c@quoll>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6335-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,disroot.org:server fail,3d:server fail];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97ADD401444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:02:57PM +0530, Kaustabh Chakraborty wrote:
> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
> USB Interface Controller), and flash and RGB LED controllers.
> 
> Since regulators are not supported by this device, unmark this property
> as required and instead set this in a per-device basis for ones which
> need it.
> 
> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
> example for nodes for supported sub-devices, i.e. charger, extcon,
> flash, and rgb.
> 

Limited review because this does not pass build checks.

> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 121 ++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> index ac5d0c149796b..d3d305b9aa765 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> @@ -26,12 +26,28 @@ properties:
>        - samsung,s2mps15-pmic
>        - samsung,s2mpu02-pmic
>        - samsung,s2mpu05-pmic
> +      - samsung,s2mu005-pmic
>  
>    clocks:
>      $ref: /schemas/clock/samsung,s2mps11.yaml
>      description:
>        Child node describing clock provider.
>  
> +  charger:
> +    $ref: /schemas/power/supply/samsung,s2mu005-charger.yaml
> +    description:
> +      Child node describing battery charger device.
> +
> +  extcon:

You got comment to drop extcon naming. If this stays, it's muic for
example.

> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml
> +    description:
> +      Child node describing extcon device.
> +
> +  flash:
> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
> +    description:
> +      Child node describing flash LEDs.
> +

Please make it a separate binding file.

>    interrupts:
>      maxItems: 1
>  
> @@ -43,6 +59,11 @@ properties:
>      description:
>        List of child nodes that specify the regulators.
>  
> +  rgb:

led

> +    $ref: /schemas/leds/samsung,s2mu005-rgb.yaml
> +    description:
> +      Child node describing RGB LEDs.
> +
>    samsung,s2mps11-acokb-ground:
>      description: |
>        Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
> @@ -63,7 +84,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - regulators
>  
>  additionalProperties: false
>  
> @@ -78,6 +98,8 @@ allOf:
>          regulators:
>            $ref: /schemas/regulator/samsung,s2mps11.yaml
>          samsung,s2mps11-wrstbi-ground: false
> +      required:
> +        - regulators
>  
>    - if:
>        properties:
> @@ -89,6 +111,8 @@ allOf:
>          regulators:
>            $ref: /schemas/regulator/samsung,s2mps13.yaml
>          samsung,s2mps11-acokb-ground: false
> +      required:
> +        - regulators
>  
>    - if:
>        properties:
> @@ -101,6 +125,8 @@ allOf:
>            $ref: /schemas/regulator/samsung,s2mps14.yaml
>          samsung,s2mps11-acokb-ground: false
>          samsung,s2mps11-wrstbi-ground: false
> +      required:
> +        - regulators
>  
>    - if:
>        properties:
> @@ -113,6 +139,8 @@ allOf:
>            $ref: /schemas/regulator/samsung,s2mps15.yaml
>          samsung,s2mps11-acokb-ground: false
>          samsung,s2mps11-wrstbi-ground: false
> +      required:
> +        - regulators
>  
>    - if:
>        properties:
> @@ -125,6 +153,8 @@ allOf:
>            $ref: /schemas/regulator/samsung,s2mpu02.yaml
>          samsung,s2mps11-acokb-ground: false
>          samsung,s2mps11-wrstbi-ground: false
> +      required:
> +        - regulators
>  
>    - if:
>        properties:
> @@ -137,6 +167,18 @@ allOf:
>            $ref: /schemas/regulator/samsung,s2mpu05.yaml
>          samsung,s2mps11-acokb-ground: false
>          samsung,s2mps11-wrstbi-ground: false
> +      required:
> +        - regulators
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mu005-pmic
> +    then:
> +      properties:
> +        samsung,s2mps11-acokb-ground: false
> +        samsung,s2mps11-wrstbi-ground: false
>  
>  examples:
>    - |
> @@ -278,3 +320,80 @@ examples:
>              };
>          };
>      };
> +
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
> +            charger {
> +                compatible = "samsung,s2mu005-charger";
> +                monitored-battery = <&battery>;
> +
> +                port {
> +                    charger_to_muic: endpoint {
> +                        remote-endpoint = <&muic_to_charger>;

graph between own nodes is pointless.

Best regards,
Krzysztof


