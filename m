Return-Path: <linux-rtc+bounces-3973-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B12A952E2
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Apr 2025 16:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AC93A7C3F
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Apr 2025 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A52F1C3C08;
	Mon, 21 Apr 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5wcgbML"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F6F1A3150;
	Mon, 21 Apr 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246203; cv=none; b=bTQ7dDrUOx7TH57H+4kUzuGeexqCSscIrWp8jPY2n704D7q5MQmtQrIH8T039uNV5njGJr1CRet8hBYxpUBboSCaM2PqE4EEUzOdP8rh+cqcJPwd59TSqSwuKqbXkUcPleAstKduJR4EUDnhI0ialrtzwONuJx9c3pKiaJYBkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246203; c=relaxed/simple;
	bh=/2K7IVPpkiZRln/JiYfTiki7Tdib7ROz7ZBUlHe3nnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+JogfCQl6qR5NByP9WXXMN5wUIrskMpAuNsR539OALAjaK3ohSNg5EQ6QnFHldhlfGTZS2JrjS6lEYRK1HX/XRI+CmTx/01QnsMIdnMbw4rRJQZqxbiolp1WsSziuzhygydMR6e3mbVo7+NW+tV6l2O9GGsI19kPNdkkC3laVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5wcgbML; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so6393475ab.0;
        Mon, 21 Apr 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745246201; x=1745851001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2K7IVPpkiZRln/JiYfTiki7Tdib7ROz7ZBUlHe3nnc=;
        b=B5wcgbMLIxOJLkMrEXRNj2/ZVejvvjIegwX15slJACmi0aGgdfpHWEaM8Ng5NvlyrI
         Jx9gpizcLwEi5cR1y/xHuAcbkdmfCctTwApdMyRe6WYeuZMFyfLZyXAXT0bc5vtba5Tn
         swm2reyHYgb8MSl8CWVwMinfVldz42RZq0zbzn7Q808iZNB7KOD7Xp3cin8sQwmaeClV
         V4ghkD9/ZUkqo09yUpcq8NxWdQf3S3hPOpuHzW8R94iI84/GQajRJe92ZBm49A7WBhTt
         /BZHGFMxSv7fSqncMpVoM8JLG8qCHYdsV6ABG5vIRYN5pnNUkYvMR4H7tmdEkY+KdW1K
         C5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745246201; x=1745851001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2K7IVPpkiZRln/JiYfTiki7Tdib7ROz7ZBUlHe3nnc=;
        b=a6PrlbOSym0OgQ16oiNGOJuNPv3OqaCzlgiw4A7OfauSi28Lcx7f9GmAcJYYVY4o/u
         2Ug/XSoD5CKTr2MfhbHhIk6m7FhuenRzhSF/y71f76reJwvWsxGBfYesGDBl8ewRfYtG
         BI3bFJJEjQUFqplU36bCfagC7zkfICYP0xt0NXHNvPAfsIG4JEvpWLAM7PI/Y8fKKx8l
         5KzZZBikYrqTI/RY36rPjQsWsf8+gDA5lXF4UgTv+VLb35cNxtNNclhrPLbp/XgM22wX
         PSmcTEBc1B7iH08sbUKUR6sYYe20dpSl5TyZTr4EA/FW3YcqRHQ4gXlvSbOm3BNOJxrs
         iY/g==
X-Forwarded-Encrypted: i=1; AJvYcCULY+u8nPWzUMkvI3pwPt/f8vrVQ++6hJLAjfqzyxmt1g3M3oiXpXJHJZVpIwsibs9+WE0aUw20X3mP@vger.kernel.org, AJvYcCUXYGEQHG/6rdf11kIRHBol3SiOFzE2luDckqy8ijgQZjBZXjFrZRECzWXX//lcA9Jbegixs8PhvLjx@vger.kernel.org, AJvYcCVO1xXpluOAACN23J31g5wF5edP+HbZA2IhH1DBa+K6PFXMqqrlIb1NLprrSCAGkzkx86sQ6SGIHHPQz3hwWg==@vger.kernel.org, AJvYcCX+vk4jVEl4poqQ/BKdegISVMX35yw0tWCG67TH0OtBw01wygGoeNNn6IgEczBzUjPTeYU3XJcAymdCRsL7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7s50+VqSK+yJpIEnpXz3z/KaQnVaFQe4ry2qG1sWEhP77lFQz
	YueTBU0dN2TNsC11+1dbG0JS0qcqNewGjQz0dMV75W1YjE+5Szf0w66tYu7m7//BpDNHPWjdfgG
	R+jX+w67XoupgcFumwhIPnE29hes=
X-Gm-Gg: ASbGncvhv3Thpy9W1zcIHqZO/faQIGmqpKaPKrqNY7evRBZrqDRwYF9JCgTXVliIhzL
	t5SjVwmJ7XN6HEpi39SWxIOHAlYfJ1rXarqAa7F9YRQ7/WgpJyBwPq8N+Kzzy6D7v39c6rthMBg
	k0/PPw22FvFARyfz0QHP8DBoGY+cz1jcbIrq++VYcJ+0f4yFlKti/f
X-Google-Smtp-Source: AGHT+IHzxhf+U9PepZ/IDthCt00hJJp/yp/MeNIIWjESRtsobvwQIbW+O9TvwfEKUN0l8hvXgbPjNieg66LpQnwCv54=
X-Received: by 2002:a05:6e02:1649:b0:3d1:84ad:165e with SMTP id
 e9e14a558f8ab-3d821ea72f8mr109372935ab.7.1745246200649; Mon, 21 Apr 2025
 07:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120144152.11949-1-johan+linaro@kernel.org> <20250127002026.GA2534668-robh@kernel.org>
In-Reply-To: <20250127002026.GA2534668-robh@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Apr 2025 07:36:28 -0700
X-Gm-Features: ATxdqUEWUGd6HHT0L1UvSEXAA_vQSQxLK3W6gP0ue6F-PKOCMrzm5vSh8JiNzhA
Message-ID: <CAF6AEGsfke=x0p1b2-uNX6DuQfRyEjVbJaxTbVLDT2YvSkGJbg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2025 at 4:20=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Jan 20, 2025 at 03:41:45PM +0100, Johan Hovold wrote:
> > This series adds support for utilising the UEFI firmware RTC offset to
> > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > Elite machines.
> >
> > Included is also a patch to switch the Lenovo ThinkPad X13s over to
> > using the UEFI offset.
> >
> > The RTCs in many Qualcomm devices are effectively broken due to the tim=
e
> > registers being read-only. Instead some other non-volatile memory can b=
e
> > used to store an offset which a driver can take into account. On Window=
s
> > on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
> > storing such an offset.
> >
> > When RTC support for the X13s was added two years ago we did not yet
> > have UEFI variable support for these machines in mainline and there wer=
e
> > also some concerns regarding flash wear. [1] As not all Qualcomm
> > platforms have UEFI firmware anyway, we instead opted to use a PMIC
> > scratch register for storing the offset. [2]
> >
> > On the UEFI machines in question this is however arguable not correct
> > as it means that the RTC time can differ between the UEFI firmware (and
> > Windows) and Linux.
> >
> > Now that the (reverse engineered) UEFI variable implementation has been
> > merged and thoroughly tested, let's switch to using that to store the
> > RTC offset also on Linux. The flash wear concerns can be mitigated by
> > deferring writes due to clock drift until shutdown.
> >
> > Note that this also avoids having to wait for months for Qualcomm to
> > provide a free PMIC SDAM scratch register for X1E and future platforms,
> > and specifically allows us to enable the RTC on X1E laptops today.
> >
> > Rob had some concerns about adding a DT property for indicating that a
> > machine uses UEFI for storing the offset and suggested that the driver
> > should probe for this instead. Unfortunately, this is easier said than
> > done given that UEFI variable support itself is probed for and may not
> > be available until after the RTC driver probes.
>
> This information would be useful in the binding commit...
>
> Seems like something I would say, but this is v1 and I have no memory of
> discussing this. I would also say probe ordering is not a DT problem,
> but sounds like an OS problem. Aren't there other things needing EFI
> variables earlyish too? Do you really want to have to update the DT to
> enable this?

I was debugging why RTC offset was not working properly for me, and
eventually realized it was exactly this problem (efivars not avail
when rtc probes).

Hacking up rtc-pm8xxx to return -EPROBE_DEFER "fixes" it

BR,
-R

> OTOH, it's one property, meh.
>
> Rob
>

