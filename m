Return-Path: <linux-rtc+bounces-2593-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C12DF9D52D1
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 19:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27762B22FCE
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 18:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C479D1C57AA;
	Thu, 21 Nov 2024 18:52:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4FA19FA93;
	Thu, 21 Nov 2024 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732215159; cv=none; b=BvT0DhEtOePqwfdQ/Ne+wPYYAOLajNCv1c1V/TOwidm2gqi5IKGyzlbDii0pYWSvs1awZHXVLcLCzLWF1WNkjRkbW7uE4M9tsrs2lcSdKHSRboYOOEYIpfkrkk2CjDAv3ae6GCagZ3phxQns4R2HAKm46lJjiDx5omvfcHitaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732215159; c=relaxed/simple;
	bh=oqqondy23S74aGu5BrVkzbnRTmFRm6XLzCNLrVkrraE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4VwwUrLifEkGl1MKFBQpm1fxV/EjcpYmv6APJOorjXHDxKAEpb6RvqW7P1TiOP5rvEdO0wK2cg6T4qptTDWR8MhbroE1gPeIyUwz5YTLQL1ZcCL2O1p3jG1EKbYKnOqJKlDXTmZzCXEQSlaqkFzpDo6+8EvQ54CJ6wQ32di1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ee6a2ae6ecso12213797b3.3;
        Thu, 21 Nov 2024 10:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215156; x=1732819956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiKmU47CtbBGWKBpE0HqbPui0PwogHusuDbrIOQ4p9Y=;
        b=dctb+HZ5+f0qiCPx8mLt+q+RDeLUZFGNkrTiQmH/A6ORJYuP5JCUOmUsCUE8HS9z9P
         86Z3Wqz1cOFFrPwJQuLO4x6B9Tepjg/b1lI7K/YqIw+LaaF91ZknQnd57S4get/oKvjx
         FYSSZ/1Z3fm++YykJ0bnariecBrW5y8122FCCzCvTQHFxsZSM2zlkSyTKHVNjzNhwc9a
         VAY3NHX8T6wWer7P/K772uOBQYJ4YWcqCZhW0YqeS2l+6BlSkFaSnaZQghbuFE3MpRbL
         IMHjvgsB8IgVVC+Nmg/qADWivrQxXSHBhcXdAsVMHrP4KQZDrfZEMAmt3o5dWOKw1sNG
         v1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZVo3k6j5WBUQlb2Fjf8BHks4hxkH2jV8gwNgaUmovmKHjoXqU7tLRkfTR0TTIqVsNMnkMohkmkK9kw==@vger.kernel.org, AJvYcCUicy5pYxdmgYj5RYdS1wNulfCdZRMfogYgKem5FdtbVYbwvLRMU7G8jtdbSKd1Fg55ieyGeHFHlKH1wSI=@vger.kernel.org, AJvYcCWl6YasKK8L0fEv/4QEohWtH51ZXTXAc3TeepNJQ9RJ2k06S2nd1iMyysY6oueT6vBTkyzPWGEA4xyc@vger.kernel.org
X-Gm-Message-State: AOJu0YyylBhEsI5PeWtgyN7iMgDucVV8qDfrWBZJk8XQRm7ReodZxbIa
	umTPr4CKBS2pTncpK9KWbdfgyPk+o8hDNNQ3ofPKiTwPOuQv7nJ8IGFVTBPH
X-Gm-Gg: ASbGncuzWRKD8Dxh/Fv95BSOrwc1r893Bl4sxmpduXAJLwsSQmLub7CusU7k2+i5LlN
	1/VQz8ucVnCCwq3ZS1Q7GQ3mcFtF2QAbQz/J0q/5Myiu/Y6fKJ0ssbff1reTb5znvut9J+q5DnZ
	XZ+kcURSB457gjczKISdWFMO1RrfwxYQ3+2Lj3EBAGLFck5Ffzb5YSZduBI2hBNfEUXTScGeFyp
	6ry6Uf0CLQkLCYeXse+1wbW6yLs/hx62ngsRgzEslypfOdBXF67PdU1p4Ba4g44aNwdDXCuSr0L
	9/OQblxF/bgEx3EE
X-Google-Smtp-Source: AGHT+IGC4f69cVdKB3sdm8qaXsD8Z1umi9orCXutexSe10QVT8gWThmk0thu42uMBHIP8V8Y4y7n1g==
X-Received: by 2002:a05:690c:9b13:b0:6ee:6e71:e6cf with SMTP id 00721157ae682-6eee0a5b66dmr3843167b3.29.1732215156096;
        Thu, 21 Nov 2024 10:52:36 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eee00aa3f2sm697287b3.120.2024.11.21.10.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 10:52:35 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eea47d51aeso12390977b3.2;
        Thu, 21 Nov 2024 10:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVB583URUTWqFSzlyxZFfa+Lz8dFcYmCjrBrmJ4ttfQEFQAEcwvJwJbL3xrrTO65euBNb6DhaLSpxgVPQ==@vger.kernel.org, AJvYcCW5Pa1ss0pGzSiCWSSy/xSFAElHqHKsvbnYIQwlRitMJOsSImqEvrMm13Xt5G3jsTj50luMEXFhBF1X@vger.kernel.org, AJvYcCX52S9Pr9OEYGRFW0jlat9oIPYt3Lb0yVJYgg0QCuIKWIqDPSqNgRNoFkxELzAVkzxXOVsRqEpSaaM74hc=@vger.kernel.org
X-Received: by 2002:a05:690c:7406:b0:6e2:1a56:bff8 with SMTP id
 00721157ae682-6eee0b7584emr3584917b3.36.1732215155155; Thu, 21 Nov 2024
 10:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
 <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
 <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org> <20241121174630cbc6cfa6@mail.local>
In-Reply-To: <20241121174630cbc6cfa6@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Nov 2024 19:52:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCjC92DUxNiMQufaoaR4mzH+gshYnFayjka9-hH6DhFg@mail.gmail.com>
Message-ID: <CAMuHMdWCjC92DUxNiMQufaoaR4mzH+gshYnFayjka9-hH6DhFg@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 1/2] rtc: m48t59: Use platform_data struct for
 year offset value
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Finn Thain <fthain@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Thu, Nov 21, 2024 at 6:46=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 21/11/2024 09:13:32+1100, Finn Thain wrote:
> > On Mon, 18 Nov 2024, Alexandre Belloni wrote:
> > > On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> > > > Instead of hard-coded values and ifdefs, store the year offset in t=
he
> > > > platform_data struct.
> > >
> > > Applied, thanks!
> > >
> > > [1/2] rtc: m48t59: Use platform_data struct for year offset value
> > >       https://git.kernel.org/abelloni/c/a06e4a93067c
> >
> > Thanks, Alexandre. Would you also take patch 2/2, please? Geert has sen=
t a
> > reviewed-by tag for that one too.
>
> I thought Geert would take it as this only touches arch/m68k

I can do that only after v6.13-rc1 has been released, due to the hard
dependency on the new m48t59_plat_data.yy_offset member.

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

