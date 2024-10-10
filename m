Return-Path: <linux-rtc+bounces-2152-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87C998B8D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F701C267D8
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5BF1CC17A;
	Thu, 10 Oct 2024 15:28:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186BB1C57BA;
	Thu, 10 Oct 2024 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574107; cv=none; b=Eky2Ilkb9f8F4QGI1CI74IWO/JWj83rBYPe6A4q8V9Dkusm9bzevrmDoxDuefXLQr/KJgB2gVod7xCjsHZ8eKG9qa3l23eGk2T/eEiuOru4NLt8VE7ASNpkN6XD+Hsbf1XVz0rkRHoY66nEG9zt0Rrqa1bwy/Tqk5G9umxM9/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574107; c=relaxed/simple;
	bh=ewPr7Nugz+b5xJtHDibyLNTiQ+4VHImYxBCZi3pWaYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neboNcP9GP/jcVnmQB7ofbcI0PvRg1HdFx1g43T77lkmFMMZLEnXrHd68fe56YiE8e2ZFuN0006uzo2u81BKggrCSsWKhHZeGKZ5n4kFtSpKiwBXMB7kGEKcdqcMnaLAGcpjzhZvhldrR9iku7K9VTpd/x7RpK02A9BioLmnq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e4244413so12611677b3.3;
        Thu, 10 Oct 2024 08:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574104; x=1729178904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+FUiD0xVp5OOvt65U+GUfX5IiAyky/cSIiHVZpRQ6w=;
        b=qYJlL9AAEcZaD9OV4xTFb+pDV875QjBOnWRXaIrHyuOpUOOcwRiUT4yT8rJza8KTac
         u1JW+5gwTIoK5MOOruc/x3Oyo8Fer1ziEkuK8Q0RRalF0nAvO/EZoo6lXU122F2vfoA8
         A4ve3LJ+9u++NoLwPpvEibeKZJfouJZ/sxG8FrrzgdW1FZvAxgSB2LhGL5AQUOAbAZUJ
         zEEVrZbwBwl0m09q9EIr6UXpke9ibEnKJ144I5xs2q2qF7sKSJ1JRrna8+d5QSRV3Def
         Sr+3k8t8hZWG3PbZxMiy//t3MMTjcMXtCVHzFn5S0Wv2+0IWY2cbn05oDk/OXrJ5CVxJ
         yJGg==
X-Forwarded-Encrypted: i=1; AJvYcCUrIf4dZzqBlzprhJI4NklbMiLjdhgkIs301pfeoIGlYLRmjHtuYsSIkGQ4Y6o1t5hxut3fizn9xcZo@vger.kernel.org, AJvYcCVQq3GamVG4vz8ZBJR5dIVNjBfo5WwItlty+N7FG6C3w72X2OT5tZhvdoGfpAvL6mqAORQCJEcCzLBC080/@vger.kernel.org, AJvYcCVm7mYsXROJ7ddyshXDXVaV7Qyp3GQ3z6IGYC0ytDwZ5IWlvmVfV4NeAkG+nlRxeDHEza7XCeAjWSB1RNmUqsFF+u4=@vger.kernel.org, AJvYcCWO14C9y19y8Jio/810W6ZBacNHN/NrjH1GA8/bt09DyzR84Mngu4oGodwWwTVMXVomxDhBGKEpYJBM@vger.kernel.org, AJvYcCXJf00Fq7qcYGFhAt8zbNbq8xCPjmKr4s1FDzkgWhbQXR6VVLAScnWqo2Oe/2/UmvqsEMmKDs0mAcLz@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSbaot0YWRcBSCBP7fxjoDBehLZZRgzqxuVqjWXSoT6ftfpRs
	pePLYaC9EvAYH6i35fUdky5LtcRt4nfSw5iPzNn36eY7ym+0x9KoWXuVXPzn
X-Google-Smtp-Source: AGHT+IGITm7nx8mYfQsDpCCfWzk27Bvg21SGubs6Yhpq3yhBQaT6KbgBM+iHPMzcsgT8sp5evMViOg==
X-Received: by 2002:a05:690c:6706:b0:6e2:1bba:ed4c with SMTP id 00721157ae682-6e3221430b3mr65370927b3.17.1728574103708;
        Thu, 10 Oct 2024 08:28:23 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cb383dsm2425777b3.139.2024.10.10.08.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:28:23 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2d36343caso9085277b3.2;
        Thu, 10 Oct 2024 08:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8JhDg9UH3nHc8W4ShRdKaonhJ5hI7QOnQjkogsKTaw1cVx5Z+q1/We82BQH0FfRnk/g6t9cqQU2Ep@vger.kernel.org, AJvYcCUFWo3wkk3SAYDSohe4GuGLEOXSBynHwgwq07XHgp3cwFiny1QsrxIMVedTB55QzaiHbB40UZcVpY98@vger.kernel.org, AJvYcCVMghTZa/f5IVf0i2+YIfHE2v96hlb3QRqTgM1carW5YbYtHkYeGwfNMWmdn6BeqjZlJJ2c75KhcIDNfAM9DYVg9SQ=@vger.kernel.org, AJvYcCWjIjHMG1a9P2w7I/jJFD74fIrKgLpcTbC7c/QKaEjearCdWEJbJM7Ft52QumokTJGlfUg62QLJNqrLjUFC@vger.kernel.org, AJvYcCXcrEkUEftkQBIb/PuZK3o/+CgYwdFzuTgoU2kkkhozTe5Jralo8E9hyilIxPodQgSZdjxY5dUBOCyH@vger.kernel.org
X-Received: by 2002:a05:690c:86:b0:6e3:2608:d5af with SMTP id
 00721157ae682-6e32608d759mr55680917b3.26.1728574103360; Thu, 10 Oct 2024
 08:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:28:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWybEZHeQM526=xuvgs3tpDz96HwY69YRcVfc8pM48s+g@mail.gmail.com>
Message-ID: <CAMuHMdWybEZHeQM526=xuvgs3tpDz96HwY69YRcVfc8pM48s+g@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
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

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the VBATTB controller. It provides the clock for RTC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - updated patch description
> - dropped vbattclk
> - added renesas,vbattb-load-nanofarads on vbattb
> - moved vbattb before vbattb_xtal

With assigned-clock* resolved
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

