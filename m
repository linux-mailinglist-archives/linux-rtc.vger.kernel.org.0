Return-Path: <linux-rtc+bounces-2146-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D779D99830C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 12:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38B83281E53
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD90B1BDAAF;
	Thu, 10 Oct 2024 10:00:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC361B5ED4;
	Thu, 10 Oct 2024 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554450; cv=none; b=dI8ZsPl0K+uJfp2VenIut7tZJQNtJNn/i/2tFhsBqDMWCQEUh4vWMImiVDAGy0c9w1p/mKs3xe7o6p85V3obkbXg42h53jNWW87lni8mN0SvBLZvZcIQmjpl1Im1RhSF3R/Q8tktnwHEUznjpTRRmwlF6xv6h0nMZBhT9In+0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554450; c=relaxed/simple;
	bh=w6y5ZfG7tWb/TSsaLBLChzsE5ogSrtB6+B0fpS6R7Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZyrFZ6IA+G2FHRcweyexolVIQI4IUNOzmXpIlLIhmzg9JII5/txmySuPaZQDfA5rsfNiBX53N0rtpJMKh4V/lRRyGL7KfjoJFw7NnJ3q5AXYmDbwKYmzkWwqmsE17JbbrMHR7ZZCJQnZyyWHQDxoi44lE8jWpbhLy03/sa4Cm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2e427b07dso5941307b3.1;
        Thu, 10 Oct 2024 03:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554446; x=1729159246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yBCjAd8jk7iG5yCWFv+iDo0uXFYnmYvMnMojfoFweA=;
        b=RuWoRI9mJfps416t1RtRePtYdZg8z96b7oGdjBKWfVAas1lygqWRdp4jyGav2dCwTF
         OGkTtglbkJxX7FfjMqQ+nWL+0M5etuPsuO7WfsJld1PZgEa4cxR1KNUp+V5D/5UztDcL
         +Bdcv5nluCmhDXnehoJ70AmUeaQDqbm1kA3T1MVrQSbs7WYTws4n1XKTj1gNuxTQGo1Z
         b5JB3rUa4aF3NflN0gOMZNYY9BK5qcQVPs7D7d4oV3hcIZ0KwkLcXfzuQLDu9M4mrw44
         p9SnQrgBvwWS/HbAGVLu4rhBDRox+Z106DK1bUmyyHovb2Vzrfgyox6/oS3ehikkwmgF
         8L2w==
X-Forwarded-Encrypted: i=1; AJvYcCUV8bj2LyW+lracpulDYg8k2A8qn4zYbEgpJ3OaEW1u4LjGiF2fW0czab0f8IoG8/pJM3YZMdCRkEE4@vger.kernel.org, AJvYcCVA+Hs9caUv5drljbar4BxulOGAbG0WTlHR40gAMOr5Iwx4HrUf5uETaJ4bkaD89LCbbt+KFcUN/DSY@vger.kernel.org, AJvYcCVMC8CqMDPhPGwYJg8c4MuW/VsCB1+Ih36VVD5AlqBneCNu7deiDtJ3vIXV5iduZgwqgJnnzV2VBbCA@vger.kernel.org, AJvYcCWJqVAAA0COMX7LirohnmxiP9thjtMr5MbrB5nnW+ejJ1itggp7c5hHMdzoDtESVheikuSGfIQTPwBoTprH+wOk5iU=@vger.kernel.org, AJvYcCWSJHSU5rWPRwvTWFuGRGqrLl01syNhrwgXGc8bFlJhL6cnd7T4jbw2rsgCPudgg9eb80/kgcZVNF3Fid/C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywni1jS2f+V913KaTIr/YUrSEo0Qp9TrzErDQxo5C6cC6sOKyxt
	lanCrwdYkDQset9D8zE3OUWrVGNTz/D7aqeqHTT4lrUrrhoUjJ4wQuf9hXVn
X-Google-Smtp-Source: AGHT+IE9tvXEz/7+eYOK7dzg0IYv4rVdhVthO3nKU+7OB53xf3WS6yJ4Bbzda2CoZCTEsMRqNcq7GQ==
X-Received: by 2002:a05:690c:93:b0:65f:a0e5:8324 with SMTP id 00721157ae682-6e32210e2e0mr58861897b3.4.1728554446355;
        Thu, 10 Oct 2024 03:00:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cb3747sm1565457b3.130.2024.10.10.03.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 03:00:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e4d16c2fso7130977b3.3;
        Thu, 10 Oct 2024 03:00:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5EqtksSWcJ9FcMVD1IdwTJx5rjAL1vIZVXFWNPbrwRm4c8sTYY2aRNKp+b5UaFsfKD/QgaPrGQ6JQ@vger.kernel.org, AJvYcCVC+bnKBQfS32rPW9biCkpN673Ik4ZbBt9yfL9/ePXZ6sSrSF7neOMuVHrgks+FEfQX7xzyiHcLEK59@vger.kernel.org, AJvYcCVSAWNhFdeCc382WZ5+Ajav0DcPFi/ghJOlfMdolPO5uJG19SurB3c8KDLVJy7ny7MKIV9cdXDvisgw@vger.kernel.org, AJvYcCX/YFBaOYmoR9F9bUjwzFOKz1qKGCzWPJHYLA0dW2PWFeJgZMDRjMa3NII9+yDvuZXsFZC/RUgklo2mY17K@vger.kernel.org, AJvYcCXQzeceD+rbZFYf9OTb1nhZiRNAGCQORg3MH5YYOaDt6WQD3bp96o6jbpUYjzxWmmNS/4xd37mJ7ymhgdoBuk+WPNQ=@vger.kernel.org
X-Received: by 2002:a05:690c:389:b0:6de:2ae:811f with SMTP id
 00721157ae682-6e32217b8b2mr56581427b3.35.1728554444732; Thu, 10 Oct 2024
 03:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 12:00:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZVQJxGdzEGFkeEy0gXP4V-_Ev=sS+L-gsFTcpC_JsNw@mail.gmail.com>
Message-ID: <CAMuHMdWZVQJxGdzEGFkeEy0gXP4V-_Ev=sS+L-gsFTcpC_JsNw@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
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
> Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> devres managed gate clocks providing struct clk_hw object as parent.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none; this patch is new

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

