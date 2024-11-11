Return-Path: <linux-rtc+bounces-2490-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A884B9C3AD6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 10:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6E9280EC6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F3A16EBED;
	Mon, 11 Nov 2024 09:27:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF91684B4;
	Mon, 11 Nov 2024 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317263; cv=none; b=nfXwCg3ds6t9D7YRRXkbn3sYgBEpq643dcTLiVeSkG7IY1ImFPq2Roac6MWHXJGr7/oeD6CpvgDGMrto259xyu9/EPT8HUEnICQDXkBaj2el9bt/re2doFJKwnan4fZlapiPwn0WUqb633irMC1QQReNaSCXqTth1bmuqH/1d7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317263; c=relaxed/simple;
	bh=/EYlPQZYbG0qx2DDHeUItmP9wnSlVmM8158e/7RMOxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0nVooLTdxLLFQQYN44zkeMaVJzXiIs/QQpKYdLTlinSV0MaGeRA2v3Cwj2ebuwLF4W/hImi9yrlvd4hmAUjrFeXIZiZBQLZxzvznF/fUGBA/sqRxOADhytRrlbOUFqaIWs4PXpe3F87Tc8z6GdidxGzXqMnF+gZDTHVq+1i5OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so3892991276.0;
        Mon, 11 Nov 2024 01:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317258; x=1731922058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEEZs1hubftFpA2mQvUEi2H6qdFebKUYB14kCvXL5QE=;
        b=UwqhWBreg+aQgja2X2Bg7/r2ueT0QqANOYWZC3bk6NofBWSSlX1TPrOr7OuZm2XBsX
         EOfNkPE86iY7wrSt1Kr5KCOaEWJodMCe+q5tW8OIdZ9YPwl9w3iMlPLqVItk63M4SB/E
         w0u7CzlUqg2QRdfAac8vK1OFx9agHqi7IZxSxz0WSSz3QfDXMylJXo2ZGgUCtKghrfB4
         HrGonfr9v7h6fz0PpzSEAztXulmpejJJYDQBZnmwaeHmYdbWhZtIJHIRtPgwJgWauWD+
         7PdZPT7r4E/RDPxsDDulut8DjKHSFj4GsGk02nUzw+3IA9WssyJoUBa/dUgCW1tHiN+I
         rDEw==
X-Forwarded-Encrypted: i=1; AJvYcCV9+qH/2iCkO0TQMYUOjpCtq36EdIby+HAh5CvWrwjMuTNH01LADg6CGkv/C74lRYZJvsngJHz0ouDr@vger.kernel.org, AJvYcCVgVnG7T7k0QAhdngex7PLwxGTDb8/GqtIk8o9wrFFraXr6G+5e4paTVHz0dLnSWl+dh7orowOxV8yTaJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWOjHcUe6a0WBStJ/UMt3iimRCT1tV3WcoWJgjxxLoG4C2z6s
	qgqx8prFg1bs9GU2EbLEJSPWli44pWRn7cdoK3tfo7lES/+sYmQtWixHfnLb
X-Google-Smtp-Source: AGHT+IH8Xb8oV4z+9z/V6IKXhrP7lfSrWxIVE+1/JLcPQln2a25uhQ5qxiVvUcJZ0NrJisZn5P0fwQ==
X-Received: by 2002:a05:6902:c0d:b0:e30:cc34:af19 with SMTP id 3f1490d57ef6-e337f8d8ecdmr8994268276.44.1731317258549;
        Mon, 11 Nov 2024 01:27:38 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ee1556asm2161014276.3.2024.11.11.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:27:37 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so3892962276.0;
        Mon, 11 Nov 2024 01:27:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHYQgz9BqYMr19/5pCzY1TJ1m4FAQyN6trGLjnk3tyRq1cdPxdfSpzRqgqv73Ovu8cLQskfnV56Wk5Yx0=@vger.kernel.org, AJvYcCXzpCKppAqrEDruxsYK2JXB0lJfutOTX7ADs+XuWIM2vKOo+CqLUbJdykLEOT/JMXhlbr2bFTP2dLw0@vger.kernel.org
X-Received: by 2002:a05:690c:f93:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6eadddbd0d5mr111198207b3.23.1731317257635; Mon, 11 Nov 2024
 01:27:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 10:27:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU45SmMZ+OGn9yS9rrFThESAsFu5Leb_kNVueffM3o_4A@mail.gmail.com>
Message-ID: <CAMuHMdU45SmMZ+OGn9yS9rrFThESAsFu5Leb_kNVueffM3o_4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Tue, Oct 8, 2024 at 10:55=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.

> --- a/arch/m68k/configs/multi_defconfig
> +++ b/arch/m68k/configs/multi_defconfig
> @@ -506,6 +506,7 @@ CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_MSM6242=3Dm
>  CONFIG_RTC_DRV_RP5C01=3Dm
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dm
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme=
147_defconfig
> index 2248db426081..4a0928b3b842 100644
> --- a/arch/m68k/configs/mvme147_defconfig
> +++ b/arch/m68k/configs/mvme147_defconfig
> @@ -392,6 +392,7 @@ CONFIG_UHID=3Dm
>  CONFIG_RTC_CLASS=3Dy
>  # CONFIG_RTC_NVMEM is not set
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dy
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme=
16x_defconfig
> index 2975b66521f6..481fb2810f1e 100644
> --- a/arch/m68k/configs/mvme16x_defconfig
> +++ b/arch/m68k/configs/mvme16x_defconfig
> @@ -393,6 +393,7 @@ CONFIG_UHID=3Dm
>  CONFIG_RTC_CLASS=3Dy
>  # CONFIG_RTC_NVMEM is not set
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dy
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set

All of the above don't seem to be inserted at the right location?

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

