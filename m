Return-Path: <linux-rtc+bounces-2827-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C52A0056C
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 08:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8ED73A18F9
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 07:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479A11C5489;
	Fri,  3 Jan 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLgEhdPY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F61B2186;
	Fri,  3 Jan 2025 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735891145; cv=none; b=Zy3nakT4bwDfFXlr0fRLCGsP09oZPKN3myKIEIaCYODC34e7/FM9TFklzDuYxwd4FBiZPaFqwlcbyRaOcYh/y5+xmDDpGsPwige/VcowJs0gY6XyodFLcKrj9xbxV/JG5gKNszGa2cKPm0Un8UHctapXGxAVvcfyHLVjTU+iqVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735891145; c=relaxed/simple;
	bh=I2cmDVquhs9nMWkQOh5/1Q3KWbWOXMCh36jemenquL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2I8SDkM9okxvRnzmKz+EnYU5Odh7jGvZRnT+absRFK/GGyfZE9aF9xA0GE34SZ8yr6CkvO97bqzkQ88psLsTEN43FZFKwkJYPv2/0xqIpe4CpMzBcjliDjUWkL0xR3k/gB/I4Sh30U5Uv90MCphkURnUcbBciN11VIAPNgvvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLgEhdPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84AAC4CECE;
	Fri,  3 Jan 2025 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735891144;
	bh=I2cmDVquhs9nMWkQOh5/1Q3KWbWOXMCh36jemenquL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLgEhdPYqm32nuAZAKwxNQGMImR/f4c2382ijC3eXbMSo6Fxx7l0gbTM7IdKC6gV1
	 DS9lxgbdc9ASiJmhx57FowaAhxG99AsWj1ybGn/jQ3SzgYqVmlz1QJuR1VEr3mTHYe
	 xdVCSshulAuQ1Ekh6xi8C9LubUertqjyfyJNKUa12DBypkQZISJkepxiZDxiiEOLJ0
	 dVYG2cQQarlspx6b/dXMo1iA0PsVOn1jMsMF9jtN4h3p13cbnPthu/LSoVZXtq1YCI
	 wI0W01DlWeB8TuJGWrDVoQvmCoN8yzOuntE8xhTnHbdBTzgxaPq1Oionlq+QbCSSX2
	 5ZWqyCcA8cE+g==
Date: Fri, 3 Jan 2025 08:59:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: PavithraUdayakumar-adi <pavithra.u@analog.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dtbindings:rtc:max31335:Add max31331 support
Message-ID: <k6jhp3ivrqiylt6hqnmz2pjukkmb2x466lfwsouzjgbk3l6ehl@zh3em24rajms>
References: <20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com>
 <20250103-add_support_max31331_fix-v1-1-8ff3c7a81734@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250103-add_support_max31331_fix-v1-1-8ff3c7a81734@analog.com>

On Fri, Jan 03, 2025 at 12:34:19PM +0530, PavithraUdayakumar-adi wrote:
> Add support to max31331 RTC chip in adi,max31335.yaml

This we see from the diff. What we do not see is why these are not
compatible, for example.

>=20
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>

Subject - missing spaces. Use 'git log' to learn how subject is supposed
to look like.

> ---
>  .../devicetree/bindings/rtc/adi,max31335.yaml      | 32 ++++++++++++++++=
++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Do=
cumentation/devicetree/bindings/rtc/adi,max31335.yaml
> index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..6953553d98afd42ed9b79bac4=
76657ffc8ec9210 100644
> --- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> +++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> @@ -13,15 +13,15 @@ description:
>    Analog Devices MAX31335 I2C RTC =C2=B12ppm Automotive Real-Time Clock =
with
>    Integrated MEMS Resonator.
> =20
> -allOf:
> -  - $ref: rtc.yaml#
> -
>  properties:
>    compatible:
> -    const: adi,max31335
> +    enum:
> +      - adi,max31331
> +      - adi,max31335

Devices are not compatible?

> =20
>    reg:
> -    maxItems: 1
> +    items:
> +      - enum: [0x68, 0x69]
> =20
>    interrupts:
>      maxItems: 1
> @@ -50,6 +50,26 @@ required:
> =20
>  unevaluatedProperties: false
> =20
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,max31335
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - const: 0x69
> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - const: 0x68

Just drop it, really no benefits. Why complicating the binding for
checking address?

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> @@ -58,7 +78,7 @@ examples:
>          #size-cells =3D <0>;
> =20
>          rtc@68 {
> -            compatible =3D "adi,max31335";
> +            compatible =3D "adi,max31331";

Why? Commit msg is silent about this.

Best regards,
Krzysztof


