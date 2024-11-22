Return-Path: <linux-rtc+bounces-2609-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD869D60B0
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 15:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9171F23CBA
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 14:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6B869959;
	Fri, 22 Nov 2024 14:44:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6EF79C0;
	Fri, 22 Nov 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286688; cv=none; b=DpzINotQMPp+cVrMQG/GtCYNG7vDoMen8gFzpsBtXoRwIWIpZXYxaBisTBqxfqaU5ikK4s7OA/8sHoTwQzJkcB3i4Njtje9ExOO+3FSuWRLjveNi7h+yCttxh9krJyK9n4CVg6Eg9ZoAdqphtOs/8Sul5Y6jJxTSo6tsyGJFq4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286688; c=relaxed/simple;
	bh=gJsgUxq0sobbp03x6bMBjDPYFVA94LM0CfgzuKj9OuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgBQn1VjaTufOF32RuOI5Uv5a2jML7eEHkKnMizG2feQfMFcTXKiNVOikFxyUgHK5mfr7rMJ/fM7vfB7Ft9m8pR89CMPuL7yidaN42acx8FPm7DhGqibzmXrwQJOi8Hni41VzNDloyi1FKcbblG7PEH8Rglo1bQ9y6EZFv40X8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ee79e82361so29250917b3.1;
        Fri, 22 Nov 2024 06:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732286686; x=1732891486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TK1UmkxMcUsCVip+ZuBRR4ESoNMHebvhGvPDWiAEw5s=;
        b=DBLb0NXvfpmug0F80tbcrknPo5mFm2AzWP1dSNQLW56fvMyBF91raDaohLDaE1t3Uv
         iTMWOFAZhfa0K9HhcrZqcqydKfeM4x+cO05hTI3Ppt882xQsXbPEitjOjmyKfkOdYfrm
         8iPc61F9kyZpajWzAMUVA0HevICQWX/OlzNSIUliw6+0SD1iEYDZ3XskgACXKDBz/zi0
         FhiZyYECynvVm6v0SRLejrY+RRx3Kp3SJxkPm+MNj46FxhYRX3tFqd+hJSje/IQby48Z
         GpoAPdrGaKPiFkRD2N2/S6qI35oux/vESfTuAEUJ6dTM9J7GlbAObV+P3MKTGgWnGbuy
         6k2g==
X-Forwarded-Encrypted: i=1; AJvYcCV78nrxeQbctdyg0n27edHU+SYmYcJCXU6ReWL9vy+asCZx62ZE3p1i+fwfSYpC1GMZjyehLSkor8uZvIc=@vger.kernel.org, AJvYcCVFS+471LGpSpQxWQZOIIGHWHmrk/GsgKJeUoPbXIq5e2m5uGeGeY+6rZEawZkoV+yH/GJ6DD6DI9SB@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgIth3aZo2GIpudTu+o76t/VOqg0yXb88nfSJwXMIlUVeXgBi
	9+HOCsptfhWVgIHCEORlTgjPf1T9z4EMID5sWi/6xhKHfHTcq3jpb0kJT+lu
X-Gm-Gg: ASbGncvMl4R/5hXdjkQNjpPllmn9q9eDczdMzgm0C/NlA7T/hUBTQMuxee80Hthzqgu
	1SNBK2TvqTTEjziu7ACn8qJ3sS3StW4XEbQvvdnkWhDAFN2eEkyiKZmkFeHGCkJ7X83nhFAqPEW
	KPOkaYS6uBwY4Y2fiOY1PjkN0D8T47V2tyPL/m5IKF0HZpmerll/xx9QCVFVbImHobomMLlGyz4
	Uao/C7whhBu1M9v/pzrA+Swb6ocPBuOUBleW7uAoTp8OvwSJTQ7il0V0Ij+6u98huyRNdJ36kvQ
	Ty4sOHLsZ6Rbhw36
X-Google-Smtp-Source: AGHT+IG/QvXI+i2mc0177tca0YkCjVzKWpZVU9HsIUVCzoZ/ov7CHjFoUqWOfjZsA+zcfhJrjMyKeA==
X-Received: by 2002:a05:6902:1b08:b0:e38:230d:aee0 with SMTP id 3f1490d57ef6-e38f7359a15mr2655138276.23.1732286685675;
        Fri, 22 Nov 2024 06:44:45 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f5e5b218sm634314276.0.2024.11.22.06.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 06:44:45 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eed41d2b12so15648117b3.1;
        Fri, 22 Nov 2024 06:44:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCgLPcKXdiJghJprraB3esInsjLz4kHfBpgxpucQKDJNRBWUKA6NSafiowTXJdsUcJJEu5rVUu3LHa@vger.kernel.org, AJvYcCUDMAT8TnCXz1m7sSklWseQK6dqyW1/D4s7wvxEJlpVhwnOHtFn6llyLd0KAYDUaWUq5mY+G5D/cvT2eL8=@vger.kernel.org
X-Received: by 2002:a05:690c:688c:b0:6e5:2adf:d584 with SMTP id
 00721157ae682-6eee0a554a0mr23716067b3.14.1732286684959; Fri, 22 Nov 2024
 06:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
In-Reply-To: <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 15:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
Message-ID: <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:51=E2=80=AFPM Finn Thain <fthain@linux-m68k.org>=
 wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.
>
> Changed Since v3:
>  - Re-ordered defconfig symbols.
>  - Added reviewed-by tag from arch maintainer.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
so it still can make it into v6.13-rc1 via RTC?

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

