Return-Path: <linux-rtc+bounces-4685-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00DB2496B
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 14:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0851E7A7B6F
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A6015C158;
	Wed, 13 Aug 2025 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMKGUiki"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484CE136672;
	Wed, 13 Aug 2025 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087599; cv=none; b=cifPoatGl3ZRzHZVG+Jb90bVxUPN7SI+5pFHBiYQAF4NF4BBmQiGxWnIpIGeDQeFUymsXYmhchwYcxK2Bkixg5KrGWy9ubV70TodWkXAYDdkmMeGIynNOHZvZsnlO2U1Kd3MPPwzNPFpz4spF53uRyXBW8DvtyYsdCQR2v8nZ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087599; c=relaxed/simple;
	bh=kWwKf+d7Rq93hRlGUo/OEpdJd14FbNbQPT8V99d72Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gbo1dGkks+VeHSrImWJ4VxkCnfIQjK9qfX7k+rpBgyi/taBz39MoYaNypxKut4nY3/81SGPZntK34gaMnWPvKPJBTsEAgvtW5korMmoVyyfTq9VXRr/15bIOHFrSIpbLjGOYbZZ65zGGqauEBhxWWJp8G5ItwotRHtvcALDnzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMKGUiki; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so4949653a91.2;
        Wed, 13 Aug 2025 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755087597; x=1755692397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=fMKGUikiGezGkxxgnjUZBEYufYPXdB0dbMRG0XWinBUAHRWK5iFAfHARWxW8LrMhGu
         Rr2Kbzom6Jp/BZyCMlFSQhjKp+jFZ9fvSX9fvy9b1Lu7CUqF13pylcMd5so2pXbZfpDY
         MtpdmuXsj9IldLmwGZtAHUEncXsycaZGgatqax2ttelaUxqIkkCqrpb7ARiUOcWT3EHr
         AxzIe5tSdTpBuT5ZvK4hdYH2BqoFlBtbb2frJRCUTgJHVdciawqg6qTdjRWewkuMAmCP
         De95yesUSyhkGvyKS+QzRJ0i9LHOSQYJWVtmMbaQ0yge7eOsZQuLeADuv5uJOtsD+yw/
         8amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087597; x=1755692397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=A41ArLDzNQGHVrv27z8SDgTNvtMqu3r/5sFkc5cAu0NesVVhVO2AU4cmFhH3NgoVRr
         vIjMg2ee2f/aLFnD7e0BS8UeewU2mnvIRnv4PVVC3fMSL5vETUhT9j9wTAnID6ed98BU
         S0FjO3bCS/7agECeZnbAuPfm4jaLLgvDw+rO4VDeYXInaMLk14WfwONxLKf+tFH4tAaN
         +bmElrhrlkz8SiHvTuFefBIItfaBtVW7XvvEcEDPtY9cItjE+TCEaOF9LhO6OOtbyv/z
         36CNU8w0hDSQiUffdzh2A/swW4rVnksq5G1J9ivmJw3tLsDYWZtJDEyCN62gUMePAmY2
         /jYg==
X-Forwarded-Encrypted: i=1; AJvYcCUyWrymxRBqi9VWd8DbUfhYRJWstY17E+3MuwT4+j9r2Vgy4oQyEK7+MMG2RQ4b2F4XUdaXdqNUIcTq@vger.kernel.org, AJvYcCVI7i/juTUWbk/pyV7nCX51NP2pBoo6+Lvmf4ypBDq4lSno3B8jOV43SRVfkRuaCbxNwGS9Fhp97dnP0wV/@vger.kernel.org, AJvYcCVvCRXa6HEA/sdg2EJ+d+rTxTf9kHfMsTs2UepF2uuIL3tkyZ5ukdLlCHlm5rnNaEJwirqXvPBY9mhw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rRq9KZWaXUj7XjvzJkZVmuhsnt602ZKVm/9oMDtJInZXRHaO
	vHtopwdi3pXF+xPMweBC1EEaDN5iCCdO2AtcDWLop03ffoasflBpRx/+
X-Gm-Gg: ASbGncuFrxtl4RDUIfEXLBW2A4BjwcL9AgIvNXemoduDzKFmoMcCYJHzPGVIDkmQUIb
	aIQe4G6RfP72sYB2J2DQnFc5wJLEeNLWFDP+Myv+IK/IoX82rfaMhRgvBUb6U0Oyiu7u4nMIZgm
	WUf1ruHcDWWGtgTApoVzelzolLPpjaR2iE/6B5GMo5StaWVftd3VtnghV10FRv7hnT5eqUMWGiB
	odBbO5i7NuEA8XYHkAkpffw26h7ZWgdyUoVAvjuUfBZx0wa6+xs6IxvKmsqUkYtS+FIPdI56Pnx
	mgUGirjbPU4rxMf0wTd15sBxvQA2WtPsxrS1/2+9POVGlhpzOE36LDUR5cC8aWGNpgPD+EOkXsw
	uMzWgFdx4C6aqE0923Jt+qEB2ir31zcg=
X-Google-Smtp-Source: AGHT+IEFlXvKJVszOuCgY2L3pa333NYha1FOY/G7JfVFhsfManM3a/rZhg0qEyDVkRt5u2BFBdgGqQ==
X-Received: by 2002:a17:90b:1a8a:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-321d0d42332mr3886934a91.4.1755087597351;
        Wed, 13 Aug 2025 05:19:57 -0700 (PDT)
Received: from localhost ([2408:8256:2289:c8ae:c016:1fd0:d59b:62c6])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3232580316dsm23954a91.16.2025.08.13.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:19:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:19:50 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
Message-ID: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813024509.2325988-2-elder@riscstar.com>

On Tue, Aug 12, 2025 at 09:45:02PM -0500, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
> only the RTC and regulators will be supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> new file mode 100644
> index 0000000000000..5cc34d4934b54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT P1 Power Management Integrated Circuit
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
You can change it from this to my company email:
troy.mitchell@linux.spacemit.com

Acked-by: Troy Mitchell <troymitchell988@gmail.com>

                - Troy
> +
> +description:
> +  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
> +  constant-on-time buck converters and twelve low-dropout regulators.
> +  It also contains a load switch, watchdog timer, real-time clock, eight
> +  12-bit ADC channels, and six GPIOs.  Additional details are available
> +  in the "Power Stone/P1" section at the following link.
> +    https://developer.spacemit.com/documentation
> +
> +properties:
> +  compatible:
> +    const: spacemit,p1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Input supply phandle.
> +
> +  regulators:
> +    type: object
> +
> +    patternProperties:
> +      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +    unevaluatedProperties: false
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
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@41 {
> +            compatible = "spacemit,p1";
> +            reg = <0x41>;
> +            interrupts = <64>;
> +
> +            regulators {
> +                buck1 {
> +                    regulator-name = "buck1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
> +                aldo1 {
> +                    regulator-name = "aldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +
> +                dldo1 {
> +                    regulator-name = "dldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.48.1
> 

