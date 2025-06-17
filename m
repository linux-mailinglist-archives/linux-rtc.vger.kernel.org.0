Return-Path: <linux-rtc+bounces-4305-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A0ADCF79
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Jun 2025 16:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CAFC7A903B
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Jun 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E032E54BB;
	Tue, 17 Jun 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWzhRLLy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CFD2EF647;
	Tue, 17 Jun 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169853; cv=none; b=mR4L+PySjQf1AMIlKjFcLHoOQqiAfc+j5ywffipXBxfrxLbWUdBBbnewwVl/onwV6aL1TDqrkit+3vjFcJP7Cws+49exCqGsoRy3+DaX0lUmONJT4HJ59s1Yood0GZDAbsPqgVWexWRPAeMe3p53WZvt4UQ5OqUZtGb82hOXmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169853; c=relaxed/simple;
	bh=O1SMjbdLTEYQH6SxZhVBwpj87vYNYm71xhJpBNm0H3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxPNTb+ZUVyLXTkOS0sd91p3dx9KLvo23K5ANo0xqtuotmrA+8Cl9vwJBa2m35TqPiedc3+VvhZzPzDqU5qSWhHiCievZVqb35C3uMtoZQ0rS8WIvUol9OfMJWSG68cjyB5N8Wks22P4GtsTwfdFdE9jM9Mdz2d1QjpnBOYWWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWzhRLLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E489AC4CEF1;
	Tue, 17 Jun 2025 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750169852;
	bh=O1SMjbdLTEYQH6SxZhVBwpj87vYNYm71xhJpBNm0H3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TWzhRLLyHIqF77Jcd6LJ0N1aAlIaTGB78EmjM9GCqiXwCkZPxA1cks3jddIRLCT/S
	 0eaXzO+WNEndYjfCnfPCCWVuzqjCEfTHfD1Xa0PvRXinmGU8dy5yMfaMzMcrjZJPTd
	 Nrr0MkdBn8tEoLXP8JsCi6m+CgFOZZxelMcEc/cn3Hu2dod1g96zyWCNXJ1UdkiCOf
	 Eh7VfdEb9x5rKa4/uYzWsysZ3rgW+LnLY17Cq1T4o5jZoM1C53NDMHqL7wXbO7sAWZ
	 9vuBnfHFMKm3NCxjj/gQ1bbGD+QaU6ZSvmjyYl1XOxp2JwcofIlS6PklglPwVY1dpO
	 HhHLb4p1C9eSw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so10302369a12.3;
        Tue, 17 Jun 2025 07:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/gBbVGOMyoe/Soykryunr+tlxI+UWXZQS0DxyMNu8cp3XSOZHWQxtVKkjjXB7Z3IGIMxdilcUk+iM@vger.kernel.org, AJvYcCWpqcASZWcLMDRRem4+nbGM00vn6LYRuUqV4EdNBdnSAC+7OI98Mv5Va0HFAIr4nt6ehplmp8QmCYXvssw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Wo0xGN48dyV1wCUJoE1d47jInIrDOvdHSX0lTVX7Ub2FHdVx
	swBS2yh2coFNALT6X/pIIb38bcTlyR7yXOzzBAdk+gT8033pvF35bN+cBqLOwz11Cm9SYpVP0/m
	YHeKvkD0QD+HpHXNKBgBJEUoEcVonNH8=
X-Google-Smtp-Source: AGHT+IHgM6DSYSnociWdKPh7LbnjGpoM5pNWIFFL0GpBYG0bk6mU02eUU4uvhYpAG9J3aL+U/TCSMNPS4WId/+qkO7c=
X-Received: by 2002:a05:6402:5114:b0:607:1053:504e with SMTP id
 4fb4d7f45d1cf-608d088ef85mr11567270a12.2.1750169851297; Tue, 17 Jun 2025
 07:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613061747.4117470-1-wangming01@loongson.cn>
In-Reply-To: <20250613061747.4117470-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 17 Jun 2025 22:17:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Kq0Dnyt_w7iN_cB6ai8f_8V5Sot7m7zTC+UxeF15pxg@mail.gmail.com>
X-Gm-Features: AX0GCFtWwpzNtlQqsGU-3pN2PsXxwgLGy48FwPv2XlxAdHwKAb9Id_Skxxtkfm0
Message-ID: <CAAhV-H5Kq0Dnyt_w7iN_cB6ai8f_8V5Sot7m7zTC+UxeF15pxg@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: efi: Defer driver initialization to prioritize
 more capable RTCs
To: Ming Wang <wangming01@loongson.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, chenhuacai@loongson.cn, 
	gaojuxin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:18=E2=80=AFPM Ming Wang <wangming01@loongson.cn> =
wrote:
>
> The EFI GetWakeupTime call, used by efi_read_alarm() to fetch RTC
> wakeup alarm information, is specified to return EFI_UNSUPPORTED on
> EFI firmware v1.10 and later. This effectively means that on most
> modern systems, the efi-rtc driver cannot provide working RTC alarm
> functionality.
>
> If efi-rtc registers early during boot, it might become the primary
> RTC device (e.g., /dev/rtc0). This can lead to a situation where the
> system appears to have an RTC, but userspace utilities cannot set or
> get RTC alarms, even if other RTC hardware (like rtc-cmos, which
> typically supports alarms) is present but registers later.
>
> To address this, change the efi-rtc driver initialization from
> module_init() to late_initcall(). By deferring its initialization,
> we give other, potentially more capable RTC drivers (such as rtc-cmos)
> a better chance to register first and become the primary RTC.
>
> This change increases the likelihood that systems with multiple RTC
> sources will use the one with the most complete feature set (including
> alarms) as the primary RTC. The efi-rtc driver can still serve as a
> time source or a fallback RTC if no other RTC is available or preferred.
This makes sense because platform-specific RTCs usually have richer
features (so preferable) than EFI-RTC, and some test programs (such as
LTP) only operate on /dev/rtc0.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
> Changes in v2:
> - Fixed a section mismatch warning reported by the kernel test robot.
>   The efi_rtc_probe function was previously marked __init, which
>   caused a conflict when efi_rtc_driver (in .data) directly
>   referenced it after its initialization was deferred. Removed the
>   __init attribute from efi_rtc_probe to resolve this.
> ---
>  drivers/rtc/rtc-efi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> index fa8bf82df948..c941f52ea3fe 100644
> --- a/drivers/rtc/rtc-efi.c
> +++ b/drivers/rtc/rtc-efi.c
> @@ -254,7 +254,7 @@ static const struct rtc_class_ops efi_rtc_ops =3D {
>         .proc           =3D efi_procfs,
>  };
>
> -static int __init efi_rtc_probe(struct platform_device *dev)
> +static int efi_rtc_probe(struct platform_device *dev)
>  {
>         struct rtc_device *rtc;
>         efi_time_t eft;
> @@ -286,9 +286,20 @@ static struct platform_driver efi_rtc_driver =3D {
>         .driver =3D {
>                 .name =3D "rtc-efi",
>         },
> +       .probe =3D efi_rtc_probe,
>  };
>
> -module_platform_driver_probe(efi_rtc_driver, efi_rtc_probe);
> +static int __init efi_rtc_driver_init(void)
> +{
> +       return platform_driver_register(&efi_rtc_driver);
> +}
> +late_initcall(efi_rtc_driver_init);
> +
> +static void __exit efi_rtc_driver_exit(void)
> +{
> +       platform_driver_unregister(&efi_rtc_driver);
> +}
> +module_exit(efi_rtc_driver_exit);
>
>  MODULE_AUTHOR("dann frazier <dannf@dannf.org>");
>  MODULE_LICENSE("GPL");
> --
> 2.43.0
>

