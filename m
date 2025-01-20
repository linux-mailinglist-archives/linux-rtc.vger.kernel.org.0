Return-Path: <linux-rtc+bounces-2968-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74502A1740A
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 22:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B6C3A711E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 21:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BB11F03ED;
	Mon, 20 Jan 2025 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="L0ji2OCp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5919A28D
	for <linux-rtc@vger.kernel.org>; Mon, 20 Jan 2025 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737407988; cv=none; b=VNnbHkWdU5km2T0Xo+vMf636EsDQym3OiYvWXdsR8vCUzkd4YS0+LLXmLKyab5bwUCtPc/yz6AlSrbzrhGV9zlXD9Jli3/5Uln0Jh3wqLQsoQnWKcuvLNs0BsKjxs4buMtgro811vtrURnTygtOk6Y+frGkdwWSsG8lXdwsp6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737407988; c=relaxed/simple;
	bh=Vh0uo3++5QP3EBzz/t2XwqmWwVWPTuEQ5w6IKvetKck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/fE+IqAR+l9D5cOl0/McMV2Fcy46+GGSbAzajOqKYPJ5zso2iMRX/rhMbglqIs6fLXQrtyWKniELXULLt5o9D47VsLsk6IRbZVePUxRXVkTN3t5Dj9AvnXrqvXkb0q+gf8ad2B5JCLB5oGn7rB0EHHI6UZ0obeny2H4mA8axQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=L0ji2OCp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso7400634a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 20 Jan 2025 13:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1737407985; x=1738012785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA6291ZXdac8vRUCwssYg9YOrgMEuOkZxM4d7CqIjqE=;
        b=L0ji2OCpt0f1r6G+IwtimIkYl38IyG76XLQdF1OHl1ns9RhiM0ti2ShsRBmmwF7WiA
         HqBN9B/yyIperqmwYaylYPUIrDpFxLRt/mLfojzejRT7lz81etH5fQtbCa7Cty1mis9u
         jV7KS7Tt2qR6va5XLc2FTH7k9L792Au/9Fvo57yMqJapisBzWUBHc4lpiMA+nA3HYPjS
         DdtRtGf4Slj65XYhiyIOf3VJgYuZykTVW2tZYLmgUVZ8nBz9d0MCjWFR+Vx5y27tEvsR
         BWgkUIlS/ZmqTt5Mg3re/EDGxdjYNkcTmoqYAhwxOu3CPYFkANskTQlU+vaPuADV3xjs
         A/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737407985; x=1738012785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA6291ZXdac8vRUCwssYg9YOrgMEuOkZxM4d7CqIjqE=;
        b=AjaggUzbJikGO57Iq9NvdOVrzTPZutY4dgAh0zj4rutMAvHailbN1r8NrOw1Gu2lPG
         C5dt4lyYhaSuBSJzPPpJ1xfS6mRw9A0FpJzdMw+nNuTvThL/JOpTpQaRmyySrpGRAd3/
         82M57J8ko9OT8G7IO1d79oy8EU4edLo6POOlN3WbX2h+623323SZEySX1Tky+kFkfFBS
         XU49fyles0SZUZVoOs1hAmuWO/datrIysRBFls8fQRozAR57HaRs+ChTE+OwDR5+raNw
         B2mgMlhMBG2PavO3Bb5T3ULOynamxx5KJiUMR6TdtWUDUKSDPZq82RIuuUxq+Aavu0I9
         X0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtD93XqkG89bg66m4fvOBkyZmKAzLbVm8MFdY0jc+5sYYrbDJV0HndWhi+TuhKwjd0IBzGrei2dmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKPQhxjH4oyBT9o1AzrG9V1TIO+6pHyYl3FPWp6dUTXXur5OL
	Sl4JCPl2SlQH1uoVxyaV5sim7ixtGwbG1V1aomA0xOyTFJPWX13EUjXb9CDbhxJ7K5GX1l7SuwC
	o/lQyGwUgoEn48pKY6EChfy9UYAwMnI1hHxJwJ09AsY4SCdbLE0Y=
X-Gm-Gg: ASbGncugXKkhmm10Imhp6H9q30SRiczoYYHsEDJOzc0wo7zQfzcJnPSGfP7pAhttW5I
	4npQ65X2+x690y67pAeDHOemlHI5dnzvei9eylpIQrvxpQRQGewdR
X-Google-Smtp-Source: AGHT+IHc0RPbhZfwtvndyJ4zIg+YQ8UVHDIXIsBwLqHby4Ix3W/JRyz4+JjwjPuaa8KZKDLV2B9ECoKwhLlQY9BPU3U=
X-Received: by 2002:a05:6402:5246:b0:5d9:ad1:dafc with SMTP id
 4fb4d7f45d1cf-5db7db073f1mr33624336a12.25.1737407984546; Mon, 20 Jan 2025
 13:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120144152.11949-1-johan+linaro@kernel.org>
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 20 Jan 2025 15:19:33 -0600
X-Gm-Features: AbW1kvY5jMIUKN1EO4Z8z1FKCHGpDSW9Rthw8kq1Lxb5fCHphJX04MTxERkZW2Y
Message-ID: <CAKXuJqhttfPg7JV_n85bb5v6VKye0F4rYTfWdDYMowdgo83oug@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Jan 20, 2025 at 8:43=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
>
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.
>
> The RTCs in many Qualcomm devices are effectively broken due to the time
> registers being read-only. Instead some other non-volatile memory can be
> used to store an offset which a driver can take into account. On Windows
> on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
> storing such an offset.
>
> When RTC support for the X13s was added two years ago we did not yet
> have UEFI variable support for these machines in mainline and there were
> also some concerns regarding flash wear. [1] As not all Qualcomm
> platforms have UEFI firmware anyway, we instead opted to use a PMIC
> scratch register for storing the offset. [2]
>
> On the UEFI machines in question this is however arguable not correct
> as it means that the RTC time can differ between the UEFI firmware (and
> Windows) and Linux.
>
> Now that the (reverse engineered) UEFI variable implementation has been
> merged and thoroughly tested, let's switch to using that to store the
> RTC offset also on Linux. The flash wear concerns can be mitigated by
> deferring writes due to clock drift until shutdown.
>
> Note that this also avoids having to wait for months for Qualcomm to
> provide a free PMIC SDAM scratch register for X1E and future platforms,
> and specifically allows us to enable the RTC on X1E laptops today.
>
> Rob had some concerns about adding a DT property for indicating that a
> machine uses UEFI for storing the offset and suggested that the driver
> should probe for this instead. Unfortunately, this is easier said than
> done given that UEFI variable support itself is probed for and may not
> be available until after the RTC driver probes.
>
> Hopefully this all goes away (for future platforms) once Qualcomm fix
> their UEFI implementation so that the UEFI time (and variable) services
> can be used directly.
>
> Johan
>
>
> Changes since UEFI offset RFC [1]:
>  - clarify that UEFI variable format is not arbitrary (Alexandre)
>  - add missing use_uefi kernel doc
>  - use dev_dbg() instead of dev_err() (Alexandre)
>  - rename epoch define RTC_TIMESTAMP_EPOCH_GPS (Alexandre)
>  - mitigate flash wear by deferring writes due to clock drift until
>    shutdown
>
> Changes since Jonathan's X1E series v3 [3]:
>  - tweak qcom,no-alarm binding update (and drop Krystzof's Reviewed-by ta=
g)
>  - drop no-alarm flag and restructure probe() to clear feature flag befor=
e
>    registering RTC
>  - use UEFI variable offset on X1E
>
> [1] https://lore.kernel.org/lkml/20230126142057.25715-1-johan+linaro@kern=
el.org/
> [2] https://lore.kernel.org/lkml/20230202155448.6715-1-johan+linaro@kerne=
l.org/
> [3] https://lore.kernel.org/lkml/20241015004945.3676-1-jonathan@marek.ca/
>
>
> Johan Hovold (5):
>   dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
>   rtc: pm8xxx: add support for uefi offset
>   rtc: pm8xxx: mitigate flash wear
>   arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
>   arm64: dts: qcom: x1e80100: enable rtc
>
> Jonathan Marek (2):
>   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
>   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
>
>  .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  11 +
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  11 +-
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |   4 +-
>  drivers/rtc/rtc-pm8xxx.c                      | 194 +++++++++++++++---
>  include/linux/rtc.h                           |   1 +
>  5 files changed, 185 insertions(+), 36 deletions(-)
>
> --
> 2.45.2
>
>

Tested this on the Thinkpad X13s, as well as booting it into Windows
and verifying that it has the correct clock both ways, which it does.
Thank you!

Tested-by: Steev Klimaszewski <steev@kali.org>

