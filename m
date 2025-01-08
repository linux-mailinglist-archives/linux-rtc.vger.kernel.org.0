Return-Path: <linux-rtc+bounces-2847-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62730A05C2F
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2025 13:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABE303A2784
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Jan 2025 12:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1241FA8D9;
	Wed,  8 Jan 2025 12:56:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256111F9F5A;
	Wed,  8 Jan 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340972; cv=none; b=kU2mMUzIb1eRd3yQ/u2HSysxkCrQNc6Z02pq9ZRvL3XMbitJ+oeAg+1yKb/UqL4TGe3A12o1/15eKt7oBPpygEbR7QyqpCsTSucsxcaUaWvbKVhbz3JFO8t795oAO83hyitnsGdrEkqQRXHFFdilCE4js2IkvRO0mgQM0C+t9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340972; c=relaxed/simple;
	bh=oKT7Yz8DLH/KDqfm87YOoAHzlTdU3CIV02cT2d0S8zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWlh6aC0ZGo2QpGSk45FduojpzbpQ4G+hLobZR2aL0i/fcaiMwoPFRhL1fZhfJDy4h1QCWk/+I3wFL6Q+xqme7+ZdYbkLaE29toNfnj+iJp6+kDvMMs1n9Pljzha2UyQ6MeOnPuCZNxqrGFCKQqXJXEtSD0Tk7kg2Dc6hTqt7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afdfd3124dso4617490137.2;
        Wed, 08 Jan 2025 04:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340969; x=1736945769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr5OAgOEPPZiSNcmjwmBPGqoc39w41Bm0SLcztepzJA=;
        b=JRsDL/n9SGsgK+jp30v5i9Ovs8sZg1+1p0dhpeCvbnuhQJ6qX0d6nz5KuXmuFsUaBk
         xvCnr/hW8b2WtpEMmbIG5lP7UT0qjg2N83trU0gQlo1Oa+dtAlM6drIUI7i4WHUrO7kM
         mkTxpXhlHr0ftEpO4Perx1cSln5S3vuRcgNSTaqVBLDIWOXJOJx8D2LOr0x8LzT1yjRN
         qLGyx6KYP+6odVYKOWaSNDmhGNBoXXZ2YS9w8aJHu7SQvCBngdhk12tr77YfUNXccVar
         scqGn2/kqkg4hCbkOpgN/BZwe42J0FBEzc1wQZn49ONSCqtMefzPE+QisVZbR4MmeEA6
         Tptw==
X-Forwarded-Encrypted: i=1; AJvYcCU1iT6meDIpLREuYNANfy5pHPrw3j/P5AeSwywXbJ4vfMtruhQEjKXWkwnPSmCKfsmBUL0bTXUTS0lJyh8rHQ==@vger.kernel.org, AJvYcCVWI/QVANfc/zbUW9yfouO58rd0OIsFysYLIEveub+NhLAkb4eo3KjDzBEeZQf1BhSrZNzBnsWhrUjL+KOIM3a9gHo=@vger.kernel.org, AJvYcCVk4b9rPJtYd9W4waX7TqXYltZFJKThBmKuVCQ4hFaDIcKkLEgw+tOCr4Sf6Y1BV8YKievs72KzhxPI@vger.kernel.org, AJvYcCWQgW4Lc3sdBBgYvnbXC8D3S3vSkEx5zVhh+6Mlj5SISwLEb+6YtVh2pQwrdkiEu6+/vd/C3T/WLJP+@vger.kernel.org, AJvYcCWnwRymLN8QknNgQ3kFlLXhOxPd8NK0m+leEbZhtrOMErP9ZYI3ypqxELKpRw0rR5M94uIducImpcm2qFXD@vger.kernel.org, AJvYcCX5mwkKNatJ9mu8wiKa7fsFM518iUQzJRWVLZQFn2VcqobCG+2c1GXPsZmH+hFm03ORShswXN5Lqow6@vger.kernel.org, AJvYcCXDPwAocUbtBDz+TNuGF4JlAF13Jeswv1HbJ07hqEtAlY+z9YNKuolDziDIp7YpkbFTBwkKOn6EoLGmbjs=@vger.kernel.org, AJvYcCXgESDVTzk6vYfJjqUoLf3d8H1SGfDr+IYM5trx77i3AdShYHqtOm3Mj+EpkP51EfsV4G856Z2zd6tQ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgC00Sv1ZE4hUwHJUAklxdZep2rOO7TV6XcwSQQ7DInow3zi0+
	4l+Hlm8kji3mOoTeRAJp7edgBDDy7NK/el+dNS2S0X3FDBw1Ly+8FCD2F6pY
X-Gm-Gg: ASbGnctA39A+5fz0oxBwZiHe3tcbPWCqZApO1Dirqn5qMwbNSaJGM7IcFIaa5uN5Ypq
	ruCTmxPwqByT67+PK0vEbo6wJcyUH5Ez3ZLgWUIdtogoiRyMs+OkFg9Sf/fsWZu4Rbq/T6kTzVX
	jXwkiwZCS1LEOp+uPydrmUOY6dYpsHTB/1+tjfW9Vm+SJRpoZaMtksg6U8YyzfOFeILNL15qiQw
	lS9kln2GU6iMsDItzn6mguAHv+a5usPR9dQ20F4tMvoHL22hFN+YMEK8xHdN4l5kf/CzGoCvnrX
	xkTQanGmLO1d6z1kzR770/M=
X-Google-Smtp-Source: AGHT+IGXigZfJbGek043S1B2Kso9f9KPMJJpqNGHfmzud/SjN0BItpqeokefRoP4CAhSyoBpp3lbLQ==
X-Received: by 2002:a05:6102:6d0:b0:4af:f630:7216 with SMTP id ada2fe7eead31-4b3d0f2999amr1764418137.16.1736340969517;
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98d1c9sm8376010137.4.2025.01.08.04.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5187f0b893dso5403208e0c.3;
        Wed, 08 Jan 2025 04:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkEphz2cn+a5FlMLFJ/mM0h8YJGwO5xOE11dlowaT5V3Kw2KY5d94OtDBMKG9OrJ558CA2cZzvChyp@vger.kernel.org, AJvYcCWHFtNMKCLY/6mwyD/nFBC5NtT+nrsscNK8T4S/Q6MbLYuAkw9PKe3WdOxNAgoIb9KGUSI+1W7wFhp+1Q==@vger.kernel.org, AJvYcCWRfqHPpp6L7OzPKmTFuqwmgCXmpP3XATW5SxWSQ4Qe1jjQHbiZvVbCR0JRHsVsCzjiO8cBmtqvnoFFxXjSj7Ljq+g=@vger.kernel.org, AJvYcCWXPQQEXO8qulQkEeOpx0yYLzM7L4us4+EShHSw0zNJJ4LW9NmokSu6j6hWYm3UnpnkJOfdg08ZSG7u@vger.kernel.org, AJvYcCXFasQFEDhhyOfUAZtpcaIvUa1xgHLffxkIAwD5/ANRD7uz8hRp8VEYzi7PueqK43+cBhZsdZCQenf746zL@vger.kernel.org, AJvYcCXQP7YsThJ8i4HCTkiZ25WMbelsbuzQl1XOGgsToVrC4piww5jPJAK+HOJjfJxtIwiffPXX4UvIz3ib@vger.kernel.org, AJvYcCXVTxZyRYGyxv7h4d4rhtE2ZTm3O+Cs9caouCkHFgJKX/MSggW1jgYOI8yLizF9a5vUDPUJhgpGBJkQCjc=@vger.kernel.org, AJvYcCXh5LyDLuUMrlI0iqgZ9D3v+ZwPRsv2YXACatRGhjmLs1VdWrmjboUnrMS+F+9YviJYtlQVLvGYmdQn3PYsow==@vger.kernel.org
X-Received: by 2002:a05:6102:5123:b0:4b2:ad82:1318 with SMTP id
 ada2fe7eead31-4b3d0fde32amr1732752137.26.1736340968977; Wed, 08 Jan 2025
 04:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:55:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjRu8AnCei67oBX-eR6RqD6m11SbH6mRmpjD2sfTtFzA@mail.gmail.com>
X-Gm-Features: AbW1kvZ52DN__RR4vjE2dLHCl44CSoj_lJNsAln_Gci5kCuBVU2sP3BZtvvNBVQ
Message-ID: <CAMuHMdWjRu8AnCei67oBX-eR6RqD6m11SbH6mRmpjD2sfTtFzA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 2:15=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

