Return-Path: <linux-rtc+bounces-2153-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83823998B95
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF91E283B9E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E961CCB46;
	Thu, 10 Oct 2024 15:28:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A951CC886;
	Thu, 10 Oct 2024 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574139; cv=none; b=h8B4/Gde6gcAIIrfiYS4S37HmnpUYkEbcUhUzlCkY4FteJp5Xs+13g19LHm7SII5h+zrDy94zllmeIrbLv6btZLP0ft0a3+cyqOAlEB2FwS77kRKSn7eotsG/L5tBqPGF7Z82Kpri+ZwieMwFwP3nDylb5tPLandbeIAEsHRFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574139; c=relaxed/simple;
	bh=hbmy8nXaP5WLw0PzalyLw0qIHD05ZFdCKoYvqapxCBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doKYKlUqLPW+cpZyDUa6CyS+2FY/HgFgbRVFPnKdCEshhxI+7Aoi+Qv9g5RzJzXQQ9sAlGIxshXBc3qTQqLmr5MWTNHx8qfLNlnm1VbsGVNCZXgg5PD1kQc83IIT6Z2w7NPuDl7Hep2DXbvrX5aPXz16/aPcVXaHQdXtO9Pq6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e31413a196so10088187b3.3;
        Thu, 10 Oct 2024 08:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574135; x=1729178935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ6v2PNhRr26PMKKl3cx81npeWmqOpJV8fGZh29KaXM=;
        b=MYYTt7Ee4CKVEsKcnvxz8T6yTcZbcmdXFrHtVgqgr4CrZmPMhZ5jcmILISwZhsv8VL
         LATyT9oHPgfz/Vhfqb7fjPj7s3bT0+ykkKaOF6ycfVe6/lpk2dKGFmcrR36AgaimFMyv
         bXm5fn7lvYHyd/W+pYKus39YJx6ArE6Rg7upQzx2tB8Gr5SWtL/O7JHiEP6UNuGdLqRU
         nCGBqnCHd/7fIVSas4LdK68IoS4R1DLT2uUupnjzqflFkAuuJCgkiZBwmKXSl2RVnwte
         EX+0hnjuwmo361W44yByheYgJbZxGkLC0AzsJBk6DKJJ/Io56v9liSicDFDHTJCH8aE5
         ci8g==
X-Forwarded-Encrypted: i=1; AJvYcCU2rYMk0o1DVkdDCJnB020SHqeEJD2LxGo4ok+UImluKXz9YCY9+E/lYmrB3aWu+amYPul3b8r78B1yNfcSKxZMQiA=@vger.kernel.org, AJvYcCV9bat0fLCJOocoLPZks61PIfaba20oeMM+JFXR6/IF+0EFwmaRHPD3And5YabvZ6wAOifQPLOMeFXk@vger.kernel.org, AJvYcCVGNsB9whkg4qb7EHpkQv7z2TB8x6mw5NfLESh2lAjkZFhttuzxJJPc4/Dr9vIRu6dFWe+kw7KdZEOPZeJH@vger.kernel.org, AJvYcCVL6K8TILlMm5edLC3BYhNFN6StqaACy4fg4gJ9HqPcquZ5iXZzCFSS2yE25ButbSRtlfDRJ4QSocN7@vger.kernel.org, AJvYcCVoEftzyVJDhJFyE3vrvVZ9BimI73dN3h475mi802Cr51Flj37mcRPNM/jKhPH4IzjqYF8Ib/n5WjS8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Om0ZJytzhLgYx1l7fNVmxXCkOi/kGxbUCWnYRO50kiPO6YnQ
	7EWVOcF9xcFaEgIh1rlPSrynGX5bD+pmcq+DIslOZMCRzOyWOf1SUkikIcEF
X-Google-Smtp-Source: AGHT+IEkoUTFroTE5BEO07sY44nT7c+aZ0Ng+n7cWlaNNGR3Tk3vGwn8v8j9o91yQ/B858uz5rpF/g==
X-Received: by 2002:a05:690c:113:b0:6db:e280:a3ae with SMTP id 00721157ae682-6e322145098mr55589237b3.23.1728574134832;
        Thu, 10 Oct 2024 08:28:54 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b61279sm2454287b3.12.2024.10.10.08.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:28:54 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e232e260c2so10011477b3.0;
        Thu, 10 Oct 2024 08:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtdySkmYKyY0Y8vywCZIM/I2/e1EKO22WzyLgMHU/RbhRRIt8opHsyZyhzBGyO0RUQiFhwH4iLr7awIyex@vger.kernel.org, AJvYcCUwO+R8MznYG4QPJofCk6HHF5MHTLFPZ1IS5WLImkgsfraWBUMS2uHY0S+dPz17I5d6e0mrqyl4UwJa@vger.kernel.org, AJvYcCVYnVuxebuwh9xFJPyan+3X03e+1L/04n4/jT790Bs+mW3+GpTjslFalmT4SFGbp3ZT28G7ysGYjFcG@vger.kernel.org, AJvYcCVrXvB/9iq4gRUpMBUFnMI7Ppt1z6HtRf01thCB7RJAUtBzgQiIP666YGGSeIhQwPMiQ+vViCmHo6GLer6EIRtLPGk=@vger.kernel.org, AJvYcCX6vF6vZKj1/k+RjAQSn/ToWqiqVFL5uzpoATEtDWBVJ9rqPpMZK2lD6pITbsy1iat6fu4Uf3whote4@vger.kernel.org
X-Received: by 2002:a05:690c:d83:b0:6e2:c5d:4edf with SMTP id
 00721157ae682-6e3221134a4mr66704147b3.9.1728574134118; Thu, 10 Oct 2024
 08:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:28:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjq44dz+sQpw7EaU82PKQqBFTUpmkuuU8XqQwfSR57eQ@mail.gmail.com>
Message-ID: <CAMuHMdXjq44dz+sQpw7EaU82PKQqBFTUpmkuuU8XqQwfSR57eQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
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
> Enable RTC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none

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

