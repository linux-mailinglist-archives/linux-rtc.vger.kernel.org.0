Return-Path: <linux-rtc+bounces-2154-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA15998C4F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86ECFB2662A
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7E91CC894;
	Thu, 10 Oct 2024 15:29:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD6A1CB521;
	Thu, 10 Oct 2024 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574171; cv=none; b=bm891qZm2PdVFJ3akrRHHWkW1hZ2QFWdAuG5IYn5h4ZU5BbS+9ILtvZUv4Ms5RJ+JiZcUy8gn0ID0zIezbZ1vI7FLSe3Jw+cxdbimc3pSIzPxYQR+/tKJPpQLZ7bRYeYx6CgXuEvvFLaaqPgCxchH21sU6K+ARzD5peXylNxJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574171; c=relaxed/simple;
	bh=jrj9+K7Fh9e/U+oXByDATt/NR76EFSFBlNCh3Y6vJns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR2efF/oJICT71HU8krN0csSGiJSHEdCZUOag2odgjEzd2dDGXywX7B9keY+rq4/N+yxZlU61DECVk5P1Afbr3cveBIulmisZtY3lgZ9ZD/8AhJs8BBkyAC6p8++3DZ1iz2bAjQVgBnzUWs07gS3rpyQbW+SrqGKFzqJB5W3xk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so987421276.1;
        Thu, 10 Oct 2024 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574167; x=1729178967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fO24yhk7PZrhGJiglC9x9ndE9lSPT+ib6HvlT5l89tY=;
        b=hPAS6SbNFzY6ST4pzwVHjcLzvRnqbwHhZYJd1FEM8I5+SlqNkEi4p/QfcWYblmqLEL
         I5fAB1tC2lhEOhjxK8C2OAJN4r8ITQz6BEtTf8t+IjtA5HV2RgTdyE7qjqJ2i3oI6R7C
         iTsFuRpxeaIuUsdfCzLbqRdkb8y/EniCfSYBTWZkdVTTpeuwHkjw0QQ0l7rxy6FFveqh
         mVjzXl7ENGHj2BUDVEzSIuu8iNkZAZo5ndtsqqY+aEk9hdSJOzSDeW9YvVz2LTDbE9fB
         Gel6yGSr8TpUEy9RTCZEAJW14mJ0KnGTiFhU76V31dffNGIjBrHr5p0XjOfParE6ndqI
         z+3w==
X-Forwarded-Encrypted: i=1; AJvYcCU5c69h5aAh6vAL9umqoY7ZR70fExXfj1pafgn7ox/cRfr9LZ2vT3hYRpqhqrOAuR3YE7D4nK5pxWu2@vger.kernel.org, AJvYcCU90vPadsNbMs0DyxsCgJ2nsjRHOBqF/jRl04Btsu3WqVid6qL81kEvcaagqJT0VnmTVhtTf45K54LA@vger.kernel.org, AJvYcCV9t1p6TmanFdGLPAdTOV82ZSPKP7J3ovy6g66rTrc3u+ZpYoGYKroZJ/hW/q4h9YyQzE4qa7q0BYOBEpxP@vger.kernel.org, AJvYcCVE30Es1clypRX+2+anWhxxRIhwcWlmT3Orabt1OG+A89FOCetXtIpvBPMHy1HgfhbG/2PCBkFFsQvz4WOTZA7qNs4=@vger.kernel.org, AJvYcCXxnxvVvxN+LE4Vl2/GLC0CTg/Jb31Sw5LGaEbo3knzVmWCJJwYYWiDGA6++IS5X0iqqaq05VtBkRa7@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQldy3MuR2UHTe8dXPIiRirwXc8gATAFXHaXddjDBa8/5gk/G
	EEDI0bNV+CRxAgh3t1If0Lm2f2vwrzGV3sXb2EyE9EvpgZVXm7XTiQYe+wCD
X-Google-Smtp-Source: AGHT+IG+YP5dhB16DPkFOnqnQHvw88OntYr3VvCsypsJikmPH78cQSB0uZ6wTcgVSoWVPLvwzfj8yw==
X-Received: by 2002:a05:6902:2485:b0:e26:1be1:5a47 with SMTP id 3f1490d57ef6-e28fe43c3a7mr5274094276.23.1728574166482;
        Thu, 10 Oct 2024 08:29:26 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef5c45esm328931276.47.2024.10.10.08.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:29:26 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e30ee6788dso10112477b3.2;
        Thu, 10 Oct 2024 08:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqnNdYvQokpnp8dNYyX6IwM+KeJWgh3kKl+K2EDwuheoveSbSSRUGKNILwS3oXvj5IUv3Qrc32uCrq@vger.kernel.org, AJvYcCWRJQFHghoXcU8wQLglz0k2depW/si+aQtm/mecEkEuhXDz/TGlOXwU1VdPlSYjivVGlH3pqBx5WNt+wVpcPqoKsqY=@vger.kernel.org, AJvYcCWT5Q+GHccapIqo1cC/lggqtDWGke9AIFvUKKOBVdlKZX6pgcO1cRLdTS0uKivfuKbIoEYEjDBmFFku@vger.kernel.org, AJvYcCWpOd95svL2wlGX04GbgG+TD7mrgKLf0thAmOGY1QCM97h7ghmHpCAcKBHecBRQmBMiQkL1hnq/syfH@vger.kernel.org, AJvYcCXaZIYNF59BIw0dKBgNIQVEDlHZJ7V+JWPb5wMxl8o6q/l2HgXN4zPff8ddZNykodtv6k6bwHinVPT9gX78@vger.kernel.org
X-Received: by 2002:a05:690c:4291:b0:6e3:14f7:7750 with SMTP id
 00721157ae682-6e322462c65mr44042497b3.43.1728574165806; Thu, 10 Oct 2024
 08:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:29:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2FWSU0dazP7dQJOJGikLhKBWs4Osp9wEscZ49BXBKCA@mail.gmail.com>
Message-ID: <CAMuHMdX2FWSU0dazP7dQJOJGikLhKBWs4Osp9wEscZ49BXBKCA@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: defconfig: Enable VBATTB clock
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
> Enable VBATTB clock driver flag.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - update patch title and description
> - dropped CONFIG_MFD_RENESAS_VBATTB

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

