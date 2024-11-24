Return-Path: <linux-rtc+bounces-2616-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D59D6D47
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Nov 2024 10:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA68281240
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Nov 2024 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335A8158DC4;
	Sun, 24 Nov 2024 09:42:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715B8837;
	Sun, 24 Nov 2024 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732441365; cv=none; b=pKrbMxDKHu2Yp2zTFRInPKr7dxNn1RXxYvWcDkS7JASdgJgFsiom7/oGz+uvBcLwaOwAF5TKNSAkn+lf7/Fe9A4onatkbG618syEA5P40yfMGe0kGcXdVB6Ibx4ZCcjUJKvn+8GXbWHJQmuENGdK3mmTAIDRvak59yaDXROMSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732441365; c=relaxed/simple;
	bh=czEKvwebo6N0ybZpopI8XXJ6AJO1Z1m1j7/C9FhcEzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTmvUplcBlwR2rM5m2Kt2mpftah5Mi1YDfpHMD3xdzRHNi89JAZmCLz6URVYAPV8X/+9id0jfRvzoB6lncUYY4X3C0Tn6E9jZFPFRgzcnuF78NYGL+Y6apw39XHhFU48WqwblnCLPmyitVqWRHQfOJ5YX9CJ11OEhGW77FRhVT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3839177651so2842809276.3;
        Sun, 24 Nov 2024 01:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732441361; x=1733046161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aw291P4QQp2xc52w4erCu+NMtXgYhXO+meOEucMjW4Q=;
        b=AsD+kyvsKX/uoTX1RIMbBi5x+32o4E9IEKYY+NFp0AZ3epBckdwhV9O7tvGtk4lyjs
         GxXi81KazRbZYq1K9KoKXdvXJeTuPPOB4lMVD4U3vJOpj74CNyrk50zloyC32YTbmtal
         iPtkzbKZSmunj6VXyOFjt99A4Ov3P4dFH4l+0Mryot8C7iGMP/18iOjEeHUNi44PZdZr
         yo5w65V6Jf69uklrBVxAVFaYqhDg7vwW4kGNbz+27Vtt1r3YSf7G48HfRFiPGDcafj/Q
         JvaWCAumaz8wUn+L/L8VT0p9W9yxIVQduZA/t61upws4SMNsfDxAN+H84GYEKeT3D5mI
         5Rqg==
X-Forwarded-Encrypted: i=1; AJvYcCVzDcz97ZXg1ceg5sy0mb4KVQs8qPU88K6fhCJurO/PipFfCZYt+AM9LCFfWf8rCdRx/hwnBa4ywTTS@vger.kernel.org, AJvYcCXqA3IIdIWfHRjEBBR9BwYEPk9WzIy/myHu51HpZwC+96ny6hdg6IXil2Hd/uudpKTTy6BPOc3N+v46w9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmAFqmzF7XSmg1fwj452ChlV0AUbRlZn4CkEJgeKkQymBiNRw
	rzxvIVAkaksciW+vPzw0El1S1iAy0MW93pQKaeimocd3AdZuHUXps0+PvUzH
X-Gm-Gg: ASbGncvMLyqjELJkI7qsmiLiIY9b1rKZll9HFhFgK7IeGQJGY3K21vO0I0f41RfO7S9
	tAgaP4KBRW4oNJGcOlylsGaOqsGnj9VvP27vMMM0D2rMQQEAjm/7oZ0uyi/ftQBQeme99fAhMut
	bIjTSidjO6mTsVCYp9XMQwOheufodOq/sU8szNdx+tNsEBGLjkAFj1G+F+RVLcO2vYbp+7z+1Mq
	Ron/pUL9yDJbl3Wxm4I5AUs4WK9/xiqMGw48qdfWjIV64H6hCMLR48NWd4V1eaLIh+6ABePgGXr
	3helYQD6UnOgXPXG
X-Google-Smtp-Source: AGHT+IFRMucaFN1U8eS45w73KSswxy1I117v3MGPbfdKq/FJMv1fTcUhdsIA7vUTK6rsW6RfPoJMQQ==
X-Received: by 2002:a05:6902:1028:b0:e38:f30e:9b52 with SMTP id 3f1490d57ef6-e38f8b0aaf9mr5469356276.4.1732441361065;
        Sun, 24 Nov 2024 01:42:41 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f60897d0sm1675544276.33.2024.11.24.01.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 01:42:40 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea339a41f1so30758077b3.2;
        Sun, 24 Nov 2024 01:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXG3hcUkyzSgSv6AXqUJk63DawA7wPmYvmWIySNwdYl0hNFnJZU7JCQX5bg2/8nPE97wGz0WCJRkMH0isA=@vger.kernel.org, AJvYcCXoXJOqqcep27j7/9Q+N23VYpcncY1A2zc3xtTErGEWdAG/Vr1L4/fONF3CpCHecm8ggIUzpRuz3P9I@vger.kernel.org
X-Received: by 2002:a05:690c:881:b0:6ee:b38c:b6e1 with SMTP id
 00721157ae682-6eee089e833mr98777127b3.14.1732441359840; Sun, 24 Nov 2024
 01:42:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
 <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com> <20241122230329128df024@mail.local>
In-Reply-To: <20241122230329128df024@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 24 Nov 2024 10:42:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjTgssYR0RAsxpejRcUnPb7biT0kuq+Xc5T2TcPsahiw@mail.gmail.com>
Message-ID: <CAMuHMdVjTgssYR0RAsxpejRcUnPb7biT0kuq+Xc5T2TcPsahiw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Sat, Nov 23, 2024 at 12:03=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 22/11/2024 15:44:33+0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 12, 2024 at 11:51=E2=80=AFPM Finn Thain <fthain@linux-m68k.=
org> wrote:
> > > Both mvme147 and mvme16x platforms have their own RTC driver
> > > implementations that duplicate functionality provided by the rtc-m48t=
59
> > > driver. Adopt the rtc-m48t59 driver and remove the other ones.
> > >
> > > Tested-by: Daniel Palmer <daniel@0x0f.com>
> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > This patch depends upon the m48t59 driver changes in the preceding pa=
tch.
> > >
> > > Changed since v1:
> > >  - Initialize yy_offset in struct m48t59_plat_data.
> > >
> > > Changed Since v3:
> > >  - Re-ordered defconfig symbols.
> > >  - Added reviewed-by tag from arch maintainer.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > so it still can make it into v6.13-rc1 via RTC?
>
> It is now applied, it is going to conflict with your tree as it didn't
> cleanly apply. I don't think this is going to cause issues but I'll let
> it sit in linux-next for a few days before sending to Linus.

Thanks! It indeed conflicts with what I sent to Linus, and thus with
Linus' current tree, due to nearby changes. If you think the conflict
is too serious, feel free to drop the commit, and I'll pick it up
for v6.14-rc1.

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

