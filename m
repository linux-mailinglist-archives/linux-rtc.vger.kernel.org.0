Return-Path: <linux-rtc+bounces-2465-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0F9BDF86
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2024 08:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD1A1C22E16
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2024 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE0D1CEAA2;
	Wed,  6 Nov 2024 07:39:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318761CC8A3;
	Wed,  6 Nov 2024 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878753; cv=none; b=j0s0e8B0BNbPbbsS3MLPi1CBxugWkyMvLoxdbMdoKseh7g284TIYFlFSEs4XOKzt5vA3LHLy1gRFufRpxj25epf/m+9zPdcApcIJnmUkk0wqnlMLaBVZshlV+U8ShdCGVW/aeEazTx60HHvYA1N8k2/gnyS+dQ5uJotauyJTLDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878753; c=relaxed/simple;
	bh=xuGsBAC66f1EIxXNWuG80EHUZdUuteWHvpgrFCrIJA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onBWw9z/S1KAyKGJOWWXW5ewtzwa9IPpcLh1IB1ZW3UzpzddzE9jS+TNG4jxitq216InWBStL99CJK6t7yjPffQYSyX4RUOvWRSRe7x6D20OsiotXkMI60aSogbYvz/nL13QWgLId3nGiqWSXgfqIv6kgg0TkDeVWJOBXwPuJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so53611657b3.1;
        Tue, 05 Nov 2024 23:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730878748; x=1731483548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/r6tXnUuPwmcrOqEYQI7dbDs3qpnado9Q9kI0QYsBk=;
        b=saWZrtXo/IVtk8l2hmgOdErdlmwYmpGxebdp6YDHU0J8qighpx57xWkUaWMfXJU8md
         kGALbUx+ra1fakVebLopftX0avacVK8AGyRggut4gGHdTbGdQYUUVV2ZB0jBzTJBscxK
         QAGVSRdi3gttNbj0cdRq+mpijgoUVQ+q/sQEJuqz+ZFCvKEMBy7gjES8DTDs/cPQFRMG
         vTCnHpvnkxLrUYwo3Nqq1sqSrRyqavr6eJ++YZoMsIDVw2VjW+q5SuuUa4HOMSRnMRNJ
         Gn+SwevlP2R/Nu/mS6Try92dsSMTSwLAtYoES7S4TPUmXVjrLmvHFaRXqF6c4FyDE482
         38NA==
X-Forwarded-Encrypted: i=1; AJvYcCU8/Lf7w4m+1lrv6M1rQzCB9To+fWxj/xr4MGpkXwjaTKy7PEEMia7Vj1RcFGlVULP7O8jvolYIzYfr@vger.kernel.org, AJvYcCVCgJ5ruXp0EDWC64kG7UmlbUoCK+HtuqkXt0Z/GPuWSnmfe4f+0Zn8QND+Cf5cbyBjL3GzjZ9sQTlclGxi@vger.kernel.org, AJvYcCWJr24n4JD9JM+xmGMkp4MZjLFkJBmmRvUXU0hwyWdlHS9BuK0642pyNaVI/tPDxfqqUABUVE8MTzYN@vger.kernel.org, AJvYcCWP01+btG/8im2Ez5NBSgJ7jCCOLmR8LLVT1Nbz/2Ijza1nDFzSSOaMR0RP6ynsqo9QZFSmYO3mc2ZPUYA9ssHQ//k=@vger.kernel.org, AJvYcCXVvJRTwofHp0UIFGDlDf2wP58/7+eDIdhtecnOJqpU2Lf2NZDut/OJheCgQcu3QXuhahykv0g3KDT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yznv0/L9DSfGXjLhkKMynFCvUOiPVuh1/2PREWqo7AAyOuhpcUj
	IOUaLyo2vQstBxm8C9upY+gJjbA9NfEvBBIWaQYvNlnk6zjiNgAWsnGG1yHY
X-Google-Smtp-Source: AGHT+IEovY+LJyyVFTjFLxLllDEH8pLPXCouaJ2LPCnBD3qiWglf/tevhpIzch95sfSHIdli7RVeQA==
X-Received: by 2002:a05:690c:3509:b0:6e5:b2de:8585 with SMTP id 00721157ae682-6e9d8982819mr414480857b3.21.1730878748552;
        Tue, 05 Nov 2024 23:39:08 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea7beaae0dsm19104977b3.48.2024.11.05.23.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:39:06 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so53611227b3.1;
        Tue, 05 Nov 2024 23:39:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmXkEXMzg4RSiOG6DgzsW0UfT5cXm43aQdvFbEQRDMqk9u0NWA+Tg2HJjzjKdnnWhWGHeLAoudAVtkFumOwoFR0OU=@vger.kernel.org, AJvYcCV8kE7OhtN0SlUDxJnVL5TgYlNcIqqZBU3224La69B+5aXtxujoNdsp4PxULARkXh2wo+bpomXWKdZ3@vger.kernel.org, AJvYcCVTvrTDEeAPt4QIBbUIFxP5/kccEXKYT3x7aUlWF+nQ48bSqpE2QOahaPrgUAKod+8cQQWXGRbCmVepAZmr@vger.kernel.org, AJvYcCW8Hg+oOVZXZu7vowCANAvtFxWLpBWhmF4K9ogtJxDaYeyIY1+TuXLbvWXEpL5MNE6lLhmnm8DfWIkb@vger.kernel.org, AJvYcCX+Ryzrhlz9+zrOI9d7Be1yba+RczSbOWFjioDCda+BkEMQGF5F66xIH5goVkUl2Di1T2bEgqX53YsU@vger.kernel.org
X-Received: by 2002:a05:690c:6211:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6e9d8995185mr433595127b3.23.1730878746661; Tue, 05 Nov 2024
 23:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
 <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com> <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
In-Reply-To: <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 08:38:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH3CK7Fvfj-jis5Ja+oOFcXN4ntRDfz3Pf9ZJrfFMk+A@mail.gmail.com>
Message-ID: <CAMuHMdVH3CK7Fvfj-jis5Ja+oOFcXN4ntRDfz3Pf9ZJrfFMk+A@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, 
	conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, 
	robh@kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Nov 6, 2024 at 12:26=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
> Quoting Claudiu (2024-11-01 02:57:13)
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> > devres managed gate clocks providing struct clk_hw object as parent.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
>
> Please fix the subject line to not have linux/clk-provider.h because
> it's redundant.

OK, I will amend, and respin the PR.

BTW, I had noticed it too, but since you had Acked the patch, I
decided not to change it while applying.

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

