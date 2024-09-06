Return-Path: <linux-rtc+bounces-1877-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6796EBF0
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2024 09:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5979D1C20DF6
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2024 07:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E6614BF8A;
	Fri,  6 Sep 2024 07:28:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365913E898;
	Fri,  6 Sep 2024 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725607735; cv=none; b=md65/aYP96iCJjVEo1IhDtiM7oHvVI4cSYvpAsDEbB9wU+nigGJdKPzDpGBny6JW0BadxZ8nsaKJsEpo+WXvCarHcjyySbk3LKNez6eB+GPeQ45q0/ld1UfP23A1SdpmoWSzfKW2757iY0tstqQkzM4UOpcmQN1oGJBE3CH6ilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725607735; c=relaxed/simple;
	bh=6XBwn2hugRbWAd5VsP7HVR5H6Ag2j9H4A9SlK666470=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBzgRIRLCEqLNfqcBU1bS0+HHJOY6FIx2VogoFBNa88h9TftiVH8SGjqTaJ6jlIW+oQDFPwL68Haf0vzV+SR386VK33UuHZhep4oj8hJEdi4SmUtMObMUo0noFKJnAzUy0EadJNacBEehEFHGyL7FNfy38raMHMNq73EOPhXMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6daf46ee332so16974377b3.0;
        Fri, 06 Sep 2024 00:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725607732; x=1726212532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuzw7zJ2WWQZhbbGEQc9vSAGZuPiQIjz91qfszNVDqE=;
        b=XvBx4r9vouuBBmRzH1VXedpwKxe6YvcqjVMGBL1dBDEVoBVKOUAKuyBLcSpiLcWJLb
         3J0HxufYOL+7DQMxByCCW1dtJHa/fdXi/22tr8EHu+OHTAxu9xA1KzrFGkQNomQAF701
         TVJmc38pKRgx0OEbIWv50eVLifS1XU12t0l5qARQ8o7UNdzCby3koiq//JuorkuG5A3K
         3hNiX6e4MKQZaosG3Qxc5Ov/5QWCLxxIxfthT6sDotRljjno7rwiK2UUHz9/L7h2lGGp
         tjODaJ5CVhqQljtd2JrIJs/zPE6JhW+XQbGZYAbUIBIv5z53JCTlsvLzZkpOF4+WbTLJ
         Xdmg==
X-Forwarded-Encrypted: i=1; AJvYcCUewtGBMcEWiZkXOx22UV4emwVsMdo/GmQ30vlMZMNRAgAE5ywzUF4I/EnavpecsUxAHUzRACeRKCsbFmFk@vger.kernel.org, AJvYcCV0zNpYf8hea+2a/ZFrQ54pld+f6VYTF8zC7NM5R8t7ZmorfvvOs85eKNP5u6nL5j2h/xm9hkW9NoBf@vger.kernel.org, AJvYcCVVeteaCY4TFBMJiIe1NleObqNsZ8NG8aids8uBdSaeWN/BWMFIacKZ6FZdpMmy5nu/pEsmTaLcFiNj@vger.kernel.org, AJvYcCW5ufjzKsPx5TgotR1IR+K4x1XYvSERbvpO/y1DV8GjsOPtjfEb+fcApQWP/nCQLKiMMJBRJfix9CQsWSn/GINwF+A=@vger.kernel.org, AJvYcCXoTWwNfWUX5EAC5zBm/Vf0HePvRZzUBBMAMNUGxPWkfyMtZOr6ozeqL2UpYaC9u+zjCXd59M4JfIYr@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgCG6wcT/hsef1aiQKaFCa6C6azwJUv2Jaygdcz0FhydPHf6N
	z10/LUAhj/K0T7WWGOGt6W3tPEO7OhbktEzuuZ0trZBRB/y14yViwPIEpx5o
X-Google-Smtp-Source: AGHT+IEWLkp5V8/D7wdzEil1VKsHw98JWqy9UNByuten1XWqiU0DRfTGfSBOpIqC/dNcoLDg7dBWfg==
X-Received: by 2002:a05:690c:688c:b0:6d3:b708:7b1a with SMTP id 00721157ae682-6db45165782mr19861737b3.42.1725607732012;
        Fri, 06 Sep 2024 00:28:52 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d40f24aafcsm27836357b3.89.2024.09.06.00.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:28:51 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d3f017f80eso14443407b3.1;
        Fri, 06 Sep 2024 00:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA9j0xvlPxJYoL8e9I09mdmqh3W28OZhcIwXiKP2kk/YVYoOC+RXXdArW0HCojqHoC+63DYnfIYTpz@vger.kernel.org, AJvYcCUsQPfpWni/xzSKycRS9hRjY7zbAk/zfSl6SY/4vaaS9xghI66pJEDtb4xOetDQu3ay0kHJMyVJfbVM@vger.kernel.org, AJvYcCWmwVdhPmSbX+bf4tbUdUbuDhxC1+hHgb9cVztyJY75S1CDgAaXRc1ulg4s+8LDwsM23mP20cBo3+XlAzsaVk0TCpA=@vger.kernel.org, AJvYcCXRDOz4cRMI6Yq5rghWpR5Ed4PDprNov9Dq7ij6iI79pTWyiQ7oEXDuhKQac6+dQsSsrJLezuQStrek@vger.kernel.org, AJvYcCXWi8WINbPHT+gJBbOdGpB3w0djwpn5re5CBdcBkhB7iTFDYHs357Ql8gpFTWB1JDFXk9jBbAE9Xppi6CO4@vger.kernel.org
X-Received: by 2002:a05:690c:4391:b0:6b0:e93b:7179 with SMTP id
 00721157ae682-6db44f41516mr13823817b3.26.1725607731490; Fri, 06 Sep 2024
 00:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
 <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org> <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev>
 <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org>
In-Reply-To: <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com>
Message-ID: <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
To: Stephen Boyd <sboyd@kernel.org>
Cc: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, 
	conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Sep 5, 2024 at 8:09=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wrot=
e:
> Quoting claudiu beznea (2024-09-04 05:17:30)
> > On 03.09.2024 22:48, Stephen Boyd wrote:
> > > The node name should be something like clock-<frequency> but if the
> > > frequency is different per-board then I don't know what should happen
> > > here.
> >
> > The frequency should be always around 32768 Hz but not necessarily exac=
tly
> > 32768 Hz. It depends on what is installed on the board, indeed. RTC can=
 do
> > time error adjustments based on the variations around 32768 Hz.
> >
> > > Can you leave the vbattb_xtal phandle up above and then require
> > > the node to be defined in the board with the proper frequency after t=
he
> > > dash?
> >
> > Is it OK for you something like this (applied on top of this series)?
>
> Yes, it's too bad we can't append to a property in DT, or somehow leave
> alone certain cells and only modify one of them.

My main objections are that (1) this approach is different than the one use=
d
for all other external clock inputs on Renesas SoCs, and (2) this requires
duplicating part of the clocks property in all board DTS files.

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

