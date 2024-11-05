Return-Path: <linux-rtc+bounces-2461-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F69BCF14
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 15:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11321C2329D
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 14:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49E1D8DE2;
	Tue,  5 Nov 2024 14:21:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34A1D6DB9;
	Tue,  5 Nov 2024 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816493; cv=none; b=O5kf6K6uLxjO/r8unn1yJbYeVYTtkgXNZ1v3+1FNSPSd0pwiC9YiTzdJtQDI/5pbzvs1SlQKve9ge0AXZ1IY17LzsHiLQxw0Z5RdFcCzzaoRXKaMS0sjcjHqbGVtFLjc1CVng/g+/JZj6HY9Omy2CZc7mKty9El9WhchGFcl0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816493; c=relaxed/simple;
	bh=HnchU3TAxMiEnb4LqA1IIZSHQ3nPshfnOq2ODMOQWR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAPAT70NZ+EnLVy5wMQCDvmQ1mDbjc8tVNe3doiQ0CdqLjNLJKmW5QJKe/q2t0TePmBMP+6C3ShHQ0hUbJWd2ZZaHhPSqBsP1cizT9An7WMp/twy0h7+i1BnxjnMOB6Jxmtxxz04mX75NC/ynJTDY0oQ9yQSoGEzGwsIsWWJqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so4342250276.2;
        Tue, 05 Nov 2024 06:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730816489; x=1731421289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQTogThULkTABxgO4qxQ15BGSdteC82xf8/FCwRDyos=;
        b=Jwy0mEKCUpjWdK9+ZI9/NqM9gOCRBRAyDTqS4A752Dasep0YBF61q1ZAXuvuFi7yDj
         WHitm/9wlqaLxGw3RiAVZS4dWbiGDVZbUrTc6xAgjrwlAff6cGOMq37gsqxSVCGmiwaj
         ZDTWMzSdvvDnmatb97SpbLppJygJ40mIzHYXSTAXpv/PYUHNh8Lamo/Wz6b+IWy1I5b/
         twafWUeqrvHaFjSkSl5Eu/IpE0k+epMGsV4LX5p0CCY1vpa97C2teqWgP28YDUVbjFI6
         KiWSpzZhwQjWsJ8s8OeJQtyLXJtfaWBHwiZuiqbL1pjj8wN2+MkDji4D5sePcSv2QPkb
         N6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXAu+evPH0LjaqDbT0/2S+QBsRJcBcwFvOy41RCTzStIJfsnXzUU5ssTG1gNJU44rHtADWa0tntFG04GXw=@vger.kernel.org, AJvYcCXuPIIJLBgtRUD8iiWzfJ3YAUaYYF/wTe7yQhGHyUgaZbQ08NC018SMp+TQi1/tBZBP0NRR8bhCW0TY@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdFquFfodAhGK6H7fMSBDa0DID4XRzz3liXe2Oaqkkx9TzdtA
	+GAYs8mIfdDOtWcypRYMse/RXNRrBKq1LB5mILpV4Lg0DnASe4CFyMR9unhb
X-Google-Smtp-Source: AGHT+IEvSPfGP+sDAxrvN2d7XxFWVf9kLZDc6tHx4FzmN81o/2xNW40FPrk/bLyYCTYTlmHqPi+cBw==
X-Received: by 2002:a05:6902:33c8:b0:e30:c614:5c40 with SMTP id 3f1490d57ef6-e330254f899mr12484735276.2.1730816489236;
        Tue, 05 Nov 2024 06:21:29 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8a95711sm2402853276.34.2024.11.05.06.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:21:28 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea50585bf2so57881097b3.3;
        Tue, 05 Nov 2024 06:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbKVYp2Gna/m1G5X1qoPX6FLxLdkC2fJUnp8wypA/GBb8/xATQI3qeKPUhnNXuW5p+qCr2Cu+DsiUH@vger.kernel.org, AJvYcCVg5rmANgaqqR9wqpow98FbUXUN4whC1aF8nL19u3lv9MEUDxiheQQVis7D207IqyW0Vj93oHJ/Gc0ng2M=@vger.kernel.org
X-Received: by 2002:a05:690c:d1c:b0:6dd:c474:9cd8 with SMTP id
 00721157ae682-6ea64af0eecmr155730677b3.18.1730816488050; Tue, 05 Nov 2024
 06:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 15:21:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8_RL9y3o24_jhPJuYb+5RP+PpBKbD7Ndn9fg7EYH_Hw@mail.gmail.com>
Message-ID: <CAMuHMdU8_RL9y3o24_jhPJuYb+5RP+PpBKbD7Ndn9fg7EYH_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:55=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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

