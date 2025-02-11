Return-Path: <linux-rtc+bounces-3157-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5CA31770
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 22:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168E5188A0CA
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 21:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5D81EF0B2;
	Tue, 11 Feb 2025 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDQnUOUj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A5264A9F;
	Tue, 11 Feb 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308628; cv=none; b=j1rJt33fdM+3WulCZeu75RgLgjidzPgwu23WdmnaCf6HWAao5/QSlRICSyHYzR/wHkThmZy3KLwcSdfbNjKa6bh2g4qD9IwV586fZ0F+4XEYyzA9PGKS/68PMIYkJTR8qP8tUX/1N1NEVdHomJL9GCN1/j+Ue3g4LHrg1A/jcY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308628; c=relaxed/simple;
	bh=kL4pLRpea7Cu+7ztNj7Yfeqe+//z5davQY0XpetXYu8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gBvycpNjYofr3zeGlhwugWzFnH7Dta5TJrupJomTA106oaFf/5wlbGBTIGnmEdzLv5MeIQ+AvJbyYoBZlz+TxR0XCMX2D3rIf43pypIoEVxu49X41JfdagLEHqaYqRmsrBvPmEEDVijaSagBd4RPF+oIR5pppV5S1STVxB4464o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDQnUOUj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7d451f7c4so265617866b.0;
        Tue, 11 Feb 2025 13:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739308625; x=1739913425; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kL4pLRpea7Cu+7ztNj7Yfeqe+//z5davQY0XpetXYu8=;
        b=jDQnUOUjMqd4fUJTUzJlH7CQG8WXOe7zZAlYYFw0KUykJXr1Dk/untCQDgNXNCxLxx
         /J0IZTD8T1qO4aCaZCt54T9v/Yxx7r4xWdvjgPlrbicygDzuC9tnNGmvN3OV3mh2qwtb
         EFYuENSVWIi8cmcNSkob/otu8oeo35aA8Vv3oM9iIZVOZDe/sbVdOEE/0lc79vy6OyFb
         jw1IqIuUvoZGa0HE5gurUrzuUPl72HahMTibGx5SBnrCOShhAEGgTRHbi7Z3oo3SABJY
         m/8Sq0bz+HzoK2dHUA7PC3m0V9LASOdoTlp2Rigpr3coFT7xaG5TC+Avj61YBcGsQcQ3
         mFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739308625; x=1739913425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kL4pLRpea7Cu+7ztNj7Yfeqe+//z5davQY0XpetXYu8=;
        b=psXujSCVUwh1PKZabl2Kf7gTGm/OEMdEtR4bz7HJ2TNY3kLxqyLTJp81sCBvAB5pj8
         oN4CgWxX+smRP4zEhMRmoZugiPwsC4qtzm1WeF+AwFtHguwWUpjKC1E50lMfi2wMy8Us
         XiNv7GgK/x8YTOY2ekm9oN9E/RfNj5zrtFU+cU9ewcXLO8K8+zbFtJdxZuHn+u97GBRt
         v0w8pV/RmomfYJEIMU/yi1XohNU8IwWo7p/XFWtRAUAQKO+3S/g3QFTbc3oKx9a015lJ
         C563yt7z8HNttbisu6NKAKLylGsy2dD2H6l/2I0ijKBF6UTHQmsCX+Cf0Nopbv3DHBVn
         lFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf8TpqxY8Cbb3S4zDkoiYpXLZ9AkWySTW5eyeyFqXC+7zQ9EEIAGe2vrNxCtvg+eNFZzuvbdeldn1C@vger.kernel.org, AJvYcCWoSru83mX/upYIMnUCpUI6Twcqo2jPCdVFEWpq6dqEtvMNad6JcRSY1Fh7dvuhtBtDfsBhsCEJ6H8I@vger.kernel.org, AJvYcCXnwN6VO9yrToE7II/lZQlN/E7Na0Z1U+qbMehDi5fgXUn/bdgF+cOUmTZaxqM6ud/ml/asaB8FIONL37Dt@vger.kernel.org
X-Gm-Message-State: AOJu0Yww72BW/CJ5uJf0hDTJc8PFVXE28d3tjrBsumM8k++nkX9krWeJ
	n0nyJt2c5sXF1ck5/a//oMAJczVXea7+KhgnIOQ7EGuGfsH9WQJZ
X-Gm-Gg: ASbGnctvRj7Z7jEMpBKRGyaoLYlkxQHBPg7vgUsTih0zs4XR/RqEM0DagqPHsleeBGm
	6k1ilrRzix/BtcwRlTwwOn0ll1SPRDUfO1UQUdeY+Obu+lE7OCzrmOUBhakbWK9EfS+c6d8p6aZ
	mp4pWbfQA3T8aYmzLrjmffuBYHV8yY7EEcWEo3tAbpxau/EbttWWeUNohZQoX3iioDG35THiSSh
	43XJJUT3qprGGCuh79lQDSPw0uOV//H9rMhuu70oQHs0zVXSXsOVEKNDo1lyxlcuiUVFo+/bb1d
	tOvSTsy4AP0Xbv9JIp7Cxpr4uZqm9O11
X-Google-Smtp-Source: AGHT+IGni2/bzHFeeZX8aVfgIY4iMRShws/1IbPt7a2N9AbncofAa7JiMPAeDkXCfvENazx3YMpJFQ==
X-Received: by 2002:a17:907:60d5:b0:ab6:eecb:41f0 with SMTP id a640c23a62f3a-ab7f34738a9mr42642166b.35.1739308624364;
        Tue, 11 Feb 2025 13:17:04 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d18e006csm321274266b.52.2025.02.11.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:17:03 -0800 (PST)
Message-ID: <5d0f0f209194ca5ad1e4f93ab5fefd40484855e3.camel@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: dlan@gentoo.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, Krzysztof Kozlowski	
 <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Feb 2025 22:17:00 +0100
In-Reply-To: <20240428060848.706573-2-qiujingbao.dlmu@gmail.com>
References: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
	 <20240428060848.706573-2-qiujingbao.dlmu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for your patch Jingbao!

On Sun, 2024-04-28 at 14:08 +0800, Jingbao Qiu wrote:
> Add RTC devicetree binding for Sophgo CV1800 SoC.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Verified against SG2000 TRM [1], the bindings make sense to me.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

[1] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01=
/sg2000_trm_en.pdf

---
> =C2=A0.../bindings/rtc/sophgo,cv1800-rtc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 53 +++++++++++++++++++
> =C2=A01 file changed, 53 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1=
800-rtc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml=
 b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> new file mode 100644
> index 000000000000..b36b51a69166
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +=C2=A0 Real Time Clock (RTC) is an independently powered module
> +=C2=A0 within the chip, which includes a 32KHz oscillator and a
> +=C2=A0 Power On Reset/POR submodule. It can be used for time display
> +=C2=A0 and timed alarm generation. In addition, the hardware state
> +=C2=A0 machine provides triggering and timing control for chip
> +=C2=A0 power on, off, and reset.
> +
> +maintainers:
> +=C2=A0 - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +allOf:
> +=C2=A0 - $ref: rtc.yaml#
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: sophgo,cv1800-rtc
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - interrupts
> +=C2=A0 - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> +
> +=C2=A0=C2=A0=C2=A0 rtc@5025000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,cv1800=
-rtc";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x5025000 0x2000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <17 IRQ_TYPE_L=
EVEL_HIGH>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&osc>;
> +=C2=A0=C2=A0=C2=A0 };

--=20
Alexander Sverdlin.


