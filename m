Return-Path: <linux-rtc+bounces-2380-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8869B682C
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 16:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45BB01F22A62
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 15:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E37213EDC;
	Wed, 30 Oct 2024 15:43:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF61F4737;
	Wed, 30 Oct 2024 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303011; cv=none; b=oNIDbD/oqNatqMxYd+Ey32bHaoJdl4uBO10Zf8mDgoUeqhxWWpP7W/cpu/67IL6z0syVzwX25LyDd8+Rxmrv2wO4BHtVL8S4ErST4VIgip54dOGaf5DsNM/I6LMyOQMfwd5+kW4AkisFxdy7B1i5UE+zrBgMj4Z4+BLiCErKO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303011; c=relaxed/simple;
	bh=HVlUAT9rnpvVzaRzwivwZt/uHtsRrjjj6w5u177GnHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A42YS26hPxRUByBLos7MGi0xHCUvH/bgygOnAGBNFErk7rgvpZUnkqteoHqymj+3rQdfhFPhzzsPLRe+kG4CufI1kXYBkWz8Np9HfpE3F1LXkauiVMLoeuNlCE6qlEwrJ/Wu1bFeOoVkf5rPge8oF2phQabhIWHwDEvIr9vaIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e3b7b3e9acso64481147b3.1;
        Wed, 30 Oct 2024 08:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303007; x=1730907807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgfoTzR+2hIhhje2BGTwOg4t17NZbptniFGPOQ3kcZU=;
        b=EYBOWVGflkvdJf0FZFfAOYO888bAgDvLQQyvH5+trojbB3sHJN7OnRXY4kGuPvfUcl
         pYtuF62jo2g7ygzTXw0LoEYJXCLJrqTuPzDjM1Hbiv+d+6uTY3/7j5K5W8f15PESMwi3
         vfaeAORBtJ3QFiDs/HonvYQT9p1u2jCpPhAZ3DWOjO8L0c+S1ujK8XSA86iITf/HcrOU
         9rMnD8EiaX7xg8Ur9w7IBfC7kcslhPSEDu/fkcdN//DSrVXvIkjKMHE1MVVedCcyjMOq
         UzsauTFxh8JbDFWtn+eMruTZqY+230jtPwXTUA4oPbfLeEkn0WmcCktDQVdaOjdsT7Lq
         eTHw==
X-Forwarded-Encrypted: i=1; AJvYcCULBK+HiO4KVIAAFEG50woYQW/nvmRimiwDPIUDTnDDm4N/rS5YHp+yL9ukbrJZCT82w7DkiLL8Ze3J@vger.kernel.org, AJvYcCUW8eV5gk4ezwDAXBVeEi8nGpAHNRGeDx0ssgFQwIMjm5LnQghBa2s/GTUYJ2HM9VJjV5gVxCko4hDYYldM@vger.kernel.org, AJvYcCXQBxuYhTn5Mwxis7NneJyCoEvCSdmpZX2xK1dPKtgHNsUgOgYyj42TBq7CkjJWIQ7clUsIuCMMF3g9@vger.kernel.org, AJvYcCXedsQ5DOt1twgc5YZ8Oix4DJEdlZb5KQHOtncAB5M/FaxuQK6XH1dr66IHTKRtuOTEYqV2hWCTHz35NPHdJvSjhXk=@vger.kernel.org, AJvYcCXvCAAcyj+WBMUFvA8S/p5IcAJ1lTSmmohlTJZ46odlckWJBB2TpUSaW6GAHXvHXs/YeOIqw14DTWqU@vger.kernel.org
X-Gm-Message-State: AOJu0YzkHnGG1YhbfaEN78n1HEEpoL17K2SDvHb/kGNaDPkd3QnIz2JL
	12zor0TXjBp82TO9WfQ8zHEFGf5Ahm/8Q3g5Zdcv4PLYRLVcuUJgn4IPRMft
X-Google-Smtp-Source: AGHT+IHJgmEYSDMJ3lwBDd1ue/JFOnErvkkGSpobqvdiidrfWsthIU294Sut93CQgks/OwCnBuXpcw==
X-Received: by 2002:a05:690c:f06:b0:6e2:ac0a:8926 with SMTP id 00721157ae682-6e9d88b8a54mr167774417b3.9.1730303007025;
        Wed, 30 Oct 2024 08:43:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c193b6sm24525737b3.66.2024.10.30.08.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:43:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3cdbc25a0so75702767b3.2;
        Wed, 30 Oct 2024 08:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVFoGcZifm+CcBCXtXJ3+TXIRONzDdlVul+0BvjnBL4F5zGmfMLQX3zM5+LRuLn9vYOekSQMb+oT+Q@vger.kernel.org, AJvYcCVaZFIsWkENtp3ESxKUpO7PDMe5dn6m3+z/6FwVxPOjTFSEldcoJ5zmw9r+7l2N117EuWD/7XsePuUSsMH9tcTUhSg=@vger.kernel.org, AJvYcCWVMGW9w326ShnuFg+c7ou1e2Lu0npwTcsTsJN1/tBegm/296ggyifTBBP5fRQILYy4b64CchEPfv4r@vger.kernel.org, AJvYcCX0thFWnHqftT24X5qx2jbA9KCDDxYOYVchj2rKknU9pqq4rqvEhpjsF5URX9hPtabfciYW6kfexx6r361G@vger.kernel.org, AJvYcCXbimQzBr/BapkEtkwCGcFzeM1jM1VDRodu/xPEtLH6nwFzTtazX4poKOA5YzGb8A9odW4bPDndHe57@vger.kernel.org
X-Received: by 2002:a05:690c:3388:b0:683:37a8:cd77 with SMTP id
 00721157ae682-6e9d8ab98c6mr169194477b3.29.1730303005903; Wed, 30 Oct 2024
 08:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com> <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:43:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTtCX5CO4y_Z2vcxY39oaHFuzH15md4xsjkz9RR+bByA@mail.gmail.com>
Message-ID: <CAMuHMdUTtCX5CO4y_Z2vcxY39oaHFuzH15md4xsjkz9RR+bByA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
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

On Wed, Oct 30, 2024 at 12:01=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - added back the #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
>   in example section to fix the build error
> - kept the Rb tag from Rob; Rob, please let me know if you consider it
>   otherwise

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

