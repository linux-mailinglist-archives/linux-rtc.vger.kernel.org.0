Return-Path: <linux-rtc+bounces-2301-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655979AE8BB
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24A6F290AC4
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2D31F9EB4;
	Thu, 24 Oct 2024 14:23:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5F1F8EE5;
	Thu, 24 Oct 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779786; cv=none; b=RmHTiC+cATZmbRYtlDrdKdeqPqpYPcx6c8BUHW33URIg/cOvrHBmMHbolLn3ejz+YRG6e/Utv2s3NQy67SDFUxtk8AjlTha92hHHWubGtms+PnLEUM1CFlJFR5aBm82Kg0QC1scQZ8aAOlk5YPIQcVK20yI7J2ncaL8I0Vt7oqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779786; c=relaxed/simple;
	bh=BBpG2l9iLV+gg4CxbigyjE17YK0/HOdWDNDGZfS/WOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slW+s3WgQgB6BMgo7po6DBFk6STOLcBvXSiUte0andvmR2MfBQtTx/WztvaCBf6MGyI7sQYvlr69Y5ZqNk8yQBFDWWObTRkfb0ueTvNewutMtBwDoSbjUl1vj/yMJW/XPp4YNW+P+CF1kOYdJkgAlhrKI+PsIwJSUyq06W7YgNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e305c2987bso9341867b3.0;
        Thu, 24 Oct 2024 07:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779783; x=1730384583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf1v8inwAeGWWTJ5qfca3lXnWCIMxKlti4Y9iBdiRr0=;
        b=ww/wfv7lFnnnPSiH0rwH4+SOuqd668SFoyl2CPJ3EWrhzZ5BwWitEF1fPlW6Fl64sY
         Nw8aDIMzfRGlgh5A7soNvJTMjuO+gj+hI/BWyFbSOW9agBG3JZlX4j1ay1N9MLS+2LBh
         JVYNmdMRe1GUPXJ7Z1Ig5s7ljh7pRCFDnqGYpQQqvKJNVHPUIshanpNgPZdDU+GrfLar
         2WgN0m4wXlUGfxanNkC1xYJQV+fb4p/OBJsF2kuGFEd+5X0o1OM+q95E6X2Md7Vhjy6g
         ZFXBwND4Gu6JTIdrBms0aaNioygUYJIh+suUaJhowoh8NS8l8HLbfBEzbYTc0Vxg4CdE
         keqw==
X-Forwarded-Encrypted: i=1; AJvYcCV+/VmfLpfelNQ3dvToRXW48mJ4k51r+6IIQKfV5TJ93LY62ixpu5isNTcIzSFOb+AOBDa7NPqk6zX3@vger.kernel.org, AJvYcCVACu3SOTCOl/AWZ8Aa0GroowXZ7hg+8OkjHmg5svPTJydmoz51l1HmQwEaD2RrwIgiR5CMPL8BpklbpwrFETy3LyQ=@vger.kernel.org, AJvYcCWWSHdkfmA87PeAP+YO+H3eAkAbIJpz5+gFrffKByTk/+1jHOFQZr/RXxH2D7nKHKQZfrdkUVo+gL5n@vger.kernel.org, AJvYcCWZCQf15dro4AZVvZ6WyTwOTT2vjh5CynBawWVFZauFPPvtzNkm86v9alvQPNSCOmI97wIz3oqXS0szUAFK@vger.kernel.org, AJvYcCX60Udf2Njj2yzsa8or78cwMpWJvKoTNZxI5tZarsryzIyeL28PtboqvgMOe8IFS2KTQjGFKHi3UR0t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn4pede/lT/PN4nYLJeBEa9KzLAlMgDKzkvpHmYO4oNl312aFO
	AkEf3Ee/uQAHSP0IrxW8b74AHRsFSrEEI8emtMcW5CsO6c/e5Oeil47lekjK
X-Google-Smtp-Source: AGHT+IHXCSaNoa+MVGYXj16U3O4wNA+BAesfiRxygeIGM6tRLpv/E+oQv0nMSpgOAtLFmjeeuX3ZLA==
X-Received: by 2002:a05:690c:94:b0:6e6:248:341e with SMTP id 00721157ae682-6e7f0c45b93mr73421547b3.0.1729779782902;
        Thu, 24 Oct 2024 07:23:02 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb78asm19997797b3.88.2024.10.24.07.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:23:02 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso1077013276.0;
        Thu, 24 Oct 2024 07:23:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3BC+RKcpxZCHFO3ljIxaM3U+GmtBfU6DZf+BHCn1zoGD5JYRCzRsLtKFXKSW94Y4+AVN0MLNcOxUB@vger.kernel.org, AJvYcCUV/hXJp08GPO1djAUEs1jeficSDGo7TnDth4rbtVTnWNGwNHdDhHrIJCCnmTMDC8CWl4ruqCYA49flkflL@vger.kernel.org, AJvYcCUcoCrM3VjW7Wj0A0yynE0kalyvxSpQEHu5E0rMezn9XfEWATjPnlQo5BsgeKfwdNa6lD1LNkD+m1jt@vger.kernel.org, AJvYcCVDf5ljJ8S7vHCv8Xz1TaToyFZllz0zLr0WHKjEdi2lldSzxdVllBFUT8ahXdJeiirhUysqK1K90fdM@vger.kernel.org, AJvYcCVj2PEVbGp80ek1f2O+wSkkHISddZr6Uz3WnY89/+umaiYL2lqErjxQsybpNLAPht++vutq8zNt6Ao1yI8R+Pxk0q8=@vger.kernel.org
X-Received: by 2002:a05:690c:6508:b0:6e2:ada7:ab89 with SMTP id
 00721157ae682-6e7f0ed3a28mr76765417b3.26.1729779782574; Thu, 24 Oct 2024
 07:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUy-EhLMyT3KirQxnozpQt520XdvmP-nQ+EbRhnYMu8FQ@mail.gmail.com>
Message-ID: <CAMuHMdUy-EhLMyT3KirQxnozpQt520XdvmP-nQ+EbRhnYMu8FQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] arm64: dts: renesas: r9a08g045: Add RTC node
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

On Sat, Oct 19, 2024 at 10:48=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - dropped the assigned-clocks, assigned-clock-parents properties as they
>   fit better on vbattb node
> - moved the RTC close to serial node for ordering

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

