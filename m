Return-Path: <linux-rtc+bounces-5926-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IDlHTpffmliXwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5926-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 20:59:54 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D017BC3C3A
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 20:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F3B3029AD0
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 19:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0675A36CDEF;
	Sat, 31 Jan 2026 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yOaOumtW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7C36C5A6
	for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889579; cv=none; b=hcOCEzFUKBFz5BJLDlx4/icMCHnFblS8tK9By2djNnpNXi8xYorhsPTZw26X1kHZUqvKs+zW15wnZq0Kqf80uOXW9EeiiOWi6OVkaBTEXeZTPcZLFElmBJmMYad9cWMPcN4C8PXixdG2+by0AGHi3VeD3l72FMJ+rWWCVqL358c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889579; c=relaxed/simple;
	bh=y501ybWHBgGRKwznvyi4r3Ot4gsoNEcrqXIf0H2+IFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T82vmqf/luW9IO8+zzKpUbIeT/HzAP7YdWE2eaa9svdgGu/g1jamSIoLMiOowWEjSIryGlur6Nm3TFi+ON1htVE9JG6AuabCIdN04mBXApu04yQhoO6vxq3ZsYWiXsIoaR/+7RZdbFLD4vejwbpWR2V14E7Yzo39q/6Db+AtXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yOaOumtW; arc=none smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-40423dbe98bso1485176fac.2
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769889576; x=1770494376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElQ4mZrKFvJjO3Pi3PK+S2VsoWxu8vErX54kiEsiHyM=;
        b=yOaOumtW2KbV4JjPlFFWE8iPUmm0x1fmK1VHg/d1znD2UzoVlBV2D8o67cGSBS6WkV
         T9azRTRRCU4OUe88g98GcBjFZtUxeHfeax9jOEbAYsS0cz2MMVJf6BmhS3NNUR7eMFbp
         hqqdzSgzqi4bF6hpw1Jnc0h9t2ga5U8QEzxgOFOauAjLWR1LDDFOLcSA7gsLe/mOgtAz
         SBdnqtaMDpjMQY2Vg+wkDrBCxhFx3dG1T36scs+wRTI8q2ePNv+eQnjOpHfDtN4vIsty
         R+GwQpSnDFsjHOe1gwoUceJ1phB4P53OxRWzhN6uwd6F+ndgqw09kWw8o3x2sZJcfa3c
         Azyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889576; x=1770494376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElQ4mZrKFvJjO3Pi3PK+S2VsoWxu8vErX54kiEsiHyM=;
        b=L5sx5y6TKXmlEtafuobhNdl5d52zn/szd/5P/upsYIsHLQTbCEu6ICEMBDpP9AGeQm
         lS1pFyoNkZr3EQG4wSoFAm/fwB8ogDkkmbmiUsd4z75WQSY1R1Kw0KoB2xpE3G/FRd68
         h1lsrtn/s7mJg8uEwLTpNuVbYBB+zDbT+/c5L67nheFhwW3anxnJIQqwksB4eo440cpx
         U1o4+nKfvPkFR1p1CI17zDXkPpQZtnwCagybOr0F0U0xCeKKp/s3vM6l0XWH1ii7x8eB
         nyGtLMx8/PSvidLaiog/z26v+UmZi7XmQv6P1Nj/tvyNk/zpoSEug2o/VRR+ZWUThuT2
         CMuw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zAuRi/zTvUXYO3Muaul6AhHfKYzB6gq/uT76o0pbAkYVCTajD8gmAlURVOxBaahKj+S41FbZ0aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzwWn28jcRm5HFLoCtNDRZNlUYJpJe7aLy0X4l3Z3q+71d1Ux
	j1T9r9zcKWv4qkJd+PGJ4o3dOw88QAk0gsulchNVrDP+Yo7Mc/DN3fHOn027L/eZv6I=
X-Gm-Gg: AZuq6aKLH+mO2deIqeGB+IKPI3ePdlW7+AmgoSG1lPVGfjS/E9GoCadkh5tdlfgot8o
	sfdJP6/+MwfDmw7Px2TyWnXPlX2PQ5xkiRXIynxLutWkuXA64QQra566gKuKQlra/6EPHayOfYN
	e+3VKt0o07nepZ2k2DojYXreVx2eAe6BgcntmjcMD4sgoAtqz9BFY7H5Gf8LMta7Cx8wn3fF0sT
	w876ReGdQzgGYqGAL+XVaY9QjPISzlCkxARL7C1RLw28wGZFjpLf3Gej1FXvYYbQ3jNHgCwX0DW
	odIdS2E5ocJnLAxp2ju5xty+z0Z9nNrCKlpTCEayQyTgdA7wVBfPPICimSRPQFXdNIqyR14u20x
	6/FFXUpD89BPHb75nSnEUOV7gF58lGqqGAmW7E73W3We5h2Pi+tQtne53zMso4irv5ShkIKI4y0
	LRlMHA46f+97zdUYKjgvLMZt3nRLM68ulE3WwRC6rUhTpi/spbb8RdFpaWYXAq
X-Received: by 2002:a05:6871:c968:b0:3f1:664f:e8db with SMTP id 586e51a60fabf-409a6ba324emr4043538fac.23.1769889576024;
        Sat, 31 Jan 2026 11:59:36 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409570f1413sm8612306fac.2.2026.01.31.11.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:59:25 -0800 (PST)
Message-ID: <51d07338-6ddd-4893-986f-7fab96ff6802@baylibre.com>
Date: Sat, 31 Jan 2026 13:59:24 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/10] dt-bindings: leds: leds-cpcap: convert to schema
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-6-clamor95@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260125134302.45958-6-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5926-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,baylibre.com:mid]
X-Rspamd-Queue-Id: D017BC3C3A
X-Rspamd-Action: no action

On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> Convert leds devicetree bindings for the Motorola CPCAP MFD from TXT to
> YAML format. This patch does not change any functionality; the bindings
> remain the same.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
>  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
> deleted file mode 100644
> index ebf7cdc7f70c..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Motorola CPCAP PMIC LEDs
> -------------------------
> -
> -This module is part of the CPCAP. For more details about the whole
> -chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> -
> -Requires node properties:
> -- compatible: should be one of
> -   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
> -   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
> -   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
> -   * "motorola,cpcap-led-red"		(Red Triode)
> -   * "motorola,cpcap-led-green"		(Green Triode)
> -   * "motorola,cpcap-led-blue"		(Blue Triode)
> -   * "motorola,cpcap-led-cf"		(Camera Flash)
> -   * "motorola,cpcap-led-bt"		(Bluetooth)
> -   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
> -- label: see Documentation/devicetree/bindings/leds/common.txt
> -- vdd-supply: A phandle to the regulator powering the LED
> -
> -Example:
> -
> -&cpcap {
> -	cpcap_led_red: red-led {
> -		compatible = "motorola,cpcap-led-red";
> -		label = "cpcap:red";
> -		vdd-supply = <&sw5>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
> new file mode 100644
> index 000000000000..8dfc98a1ef99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola CPCAP PMIC leds
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  This module is part of the Motorola CPCAP MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. Leds are

s/Leds/LEDs/

> +  represented as sub-nodes of the PMIC node on the device tree.
> +
> +allOf:
> +  - $ref: /schemas/leds/common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - motorola,cpcap-led-adl # Display Lighting
> +      - motorola,cpcap-led-blue # Blue Triode
> +      - motorola,cpcap-led-bt # Bluetooth
> +      - motorola,cpcap-led-cf # Camera Flash
> +      - motorola,cpcap-led-cp # Camera Privacy LED
> +      - motorola,cpcap-led-green # Green Triode
> +      - motorola,cpcap-led-kl # Keyboard Lighting
> +      - motorola,cpcap-led-mdl # Main Display Lighting
> +      - motorola,cpcap-led-red # Red Triode
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - label
> +  - vdd-supply
> +
> +unevaluatedProperties: false
> +

Should keep the example here.

> +...


