Return-Path: <linux-rtc+bounces-4742-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B303B3099B
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Aug 2025 00:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09F41CE7131
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 22:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D572EACFF;
	Thu, 21 Aug 2025 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amuhykT/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446012EA726;
	Thu, 21 Aug 2025 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755816205; cv=none; b=nR/jGDrHKeBlxr8MjrqD7i0eVuKIAroOHI1+298dC3OxONMlzY/ME9p31uoFt6MBuUTLcGvN7SpoyKvSebMBupw4hZUBV/uod2YMkS228Ux+ksMXw8NTDhsTY7MNWWlcbp+kPPuMsVDM1BNVcDuqNRNJ8HE9yrOENKMBuY7UM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755816205; c=relaxed/simple;
	bh=0XbwMb6mfin25nqVmVGrS3TJAQ9t4OcYnRFmV8vF+TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnhrkYpYgnyMgn1hhsdkQ00kzYA7GabvXOnF8U2z+WBFhEYQdjfLmFVrfSfvbefZiUYxAK41oVIQU1q9RYQlhEGOiZkizvK28oPd+5zs8TLX1nWiq803P4uNhQ7iApnqJo1izXKyf49Pqz5M1Z0aNVh17ALR79pLrDIevWkQn4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amuhykT/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50E0C4AF0B;
	Thu, 21 Aug 2025 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755816204;
	bh=0XbwMb6mfin25nqVmVGrS3TJAQ9t4OcYnRFmV8vF+TI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=amuhykT/6bNl92qycxjo47EVZhzUA0e1iADgBLIPhuY6UAix9Wo8dl1CVaPx5knEw
	 mUFsbfRFgwb7MyLDGPcZaWZ+pZG4jnpIahOHvFysCbuvjSR/v7rOehquS3TEoeesCB
	 7/XlSuRgxFUTyoYiv/UZMN6ATtX80HlIc8c4w9/SIHN2HSLOeArcXf7eXV070BVZBf
	 hDGiqYoU3D7rAuMjQUdtcOvPZcW4myQBcFPoqCv2TWnlHxMCFVVl2NyMV4XmqS5dPG
	 RF+2nHPP2T4+BIF5JxutNhAAZQ9KwGMi4MaXVNjIgzQ2Y+UUdrSi/5ewxdsoMXRAB1
	 pVGryf1fQR4ZQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb79db329so218975766b.2;
        Thu, 21 Aug 2025 15:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfz0c1qZhuC4XBAp9kV5LQgY6lvgHJrzivhDIK3Upd04Aa00NK8iqspEyMMnSzH/YmNToFi4Kn/Kay@vger.kernel.org, AJvYcCV5AFXnEFtLXdeaskCBGoc36pWuo2q+ctjIBrPItroXGBssigwkyjeqF1nqtFaS+m7mo+QJv2R91R0k@vger.kernel.org, AJvYcCXHEYaT3qRDMcXlyA5RsaK79htmgJxRHbsRrR7XYZaAWUeRKX1IisA0FspwhGuOoKVv5OSODAYXl4HcZB/J@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjf9MYVXZ+7RIeyCEfRXxq71e3CNPt+e9KEoVERUxaqNHrXjyK
	NGZwhBgLTESM3YqiLNVMo1wcyuaGbWlab0h/VgPwPMwhP/33D6qMrxFV0/JiLo0l+lF7FT/8rXp
	Q1BW0XMRCpwsxJAettPQhuE76Eum45g==
X-Google-Smtp-Source: AGHT+IH5yQMQji2hRsT6QwRFxddQ2y8BE8bx5gJJ7gFL6eR9s/SUuEMn0KPKpJsw1jIA0I1WxumHVB9d6lrVFiKy6WE=
X-Received: by 2002:a17:907:6e91:b0:adb:4342:e898 with SMTP id
 a640c23a62f3a-afe28f6a89bmr73376466b.28.1755816203289; Thu, 21 Aug 2025
 15:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821215703.869628-1-robh@kernel.org> <20250821215703.869628-2-robh@kernel.org>
 <CACRpkdY5Oi6sM8i2OQFkSYUQ-Wwi4FTD3Q3uQ=C6BJyTo8FPKQ@mail.gmail.com>
In-Reply-To: <CACRpkdY5Oi6sM8i2OQFkSYUQ-Wwi4FTD3Q3uQ=C6BJyTo8FPKQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Aug 2025 17:43:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gty=zHMnaOd9COh-vjAxHenQWtbn9EczA73qGbfzCSQ@mail.gmail.com>
X-Gm-Features: Ac12FXwunv16yw6bnZIocD2VS8MWHN95_HSfSlaZ39HW0byBPg8Z-HL8ztuaLxk
Message-ID: <CAL_Jsq+gty=zHMnaOd9COh-vjAxHenQWtbn9EczA73qGbfzCSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc: x1205: Fix Xicor X1205 vendor prefix
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 5:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Aug 21, 2025 at 11:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
>
> > The vendor for the X1205 RTC is not Xircom, but Xicor which was acquire=
d
> > by Intersil. Since the I2C subsystem drops the vendor prefix for driver
> > matching, the vendor prefix hasn't mattered.
> >
> > Fixes: 6875404fdb44 ("rtc: x1205: Add DT probing support")
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> This should probably be tagged for stable since there is
> a device tree using this (correct) compatible and it doesn't
> probe right now.

It should probe just fine as I explained. The I2C subsystem strips the
vendor prefix off for matching, so what you put doesn't really matter.

Rob

