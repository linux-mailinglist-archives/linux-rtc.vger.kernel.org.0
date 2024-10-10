Return-Path: <linux-rtc+bounces-2148-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60176998329
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 12:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD871C222B7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6821BE23D;
	Thu, 10 Oct 2024 10:09:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB0F18C03D;
	Thu, 10 Oct 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554943; cv=none; b=kFTHddJwM65LpCyNUwWJBaDGim3AuMRToc0SE5HfHQIqFNKoBZxP0RyDhzMCOwdXULnNwGIdLbH4qPHw2QudvfMazs1bPdJpUDiKyRbzUAx60/q9NNpZB5Oh1Hhzu08GgYoeSbsbD9SHcFAu1I7sKtIeHHqQpJoFVEUooiDMbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554943; c=relaxed/simple;
	bh=YWHB+my37muquSy1XkY//hgr5fEDz/6DVNflN1m/7dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXFduuPenDVfLtMcA2ZDWYS9AleOZUOm+GMItD0mdvP7FQ76GvQ2efYjMsmdDxXNnNoI0mrqXUakZIdN2fW0o0BTmMsnxjXeoMff0/S+cIQQ9WmOmfs9IldghQlsxxeYPzcNMgkpEmmAv794Nrd0WPAXXU3T5xvZjt/Lt+vkAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso743655276.2;
        Thu, 10 Oct 2024 03:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554941; x=1729159741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miJ8/WzZit7AkjMUZIt04ikXcWEMhi6CNqSN9WbGjyg=;
        b=Jd7g8E/Kh9q2xUfNGiQ8wWKxKrsVweZf2hWK1aPYE9KUd+GaK8rxtRKJ7MTbbYj/A2
         FEj6CfMML7ygxKl2IGXRbXslOVPcrpiSRC6yFtqDC1tddqh9W4AJ7lrOcoMNCUFc2CO4
         JI1Y9e0ha1sVPqDb2lVKrsoKp75mSlGC66wbgMIzRCMJ0rbiAG/xBGdBzWVnCwiBRa3t
         p/AApLsJxJiu+LyY1a3c91EZcp/iUFHsDHgaHxnulB2UvTivqGJiwKNi8h5J9wonjYyP
         lKMJ7Va5upxnPvv+Ucc6kZKEp5QjBR1mW5vAcirZXxblvVZ4rkr4EAr9M+lEYQHsgAa9
         Ae5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+c71rM5RvP2W/pJGctk6axYnIiK0IPFp+bimtYcxnINhmFLlzwDXMFAh1aaV983qJCNh4I7FqSJr8@vger.kernel.org, AJvYcCUluKuFUuUMH5EX7Tz62tPhzzB9+EyMREVK1tkcrDkWPRUNj+N0xsUjk742f1aleC5mHUulPECgEZoP@vger.kernel.org, AJvYcCUxfOlJZWmlUhuD5Is2kO/zjHh842aFYaxrZcr+mchJ7qqR3ewcmQcWOReDjy2+sq9Ocgow3gBsJL93@vger.kernel.org, AJvYcCVpPwpAncVDar78EViUrHsT36kCUrMCE2UsIe0QyxOWLq3uB9J5bHLxZUaxyFPID3Qvx6yH7O7wD8koRZio@vger.kernel.org, AJvYcCXaDDQk0P0LJUFcbvxZaL1bkSOrvARC4bzQAr/uokEslUG+PWAf+4AXSy8qaTu3yC3sTCkiI/p7LRekxKI1Z2fkYKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtTYr1l4QiwkthSFcurmj0PYbPwdpFKIRyzv/Y7Eh2llhWvDp
	6YbA+dC8VD4ZKcf5kJ7qUrnXfjv9jcnsL2cSv936Kc49lwAOZUoEPpwvIDvf
X-Google-Smtp-Source: AGHT+IFrm/zOqEfnuzkypReNrsnt9tcpSHCmbAaV9smH5Qz/Mis/RZGuPK4g5EmS6mGU4fyWKRvo3w==
X-Received: by 2002:a05:6902:1609:b0:e29:6b8:af2 with SMTP id 3f1490d57ef6-e2906b80e18mr3622607276.55.1728554940782;
        Thu, 10 Oct 2024 03:09:00 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ee18b5csm238374276.37.2024.10.10.03.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 03:09:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2346f164cso7099017b3.3;
        Thu, 10 Oct 2024 03:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUnqcLRpIrCBfJrreWpL/4xbj8Q3GPIdMYNzl0t5UzEu+Ei70bLqZwnYIzcqyPCIADN9OY8UJWRtUqYoxuAkbXvVc=@vger.kernel.org, AJvYcCUdWeUYo3HZQet2Anju9vF/OkjEenDucXALmajBe4Jwwtczcl0VA2L93CYBlKEZnG5N8lOEthZdg2S7@vger.kernel.org, AJvYcCVAR4bGPLhz2TVpOqvOxdk+ehA2QFIpaU7TUPCEppt9D/RgPqGz4WTk9zJMpuDpx/9VxzfV8cZpZ2a4@vger.kernel.org, AJvYcCVSGM6rZc2Ez4C20DuXc9ZsKBT+czbugrq0ozUy/AN8hf/f53kiwDq5AbjE6mXlSHPHmKu5NmmqN1pt@vger.kernel.org, AJvYcCXw1y28P1Mr7MZZ0bq2VNOGmaVr6IufruyPk+V0CdZWOnccgE2Tr4QTg+aw8KiB/rdxMqgeac9tqhEXgsD/@vger.kernel.org
X-Received: by 2002:a05:690c:4e89:b0:6e3:17b4:aeee with SMTP id
 00721157ae682-6e322491428mr39513197b3.43.1728554940009; Thu, 10 Oct 2024
 03:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 12:08:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqWdFmLAgXmieBjFgj8Rz1cJqVbdFDn0Ep76UawqsU2Q@mail.gmail.com>
Message-ID: <CAMuHMdVqWdFmLAgXmieBjFgj8Rz1cJqVbdFDn0Ep76UawqsU2Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B. Add
> documentation for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - moved the file to clock dt bindings directory as it is the
>   only functionality supported at the moment; the other functionalities
>   (tamper detector, SRAM) are offered though register spreaded
>   though the address space of the VBATTB IP and not actually
>   individual devices; the other functionalities are not
>   planned to be supported soon and if they will be I think they
>   fit better on auxiliary bus than MFD

The battery-backed-up SRAM could be exported through the
NVMEM framework. I am not sure it offers some way to export the tamper
flag (to indicate it's erased, i.e. empty).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

