Return-Path: <linux-rtc+bounces-2848-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F53A061F5
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2025 17:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8679F18879B5
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2025 16:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC081FF1C4;
	Wed,  8 Jan 2025 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFNib8Tc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7541FE457;
	Wed,  8 Jan 2025 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354242; cv=none; b=IH5BXPilbU9yE/F4TnACERCEHS4XDsmEuBJtSfqZzLOhm9bZrUNFMBxSTOSYaG9j5tTkloRjUNmyBwW4HVzyEZbHkS8R+ytd57S+s61QLIowaJRlFUKgeh92UQjD2O6+zQXHpfBQIbpTBGVIgrwhwrOf9pgciw4Twh2kVb4mrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354242; c=relaxed/simple;
	bh=IMcXXDdCAV533bHrMk2RPmqW4y8bePfWrlfqcCK5DkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA0bnaX1GEFIlhiYj3AFObFWwc0jaAZ/VkRFbZfJrG336c9LicDcHB6fgLegMTF5+wXFU73hL39O8ACgRaXoeOPotNhjFBoVtfURQ6jfmECVqEOX8VN0BrRF0vMKID/DI07LSgwkeQD1w6IbcKBcwU+eQ0O32JU++mHlPhzirB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFNib8Tc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385eed29d17so8139755f8f.0;
        Wed, 08 Jan 2025 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354239; x=1736959039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oaZvubb6b/5Y65DKB0twQiviVJsKDAVdNYBE/1h2cAM=;
        b=jFNib8Tcc6fNerFTvUQMP7fWvVXhqIfzg92A1dQNnyH/yfgKcI9c4JYTa4I2WHH1Gm
         hjlgdB9EvrVc15uK0XUEK/YKHuDIlzdO4rTFHW9qCmKakFB22seb9FE5N07Z5iPXbu7Z
         WF9yskPVniMcKhlJ9txDkUw6VesILn4QiVjnXMs4ewSNPH8as6PjkXKgJKoE+PgBUw9T
         wWwNZ9gAsPl8iiVavugD+YAb0LOYQnIZu7FiyjLTn3omKcy5NZZY5UucjLErVIFcE6fN
         obiqDzs6PGj+4bAb/yQJZbVX4LyX4PHUk86rOIli0xqHfcs5Kxk2csedbvwpb+NOv0mt
         2RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354239; x=1736959039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaZvubb6b/5Y65DKB0twQiviVJsKDAVdNYBE/1h2cAM=;
        b=OOFiARjU5urB3Os20DvwHGQbI/OTETYLVJYgXHpY637CnUSc8D+jftSVCpablQKupM
         zvsiCegs+Rau1SLDTwpd9TlZH9yY7F0eFSbbHzxnrEuEuahbQ4AmDx+Qs/CaA1Xx7zbu
         BY0AvJ/Ech712FuoxKrH1g5ixVwKi3/pHLFdtGMrC5UxXocag/aLapW+E3u4qs4/AzfK
         +COdCtHtud6CRKl3ijLhdmZmjZ9mCpF4uR7foGp7ERBqCzAOxsStqZtVCcugoAq8ov9r
         FhwUt/rHamLsrNW/sTIZzSG813k0sHOx5kVrC9J9RxEohLkHjxaaHpnP5J9s7PVkRMFa
         cSpg==
X-Forwarded-Encrypted: i=1; AJvYcCUrMg0zeGeaWheDaYkesUjkGemFKaqVOHuHxvOsq6/OIG/UDA1RAyeK7UeDyEwsY2NRmVX0FxA4tz4s@vger.kernel.org, AJvYcCVB7uk5vpR+Vn2B9MfkJbUrco36sODkX2bGuOQdnDsdgWmfYpWCdpXh1Kd5YU7kt2ysCO45fv5JH5RQ@vger.kernel.org, AJvYcCVssmN/lbJvHnFQZbe0wzj3i8tP8Sa2Bem2ZakeoINWcE/MZim8QV6PEPOdX485ye1ZFw91LAv80Y/+0A==@vger.kernel.org, AJvYcCWNFiZNTT66kA3jIJxC3k5lZdxJai5D/icOo3zSKEO+nMRNqZFJJppt66tcJskqaQB1DwuVEfonHj6ywJ9C@vger.kernel.org, AJvYcCX+BtY4OQvO7OVBx1ol4H6aSSnBbiid1bGHspoHfThtsl8cgvfj+wFPWFDWNdaSBQVuE4ax6Vdu0vBNRBm5Rw==@vger.kernel.org, AJvYcCXImBRti1j1vpFqzUmDGyxWt1ZXQeIu+IMxlgZ0/RT5DeAux7oFkLmhE010uVQhWIo9tjztumCZHArU1I1WRtcfdHQ=@vger.kernel.org, AJvYcCXk/Lj8LDKyIgF/2hNoI2WyUnq+yO9Nc/Wsp0hfs9pysspko+CI4CzFwnaSwi5xkIbhXWsVcgMOgdfC@vger.kernel.org, AJvYcCXm3U27l2N+l99RO+eaEzMoasEv6db37UTBggdRspB/6/TzktDEdkqXBd4LP0IlOGO/5ccwQVLR5U2FUbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRi3e20ecxCUZjFxUzaSYOedHcGK64NIyzpp7bLn9ukCBOh4d
	w/bDFwp5IC/UF5L4FuevtfjVJmy13YTBQSoTGGcXSyj1IfR7A10C
X-Gm-Gg: ASbGncvZ+Yj69hrg+mjA+7WB9GaRmoahSR6yXIPUzZ8OIoi0scVp6ZZPTtQGinEFiEY
	ZZN6IR8Xs3ATTGYBry8XAvlQ6AOAwDThF+8smFEWmX7oNhqVN7cMtw3LcQFqEw8/MM3B2kxc/eR
	RyWTfk7YiTXJMvlMXxd4LgxMhhcSrvmVH+1/Skp7ga4MD2Xd86I87GP+HppF1e/kaKHS5NWpQOm
	i9bq4VoTwegaZumwzOZsvXDcIDONYeQ2k2Qpf2eqUdMW6ubspx/6xoM8zacHf3iTabE95PY85nE
	+s4PzlvobSdaFWvmvD7UsMCYdbuCl9jGRnnFbLzNwNo=
X-Google-Smtp-Source: AGHT+IHK2KDzhIt68MjkOew8+0ynFBPykBHBW0JWlGbcvjRJxnfeN213vuCJpkbuwwJfUjUouQWekQ==
X-Received: by 2002:adf:ae59:0:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38a88b898b4mr2057382f8f.2.1736354238605;
        Wed, 08 Jan 2025 08:37:18 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm52816674f8f.32.2025.01.08.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:37:17 -0800 (PST)
Date: Wed, 8 Jan 2025 17:37:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
Message-ID: <6ugtusk3yhbr4rbuzompfb2apequpxtdpy3zk3xmrhowpne3nw@2h5cvtpd6qsw>
X-NVConfidentiality: public
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vdnth2dvkpxqrns"
Content-Disposition: inline
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>


--3vdnth2dvkpxqrns
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 02:14:56PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> This applies cleanly on v6.13-rc6 and on next-20250107, so I expect no
> conflicts between Rob's tree and other maintainers' trees.
>=20
> Rob,
> Can you apply it to DT tree?
> ---
>  .../arm/arm,trace-buffer-extension.yaml       |  10 +-
>  .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
>  ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
>  .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
>  .../bindings/interconnect/qcom,rpmh.yaml      |  28 +--
>  .../bindings/iommu/riscv,iommu.yaml           |   6 +-
>  .../devicetree/bindings/leds/leds-mt6360.yaml | 195 +++++++++---------
>  .../devicetree/bindings/mips/brcm/soc.yaml    |  42 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml  |   6 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/mtd/technologic,nand.yaml        |   2 +-
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |   2 +-
>  .../bindings/pci/ti,j721e-pci-ep.yaml         |  34 +--
>  .../bindings/power/reset/qcom,pon.yaml        |  62 +++---
>  .../nvidia,tegra264-bpmp-shmem.yaml           |  15 +-
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-
>  .../amlogic/amlogic,meson-gx-hhi-sysctrl.yaml |  26 +--
>  .../bindings/soc/qcom/qcom,eud.yaml           |  38 ++--
>  .../bindings/soc/ti/wkup-m3-ipc.yaml          |  32 +--
>  20 files changed, 357 insertions(+), 357 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3vdnth2dvkpxqrns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+qbsACgkQ3SOs138+
s6HTwg/9FTrBpsyb2c6RxUphewMFJvl+V6nLpfbmnIG7/hlhP5n2Rosba8pnC16d
JnflQ606ls+DtDBqIImY3LYZcPjcRx/ddXj/H3o2NLFsbbTmOKGEJ6SPhi/YR4Is
AFQMkKbLiMldJyCEH9X+NMmIOEGN44f9eHb6CSpLTAsgPYi2Ppi20vtS+ktX2N8V
9hoO0I8YspPvsj3TqOf1vzPMM9aEb7L6norpLMW8MMIWnkUInUhW5gyxs/OPNma4
OJs7ev/OrjPkBxACJwgiLtBGTVJR56080XgSm7GRqVMnR6NhOGMN/g5x/rrBjy0F
5gprsK059F7h3/oyI5Wn315lnjP9VPjC0OIF08WHRlo0c5zA8TDKYQACT6obPHUh
04nYCErIHSixvHlX91uKHGhfHA79vbttEXCIwrXiuUVOTcoMZBGCzv9njLBIoPdl
v5wzOIzZ+V66lAbWRGTjMcRjO1bx0vM+QpmHvjlEQubggzHG0csIRQB/68wk6min
F+kvzSh1aTJkTNUOYn6BBtbzqjCf8y5NHidBSXBWXhP308OXkwy7fUGqIfrIny7T
41KrDRyFAMooM175JQmuMExgOcRi6fGKmvKQ0MXsNR4FTt9NZ5rvTnkxi1qH8uWv
68sSPZB2xOA8iPax09mEhKUKuyYQPa+Ue1EZlHtc75XMisXE1SQ=
=bVty
-----END PGP SIGNATURE-----

--3vdnth2dvkpxqrns--

