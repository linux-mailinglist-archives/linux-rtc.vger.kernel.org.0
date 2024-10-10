Return-Path: <linux-rtc+bounces-2155-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CA998BA1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A8572896B8
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD51CCB26;
	Thu, 10 Oct 2024 15:30:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB881441D;
	Thu, 10 Oct 2024 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574238; cv=none; b=CDdyNqtfF6MSttwVJhNvMJGtLX6XMxisZfOv2xs+dWb3C4JQDMbpiZVk6/FLk8YW1ehBaDZqhxrtTdmIoXpsRpiPbU/KwE2cm++ZnFVkve2LSIkH37vQU1y/qZiylu4p43TwgoAN362EaGZTMl5xMeYMXN7Nxnp2SROKGnn4HAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574238; c=relaxed/simple;
	bh=7F15DEZ+iv156zRTNTt8JfDx03l4MNXXqM/1CMSRDVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKcLgiGBGJ015iGVhU6PD4Js1ef7Al+uFLCytI5+T9Wm8aye8Z5nHFYPWOoCce38126Yr6afFMzfAJyMTG4aNOZkArxo5QlE4OMOkZRz8fD4fjyDvP7uzwidDFU0yrEkv2FaIUwIhnYN3giKP/svKWGW+guhgufTaengmraPPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e427b07dso8634647b3.1;
        Thu, 10 Oct 2024 08:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574234; x=1729179034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVCxjXJKRC5il2Xap2UVREQcGWuyfIQxKnP1aTdayOA=;
        b=aDsQCJbIC11mOrUUIX60hN6ZXcD5XURfAdEJmfcpQuf4lrUUd3yEcUOaiGiJzqsfiU
         JaRZjs/RGHWtHyeka+b1MalwP6nY0iZhzE4YQkReyDpbF5QDfjKOw/nR60mGaVEEHwU4
         B/roCGcHXOd723ZWBaJdMnwNKLRKnVyK188PvXf8N2SqeSbnSZYEfVnyV2NB47ZXM5Qc
         cYQb95i3IrtizObs40vJgfj2fc4a9dulOBBrksrXmcjlAV5lMrQFPseyW7KHjGe/pJQU
         M1KOq20RSMw3MuYeK7KCOgH7Y9HMGOXZOALQdvbDHwNc7DfxKRzWuRAZmwWleW1DuHdg
         NzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9mn2shnjlX3pNHLtc/OWEAMSoOrk6w8/+zSXtNY64nmhCmHiOLNb3nD7KB/66tKg7FGDdhAWgZGnh@vger.kernel.org, AJvYcCWOCFtnbgC/eqG1N04NCi9VFeJi4fr/OHqwTUQJPKGSvv7C9lD3Y4pWg9nR2nhcZHo9L1StAsLQ7Bzn@vger.kernel.org, AJvYcCWuZI340vZSBNlhxplGi+y2VG4Bq/iJ1Om7CXX3OneH3tDcvQ9uSrcxrksCy2BXT/UE67gKPeSdNmd1FuWyP9F2FXI=@vger.kernel.org, AJvYcCXJD+jK9iawKlEKAbON9fyejoUyE1aGMujY4SGZ0oOcm8OuuSsHEfmyE73XVfQzYw0JZmmwko4AMJ5V@vger.kernel.org, AJvYcCXOMw7CoauwXVrWPlJ5iuhL92BQYPCQiU7bSqrFtQ+x876vaTrPTWjmOX2OR/D/UiwNAscsPBRSKn+zTcva@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcw5KHIHd7gprtbzzrtrIMrhzd7/s4cqSa8/91tPuhCyDcHa+
	z+M6ANbvCB5K50mMWcVTYTe67VHTqBq7DnainQtV/ojv7ThqTKTB56ULuMch
X-Google-Smtp-Source: AGHT+IH8upw16K9s5HbQ7mK6vihO2S9n3CZoy9NqU07UFEFYkOXf3vWQUuZfKjsR2Rb4Sz1Mv4Riag==
X-Received: by 2002:a05:690c:112:b0:6e3:32bf:b85f with SMTP id 00721157ae682-6e332bfcf71mr18263497b3.25.1728574233465;
        Thu, 10 Oct 2024 08:30:33 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cb3b4csm2377417b3.140.2024.10.10.08.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:30:32 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e427b07dso8634177b3.1;
        Thu, 10 Oct 2024 08:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKSAE2nYr24AEOeURAQpq0kgA/sxF23PDrCQlib+aue0YonAFQiWroKkkYdDB2e7DSdud/R2TVDjR7@vger.kernel.org, AJvYcCUcXhxGkKea5OhbWkASyiptLyqP3HZ9VQHxvVOXn0SjRAtioGL1ZnSp4ZkM54SCDwlkAgwfZcT3pcKB@vger.kernel.org, AJvYcCUowDQy+5A+cD/rWw6asYTZ+n2yAQ5iHXX5q1vPJhamxAq/awb1Zc1eybAcBM/e5TEg+OcU18C25eSF@vger.kernel.org, AJvYcCWQZGTBH12pX1XI8wuqXFzZj/XHz4YHblzNGHLNCUFdRM+kSrQF0PTqAciMpDq0M5cHimwGbtQGo5smLQk98JTeUuw=@vger.kernel.org, AJvYcCX6o6a+JtXxUg8oRxpeE9kczEgV4zlbmi4lviFQ5Cnq1RF9UJC/Pb/q0oRi8vV3552msSEPiahfBVUGU91M@vger.kernel.org
X-Received: by 2002:a05:690c:dc2:b0:6e3:1a7b:9c9b with SMTP id
 00721157ae682-6e32210de3fmr60284057b3.3.1728574232563; Thu, 10 Oct 2024
 08:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:30:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt5jNf-AjZ_-4PAMP+WLzZZhgqx=U3G6LkjEy59X5KDQ@mail.gmail.com>
Message-ID: <CAMuHMdVt5jNf-AjZ_-4PAMP+WLzZZhgqx=U3G6LkjEy59X5KDQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] arm64: defconfig: Enable Renesas RTCA-3 flag
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
> Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none

May be combined with [11/12].

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

